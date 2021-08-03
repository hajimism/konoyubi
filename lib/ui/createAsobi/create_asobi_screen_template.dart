import 'package:flutter/material.dart';

class CreateAsobiScreenTemplate extends StatelessWidget {
  const CreateAsobiScreenTemplate({
    Key? key,
    required this.title,
    required this.index,
    required this.body,
    required this.onBack,
    required this.onNext,
  }) : super(key: key);

  final String title;
  final int index;
  final Widget body;
  final void Function() onBack;
  final void Function() onNext;

  @override
  Widget build(BuildContext context) {
    final isFirst = index == 0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isFirst,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(title, style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: StepIndicator(index: index),
          ),
          preferredSize: const Size.fromHeight(72),
        ),
      ),
      body: SafeArea(child: body),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isFirst
                  ? const SizedBox()
                  : TextButton.icon(
                      onPressed: onBack,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      label: const Text('Back'),
                    ),
              Row(
                children: [
                  TextButton(
                    onPressed: onNext,
                    child: const Text('Next'),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    bool _isColored(int position) {
      return position - index < 0;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StepIndicatorItem(isColored: _isColored(0)),
        StepIndicatorItem(isColored: _isColored(1)),
        StepIndicatorItem(isColored: _isColored(2)),
        StepIndicatorItem(isColored: _isColored(3)),
        StepIndicatorItem(isColored: _isColored(4)),
      ],
    );
  }
}

class StepIndicatorItem extends StatelessWidget {
  const StepIndicatorItem({Key? key, required this.isColored})
      : super(key: key);

  final bool isColored;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isColored ? Colors.black : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
