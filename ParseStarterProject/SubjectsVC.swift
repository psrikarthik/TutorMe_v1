//
//  SubjectsVC.swift
//  TutorMe
//
//  Created by SRIKARTHIK on 07/12/2015.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class SubjectsVC: PFQueryTableViewController {
    
    convenience override init(style: UITableViewStyle, className: String!){
        self.init(style: style, className: className)
        
        self.parseClassName = "Subject"
        
        self.textKey = "subname"
       // self.imageKey = "clubLogo"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func queryForTable() -> PFQuery {
        
        let query = PFQuery(className: "Subject")
        
        
        return query
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("subCell") as! SubjectCell!
        
        if cell == nil {
            
            cell = SubjectCell(style: UITableViewCellStyle.Default, reuseIdentifier: "subCell")
            
        }
        
        if let subName = object?["subname"] as? String {
            
            cell?.sLabel?.text = subName
            
        }
        
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let detailScene = segue.destinationViewController as! CategoryTVC
        
        if let indexPath = self.tableView.indexPathForSelectedRow{
            
            let row = Int(indexPath.row)
            
            detailScene.subObject = (objects?[row] as! PFObject)
            
        }
        
    }
    
}
