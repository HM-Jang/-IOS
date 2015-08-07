//
//  FavoritesTableViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 27..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var lines = [String]()
    var images = [String]()
    var names = [String]()
    var dates = [String]()
    var places = [String]()
    
    var eventInfos = [EventInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        
        if !eventInfos.isEmpty{
            eventInfos.removeAll()
        }
        
        eventInfos = CustomDB.returnEventInfosFromFavorites()
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return eventInfos.count
    
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoritesListCell", forIndexPath: indexPath) as! FavoritesTableViewCell

        // Configure the cell...

        
        cell.iv_favorites_line.image = returnLineImage(category_age_id: eventInfos[indexPath.row].category_age_id)
        cell.iv_favorites_image.image = UIImage(named: "event2.png")
        
        let format = NSDateFormatter()
        format.timeZone = NSTimeZone()
        format.dateFormat = "yy.MM.dd"
        
        let date1 = format.stringFromDate(eventInfos[indexPath.row].sdate)
        let date2 = format.stringFromDate(eventInfos[indexPath.row].edate)
        
        var date:String = ""
        
        if(date1 == date2){
            date = "\(date1)"
            
        }else if date1 != date2{
            date = "\(date1) ~ \(date2)"
        }

        

        cell.lb_favorites_name.text = eventInfos[indexPath.row].name
        cell.lb_favorites_date.text = date
        cell.lb_favorites_place.text = eventInfos[indexPath.row].place
        
        //cell.btn_favorites_detail.setImage(UIImage(named: "tab_age_arrow"), forState: .Normal)
  
        return cell
    }
    
    func returnLineImage(#category_age_id:Int) -> UIImage{
        
        var imageName:String = ""
        
        switch(category_age_id){
        case 1:
            imageName = "tab_age_line_element"
        case 2:
            imageName = "tab_age_line_middle"
        case 3:
            imageName = "tab_age_line_high"
        case 4:
            imageName = "tab_age_line_adult"
        case 5:
            imageName = "tab_age_line_etc"
        default:
            println("범위는 1~5")
        }
        
        var image = UIImage(named: imageName)
        
        return image!
    }

    
}
