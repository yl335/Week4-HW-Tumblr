//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Sara Lin on 5/26/15.
//  Copyright (c) 2015 Sara Lin. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    var loadYOffset: [CGFloat] = [200, 50, 200, 400, 500, 400]
    var unloadY: [CGFloat] = [-500, -700, -500, -10, -50, -10]
    var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [button1, button2, button3, button4, button5, button6]

        for i in 0...(buttons.count - 1) {
            buttons[i].alpha = 0
            buttons[i].transform = CGAffineTransformMakeTranslation(0, loadYOffset[i])
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: nil, animations: {
            for i in 0...(self.buttons.count - 1) {
                self.buttons[i].alpha = 1
                self.buttons[i].transform = CGAffineTransformMakeTranslation(0, 0)
            }
        }, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animateWithDuration(0.2, animations: {
            for i in 0...(self.buttons.count - 1) {
                self.buttons[i].frame.origin.y = self.unloadY[i]
            }
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPressNevermind(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
