//
//  LoginViewController.swift
//  facebookDemo
//
//  Created by Ryan Sims on 9/17/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var formContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.enabled = false
    }

    // Do any additional setup after loading the view.
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.formContainerView.tag = Int(self.formContainerView.frame.origin.y)
        
        // perform animations when keyboard opens up
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) -> Void in
            var userInfo = notification!.userInfo!
            
            // Get the keyboard height and width
            // Size will vary
            var kbSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
            var animationCurve = curveValue.integerValue
            
            // animate the buttons up to the height of where the fields are
            UIView.animateWithDuration(
                animationDuration, delay: 0.0,
                options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!,
                animations: {
                    self.formContainerView.frame.origin.y = 0;
                },
                completion: nil)
        })
        
        // reset view after keyboard closes
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) -> Void in
            var userInfo = notification!.userInfo!
            
            // Get the keyboard height and width
            // Size will vary
            var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
            var animationCurve = curveValue.integerValue
            
            // animate the buttons up to the height of where the fields are
            UIView.animateWithDuration(
                animationDuration, delay: 0.0,
                options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!,
                animations: {
                    self.formContainerView.frame.origin.y = CGFloat(self.formContainerView.tag);
                },
                completion: nil)
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapView(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func onLoginButton(sender: AnyObject) {
        
        activitySpinner.startAnimating()
        self.loginButton.selected = true

        delay(2, closure: { () -> () in
            if (self.emailTextField.text == "me") && (self.passwordTextField.text == "pass") {
            self.activitySpinner.stopAnimating()
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            else {
                self.loginButton.selected = false
                self.activitySpinner.stopAnimating()
                UIAlertView(title: "Whoops!", message: "Your login credentials are wrong.", delegate: self, cancelButtonTitle: "Try again").show()
            }
        })
    }

    @IBAction func emailTextFieldEdited(sender: AnyObject) {
        checkFormValues()
    }
    
    @IBAction func unwindToSignInSegue(segue:UIStoryboardSegue) {
        }

    @IBAction func passwordFieldEdited(sender: AnyObject) {
        checkFormValues()
    }

    func checkFormValues() {
        if (self.emailTextField.text.isEmpty && self.passwordTextField.text.isEmpty) {
            self.loginButton.enabled = false
        }
        else if (!self.emailTextField.text.isEmpty && !self.passwordTextField.text.isEmpty) {
            self.loginButton.enabled = true
        }
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
