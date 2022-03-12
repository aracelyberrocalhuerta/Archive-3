//
//  ConfigViewController.swift
//  App2
//
//  Created by user209640 on 3/12/22.
//

import UIKit

class ConfigViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colores[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccionado = colores[row]
    }
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var sliderDetalleFuente: UISlider!
    @IBOutlet weak var sliderTablaFuente: UISlider!
    
    let colores = ["green", "blue", "orange"]
    
    var seleccionado = ""

    
    let defaults = UserDefaults.standard
    
    @IBAction func save(_ sender: Any) {
        
        defaults.set(seleccionado, forKey: "color")
        defaults.set(sliderTablaFuente.value, forKey: "tablaFuente")
        defaults.set(sliderDetalleFuente.value, forKey: "detalleFuente")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderTablaFuente.maximumValue = 30
        sliderDetalleFuente.maximumValue = 30
        sliderTablaFuente.minimumValue = 10
        sliderDetalleFuente.minimumValue = 10
        sliderTablaFuente.value = 17
        sliderDetalleFuente.value = 17

    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
