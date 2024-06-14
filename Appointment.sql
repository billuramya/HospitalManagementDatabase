CREATE TABLE Appointments (
    AppointmentId INT IDENTITY(1,1) PRIMARY KEY,
    DoctorId INT NOT NULL,
    PatientId INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Concern NVARCHAR(MAX),
    FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId),
    FOREIGN KEY (PatientId) REFERENCES Patient(Patient_Id)
);

CREATE PROCEDURE AddAppointment
    @DoctorId INT,
    @PatientId INT,
    @AppointmentDate DATETIME,
    @StartTime TIME,
    @EndTime TIME,
    @Concern NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Appointments (DoctorId, PatientId, AppointmentDate, StartTime, EndTime, Concern)
    VALUES (@DoctorId, @PatientId, @AppointmentDate, @StartTime, @EndTime, @Concern);
END


CREATE PROCEDURE AllAppointmentDetails
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        AppointmentId,
        DoctorId AS DoctorFkId,
        PatientId AS PatientFkId,
        AppointmentDate,
        StartTime,
        EndTime,
        Concern
    FROM Appointments;
END

CREATE PROCEDURE getDoctorwithPatientDetails
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        d.DoctorName AS DoctorNames,
        d.DoctorImage AS DoctorImages,
        p.Patient_Id AS PatientID,
        p.Patient_Name AS PatientName,
        p.Email AS PatientEmail,
        
        p.Age AS PatientAge,
        p.Gender,
       
        
        a.Concern
    FROM 
        Appointments a
    INNER JOIN 
        Doctor d ON a.DoctorId = d.DoctorId
    INNER JOIN 
        Patient p ON a.PatientId = p.Patient_Id;
END
