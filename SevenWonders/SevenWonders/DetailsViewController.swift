//
//  DetailsViewController.swift
//  SevenWonders
//
//  Created by Selina Liu on 3/18/23.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var textView: UILabel!
    
    let detailDescription = ["Machu Picchu is a 15th-century Inca citadel located in the Eastern Cordillera of southern Peru on a 2,430-meter (7,970 ft) mountain ridge.", "The Great Wall of China is a series of fortifications that were built across the historical northern borders of ancient Chinese states and Imperial China as protection against various nomadic groups from the Eurasian Steppe.", "The Taj Mahal is an Islamic ivory-white marble mausoleum on the right bank of the river Yamuna in Agra, Uttar Pradesh, India.", "The Colosseum is an elliptical amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum.", "Petra originally known to its inhabitants as Raqmu or Raqēmō,is a historic and archaeological city in southern Jordan.", "Chichén Itzá was a large pre-Columbian city built by the Maya people of the Terminal Classic period. ","Christ the Redeemer is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa."]
    
    var wonderNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = detailDescription[wonderNum]
        // Do any additional setup after loading the view.
    }
    
}
