//
//  ImageDetailController.swift
//  MediaMagicTest
//
//  Created by Mayur Rangari on 29/08/20.
//  Copyright © 2020 Mayur Rangari. All rights reserved.
//

import UIKit

class ImageDetailController: UIViewController {
    
        let img: LazyImageView = {
        let imgView = LazyImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = .lightGray
        return imgView
    }()
    
        let titleLable: UILabel = {
        let lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return lblTitle
    }()
    var fileName : String?
    var tLable : String?


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
        self.titleLable.text = tLable
        let url = "\( Constants.imgURL)" + "\(fileName ?? "")"
        img.loadImage(fromurl: URL(string: url)!, placeholderImage: "no_image")
    }
    
    func setUpConstraints(){
        self.view.addSubview(img)
        self.view.addSubview(titleLable)
        
        img.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        img.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        img.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        img.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
        titleLable.topAnchor.constraint(equalTo: img.bottomAnchor,constant: 10).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        titleLable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
