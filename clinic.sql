CREATE DATABASE clinic;
USE clinic;

CREATE TABLE patients
(
	patient_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birth_date date not null,
    gender varchar(10),
    phone varchar(25) not null unique
);

CREATE TABLE doctors
(
	doctor_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    speciality varchar(50)
);

CREATE TABLE appointments
(
	appointment_id int auto_increment primary key,
    patient_id int,
    doctor_id int,
    appointment_date datetime,
    status varchar(20),
    duration_minutes int,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

CREATE TABLE diagnoses
(
	diagnosis_id int auto_increment primary key,
    appointment_id int,
    diagnosis_code varchar(10),
    description text,
    foreign key (appointment_id) references appointments(appointment_id)
);

CREATE TABLE prescriptions
(
	prescription_id int auto_increment primary key,
    appointment_id int,
    medication_name varchar(100),
    dosage varchar(50),
    duration_days int,
    foreign key (appointment_id) references appointments(appointment_id)
);

#REAL WORLD QUESTIONS



#Patient and Appointment Analytics
#Number of appointments per doctor.
select
	doctor_id, count(*) as total_appointments
from appointments
group by appointments.doctor_id;

#Which patient have had the most appointments?
select
	patient_id,
	count(*) as total_appointments
from appointments
group by patient_id
order by total_appointments desc;

#What is the total amount of no-show appointments per doctor?
select
	doctor_id,
    count(*) as total_no_show
from appointments
where status = 'no-show'
group by doctor_id
order by total_no_show desc;

#What is the highest rate of no-show appointments per doctor
select doctor_id,
       COUNT(CASE WHEN status = 'no-show' THEN 1 END) * 100.0 / COUNT(*) AS no_show_rate
from appointments
group by doctor_id;

#How many unique patients did each doctor see this month?
select
	doctor_id,
    count(distinct patient_id) as unique_patients
from appointments
where month(appointment_date) = month(curdate())
	and year(appointment_date) = year(curdate())
group by doctor_id;



#Diagnosis Tracking
#What is the most common diagnosis code?
select
	diagnosis_code,
    count(*) as frequency
from diagnoses
group by diagnosis_code
order by frequency desc;

#What’s the average number of diagnoses per appointment?
select
	avg(num_diagnosis) AS avg_diagnoses_per_appointment
from (
	select
	appointment_id,
    count(*) as num_diagnosis
from diagnoses
group by appointment_id
) as diagnosis_count;



#Prescription Analysis
#Who are the patients with the most prescriptions?
select
	patients.patient_id,
    concat(
    patients.first_name,
    ' ',
    patients.last_name
    ) as patient_name,
    count(*) as total_prescriptions
from prescriptions
join appointments
	on appointments.appointment_id = prescriptions.appointment_id
join patients
	on patients.patient_id = appointments.patient_id
group by patients.patient_id
order by total_prescriptions desc;



#TIME BASED TRENDS
#How many appointments were scheduled each day of the week?
select
	count(*) as appointments,
    dayname(appointment_date) as day_name
from appointments
group by day_name
order by appointments desc;

#What is the average appointment duration by month?
select
	month(appointment_date) as month_appt,
    round(avg(duration_minutes), 2) as avg_minutes
from appointments
WHERE status = 'completed'
GROUP BY month(appointment_date)
order by month(appointment_date);

#What is the average visit duration by doctor?
select
	ROUND(AVG(duration_minutes), 2) as avg_minutes,
    doctor_id
from appointments
where status = 'completed'
group by doctor_id;



#Data Quality / Risk Flags
#Which patients have not had any appointments in 1+ months or who have never had an appointment?
SELECT 
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    MAX(a.appointment_date) AS last_appointment
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id
HAVING DATEDIFF(CURDATE(), last_appointment) > 30
    OR last_appointment IS NULL;
    
