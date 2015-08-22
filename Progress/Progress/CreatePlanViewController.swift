//
//  CreatePlanViewController.swift
//  Progress
//
//  Created by Kan Chen on 8/22/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import UIKit

class CreatePlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Buttons
    @IBAction func clickCancel(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    // MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var nums = 0
        if section == 0{
            nums = 1
        }else if section == 1{
            nums =  2
        }else if section == 2{
            nums =  1
        }
        return nums
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celltext", forIndexPath: indexPath) as! UITableViewCell
        if indexPath.section == 0 {
            cell.textLabel?.text = "title"
        }else if indexPath.section == 1{
            cell.textLabel?.text = "time"
        }else{
            cell.textLabel?.text = "total amount"
        }
        
        
        
        return cell
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
