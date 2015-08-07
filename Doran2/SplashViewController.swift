//
//  SplashViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 27..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btn_start: UIButton!
    @IBOutlet weak var btn_skip: UIButton!
    
    var count: Int?
    var splashImages = [String]()
    var postsCollection = [Post]()
    var service:PostService!
 

    
    @IBAction func clickBtnSkip(sender: AnyObject) {
    
        if count < 2{
            count!++
            
            show()
            
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any add
        // itional setup after loading the view.
       
     
        if Reachability.isConnectedToNetWork() == false{
            println("인터넷 연결 필요")
            
            var alert = UIAlertView(title: "인터넷 연결 필요!", message: "인터넷 연결해주세요.", delegate: nil, cancelButtonTitle: "OK")
            
            alert.show()
        }else{
            println("인터넷 연결됨")
 
        }

        count = 0
        
  
        
        splashImages = ["splash1.png", "splash2.png", "splash3.png"]

        show()
        
        CustomDB.initDB()
        CustomDB.receiveJSONData("http://ddi2.plani.co.kr/event/event/jsonlist/")
        //CustomDB.showTalbe("ddi_event")
        
    }
    
    
    func show(){
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let bg = UIImage(named: splashImages[count!])
        let bgView = UIImageView(image: bg)
        
        bgView.frame = CGRectMake(0, 0, screenSize.width, screenSize.height)
        self.view.addSubview(bgView)
        
        
        
        if count < 2 {
            let timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("show"), userInfo: nil, repeats: false)
            
            self.view.addSubview(btn_skip)
            
            count!++
        }else{
            btn_start.hidden = false
            self.view.addSubview(btn_start)
        }
    }
}


        

    
    /*
    func loadPosts(posts:NSArray){
        for post in posts{
           /*
            var post = post["Post"]! as! NSDictionary   //Post 는 JSON Data에서 분류 Title
            
            var id = (post["id"]! as! String).toInt()!
            var name = post["name"]! as! String
            var sdate = post["sdate"]! as! String
            var edate = post["edate"]! as! String
            var phone = post["phone"]! as! String
            var homepage = post["homepage"]! as! String
            var place = post["place"]! as! String
            var address1 = post["address1"]! as! String
            var address2 = post["address2"]! as! String
            var content = post["content"]! as! String
            var content_detail = post["content_detail"]! as! String
            var thumb = post["thumb"]! as! String
            var thumb_detail = post["thumb_detail"]! as! String
            var thumb_map = post["thumb_map"]! as! String
            var category_age_id = (post["category_age_id"]! as! String).toInt()!
            var category_event_id = (post["category_event_id"]! as! String).toInt()!
            */
            
            var count:Int = 0
            
            var post = post["\(count)"]! as! NSDictionary   //Post 는 JSON Data에서 분류 Title
            
            count++
            
            var id = (post["id"]! as! String).toInt()!
            var name = post["name"]! as! String
            var sdate = post["sdate"]! as! String
            var edate = post["edate"]! as! String
            var phone = post["phone"]! as! String
            var homepage = post["homepage"]! as! String
            var place = post["place"]! as! String
            var address1 = post["address1"]! as! String
            var address2 = post["address2"]! as! String
            var content = post["content"]! as! String
            var content_detail = post["content_detail"]! as! String
            var thumb = post["thumb"]! as! String
            var thumb_detail = post["thumb_detail"]! as! String
            var thumb_map = post["thumb_map"]! as! String
            var category_age_id = (post["category_age_id"]! as! String).toInt()!
            var category_event_id = (post["category_event_id"]! as! String).toInt()!
            
            
            
            var postObj = Post(id: id, name: name, sdate: sdate, edate: edate, phone: phone, homepage: homepage, place: place, address1: address1, address2: address2, content: content, content_detail: content_detail, thumb: thumb, thumb_detail: thumb_detail, thumb_map: thumb_map, category_age_id: category_age_id, category_event_id: category_event_id)
            
           // postsCollection.append(postObj)
            
            print("id: \(id), name: \(name)")
            
        }
    }
    */
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    


