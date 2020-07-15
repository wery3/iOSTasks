//
//  CinemaTableViewCell.swift
//  Task 2.1
//
//  Created by Dynamo Software on 10.07.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

protocol CinemaTableViewCellDelegate: class {
    func didTapFrom(cell: CinemaTableViewCell)
}

class CinemaTableViewCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    weak var delegate: CinemaTableViewCellDelegate?
    @IBOutlet weak var cinemaImg: UIImageView!
    @IBOutlet weak var workingHours: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func update(with cinema: Cinema) {
        cinemaImg.image = cinema.picture
        workingHours.text = cinema.workingHours
        title.text = cinema.title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
