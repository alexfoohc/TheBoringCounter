//
//  ViewController.swift
//  COVID-19 Counter
//
//  Created by Alejandro Hernández Cortés on 09/06/21.
//

import UIKit

class MainController: UIViewController, UITextFieldDelegate {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var newLimitBtn: UIButton!
    @IBOutlet weak var counterPicker: UIPickerView!
    @IBOutlet weak var currentValueLbl: UILabel!
    @IBOutlet weak var currentValueBkgView: UIView!
    
    
    
// MARK: - Variables and constants
    let counter = CounterLogic()
    var totalCapacity: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()        
    }
    
    private func configureView() {
        
        /*let labels: [UILabel] = [separatorCapacityLbl, counterCapacityLbl, capacityLimitLbl]
        for label in labels {
            label.font = UIFont(name: FONT_HEAVY, size: 46)
            label.numberOfLines = 1
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            label.textColor = .white
        }*/
        
        addBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        addBtn.setTitle("", for: .normal)
        addBtn.tintColor = .white
        addBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32, weight: .regular), forImageIn: .normal)
        addBtn.backgroundColor = .systemGreen
        addBtn.layer.cornerRadius = addBtn.frame.width / 8
        
        minusBtn.setImage(UIImage(systemName: "minus"), for: .normal)
        minusBtn.setTitle("", for: .normal)
        minusBtn.tintColor = .white
        minusBtn.backgroundColor = .red
        minusBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32, weight: .regular), forImageIn: .normal)
        minusBtn.layer.cornerRadius = minusBtn.frame.width / 8
        
        resetBtn.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        resetBtn.setTitle("", for: .normal)
        resetBtn.tintColor = .gray
        resetBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular), forImageIn: .normal)
        resetBtn.backgroundColor = .systemTeal
        resetBtn.layer.cornerRadius = resetBtn.frame.width / 8
        
        currentValueLbl.text = "232"
        currentValueLbl.font = UIFont(name: FONT_HEAVY, size: 64)
        
        /*newLimitBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        newLimitBtn.tintColor = .black
        ne LimitBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 28, weight: .regular), forImageIn: .normal)
        newLimitBtn.setTitle("", for: .normal)*/
        
        /*descriptionLbl.text = ""
        descriptionLbl.font = UIFont(name: FONT_MEDIUM, size: 24)
        descriptionLbl.textAlignment = .center*/
    }
    
// MARK: -IBActions
    @IBAction func addBtnPressed(sender: Any) {
        /*switch counter.checkCapacityLimit() {
        case false:
            let result = counter.incrementCounter()
            descriptionLbl.text = result.backgroundInfo.message
            counterCapacityLbl.text = String(format: "%.0f", result.currentCapacity)
        default:
            let alert = UIAlertController(title: NSLocalizedString("noLimitAlertTitle", comment: ""), message: NSLocalizedString("noLimitAlertMessage", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }*/
    }
    
    @IBAction func minusBtnPressed(sender: Any) {
        /*switch counter.checkCapacityLimit() {
        case false:
            let result = counter.decrementCounter()
            descriptionLbl.text = result.backGroundInfo.message
            counterCapacityLbl.text = String(format: "%.0f", result.currentCapacity)
        default:
            let alert = UIAlertController(title: NSLocalizedString("noLimitAlertTitle", comment: ""), message: NSLocalizedString("noLimitAlertMessage", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
         */
    }

    @IBAction func newLimitBtnPressed(sender: Any) {
        /*let newLimitAlert = UIAlertController(title: NSLocalizedString("newLimitAlertTitle", comment: ""), message: NSLocalizedString("newLimitAlertMessage", comment: ""), preferredStyle: .alert)

        let setAction = UIAlertAction(title: NSLocalizedString("newLimitAlertSet", comment: ""), style: .default) { (alert) in
            let textField = newLimitAlert.textFields![0] as UITextField
            let textStr = textField.text ?? "0"
            self.capacityLimitLbl.text = textStr
            self.totalCapacity = Double(textStr) ?? 0
            self.counterCapacityLbl.text = "0"
            self.backgroundVw.backgroundColor = greenColor
            
            self.counter.getTotalCapacity(capacity: self.totalCapacity)
            print("TextField is:", textStr)
            print("Finished")
        }
        
        newLimitAlert.addAction(setAction)
        
        newLimitAlert.addTextField { (textfield) in
            setAction.isEnabled = false
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textfield, queue: OperationQueue.main) { (_) in
                let textCount = textfield.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                let textIsNotEmpty = textCount > 0
                setAction.isEnabled = textIsNotEmpty
            }
            textfield.placeholder = NSLocalizedString("newLimitPlaceholder", comment: "")
            textfield.keyboardType = .numberPad
        }

        newLimitAlert.addAction(UIAlertAction(title: NSLocalizedString("newLimitAlertCancel", comment: ""), style: .cancel, handler: nil))

        present(newLimitAlert, animated: true, completion: nil)*/
    }
}

