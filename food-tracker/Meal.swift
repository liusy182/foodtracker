//
//  Meal.swift
//  food-tracker
//
//  Created by liusy182 on 30/3/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit


class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}