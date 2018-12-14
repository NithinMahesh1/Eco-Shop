//
//  ProductsTableViewController.swift
//  GoodAsOldPhones
//
//

import UIKit

class ProductsTableViewController: UITableViewController {
  private var products: [Product]?
  private let identifer = "productCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    products = [
      Product(name: "Coola Hair and Scalp Treatment", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
      Product(name: "Go Green Skin Care", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
      Product(name: "BCG Renewal T-Shirt", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
      Product(name: "Lush Christmas Bath Bomb", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
    ]
  }


  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showProduct" {
      if let cell = sender as? UITableViewCell,
        let indexPath = tableView.indexPath(for: cell),
        let productVC = segue.destination as? ProductViewController {
        productVC.product = products?[indexPath.row]
      }
    }
  }
}


extension ProductsTableViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int
    {
        return products?.count ?? 0
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath)
        guard let products = products else { return cell }

        cell.textLabel?.text = products[indexPath.row].name

        if let imageName = products[indexPath.row].cellImageName {
            cell.imageView?.image = UIImage(named: imageName)
        }

        return cell;
    }
}
