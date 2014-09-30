//
//  ChatViewController.swift
//  ChatClient
//
//  Created by Scott Woody on 9/29/14.
//  Copyright (c) 2014 Scott Woody. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var chatField: UITextField!
    @IBOutlet weak var messagesTableView: UITableView!

    var messages: NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMessages()
        
        messagesTableView.estimatedRowHeight = 100
        messagesTableView.rowHeight = UITableViewAutomaticDimension

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
    
    func getMessages() {
        var query = PFQuery(className:"Message")
        query.whereKey("text", notEqualTo: "")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                NSLog("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
//                    NSLog("%@", object.objectId)
                    println(object["text"]!)
                    println(object["username"]!)
                }
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
