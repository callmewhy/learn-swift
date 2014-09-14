//
//  ViewController.swift
//  learn-swift
//
//  Created by why on 9/11/14.
//  Copyright (c) 2014 why. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySubview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.preservesSuperviewLayoutMargins = true;
        mySubview.preservesSuperviewLayoutMargins = true;
        mySubview.layoutMargins = UIEdgeInsetsZero;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
