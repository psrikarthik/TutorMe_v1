//
//  CategoryTVC.swift
//  TutorMe
//
//  Created by SRIKARTHIK on 07/12/2015.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class CategoryTVC: UITableViewController {
    
    var subObject: PFObject!
    
    var selectedLabel:String?
    
    var images = [UIImage]()
    
    var catArray = [String]()
    
    var obArray = [String]()
    
     var match: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let cQuery = PFQuery(className: "Category")
        
        cQuery.whereKey("catparent", equalTo: subObject)
        
        cQuery.findObjectsInBackgroundWithBlock { (categories, error) -> Void in
            
            if let categories = categories as [PFObject]! {
            
            for category in categories  {
                
                //self.catObjectArray.append(category)
                
                
                let catname = category["catName"]
                //let obId = category["objectId"]
                
               self.obArray.append(category.objectId! )
                
                self.catArray += [catname as! String]
                //self.competitionArray += [competition["compName"] as String]
                
                }
            }
            
            print(self.obArray)
            self.tableView.reloadData()
            
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return catArray.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cCell = tableView.dequeueReusableCellWithIdentifier("catCell") as! CategoryCell

        
        cCell.catLabel.text = self.catArray[indexPath.row] as String
        
        
        return cCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! CategoryCell
        
        selectedLabel = currentCell.catLabel.text
        
        match = (self.obArray[indexPath.row] )
        
        performSegueWithIdentifier("subCatSegue", sender: self)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if (segue.identifier == "subCatSegue") {
            
            let VC = segue.destinationViewController as! subCatTVC
            
            VC.category = match
            
            
        }

    }
    

}
