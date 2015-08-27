//
//  AddressMapViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/20/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit
import MapKit
import AddressBookUI
import AddressBook

class AddressMapViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate {
    
    let latitudeDelt:CLLocationDegrees = 0.01
    let longitudeDelt:CLLocationDegrees = 0.01
    
    
    @IBOutlet var mySearch: UISearchBar!
    
    @IBOutlet var myMapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mySearch.delegate = self
        self.myMapView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.mySearch.resignFirstResponder()
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.mySearch.text, completionHandler: {(stuff, error)->Void in
            if (error != nil) {
                println("reverse geodcode fail: \(error.localizedDescription)")
                return
            }
            
            if stuff.count > 0 {
                var annotations = [AnyObject]()
                for placemark in stuff {
                    var pm = placemark as! CLPlacemark
                    var annotation = MKPointAnnotation()
                    annotation.coordinate = pm.location.coordinate
                    annotation.title = pm.name
//                    if let street = pm.addressDictionary["Thoroughfare"] as? NSString {
//                        annotation.subtitle = street as String
//                        println(street)
//                    }
                    
                    if let addrList = pm.addressDictionary["FormattedAddressLines"] as? [String] {
                        annotation.subtitle =  join(", ", addrList)
                    }
                    
                    
                    self.myMapView.addAnnotation(annotation)
                    annotations.append(annotation)
                }
                self.myMapView.showAnnotations(annotations, animated: true)

            } else {
                println("No Placemarks!")
                return
            }
            
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
