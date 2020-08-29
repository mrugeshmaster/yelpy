//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        // Displaying Restaurant Name
        cell.restaurantName.text = restaurant["name"] as? String ?? ""
        
        // Displaying Restaurant Category
        let restaurantCategories = restaurant["categories"] as! [[String: Any]]
        let restaurantCategory = restaurantCategories[0]
        cell.restaurantCategoryTitle.text = restaurantCategory["title"] as? String ?? ""
        
        //Displaying Restaurant Rating
        let restaurantRating = restaurant["rating"] as? Float ?? 0
        
        switch restaurantRating {
        case 0:
            cell.ratingsImage.image = UIImage(named: "regular_0.png")
        case 1:
            cell.ratingsImage.image = UIImage(named: "regular_1.png")
        case 1.5:
            cell.ratingsImage.image = UIImage(named: "regular_1_half.png")
        case 2:
            cell.ratingsImage.image = UIImage(named: "regular_2.png")
        case 2.5:
            cell.ratingsImage.image = UIImage(named: "regular_2_half.png")
        case 3:
            cell.ratingsImage.image = UIImage(named: "regular_3.png")
        case 3.5:
            cell.ratingsImage.image = UIImage(named: "regular_3_half.png")
        case 4:
            cell.ratingsImage.image = UIImage(named: "regular_4.png")
        case 4.5:
            cell.ratingsImage.image = UIImage(named: "regular_4_half.png")
        case 5:
            cell.ratingsImage.image = UIImage(named: "regular_5.png")
        default:
            cell.ratingsImage.image = UIImage(named: "regular_0.png")
        }
        
        //Displaying Restaurant Contact
        let reviewCount = restaurant["review_count"]!!
        cell.reviewCount.text = "\(reviewCount)"
        
        //Displaying Restaurant Contact
        cell.restaurantContact.text = restaurant["display_phone"] as? String ?? ""
        
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        return cell
    }
    
    
    
    
    
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: [[String: Any?]] = []
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getApiData()
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getApiData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


