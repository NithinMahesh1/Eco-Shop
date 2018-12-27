//
//  ViewController.swift
//  Eco-Shop
//
//


import UIKit
var storeFav = [UILabel]()

class ProductViewController: UIViewController {

  @IBOutlet var productImageView: UIImageView!
  @IBOutlet var productNameLabel: UILabel!
  
  var product: Product?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    productNameLabel.text = product?.name
    
    if let imageName = product?.fullscreenImageName {
      productImageView.image = UIImage(named: imageName)
    }
  }
    
   
    
   
    
    @IBAction func addToFavorites( sender: AnyObject) {
    print("Add to favorites successfully")
  }
    
}
