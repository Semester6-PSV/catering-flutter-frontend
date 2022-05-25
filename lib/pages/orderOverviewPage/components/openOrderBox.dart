import 'package:catering_flutter_frontend/components/orderedCateringProductsList.dart';
import 'package:catering_flutter_frontend/models/cateringOrder.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter_frontend/config/index.dart';

class OpenOrderBox extends StatefulWidget {
  final CateringOrder order;

  const OpenOrderBox(
      {Key? key,
      required this.order})
      : super(key: key);

  @override
  OpenOrderBoxState createState() => OpenOrderBoxState();
}

class OpenOrderBoxState extends State<OpenOrderBox> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = getTotalPriceOfOrder(widget.order.addedProducts);

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: 8, bottom: 4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: widget.order.done ? COLOR_GREEN : COLOR_RED_DARK,
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
            ),
            Text(
                widget.order.done ? 'Klaar om af te halen' : 'In behandeling',
                style:
                    const TextStyle(fontFamily: 'Klavika-Light', fontSize: 18))
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: COLOR_WHITE,
              borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    color: COLOR_BLACK.withOpacity(0.25),
                    blurRadius: 2)
              ]),
          child: Row(children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bestelling #' + widget.order.id.toString(),
                            style: const TextStyle(
                                fontFamily: 'Klavika-Medium', fontSize: 20)),
                        const SizedBox(height: 5),
                        Text('Totaal €' + totalPrice.toString(),
                            style: const TextStyle(
                                fontFamily: 'Klavika-Light', fontSize: 18))
                      ],
                    ))),
            Container(
              width: 45,
              height: 82,
              decoration: const BoxDecoration(
                  color: COLOR_RED,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius))),
              child: InkWell(
                  child: const Icon(
                    Icons.expand_more_outlined,
                    color: COLOR_WHITE,
                    size: 24,
                  ),
                  onTap: () => {}),
            )
          ]),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: COLOR_WHITE, boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                color: COLOR_BLACK.withOpacity(0.25),
                blurRadius: 2)
          ]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/WhatsApp_click-to-chat_QR_code.png/601px-WhatsApp_click-to-chat_QR_code.png',
                  scale: 0.1,
                )),
            const SizedBox(height: 30),
            const Text('Bestelde producten',
                style: TextStyle(fontFamily: 'Klavika-Medium', fontSize: 20)),
            const SizedBox(height: 10),
            SizedBox(
                width: double.infinity,
                child: orderedCateringProductsList(widget.order.addedProducts))
          ]),
        ),
        const SizedBox(height: 60)
      ],
    );
  }
}
