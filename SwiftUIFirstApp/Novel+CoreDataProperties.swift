//
//  Novel+CoreDataProperties.swift
//  SwiftUIFirstApp
//
//  Created by Станислав Шияновский on 11/3/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//
//

import Foundation
import CoreData


extension Novel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Novel> {
        return NSFetchRequest<Novel>(entityName: "Novel")
    }

    @NSManaged public var rating: String
    @NSManaged public var name: String
    @NSManaged public var author: String

}
