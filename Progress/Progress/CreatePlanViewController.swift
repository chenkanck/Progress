//
//  CreatePlanViewController.swift
//  Progress
//
//  Created by Kan Chen on 8/22/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import UIKit

class CreatePlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , LabelcellDelegate, DatePickerDelegate, TextCellDelegate{

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var newTask = CounterTask(title: "", start: NSDate(), due: NSDate())
    var timeSelector: Int = 0
    
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
   
    
    // MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var nums = 0
        if section == 0{
            nums = 1
        }else if section == 1{
            if timeSelector > 0{
                nums = 3
            }else{
                nums = 2
            }
        }else if section == 2{
            nums =  1
        }
        return nums
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("celltext", forIndexPath: indexPath) as! TextCell
            cell.title = "Title"
            cell.delegate = self
            return cell
        }else if indexPath.section == 1{
            if timeSelector>0 && indexPath.row == timeSelector{
                let cell = tableView.dequeueReusableCellWithIdentifier("cellpicker", forIndexPath: indexPath) as! DatePickerCell
                cell.delegate = self
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("celllabel", forIndexPath: indexPath) as! LabelCell
                if indexPath.row == 0{
                    cell.title = "Start"
                    cell.id = 1
                    cell.setDate(newTask.startTime)
                }else{
                    cell.title = "End"
                    cell.id = 2
                    cell.setDate(newTask.dueTime)
                }
                cell.delegate = self
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("celltext", forIndexPath: indexPath) as! TextCell
            cell.title = "Amount"
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if timeSelector>0 && indexPath.section == 1 && indexPath.row == timeSelector{
            return 180
        }else{
            return 50
        }
    }
    
    // MARK: - LabelCellDelegate
    
    func tapLabel(id: Int) {
        if id == 1{
            if timeSelector == 1 {
                timeSelector = 0
            }else{
                timeSelector = 1
            }
            tableView.reloadData()
        }else if id == 2{
            if timeSelector == 2{
                timeSelector = 0
            }else{
                timeSelector = 2
            }
            tableView.reloadData()

        }
    }
    // MARK: - DatePickerDelegate
    
    func getNewNSDate(date: NSDate) {
        assert (timeSelector > 0 , "timeSelector >0")
        let formate = NSDateFormatter()
//        formate.timeStyle = NSDateFormatterStyle.NoStyle
//        formate.dateStyle = NSDateFormatterStyle.ShortStyle
//        let str = formate.stringFromDate(date)
        if timeSelector == 1{
            newTask.startTime = date
            tableView.reloadData()
        }else{
            newTask.dueTime = date
            tableView.reloadData()
        }
        
    }
    
    func getTextInput(type: Type, input: String) {
        if type == Type.Title{
            newTask.title = input
        }else{
            newTask.total = input.toInt()!
        }
    }
    
    // MARK: -Misc
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        view.endEditing(true)
    }
    
    // MARK: - Navigation
    
    // MARK: - Buttons
    @IBAction func clickCancel(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func clickSave(sender: AnyObject) {
        TaskList.sharedInstance.Tasks.append(self.newTask)
        self.navigationController?.popViewControllerAnimated(true)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    

}
