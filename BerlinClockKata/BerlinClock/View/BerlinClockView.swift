//  Created by Subodh Tavargeri on 26/11/22.
//  Setup customView with color


import UIKit

func BerlinClockLight()-> UIView {
    let view = UIView()
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
    return view
}
