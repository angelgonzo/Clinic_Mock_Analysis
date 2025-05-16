# 🏥 Clinic Data Analysis Project

This project showcases a relational database schema for a fictional medical clinic, complete with data analysis using SQL and Tableau. It includes a fully designed database schema, analytical SQL queries, and interactive Tableau visualizations for exploring patient activity, appointment trends, and healthcare operations.

---

## 📂 Contents

- Mock data includes (csv fornmat):
    - appointments
    - patients
    - doctors
    - diagnoses
    - prescriptions
- `clinic.sql`: Schema definitions and analytical SQL queries
- SQL queries include:
  - Appointment counts and trends
  - Diagnosis and prescription statistics
  - No-show and inactive patient tracking
  - Time-based visit patterns
- Tableau dashboards:
  - Appointments per week (Bar Chart)
  - Appointment distribution by doctor specialty (Pie Chart)
  - Flagging patients with no visits in 1+ months
  - Patient activity insights

---

## 🗃️ Database Design

The database consists of five main tables:

- `patients`: Basic demographics and contact info
- `doctors`: Medical staff and their specialties
- `appointments`: Scheduled visit data and status
- `diagnoses`: Diagnoses per appointment
- `prescriptions`: Medications issued per appointment

Relational integrity is maintained via foreign keys, and data types are chosen to reflect real-world constraints.

---

## 🔍 SQL Analytics Highlights

- **Most common diagnosis codes**
- **Patients with the most prescriptions**
- **No-show rate per doctor**
- **Average visit duration by doctor**
- **Weekly appointment distribution**
- **Patients with no visits in 6+ months**

The project emphasizes both operational metrics and patient engagement insights.

---

## 📊 Tableau Visualizations

Key dashboards and charts created in Tableau:

1. **Bar Chart** – Appointments per week  
2. **Pie Chart** – Appointment distribution by specialty  
3. **Patient Flagging** – Patients with no visits in 1+ months 

Visualizations are designed to support healthcare operations, outreach, and scheduling decisions.

---

## 🚀 Getting Started

### Prerequisites

- MySQL or MariaDB (local or cloud instance)
- [Tableau Desktop](https://www.tableau.com/products/desktop) or Tableau Public
- Optional: MySQL Workbench for database management

### Instructions

1. Run `clinic.sql` in MySQL to create and populate the database schema.
2. Connect Tableau to your database or export the data to CSV.
3. Use the provided queries or calculated fields in Tableau to build dashboards.
4. Customize filters (e.g., by doctor, date range, specialty) for exploration.

---

## 💡 Future Improvements

- Add mock data generation scripts
- Expand schema to include billing or lab results
- Create a web interface for visualization (e.g., using Flask + Dash)
- Automate patient inactivity flags with triggers or alerts

---

## 📧 Contact

If you have questions or want to collaborate, feel free to reach out via GitHub Issues or start a discussion.

---

## 🛠️ Tools Used

- **SQL (MySQL)**
- **Tableau**
- **MySQL Workbench**
- **Git & GitHub**

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
