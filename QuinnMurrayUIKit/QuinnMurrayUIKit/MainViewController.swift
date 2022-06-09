//
//  MainViewController.swift
//  QuinnMurrayUIKit
//
//  Created by Jon Sweeney on 5/26/22.
//

import UIKit
import QuinnMurrayLib

class MainViewController: UIViewController {
    
    @IBAction func viewPromo() {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        navigationController?.pushViewController(vc, animated: true)
    }

    var allProducts = [ProductElement]()
    let client = QuinnV2Client()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    private func setUp() {
        client.getAllProducts { result in
            switch result {
            case .success(let products):
                if let products = products {
                    print("success!")
                    self.allProducts = products
                    print(self.allProducts.count)
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

