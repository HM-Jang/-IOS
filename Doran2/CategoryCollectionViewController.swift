//
//  CategoryCollectionViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 27..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class CategoryCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let reuseIdentifier = "MyCell"
    
    var menuImages = [String]()
    var menuName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        /*
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        */
        // Do any additional setup after loading the view.
        
        menuName = ["전체", "유아", "초등", "중등", "고등", "성인",
                    "전시/체험형", "강연형", "투어형", "활동형", "캠프형", "기타"]
        
        menuImages = ["all_category_event.png",
                    "all_category_baby.png",
                    "all_category_element.png",
                    "all_category_middle.png",
                    "all_category_high.png",
                    "all_category_adult.png",
                    "all_category_exp.png",
                    "all_category_teach.png",
                    "all_category_tour.png",
                    "all_category_act.png",
                    "all_category_camp.png",
                    "all_category_etc.png" ]

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return menuName.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CategoryCollectionViewCell
    
        // Configure the cell
        let image = UIImage(named: menuImages[indexPath.row])
        cell.imageView.image = image
        
        cell.nameLabel.text = menuName[indexPath.row]
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var header: HeaderCollectionReusableView?
        
        if kind == UICollectionElementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "MyHeader", forIndexPath: indexPath) as! HeaderCollectionReusableView
            
            header?.headerLabel.text = "전체 카테고리"
            
            let image = UIImage(named: "btn_all_category_search2")!
            header?.btn_search.setImage(UIImage(named: "btn_all_category_search"), forState: .Normal)
        
        }
        
        return header!
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
