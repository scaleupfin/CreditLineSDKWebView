import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/validators/validation.dart';
import 'complete_profile.dart';

class PanNumber extends StatefulWidget {


  const PanNumber({
    Key? key,
  }) : super(key: key);

  @override
  State<PanNumber> createState() => _PanNumberState();
}

class _PanNumberState extends State<PanNumber> {

  final panNumberController = TextEditingController();
  var isChecked = false;
  var maritalList = [
    "Single", "Married", "Divorced", "Widowed" // Corrected from "Windowed"
  ];
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea( // Wrap with SafeArea
        top: true,
        bottom: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight, // Ensures the scrollable content takes up the full screen height
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:screenWidth * 0.06, // 6% of screen width
                          vertical: screenHeight * 0.04, // 4% of screen height
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'You’re almost there',
                              style: GoogleFonts.urbanist(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Provide PAN number',
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Ensure correct number is shared. You won’t be able to change later',
                              style: GoogleFonts.urbanist(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 20),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.00),
                              child: TextFormField(
                                style: GoogleFonts.urbanist(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: TColors.black,
                                ),
                                controller: panNumberController,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.characters,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Z]')),
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      print('suffixIcon icon clicked!');
                                    },
                                    child: Container(
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDADADA),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: SvgPicture.asset(
                                          "assets/credit_card/icons/ic_arrow_left.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  hintText: 'Enter PAN number',
                                  hintStyle: GoogleFonts.urbanist(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: TColors.darkGrey,
                                  ),
                                  filled: true,
                                  fillColor: TColors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                                ),
                                validator: TValidator.validatePhoneNumber,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Text(
                              'What’s your relationship Status?',
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: TColors.white,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Text(
                              'Just trying to get to know you better.',
                              style: GoogleFonts.urbanist(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: maritalList.sublist(0, 3).asMap().entries.map((entry) {
                                int index = entry.key;
                                String status = entry.value;

                                return Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                      print('$status clicked!');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _selectedIndex == index ? Colors.grey[300] : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                        child: Text(
                                          status,
                                          style: GoogleFonts.urbanist(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: TColors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = 3; // Update selected index for the fourth status
                                      });
                                      print('Widowed clicked!');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _selectedIndex == 3 ? Colors.grey[300] : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                        child: Text(
                                          maritalList[3],
                                          style: GoogleFonts.urbanist(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: TColors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                  fillColor: MaterialStateProperty.all(TColors.white),
                                  activeColor: TColors.white,
                                  checkColor: TColors.primary,
                                  side: const BorderSide(
                                    color: TColors.white,
                                    width: 1.5,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'By authorizing Scaleup, I can view my full loan account details, bill and credit information sourced from RBI-approved bureaus and lenders.',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            SizedBox(
                              width: screenWidth,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:screenWidth * 0.00,
                                  vertical: screenHeight * 0.03,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CompleteProfile(

                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Next",
                                    style: GoogleFonts.urbanist(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), // Your widget here
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
