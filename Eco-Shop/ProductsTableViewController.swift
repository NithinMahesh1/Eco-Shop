///Users/apoorvakarpurapu/Desktop/Eco-Shop 6/Eco-Shop/ContactViewController.swift
//  ProductsTableViewController.swift
//  Eco-Shop
//
//

import UIKit

var products: [Product]?
var Biodegradable: [Product]?
var product: Product?

class ProductsTableViewController: UITableViewController {
  
  private let identifer = "productCell"
  let cellId = "cell12123"
   
    func someMethod(cell:UITableViewCell){
        guard let indexPath =  tableView.indexPath(for: cell) else {
            return
        }
//      print(indexPath)
        if(indexPath.section == 0 ){
            product = products?[indexPath.row]
            print(product?.name)
            
            
            products![indexPath.row].hasFavorited = !(product?.hasFavorited)!
            print(products![indexPath.row].hasFavorited)
            
            var favs = UserDefaults.standard.array(forKey: "FAVs")
            if favs == nil
            {
                favs = [String]()
            }
            
            if products![indexPath.row].hasFavorited == true
            {
                favs?.append(product?.name)
            }
            else{
                func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle  , forRowAt: IndexPath) {
                    if editingStyle == .delete{
                        favs?.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                    
                    
                }
            }
            
            UserDefaults.standard.setValue(favs, forKeyPath: "FAVs")
            
            
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        else{
            product = Biodegradable?[indexPath.row]
            print(product?.name as Any)
            
            
            Biodegradable![indexPath.row].hasFavorited = !(product?.hasFavorited)!
            print(Biodegradable![indexPath.row].hasFavorited)
            
            var favs = UserDefaults.standard.array(forKey: "FAVs")
            if favs == nil{
                favs = [String]()
            }
            
            if Biodegradable![indexPath.row].hasFavorited == true
            {
                favs?.append(product!.name as Any)
            }
            else{
                func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle  , forRowAt: IndexPath) {
                    if editingStyle == .delete{
                        favs?.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                    
                    
                }
            }
            
            UserDefaults.standard.setValue(favs, forKeyPath: "FAVs")
            
            
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
    }
  
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    products = [
        Product(name: "Coola Hair and Scalp Treatment", hasFavorited: false, cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1", uiColor: .white),
      Product(name: "Go Green Skin Care", hasFavorited: false, cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2", uiColor: .white),
//      Product(name: "Recycleable Products", hasFavorited: false, cellImageName: "image-5", fullscreenImageName: "image-5", uiColor: .red),
      Product(name: "BCG Renewal T-Shirt", hasFavorited: false, cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3", uiColor: .white),
      Product(name: "Lush Christmas Bath Bomb", hasFavorited: false, cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4", uiColor: .white),
    ]
        
        Biodegradable = [
            Product(name: "Do Amore Rings", hasFavorited: false, cellImageName: "Ring", fullscreenImageName: "phone-fullscreen1", uiColor: .white),
            Product(name: "Wool FootWear", hasFavorited: false, cellImageName: "HighMan", fullscreenImageName: "HighMan", uiColor: .white),
        ]
        
    tableView.register(ContactCell.self, forCellReuseIdentifier: identifer)
  }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
    tableView.reloadData()
    }
    
    

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showProduct" {
      if let cell = sender as? UITableViewCell,
        let indexPath = tableView.indexPath(for: cell),
        let productVC = segue.destination as? ProductViewController {
        let section = indexPath.section
        if section == 0{
            productVC.product = products?[indexPath.row]
        }
        else{
            productVC.product = Biodegradable?[indexPath.row]
        }
    //    productVC.product = product
      }
    }
  }

    
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedItem = indexPath
        print (selectedItem.row)
        let segueIdentifier: String
        let section = indexPath.section
        if(section == 0){
        switch indexPath.row {
        case 0:
            segueIdentifier = "Show1"
        case 1:
            segueIdentifier = "Show2"
        case 2:
            segueIdentifier = "Show3"
        case 3:
            segueIdentifier = "Show4"
        default:
            segueIdentifier = "Show4"
    }
    }
        else{
            switch indexPath.row {
            case 0:
                segueIdentifier = "Show5"
            case 1:
                segueIdentifier = "Show6"
            default:
                segueIdentifier = "Show5"
            }
    }
    self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}


extension ProductsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
            return "Recycable Products"
        }
        return "Bio-Degradable Products"
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int
    {
        if(section == 0) {
            return products?.count ?? 0
        }
        return Biodegradable?.count ?? 0
    }

//    func tableView(_ tableView: UITableView,
//                            sectionForSectionIndexTitle title: String,
//                            at index: Int) {
//        return
//    }
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
//        var products: Product[]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath) as! ContactCell
        cell.link = self
        if(indexPath.section == 0 )
        {
            guard let products = products else { return cell }
            let product = products[indexPath.row]
            
            cell.textLabel?.text = product.name
            cell.accessoryView?.tintColor = product.hasFavorited ? UIColor.red : .lightGray
            
            if let imageName = products[indexPath.row].cellImageName {
                cell.imageView?.image = UIImage(named: imageName)
            }
        }
        else
        {
            guard let products = Biodegradable else { return cell }
            let product = products[indexPath.row]
            
            cell.textLabel?.text = product.name
            cell.accessoryView?.tintColor = product.hasFavorited ? UIColor.red : .lightGray
            
            if let imageName = products[indexPath.row].cellImageName {
                cell.imageView?.image = UIImage(named: imageName)
            }
        }
//        let product = products![indexPath.row]
//
//        cell.textLabel?.text = product.name
//        cell.accessoryView?.tintColor = product.hasFavorited ? UIColor.red : .lightGray
//
//        if let imageName = products![indexPath.row].cellImageName {
//            cell.imageView?.image = UIImage(named: imageName)
//        }

        return cell;
    }
}
