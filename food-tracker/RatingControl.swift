//
//  RatingControl.swift
//  food-tracker
//
//  Created by liusy182 on 28/3/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    //var meal: Meal?
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "full_star")
        let emptyStarImage = UIImage(named: "empty_star")
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.clearColor()
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateRatingButtons()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
        
    }
    
    // MARK: actions
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateRatingButtons()
    }
    
    func updateRatingButtons() {
        for (idx, btn) in ratingButtons.enumerate() {
            btn.selected = idx < rating
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
