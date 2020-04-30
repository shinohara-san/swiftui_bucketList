//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Yuki Shinohara on 2020/04/12.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }

        set {
            title = newValue
        }
    }

    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }

        set {
            subtitle = newValue
        }
    }
}
