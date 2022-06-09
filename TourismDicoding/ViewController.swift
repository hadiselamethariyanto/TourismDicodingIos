//
//  ViewController.swift
//  TourismDicoding
//
//  Created by MuhammadHariyanto on 08/06/22.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tourismTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var activityIndicator = UIActivityIndicatorView()
    
    var tourismData: [Tourism]?{
        didSet{
            DispatchQueue.main.async {[self] in
                tourismFilteredData = tourismData
                tourismTableView.reloadData()
                activityIndicator.stopAnimating()
            }
        }
    }
    
    var tourismFilteredData:[Tourism]?
    
    var tourism:Tourism?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActivityIndicator()
        
        let tourismManager = TourismManager()
        
        activityIndicator.startAnimating()
        
        searchBar.delegate = self
        
        tourismManager.fetchTourism { (tourism) in
            self.tourismData = tourism.places
        }
        
        tourismTableView.dataSource = self
        tourismTableView.delegate = self
        tourismTableView.register(UINib(nibName: "TourismTableViewCell", bundle: nil), forCellReuseIdentifier: "TourismCell")

    }
    
    func setupActivityIndicator(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.blue
        view.addSubview(activityIndicator)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tourismFilteredData = []
        
        if searchText == "" {
            tourismFilteredData = tourismData
        }else{
            for tourism in tourismData ?? [] {
                if tourism.name.lowercased().contains(searchText.lowercased()){
                    tourismFilteredData?.append(tourism)
                }
            }
        }
        
        tourismTableView.reloadData()
    }

}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tourismFilteredData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TourismCell", for: indexPath) as? TourismTableViewCell{
            
            guard let tourism = tourismFilteredData?[indexPath.row] else { return UITableViewCell()}
            
            cell.nameLabel.text = tourism.name
            cell.addressLabel.text = tourism.address
            
            if let imageUrl = URL(string: tourism.image){
                cell.tourismImageView.kf.indicatorType = .activity
                cell.tourismImageView.kf.setImage(with: imageUrl,placeholder:UIImage(named: "placeholder_image"),options: [.transition(.fade(0.7))], progressBlock: nil)
            }
                        
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
}

extension ViewController:UITableViewDelegate{
    func tableView(
      _ tableView: UITableView,
      didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(withIdentifier: "moveToDetail", sender: tourismData?[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail"{
            if let detailViewController = segue.destination as? DetailViewController{
                detailViewController.tourism = sender as? Tourism
            }
        }
    }
}

