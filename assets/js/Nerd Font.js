function getIcons() {
  var classss = document.querySelectorAll(".class-name");
  var code = document.querySelectorAll(".codepoint");


  var map = {}
  for (var i = 0; i < classss.length; i++) {
    var name = classss[i].innerText.replaceAll('-', '_');
    var codepoint = code[i].innerText;

    var aux = map[name.split("_")[1]];
    var data = `static const IconData ${name} = NFIconData(0x${codepoint});`
    if (aux == null) {
      aux = [data]
    } else {
      aux.push(data)
    }
    map[name.split("_")[1]] = aux;
  }
  console.log(map)

  for (const key in map) {
    var element = map[key];
    var text = "";
    for (let i = 0; i < element.length; i++) {
      text += element[i] + "\n";

    }


    console.log(text);

  }

}