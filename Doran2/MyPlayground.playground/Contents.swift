//
//  EventInfoViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 29..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController, UIScrollViewDelegate {
    
    /*
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var iv_image: UIImageView!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_date: UILabel!
    @IBOutlet weak var lb_place: UILabel!
    */
    
    @IBOutlet weak var iv_image: UIImageView!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_date: UILabel!
    @IBOutlet weak var lb_place: UILabel!
    @IBOutlet weak var sc_main: UIScrollView!
    
    @IBOutlet weak var eventInfoView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    @IBAction func callToVenue(sender: AnyObject) {
        @IBAction func shareThis(sender: AnyObject) {
        }
        @IBAction func putToFavorites(sender: AnyObject) {
        }
        @IBAction func putToFavorites(sender: AnyObject) {
        }
        print("Click calliToVenue\n")
    }
    
    @IBAction func goToHomepage(sender: AnyObject) {
        print("Click goToHomepage\n")
    }
    
    @IBAction func showMap(sender: AnyObject) {
        print("Click showMap\n")
    }
    
    
    @IBAction func showDetailInfo(sender: AnyObject) {
        
        eventInfoView.frame.size.height += 200
        mainView.frame.size.height += 600
        sc_main.contentSize.height += 600
        
        print("Click showDetailInfo\n")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "btn_home2.png")
        //self.navigationItem.titleView = UIImageView(image: image)
        self.navigationController?.navigationBar.topItem!.titleView = UIImageView(image: image)
        
        let img = UIImage(named: "full_event_image")
        iv_image.image = img
        
        let wFactor: CGFloat = img!.size.height / img!.size.width
        
        //print("prev : \(iv_image.frame.height)\n")
        
        var temp_height:CGFloat = iv_image.frame.height
        
        iv_image.frame.size.height = iv_image.frame.width * wFactor
        iv_image.sizeToFit()
        
        
        var extended_height:CGFloat = iv_image.frame.height-temp_height
        
        print("temp_height : \(temp_height) \n extended : \(extended_height) \n")
        
        
        sc_main.delegate = self
        sc_main.scrollEnabled = true
        //  mainView.frame.size.height += extended_height
        sc_main.contentSize.height += extended_height
        
        // mainView.sizeToFit()
        //  sc_main.sizeToFit()
        
        
        //print("next : \(iv_image.frame.height)\n")
        
        //print("mainView.height : \(mainView.frame.height)\n")
        
        /*
        iv_image.sizeToFit()
        iv_image.contentMode = UIViewContentMode.ScaleAspectFit
        
        let imgFactor: CGFloat = iv_image.frame.size.height / iv_image.frame.size.width
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        var frame: CGRect!
        */
        
        //frame.size.width = screenSize.size.width
        //frame.size.height = frame.size.width * imgFactor
        
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
