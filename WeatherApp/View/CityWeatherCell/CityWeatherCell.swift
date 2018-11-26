//
//  CityWeatherCell.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import UIKit
import PocketSVG

class CityWeatherCell: UITableViewCell {
    
    
    
    

    @IBOutlet weak var svgImageView: UIView!
    
    @IBOutlet weak var averageTempLbl: UILabel!
    
    @IBOutlet weak var cityNameLbl: UILabel!
    
    
    @IBOutlet weak var weatherOverviewLbl: UILabel!
    @IBOutlet weak var todayDateLbl: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func configureCell(icon_path: String?) {
        guard let icon = icon_path else {return}
        let URL_IMAGE = "https://yastatic.net/weather/i/icons/blueye/color/svg/\(icon).svg"
        let svgImage = SVGImageView.init(contentsOf: URL(string: URL_IMAGE)!)
       print(svgImage)
        svgImage.frame = svgImageView.bounds
        svgImage.contentMode = .scaleAspectFit
        svgImageView.addSubview(svgImage)
    }

  
    
}
