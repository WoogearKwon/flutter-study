import 'package:flutter/material.dart';

class BottomSheetTestScreen extends StatefulWidget {
  @override
  _BottomSheetTestScreenState createState() => _BottomSheetTestScreenState();
}

class _BottomSheetTestScreenState extends State<BottomSheetTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.lightBlueAccent,
          child: Text('bottom sheet'),
          onPressed: () {

            final builder = AppBottomSheetBuilder(context);
            _showBottomSheet(builder);
          },
        ),
      ),
    );
  }

  void _showBottomSheet(AppBottomSheetBuilder builder) {
    final bs = StatefulAppBottomSheet._(builder);
    bs.show();
  }
}

class StatefulAppBottomSheet {
  var number = 1;
  AppBottomSheetBuilder _builder;

  StatefulAppBottomSheet._(this._builder);

  void show() {
    showModalBottomSheet(
      context: _builder.context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      isDismissible: _builder.isDismissible ?? true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return WillPopScope(
              onWillPop: _builder.isDismissible != null && !_builder.isDismissible
                  ? () => Future(() => false)
                  : null,
              child: _AppBottomSheetWidget._(
                // widget: _builder.widget,
                widget: Padding(
                  padding: EdgeInsets.all(10),
                  child: MaterialButton(
                    onPressed: () {
                      setModalState(() {
                        number+=1;
                        print('number = $number!');
                      });
                    },
                    child: Center(
                      child: Container(
                          child: Text(
                            'Continuous Number = $number',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )),
                    ),
                  ),
                ),
                onCancel: _builder.onCancel,
              ),
            );
          },
        );
      },
    );
  }
}

class AppBottomSheetBuilder {
  final BuildContext context;
  bool _isDismissible;
  VoidCallback _onCancel;

  AppBottomSheetBuilder(this.context)
      : assert(context != null, 'BuildContext is required.');

  bool get isDismissible => _isDismissible;

  set isDismissible(bool isDismissible) {
    assert(isDismissible != null);
    _isDismissible = isDismissible;
  }

  VoidCallback get onCancel => _onCancel;

  set onCancel(VoidCallback callback) {
    assert(callback != null);
    _onCancel = callback;
  }

  StatefulAppBottomSheet build() {
    return StatefulAppBottomSheet._(this);
  }
}

class _AppBottomSheetWidget extends StatelessWidget {
  final Widget widget;
  final VoidCallback onCancel;

  _AppBottomSheetWidget._({
    @required this.widget,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCancelButton(context),
            _buildContentView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onCancel ?? () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentView(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: Colors.white),
      child: widget,
    );
  }
}
