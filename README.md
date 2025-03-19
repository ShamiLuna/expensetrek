ExpenseTrek - Smart Finance Tracker
ExpenseTrek is a modern finance management app built with Flutter & GetX, designed for seamless tracking of income, expenses, and budgets.

🔗 GitHub Repository: https://github.com/ShamiLuna/expensetrek.git

📌 Features
✔ Secure Storage: Uses Flutter Secure Storage for encrypted data protection.
✔ Home Page: Charts showing highest expenses for better financial insights.
✔ Transactions Page: Filter transactions by category, date, and amount.
✔ Adding Page: Add income & expenses with detailed financial inputs:


Architectural Design & Approach

Uses GetX for state management due to its lightweight and efficient nature.

Three-layer architecture: Presentation (UI), Business Logic (Controllers), and Data Layer (Secure Storage & Firebase Auth).



Security & Data Protection

AES Encryption protects financial data.

Secure PIN for exporting and importing data.

Local Storage Isolation ensures no direct data exposure.



Key Features

Home Page: Charts & graphs for expense insights.

Transactions Page: Advanced filtering options.

Budget Page: Real-time budget tracking.

Profile Page: Secure export/import of financial data.

Customization: Multi-theme and language support.


Testing & Validation

Firebase authentication, secure storage, local notifications, and UI themes were tested.

Future testing improvements will include better controller & UI coverage.



Challenges & Fixes

Resolved image picker and version conflicts.

Fixed Gradle issues with proper versioning.

Ensured secure data handling through encryption.

GST, invoice numbers, category suggestions, vendor details.
✔ Budget Page: Create & track budgets with real-time updates.
✔ Profile Page: Export/Import user data for secure backups.
✔ Settings: Multiple themes & languages for a personalized experience.
🔒 Why Secure Storage Matters?
Financial data requires encryption to prevent leaks or unauthorized access.
Flutter Secure Storage ensures AES-encrypted data storage, keeping transactions safe.
Export/Import functionality allows users to securely migrate financial records.
🚀 Tech Stack
Flutter for frontend UI.
GetX for state management.
Flutter Secure Storage for encrypted data handling.
Firebase Auth for authentication.
Local Notifications for financial reminders.
🛠 Setup & Installation
1️⃣ Clone the repository:

sh
Copy
Edit
git clone https://github.com/ShamiLuna/expensetrek.git  
cd expensetrek  
2️⃣ Install dependencies:

sh
Copy
Edit
flutter pub get  
3️⃣ Run the app:

sh
Copy
Edit
flutter run  
📩 Contact & Support
For any queries or support, contact:
📧 flutterappdevelopershamina@gmail.com
