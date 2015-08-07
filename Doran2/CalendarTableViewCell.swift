//
//  CalendarTableViewCell.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 8. 7..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {

    @IBOutlet weak var lb_date: UILabel!
    @IBOutlet weak var lb_name: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
