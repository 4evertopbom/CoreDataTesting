//
//  Pet+CoreDataProperties.swift
//  SavingCoreData
//
//  Created by Hoang Anh Tuan on 3/11/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var type: String?
    @NSManaged public var name: String?
    @NSManaged public var owner: People?

}
