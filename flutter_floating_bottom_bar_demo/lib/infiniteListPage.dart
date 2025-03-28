import 'package:flutter/material.dart';

class InfiniteListPage extends StatefulWidget {
  final Color color;
  final ScrollController? controller;

  InfiniteListPage({Key? key, required this.color, this.controller}) : super(key: key);

  @override
  _InfiniteListPageState createState() => _InfiniteListPageState();
}

class _InfiniteListPageState extends State<InfiniteListPage> {
  // Example list of items that we will show.
  late List<int> _items;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _items = List.generate(30, (index) => index); // Initial 30 items.
    _isLoading = false;

    // Listen for when the user reaches the end of the list and trigger the loading function.
    widget.controller?.addListener(() {
      if (widget.controller!.position.pixels == widget.controller!.position.maxScrollExtent && !_isLoading) {
        _loadMoreData();
      }
    });
  }

  // Simulate loading more data when the user reaches the end of the list.
  void _loadMoreData() {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _items.addAll(List.generate(20, (index) => _items.length + index)); // Add more items
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: ListView.builder(
        controller: widget.controller,
        itemCount: _items.length + 1, // Add one extra for the loading indicator.
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _isLoading
                ? Center(child: CircularProgressIndicator()) // Show loading indicator at the bottom.
                : SizedBox.shrink(); // Show nothing if not loading.
          } else {
            return ListTile(
              title: Text('Item ${_items[index]}', style: TextStyle(color: Colors.white)),
            );
          }
        },
      ),
    );
  }
}
