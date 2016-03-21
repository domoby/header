//
//  DomobyTableHeaderView.swift
//  DomobyHeader
//
//  Created by Domoby
//  Copyright © 2016 Domoby. All rights reserved.
//

import UIKit

class DomobyTableHeaderView: UIView {

    var view: UIView!
    
    let offsetHeader = CGFloat(76)
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var message : UILabel!

    @IBOutlet weak var imageViewLogo : UIImageView!
    @IBOutlet weak var imageViewHeader : UIImageView!
    
    
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
        
        imageViewLogo.layer.borderWidth = 2
        imageViewLogo.layer.borderColor = UIColor.whiteColor().CGColor
        imageViewLogo.layer.cornerRadius = imageViewLogo.bounds.size.width/2
        imageViewLogo.clipsToBounds = true
        
        title.text = ""
        message.text = ""
        
        sizeHeaderToFit()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "DomobyTableHeaderView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
 
    
    // MARK: - Other
    
    func sizeHeaderToFit() {
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        let height = self.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    func handleScrollingOffset(offset:CGFloat) {
        
        imageViewLogo.alpha = (offsetHeader - offset)/50
        
        let frame = self.imageViewHeader.frame
        if offset >= 0 {
            self.imageViewHeader.frame = CGRectMake(frame.origin.x, offset/2, frame.size.width, frame.size.height)
        } else {
            self.imageViewHeader.frame = CGRectMake(frame.origin.x, 0, frame.size.width, frame.size.height)
        }
    }
    
}
