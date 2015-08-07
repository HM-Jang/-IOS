//
//  TabViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 31..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    @IBOutlet weak var btn_open: UIBarButtonItem!
    @IBOutlet weak var btn_home: UIButton!
    
    @IBOutlet weak var btn_open_option: UIBarButtonItem!
        @IBAction func goMainScreen(sender: AnyObject) {
        
        print("goMainScreen")
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        btn_open.target = self.revealViewController()
        btn_open.action = Selector("revealToggle:")
        
        btn_open_option.target = self.revealViewController()
        btn_open_option.action = Selector("rightRevealToggle:")
        
      
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.navigationController?.navigationBar.barTintColor = ColorFromRGB(0x0081c6)
       
        var btn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        btn.frame = CGRectMake(0, 0, 70, 50) as CGRect
        
        btn.setImage(UIImage(named: "btn_Home"), forState: .Normal)
        btn.imageView?.contentMode = .ScaleAspectFit
        
        btn.addTarget(self, action: Selector("clickBtnHome:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //imageView.addSubview(btn)
        
        //self.navigationItem.titleView = imageView
        //imageView.addSubview(btn)
        self.navigationItem.titleView = btn

        /*
        var navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = ColorFromRGB(0xffffff)
        navigationBarAppearance.barTintColor = ColorFromRGB(0x0081c6)
        */
    }
    
    
    func clickBtnHome(button:UIButton){
        //println("버튼클릭")
        
        self.selectedIndex = 0
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
