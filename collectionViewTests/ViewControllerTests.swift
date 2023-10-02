//
//  ViewControllerTests.swift
//  collectionViewTests
//
//  Created by Nurmukhanbet Sertay on 02.10.2023.
//

import XCTest
@testable import collectionView

class ViewControllerTests: XCTestCase {

    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = ViewController()
    }

    func testLoadImages() {
        // Create a mock APIManager
        let mockAPIManager = MockAPIManager()
        viewController.apiManager = mockAPIManager

        // Define your test image IDs and expectations
        let imageIDs = [1, 2, 3]

        // Call the loadImages function
        viewController.loadImages(imageIDs: imageIDs)

        // Assert that the images array should contain the same number of images as the imageIDs
        XCTAssertEqual(viewController.images.count, imageIDs.count)

        // Assert that the collectionView should be reloaded after images are loaded
        XCTAssertTrue(mockAPIManager.loadImagesCalled)
    }

    // Add more tests as needed for other functions and scenarios
}
