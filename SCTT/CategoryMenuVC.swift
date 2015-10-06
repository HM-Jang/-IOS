//
//  CategoryMenuVC.swift
//  Science Talk Talk
//
//  Created by 펫박스 이현석 on 2015. 9. 10..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class CategoryMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickElement(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(1, selected: 2)
        self.tabBarController?.selectedIndex = 0
    }
    
    
    @IBAction func clickMiddle(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(1, selected: 3)
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func clickHigh(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(1, selected: 4)
        self.tabBarController?.selectedIndex = 0
    }
    
    
    @IBAction func clickAdult(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(1, selected: 5)
        self.tabBarController?.selectedIndex = 0
    }
    
    
    @IBAction func clickAllAge(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(1, selected: 0)
        self.tabBarController?.selectedIndex = 0
    }
    
    
    
    @IBAction func clickExp(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(2, selected: 1)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func clickTeach(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(2, selected: 2)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func clickTour(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(2, selected: 3)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func clickAct(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(2, selected: 4)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    
    @IBAction func clickCamp(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(2, selected: 5)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    
    @IBAction func clickAllEvent(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.eventMergeVC?.menuChange(2, selected: 0)
        self.tabBarController?.selectedIndex = 0
    }

    
    
  
}
