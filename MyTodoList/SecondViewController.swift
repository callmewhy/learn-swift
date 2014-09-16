//
//  SecondViewController.swift
//  MyTodoList
//
//  Created by why on 9/15/14.
//  Copyright (c) 2014 why. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var todoText: UITextField!
    
    @IBOutlet weak var descText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addBtnClick(sender: AnyObject) {
        todoManager.addTask(todoText.text, desc: descText.text)
        self.view.endEditing(true)
        todoText.text = ""
        descText.text = ""
        self.tabBarController?.selectedIndex = 0
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    // UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}

