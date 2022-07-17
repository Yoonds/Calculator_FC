//
//  RoundButton.swift
//  Calculator_FC
//
//  Created by YoonDaeSung on 2022/07/17.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
	
	// 감시 프로퍼티를 사용함으로써 isRound에 값변화가 생기면 didSet실행
	@IBInspectable
	var isRound: Bool = false {
		didSet {
			if isRound {
				self.layer.cornerRadius = self.frame.height / 2.4
			}
		}
	}
}
