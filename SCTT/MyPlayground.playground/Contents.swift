//: Playground - noun: a place where people can play

import UIKit

var urlParameter = "2014-10-02 12:00:00";

var convertedURL:String = urlParameter.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
