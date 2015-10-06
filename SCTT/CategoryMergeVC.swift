//
//  CategoryMergeVC.swift
//  Science Talk Talk
//
//  Created by 펫박스 이현석 on 2015. 9. 10..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class CategoryMergeVC: UIViewController {

    
    @IBOutlet weak var btnEtc: UIButton!
    @IBOutlet weak var btnAll: UIButton!
    
    /* 버튼 이벤트  델리게이트 연결*/
    @IBAction func clickCategoryAll(sender: AnyObject) {
        
    }
    
    @IBAction func clickCategoryEtc(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.eventMergeVC?.menuChange(1, selected: 6)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
