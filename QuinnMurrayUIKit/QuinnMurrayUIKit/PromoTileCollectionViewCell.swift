//
//  PromoTileCollectionViewCell.swift
//  QuinnMurrayUIKit
//
//  Created by Jon Sweeney on 6/10/22.
//

import UIKit

class PromoTileCollectionViewCell: UICollectionViewCell {
    static let identifier = "PromoTileCollectionViewCell"
    
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    func configure(with viewModel: PromoTileCollectionCellViewModel) {
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
    }
}
