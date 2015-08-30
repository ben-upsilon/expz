//
//  ViewController.swift
//  expz
//
//  Created by Ben on 15/8/28.
//  Copyright © 2015年 Ben. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var url: NSTextField!

    @IBOutlet weak var http_go: NSButton!
    @IBOutlet weak var show: NSScrollView!
    
    @IBOutlet var show_content: NSTextView!
    @IBAction func go(sender: NSButton) {
        print( url.attributedStringValue.string)
        httpGet(url.attributedStringValue.string)
    }
    
    func httpGet(uri:String){
        let nsurl:NSURL!=NSURL(string: uri)
        
        
        let config :NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: config)
        

        let task:NSURLSessionDataTask = session.dataTaskWithURL(nsurl) { (data, response, error) -> Void in
            print(NSString(data:data!, encoding:NSUTF8StringEncoding))
            print(response)
          
            print(error)
            
            dispatch_async(dispatch_get_main_queue(), {
                 self.show_content.insertText(response!.description)
            })
            
        }
        task.resume()
    }
}

