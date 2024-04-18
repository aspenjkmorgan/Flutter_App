import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('forest.jpg', 
            width: double.infinity, 
            fit: BoxFit.fitWidth,),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: const Text(style: TextStyle(fontSize: 16), 'This website is a part of a project to estimate and predict hazardous gas particle concentrations across Montana. This project is focused on particulate matter under 2.5 micrometers in diameter (PM-2.5). Exposure to these particles can have a severe impact on human health, even leading to cancer and premature death. Although PM-2.5 is created in lots of ways, wildfires across Canada and the American west are a major contributor.')),
          Image.asset('station.jpeg',
            width: double.infinity,
            fit: BoxFit.fitWidth,),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: const Text(style: TextStyle(fontSize: 16), 'There are only 20 ground-stations monitoring PM-2.5 in Montana shown above (DEQ, 2022). The first part of this project involved correlating ground-station measurements of PM-2.5 with satellite data to create a full coverage concentration map. We used aerosol optical depth and several other climate variables in our models. The random forest regression model outperformed simple and multiple linear regression, so we utilized it on our Google Earth Engine app to generate the daily estimates of PM-2.5 concentrations. We are in the process of writing a manuscript for publication.'),),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: const Center(child: Text('Moving Forward', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: const Text(style: TextStyle(fontSize: 16), 'The next phase of the project is aimed at predicting PM-2.5 concentrations three days in advance. Our goal is to provide Montanans with advanced notice of hazardous gas in their area, allowing them to prepare to stay inside if the air quality is bad. We will continue to provide updates on this website.'))
      ],
    ),
    );
  }  
}