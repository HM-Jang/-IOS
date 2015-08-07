//
//  Reachability.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 8. 4..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import Foundation

class Reachability{
     
    class func isConnectedToNetWork() -> Bool{
    
        var Status:Bool = false
        let url = NSURL(string: "http://google.com/")
        let request = NSMutableURLRequest(URL: url!)
    
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response: NSURLResponse?
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil)! as NSData
        
        if let httpResponse = response as? NSHTTPURLResponse{
            if httpResponse.statusCode == 200{
                Status = true
            }
        }
        return Status
    }
}