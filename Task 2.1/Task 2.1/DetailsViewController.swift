//
//  DetailsViewController.swift
//  Task 2.1
//
//  Created by Dynamo Software on 10.07.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var cinema: Cinema?
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var workingHours: UILabel!
    @IBOutlet weak var parkingPlaces: UILabel!
    @IBOutlet weak var telephoneNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDetails()
        // Do any additional setup after loading the view.
    }
    
    private func updateDetails() {
        guard let currentCinema = cinema else {return}
            img1.image  = currentCinema.picture
            img2.image = currentCinema.picture2
            address.text = currentCinema.address
            workingHours.text = currentCinema.workingHours
            parkingPlaces.text = "Parking places:" + currentCinema.parkingPlaces
        telephoneNumber.text = currentCinema.phoneNumber
        navigationItem.title = currentCinema.title
        navigationItem.backBarButtonItem?.title = "Back"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
