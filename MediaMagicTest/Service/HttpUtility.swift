//
//  HttpUtility.swift
//  MediaMagicTest
//
//  Created by Mayur Rangari on 27/08/20.
//  Copyright © 2020 Mayur Rangari. All rights reserved.
//

import Foundation
import UIKit

struct HttpUtility {
    func getApiData<T: Decodable>(requestUrl: String, resultType: T.Type, completionHandler:@escaping(_ result: T) -> Void) {
        if Common.verifyUrl(urlString: requestUrl) {
            
            if let requestApiUrl = URL(string: requestUrl) {
                URLSession.shared.dataTask(with: requestApiUrl) { responseData, httpUrlResponse, error in
                    if error == nil && httpUrlResponse != nil {
                        if let responseData = responseData {
                            if let dataString = String(data: responseData, encoding: .isoLatin1) {
                                let jsonData = dataString.data(using: .utf8)!
                                let decoder = JSONDecoder()
                                do {
                                    let result = try decoder.decode(T.self, from: jsonData)
                                    _ = completionHandler(result)
                                }
                                catch let error {
                                    debugPrint(error.localizedDescription)
                                }
                            }
                        }
                    }
                }
                .resume()
            }
        }
    }
}
