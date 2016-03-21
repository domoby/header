//
//  ViewController.swift
//  DomobyHeader
//
//  Created by Domoby on 21.03.16.
//  Copyright © 2016 Domoby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var domobyHeader : DomobyHeader!
    
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var tableHeaderView : DomobyTableHeaderView!
    @IBOutlet weak var navigationBarView : DomobyNavigationBarView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeader()
    }

    func setUpHeader() {
        
        // get data
        let title = "Title"
        let message = "Description"
        let logo = UIImage(named: "logo")
        let image = UIImage(named: "header")
        
        // init and setting
        domobyHeader = DomobyHeader.initWith(headerView: tableHeaderView, navigationBarView: navigationBarView)
        domobyHeader.setData(title: title, message: message, logo: logo, image: image)
        
        domobyHeader.setColor(UIColor.yellowColor())
        domobyHeader.setTopColor(UIColor.blueColor())
        
        self.view.bringSubviewToFront(navigationBarView)
    }

    
    // MARK: - UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell!.textLabel?.text = "\(indexPath.row) " + "Cell"
        return cell!
    }
    
    
    // MARK: - UIScrollView
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        domobyHeader.handleScrollingOffset(scrollView.contentOffset.y)
    }
    
}

