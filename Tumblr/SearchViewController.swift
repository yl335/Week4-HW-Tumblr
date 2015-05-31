//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Sara Lin on 5/26/15.
//  Copyright (c) 2015 Sara Lin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var loadingContainerView: UIView!
    @IBOutlet weak var loadingBackgroundView: UIView!
    @IBOutlet weak var loadingIndicator: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingContainerView.hidden = false
        loadingBackgroundView.alpha = 1
        loadingIndicator.animationImages = [UIImage]()
        
        for i in 1...3 {
            var frameName = String(format: "loading-\(i)")
            var image = UIImage(named: frameName)
            loadingIndicator.animationImages?.append(image! as UIImage)
        }
        
        loadingIndicator.animationDuration = 1
        loadingIndicator.startAnimating()
        
        delay(2, {
            self.loadingIndicator.stopAnimating()
            self.loadingContainerView.hidden = true
            
            UIView.animateWithDuration(0.5, animations: {
                self.loadingBackgroundView.alpha = 0
            })
            
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
