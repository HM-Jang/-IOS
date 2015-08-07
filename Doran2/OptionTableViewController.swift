//
//  OptionTableViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 8. 2..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class OptionTableViewController: UITableViewController {

    @IBOutlet weak var btn_search: UIButton!
    
    @IBOutlet weak var switch_listtype: UISwitch!
    @IBOutlet weak var switch_timelinetype: UISwitch!
    
    
    @IBAction func listTypeTapped(sender: AnyObject) {
        if switch_listtype.on{
            switch_timelinetype.setOn(false, animated: true)
            
           
        }else{
            switch_timelinetype.setOn(true, animated: true)
            
        }

    }
  
    @IBAction func timelineTypeTapped(sender: AnyObject) {
        if switch_timelinetype.on{
            switch_listtype.setOn(false, animated: true)
            
        }else{
            switch_listtype.setOn(true, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        btn_search.setImage(UIImage(named: "btn_search"), forState: .Normal)
        
        view.backgroundColor = ColorFromRGB(0x004081)
        
        switch_timelinetype.onImage = UIImage(named: "btn_lightgray_on")
        switch_timelinetype.offImage = UIImage(named: "btn_lightgray_off")
        
        switch_listtype.onImage = UIImage(named: "btn_lightgray_on")
        switch_listtype.offImage = UIImage(named: "btn_lightgray_off")
        
        
        
    }

    
    func ColorFromRGB(rgbValue: UInt) -> UIColor{
        return UIColor(
            red: CGFloat((rgbValue & 0xff0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00ff00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000ff) / 255.0,
            alpha: CGFloat(1.0)
        )
        
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
        return 6
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
