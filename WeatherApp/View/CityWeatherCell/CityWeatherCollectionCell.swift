//
//  CityWeatherCollectionCell.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import UIKit

class CityWeatherCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var dayLbl: UILabel!
    
    @IBOutlet weak var dayTempLbl: UILabel!
    
    @IBOutlet weak var nightTempLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
