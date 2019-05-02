//
//  People+CoreDataProperties.swift
//  SavingCoreData
//
//  Created by Hoang Anh Tuan on 3/11/19.
//  Copyright © 2019 Hoang Anh Tuan. All rights reserved.
//
//

import Foundation
import CoreData


extension People {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<People> {
        return NSFetchRequest<People>(entityName: "People")
    }

    @NSManaged public var name: String?
    @NSManaged public var pet: NSSet?

}

// MARK: Generated accessors for pet
extension People {

    @objc(addPetObject:)
    @NSManaged public func addToPet(_ value: Pet)

    @objc(removePetObject:)
    @NSManaged public func removeFromPet(_ value: Pet)

    @objc(addPet:)
    @NSManaged public func addToPet(_ values: NSSet)

    @objc(removePet:)
    @NSManaged public func removeFromPet(_ values: NSSet)

}
