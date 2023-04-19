//
//  MainVC.swift
//  MyPlaces
//
//  Created by Nikolay Zhukov on 12.04.2023.
//

import UIKit

class MainVC: UITableViewController {
    
//    let restorauntName = ["McDonalds", "ChaCha Time", "Back Door", "Black sea"]
    
//    var places = [Place]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return places.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
//        let place = places[indexPath.row]
//        cell.nameLabel.text = place.name
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//        cell.imageOfPlace.image = place.image
//        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.height / 2
//        cell.imageOfPlace.clipsToBounds = true
//        return cell
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceTableVC else { return  }
//        newPlaceVC.saveNewPlace()
//        if let newPlace = newPlaceVC.newPlace {
//            places.append(newPlace)
//        }
        tableView.reloadData()
    }

}
