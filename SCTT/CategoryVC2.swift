//
//  CategoryVC2.swift
//  Science Talk Talk
//
//  Created by 펫박스 이현석 on 2015. 9. 8..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class CategoryVC2: UIViewController {

    @IBOutlet weak var scView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnEtc: UIButton!
    @IBOutlet weak var btnAll: UIButton!
    /*
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewMid1: UIView!
    @IBOutlet weak var viewMid2: UIView!
    
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnEtc: UIButton!
    */

    @IBOutlet weak var btnElement: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        scView.contentSize.height = 400
        
        btnElement.userInteractionEnabled = true
        
      /*
        scView.delegate = self
        scView.bouncesZoom = true
        scView.contentMode = UIViewContentMode.ScaleAspectFill
    */
        
        scView.userInteractionEnabled = true
        scView.exclusiveTouch = true
   
        //scView.delaysContentTouches = false
        //scView.canCancelContentTouches = false
        
        //contentView.userInteractionEnabled = true
        
    
        // Do any additional setup after loading the view.
    }
    
    /*
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return scView.viewWithTag(1000)
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView!) {
        
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    */
    

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
