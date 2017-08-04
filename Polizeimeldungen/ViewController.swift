//
//  ViewController.swift
//  Polizeimeldungen
//
//  Created by Philipp Matthes on 02.08.17.
//  Copyright © 2017 Philipp Matthes. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var annotationParser = AnnotationParser()
    var receiver = Receiver()
    
    // let places = locationParser.getLocations()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAccess()
        mapView?.showsUserLocation = true
        mapView?.delegate = self
        addAnnotations(annotationParser.getAnnotations(receiver.getData()))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
        case .denied, .restricted:
            print("Location access denied.")
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func addAnnotations(_ annotations: [Annotation]) {
        mapView?.addAnnotations(annotations)
    }


}
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewForAnnotation: MKAnnotation, calloutAccessoryControlTapped control: UIControl) -> MKAnnotationView? {
        
        if viewForAnnotation is MKUserLocation {
            return nil
        }
        else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            
            let rightButton = UIButton(type: .detailDisclosure)
            annotationView.rightCalloutAccessoryView = rightButton
            rightButton.addTarget(self, action: #selector(ViewController.buttonPressed(_:)) , for: .touchUpInside)
            annotationView.isUserInteractionEnabled = true
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "location icon")
            
            
            if control == annotationView.rightCalloutAccessoryView{
                print(annotationView.annotation!.title) // your annotation's title
                //Perform a segue here to navigate to another viewcontroller
                self.performSegue(withIdentifier: "yourSegue", sender: rightButton)
            }
            
            
            return annotationView
        }
    }
    
    func buttonPressed(_ sender: UIButton!) {
        print("hello")
    }
}

