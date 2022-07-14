//
//  Sample.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 16/05/22.
//

//import Foundation
//var date: Date?
//let datePicker = UIDatePicker()
//let formatter = DateFormatter()
//datePicker.datePickerMode = .date
//formatter.dateStyle = .short
//let toolbar = UIToolbar()
//toolbar.sizeToFit()
//let done = UIBarButtonItem(title: "Pronto", style: .plain, target: self, action: #selector(doneAction))
//let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//let cancel = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelAction))
//toolbar.setItems([cancel,space,done], animated: false)
//let inputAccessoryView = toolbar
//let inputView = datePicker
//@objc func cancelAction(_ sender: UIBarButtonItem) {
//    self.view.endEditing(true)
//    }
//    @objc func doneAction(_ sender: UIBarButtonItem) {
//        date = datePicker.date
//        textFieldDate.text = formatter.string(from: datePicker.date)
//        self.view.endEditing(true)
//    }



//Date picker

//UIDatePicker.Mode.time
//func setDate(){
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        textFieldDate.text = formatter.string(from: date)
//        textFieldDate.textColor = .link
//
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
//        textFieldDate.inputView = datePicker
//    }
//    @objc func datePickerValueChanged(sender: UIDatePicker) {
////        print(sender.date)
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        textFieldDate.text = formatter.string(from: sender.date)
//    }
