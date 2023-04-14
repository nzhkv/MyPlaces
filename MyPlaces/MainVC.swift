//
//  MainVC.swift
//  MyPlaces
//
//  Created by Nikolay Zhukov on 12.04.2023.
//

import UIKit

class MainVC: UITableViewController {
    
//    let restorauntName = ["McDonalds", "ChaCha Time", "Back Door", "Black sea"]
    
    let places = [Place(name: "McDonalds", location: "Square", type: "FastFood", image: "McDonalds")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
//        var content = cell.defaultContentConfiguration()
//        content.nameLabel = restorauntName[indexPath.row]
        
//        cell.contentConfiguration = content
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancelBtn(_ segue: UIStoryboardSegue) {}

}
