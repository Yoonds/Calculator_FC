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
	}
	
	// 라벨에 노출될 값 저장
	var displayNumber = ""
	
	// 이전 계산값을 저장
	var firstOperand = ""
	
	// 새롭게 입력된 값 저장
	var secondOperand = ""
	
	// 계산의 결과를 저장
	var result = ""
	
	// 현재 입력된 연산자의 값을 저장
	var currentOperation: Operation = .unknown
  
  @IBAction func tapNumberButton(_ sender: UIButton) {
    // 강의상에서 알려준 sender.title사용시에 nil만 return하게 됨
//  guard let numberValue = sender.title(for: .normal) else { return }
    guard let numberValue = sender.titleLabel?.text else { return }
    print("senderTitle : \(numberValue)")
    if self.displayNumber.count < 9 {
      self.displayNumber += numberValue
      self.numberOutputLabel.text = self.displayNumber
    }
  }

	@IBAction func tapClearButton(_ sender: UIButton) {
    self.displayNumber = ""
    self.firstOperand = ""
    self.secondOperand = ""
    self.result = ""
    self.currentOperation = .unknown
    self.numberOutputLabel.text = "0"
	}
	
	
	@IBAction func tapDotButton(_ sender: UIButton) {
    // 프로퍼티가 8자리 미만이면서 소숫점을 포함하지 않을경우
    if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
      self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
      self.numberOutputLabel.text = self.displayNumber
    }
	}
	
	@IBAction func tapDivideButton(_ sender: UIButton) {
    self.operation(.Divide)
	}
	
	@IBAction func tapMultiplyButton(_ sender: UIButton) {
    self.operation(.Multiply)
	}
	
	@IBAction func tapSubstractButton(_ sender: UIButton) {
    self.operation(.Subtract)
	}
	
	@IBAction func tapAddButton(_ sender: UIButton) {
    self.operation(.Add)
	}
	
	@IBAction func tapEqualButton(_ sender: UIButton) {
    self.operation(self.currentOperation)
	}
  
  // 계산 담당함수
  func operation(_ operation: Operation) {
    if self.currentOperation != .unknown {
      if !self.displayNumber.isEmpty {
        self.secondOperand = self.displayNumber
        self.displayNumber = ""
        
        guard let firstOperand = Double(self.firstOperand) else { return }
        guard let secondOperand = Double(self.secondOperand) else { return }
        
        switch self.currentOperation {
        case .Add:
          self.result = "\(firstOperand + secondOperand)"
        case .Subtract:
          self.result = "\(firstOperand - secondOperand)"
        case .Divide:
          self.result = "\(firstOperand / secondOperand)"
        case .Multiply:
          self.result = "\(firstOperand * secondOperand)"
        default:
          break
        }
        
        // 소숫점 뒤에 0값이 들어올경우 소숫점 및 숫자 없애기
        if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
          self.result = "\(Int(result))"
        }
        
        self.firstOperand = self.result
        self.numberOutputLabel.text = self.result
      }
      
      self.currentOperation = operation
    } else {
      self.firstOperand = self.displayNumber
      self.currentOperation = operation
      self.displayNumber = ""
    }
  }
	
}

