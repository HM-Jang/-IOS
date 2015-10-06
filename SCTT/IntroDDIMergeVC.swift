//
//  IntroDDIMergeVC.swift
//  Science Talk Talk
//
//  Created by 펫박스 이현석 on 2015. 9. 8..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class IntroDDIMergeVC: UIViewController {

    @IBOutlet weak var container1: UIView!  //특구개요
    @IBOutlet weak var container2: UIView!  //특구지정현황
    
    @IBOutlet weak var btnIntro1: UIButton!
    @IBOutlet weak var btnIntro2: UIButton!
    
    @IBAction func clickIntro1(sender: AnyObject) {
        
        btnIntro1.setBackgroundImage(UIImage(named: "btn_border_blue"), forState: .Normal)
        btnIntro2.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        
        
        container1.hidden = false
        container2.hidden = true
        
    }
    
    @IBAction func clickIntro2(sender: AnyObject) {
        
        btnIntro1.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnIntro2.setBackgroundImage(UIImage(named: "btn_border_blue"), forState: .Normal)
        
        
        container1.hidden = true
        container2.hidden = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        container1.hidden = false
        container2.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "embeddedIntro1"{
            
            
            
            
        }else if segue.identifier == "embeddedIntro2"{
            
            
        }
        
        
    }

}
