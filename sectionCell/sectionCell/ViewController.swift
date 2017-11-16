//
//  ViewController.swift
//  sectionCell
//
//  Created by Sky Xu on 11/16/17.
//  Copyright © 2017 Sky Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let data = [
        ["apple", "orange", "kiwi", "sushi"],
        ["apple2", "kiwi2", "sushi2"]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    /**
     assign the value of data to  the labels in each section
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       var cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        
        return cell
    }
    
    /**
     set the name of sections
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "good"
        case 1:
            return "bad"
        default:
            return nil
        }
    }
    
    /**
     set the height of header
    */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    /**
     return the number of elements in each section
   */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    /**
     return number of sections (2)
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    /**
    customize the headerview's background color and label
    */
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.red
//        downcast our view to be headerView which is part of tableViewHeaderFooterView
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.white
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

