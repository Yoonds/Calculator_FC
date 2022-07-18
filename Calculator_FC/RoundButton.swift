//
//  RoundButton.swift
//  Calculator_FC
//
//  Created by YoonDaeSung on 2022/07/17.
//

import UIKit

// 변경된 값을 스토리보드에서 바로 확인 가능 속성
@IBDesignable
class RoundButton: UIButton {
	
  // 커스텀뷰 속성을 SB상 우측창에서 바로 적용 가능
	@IBInspectable
  // 감시 프로퍼티를 사용함으로써 isRound에 값변화가 생기면 didSet실행
	var isRound: Bool = false {
		didSet {
			if isRound {
				self.layer.cornerRadius = self.frame.height / 2.4
			}
		}
	}
}
