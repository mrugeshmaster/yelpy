//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by admin on 8/28/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantCategoryTitle: UILabel!
    @IBOutlet weak var restaurantContact: UILabel!
    @IBOutlet weak var reviewCount: UILabel!
    
    @IBOutlet weak var ratingsImage: UIImageView!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
