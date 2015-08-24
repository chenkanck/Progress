//
//  DatePickerCell.swift
//  Progress
//
//  Created by Kan Chen on 8/23/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import UIKit

protocol DatePickerDelegate{
    func getNewNSDate(date: NSDate)
}

class DatePickerCell: UITableViewCell {
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        datePicker.addTarget(self, action: "datePickerChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func datePickerChanged(datepicker: UIDatePicker){
        delegate?.getNewNSDate(datePicker.date)
    }

}
