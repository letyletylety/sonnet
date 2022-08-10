# sonnet

This app is the rxdart example in modern style.

<br>



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


---
<br><br><br>
```dart
StreamController()
StreamController.broadcast()

/// Exactly like a normal broadcast StreamController with one exception:

/// this class is both a Stream and Sink.
///
/// This Subject allows sending data, error and done events to the listener.
///
/// PublishSubject is, by default, a broadcast (aka hot) controller, in order
/// to fulfill the Rx Subject contract. This means the Subject's `stream` can
/// be listened to multiple times.
PublishSubject<String>();


/// A special StreamController that captures the latest item that has been
/// added to the controller, and emits that as the first item to any new
/// listener.
///
/// This subject allows sending data, error and done events to the listener.
/// The latest item that has been added to the subject will be sent to any
/// new listeners of the subject. After that, any new events will be
/// appropriately sent to the listeners. It is possible to provide a seed value
/// that will be emitted if no items have been added to the subject.
///
/// BehaviorSubject is, by default, a broadcast (aka hot) controller, in order
/// to fulfill the Rx Subject contract. This means the Subject's `stream` can
/// be listened to multiple times.
BehaviorSubject<String>();

/// A special StreamController that captures all of the items that have been
/// added to the controller, and emits those as the first items to any new
/// listener.
///
/// This subject allows sending data, error and done events to the listener.
/// As items are added to the subject, the ReplaySubject will store them.
/// When the stream is listened to, those recorded items will be emitted to
/// the listener. After that, any new events will be appropriately sent to the
/// listeners. It is possible to cap the number of stored events by setting
/// a maxSize value.
///
/// ReplaySubject is, by default, a broadcast (aka hot) controller, in order
/// to fulfill the Rx Subject contract. This means the Subject's `stream` can
/// be listened to multiple times.
ReplaySubject<String>(maxSize: 4);
```
