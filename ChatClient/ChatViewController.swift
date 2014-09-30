//
//  ChatViewController.swift
//  ChatClient
//
//  Created by Scott Woody on 9/29/14.
//  Copyright (c) 2014 Scott Woody. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendChat(sender: AnyObject) {
        if let messageText = chatField.text {
            println("savign")
            var message = PFObject(className:"Message")
            message["text"] = messageText
//            message["user"] = "Scott Ivan"
            message["username"] = "scivan"
            message.saveInBackground()
        }
        chatField.text = ""
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
