//
//  MasterViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 27..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UITextFieldDelegate {

    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()

    @IBOutlet weak var btn_search: UIButton!

    @IBOutlet weak var txt_Search: UITextField!
    
    @IBAction func clickSearch(sender: AnyObject) {
        
        
        if txt_Search.hasText(){
        
            var eventInfos = CustomDB.returnEventInfos(txt_Search.text)
            
            for event in eventInfos{
                println("\(event.name)")
            }
            
        }else{
           /*
            let eventListTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("tvc") as! TabViewController
            
            self.navigationController?.pushViewController(eventListTableVC, animated: true)
            */
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
        */
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        /*
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        }
        */
        
        //self.navigationController?.navigationBar.barTintColor = ColorFromRGB(0x008140)

        self.txt_Search.delegate = self
        
        //txt_Search.becomeFirstResponder()
        
        
       btn_search.setImage(UIImage(named: "btn_search"), forState: .Normal)
        
        view.backgroundColor = ColorFromRGB(0x004081)
        
        
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txt_Search.resignFirstResponder()
        
        return true
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

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true

            }
        }
        */
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        //let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = menuNames![indexPath.row]
        return cell
    }
    */
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    /*
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    */

}

