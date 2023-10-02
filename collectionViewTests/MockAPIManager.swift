//
//  MockAPIManager.swift
//  collectionViewTests
//
//  Created by Nurmukhanbet Sertay on 02.10.2023.
//

import XCTest

class MockAPIManager: APIManager {
    var loadImagesCalled = false

    override func loadImages(id: Int, completion: @escaping (UIImage?) -> ()) {
        // Simulate loading an image and call the completion handler
        let image = UIImage(named: "testImage")
        completion(image)

        // Set the flag to indicate that loadImages was called
        loadImagesCalled = true
    }
}
