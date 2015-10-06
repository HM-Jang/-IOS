//
//  CategoryVC3.swift
//  Science Talk Talk
//
//  Created by 펫박스 이현석 on 2015. 9. 8..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class CategoryVC3: UIViewController {

    @IBOutlet weak var scView: UIScrollView!
    
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnEtc: UIButton!
    
    /*
    @IBOutlet weak var scView: UIScrollView!
    
    @IBOutlet weak var btnEtc: UIButton!
    @IBOutlet weak var btnAll: UIButton!
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scView.contentSize.height = 400
        scView.scrollEnabled = true
    
        
        
        println("scView : \(scView.contentSize.height)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /* 버튼 이벤트  델리게이트 연결*/
    @IBAction func clickCategoryAll(sender: AnyObject) {
        
    }
    
    @IBAction func clickCategoryEtc(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.eventMergeVC?.menuChange(1, selected: 6)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    /*
    @IBAction func clickBaby(sender: AnyObject) {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    if appDelegate.eventMergeVC == nil{
    println("eventMergeVC nil")
    }
    
    
    appDelegate.eventMergeVC?.menuChange(1, selected: 1)
    self.tabBarController?.selectedIndex = 0
    }
    */

    
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
