//
//  DetailViewController.swift
//  TourismDicoding
//
//  Created by MuhammadHariyanto on 08/06/22.
//

import UIKit
import MapKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tourismImageView: UIImageView!
    @IBOutlet weak var tourismMap: MKMapView!

    var tourism: Tourism? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = tourism{
            nameLabel.text = result.name
            addressLabel.text = result.address
            descriptionLabel.text = result.description
            
            if let imageUrl = URL(string: result.image){
                tourismImageView.kf.indicatorType = .activity
                tourismImageView.kf.setImage(with: imageUrl,placeholder:UIImage(named: "placeholder_image"),options: [.transition(.fade(0.7))], progressBlock: nil)
            }
            
            let initialLocation = CLLocation(latitude: result.latitude, longitude: result.longitude)
            tourismMap.centerToLocation(initialLocation)
            
            let object = TourismMapModel(title: result.name, coordinate: CLLocationCoordinate2D(latitude: result.latitude, longitude: result.longitude), info: result.address)
            
            tourismMap.addAnnotation(object)
            
        }

    }
    

}


private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 10000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
