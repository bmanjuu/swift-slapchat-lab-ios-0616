//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var currentMessages : [Message] = []
    let dataStore = DataStore()

    override func viewWillAppear(animated: Bool) {
        dataStore.fetchData()
        currentMessages = dataStore.messages
        
        tableView.reloadData()
        
        print("\(currentMessages.count)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataStore.fetchData()
        
        if currentMessages.count == 0 {
            self.dataStore.generateTestData()
            self.dataStore.fetchData()
            currentMessages = dataStore.messages
        }
    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
//    func generateTestData() {
//        let addMessage = NSEntityDescription.entityForName("Message", inManagedObjectContext: self.dataStore.managedObjectContext)
//        
//        if let addMessage = addMessage {
//            var newMessage = Message(entity: addMessage, insertIntoManagedObjectContext: self.dataStore.managedObjectContext)
//            newMessage.content = "Hello"
//            self.dataStore.managedObjectContext.insertObject(newMessage)
//            
//            newMessage = Message(entity: addMessage, insertIntoManagedObjectContext: self.dataStore.managedObjectContext)
//            newMessage.createdAt = NSDate()
//            self.dataStore.managedObjectContext.insertObject(newMessage)
//            
//            self.dataStore.saveContext()
//            self.dataStore.fetchData()
//        }
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMessages.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        cell.textLabel!.text = currentMessages[indexPath.row].content
        cell.detailTextLabel!.text = String(currentMessages[indexPath.row].createdAt)
        
        return cell
    }
}
