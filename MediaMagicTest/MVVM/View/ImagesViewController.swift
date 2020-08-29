//
//  ImagesViewController.swift
//  MediaMagicTest
//
//  Created by Mayur Rangari on 27/08/20.
//  Copyright © 2020 Mayur Rangari. All rights reserved.
//

import Foundation
import UIKit

class ImagesViewController: UIViewController {
    var imagesViewModel = ImagesViewModel()
    var imagesList: [ImagesModel]?
    let child = SpinnerViewController()
    private let itemsPerRow: CGFloat = 2
    private let sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MyCustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .white
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lorem Picsum"
        setupView()
        retrieveDataFromApi()
    }
    
    func setupView(){
        view.addSubview(collectionView)
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupConstraints(){
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
    
    // MARK: - Api Call
    func retrieveDataFromApi() {
        self.loadSpinnerView()
        imagesViewModel.getDataFromApi(apiUrl: Constants.apiString) { response, status in
            if status {
                self.imagesList = response
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.removeSpinnerView()
                    self.collectionView.reloadData()
                }
            }
            else {
                self.presentSingleButtonDialog()
            }
        }
    }
}


extension ImagesViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesViewModel.getNumberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCustomCell
        let model = self.imagesList?[indexPath.row]
        let url = "\( Constants.imgURL)" + "\(model?.filename ?? "")"
        cell.img.loadImage(fromurl: URL(string: url)!, placeholderImage: "no_image")
        cell.title.text = "\(model?.author ?? "")"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = story.instantiateViewController(withIdentifier: "ImageDetailController") as! ImageDetailController
        let model = self.imagesList?[indexPath.row]
        let fileName = model?.filename
        detailVC.tLable = "\(model?.author ?? "")"
        detailVC.fileName = fileName
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInset.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 150)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
}



