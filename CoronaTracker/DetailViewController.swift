//
//  ViewController.swift
//  CoronaTracker
//
//  Created by Anis Bastide on 23/02/2022.
//
import UIKit
import Charts
import TinyConstraints
import SwiftUI
class DetailViewController: UIViewController,ChartViewDelegate {
    var covidDataList:[covidData] = []
    lazy var lineChartView : LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        return chartView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(covidDataList)
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to:view)
        lineChartView.heightToWidth(of:view)
        var values:[ChartDataEntry] = []
        var day = 1
        for covidData in covidDataList {
            values.append(ChartDataEntry(x:Double(day),y: covidData.hosp as? Double ?? 0 ))
            print(day)
            day+=1
        }
        setData(values: values)
        // Do any additional setup after loading the view.
    }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    func setData (values:[ChartDataEntry]) {
    let set1 = LineChartDataSet(entries: values, label: "Covid")
    set1.mode = .cubicBezier
    set1.drawCirclesEnabled = false
    set1.lineWidth = 3
    set1.setColor(.white)
    set1.fillAlpha = 0.8
    set1.drawFilledEnabled = true
    let data = LineChartData(dataSet: set1)
    data.setDrawValues(false);
    lineChartView.data = data
    }
//    let values:[ChartDataEntry] = [
//        ChartDataEntry(x: 0.0, y: 10.0),
//        ChartDataEntry(x: 1.0, y: 5.0),
//
//
//    ]
}
