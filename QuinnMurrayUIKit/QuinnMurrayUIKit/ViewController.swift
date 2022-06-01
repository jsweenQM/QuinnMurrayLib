//
//  ViewController.swift
//  QuinnMurrayUIKit
//
//  Created by Jon Sweeney on 5/26/22.
//

import UIKit
import QuinnMurrayLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("In View Did Load")
        let client = QuinnV2Client.init()
        client.getAllProducts { result in
            print("hello world")
        }
    }
}

