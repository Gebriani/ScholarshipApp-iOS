//
//  CategoryModel.swift
//  ScholarApp
//
//  Created by Gebriani on 10/21/18.
//  Copyright © 2018 Gebriani. All rights reserved.
//

import Foundation

//struct CategoryModel {
//    let id: Int
//    let name: String
//    let slug: String
//    let description_eng: String
//    let description_id: String
//    let created_at:String
//    let updated_at:String
//    let published_at:String
//    let image_url:String
//    var isChecked: Bool
//
//    init(dictionary: CategoryJSON) {
//        self.id = dictionary["id"] as! Int
//        self.name = dictionary["name"] as! String
//        self.slug = dictionary["slug"] as! String
//        self.description_eng = dictionary["description_eng"] as! String
//        self.description_id = dictionary["description_id"] as! String
//        self.created_at = dictionary["created_at"] as! String
//        self.updated_at = dictionary["updated_at"] as! String
//        self.published_at = dictionary["published_at"] as! String
//        self.image_url = dictionary["image_url"] as! String
//        self.isChecked = false
//    }
//
//    mutating func setIsChecked(status: Bool){
//        isChecked = status
//    }
//}

import SwiftyJSON

class CategoryModel {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var slug = ""
    @objc dynamic var description_eng = ""
    @objc dynamic var description_id = ""
    @objc dynamic var created_at = ""
    @objc dynamic var updated_at = ""
    @objc dynamic var published_at = ""
    @objc dynamic var image_url = ""
    @objc dynamic var isChecked = false
    
    init() {
    }
    
    func setData(dictionary: AnyObject) -> CategoryModel{
        let catModel = CategoryModel()
        let temp = JSON(dictionary)
        catModel.id = temp["id"].int!
        catModel.name = temp["name"].string!
        catModel.slug = temp["slug"].string!
        catModel.description_eng = temp["description_eng"].string!
        catModel.description_id = temp["description_id"].string!
        catModel.created_at = temp["created_at"].string!
        catModel.updated_at = temp["updated_at"].string!
        catModel.published_at = temp["published_at"].string!
        catModel.image_url = temp["image_url"].string!
        catModel.isChecked = false
        
        return catModel
    }
    
    
    func setIsChecked(flag: Bool){
        self.isChecked = flag
    }
    
}






















