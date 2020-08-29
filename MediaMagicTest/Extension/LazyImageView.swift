//
//  LazyImageView.swift
//  MediaMagicTest
//
//  Created by Mayur Rangari on 29/08/20.
//  Copyright © 2020 Mayur Rangari. All rights reserved.
//

import Foundation
import UIKit

// MARK:- For Image Cache

class LazyImageView: UIImageView
{
    
    func loadImage(fromurl imageURL: URL, placeholderImage:String){
        self.image = UIImage(named: placeholderImage)
        
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
        
    }
}
