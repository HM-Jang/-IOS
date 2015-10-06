//
//  IntroVC1.swift
//  Science Talk Talk
//
//  Created by 펫박스 이현석 on 2015. 9. 8..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class IntroVC1: UIViewController {

    
    @IBOutlet weak var scView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        var img = UIImage(named: "intro1")
        
        var oldWidth = img!.size.width
        var scaleFactor = screenWidth / oldWidth
        
        var newHeight = img!.size.height * scaleFactor
        var newWidth = oldWidth * scaleFactor;
        
        var imageView = UIImageView(frame: CGRectMake(0, 0, newWidth, newHeight) )
        //imageView.center = imageView.superview!.center
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = img
        
        scView.contentSize.height = newHeight
        scView.addSubview(imageView)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
