//
//  ViewController.swift
//  Dairy
//
//  Created by Alex Rudoi on 8/9/20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var homeworks: Results<WorkModel>!
    var databaseService = DatabaseService()
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        
        let realm = try! Realm()
        homeworks = realm.objects(WorkModel.self).sorted(byKeyPath: "deadline", ascending: true)
        
        tableView.reloadData()
    }
    
    func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeworkTableViewCell", bundle: nil), forCellReuseIdentifier: "homeworkCell")
        tableView.allowsSelection = true
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeworkCell", for: indexPath) as! HomeworkTableViewCell
        
        cell.config(name: homeworks[indexPath.row].nameOfClass, description: homeworks[indexPath.row].homework, deadline: homeworks[indexPath.row].deadline)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DatabaseService.shared.deleteItem(homeworks[indexPath.row])
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let hvc = storyboard.instantiateViewController(withIdentifier: "HomeworkTableViewController") as! HomeworkTableViewController
        
        hvc.item = homeworks[indexPath.row]
        hvc.isAdd = false
        hvc.name = homeworks[indexPath.row].nameOfClass
        hvc.desc = homeworks[indexPath.row].homework
        hvc.dat = homeworks[indexPath.row].deadline
        
        navigationController?.pushViewController(hvc, animated: true)
    }
}

