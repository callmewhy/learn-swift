//
//  TodoManager.swift
//  MyTodoList
//
//  Created by why on 9/16/14.
//  Copyright (c) 2014 why. All rights reserved.
//

import UIKit

var todoManager : TodoManager = TodoManager ()

struct todo {
    var name = "Un-Named"
    var desc = "Un-Described"
}

class TodoManager: NSObject {
 
    var todos = [todo]()

    func addTask(name: String, desc: String) {
        todos.append(todo(name: name, desc: desc))
    }

}