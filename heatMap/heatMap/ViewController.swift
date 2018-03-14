//
//  ViewController.swift
//  heatMap
//
//  Created by Sky Xu on 3/13/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit
import GoogleMaps
import Foundation

class ViewController: UIViewController, GMSMapViewDelegate {
    private var heatmapLayer: GMUHeatmapTileLayer!
    private var mapView: GMSMapView!
    
    private var gradientColors = [UIColor.green, UIColor.red]
    private var gradientStartPoints = [0.2, 1.0] as? [NSNumber]
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -37, longitude: 145, zoom: 7)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        self.view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        heatmapLayer = GMUHeatmapTileLayer()
//        we can change radius based on the ratio of liverom in this area/all liverooms
        heatmapLayer.radius = 250
        heatmapLayer.opacity = 0.7
        heatmapLayer.gradient = GMUGradient(colors: gradientColors,
                                            startPoints: gradientStartPoints!,
                                            colorMapSize: 256)
        addHeatmap()
        heatmapLayer.map = mapView
    }

    
    func addHeatmap() {
        var list = [GMUWeightedLatLng]()
        let coordinate = CLLocationCoordinate2D(latitude: -37, longitude: 145)
        let coords = GMUWeightedLatLng(coordinate: coordinate, intensity: 0.8)
        list.append(coords)
        heatmapLayer.weightedData = list
    }

}

