//: Playground - noun: a place where people can play

import Cocoa

let format = NSDateFormatter()
format.timeZone = NSTimeZone()
format.dateFormat = "yyyy-MM-dd"

let d = format.dateFromString("2015-08-15")

let test = format.dateFromString("2015-08-15")

 format.stringFromDate(test!)


var sdate = format.dateFromString("2015-08-01")

let ssdate = format.stringFromDate(sdate!)

var strArray = ssdate.componentsSeparatedByString("-")


var testStr = "1234-12-12 12:12:12".componentsSeparatedByString(" ")

var filter = "1/2/3/4/5/6"

var arrFilter = filter.componentsSeparatedByString("/")


let day = (strArray[2]).toInt()


var str:String = "http://www.naver.com"

var subStr:String = ""

if str.lowercaseString.hasPrefix("http://"){
    
        println("yes")
    
    let index:String.Index = advance(str.startIndex, 7)
    
    subStr = str.substringFromIndex(index)
    
    
}else{
    println("no")
}

var todayDate = NSDate()


let date =  format.dateFromString("2015-08-14")

date?.isEqualToDate(todayDate)


let diff:NSTimeInterval = date!.timeIntervalSinceNow



func > (left: NSDate, right:NSDate) -> Bool{
    return left.compare(right) == NSComparisonResult.OrderedDescending
}

if todayDate > date!{
    println("date는 지난 날짜")
}else{
    println("아직 안지남")
}



var dateArr = ssdate.componentsSeparatedByString("-")
dateArr[0]

