//
//  PostService.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 8. 4..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import Foundation

class PostService{
    
    
    var settings:Settings!
    
    init(){
        self.settings = Settings()
    }
    
    func getPosts(callback:(NSDictionary) -> ()){
        request(settings.viewPosts, callback: callback)
    }
    
    func request(url:String, callback:(NSDictionary) -> ()){
        
        var nsURL = NSURL(string: url)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL!){
            (data, response, error) in
            var error:NSError?
            
           /// print("data : \(data)")
            
            
            
            var response = NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
            
            callback(response)
        }
        task.resume()

   
    }
    
}