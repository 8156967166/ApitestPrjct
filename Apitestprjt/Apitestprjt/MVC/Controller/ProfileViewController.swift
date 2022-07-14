//
//  ProfileViewController.swift
//  Apitestprjt
//
//  Created by Bimal@AppStation on 16/05/22.
//

import UIKit
import Photos
import PhotosUI

class ProfileViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var validation = Validation()
    let color = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewStylename: UIView!
    @IBOutlet weak var textFieldname: UITextField!
    @IBOutlet weak var viewStyleemail: UIView!
    @IBOutlet weak var textFieldemail: UITextField!
    @IBOutlet weak var viewStylePhone: UIView!
    @IBOutlet weak var textFieldCode: UITextField!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var textFieldNationality: UITextField!
    @IBOutlet weak var textFieldAction: UITextField!
    @IBOutlet weak var viewStyleActivity: UIView!
    @IBOutlet weak var textFieldActivity: UITextField!
    @IBOutlet weak var viewStyleHeight: UIView!
    @IBOutlet weak var textFieldHeight: UITextField!
    @IBOutlet weak var viewStyleWeight: UIView!
    @IBOutlet weak var textFieldWeight: UITextField!
    @IBOutlet weak var viewStyleBmiValue: UIView!
    @IBOutlet weak var textFieldBmiValue: UITextField!
    @IBOutlet weak var buttonUpdate: UIButton!
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var buttonProfile: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    

    let datePickerView: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile Edit"
        setStyle()
        setDate()
        addDoneButtonOnKeyboard()
        notificationKeyboard()
//        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] (status) in
//        DispatchQueue.main.async { [unowned self] in
////        showUI(for: status)
    }
    func setStyle() {
        profileImage.layer.borderWidth = 1
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.gray.cgColor
        buttonUpdate.titleLabel?.textColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        buttonUpdate.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        
        setupTextField(field: textFieldDate, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupTextField(field: textFieldNationality, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupTextField(field: textFieldAction, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupView(field: viewStylename, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupView(field: viewStyleemail, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupView(field: viewStylePhone, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupView(field: viewStyleActivity, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupView(field: viewStyleHeight, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupView(field: viewStyleWeight, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupView(field: viewStyleBmiValue, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupButton(field: buttonUpdate, borderWidth: 1, borderColor: color, cornerRadius: 6)
        setupButton(field: buttonProfile, borderWidth: 1, borderColor: color, cornerRadius: 18)
        setupView(field: viewProfile, borderWidth: 1, borderColor: color, cornerRadius: 18)
    }
    func setupTextField(field: UITextField, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        field.layer.borderWidth = borderWidth
        field.layer.borderColor = borderColor.cgColor
        field.layer.cornerRadius = cornerRadius
    }
    func setupView(field: UIView, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        field.layer.borderWidth = borderWidth
        field.layer.borderColor = borderColor.cgColor
        field.layer.cornerRadius = cornerRadius
    }
    func setupButton(field: UIButton, borderWidth: CGFloat, borderColor: UIColor, cornerRadius: CGFloat) {
        field.layer.borderWidth = borderWidth
        field.layer.borderColor = borderColor.cgColor
        field.layer.cornerRadius = cornerRadius
    }
    func notificationKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
           keyboardFrame = self.view.convert(keyboardFrame, from: nil)

           var contentInset:UIEdgeInsets = self.scrollView.contentInset
           contentInset.bottom = keyboardFrame.size.height + 20
           scrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notifiaction: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
    }
    func setDate(){
       
        datePickerView.datePickerMode = .date
        textFieldDate.inputView = datePickerView
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.sizeToFit()
        datePickerView.backgroundColor = UIColor.white
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: UIControl.Event.valueChanged)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        toolBar.setItems([doneButton], animated: false)
        textFieldDate.inputAccessoryView = toolBar
       
    }
    @objc func handleDatePicker(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "dd/MM/yyyy"
        textFieldDate.text = timeFormatter.string(from: sender.date)
    }
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textFieldDate.text = formatter.string(from: datePickerView.date)
        self.view.endEditing(true)
    }
    @IBAction func actionSheetFunction(sender: Any) {
        let actionSheetController = UIAlertController(title: "Selection Process", message: "Choose Your Option", preferredStyle: .actionSheet)
        let firstButton = UIAlertAction(title: "First", style: .default) { (ACTION) in
            self.textFieldAction.text = "First Button Clicked"
        }
        let secondButton = UIAlertAction(title: "Second", style: .default) { (ACTION) in
            self.textFieldAction.text = "Second Button Clicked"
        }
        let thirdButton = UIAlertAction(title: "Third", style: .default) { (ACTION) in
            self.textFieldAction.text = "Third Button Clicked"
        }
        actionSheetController.addAction(firstButton)
        actionSheetController.addAction(secondButton)
        actionSheetController.addAction(thirdButton)
        present(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func actionSheetProfileCamera(sender: Any) {
        self.showAlert()
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Selection Process", message: "Choose Any Option", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alertController.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerConroller = UIImagePickerController()
            imagePickerConroller.delegate = self
            imagePickerConroller.sourceType = sourceType
            self.present(imagePickerConroller, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            self.dismiss(animated: true) { [weak self] in
                guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
                self?.profileImage.image = image
            }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            textFieldCode.inputAccessoryView = doneToolbar
            textFieldPhoneNumber.inputAccessoryView = doneToolbar
            textFieldHeight.inputAccessoryView = doneToolbar
            textFieldWeight.inputAccessoryView = doneToolbar
            textFieldBmiValue.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            textFieldCode.resignFirstResponder()
            textFieldPhoneNumber.resignFirstResponder()
            textFieldHeight.resignFirstResponder()
            textFieldWeight.resignFirstResponder()
            textFieldBmiValue.resignFirstResponder()
        }
    func showAlert(strTitle: String, strMessage: String) {
        let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
        return
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textFieldemail {
            let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@._"
            let allowedcharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharactersetIn = CharacterSet(charactersIn: string)
            let alphabet = allowedcharacterSet.isSuperset(of: typedCharactersetIn)
            return alphabet
        }
        return true
    }
    @IBAction func buttonActionUpdate(sender: Any) {
        guard let name = textFieldname.text, let email = textFieldemail.text, let phone = textFieldPhoneNumber.text
        else {
            return
        }
        let isValidateName = self.validation.validateName(name: name)
        if(isValidateName == false) {
            showAlert(strTitle: "Invalid", strMessage: "Enter valid Name")
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
              if (isValidateEmail == false) {
                  showAlert(strTitle: "Invalid", strMessage: "Enter Valid Email")
              }
        if let textDate = textFieldDate.text, textDate.isEmpty {
            showAlert(strTitle: "Empty", strMessage: "Enter Your DOB")
        }
        if let textCode = textFieldCode.text, textCode.isEmpty
         {
            showAlert(strTitle: "Invalid", strMessage: "Enter Valid Country Code")
        }
        let isValidatePhone = self.validation.validatePhoneNumber(phoneNumber: phone)
        if (isValidatePhone == false) {
           showAlert(strTitle: "Invalid", strMessage: "Enter valid Phone Number")
        }
        if let textNationality = textFieldNationality.text, textNationality.isEmpty {
            showAlert(strTitle: "Empty", strMessage: "Enter Your Nationality")
        }
        if let textAction = textFieldAction.text, textAction.isEmpty {
            showAlert(strTitle: "Select One", strMessage: "Please Choose Your Option")
        }
        if let textActivity = textFieldActivity.text, textActivity.isEmpty {
            showAlert(strTitle: "Empty", strMessage: "Enter Activity Level")
        }
        if let textHeight = textFieldHeight.text, textHeight.isEmpty {
           showAlert(strTitle: "Empty", strMessage: "Enter Your Height")
        }
        if let textWeight = textFieldWeight.text, textWeight.isEmpty {
            showAlert(strTitle: "Empty", strMessage: "Enter Your Weight")
        }
        if let textBmi = textFieldBmiValue.text, textBmi.isEmpty {
            showAlert(strTitle: "Empty", strMessage: "Enter BMI Value")
        }
    }
}
