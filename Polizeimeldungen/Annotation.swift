//
//  Location.swift
//  Polizeimeldungen
//
//  Created by Philipp Matthes on 02.08.17.
//  Copyright © 2017 Philipp Matthes. All rights reserved.
//

import Foundation
import MapKit

class Annotation: NSObject{
    
    var myCoordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(Coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.myCoordinate = Coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    var coordinate: CLLocationCoordinate2D {
        return myCoordinate
    }
    
}

extension Annotation: MKAnnotation {}

