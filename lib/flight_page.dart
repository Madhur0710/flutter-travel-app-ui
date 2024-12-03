import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookFlightPage extends StatefulWidget {
  @override
  _BookFlightPageState createState() => _BookFlightPageState();
}

class _BookFlightPageState extends State<BookFlightPage> {
  bool isOneWay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Book Your Flight',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // One-way and Round-trip toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTripOption('One Way', isOneWay),
                  _buildTripOption('Round Trip', !isOneWay),
                ],
              ),
              SizedBox(height: 20),

              // Input fields
              _buildInputField(Icons.flight_takeoff, 'From', 'San Francisco'),
              SizedBox(height: 10),
              _buildInputField(Icons.flight_land, 'Destination', 'New York'),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildInputField(Icons.person, 'Passengers', '2 Adults'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildInputField(Icons.calendar_today, 'Departure', '5 July 2020'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildInputField(Icons.class_, 'Class', 'Business'),
              SizedBox(height: 20),

              // Search button
              ElevatedButton(
                onPressed: () {
                  // Add search functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Search The Flight',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Recommended section
              Text(
                'Recommended',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),

              // Scrollable horizontal list for flight cards
              SizedBox(
                height: 120, // Adjust height for cards
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildScrollableFlightCard('SFC → NYC', '\$2,453', '7 August 2020', Colors.blue),
                    SizedBox(width: 10),
                    _buildScrollableFlightCard('NYC → LAX', '\$1,920', '10 August 2020', Colors.orange),
                    SizedBox(width: 10),
                    _buildScrollableFlightCard('LAX → CHI', '\$1,670', '15 August 2020', Colors.green),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripOption(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOneWay = label == 'One Way';
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String label, String placeholder) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 5),
              Text(
                placeholder,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableFlightCard(
      String route, String price, String date, Color backgroundColor) {
    return Container(
      width: 200, // Width for each card
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            route,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            date,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Spacer(),
          Text(
            price,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
