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
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            return
        case .Denied, .Restricted:
            print("Location access denied.")
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func addAnnotations(annotations: [Annotation]) {
        mapView?.addAnnotations(annotations)
    }


}
extension ViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation: MKAnnotation, calloutAccessoryControlTapped control: UIControl) -> MKAnnotationView? {
        
        if viewForAnnotation is MKUserLocation {
            return nil
        }
        else {
            let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("annotationView") ?? MKAnnotationView()
            
            let rightButton = UIButton(type: .DetailDisclosure)
            annotationView.rightCalloutAccessoryView = rightButton
            rightButton.addTarget(self, action: #selector(ViewController.buttonPressed(_:)) , forControlEvents: .TouchUpInside)
            annotationView.userInteractionEnabled = true
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "location icon")
            
            
            if control == annotationView.rightCalloutAccessoryView{
                print(annotationView.annotation!.title) // your annotation's title
                //Perform a segue here to navigate to another viewcontroller
                self.performSegueWithIdentifier("yourSegue", sender: rightButton)
            }
            
            
            return annotationView
        }
    }
    
    func buttonPressed(sender: UIButton!) {
        print("hello")
    }
}

