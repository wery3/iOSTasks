//
//  CinamaTableViewController.swift
//  Task 2.1
//
//  Created by Dynamo Software on 8.07.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

class CinamaTableViewController: UITableViewController {

    var cinemas = [
        Cinema(title: "Arena Mladost",
               picture: UIImage.self(named: "arenamladost"),
               picture2: UIImage.self(named: "hall1"),
            address: "Okolovrasten pat 22",
            workingHours: "11:00-24:00",
            parkingPlaces: "100",
            phoneNumber: "087812345678"),
    Cinema(title: "CINEMA CITY",
           picture: UIImage.self(named: "cinemacity"),
           picture2: UIImage.self(named: "hall2"),
           address: "Opalchenska 18",
           workingHours: "11:00 - 22:00",
           parkingPlaces: "120",
           phoneNumber: "087832345312"),
    Cinema(title: "Arena Zapad",
           picture: UIImage.self(named: "arena_zapad"),
           picture2: UIImage.self(named: "hall3"),
           address: "Opalchenska 18",
           workingHours: "10:00-23:00",
           parkingPlaces: "80",
           phoneNumber: "08784423312")
    ]
    
    var selectedCinema: Cinema?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return cinemas.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cinemaCell", for: indexPath) as! CinemaTableViewCell
        let cinema = cinemas[indexPath.row]
        cell.update(with: cinema)
        cell.delegate = self
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cinema = selectedCinema else {return}
        
        if segue.identifier == "ProgramSegue" {
            let destionation = segue.destination as? FilmsTableViewController
        destionation?.cinema = cinema
        }
        
        if segue.identifier == "InfoSegue" {
            let destination = segue.destination as? DetailsViewController
            destination?.cinema = cinema
        }
    }

    
}

// MARK: - CinemaTableViewCellDelegate
extension CinamaTableViewController: CinemaTableViewCellDelegate {
    func didTapFrom(cell: CinemaTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        
        let cinema = cinemas[indexPath.row]
        selectedCinema = cinema
    }
}

