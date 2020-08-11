//
//  ReservationTableViewCell.swift
//  Task 2.1
//
//  Created by Dynamo Software on 28.07.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var cinemaName: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with ticket: Ticket) {
        movieTitle.text = ticket.film.title
        time.text = ticket.film.showTime
        cinemaName.text = ticket.cinema.title
    }

}
