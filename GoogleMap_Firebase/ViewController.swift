//
//  ViewController.swift
//  GoogleMap_Firebase
//
//  Created by Swarnima on 26/06/18.
//  Copyright © 2018 SwarnimaGupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mapButton  = UIButton(frame:CGRect(x: 100, y: 100, width: 200, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapButton)
        mapButton.backgroundColor = .green
        mapButton.setTitleColor(.black, for: .normal)
        mapButton.addTarget(self, action: #selector(openMaps), for: .touchUpInside)
        mapButton.setTitle("Open Google Maps", for: .normal)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func openMaps() {
        let vc = MapController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


import GoogleMaps

class MapController:UIViewController {
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    var mapView: GMSMapView!
    var backButton:UIButton!
    
        override func viewDidLoad() {
                super.viewDidLoad()
            
                let mapCamera : GMSMutableCameraPosition = GMSMutableCameraPosition.camera(withLatitude: 28.413726, longitude: 77.042158, zoom: 8)
                mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: MapController.SCREEN_WIDTH, height: MapController.SCREEN_HEIGHT), camera: mapCamera)
        
                view.addSubview(mapView)
                mapView.isTrafficEnabled = true
        
                backButton = UIButton()
                backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
                backButton.setTitle("Back", for: .normal)
                view.addSubview(backButton)
        
            }
    
        @objc func backTapped() {
                self.navigationController?.popViewController(animated: true)
        }
}

