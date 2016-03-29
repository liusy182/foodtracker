//
//  Meal.swift
//  food-tracker
//
//  Created by liusy182 on 29/3/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // fail initializer if name is empty of rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}
