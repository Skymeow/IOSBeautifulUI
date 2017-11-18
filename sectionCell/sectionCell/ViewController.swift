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
     customize the headerview's background color, backgroundImgView and label
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let image = UIImage(named: "good")
        let imgView = UIImageView(frame:CGRect(x: 3, y: 3, width: tableView.sectionHeaderHeight, height: tableView.sectionHeaderHeight))
        imgView.image = image
        imgView.contentMode = .scaleAspectFill
        view.addSubview(imgView)
        var label = UILabel(frame: CGRect(x: 10 + tableView.sectionHeaderHeight, y: 3, width: 40, height: tableView.sectionHeaderHeight))
        label.textColor = UIColor.white
        if section == 0 {
            label.text = "good"
            view.backgroundColor = UIColor(red:0.40, green:0.84, blue:0.59, alpha:1.0)
        } else {
            label.text = "Bad"
            view.backgroundColor = UIColor(red:0.94, green:0.22, blue:0.22, alpha:1.0)
        }
        view.addSubview(label)
        
        return view
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

