import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:radiobjr/shared/themes/app_colors.dart';
import 'package:radiobjr/shared/themes/app_images.dart';
import 'package:radiobjr/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nameImage = AppImages.noSignal;
  String nameChannel = "Sem sinal";
  double sliderValue = 90.2;
  @override
  Widget build(BuildContext context) {
    void changeImage() {
      switch (sliderValue.toStringAsFixed(1)) {
        case '96.9':
          nameImage = AppImages.band;
          nameChannel = 'Band News FM';
          break;
        case '90.5':
          nameImage = AppImages.cbn;
          nameChannel = 'Rádio Cbn';
          break;
        case '100.9':
          nameImage = AppImages.jovemPan;
          nameChannel = 'Rádio Jovem Pan';
          break;
        case '95.2':
          nameImage = AppImages.atlantida;
          nameChannel = 'Rádio Atlântida';
          break;
        case '97.1':
          nameImage = AppImages.oceano;
          nameChannel = 'Oceano FM';
          break;
        default:
          nameImage = AppImages.noSignal;
          nameChannel = 'Sem sinal';
          break;
      }
    }

    void moveSlider(double value) {
      setState(() {
        sliderValue += value;
        changeImage();
      });
    }

    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        //Imagem
        Container(
            width: (size.width * 0.72),
            height: (size.width * 0.72),
            margin: EdgeInsets.all(22),
            child: Image.asset(nameImage)),

        //Texto da estação
        Text(
          '${sliderValue.toStringAsFixed(1)}, $nameChannel',
          style: AppTextStyle.sliderValue,
        ),

        //Slider
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
                thumbColor: AppColors.bege,
                activeTrackColor: AppColors.black,
                inactiveTickMarkColor: AppColors.black,
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
            child: Slider(
                value: sliderValue,
                min: 90,
                max: 101,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                    changeImage();
                  });
                })),

        //botão esq. dir. FM
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () {
                moveSlider(-0.1);
              },
              child: Icon(
                Icons.keyboard_double_arrow_left,
                color: AppColors.black,
              )),
          Column(
            children: [
              Text(
                'FM',
                style: AppTextStyle.fm,
              ),
              Text('AM', style: AppTextStyle.am),
            ],
          ),
          TextButton(
              onPressed: () {
                moveSlider(0.1);
              },
              child: Icon(
                Icons.keyboard_double_arrow_right,
                color: AppColors.black,
              )),
        ]),
      ],
    );
  }
}
