//
//  ViewController.swift
//  ScholarApp
//
//  Created by Gebriani on 10/21/18.
//  Copyright © 2018 Gebriani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var doneButton: UIButton!
    
    var categoryList: [CategoryModel] = []
    var choosedCategory: [CategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        categoryCollection.register(UINib.init(nibName: "ChooseCategoryTableViewCell", bundle: nil), forCellWithReuseIdentifier: "ChooseCategoryTableViewCell")
        doneButton.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        
        Alamofire.request("https://private-90552-schoterspersonal.apiary-mock.com/categories").responseData{ (resdata) -> Void in
            if (resdata.result.value != nil){
                let swiftyjson = JSON(resdata.result.value)
                for dict in swiftyjson {
                    let res = CategoryModel().setData(dictionary: dict.1 as AnyObject)
                    self.categoryList.append(res)
                }
                self.categoryCollection.reloadData()
                
            }
            
        }
        
    }
    
    @objc func goToNextPage(){
        if categoryList.count != 0 {
            for cat in categoryList {
                if cat.isChecked {
                    choosedCategory.append(cat)
                }
            }
        }
        
        if choosedCategory.count > 5 {
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize  {
        return CGSize(width: 100.0, height: CGFloat(40.0))
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categoryList != nil && categoryList.count != 0 {
            return categoryList.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseCategoryTableViewCell", for: indexPath) as! ChooseCategoryTableViewCell
        
        let cat = categoryList[indexPath.row]
        cell.categoryButton.setTitle(cat.name, for: .normal)
        if cat.isChecked {
            cell.categoryButton.setTitleColor(UIColor.white, for: .normal)
            cell.categoryButton.layer.backgroundColor = UIColor.cyan.cgColor
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = categoryList[indexPath.row]
        if cat.isChecked {
            cat.setIsChecked(flag: false)
        } else {
            cat.setIsChecked(flag: true)
        }
    }
    
    
    
    
}

