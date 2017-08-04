//
//  LocationParser.swift
//  Polizeimeldungen
//
//  Created by Philipp Matthes on 02.08.17.
//  Copyright © 2017 Philipp Matthes. All rights reserved.
//

import Foundation
import MapKit

class AnnotationParser {
    // longitude, latitude, title, subtitle
    func getAnnotations(_ data: [(Double,Double,String,String)]) -> [Annotation]{
        
        var output = [Annotation]()
        
        for entry in data {
            print(entry.0, entry.1, entry.2, entry.3)
            output.append(Annotation(Coordinate: CLLocationCoordinate2D(latitude:
                entry.0, longitude: entry.1), title: entry.2, subtitle: entry.3))
        }
        
        return output
    }
    
}
