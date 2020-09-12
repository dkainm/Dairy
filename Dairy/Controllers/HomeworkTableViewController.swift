//
//  HomeworkTableViewController.swift
//  Dairy
//
//  Created by Alex Rudoi on 9/9/20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

class HomeworkTableViewController: UITableViewController, UITextViewDelegate {
    @IBOutlet weak var nameOfClassTF: UITextField!
    @IBOutlet weak var homeworkTV: UITextView!
    @IBOutlet weak var deadlineTF: UITextField!
    
    var item = WorkModel()
    var isAdd = true
    
    var name = ""
    var desc = ""
    var dat: Date?
    
    var currentDate: Date!
    
    let dateFormatter = DateFormatter()
    let date = Date()
    let calendar = Calendar.current
    
    let datePicker = UIDatePicker()
    let formatter = DateFormatter()
    let toolBar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        homeworkTV.delegate = self
        
        
        if dat == nil {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day, .month, .year], from: date)
            dat = calendar.date(from:components)
            currentDate = calendar.date(from:components)
        }
    
        if isAdd {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: #selector(saveTapped))
        } else {
            nameOfClassTF.text = name
            homeworkTV.text = desc
            homeworkTV.textColor = .black
            formatter.dateStyle = .medium
            deadlineTF.text = formatter.string(from: dat!)
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(editTapped))
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (homeworkTV.text == "Write here your homework")
        {
            homeworkTV.text = ""
            homeworkTV.textColor = .black
        }
        homeworkTV.becomeFirstResponder() //Optional
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if (homeworkTV.text == "")
        {
            homeworkTV.text = "Write here your homework"
            homeworkTV.textColor = .lightGray
        }
        homeworkTV.resignFirstResponder()
    }
    
    func createDatePicker() {
        
        datePicker.datePickerMode = .date
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTapped))
        toolBar.setItems([doneButton], animated: true)
        
        if let previousDate = dat {
            datePicker.date = previousDate
        }
        
        deadlineTF.inputAccessoryView = toolBar
        deadlineTF.inputView = datePicker
    }
    
    @objc func doneTapped() {
        
        formatter.dateFormat = "dd.MM.yyyy"
        deadlineTF.text = formatter.string(from: datePicker.date)
        dat = datePicker.date
    }

    @objc func saveTapped() {
        DatabaseService.shared.addNewItem(name: nameOfClassTF.text ?? "No name",
                                          descriprion: homeworkTV.text ?? "No homework", deadline: dat ?? currentDate)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func editTapped() {
        DatabaseService.shared.updateItem(item,
                                          name: nameOfClassTF.text ?? "No name",
                                          descriprion: homeworkTV.text ?? "No homework", deadline: dat ?? nil)
        navigationController?.popViewController(animated: true)
    }


}
