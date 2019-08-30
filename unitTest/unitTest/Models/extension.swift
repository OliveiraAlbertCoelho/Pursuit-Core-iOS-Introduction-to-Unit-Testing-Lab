//
//  extension.swift
//  unitTest
//
//  Created by albert coelho oliveira on 8/29/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation
extension String {
    func noPercentEncoding() -> String {
        return self.removingPercentEncoding ?? "no string"
    }
}
