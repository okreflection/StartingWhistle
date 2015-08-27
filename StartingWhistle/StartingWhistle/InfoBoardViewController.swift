//
//  InfoBoardViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/19/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit
import MapKit

class InfoBoardViewController: UIViewController {
    
    var loc : String!
    var date : String!
    var time : String!
    var pids : [Int]!
    var addr : String!
    
    var latitude : CLLocationDegrees!
    var longitude : CLLocationDegrees!
    
    let latitudeDelt:CLLocationDegrees = 0.01
    let longitudeDelt:CLLocationDegrees = 0.01
    
    @IBOutlet weak var locLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var addrLabel: UILabel!
    
    @IBOutlet weak var mymapview: MKMapView!
    
    @IBOutlet weak var mapHolderView: UIView!
    
    let tapRec = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapRec.addTarget(self, action: "tapped")
        mapHolderView.addGestureRecognizer(tapRec)
        
        var currentgame = CurrentGame.sharedInstance
        var game = currentgame.getGame()
        loc = game.getLoc()
        date = game.getDate()
        time = game.getTime()
        pids = game.getPids()
        addr = game.getAddr()
        
        locLabel.text = loc
        dateLabel.text = date
        timeLabel.text = time
        addrLabel.text = addr
        
        latitude = game.getLatitude() as CLLocationDegrees
        longitude = game.getLongitude() as CLLocationDegrees
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latitudeDelt, longitudeDelt)
        var gameloc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(gameloc, span)
        self.mymapview.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = gameloc
        self.mymapview.addAnnotation(annotation)
        self.mymapview.zoomEnabled = false
        self.mymapview.scrollEnabled = false
        self.mymapview.userInteractionEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapped() {
        println("tapped")
        let mapviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
        self.navigationController?.pushViewController(mapviewcontroller, animated: true)
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
