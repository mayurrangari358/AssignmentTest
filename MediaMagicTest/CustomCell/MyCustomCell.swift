//
//  MyCustomCell.swift
//  MediaMagicTest
//
//  Created by Mayur Rangari on 29/08/20.
//  Copyright © 2020 Mayur Rangari. All rights reserved.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
    
        let img: LazyImageView = {
        let iv = LazyImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
  
        let title: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textAlignment = .center
        tl.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return tl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(img)
        contentView.addSubview(title)
        
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        
        title.topAnchor.constraint(equalTo: img.bottomAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
