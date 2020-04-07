import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {


  String _name  = '';
  String _email = '';
  String _password = '';
  String _date = '';

  List<String> _powers = ['Volar', 'Rayos X', 'Super fuerza', 'Super visión'];

  String _optStringSelected = 'Volar';

  TextEditingController _inputTextDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs Page"),

      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          _createBasicInput(),
          Divider(),
          _createEmailInput(),
          Divider(),
          _createPasswordInput(),
          Divider(),
          _createDateInput(context),
          Divider(),
          _createDropDown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createBasicInput(){

    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        counter: Text('Letras: ${ this._name.length }'),
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon( Icons.accessibility ),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Texto de ayuda',
      ),
      onChanged: (value){
        setState( () => this._name = value );
      },

    );
  }

  Widget _createEmailInput(){
    return TextField(
      keyboardType: TextInputType.emailAddress ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        icon: Icon(Icons.email),
        suffixIcon: Icon( Icons.alternate_email ),
        hintText: 'Email de la persona',
        labelText: 'Email',
      ),
      onChanged: (value) => setState( () => this._email = value ),

    );
  }

  Widget _createPasswordInput(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        icon: Icon(Icons.vpn_key),
        suffixIcon: Icon( Icons.lock_outline ),
        hintText: 'Contraseña de la persona',
        labelText: 'Contraseña',
      ),
      onChanged: (value) => setState( () => this._password = value ),

    );
  }

  Widget _createDateInput(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputTextDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        hintText: 'Fecha de nacimiento de la persona',
        labelText: 'Fecha de nacimiento',
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },

    );
  }

  List<DropdownMenuItem<String>> _getDropDownItems(){

    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((opt){
      list.add(DropdownMenuItem(
        value: opt,
        child: Text(opt),
        )
      );
    });

    return list;
  }

  Widget _createDropDown(){
    return Row(
      children: <Widget>[
        Icon( Icons.accessibility ),
        SizedBox(width: 30.0,),
        Expanded(

          child: DropdownButton(
            value: _optStringSelected,
            items: _getDropDownItems(),
            onChanged: (opt){

              setState(() {
                _optStringSelected = opt;
              });
            },
          ),
        )
      ],
    );
  }


  void _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime(DateTime.now().year + 5),
      locale: Locale('es')
    );

    if (picked != null){
      setState(() {
        this._date = picked.toString();
        _inputTextDateController.text = this._date;
      });

    }

  }






  Widget _createPerson(){
    return ListTile(
      title: Text('Nombre: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_optStringSelected),
    );
  }



}
