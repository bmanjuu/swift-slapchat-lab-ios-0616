//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Betty Fung on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    let dataStore = DataStore.sharedDataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var addMessageTextField: UITextField!

    @IBAction func saveMessageTapped(sender: AnyObject) {
        let addMessage = NSEntityDescription.entityForName("Message", inManagedObjectContext: self.dataStore.managedObjectContext)
        
        let newMessage = Message(entity: addMessage!, insertIntoManagedObjectContext: self.dataStore.managedObjectContext)
        newMessage.content = addMessageTextField.text
        newMessage.createdAt = NSDate()
        self.dataStore.managedObjectContext.insertObject(newMessage)
        
        self.dismissViewControllerAnimated(true, completion: nil)
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
