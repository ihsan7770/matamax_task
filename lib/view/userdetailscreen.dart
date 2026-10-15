
import 'package:flutter/material.dart';
import 'package:task/Model/usermodel.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailsScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;

    final padding = width * 0.05;
    final titleSize = (width * 0.055).clamp(22.0, 32.0);
    final textSize = (width * 0.038).clamp(14.0, 18.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: const Color(0xFF3157D5),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 800 : double.infinity,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: width * 0.12 > 65
                            ? 65
                            : width * 0.12,
                        backgroundColor: const Color(0xFFE3EAFF),
                        child: Text(
                          user.name.isNotEmpty
                              ? user.name[0].toUpperCase()
                              : '?',
                          style: TextStyle(
                            fontSize: titleSize * 1.5,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF3157D5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '@${user.username}',
                        style: TextStyle(
                          fontSize: textSize,
                          color: const Color(0xFF3157D5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'User ID: ${user.id}',
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Contact Information
                _sectionTitle('Contact Information', textSize),
                const SizedBox(height: 12),

                _detailsCard([
                  _detailRow(
                    Icons.email_outlined,
                    'Email',
                    user.email,
                    textSize,
                  ),
                  _detailRow(
                    Icons.phone_outlined,
                    'Phone',
                    user.phone,
                    textSize,
                  ),
                  _detailRow(
                    Icons.language_outlined,
                    'Website',
                    user.website,
                    textSize,
                  ),
                ]),

                const SizedBox(height: 24),

                // Address Information
                _sectionTitle('Address Information', textSize),
                const SizedBox(height: 12),

                _detailsCard([
                  _detailRow(
                    Icons.location_city_outlined,
                    'City',
                    user.address.city,
                    textSize,
                  ),
                  _detailRow(
                    Icons.home_outlined,
                    'Street',
                    user.address.street,
                    textSize,
                  ),
                  _detailRow(
                    Icons.apartment_outlined,
                    'Suite',
                    user.address.suite,
                    textSize,
                  ),
                  _detailRow(
                    Icons.markunread_mailbox_outlined,
                    'Zip Code',
                    user.address.zipcode,
                    textSize,
                  ),
                  _detailRow(
                    Icons.my_location_outlined,
                    'Latitude',
                    user.address.geo.lat,
                    textSize,
                  ),
                  _detailRow(
                    Icons.explore_outlined,
                    'Longitude',
                    user.address.geo.lng,
                    textSize,
                  ),
                ]),

                const SizedBox(height: 24),

                // Company Information
                _sectionTitle('Company Information', textSize),
                const SizedBox(height: 12),

                _detailsCard([
                  _detailRow(
                    Icons.business_outlined,
                    'Company',
                    user.company.name,
                    textSize,
                  ),
                  _detailRow(
                    Icons.lightbulb_outline,
                    'Catch Phrase',
                    user.company.catchPhrase,
                    textSize,
                  ),
                  _detailRow(
                    Icons.work_outline,
                    'Business',
                    user.company.bs,
                    textSize,
                  ),
                ]),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, double fontSize) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize + 2,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1E293B),
      ),
    );
  }

  Widget _detailsCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _detailRow(
    IconData icon,
    String title,
    String value,
    double fontSize,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF3157D5),
            size: fontSize + 6,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize - 1,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

