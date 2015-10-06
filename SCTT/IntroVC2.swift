//
//  IntroVC2.swift
//  Science Talk Talk
//
//  Created by 펫박스 이현석 on 2015. 9. 8..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class IntroVC2: UIViewController {

    
    @IBOutlet weak var btnDDI: UIButton!
    @IBOutlet weak var btnGJI: UIButton!
    @IBOutlet weak var btnDGI: UIButton!
    @IBOutlet weak var btnBSI: UIButton!
    
    @IBOutlet weak var scView: UIScrollView!
    
    var imageView:UIImageView?
    
    @IBAction func clickDDI(sender: AnyObject) {
       
        initSCView()
        
        btnDDI.setBackgroundImage(UIImage(named: "btn_border_blue"), forState: .Normal)
        btnGJI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnDGI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnBSI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        
        
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var img = UIImage(named: "ddi_intro")
        
        var oldWidth = img!.size.width
        var scaleFactor = screenWidth / oldWidth
        
        var newHeight = img!.size.height * scaleFactor
        var newWidth = oldWidth * scaleFactor;
        
        println("newWidth : \(newWidth) , newHeight : \(newHeight)")
        
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, newWidth, newHeight) )
        //imageView.center = imageView.superview!.center
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = img
        
        scView.contentSize.height = newHeight
        scView.addSubview(imageView)
        
    }
    
    @IBAction func clickGJI(sender: AnyObject) {
        initSCView()
        
        btnDDI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnGJI.setBackgroundImage(UIImage(named: "btn_border_blue"), forState: .Normal)
        btnDGI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnBSI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        
        
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var img = UIImage(named: "gji_intro")
        
        var oldWidth = img!.size.width
        var scaleFactor = screenWidth / oldWidth
        
        var newHeight = img!.size.height * scaleFactor
        var newWidth = oldWidth * scaleFactor;
        
        println("newWidth : \(newWidth) , newHeight : \(newHeight)")
        
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, newWidth, newHeight) )
        //imageView.center = imageView.superview!.center
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = img
        
        scView.contentSize.height = newHeight
        scView.addSubview(imageView)
        
    }
    
    @IBAction func clickDGI(sender: AnyObject) {
        initSCView()
        
        btnDDI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnGJI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnDGI.setBackgroundImage(UIImage(named: "btn_border_blue"), forState: .Normal)
        btnBSI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        
        
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var img = UIImage(named: "dgi_intro")
        
        var oldWidth = img!.size.width
        var scaleFactor = screenWidth / oldWidth
        
        var newHeight = img!.size.height * scaleFactor
        var newWidth = oldWidth * scaleFactor;
        
        println("newWidth : \(newWidth) , newHeight : \(newHeight)")
        
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, newWidth, newHeight) )
        //imageView.center = imageView.superview!.center
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = img
        
        scView.contentSize.height = newHeight
        scView.addSubview(imageView)
        
    }
    
    @IBAction func clickBSI(sender: AnyObject) {
        initSCView()
        
        btnDDI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnGJI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnDGI.setBackgroundImage(UIImage(named: "btn_border_gray"), forState: .Normal)
        btnBSI.setBackgroundImage(UIImage(named: "btn_border_blue"), forState: .Normal)
        
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var img = UIImage(named: "bsi_intro")
        
        var oldWidth = img!.size.width
        var scaleFactor = screenWidth / oldWidth
        
        var newHeight = img!.size.height * scaleFactor
        var newWidth = oldWidth * scaleFactor;
        
        println("newWidth : \(newWidth) , newHeight : \(newHeight)")
        
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, newWidth, newHeight) )
        //imageView.center = imageView.superview!.center
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = img
        
        scView.contentSize.height = newHeight
        scView.addSubview(imageView)
        
    }
    
    func initSCView(){
        let subViews = self.scView.subviews
        
        for sub in subViews{
            sub.removeFromSuperview()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var img = UIImage(named: "ddi_intro")
        
        var oldWidth = img!.size.width
        var scaleFactor = screenWidth / oldWidth
        
        var newHeight = img!.size.height * scaleFactor
        var newWidth = oldWidth * scaleFactor;
        
        //println("newWidth : \(newWidth) , newHeight : \(newHeight)")
        
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, newWidth, newHeight) )
        //imageView.center = imageView.superview!.center
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = img
        
        scView.contentSize.height = newHeight
        scView.addSubview(imageView)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
