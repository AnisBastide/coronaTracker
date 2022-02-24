//
//  ViewController.swift
//  CoronaTracker
//
//  Created by Anis Bastide on 23/02/2022.
//

import UIKit
import Charts
import TinyConstraints
class DetailViewController: UIViewController,ChartViewDelegate {
    lazy var lineChartView : LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        return chartView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to:view)
        lineChartView.heightToWidth(of:view)
        setData()
        // Do any additional setup after loading the view.
    }
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    func setData () {
    let set1 = LineChartDataSet(entries: values, label: "Covid")
    let data = LineChartData(dataSet: set1)
    lineChartView.data = data
    }
    let values:[ChartDataEntry] = [
        ChartDataEntry(x:0.0,y:10.0),
        ChartDataEntry(x:10.0,y:20.0),
        ChartDataEntry(x:20.0,y:30.0),
        ChartDataEntry(x:30.0,y:40.0),
        ChartDataEntry(x:40.0,y:50.0),
        ChartDataEntry(x:50.0,y:60.0),
        ChartDataEntry(x:60.0,y:70.0),
        ChartDataEntry(x:70.0,y:80.0),
        ChartDataEntry(x:80.0,y:90.0),
    ]
}

