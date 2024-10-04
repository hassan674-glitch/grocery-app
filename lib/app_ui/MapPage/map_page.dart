import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:grocery_app/app_ui/MapPage/markers_data.dart';
import 'package:grocery_app/utilis/color.dart';
import 'package:grocery_app/widgets/nunito_text.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final List<MarkerData> _markerData = [];
  final List<Marker> _markers = [];
  LatLng? _selectedPosition;
  LatLng? _draggedPosition;
  LatLng? _myLocation;
  bool _isDragging = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<dynamic> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isNotEmpty) {
      _searchPlaces(_searchController.text);
    } else {
      setState(() {
        _searchResult = [];
        _isSearching = false;
      });
    }
  }

  Future<void> _determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Location services are disabled"))
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Location permissions are denied"))
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Location permissions are permanently denied"))
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _myLocation = LatLng(position.latitude, position.longitude);
        _mapController.move(_myLocation!, 15.0);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error getting location: $e"))
      );
    }
  }

  void _addMarker(LatLng position, String title, String description) {
    setState(() {
      final markerData = MarkerData(position: position, description: description, title: title);
      _markerData.add(markerData);
      _markers.add(_buildMarker(markerData));
    });
  }

  Marker _buildMarker(MarkerData markerData) {
    return Marker(
      point: markerData.position,
      width: 80.w,
      height: 80.h,
      child: GestureDetector(
        onTap: () => _showMarkerInfo(markerData),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: NunitoText(
                text: markerData.title,
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Icon(Icons.location_on, color: Colors.redAccent, size: 40),
          ],
        ),
      ),
    );
  }

  void _showMarkerInfo(MarkerData markerData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(markerData.title),
        content: Text(markerData.description),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  // This replaces _showMarkerLocation and _buildMarkerDialog
  void _showMarkerLocationDialog(LatLng position) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Marker"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _addMarker(position, titleController.text, descController.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResult = []);
      return;
    }

    try {
      final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5');
      final response = await http.get(url);
      final data = json.decode(response.body);

      setState(() {
        _searchResult = data.isNotEmpty ? data : [];
        _isSearching = true;
      });
    } catch (e) {
          GetSnackBar(title: "Error searching places: $e",);
    }
  }

  void _moveToLocation(double lat, double lon) {
    final location = LatLng(lat, lon);
    _mapController.move(location, 15);
    setState(() {
      _selectedPosition = location;
      _searchResult = [];
      _isSearching = false;
      _searchController.clear();
    });
  }

  Future<void> _shareLocation() async {
    try {
      LatLng? locationToShare = _myLocation ?? _selectedPosition;

      if (locationToShare == null) {
        await _determinePosition();
        locationToShare = _myLocation;
      }

      if (locationToShare != null) {
        final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${locationToShare.latitude},${locationToShare.longitude}';
        final String message = 'Check out my location: $googleMapsUrl';

        await Share.share(message, subject: 'My Location');
      } else {

        GetSnackBar(title:'Unable to share location. Please ensure location services are enabled.',);
      }
    } catch (e) {
      print(e);
    GetSnackBar(title: 'Error sharing location: $e',);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMap(),
          _buildSearchBar(),
          _buildAddLocationButton(),
          _buildLocationButtons(),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        onTap: (_, latLng) => setState(() {
          _selectedPosition = latLng;
          _draggedPosition = _selectedPosition;
        }),
        initialCenter: const LatLng(33.3661, 73.6874),
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerLayer(markers: _markers),
        if (_isDragging && _draggedPosition != null)
          MarkerLayer(markers: [
            Marker(
              point: _draggedPosition!,
              width: 80.w,
              height: 80.h,
              child: const Icon(Icons.location_on, color: Colors.indigo, size: 40),
            ),
          ]),
        if (_myLocation != null)
          MarkerLayer(markers: [
            Marker(
              point: _myLocation!,
              width: 80.w,
              height: 80.h,
              child: const Icon(Icons.location_on, color: Colors.green, size: 40),
            ),
          ]),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: 40,
      left: 10,
      right: 10,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search place...",
                hintStyle: TextStyle(color: AppColor.hintTextColor),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _isSearching
                    ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _isSearching = false;
                      _searchResult = [];
                    });
                  },
                  icon: const Icon(CupertinoIcons.clear),
                )
                    : null,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () => setState(() => _isSearching = true),
            ),
          ),
          if (_isSearching && _searchResult.isNotEmpty)
            Container(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _searchResult.length,
                itemBuilder: (ctx, index) {
                  final place = _searchResult[index];
                  return ListTile(
                    title: Text(place["display_name"] ?? "Unknown location"),
                    onTap: () {
                      final lat = double.tryParse(place['lat'] ?? '');
                      final lon = double.tryParse(place['lon'] ?? '');
                      if (lat != null && lon != null) {
                        _moveToLocation(lat, lon);
                      }
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
  Widget _buildAddLocationButton() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: FloatingActionButton(
        heroTag: 'add-location-button',  // Only using heroTag
        child: Icon(_isDragging ? Icons.wrong_location : Icons.add_location),
        backgroundColor: _isDragging ? Colors.redAccent : Colors.indigo,
        foregroundColor: Colors.white,
        onPressed: () => setState(() => _isDragging = !_isDragging),
      ),
    );
  }

  Widget _buildLocationButtons() {
    return Positioned(
      bottom: 20.h,
      right: 20.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'location-search-button',  // Only using heroTag
            child: const Icon(Icons.location_searching_rounded),
            backgroundColor: Colors.white,
            foregroundColor: Colors.indigo,
            onPressed: _determinePosition,
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'share-location-button',  // Only using heroTag
            child: const Icon(Icons.share),
            backgroundColor: Colors.white,
            foregroundColor: Colors.indigo,
            onPressed: (){
              _shareLocation();
            },
          ),
          if (_isDragging && _draggedPosition != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FloatingActionButton(
                heroTag: 'confirm-location-button',  // Only using heroTag
                child: const Icon(Icons.check),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                onPressed: () {
                  _showMarkerLocationDialog(_draggedPosition!);
                  setState(() {
                    _isDragging = false;
                    _draggedPosition = null;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }


}