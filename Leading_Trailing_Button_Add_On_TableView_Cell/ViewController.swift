//
//  ViewController.swift
//  Leading_Trailing_Button_Add_On_TableView_Cell
//
//  Created by Admin on 26/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    var students = ["Vivek","Pavan","Ravi","Samadhan","Kumar","Shubham"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.studentTableView.delegate = self
        self.studentTableView.dataSource = self
    }
}


extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
}


extension ViewController : UITableViewDelegate{
    
    // For Leading Swipe Actions Buttons
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "edit"){
            (action, swipeButtonView, completion) in
            print("Edit Button Click")
        }
        edit.backgroundColor = .blue
        let share = UIContextualAction(style: .normal, title: "share"){
            (action, swipeButtonView, completion) in
            print("Share Button Click")
        }
        share.backgroundColor = .green
        let buttons  = UISwipeActionsConfiguration(actions: [edit,share])
        return buttons
    }
    
    // For Trailing Swipe Actions Buttons
    /*
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Same as leading
        return UISwipeActionsConfiguration()
    }
     */
    
}

