//
//  DomobyNavigationBarView.swift
//  DomobyHeader
//
//  Created by Domoby
//  Copyright © 2016 Domoby. All rights reserved.
//

import UIKit

@IBDesignable class DomobyNavigationBarView: UIView {
 
    var view: UIView!
    
    let constraint = CGFloat(64)
    let offsetHeader = CGFloat(76)
    let titlePosition = CGFloat(173)
    let offsetNavBarDescription = CGFloat(140)
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    
    @IBOutlet weak private var constraintTitleLeftOffset : NSLayoutConstraint!
    @IBOutlet weak private var constraintTitleRightOffset : NSLayoutConstraint!
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        addSubview(view)
        
        title.text = ""
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "DomobyNavigationBarView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    
    // MARK: - Other
    
    func handleScrollingOffset(offset:CGFloat) {
        
        self.hidden = offset < offsetHeader
        
        let frame = self.title.frame
        var y = frame.origin.y

        if offset > offsetNavBarDescription-5 && offset < titlePosition {
            y = constraint + offsetNavBarDescription - offset
        } else if offset < offsetNavBarDescription-5 && offset < titlePosition {
            y = constraint
        } else if offset > offsetNavBarDescription-5 && offset > titlePosition {
            y = CGFloat(32)
        }

        title.frame = CGRectMake(frame.origin.x, y, frame.size.width, frame.size.height)
    }
    
    
    func setLeftTitleOffset(offset: CGFloat) {
        constraintTitleLeftOffset.constant = offset
    }
    
    func setRightTitleOffset(offset: CGFloat) {
        constraintTitleRightOffset.constant = offset
    }
    
    func setTitleOffset(offset: CGFloat) {
        setLeftTitleOffset(offset)
        setRightTitleOffset(offset)
    }
    
}
