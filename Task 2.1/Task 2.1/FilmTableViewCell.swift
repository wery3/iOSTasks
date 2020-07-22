//
//  FilmTableViewCell.swift
//  Task 2.1
//
//  Created by Dynamo Software on 10.07.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

class FilmTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var workingHours: UILabel!


    func update(with film: Film) {
        title.text = film.title
        workingHours.text = film.showTime
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
