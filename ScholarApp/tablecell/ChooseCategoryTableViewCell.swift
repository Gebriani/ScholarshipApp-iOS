//
//  ChooseCategoryTableViewCell.swift
//  ScholarApp
//
//  Created by Gebriani on 10/21/18.
//  Copyright © 2018 Gebriani. All rights reserved.
//

import UIKit

class ChooseCategoryTableViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryButton.layer.cornerRadius = 15
        categoryButton.layer.borderWidth = 1
        categoryButton.layer.borderColor = UIColor.darkGray.cgColor
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if categoryButton.backgroundColor == UIColor.cyan {
            categoryButton.backgroundColor = UIColor.white
            categoryButton.layer.borderColor = UIColor.darkGray.cgColor
            categoryButton.setTitleColor(UIColor.gray, for: .normal)
        } else {
            categoryButton.backgroundColor = UIColor.cyan
            categoryButton.layer.borderColor = UIColor.cyan.cgColor
            categoryButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
}
