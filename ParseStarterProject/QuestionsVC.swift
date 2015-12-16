//
//  QuestionsVC.swift
//  TutorMe
//
//  Created by Karthik on 16/12/2015.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class QuestionsVC: UIViewController {
    
    var qObject: String!
    
    
    @IBOutlet var qLabel: UILabel!
    
    @IBOutlet var ans1: UIButton!

    @IBOutlet var ans2: UIButton!
    
    @IBOutlet var ans3: UIButton!
    
    @IBOutlet var ans4: UIButton!
    
    @IBAction func ans1(sender: AnyObject) {
    }
    
    @IBAction func ans2(sender: AnyObject) {
    }
    
    @IBAction func ans3(sender: AnyObject) {
    }
    
    @IBAction func ans4(sender: AnyObject) {
    }
    
    
    @IBAction func correctAnswer(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(qObject)
        

//        let qQuery = PFQuery(className: "Question")
//        
//        qQuery.whereKey("SubCatParentName", equalTo: qObject as String)
//        qQuery.findObjectsInBackgroundWithBlock { (questions , error ) -> Void in
//            
//            print(questions)
//            
//        }
        
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
