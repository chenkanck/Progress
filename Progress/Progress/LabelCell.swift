//
//  LabelCell.swift
//  Progress
//
//  Created by Kan Chen on 8/23/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import UIKit
protocol LabelcellDelegate {
    func tapLabel(id:Int)
}

class LabelCell: UITableViewCell {
    var id: Int?
    var delegate: LabelcellDelegate?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var title: String?{
        didSet{
            label.text = title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        initialDateLabel()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initialDateLabel(){
        //set tap adction
        timeLabel.userInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: "tapDateLabel")
        timeLabel.addGestureRecognizer(singleTap)
    }
    func setDate(date: NSDate){
        let formate = NSDateFormatter()
        formate.timeStyle = NSDateFormatterStyle.NoStyle
        formate.dateStyle = NSDateFormatterStyle.ShortStyle
        timeLabel.text = formate.stringFromDate(date)

    }
    func tapDateLabel(){
        if let id = id {
            delegate?.tapLabel(id)
        }
    }

}
