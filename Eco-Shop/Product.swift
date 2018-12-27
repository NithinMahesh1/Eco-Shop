//
//  Product.swift
//  Eco-Shop
//
//

import UIKit
import Foundation

class Product {
  var name: String?
  var hasFavorited: Bool
  var cellImageName: String?
  var fullscreenImageName: String?
 // var uiColor: UIColor?
    
    init(name: String, hasFavorited: Bool, cellImageName: String, fullscreenImageName: String, uiColor: UIColor) {
    self.name = name
    self.hasFavorited = hasFavorited
    self.cellImageName = cellImageName
    self.fullscreenImageName = fullscreenImageName
    //self.uiColor = uiColor
  }
}
