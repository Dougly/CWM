//
//  LogInView.swift
//  ClimbWithMe
//
//  Created by Douglas Galante on 4/30/17.
//  Copyright © 2017 Dougly. All rights reserved.
//

import UIKit

class LogInView: UIView {
    
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        print(frame)
        super.init(frame: frame)
        print("got to content view")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("LogInView", owner: self, options: nil)
        self.addSubview(view)
        self.setEqualConstraints(for: view)
    }
    
}
