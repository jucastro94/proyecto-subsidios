-- triggers


-- Trigger for auditing Personas table
CREATE TRIGGER Audit_Personas
ON Personas
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insert into the corresponding audit table for INSERT operation
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO Audit_Personas (id_Personas, nombre, apellido, telefono, direccion, fechanacimiento, numeroidentificacion, tipoidentificacion, lugarresidencia, rol, clave, correo, estado, actionDate, action, id)
            SELECT id, nombre, apellido, telefono, direccion, fechanacimiento, numeroidentificacion, tipoidentificacion, lugarresidencia, rol, clave, correo, estado, GETDATE(), 'creado', NEWID()
            FROM inserted;
        END;

        -- Insert into the corresponding audit table for DELETE operation
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Personas (id_Personas, nombre, apellido, telefono, direccion, fechanacimiento, numeroidentificacion, tipoidentificacion, lugarresidencia, rol, clave, correo, estado, actionDate, action, id)
            SELECT id, nombre, apellido, telefono, direccion, fechanacimiento, numeroidentificacion, tipoidentificacion, lugarresidencia, rol, clave, correo, estado, GETDATE(), 'eliminado', NEWID()
            FROM deleted;
        END;

        -- Insert into the corresponding audit table for UPDATE operation
        IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Personas (id_Personas, nombre, apellido, telefono, direccion, fechanacimiento, numeroidentificacion, tipoidentificacion, lugarresidencia, rol, clave, correo, estado, actionDate, action, id)
            SELECT i.id, i.nombre, i.apellido, i.telefono, i.direccion, i.fechanacimiento, i.numeroidentificacion, i.tipoidentificacion, i.lugarresidencia, i.rol, i.clave, i.correo, i.estado, GETDATE(), 'actualizado', NEWID()
            FROM inserted i
            INNER JOIN deleted d ON i.id = d.id;
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH;
END;


-- Trigger for auditing Proyectos table
CREATE TRIGGER Audit_Proyectos
ON Proyectos
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insert into the corresponding audit table for INSERT operation
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO Audit_Proyectos (id_Proyectos, direccion, ubicacion, estrato, ciudad, departamento, indicaciones, actionDate, action, id)
            SELECT id, direccion, ubicacion, estrato, ciudad, departamento, indicaciones, GETDATE(), 'creado', NEWID()
            FROM inserted;
        END;

        -- Insert into the corresponding audit table for DELETE operation
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Proyectos (id_Proyectos, direccion, ubicacion, estrato, ciudad, departamento, indicaciones, actionDate, action, id)
            SELECT id, direccion, ubicacion, estrato, ciudad, departamento, indicaciones, GETDATE(), 'eliminado', NEWID()
            FROM deleted;
        END;

        -- Insert into the corresponding audit table for UPDATE operation
        IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Proyectos (id_Proyectos, direccion, ubicacion, estrato, ciudad, departamento, indicaciones, actionDate, action, id)
            SELECT i.id, i.direccion, i.ubicacion, i.estrato, i.ciudad, i.departamento, i.indicaciones, GETDATE(), 'actualizado', NEWID()
            FROM inserted i
            INNER JOIN deleted d ON i.id = d.id;
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH;
END;


-- Trigger for auditing Subsidios table
CREATE TRIGGER Audit_Subsidios
ON Subsidios
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insert into the corresponding audit table for INSERT operation
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO Audit_Subsidios (id_Subsidios, nombre, actionDate, action, id)
            SELECT id, nombre, GETDATE(), 'creado', NEWID()
            FROM inserted;
        END;

        -- Insert into the corresponding audit table for DELETE operation
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Subsidios (id_Subsidios, nombre, actionDate, action, id)
            SELECT id, nombre, GETDATE(), 'eliminado', NEWID()
            FROM deleted;
        END;

        -- Insert into the corresponding audit table for UPDATE operation
        IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Subsidios (id_Subsidios, nombre, actionDate, action, id)
            SELECT i.id, i.nombre, GETDATE(), 'actualizado', NEWID()
            FROM inserted i
            INNER JOIN deleted d ON i.id = d.id;
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH;
END;


-- Trigger for auditing Aplicaciones table
CREATE TRIGGER OnAudit_Aplicaciones
ON Aplicaciones
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insert into the corresponding audit table for INSERT operation
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO Audit_Aplicaciones (id_Aplicaciones, aplicante, estado, subsidio, fechainicio, fechafin, proyecto, actionDate, action, id)
            SELECT id, aplicante, estado, subsidio, fechainicio, fechafin, proyecto, GETDATE(), 'creado', NEWID()
            FROM inserted;
        END;

        -- Insert into the corresponding audit table for DELETE operation
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Aplicaciones (id_Aplicaciones, aplicante, estado, subsidio, fechainicio, fechafin, proyecto, actionDate, action, id)
            SELECT id, aplicante, estado, subsidio, fechainicio, fechafin, proyecto, GETDATE(), 'eliminado', NEWID()
            FROM deleted;
        END;

        -- Insert into the corresponding audit table for UPDATE operation
        IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Aplicaciones (id_Aplicaciones, aplicante, estado, subsidio, fechainicio, fechafin, proyecto, actionDate, action, id)
            SELECT i.id, i.aplicante, i.estado, i.subsidio, i.fechainicio, i.fechafin, i.proyecto, GETDATE(), 'actualizado', NEWID()
            FROM inserted i
            INNER JOIN deleted d ON i.id = d.id;
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH;
END;


-- Trigger for auditing Desembolsos table
CREATE TRIGGER OnAudit_Desembolsos
ON Desembolsos
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insert into the corresponding audit table for INSERT operation
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO Audit_Desembolsos (id_Desembolsos, aplicacion, fecha, cifra, actionDate, action, id)
            SELECT id, aplicacion, fecha, cifra, GETDATE(), 'creado', NEWID()
            FROM inserted;
        END;

        -- Insert into the corresponding audit table for DELETE operation
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Desembolsos (id_Desembolsos, aplicacion, fecha, cifra, actionDate, action, id)
            SELECT id, aplicacion, fecha, cifra, GETDATE(), 'eliminado', NEWID()
            FROM deleted;
        END;

        -- Insert into the corresponding audit table for UPDATE operation
        IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Desembolsos (id_Desembolsos, aplicacion, fecha, cifra, actionDate, action, id)
            SELECT i.id, i.aplicacion, i.fecha, i.cifra, GETDATE(), 'actualizado', NEWID()
            FROM inserted i
            INNER JOIN deleted d ON i.id = d.id;
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH;
END;



-- Trigger for auditing Requisitos table
CREATE TRIGGER OnAudit_Requisitos
ON Requisitos
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insert into the corresponding audit table for INSERT operation
        IF EXISTS (SELECT * FROM inserted)
        BEGIN
            INSERT INTO Audit_Requisitos (id_Requisitos, aplicacion, proyecto, sisben, propietario, ingresosfamiliares, cierrefinanciero, cajacompensacion, cabezafamilia, otrossubsidios, desempleo, inhabilidaddes, otros, fecha, actionDate, action, id)
            SELECT id, aplicacion, proyecto, sisben, propietario, ingresosfamiliares, cierrefinanciero, cajacompensacion, cabezafamilia, otrossubsidios, desempleo, inhabilidaddes, otros, fecha, GETDATE(), 'creado', NEWID()
            FROM inserted;
        END;

        -- Insert into the corresponding audit table for DELETE operation
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Requisitos (id_Requisitos, aplicacion, proyecto, sisben, propietario, ingresosfamiliares, cierrefinanciero, cajacompensacion, cabezafamilia, otrossubsidios, desempleo, inhabilidaddes, otros, fecha, actionDate, action, id)
            SELECT id, aplicacion, proyecto, sisben, propietario, ingresosfamiliares, cierrefinanciero, cajacompensacion, cabezafamilia, otrossubsidios, desempleo, inhabilidaddes, otros, fecha, GETDATE(), 'eliminado', NEWID()
            FROM deleted;
        END;

        -- Insert into the corresponding audit table for UPDATE operation
        IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        BEGIN
            INSERT INTO Audit_Requisitos (id_Requisitos, aplicacion, proyecto, sisben, propietario, ingresosfamiliares, cierrefinanciero, cajacompensacion, cabezafamilia, otrossubsidios, desempleo, inhabilidaddes, otros, fecha, actionDate, action, id)
            SELECT i.id, i.aplicacion, i.proyecto, i.sisben, i.propietario, i.ingresosfamiliares, i.cierrefinanciero, i.cajacompensacion, i.cabezafamilia, i.otrossubsidios, i.desempleo, i.inhabilidaddes, i.otros, i.fecha, GETDATE(), 'actualizado', NEWID()
            FROM inserted i
            INNER JOIN deleted d ON i.id = d.id;
        END;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
    END CATCH;
END;
GO