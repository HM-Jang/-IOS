//
//  CustomDB.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 8. 5..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import Foundation

class CustomDB{
    
    static func initDB(){

        let db:FMDatabase? = getDB()!
        
        if db == nil{
            println("DB존재 x")
        }else{
            println("DB존재 o")
            
            if db!.open(){
                println("initDB -> DB.opened")
                
                var sql_stmt:String = "CREATE TABLE IF NOT EXISTS ddi_event (id INTEGER PRIMARY KEY, name TEXT, sdate DATE, edate DATE, phone TEXT, homepage TEXT, place TEXT, address1 TEXT, address2 TEXT, content TEXT, content_detail TEXT, thumb TEXT, thumb_detail TEXT, thumb_map TEXT, category_age_id INTEGER, category_event_id INTEGER)"
                
                if !db!.executeStatements(sql_stmt){
                    println("\'ddi_event table create\' Failed ")
                }else{
                    println("\'ddi_event table\'create code Executed")
                    sql_stmt = "DELETE FROM ddi_event"
                    
                    if !db!.executeStatements(sql_stmt){
                        println("삭제실패")
                        
                    }else{
                        println("삭제성공")
                        
                        //receiveJSONData("http://ddi2.plani.co.kr/event/event/jsonlist/")
                    }
                }
                
                sql_stmt = "CREATE TABLE IF NOT EXISTS favorites (id INTEGER PRIMARY KEY)"
                
                if !db!.executeStatements(sql_stmt){
                    println("\'favorites table create\' Failed ")
                }else{
                    println("\'favorites table\'create code Excuted")
                }
            }
        }
        
       let isClose =  db!.close()
        
        if isClose{
            println("initDB -> DB.close")
        }else{
            println("initDB -> DB close not Yet")
        }
        
    }
    
    
    static func getDB() -> FMDatabase?{
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as! String
        let dbFilePath = docsDir.stringByAppendingPathComponent("doran.sqlite")
        let db = FMDatabase(path: dbFilePath)
        
        return db
    }
    
    
    static func JSONParseArray(data: NSData) -> [AnyObject] {
        
        if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
            
            return array
        }
        
        return [AnyObject]()
    }
    
    
    static func receiveJSONData(url: String){
        
        let db:FMDatabase? = getDB()!
        
        let isOpen = db!.open()
        
        if isOpen{
            println("receiveJSONData -> DB.open")
        }else{
            println("receiveJSONData -> DB.open not Yet")
        }
        
        
        var request: NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            var error: NSError?
            
            var str:NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
            
            
            var convertedString = str.mutableCopy() as! NSMutableString
            
            let transform = "Any-Hex/Java"
            
            CFStringTransform(convertedString, nil, transform as NSString, 1)
            
            //println("\(convertedString)")
            
            var convertedData: NSData = convertedString.dataUsingEncoding(NSUTF8StringEncoding)!
            
            
            for post: AnyObject in self.JSONParseArray(convertedData){
                
                var id = (post["id"]! as! String).toInt()!
                var name = post["name"]! as! String
                var sdate = post["sdate"]! as! String
                var edate = post["edate"]! as! String
                var phone = post["phone"]! as! String
                var homepage = post["homepage"]! as! String
                var place = post["place"]! as! String
                var address1 = post["address1"]! as! String
                var address2 = post["address2"]! as! String
                var content = post["content"]! as! String
                var content_detail = post["content_detail"]! as! String
                var thumb = post["thumb"]! as! String
                var thumb_detail = post["thumb_detail"]! as! String
                var thumb_map = post["thumb_map"]! as! String
                var category_age_id = (post["category_age_id"]! as! String).toInt()!
                var category_event_id = (post["category_event_id"]! as! String).toInt()!
                
                //var query:NSString = "INSERT INTO ddi_event values(\'\(id)\',)"'
                
                //println("id: \(id), name: \(name), sdate: \(sdate), edate: \(edate), place: \(place)")
                
                /*
                let isOpend = db!.open()
                println("receiveJSONData -> Middle DB Check : \(isOpend)")
                */
                
                let isInsert = db!.executeUpdate("INSERT INTO ddi_event values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", withArgumentsInArray: [id, name, sdate, edate, phone, homepage, place, address1, address2, content, content_detail, thumb, thumb_detail, thumb_map, category_age_id, category_event_id])
                
                if !isInsert{
                    println("Insert Failed!")
                }
            }
            
            let isClosed = db!.close()
            
            if isClosed{
                println("receiveJSONData -> DB.closed")
            }else{
                println("receiveJSONData -> DB.close not yet")
            }
            
          //  self.showTable("ddi_event")
            
        }
        
    }
    
   static func showTable(tableName: String){
        
        let db:FMDatabase? = getDB()!
        db!.open()
        
        var query:String = "SELECT * FROM \(tableName)"
        
        let results:FMResultSet! = db!.executeQuery(query, withArgumentsInArray: nil)
        
        // println("Result.count : \(results.)"
    
        var count:Int = 0
    
        while results.next(){
            
            count++
            
            println("--------- [\(count)]    ---------")
            for i in 0...(results.columnCount()-1){
                println("\(results.columnNameForIndex(i)) : \(results.stringForColumnIndex(i))")
            }
            println("-----------------------------")
            println("")
            
        }

    
    
        db!.close()
    }
    
    static func returnEventInfos(inputText: String) -> [EventInfo]{
        
        var EventInfos = [EventInfo]()
        
        let db:FMDatabase? = getDB()!
        db!.open()
        
        var query:String = "SELECT * FROM ddi_event WHERE name LIKE \'%\(inputText)%\'"
        
        let results:FMResultSet! = db!.executeQuery(query, withArgumentsInArray: nil)
        
        while results.next(){
            
            var id = Int(results.intForColumnIndex(0))
            var name = results.stringForColumnIndex(1)
            
            let format = NSDateFormatter()
            format.timeZone = NSTimeZone()
            format.dateFormat = "yyyy-MM-dd"
            
            var sdate = format.dateFromString(results.stringForColumnIndex(2))!
            
            
            // d!로 찍을 시 day-1, 15:00 이 나옴. 버그인듯. ex) "2015-08-15" -> 2015-08-14 15:00:00 String - Formatting > NSData .. NSData를 문자열로 사용할때 반드시 formatting
            
            /*
            let test = format.stringFromDate(d!)
            
            println("sdate.string : \(results.stringForColumnIndex(2)), test : \(test)")
            */
            
            var edate = format.dateFromString(results.stringForColumnIndex(3))!
            
            var phone = results.stringForColumnIndex(4)
            var homepage = results.stringForColumnIndex(5)
            var place = results.stringForColumnIndex(6)
            var address1 = results.stringForColumnIndex(7)
            var address2 = results.stringForColumnIndex(8)
            var content = results.stringForColumnIndex(9)
            var content_detail = results.stringForColumnIndex(10)
            var thumb = results.stringForColumnIndex(11)
            var thumb_detail = results.stringForColumnIndex(12)
            var thumb_map = results.stringForColumnIndex(13)
            
            var category_age_id = Int(results.intForColumnIndex(14))
            var category_event_id = Int(results.intForColumnIndex(15))
            
            var eventInfo = EventInfo(id: id, name: name, sdate: sdate, edate: edate, phone: phone, homepage: homepage, place: place, address1: address1, address2: address2, content: content, content_detail: content_detail, thumb: thumb, thumb_detail: thumb_detail, thumb_map: thumb_map, category_age_id: category_age_id, category_event_id: category_event_id)
            
            
            //println("results -> \(id)")
            
            EventInfos.append(eventInfo)
            
        }
 
        db!.close()
        return EventInfos
    }
    
    static func returnEventInfos(#category_age_id:Int?, #category_event_id:Int?, #offset:Int) -> [EventInfo]{
        
        var EventInfos = [EventInfo]()
        
        let db:FMDatabase? = getDB()!
        db!.open()
        
        var query:String = "SELECT * FROM ddi_event "
        
        switch(offset){
        case 0:
            query += ""
        case 1:
            query += "where category_age_id=\'\(category_age_id!)\'"
        case 2:
            query += "where category_event_id=\'\(category_event_id!)\'"
        case 3:
            query += "where category_age_id=\'\(category_age_id!)\' AND category_event_id=\'\(category_event_id)\'"
        default:
            println("returnEventInfos -> Offset is Error")
        }
        
        let results:FMResultSet! = db!.executeQuery(query, withArgumentsInArray: nil)
        
        while results.next(){
            
            var id = Int(results.intForColumnIndex(0))
            var name = results.stringForColumnIndex(1)

            let format = NSDateFormatter()
            format.timeZone = NSTimeZone()
            format.dateFormat = "yyyy-MM-dd"
            
            var sdate = format.dateFromString(results.stringForColumnIndex(2))!
            
            
            // d!로 찍을 시 day-1, 15:00 이 나옴. 버그인듯. ex) "2015-08-15" -> 2015-08-14 15:00:00 String - Formatting > NSData .. NSData를 문자열로 사용할때 반드시 formatting
            
            /*
            let test = format.stringFromDate(d!)
            
            println("sdate.string : \(results.stringForColumnIndex(2)), test : \(test)")
            */
            
            var edate = format.dateFromString(results.stringForColumnIndex(3))!
    
            var phone = results.stringForColumnIndex(4)
            var homepage = results.stringForColumnIndex(5)
            var place = results.stringForColumnIndex(6)
            var address1 = results.stringForColumnIndex(7)
            var address2 = results.stringForColumnIndex(8)
            var content = results.stringForColumnIndex(9)
            var content_detail = results.stringForColumnIndex(10)
            var thumb = results.stringForColumnIndex(11)
            var thumb_detail = results.stringForColumnIndex(12)
            var thumb_map = results.stringForColumnIndex(13)
            
            var category_age_id = Int(results.intForColumnIndex(14))
            var category_event_id = Int(results.intForColumnIndex(15))
            
            var eventInfo = EventInfo(id: id, name: name, sdate: sdate, edate: edate, phone: phone, homepage: homepage, place: place, address1: address1, address2: address2, content: content, content_detail: content_detail, thumb: thumb, thumb_detail: thumb_detail, thumb_map: thumb_map, category_age_id: category_age_id, category_event_id: category_event_id)
            
            
            //println("results -> \(id)")
            
            EventInfos.append(eventInfo)
            
        }
        db!.close()
        
        return EventInfos
    }
    
    static func returnEventInfos(#date1:String, #date2:String) -> [EventInfo]{
        
        
        var EventInfos = [EventInfo]()
        
        let db:FMDatabase? = getDB()!
        db!.open()
        
        var query:String = "SELECT * FROM ddi_event WHERE sdate BETWEEN \'\(date1)\' AND  \'\(date2)\'"
        
        
        //println("returnEventInofs -> query: \(query)")
        
        let results:FMResultSet! = db!.executeQuery(query, withArgumentsInArray: nil)
        
        while results.next(){
            
            var id = Int(results.intForColumnIndex(0))
            var name = results.stringForColumnIndex(1)
            
            let format = NSDateFormatter()
            format.timeZone = NSTimeZone()
            format.dateFormat = "yyyy-MM-dd"
            
            var sdate = format.dateFromString(results.stringForColumnIndex(2))!
            
            
            // d!로 찍을 시 day-1, 15:00 이 나옴. 버그인듯. ex) "2015-08-15" -> 2015-08-14 15:00:00 String - Formatting > NSData .. NSData를 문자열로 사용할때 반드시 formatting
            
            /*
            let test = format.stringFromDate(d!)
            
            println("sdate.string : \(results.stringForColumnIndex(2)), test : \(test)")
            */
            
            var edate = format.dateFromString(results.stringForColumnIndex(3))!
            
            var phone = results.stringForColumnIndex(4)
            var homepage = results.stringForColumnIndex(5)
            var place = results.stringForColumnIndex(6)
            var address1 = results.stringForColumnIndex(7)
            var address2 = results.stringForColumnIndex(8)
            var content = results.stringForColumnIndex(9)
            var content_detail = results.stringForColumnIndex(10)
            var thumb = results.stringForColumnIndex(11)
            var thumb_detail = results.stringForColumnIndex(12)
            var thumb_map = results.stringForColumnIndex(13)
            
            var category_age_id = Int(results.intForColumnIndex(14))
            var category_event_id = Int(results.intForColumnIndex(15))
            
            var eventInfo = EventInfo(id: id, name: name, sdate: sdate, edate: edate, phone: phone, homepage: homepage, place: place, address1: address1, address2: address2, content: content, content_detail: content_detail, thumb: thumb, thumb_detail: thumb_detail, thumb_map: thumb_map, category_age_id: category_age_id, category_event_id: category_event_id)
            
            
            //println("results -> \(id)")
            
            EventInfos.append(eventInfo)
            
        }
        db!.close()
        
        return EventInfos
    }
    
    static func insertToFavorites(id:Int) -> Bool{
        
        let db:FMDatabase? = getDB()!
        db!.open()
        
        let isInsert = db!.executeUpdate("INSERT INTO favorites VALUES(?)", withArgumentsInArray: [id])
        
        if !isInsert{
            println("Insert Failed!")
        }

        db!.close()
        
        return isInsert
    }
    
    static func existIdFromFavorites(id:Int) -> Bool{
        
        let db:FMDatabase? = getDB()!
        db!.open()
        
        var query:String = "SELECT COUNT(*) FROM favorites WHERE id=\'\(id)\'"
        
        
        //println("returnEventInofs -> query: \(query)")
        
        let results:FMResultSet! = db!.executeQuery(query, withArgumentsInArray: nil)
        
        var count:Int = 0
        
        while results.next(){
            count = Int(results.intForColumnIndex(0))
        }
        
        db!.close()
        
        if count == 0{
            return false
        }else{
            return true
        }
    }
    
    static func returnEventInfosFromFavorites() -> [EventInfo]{
        
        var EventInfos = [EventInfo]()
        
        let db:FMDatabase? = getDB()!
        db!.open()
        
        var subQuery:String = "SELECT id FROM favorites"
        var query:String = "SELECT * FROM ddi_event where id in (\(subQuery))"
        
        let results:FMResultSet! = db!.executeQuery(query, withArgumentsInArray: nil)
        
        while results.next(){
            
            var id = Int(results.intForColumnIndex(0))
            var name = results.stringForColumnIndex(1)
            
            let format = NSDateFormatter()
            format.timeZone = NSTimeZone()
            format.dateFormat = "yyyy-MM-dd"
            
            var sdate = format.dateFromString(results.stringForColumnIndex(2))!
            var edate = format.dateFromString(results.stringForColumnIndex(3))!
            
            var phone = results.stringForColumnIndex(4)
            var homepage = results.stringForColumnIndex(5)
            var place = results.stringForColumnIndex(6)
            var address1 = results.stringForColumnIndex(7)
            var address2 = results.stringForColumnIndex(8)
            var content = results.stringForColumnIndex(9)
            var content_detail = results.stringForColumnIndex(10)
            var thumb = results.stringForColumnIndex(11)
            var thumb_detail = results.stringForColumnIndex(12)
            var thumb_map = results.stringForColumnIndex(13)
            
            var category_age_id = Int(results.intForColumnIndex(14))
            var category_event_id = Int(results.intForColumnIndex(15))
            
            var eventInfo = EventInfo(id: id, name: name, sdate: sdate, edate: edate, phone: phone, homepage: homepage, place: place, address1: address1, address2: address2, content: content, content_detail: content_detail, thumb: thumb, thumb_detail: thumb_detail, thumb_map: thumb_map, category_age_id: category_age_id, category_event_id: category_event_id)
            
            //println("CustomDB -> returnEventInfosFromFavorites -> results -> \(id)")
            
            EventInfos.append(eventInfo)
            
        }
   
        db!.close()
        return EventInfos
    }
    
    static func deleteFromFavorites(id:Int) -> Bool{
        
        let db:FMDatabase? = getDB()
        db!.open()
        
        
        var query:String = "DELETE FROM favorites WHERE id=?"
        
        let result = db!.executeUpdate(query, withArgumentsInArray: [id])
        
        db!.close()
        
        return result
    }
    
}