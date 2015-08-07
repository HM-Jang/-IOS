//
//  EventListTableViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 27..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class EventListTableViewController: UITableViewController {

    var eventInfos = [EventInfo]()
    
    var tab_age_selected:Int = 0 // 0: 전체, 1:초등이하, 2:중등, 3:고등, 4:성인, 5:기타
    var tab_category_selected:Int = 0 // 0:전체, 1:연령별, 2:행사구분별
    
    @IBOutlet weak var btn_category_all: UIButton!
    @IBOutlet weak var btn_category_age: UIButton!
    @IBOutlet weak var btn_category_event: UIButton!
    
    @IBOutlet weak var btn_all: UIButton!
    @IBOutlet weak var btn_element: UIButton!
    @IBOutlet weak var btn_middle: UIButton!
    @IBOutlet weak var btn_high: UIButton!
    @IBOutlet weak var btn_adult: UIButton!
    @IBOutlet weak var btn_etc: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        eventInfos = CustomDB.returnEventInfos(category_age_id: nil, category_event_id: nil, offset: 0)
        
        /*
        for a:EventInfo in eventInfos{
            println("eventInfos : \(a.sdate)")
        }
        */
        

        //let image = UIImage(named: "btn_home2.png")
        //self.navigationItem.titleView = UIImageView(image: image)
       // self.navigationController?.navigationBar.topItem!.titleView = UIImageView(image: image)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject?) {
        if(segue.identifier == "els"){
            
            let vc = segue.destinationViewController as! EventInfoViewController
            
            
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                
                
                vc.event = eventInfos[indexPath.row]
                
                println("eventListSegue -> eventInfos[indexPath.row] : \(eventInfos[indexPath.row].name)")
                
            }
        }
    }
    
    
    
    /*
    prepareForSegue 실행 뒤 실행됨. 따라서 selectedRow = nil
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedRow = indexPath.row
        
        println("selectedRow : \(selectedRow!)")
        
    }
    */
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("EventListCell", forIndexPath: indexPath) as! EventListTableViewCell
        
        // Configure the cell...
        /*
        cell.iv_event_line.image = UIImage(named: lines[indexPath.row])
        cell.iv_event_image.image = UIImage(named: images[indexPath.row])
        cell.lb_event_name.text = names[indexPath.row]
        cell.lb_event_date.text = dates[indexPath.row]
        cell.lb_event_place.text = places[indexPath.row]
        
        */
        //cell.btn_event_detail.setImage(UIImage(named: "tab_age_arrow"), forState: .Normal)
        
        
        
        cell.iv_event_line.image = returnLineImage(category_age_id: eventInfos[indexPath.row].category_age_id)
        cell.iv_event_image.image = UIImage(named: "event1.png")
        
        cell.lb_event_name.text = eventInfos[indexPath.row].name
        
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
        
        cell.lb_event_date.text = date
        cell.lb_event_place.text = eventInfos[indexPath.row].place
        
        
        
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

    
    
    /* Button 관련 */
    
    @IBAction func clickAll(sender: AnyObject) {
        btn_all.backgroundColor = ColorFromRGB(0xf6f6f6)
        returnBtnColor(tab_age_selected)
        tab_age_selected = 0
        
        eventInfos.removeAll()
        
        eventInfos = CustomDB.returnEventInfos(category_age_id: nil, category_event_id: nil, offset: 0)
        
        self.tableView.reloadData()
    }
    
    @IBAction func clickElement(sender: AnyObject) {
        btn_element.backgroundColor = ColorFromRGB(0xf6f6f6)
        returnBtnColor(tab_age_selected)
        tab_age_selected = 1
        
        eventInfos = CustomDB.returnEventInfos(category_age_id: tab_age_selected, category_event_id: nil, offset: 1)
        
        /*
        for event:EventInfo in eventInfos{
            println(event.name)
        }
        */
        
        self.tableView.reloadData()
    }
    
    @IBAction func clickMiddle(sender: AnyObject) {
        btn_middle.backgroundColor = ColorFromRGB(0xf6f6f6)
        returnBtnColor(tab_age_selected)
        tab_age_selected = 2
        
        eventInfos = CustomDB.returnEventInfos(category_age_id: tab_age_selected, category_event_id: nil, offset: 1)
        

        
        self.tableView.reloadData()
    }
    
    @IBAction func clickHigh(sender: AnyObject) {
        btn_high.backgroundColor = ColorFromRGB(0xf6f6f6)
        returnBtnColor(tab_age_selected)
        tab_age_selected = 3
        
        eventInfos = CustomDB.returnEventInfos(category_age_id: tab_age_selected, category_event_id: nil, offset: 1)
        
   
        
        self.tableView.reloadData()
    }
    
    @IBAction func clickAdult(sender: AnyObject) {
        btn_adult.backgroundColor = ColorFromRGB(0xf6f6f6)
        returnBtnColor(tab_age_selected)
        tab_age_selected = 4
        
        eventInfos = CustomDB.returnEventInfos(category_age_id: tab_age_selected, category_event_id: nil, offset: 1)
        

        self.tableView.reloadData()
    }
    
    @IBAction func clickEtc(sender: AnyObject) {
        btn_etc.backgroundColor = ColorFromRGB(0xf6f6f6)
        returnBtnColor(tab_age_selected)
        tab_age_selected = 5
        
        eventInfos = CustomDB.returnEventInfos(category_age_id: tab_age_selected, category_event_id: nil, offset: 1)
        

        self.tableView.reloadData()
    }
    
    
    @IBAction func clickCategoryAll(sender: AnyObject) {
        btn_category_all.backgroundColor = ColorFromRGB(0x454957)
        returnCategoryBtnColor(tab_category_selected)
        tab_category_selected = 0
    }
    
    
    @IBAction func clickCategoryAge(sender: AnyObject) {
        btn_category_age.backgroundColor = ColorFromRGB(0x454957)
        returnCategoryBtnColor(tab_category_selected)
        tab_category_selected = 1
    }
    
    
    @IBAction func clickCategoryEvent(sender: AnyObject) {
        btn_category_event.backgroundColor = ColorFromRGB(0x454957)
        returnCategoryBtnColor(tab_category_selected)
        tab_category_selected = 2
        
        
        
        
    }
    
    func returnCategoryBtnColor(selected: Int){
        switch(selected){
            
        case 0:
            btn_category_all.backgroundColor = ColorFromRGB(0x373B47)
        case 1:
            btn_category_age.backgroundColor = ColorFromRGB(0x373B47)
        case 2:
            btn_category_event.backgroundColor = ColorFromRGB(0x373B47)
        default:
            println("parameter value arrange is 0~2")
        }
    }


    
    func returnBtnColor(selected: Int){
        switch(selected){
            
        case 0:
          btn_all.backgroundColor = ColorFromRGB(0xffffff)
        case 1:
            btn_element.backgroundColor = ColorFromRGB(0xffffff)
        case 2:
            btn_middle.backgroundColor = ColorFromRGB(0xffffff)
        case 3:
            btn_high.backgroundColor = ColorFromRGB(0xffffff)
        case 4:
            btn_adult.backgroundColor = ColorFromRGB(0xffffff)
        case 5:
            btn_etc.backgroundColor = ColorFromRGB(0xffffff)
        default:
            println("parameter value arrange is 0~5")
        }
    }
    
    func ColorFromRGB(rgbValue: UInt) -> UIColor{
        return UIColor(
            red: CGFloat((rgbValue & 0xff0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00ff00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000ff) / 255.0,
            alpha: CGFloat(1.0)
        )
        
    }
    
}
