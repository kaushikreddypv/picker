//
//  Extensions.swift
//  Picker
//
//  Created by KAUSHIKESWAR REDDY PALLE VENKATA on 8/9/18.
//  Copyright © 2018 KAUSHIKESWAR REDDY PALLE VENKATA. All rights reserved.
//

import UIKit

extension UIView {
    func addAutoLayoutSubview(_ subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subView)
    }
    
    func edgesToSuperview() {
        guard let superview = superview else { return }
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
    }
}
