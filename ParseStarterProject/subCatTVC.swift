
import UIKit
import Parse
import ParseUI


class subCatTVC: UITableViewController {
    
    var category: String!
    
    var subCatArray = [String]()
    
    var qObArray = [String]()
    
    var passObj: String?
    
    var freeLabel : String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scQuery = PFQuery(className: "SubCategory")
        scQuery.whereKey("subCatParent", equalTo: category as String)
        
        scQuery.findObjectsInBackgroundWithBlock { (subCategories, error) -> Void in
            
           // print(subCategories)

            
            for sub in subCategories! {
                
                let subCatName = sub["subcatname"]
                
                self.qObArray.append(sub.objectId!)
                
                self.subCatArray += [subCatName as! String]
            }
            print(self.subCatArray)
            print(self.qObArray)
            
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
        return subCatArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let sCCell = tableView.dequeueReusableCellWithIdentifier("subCatCell") as! subCatCell!
        

        sCCell.subCatLabel.text = self.subCatArray[indexPath.row] 

        return sCCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! subCatCell
        
        freeLabel = currentCell.subCatLabel.text
        
        print(freeLabel)
        passObj = (self.qObArray[indexPath.row] )
        
        print(passObj)
        
       
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "questions") {
            
            let qc = segue.destinationViewController as! QuestionsVC
            
            qc.qObject = passObj! as String
            
            
            
        }
    }

}
