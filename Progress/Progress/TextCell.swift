//
//  TextCell.swift
//  Progress
//
//  Created by Kan Chen on 8/22/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import UIKit

protocol TextCellDelegate{
    func getTextInput(type: Type,input: String)
}

enum Type{
    case Title
    case Amount
}

class TextCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    var delegate: TextCellDelegate?
    var title: String?{
        didSet{
        label.text = title
        if title == "Title"{
            type = Type.Title
            }
        if title == "Amount"{
            type = Type.Amount
            }
        }
    }
    var type: Type?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let type = type {
            delegate?.getTextInput(type,input: textField.text)
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
