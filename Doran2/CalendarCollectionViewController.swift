//
//  CalendarCollectionViewController.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 28..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

let DotwCell = "DotwCell"
let DateCell = "DateCell"

class CalendarCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var DayOfTheWeek = [String]()
    var DayOfTheWeek_Korean = [String]()
    var Dates = [Int]()
    var Graies = [Bool]()
    var types = [Int]() // 0: 없음, 1: 초등, 2: 중등, 3: 고등, 4: 성인 5: 기타
    
    var screenSize: CGRect?
    var itemWidth: CGFloat?
    
    var selectedYear: Int = 0
    var selectedMonth: Int = -1
    
    var curToday: Int?
    var curDotw: Int?
    var curMaxDay: Int?
    var prevMaxDay: Int?

    var myView: CalendarCollectionViewController?
    var header: HeaderCalendarCollectionReusableView?
    
    var eventInfos = [EventInfo]()
    
    //var footer:UICollectionReusableView?

    @IBAction func pressPrev(sender: AnyObject) {
        
        var tempYear:Int = selectedYear
        var tempMonth:Int = selectedMonth-1
        
        if(tempMonth == 0){
            tempYear -= 1
            tempMonth = 12
        }
        
        selectedYear = tempYear
        selectedMonth = tempMonth
        
        header?.lb_yearmonth.text = returnHeaderString(year: selectedYear, month: selectedMonth)
        
        setCalendar()
        
        self.collectionView!.reloadData()
        
       // print("Press Prev Btn : \(selectedYear).\(selectedMonth)")
    }
    
    @IBAction func pressNext(sender: AnyObject) {

        var tempYear:Int = selectedYear
        var tempMonth:Int = selectedMonth+1
        
        if(tempMonth == 13){
            tempYear += 1
            tempMonth = 1
        }
        
        
        selectedYear = tempYear
        selectedMonth = tempMonth

        
        header?.lb_yearmonth.text = returnHeaderString(year: selectedYear, month: selectedMonth)
        
        setCalendar()
       
        self.collectionView!.reloadData()
        
        //print("Press Next Btn: \(selectedYear).\(selectedMonth)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("viewDidLoad()")
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        DayOfTheWeek = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        DayOfTheWeek_Korean = [ "일", "월", "화", "수", "목", "금", "토"]
        
        
        Dates = [ 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0]
        
        Graies = [ false, false, false, false, false, false, false,
                false, false, false, false, false, false, false,
                false, false, false, false, false, false, false,
                false, false, false, false, false, false, false,
                false, false, false, false, false, false, false,
                false, false, false, false, false, false, false,]
        
        types = [ 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0]
        
        let todayDate = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        if(selectedYear == 0 || selectedMonth == -1){
            selectedYear = cal!.component(.CalendarUnitYear, fromDate: todayDate)
            selectedMonth = cal!.component(.CalendarUnitMonth, fromDate: todayDate)
        }
        
 
        setCalendar()

        screenSize = UIScreen.mainScreen().bounds
        itemWidth = screenSize!.width / 7
        
        //print(screenSize)
        //print(itemWidth)
        
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
        return 49
    }

    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if(indexPath.row <= 6 ){
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DotwCell, forIndexPath: indexPath) as! CalendarCollectionViewCell
            
            // Configure the cell
            //print(cell.frame.size)
            
            cell.frame.size.width = itemWidth!
            cell.frame.size.height = itemWidth!
            
            cell.sizeToFit()
  
            //print(cell.frame.size)
            
            
            if indexPath.row == 0{
                cell.lb_dotw.textColor = UIColor.redColor()
                
                //print("index : \(indexPath.row) // \(DayOfTheWeek[indexPath.row])")
            }
            else{
                cell.lb_dotw.textColor = UIColor.blackColor()
            }

            cell.lb_dotw.text = DayOfTheWeek_Korean[indexPath.row]
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DateCell, forIndexPath: indexPath) as! CalendarCollectionViewCell
            
            cell.frame.size.width = itemWidth!
            cell.frame.size.height = itemWidth!
            cell.sizeToFit()
            
            let digit: Int = indexPath.row - 7
            
           
            
            if Graies[digit] {
                cell.lb_date.textColor = UIColor.lightGrayColor()
                //print("  digit : \(digit)[\(Dates[digit])] \n")
            }
            
            else{
                cell.lb_date.textColor = UIColor.blackColor()
            }

            
             cell.lb_date.text = String(Dates[digit])
            
            let type = types[digit]
            
            if type > 0 {
                
                let img_line = UIImage(named: returnTypeImage(type: type ))
                //cell.iv_line.contentMode = UIViewContentMode.ScaleAspectFill
                cell.iv_line.image = img_line
                
                cell.iv_line.frame.size.width = 10
                cell.iv_line.frame.size.height = 5
                cell.iv_line.sizeToFit()
            }else{
                cell.iv_line.image = nil

            }
            
   
            return cell
        }
    }
    

    // MARK: UICollectionViewDelegate

    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var view:UICollectionReusableView?
        
        if kind == UICollectionElementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderCalendar", forIndexPath: indexPath) as! HeaderCalendarCollectionReusableView
        
            //print(headerText)
            
            header?.lb_yearmonth.text = returnHeaderString(year: selectedYear, month: selectedMonth)
            header?.btn_next.setImage(UIImage(named: "btn_custom_calendar_next"), forState: .Normal)
            
            header?.btn_prev.setImage(UIImage(named: "btn_custom_calendar_prev"), forState: .Normal)
            //setCalendar()
            
            view = header
        }
        
        /*
        if kind == UICollectionElementKindSectionFooter{
            
            footer  = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "FooterCalendar", forIndexPath: indexPath) as! FooterCollectionReusableView
            
            view = footer
        }
        */
        
        return view!
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

    // etc Func
    
    func setCalendar(){
     
        let todayDate = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)

        curToday = cal!.component(NSCalendarUnit.CalendarUnitDay, fromDate: todayDate)
        curDotw = returnFirstDotw(curYear: selectedYear, curMonth: selectedMonth)-1
        curMaxDay = returnLastDayofMonth(curYear: selectedYear, curMonth: selectedMonth, isPrev: false)
        prevMaxDay = returnLastDayofMonth(curYear: selectedYear, curMonth: selectedMonth, isPrev: true)
        
        //print(" year : \(selectedYear) // month : \(selectedMonth)\n ")
        
        var monthStr:String = ""
        
        if(selectedMonth<10){
            monthStr = "0\(selectedMonth)"
        }else{
            monthStr = "\(selectedMonth)"
        }
 
        let date1:String = ("\(selectedYear)-\(monthStr)-01")
        let date2:String = ("\(selectedYear)-\(monthStr)-\(curMaxDay)")
        
        eventInfos = CustomDB.returnEventInfos(date1: date1, date2: date2)
        
        var d:Int = 1
        var isNextMonth:Bool = false
        
        initGraies()
        initTypes()
        
        let format = NSDateFormatter()
        format.timeZone = NSTimeZone()
        format.dateFormat = "yyyy-MM-dd"
        
        for event:EventInfo in eventInfos{
            let category_id = event.category_age_id
            
            let sdate = format.stringFromDate(event.sdate)
            
            let seperateDate = sdate.componentsSeparatedByString("-")
            
            var day = (seperateDate[2]).toInt()
            
            //println("day : \(day!)")
    
            types[curDotw!+day!-1] = category_id    // 이번달 1일의 배열주소 : curDotw, day:이벤트 날짜, -1: 1일
            
        }
        
  
        
        for i:Int in 0...5{
            for j:Int in 0...6{
                
                let digit:Int = (i*7) + (j%7)
                
                if(i==0){
                    if(j <= curDotw!-1){
                        Dates[digit] = prevMaxDay!-(curDotw!-1)+j
                        Graies[digit] = true
                    }else{
                        Dates[digit] = d
                        d++
                    }
                    
                }else{
                    if(d > curMaxDay){
                        d=1
                        isNextMonth = true
                    }
                    
                    
                    if(isNextMonth){    //set Gray
                        Graies[digit] = true
                    }
                    
                    
                    Dates[digit] = d
                    d++
                }
            }
        }
    }
    
    func returnTypeImage(#type: Int) -> String{
        
        var str:String
        
        switch (type){
        case 0:
           str = ""
        
        case 1:
            str = "tab_age_dot_element"
            
        case 2:
            str = "tab_age_dot_middle"
            
        case 3:
            str = "tab_age_dot_high"
            
        case 4:
            str = "tab_age_dot_adult"
            
        case 5:
            str = "tab_age_dot_etc"
            
        default:
            str = ""
        }
        
        return str
        
    }
    
    func returnHeaderString(#year: Int, #month: Int) -> String{
        var Header:String = ""
        
        if (month/10) < 1 {
                Header = "\(year).0\(month)"
        }else{
            Header = "\(year).\(month)"
        }
        
        return Header
    }
    
    func initGraies(){
        for i: Int in 0...41{
            Graies[i] = false
        }
    }
    
    func initTypes(){
        for i:Int in 0...41{
            types[i] = 0
        }
    }
    
    func returnFirstDotw(#curYear: Int, #curMonth: Int) ->Int{
        
        let firstDate = date(year: curYear, month: curMonth, day: 1)!
        
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        let dotw = cal?.component(.CalendarUnitWeekday, fromDate: firstDate)
        
        return dotw!
    }
    
    func returnLastDayofMonth(#curYear: Int, #curMonth: Int, #isPrev: Bool) -> Int{
        
        var tempYear: Int = curYear
        var tempMonth: Int = curMonth
        
        if(!isPrev){
            tempMonth += 1
            
            if(tempMonth == 13){
                tempMonth = 1
                tempYear += 1
            }
        }else{
            tempMonth -= 1
            
            if(tempMonth == 0){
                tempMonth = 12
                tempYear -= 1
            }
        }
        
        let cDate = date(year: curYear, month: curMonth, day: 1)!
        let nDate = date(year: tempYear, month: tempMonth, day: 1)!
        
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        
        let c1 = cal!.components(NSCalendarUnit.CalendarUnitDay, fromDate: cDate, toDate: nDate, options: NSCalendarOptions(0))
        
        var result:Int = c1.day
        
        if result < 0{
            result *= -1
        }
        
        return result
    }
    
    func date(#year: Int, #month: Int, #day: Int) -> NSDate?{
        
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let comp = NSDateComponents()
        comp.year = year
        comp.month = month
        comp.day = day
        
        return cal!.dateFromComponents(comp)
    }
    
}
