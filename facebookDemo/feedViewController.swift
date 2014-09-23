//
//  feedViewController.swift
//  facebookDemo
//
//  Created by Ryan Sims on 9/15/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class feedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var composeImageView: UIImageView!
    @IBOutlet weak var feedLoadSpinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: homeImageView.frame.size.width, height: homeImageView.frame.size.height + composeImageView.frame.size.height)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollView.alpha = 0
        self.feedLoadSpinner.startAnimating()
        
        delay(2, closure: { () -> () in
            UIView.animateWithDuration(0.5){
                self.feedLoadSpinner.stopAnimating()
                self.feedLoadSpinner.alpha = 0
                self.scrollView.alpha = 1
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
