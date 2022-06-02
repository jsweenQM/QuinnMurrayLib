//
//  ViewController.swift
//  QuinnMurrayUIKit
//
//  Created by Jon Sweeney on 5/26/22.
//

import UIKit
import QuinnMurrayLib

class ViewController: UIViewController {

    var products = [ProductElement]()
    let client = QuinnV2Client()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        client.getAllProducts { result in
            switch result {
            case .success(let products):
                if let products = products {
                    print("success!")
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
                switch error {
                case .badUrl:
                    print("Bad URL")
                case .noData:
                    print("No data found")
                case .decodingError:
                    print("Error decoding products")
                }
            }
        }
    }
}

