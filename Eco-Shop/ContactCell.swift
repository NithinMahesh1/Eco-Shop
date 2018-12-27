//
//  ContactCell.swift
//  GoodAsOldPhones
//
//  Created by Apoorva Karpurapu on 12/14/18.
//

import UIKit

class ContactCell: UITableViewCell {
    var link : ProductsTableViewController?
    var link1 : FavoriteTableViewController?

    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let starButton = UIButton(type: .system)
        var image: UIImage = UIImage(named: "star")!
    
        starButton.setImage(image, for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        starButton.tintColor = .green
        starButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = starButton

    }
    @objc private func handleMarkAsFavorite()
    {
        print("print as favorite")
        link?.someMethod(cell: self)
        link1?.someMethod(cell: self)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
}
