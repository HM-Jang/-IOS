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


var nb : NMapView