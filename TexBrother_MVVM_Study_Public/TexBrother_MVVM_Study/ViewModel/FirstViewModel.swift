//
//  FirstViewModel.swift
//  TexBrother_MVVM_Study
//
//  Created by hansol on 2021/12/24.
//

import RxSwift
import RxCocoa
import SnapKit
import Then

// MARK: - FirstViewModel

final class FirstViewModel {
    
    struct Input {
        let buttonClicked: Observable<Int>
        let textFieldString: Observable<String>
    }
    
    struct Output {
        let selectedButton : Observable<ButtonModel>
        let textCount: Observable<Int>
    }
}

// MARK: - Extensions

extension FirstViewModel {
	func transform (input : Input) -> Output {
		let selectedItem = input.buttonClicked
			.map {
				self.makeButton(buttonNumber: $0)
			}
			.share()
		
		let textFieldCount = input.textFieldString
			.map { $0.count }
		
		return Output(selectedButton: selectedItem, textCount: textFieldCount)
	}
	
	func makeButton(buttonNumber: Int) -> ButtonModel {
		var buttonNumberToKrString = ""
		
		switch buttonNumber {
		case 1:
			buttonNumberToKrString = "첫"
		case 2:
			buttonNumberToKrString = "두"
		case 3:
			buttonNumberToKrString = "세"
		default :
			buttonNumberToKrString = ""
		}
		
		let buttonInfo = "\(buttonNumberToKrString) 번째 버튼입니다."
		
		
		return ButtonModel(buttonNumber: buttonNumber, buttonInfo: buttonInfo)
	}
}
