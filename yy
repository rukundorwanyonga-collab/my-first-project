import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/app_provider.dart";
import "dashboard_screen.dart";

class WizardScreen extends StatefulWidget {
  const WizardScreen({super.key});

  @override
  _WizardScreenState createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  // Controllers
  final _izinaItsindaController = TextEditingController();
  final _umubareController = TextEditingController();
  final _umusanzuController = TextEditingController();
  final _ingobokaController = TextEditingController();
  final _amandeController = TextEditingController();

  // Selected values
  double _ijanisha = 5.0;
  String _umutango = "Buri Kwezi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F4FD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF64B5F6), Color(0xFF42A5F5)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Igenabihe ry'Itsinda",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Uzuza amakuru yose",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),

              // FORM YOSE - One page
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF64B5F6).withValues(alpha: 0.15),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Amakuru y'Itsinda",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF42A5F5),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Izina ry'itsinda
                      TextField(
                        controller: _izinaItsindaController,
                        decoration: InputDecoration(
                          labelText: "Izina ry'Itsinda",
                          prefixIcon: const Icon(Icons.group, color: Color(0xFF42A5F5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Umubare w'abanyamuryango
                      TextField(
                        controller: _umubareController,
                        decoration: InputDecoration(
                          labelText: "Umubare w'Abanyamuryango",
                          prefixIcon: const Icon(Icons.people, color: Color(0xFF42A5F5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),

                      // Umusanzu
                      TextField(
                        controller: _umusanzuController,
                        decoration: InputDecoration(
                          labelText: "Umusanzu (RWF)",
                          prefixIcon: const Icon(Icons.savings, color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),

                      // Ingoboka
                      TextField(
                        controller: _ingobokaController,
                        decoration: InputDecoration(
                          labelText: "Ingoboka (RWF)",
                          prefixIcon: const Icon(Icons.volunteer_activism, color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),

                      // Amande
                      TextField(
                        controller: _amandeController,
                        decoration: InputDecoration(
                          labelText: "Amande (RWF)",
                          prefixIcon: const Icon(Icons.gavel, color: Colors.orange),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),

                      // Ijanisha
                      const Text(
                        "Ijanisha ku Nyungu",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildPercentageOption(2.5),
                          _buildPercentageOption(5.0),
                          _buildPercentageOption(10.0),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Umutango
                      const Text(
                        "Umutango",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildFrequencyOption("Buri Kwezi", Icons.calendar_month),
                          _buildFrequencyOption("Buri Cyumweru", Icons.calendar_view_week),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Button
                      ElevatedButton(
                        onPressed: () {
                          final provider = Provider.of<AppProvider>(context, listen: false);
                          provider.updateSettings(
                            groupName: _izinaItsindaController.text,
                            memberCount: int.tryParse(_umubareController.text) ?? 0,
                            umusanzu: double.tryParse(_umusanzuController.text) ?? 2000,
                            ingoboka: double.tryParse(_ingobokaController.text) ?? 200,
                            amande: double.tryParse(_amandeController.text) ?? 500,
                            ijanisha: _ijanisha,
                            umutango: _umutango,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const DashboardScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF42A5F5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Kubika Igenabihe",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPercentageOption(double value) {
    bool selected = _ijanisha == value;
    return InkWell(
      onTap: () {
        setState(() {
          _ijanisha = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF42A5F5) : const Color(0xFFE8F4FD),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "$value%",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: selected ? Colors.white : const Color(0xFF42A5F5),
          ),
        ),
      ),
    );
  }

  Widget _buildFrequencyOption(String label, IconData icon) {
    bool selected = _umutango == label;
    return InkWell(
      onTap: () {
        setState(() {
          _umutango = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF42A5F5) : const Color(0xFFE8F4FD),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: selected ? Colors.white : const Color(0xFF42A5F5), size: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : const Color(0xFF42A5F5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
