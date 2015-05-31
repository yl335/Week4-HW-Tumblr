//
//  ComposeTransitionManager.swift
//  Tumblr
//
//  Created by Sara Lin on 5/30/15.
//  Copyright (c) 2015 Sara Lin. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        var toView = toViewController.view as UIView!
        var fromView = fromViewController.view as UIView!
        
        let screenWidth:CGFloat = UIScreen.mainScreen().bounds.size.width
        let screenHeight:CGFloat = UIScreen.mainScreen().bounds.size.height
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            // Specify the initial position of the destination view.
            toView.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toView.alpha = 1
                fromView.alpha = 0
                }) { (Finished) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
}
