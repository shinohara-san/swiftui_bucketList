//
//  MKPointAnnotation-Codable.swift
//  BucketList
//
//  Created by Yuki Shinohara on 2020/04/13.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation
import MapKit

class CodableMKPointAnnotation: MKPointAnnotation, Codable {
//    CodableMKPointAnnotation is a subclass of MKPointAnnotation
    enum CodingKeys: CodingKey {
        case title, subtitle, latitude, longitude
    }

    override init() {
        super.init()  //MKPointAnnotationを引き継いでる
    }
        
     public required init(from decoder: Decoder) throws {
            super.init()

            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(String.self, forKey: .title)
            subtitle = try container.decode(String.self, forKey: .subtitle)

            let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
            let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
            coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(title, forKey: .title)
            try container.encode(subtitle, forKey: .subtitle)
            try container.encode(coordinate.latitude, forKey: .latitude)
            try container.encode(coordinate.longitude, forKey: .longitude)
        }
    }

