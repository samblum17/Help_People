//
//  Styles.swift
//  Help_People
//
//  Created by Jacobia Johnson on 8/8/19.
//  Copyright © 2019 Sam Blum. All rights reserved.
//

import Foundation
import UIKit

class DarkBlueButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 15
    }
}
