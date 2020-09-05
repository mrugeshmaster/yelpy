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
    var r: Restaurant! {
        didSet {
            restaurantName.text = r.name
            restaurantCategoryTitle.text = r.mainCategory
            restaurantContact.text = r.phone
            reviewCount.text = String(r.reviews) + " reviews"
            
            //images
            ratingsImage.image = Stars[r.rating] as? UIImage
            restaurantImage.af.setImage(withURL: r.imageURL!)
            restaurantImage.layer.cornerRadius = 10
            restaurantImage.clipsToBounds = true
        }
    }
    
    let Stars = [
        0.0 : UIImage(named: "regular_0.png"),
        1.0 : UIImage(named: "regular_1.png"),
        1.5 : UIImage(named: "regular_1_half.png"),
        2.0 : UIImage(named: "regular_2.png"),
        2.5 : UIImage(named: "regular_2_half.png"),
        3.0 : UIImage(named: "regular_3.png"),
        3.5 : UIImage(named: "regular_3_half.png"),
        4.0 : UIImage(named: "regular_4.png"),
        4.5 : UIImage(named: "regular_4_half.png"),
        5.0 : UIImage(named: "regular_5_half.png")
    ]
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
