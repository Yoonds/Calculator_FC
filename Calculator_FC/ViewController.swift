//
//  ViewController.swift
//  Calculator_FC
//
//  Created by YoonDaeSung on 2022/07/17.
//

import UIKit

enum Operation {
	case Add
	case Subtract
	case Divide
	case Multiply
	case unknown
}

class ViewController: UIViewController {

	@IBOutlet weak var numberOutputLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	// 라벨상에서 노출
	var displayNumber = ""
	
	// 이전 계산값을 저장
	var firstOperand = ""
	
	// 새롭게 입력된 값 저장
	var secondOperand = ""
	
	// 계산의 결과를 저장
	var result = ""
	
	// 현재 입력된 연산자의 값을 저장
	var currentOperation: Operation = .unknown
	
	@IBAction func tapnumberButton(_ sender: UIButton) {
		guard let numberValue = sender.title(for: .normal) else { return }
		print("\(numberValue)")
		if self.displayNumber.count < 9 {
			self.displayNumber += numberValue
			self.numberOutputLabel.text = self.displayNumber
		}
	}
	
	@IBAction func tapClearButton(_ sender: UIButton) {
	}
	
	
	@IBAction func tapDotButton(_ sender: UIButton) {
	}
	
	
	@IBAction func tapDivideButton(_ sender: UIButton) {
	}
	
	@IBAction func tapMultiplyButton(_ sender: UIButton) {
	}
	
	@IBAction func tapSubstractButton(_ sender: UIButton) {
	}
	
	@IBAction func tapAddButton(_ sender: UIButton) {
	}
	
	@IBAction func tapEqualButton(_ sender: UIButton) {
	}
	
}

