import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = '/Home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: GestureDetector(child: const Icon(Icons.menu)),
          backgroundColor: Colors.transparent,
          title: const Text('YouBank'),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(Icons.account_circle_rounded),
            )
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      const GetSaldo(),
                    ],
                  )),
            ),
          ],
        ))
      ],
    );
  }
}

class GetSaldo extends StatefulWidget {
  const GetSaldo({
    Key? key,
  }) : super(key: key);

  @override
  State<GetSaldo> createState() => _GetSaldoState();
}

class _GetSaldoState extends State<GetSaldo> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20),
                child: Text(
                  'Meu saldo',
                ),
              ),
              isVisible
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Valor Invisivel'),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = false;
                              });
                            },
                            child: const Icon(
                              Icons.visibility_off,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Valor Visivel'),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = true;
                              });
                            },
                            child: const Icon(
                              Icons.visibility,
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.chevron_left,
                    ),
                    label: const Text('Ver Fatura'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
