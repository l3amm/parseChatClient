//
//  ViewController.swift
//  ChatClient
//
//  Created by Scott Woody on 9/29/14.
//  Copyright (c) 2014 Scott Woody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailInputField: UITextField!
    @IBOutlet weak var passwordInputField: UITextField!
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUp(sender: AnyObject) {
        email = emailInputField.text ?? ""
        password = passwordInputField.text ?? ""
        
        var user = PFUser()
        user.username = email
        user.password = password
        user.email = email
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                println("We signed up")
                return
            } else {
//                let errorString = error.userInfo["error"] as NSString
                println(error)
            }
        }
        
    }

    @IBAction func signIn(sender: AnyObject) {
        println("Inside function")
        email = emailInputField.text ?? ""
        password = passwordInputField.text ?? ""
        
        PFUser.logInWithUsernameInBackground(self.emailInputField.text, password: self.passwordInputField.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                println("Signed Up")
            } else {
                println("Didn't work to signup")
            }
        }
    }

}

