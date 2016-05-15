//
//  LocateUsViewController.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 10/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit
import MapKit

class LocateUsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    var data = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.data = Array(ApplicationService.getBranches())

    }

    @IBAction func homeButtonPressed(sender: UIButton)
    {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("homeViewController") as!HomeController
        presentViewController(controller, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showOnMap(address: String) -> Void
    {
        let geoCoder = CLGeocoder()
        var coords: CLLocationCoordinate2D?
        let span = MKCoordinateSpanMake(0.01, 0.01)
        geoCoder.geocodeAddressString(address, completionHandler:
            {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                if let placemark = placemarks?[0]
                {
                    let location = placemark.location
                    coords = location!.coordinate
                    let region = MKCoordinateRegion(center: coords!, span: span)
                    self.mapView.region = region
                    self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                }
        })
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("LocationCell") as UITableViewCell!
        var b : BranchInfo
        b = data[indexPath.row] as! BranchInfo
        cell.textLabel?.text  = b.address
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell

    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var b : BranchInfo
        b = data[indexPath.row] as! BranchInfo
        showOnMap(b.address)
    }

}
