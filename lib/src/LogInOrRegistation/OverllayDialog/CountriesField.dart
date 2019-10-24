import 'package:campus_guide/src/LogInOrRegistation/Registation_for_student.dart';
import 'package:campus_guide/src/Utils/Common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountriesField extends StatefulWidget {
  @override
  _CountriesFieldState createState() => _CountriesFieldState();
}

class _CountriesFieldState extends State<CountriesField> {
  // final FocusNode _focusNode = FocusNode();

  OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  var _current_section = "Section A";

  bool _overllay_status = false;

  void close_or_open() {
    if (_overllay_status) {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context).insert(this._overlayEntry);
    } else {
      this._overlayEntry.remove();
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset.dx,
              top: offset.dy + 10.0,
              width: size.width,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.0),
                child: Material(
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),

                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),]


                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            _current_section = "Section_A";

                            new RegistationForStudent(
                              current_section: "Section_A",
                            );

                            Common.current_section = "Section_A";

                            if (_overllay_status) {
                              setState(() {
                                _overllay_status = false;
                              });

                              close_or_open();
                            } else {
                              setState(() {
                                _overllay_status = true;
                              });

                              close_or_open();
                            }
                          },
                          child: ListTile(
                            title: Align(
                                alignment: Alignment.center,
                                child: Text('Section_A')),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _current_section = "Section_B";

                            new RegistationForStudent(
                              current_section: "Section_B",
                            );

                            Common.current_section = "Section_B";

                            if (_overllay_status) {
                              setState(() {
                                _overllay_status = false;
                              });

                              close_or_open();
                            } else {
                              setState(() {
                                _overllay_status = true;
                              });

                              close_or_open();
                            }
                          },
                          child: ListTile(
                            title: Align(
                                alignment: Alignment.center,
                                child: Text('Section_B')),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _current_section = "Section_C";
                            Common.current_section = "Section_C";

                            new RegistationForStudent(
                              current_section: "Section_C",
                            );

                            if (_overllay_status) {
                              setState(() {
                                _overllay_status = false;
                              });

                              close_or_open();
                            } else {
                              setState(() {
                                _overllay_status = true;
                              });

                              close_or_open();
                            }
                          },
                          child: ListTile(
                            title: Align(
                                alignment: Alignment.center,
                                child: Text('Section_C')),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _current_section = "Section_D";

                            new RegistationForStudent(
                              current_section: "Section_D",
                            );

                            Common.current_section = "Section_D";

                            if (_overllay_status) {
                              setState(() {
                                _overllay_status = false;
                              });

                              close_or_open();
                            } else {
                              setState(() {
                                _overllay_status = true;
                              });

                              close_or_open();
                            }
                          },
                          child: ListTile(
                            title: Align(
                                alignment: Alignment.center,
                                child: Text('Section_D')),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _current_section = "Section_E";

                            new RegistationForStudent(
                              current_section: "Section_E",
                            );

                            Common.current_section = "Section_E";

                            if (_overllay_status) {
                              setState(() {
                                _overllay_status = false;
                              });

                              close_or_open();
                            } else {
                              setState(() {
                                _overllay_status = true;
                              });

                              close_or_open();
                            }
                          },
                          child: ListTile(
                            title: Align(
                                alignment: Alignment.center,
                                child: Text('Section_E')),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _current_section = "Section_F";

                            new RegistationForStudent(
                              current_section: "Section_F",
                            );
                            Common.current_section = "Section_F";

                            if (_overllay_status) {
                              setState(() {
                                _overllay_status = false;
                              });

                              close_or_open();
                            } else {
                              setState(() {
                                _overllay_status = true;
                              });

                              close_or_open();
                            }
                          },
                          child: ListTile(
                            title: Align(
                                alignment: Alignment.center,
                                child: Text('Section_F')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Section",
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              if (_overllay_status) {
                setState(() {
                  _overllay_status = false;
                });

                close_or_open();
              } else {
                setState(() {
                  _overllay_status = true;
                });

                close_or_open();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _current_section,
                  style: TextStyle(color: Colors.black54),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),

          SizedBox(height: 2,),
          Divider(
            height: 1,
            color: Colors.black45,
          )
        ],
      ),
    );
  }
}
