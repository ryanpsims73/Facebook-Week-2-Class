//
//  moreViewController.swift
//  facebookDemo
//
//  Created by Ryan Sims on 9/15/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class moreViewController: UIViewController, UIActionSheetDelegate {


    @IBOutlet weak var newScrollView: UIScrollView!

    @IBOutlet weak var newImageView: UIImageView!
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        var actionSheet = UIActionSheet(title: "Are you sure you want to logout?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Log Out")
        actionSheet.showInView(view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.newScrollView.contentSize = CGSize(width: 320, height: self.newImageView.image!.size.height+60)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int){
        println(buttonIndex)
        if (buttonIndex == 0) {
          self.performSegueWithIdentifier("logoutSegue", sender: nil)
        }
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
