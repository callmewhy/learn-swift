//
//  ViewController.swift
//  learn-gcd
//
//  Created by why on 9/18/14.
//  Copyright (c) 2014 why. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Without GCD
    // 代码块一 不用GCD的方法
    @IBAction func withoutGCD(sender:AnyObject) {
        self.indicatorView.startAnimating()
        let queue:NSOperationQueue = NSOperationQueue()
        let op:NSInvocationOperation = NSInvocationOperation(target: self, selector: Selector(download()), object: nil)
        queue.addOperation(op)
    }

    // 代码块二：下载数据
    func download() {
        let url = NSURL(string: "http://www.youdao.com/")
        let data = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)
        if(!(data as String).isEmpty) {
            downloadCompleted(data)
        }else{
            println("error !")
        }
    }
    
    // 代码块三：下载完成
    func downloadCompleted(data: String) {
        self.indicatorView.stopAnimating()
        println("call back = %@",data);
    }
    
    
    
    // MARK: - With GCD
    @IBAction func withGCD() {
        self.indicatorView.startAnimating()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // 原代码块二
            let url = NSURL(string: "http:www.youdao.com")
            let data = NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)
            
            if (!(data as String).isEmpty) {
                // 原代码块三
                dispatch_async(dispatch_get_main_queue(), {
                    // 刷新 UI
                    self.indicatorView.stopAnimating()

                    println("call back = %@",data)
                });
            } else {
                println("error !")
            }
            
            
        });
    }

}

