//
//  ViewController.swift
//  goodPattern
//
//  Created by Sky Xu on 11/7/17.
//  Copyright © 2017 Sky Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cp: CirclePath!
    
    @IBAction func sliderChanged(_ sender: Any) {
        cp.value = (sender as! UISlider).value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//       declare the location of the circlepath using CGRect
        let rect = CGRect(x: 20, y: 40, width: 200, height: 200)
        cp = CirclePath(frame: rect)
        view.addSubview(cp)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

