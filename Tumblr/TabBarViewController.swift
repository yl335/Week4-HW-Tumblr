//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Sara Lin on 5/26/15.
//  Copyright (c) 2015 Sara Lin. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    let transitionManager = TransitionManager()
    
    @IBOutlet weak var explorePopup: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    // tab buttons
    @IBOutlet weak var homeTabButton: UIButton!
    @IBOutlet weak var searchTabButton: UIButton!
    @IBOutlet weak var composeTabButton: UIButton!
    @IBOutlet weak var profileTabButton: UIButton!
    @IBOutlet weak var trendingTabButton: UIButton!
    
    // component view controllers
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    // current selected
    var selectedViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingViewController") as! UIViewController
        
        setActiveTab(homeTabButton, viewController: homeViewController)
        
        UIView.animateWithDuration(1, delay: 0, options: .Repeat | .Autoreverse, animations: {
            self.explorePopup.transform = CGAffineTransformMakeTranslation(0, 10)
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationVC = segue.destinationViewController as! UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self.transitionManager
    }
    
    @IBAction func onPressHomeTab(sender: AnyObject) {
        setActiveTab(homeTabButton, viewController: homeViewController)
    }
    
    @IBAction func onPressSearchTab(sender: AnyObject) {
        setActiveTab(searchTabButton, viewController: searchViewController)
        explorePopup.hidden = true
    }
    
    @IBAction func onPressProfileTab(sender: AnyObject) {
        setActiveTab(profileTabButton, viewController: accountViewController)
    }
    
    @IBAction func onPressTrendingTab(sender: AnyObject) {
        setActiveTab(trendingTabButton, viewController: trendingViewController)

    }
    
    func setActiveTab(tab: UIButton, viewController: UIViewController) {
        addChildViewController(viewController)
        viewController.view.frame = contentView.bounds
        contentView.addSubview(viewController.view)
        
        viewController.view.alpha = 0
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            viewController.view.alpha = 1
            }) { (Bool) -> Void in
                viewController.didMoveToParentViewController(self)
        }
        
        tab.selected = true
        
        for otherTab in [homeTabButton, searchTabButton, profileTabButton, trendingTabButton] {
            if otherTab != tab {
                otherTab.selected = false
            }
        }
        selectedViewController = viewController
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
