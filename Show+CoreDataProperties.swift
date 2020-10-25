//
//  Show+CoreDataProperties.swift
//  Showfer
//
//  Created by Dj Walker-Morgan on 16/10/2020.
//
//

import Foundation
import CoreData


extension Show {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Show> {
        return NSFetchRequest<Show>(entityName: "Show")
    }

    @NSManaged public var episode: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var platform: String
    @NSManaged public var season: Int16

    var showPlatform: Platform {
           set {
               platform = newValue.rawValue
           }
           get {
               Platform(rawValue: platform) ?? .Other
           }
       }
}

extension Show : Identifiable {

}

enum Platform: String, Equatable, CaseIterable {
    case Other = "Other"
    case Netflix = "Netflix"
    case Amazon = "Amazon"
    case Sky = "Sky"
    
    var name: String {
           return "\(self)".map {
               $0.isUppercase ? " \($0)" : "\($0)" }.joined().capitalized
       }
}
