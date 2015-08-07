//
//  EventListTableViewCell.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 28..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class EventListTableViewCell: UITableViewCell {

  
    @IBOutlet weak var iv_event_line: UIImageView!
    @IBOutlet weak var iv_event_image: UIImageView!
    @IBOutlet weak var lb_event_name: UILabel!
    @IBOutlet weak var lb_event_date: UILabel!
    @IBOutlet weak var lb_event_place: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
