//
//  FavoritesTableViewCell.swift
//  Doran2
//
//  Created by 펫박스 이현석 on 2015. 7. 28..
//  Copyright (c) 2015년 펫박스 장현민. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var iv_favorites_line: UIImageView!
    @IBOutlet weak var iv_favorites_image: UIImageView!
    @IBOutlet weak var lb_favorites_name: UILabel!
    @IBOutlet weak var lb_favorites_date: UILabel!
    @IBOutlet weak var lb_favorites_place: UILabel!
    
    @IBOutlet weak var btn_favorites_detail: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
