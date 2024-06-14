CREATE TABLE Doctor (
    DoctorId INT IDENTITY(1,1) PRIMARY KEY,
    DoctorName NVARCHAR(100) NOT NULL,
    DoctorEmail NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(15),
    DoctorAge INT,
    Gender NVARCHAR(10),
    DoctorAddress NVARCHAR(200),
    Qualification NVARCHAR(100),
    Specialization NVARCHAR(100),
    Experience FLOAT,
    DoctorImage NVARCHAR(MAX)
);
--add Doctor
CREATE PROCEDURE AddDoctor
    @DoctorName NVARCHAR(100),
    @DoctorEmail NVARCHAR(100),
    @PhoneNumber NVARCHAR(15),
    @DoctorAge INT,
    @Gender NVARCHAR(10),
    @DoctorAddress NVARCHAR(200),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @Experience FLOAT,
    @DoctorImage NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Doctor (DoctorName, DoctorEmail, PhoneNumber, DoctorAge, Gender, DoctorAddress, Qualification, Specialization, Experience, DoctorImage)
    VALUES (@DoctorName, @DoctorEmail, @PhoneNumber, @DoctorAge, @Gender, @DoctorAddress, @Qualification, @Specialization, @Experience, @DoctorImage)
END
--get all
CREATE PROCEDURE GetAllDoctors
AS
BEGIN
    SELECT * FROM Doctor
END

--get By Id
CREATE PROCEDURE GetDoctor
    @DoctorId INT
AS
BEGIN
    SELECT * FROM Doctor WHERE DoctorId = @DoctorId
END

--update

--delete
CREATE PROCEDURE DeleteDoctor
    @DoctorId INT
AS
BEGIN
    DELETE FROM Doctor WHERE DoctorId = @DoctorId
END


alter PROCEDURE UpdatePatient
@Patientid int,
    @Patient_Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @age INT,
    @gender NVARCHAR(10),
    @diagnosis NVARCHAR(255)
AS
BEGIN
    UPDATE Patients
    SET
        Name = @Patient_Name,
        Email = @Email,
        Age = @age,
        Gender = @gender,
        Diagnosis = @diagnosis
    WHERE
        
        PatientId = @PatientId;
        
END
