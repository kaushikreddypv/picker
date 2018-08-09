//
//  SongDetail.swift
//  Picker
//
//  Created by KAUSHIKESWAR REDDY PALLE VENKATA on 8/8/18.
//  Copyright © 2018 KAUSHIKESWAR REDDY PALLE VENKATA. All rights reserved.
//

import Foundation

final class SongDetail {
    let title: String
    var isSelect: Bool
    
    init(title: String, isSelect: Bool = false) {
        self.title = title
        self.isSelect = isSelect
    }
}
