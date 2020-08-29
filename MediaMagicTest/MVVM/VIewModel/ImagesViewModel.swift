//
//  ImagesViewModel.swift
//  MediaMagicTest
//
//  Created by Mayur Rangari on 27/08/20.
//  Copyright © 2020 Mayur Rangari. All rights reserved.
//

import Foundation
class ImagesViewModel {
    var httpUtility = HttpUtility()
    var imageList: [ImagesModel]?

    typealias ComplitionBlock = ([ImagesModel], Bool) -> Void
    func getDataFromApi(apiUrl: String, complitionBlock:@escaping (ComplitionBlock)) {
        if Reachability.isConnectedToNetwork() {
            // make api call
            httpUtility.getApiData(requestUrl: Constants.apiString, resultType: [ImagesModel].self) { canadaResponse in
                self.imageList = canadaResponse
                print(self.imageList!)
                complitionBlock(canadaResponse, true)
            }
        }
        else {
            complitionBlock([ImagesModel(author: nil, id: nil, filename: nil)], false)
        }
    }
    func getNumberOfRows() -> Int {
        imageList?.count ?? 0
    }
}
