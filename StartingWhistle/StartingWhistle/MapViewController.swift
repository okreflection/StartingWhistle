//
//  MapViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/19/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var latitude : CLLocationDegrees!
    var longitude : CLLocationDegrees!
    var mytitle : String!
    var subtitle : String!
    var span:MKCoordinateSpan!
    
    let latitudeDelt:CLLocationDegrees = 0.01
    let longitudeDelt:CLLocationDegrees = 0.01

    @IBOutlet weak var mapview: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentgame = CurrentGame.sharedInstance
        var game = currentgame.getGame()
        
        latitude = game.getLatitude() as CLLocationDegrees
        longitude = game.getLongitude() as CLLocationDegrees
        mytitle = game.getLoc()
        subtitle = game.getAddr()
        
        span = MKCoordinateSpanMake(latitudeDelt, longitudeDelt)
        var gameloc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(gameloc, span)
        self.mapview.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = gameloc
        annotation.title = mytitle;
        annotation.subtitle = subtitle;
        self.mapview.addAnnotation(annotation)
        self.mapview.zoomEnabled = true
        self.mapview.scrollEnabled = true
        self.mapview.userInteractionEnabled = true
        
        self.navigationController
        
        var b = UIBarButtonItem(title: "Get Direction", style: .Plain, target: self, action: "directionFired")
        self.navigationItem.rightBarButtonItem = b

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func directionFired() {
        let regionDistance:CLLocationDistance = 10000
        var coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        var options = [
            MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
        ]
        var placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        var mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(mytitle)"
        mapItem.openInMapsWithLaunchOptions(options)
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
