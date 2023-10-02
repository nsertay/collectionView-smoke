//
//  APIManagerTests.swift
//  collectionViewTests
//
//  Created by Nurmukhanbet Sertay on 02.10.2023.
//

import XCTest

class APIManagerTests: XCTestCase {

    var apiManager: APIManager!

    override func setUp() {
        super.setUp()
        apiManager = APIManager()
    }

    func testLoadImages() {
        let expectation = XCTestExpectation(description: "Load image from API")

        apiManager.loadImages(id: 1) { image in
            XCTAssertNotNil(image, "Image should not be nil")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadImagesWithNetworkError() {
        let expectation = XCTestExpectation(description: "Load image with network error")
        
        // Use a URL that does not exist or simulate a network error
        let invalidURLString = "https://example.com/invalidimage.jpg"
        
        apiManager.loadImages(id: 1) { image in
            XCTAssertNil(image, "Image should be nil due to network error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadImageContent() {
        let expectation = XCTestExpectation(description: "Load image content from URL")
        let imageURLString = "https://example.com/testimage.jpg" // Replace with a valid image URL

        apiManager.loadImageContent(url: imageURLString) { image in
            XCTAssertNotNil(image, "Image should not be nil")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    
    func testCollectionViewCellForItemAt() {
        // Assuming you have ImageCell and configure method correctly set up
        let indexPath = IndexPath(item: 0, section: 0)
        let cell = viewController.collectionView(viewController.collectionView, cellForItemAt: indexPath) as! ImageCell
        
        // You can assert here based on the configuration of the cell
        XCTAssertNotNil(cell.imageView.image, "Image should not be nil in the cell")
    }
    
    func testCollectionViewNumberOfItems() {
        let itemCount = viewController.collectionView(viewController.collectionView, numberOfItemsInSection: 0)
        
        XCTAssertEqual(itemCount, viewController.images.count, "Number of items in collectionView should match the number of images")
    }

    // Add more tests as needed for other functions and scenarios
}
