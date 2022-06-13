//
//  MainViewController.swift
//  QuinnMurrayUIKit
//
//  Created by Jon Sweeney on 5/26/22.
//

import UIKit
import QuinnMurrayLib

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func viewPromo() {
        let vc = UIViewController()
//        vc.view.backgroundColor = .blue
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var allProducts = [ProductElement]()
    let client = QuinnV2Client()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PromoCollectionTableViewCell.self, forCellReuseIdentifier: PromoCollectionTableViewCell.identifier)
        
        return table
    }()
    
    private let viewModels: [PromoCollectionTableViewCellVM] = [
        PromoCollectionTableViewCellVM(viewModels: [
            PromoTileCollectionCellViewModel(name: "Apple", backgroundColor: .systemRed),
            PromoTileCollectionCellViewModel(name: "Banana", backgroundColor: .systemYellow),
            PromoTileCollectionCellViewModel(name: "Orange", backgroundColor: .systemOrange),
            PromoTileCollectionCellViewModel(name: "Watermelon", backgroundColor: .systemGreen)
        ]
      )
    ]
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    // MARK: UITable View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count // Number of Rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PromoCollectionTableViewCell.identifier, for: indexPath) as? PromoCollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
    
    
    // MARK: setUp
    
    private func setUp() {
        
        view.addSubview(tableView)
        let label = UILabel(frame: CGRect(x: 0, y: 300, width: 200, height: 100))
        label.text = "Testing..."
        view.addSubview(label)
        tableView.dataSource = self
        tableView.delegate = self
        
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

extension MainViewController: PromoCollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: PromoTileCollectionCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "Hooray", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}
