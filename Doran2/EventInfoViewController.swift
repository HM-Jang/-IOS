//
//  EventInfoViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 31..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {
    
    @IBOutlet weak var iv_image: UIImageViewAligned!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_date: UILabel!
    @IBOutlet weak var lb_place: UILabel!
    @IBOutlet weak var lb_simpleContent: UILabel!

    @IBOutlet weak var lb_detailContent: UITextView!
    @IBOutlet weak var iv_map: UIImageView!
    @IBOutlet weak var sc_main: UIScrollView!
    
    @IBOutlet weak var btn_favorites: UIButton!
    
    var images = [String]()
    var names = [String]()
 
    var image:String = ""
    var name:String = ""
    var date:String = ""
    var place:String = ""
    var map:String = ""
    var phone:String = ""
    var homepage:String = ""
    var content:String = ""
    var content_detail:String = ""
    
    var event_ids = [String]()
    var event_images = [String]()
    var event:EventInfo?
    var event_names = [String]()
    
    var isFavorites:Bool = false
    
   
    
    @IBAction func putToFavorites(sender: AnyObject) {
        
        
        if isFavorites{ // 즐겨찾기 추가 되어있을 시, Delete
            let isDelete = CustomDB.deleteFromFavorites(event!.id)
            
            btn_favorites.setTitleColor(UIColor.blueColor(), forState: .Normal)
            
            if isDelete{
                println("삭제 성공")
                
                isFavorites = false
            }
            
            else{
               println("삭제 실패 : 해당 id 없음")
            }
            
            
        }else{  // 즐겨찾기 추가가 안되어있을 시, Insert
            let isInsert = CustomDB.insertToFavorites(event!.id)
            
            btn_favorites.setTitleColor(UIColor.yellowColor(), forState: .Normal)
            
            if(isInsert){
                println("삽입 성공")
                isFavorites = true
            }else{
                println("삽입 실패 : 중복")
            }
        }
        
        
       
    }
    
    @IBAction func shareEventInfo(sender: AnyObject) {
        print("shareEventInfo \n")
    }
    
    
    @IBAction func callToVenue(sender: AnyObject) {
        //print("callToVenue \n")
        
        let numArr = event!.phone.componentsSeparatedByString("-")
        
        var phoneNum:String = "tel://"
        
        for str in numArr{
            phoneNum += str
        }
        
        println("EventInfoVC -> phoneNum : \(phoneNum)")
        
        
    UIApplication.sharedApplication().openURL(NSURL(string:phoneNum)!)
        
    }
    
    
    @IBAction func goHomepage(sender: AnyObject) {
        //print("goHomepage \n")

        var subStr:String = ""
        
        if event!.homepage.lowercaseString.hasPrefix("http://"){

            let index:String.Index = advance(event!.homepage.startIndex, 7)
            
            subStr = event!.homepage.substringFromIndex(index)
            
        }else{
            subStr = event!.homepage
        }

        
        if let checkURL = NSURL(string: "http://\(subStr)"){
            
            UIApplication.sharedApplication().openURL(checkURL)
        }
        
        
    }
    
   
    @IBAction func showLoaction(sender: AnyObject) {
        print("showLocation \n")
    }
    
    @IBAction func showDetailInfo(sender: AnyObject) {
        print("showDetailInfo \n")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        //iv_image.clipsToBounds = true
       //iv_map.clipsToBounds = true

        println("EventInfoViewController -> homepage : \(event?.homepage), phone : \(event?.phone)")
        
        
        let format = NSDateFormatter()
        format.timeZone = NSTimeZone()
        format.dateFormat = "yyyy년MM월dd일"
        
        let date1 = format.stringFromDate(event!.sdate)
        let date2 = format.stringFromDate(event!.edate)
        
        let date = "\(date1)~\(date2)"
        
        setInfo(image: "full_event_image", name: event!.name, date: date, place: "\(event!.address1) \(event!.address2)", map:"map",phone: event!.phone, homepage: event!.homepage, simpleContent: event!.content, detailContent:event!.content_detail)
        
        isFavorites = CustomDB.existIdFromFavorites(event!.id)
        
        if isFavorites{
            println("즐겨찾기 추가된 이벤트")
            
            btn_favorites.setTitleColor(UIColor.yellowColor(), forState: .Normal)
        }
        
        //let image = UIImage(named: "btn_home2.png")
        //self.navigationController?.navigationBar.topItem!.titleView = UIImageView(image: image)

        //println("EventInfo -> Event. id : \(event!.id), name : \(event!.name)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInfo(#image:String, #name:String,  #date:String, place:String, #map:String, #phone:String, #homepage:String, #simpleContent:String, #detailContent:String){
        
        self.image = image
        iv_image.image = UIImage(named: image)
        
        self.name = name
        lb_name.text = self.name
        
        self.date = date
        lb_date.text = self.date
        
        self.place = place
        lb_place.text = self.place
        
        self.map = map
        //iv_map.image = UIImage(named: map)
        
        self.phone = phone
        
        self.homepage = homepage
        
        self.content = simpleContent
        lb_simpleContent.text = self.content
        
        self.content_detail = detailContent
        
        lb_detailContent.text = self.content_detail
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK : CollectionView
  
    /*
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return names.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("EventsCell2", forIndexPath: indexPath) as! EventsCollectionViewCell
        
        // Configure the cell
        cell.iv_image.image = UIImage(named: images[indexPath.row])
        
        cell.lb_name.text = names[indexPath.row]
        
        return cell
    }
*/
    
    

}
