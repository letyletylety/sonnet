# sonnet

This repo is the rxdart example in modern style.

## The original project

[https://github.com/nhandrew/rxdartstreams](https://github.com/nhandrew/rxdartstreams)

Thanks to [@nhandrew](https://www.youtube.com/channel/UCSKeK_8IzsqwKQBJuIGJPaA)

## Improvements  

### 1.  This repo uses asset file with *rootBundle*.

```dart
    final temp = await rootBundle.loadString('assets/sonnets.txt');
    final contents = temp.split('\n');
```

This code replaces the code below.

```dart
    var contents = await File('YOUR SONNET FILE LOCATION')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter()).toList();
```

So, you don't have to replace the path of sonnet.

<br>
<br>

### 2. Replace deprecated *RaisedButton* with *ElevatedButton*

original 
```dart
RaisedButton(
    color: Colors.red,

    child: Text('Engage', style: TextStyle(color: Colors.white)),
    onPressed: () {
        readerBloc.startReading();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Read()));
    },
)
```

new
```dart
ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Colors.red),
    child:
        const Text('Engage', style: TextStyle(color: Colors.white)),
    onPressed: () {
        readerBloc.startReading();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Read()));
    },
)
```