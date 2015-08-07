//
//  EventInfo.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 8. 5..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import Foundation

class EventInfo{
    
    var id:Int
    var name:String
    var sdate:NSDate
    var edate:NSDate
    var phone:String
    var homepage:String
    var place:String
    var address1:String
    var address2:String
    var content:String
    var content_detail:String
    var thumb:String
    var thumb_detail:String
    var thumb_map:String
    var category_age_id:Int
    var category_event_id:Int
    

    init(id:Int, name:String, sdate:NSDate, edate:NSDate, phone:String, homepage:String, place:String, address1:String, address2:String, content:String, content_detail:String, thumb:String, thumb_detail:String, thumb_map:String, category_age_id:Int, category_event_id:Int){
        
        
        self.id = id
        self.name = name
        self.sdate = sdate
        self.edate = edate
        self.phone = phone
        self.homepage = homepage
        self.place = place
        self.address1 = address1
        self.address2 = address2
        self.content = content
        self.content_detail = content_detail
        self.thumb = thumb
        self.thumb_detail = thumb_detail
        self.thumb_map = thumb_map
        self.category_age_id = category_age_id
        self.category_event_id = category_event_id
        
        
    }
    
    func toJSON() -> String {
        return ""
    }
 
}