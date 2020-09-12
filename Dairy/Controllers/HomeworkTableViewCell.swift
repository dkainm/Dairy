//
//  HomeworkTableViewCell.swift
//  Dairy
//
//  Created by Alex Rudoi on 11/9/20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class HomeworkTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var describtionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var bgView: UIView!
    
    var deadlineIsClose: Bool = false
    
    let greenColor = UIColor(named: "IndicatorsGreen")
    let redColor = UIColor(named: "IndicatorsRed")
    
    let formatter = DateFormatter()
    let date = Date()
    let calendar = Calendar.current
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayer()
        describtionTextView.isUserInteractionEnabled = false
        
        deadlineIsClose ? changingIndicatorsColor(redColor!) : changingIndicatorsColor(greenColor!)
    }
    
    func config(name: String, description: String, deadline: Date) {
        
        nameLabel.text = name
        describtionTextView.text = description
        
        formatter.dateFormat = "dd MMM"
        
        dateLabel.text = formatter.string(from: deadline)
    }
    
    func changingIndicatorsColor(_ color: UIColor) {
        dateLabel.textColor = color
        indicatorView.backgroundColor = color
    }
//    override var frame: CGRect {
//        get {
//            return super.frame
//        }
//        set (newFrame) {
//            var frame = newFrame
//            frame.origin.x += 20
//            super.frame = frame
//        }
//    }
    
    func setupLayer(){
        bgView.layer.cornerRadius = 15
        bgView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bgView.layer.shadowOffset = CGSize(width: 0, height: 4)
        bgView.layer.shadowOpacity = 0.15
        bgView.layer.shadowRadius = 7
    }
    
}
