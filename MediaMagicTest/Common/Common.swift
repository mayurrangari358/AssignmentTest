//
//  Common.swift
//  MediaMagicTest
//
//  Created by Mayur Rangari on 27/08/20.
//  Copyright © 2020 Mayur Rangari. All rights reserved.
//

import Foundation
import UIKit

struct Common {
    static func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}
