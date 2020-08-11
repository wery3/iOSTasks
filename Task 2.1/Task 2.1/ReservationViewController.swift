//
//  ReservationViewController.swift
//  Task 2.1
//
//  Created by Dynamo Software on 10.07.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var ticket: Ticket?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "ReservationSegue" else {return}
        
            let destionation = segue.destination as? CinamaTableViewController
            destionation?.reservations.append(ticket!)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


