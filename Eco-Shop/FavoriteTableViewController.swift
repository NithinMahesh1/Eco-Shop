//
//  FavoriteTableViewController.swift
//  Eco-Shop
//
//  Created by Apoorva Karpurapu on 12/19/18.
//  Copyright © 2018 Code School. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    private var favoritesrec: [Product]?
    private var favoritesbio: [Product]?
    private let identifer = "productCell"
    
    var favs: Array<String>?
    
    
    
    func someMethod(cell:UITableViewCell)
    {
        guard let indexPath =  tableView.indexPath(for: cell)
            else
        {
            return
        }
      
        if favoritesbio!.count > 0 && favoritesrec!.count > 0
        {
            
            if(indexPath.section == 0 )
            {
              
                var path = NSInteger()
                
                for index in 0 ..< Int (products!.count)
                {
                    if(products![index].name == favoritesrec![indexPath.row].name)
                    {
                        path = index;
                        break;
                    }
                }
                
                
                let product = products?[path]
                print(product?.name)
                
                
                products![path].hasFavorited = !(product?.hasFavorited)!
                print(products![path].hasFavorited)
                
                var favs = UserDefaults.standard.array(forKey: "FAVs")
                if favs == nil
                {
                    favs = [String]()
                }
                
                if products![path].hasFavorited == true
                {
                    favs?.append(product?.name)
                }
                else
                {
                    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle  , forRowAt: IndexPath)
                    {
                        if editingStyle == .delete
                        {
                            favs?.remove(at: indexPath.row)
                            tableView.deleteRows(at: [indexPath], with: .fade)
                        }
                    }
                }
                
                UserDefaults.standard.setValue(favs, forKeyPath: "FAVs")
                
                
                //     tableView.reloadRows(at: [indexPath], with: .fade)
                
                
                
                
                
            }
            else
            {
                
                
                var path = NSInteger()
                
                for index in 0 ..< Int (Biodegradable!.count)
                {
                    if(Biodegradable![index].name == favoritesbio![indexPath.row].name)
                    {
                        path = index;
                        break;
                    }
                }
                
                let product = Biodegradable?[path]
                print(product?.name as Any)
                
                
                Biodegradable![path].hasFavorited = !(product?.hasFavorited)!
                print(Biodegradable![path].hasFavorited)
                
                var favs = UserDefaults.standard.array(forKey: "FAVs")
                if favs == nil{
                    favs = [String]()
                }
                
                if Biodegradable![path].hasFavorited == true
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
                
                
                //  tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        else if (favoritesbio!.count > 0)
        {
            
            var path = NSInteger()
            
            for index in 0 ..< Int (Biodegradable!.count)
            {
                if(Biodegradable![index].name == favoritesbio![indexPath.row].name)
                {
                    path = index;
                    break;
                }
            }
            
            let product = Biodegradable?[path]
            print(product?.name as Any)
            
            
            Biodegradable![path].hasFavorited = !(product?.hasFavorited)!
            print(Biodegradable![path].hasFavorited)
            
            var favs = UserDefaults.standard.array(forKey: "FAVs")
            if favs == nil{
                favs = [String]()
            }
            
            if Biodegradable![path].hasFavorited == true
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
        }
        else if (favoritesrec!.count > 0)
        {
          
            var path = NSInteger()
            
            for index in 0 ..< Int (products!.count)
            {
                if(products![index].name == favoritesrec![indexPath.row].name)
                {
                    path = index;
                    break;
                }
            }
            
            
            let product = products?[path]
            print(product?.name)
            
            
            products![path].hasFavorited = !(product?.hasFavorited)!
            print(products![path].hasFavorited)
            
            var favs = UserDefaults.standard.array(forKey: "FAVs")
            if favs == nil
            {
                favs = [String]()
            }
            
            if products![path].hasFavorited == true
            {
                favs?.append(product?.name)
            }
            else
            {
                func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle  , forRowAt: IndexPath)
                {
                    if editingStyle == .delete
                    {
                        favs?.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                }
            }
            
            UserDefaults.standard.setValue(favs, forKeyPath: "FAVs")
        }
       
        
        
        self.viewWillAppear(false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.image = UIImage(named: "Favorites")?.withRenderingMode(.alwaysOriginal)
        
    
        
//        products = [
//
//            Product(name: "Coola Hair and Scalp Treatment", hasFavorited: false, cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1", uiColor: .white),
//            Product(name: "Go Green Skin Care", hasFavorited: false, cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2", uiColor: .white),
//            Product(name: "BCG Renewal T-Shirt", hasFavorited: false, cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3", uiColor: .white),
//            Product(name: "Lush Christmas Bath Bomb", hasFavorited: false, cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4", uiColor: .white),
//        ]
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: identifer)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //view.addSubview(scrollVieW)
    }
    override func viewWillAppear(_ animated: Bool) {
        print("Contact view will appear")
        favs = UserDefaults.standard.array(forKey: "FAVs") as? Array<String>
        if favs == nil
        {
            favs = [String]()
        }
        
        favoritesrec = []
        favoritesbio = []
        
       
        
        for index in 0 ..< Int (products!.count) {
            if(products![index].hasFavorited == true) {
                favoritesrec?.append(products![index])
            }
        }
        
        for index in 0 ..< Int (Biodegradable!.count) {
            if(Biodegradable![index].hasFavorited == true) {
                favoritesbio?.append(Biodegradable![index])
            }
        }
        
        
        tableView.reloadData()
    }
    // MARK: - Table view data source
    override func viewDidAppear(_ animated: Bool) {
        print("Contact will appear")
    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // #warning Incomplete implementation, return the number of rows
////        return 0
////    }
    
}
    
    extension FavoriteTableViewController {
        override func numberOfSections(in tableView: UITableView) -> Int
        {
            
            if favoritesbio!.count > 0 && favoritesrec!.count > 0
            {
                     return 2
            }
       
            else
            {
                return 1
            }
            
         
        }
        

      
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            if favoritesbio!.count > 0 && favoritesrec!.count > 0
            {
                if(section == 0)
                {
                    return "Recycable Products"
                }
                return "Bio-Degradable Products"
            }
            else if (favoritesbio!.count > 0)
            {
                 return "Bio-Degradable Products"
            }
            else if (favoritesrec!.count > 0)
            {
                return "Recycable Products"
            }
            else
            {
                return "";
            }
            
            
            
        }
        
        override func tableView(_ tableView: UITableView,
                                numberOfRowsInSection section: Int) -> Int
        {
//            return products?.count ?? 0
         
            if(products?.count == 0)
            {
                return 0
            }
            
            if favoritesbio!.count > 0 && favoritesrec!.count > 0
            {
                if(section == 0)
                {
                    return favoritesrec!.count
                }
                else
                {
                    return favoritesbio!.count
                }
            }
            else if (favoritesbio!.count > 0)
            {
                return favoritesbio!.count
            }
            else if (favoritesrec!.count > 0)
            {
            return favoritesrec!.count
            }
            else
            {
                return 0;
            }
            
            
            
            
        }
        
//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            var selectedItem = indexPath
//            print (selectedItem.row)
//            let segueIdentifier: String
//            switch indexPath.row {
//            case 0:
//                segueIdentifier = "Show5"
//                //        case 4:
//            //            segueIdentifier = "ShowRing"
//            default:
//                segueIdentifier = "Show5"
//            }
//            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        
//        }
        
        override func tableView(_ tableView: UITableView,
                                cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            

            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath) as! ContactCell
            cell.link1 = self
            
            
            if favoritesbio!.count > 0 && favoritesrec!.count > 0
            {
                if indexPath.section == 0
                {
                    guard let favorites = favoritesrec else { return cell }
                    let fav = favorites[indexPath.row]
                    
                    cell.textLabel?.text = fav.name
                    cell.accessoryView?.tintColor = fav.hasFavorited ? UIColor.red : .lightGray
                    
                    if let imageName = favorites[indexPath.row].cellImageName
                    {
                        cell.imageView?.image = UIImage(named: imageName)
                    }
                    
                }
                else
                {
                    guard let products = favoritesbio else { return cell }
                    let product = products[indexPath.row]
                    
                    cell.textLabel?.text = product.name
                    cell.accessoryView?.tintColor = product.hasFavorited ? UIColor.red : .lightGray
                    
                    if let imageName = products[indexPath.row].cellImageName {
                        cell.imageView?.image = UIImage(named: imageName)
                    }
                }
                
                
                
                
            }
            
            else if (favoritesbio!.count > 0)
            {
                guard let products = favoritesbio else { return cell }
                let product = products[indexPath.row]
                
                cell.textLabel?.text = product.name
                cell.accessoryView?.tintColor = product.hasFavorited ? UIColor.red : .lightGray
                
                if let imageName = products[indexPath.row].cellImageName {
                    cell.imageView?.image = UIImage(named: imageName)
                }
                
                
            }
            else if (favoritesrec!.count > 0)
            {
                
                guard let favorites = favoritesrec else { return cell }
                let fav = favorites[indexPath.row]
                
                cell.textLabel?.text = fav.name
                cell.accessoryView?.tintColor = fav.hasFavorited ? UIColor.red : .lightGray
                
                if let imageName = favorites[indexPath.row].cellImageName
                {
                    cell.imageView?.image = UIImage(named: imageName)
                }
                
            }
            
           
            
            
            
            
            return cell;
        }
    }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


