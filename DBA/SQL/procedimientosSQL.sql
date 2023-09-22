CREATE PROCEDURE EvaluarSubsidioComplementario
    @aplicacionID uniqueidentifier
AS
BEGIN
    DECLARE @sisben INT
    DECLARE @propietario INT
    DECLARE @ingresosfamiliares FLOAT
    DECLARE @cierrefinanciero VARCHAR(50)
    DECLARE @cajacompensacion INT

    -- Retrieve values from the Requisitos table
    SELECT @sisben = sisben,
           @propietario = propietario,
           @ingresosfamiliares = ingresosfamiliares,
           @cierrefinanciero = cierrefinanciero,
           @cajacompensacion = cajacompensacion
    FROM Requisitos
    WHERE aplicacion = @aplicacionID;

    -- Update the Aplicaciones table based on the criteria
    IF (@sisben <> 0 AND
        @propietario = 0 AND
        @ingresosfamiliares < 4640000 AND
        (@cierrefinanciero = 'compra de vivienda' OR @cierrefinanciero = 'leasing habitacional') AND
        @cajacompensacion >= 3)
    BEGIN
        -- Approve the application
        UPDATE Aplicaciones
        SET estado = 'Aprobado'
        WHERE id = @aplicacionID;
    END
    ELSE
    BEGIN
        -- Reject the application
        UPDATE Aplicaciones
        SET estado = 'Rechazado'
        WHERE id = @aplicacionID;
    END;
END;




CREATE PROCEDURE EvaluarSubsidioFOVIS
    @aplicacionID uniqueidentifier
AS
BEGIN
    DECLARE @propietario INT
    DECLARE @ingresosfamiliares FLOAT
    DECLARE @cabezafamilia VARCHAR(50)
    DECLARE @otrossubsidios INT
    DECLARE @desempleo INT

    -- Retrieve values from the Requisitos table
    SELECT @propietario = propietario,
           @ingresosfamiliares = ingresosfamiliares,
           @cabezafamilia = cabezafamilia,
           @otrossubsidios = otrossubsidios,
           @desempleo = desempleo
    FROM Requisitos
    WHERE aplicacion = @aplicacionID;

    -- Update the Aplicaciones table based on the criteria
    IF (@propietario = 0 AND
        @ingresosfamiliares < 4640000 AND
        @cabezafamilia = 'cabeza de hogar desempleado' AND
        @otrossubsidios = 0 AND
        @desempleo = 12)
    BEGIN
        -- Approve the application
        UPDATE Aplicaciones
        SET estado = 'Aprobado'
        WHERE id = @aplicacionID;
    END
    ELSE
    BEGIN
        -- Reject the application
        UPDATE Aplicaciones
        SET estado = 'Rechazado'
        WHERE id = @aplicacionID;
    END;
END;


CREATE PROCEDURE EvaluarSubsidioCompensacion
    @aplicacionID uniqueidentifier
AS
BEGIN
    DECLARE @ingresosfamiliares FLOAT
    DECLARE @cajacompensacion INT

    -- Retrieve values from the Requisitos table
    SELECT @ingresosfamiliares = ingresosfamiliares,
           @cajacompensacion = cajacompensacion
    FROM Requisitos
    WHERE aplicacion = @aplicacionID;

    -- Update the Aplicaciones table based on the criteria
    IF (@ingresosfamiliares < 4640000 AND
        @cajacompensacion <> 0)
    BEGIN
        -- Approve the application
        UPDATE Aplicaciones
        SET estado = 'Aprobado'
        WHERE id = @aplicacionID;
    END
    ELSE
    BEGIN
        -- Reject the application
        UPDATE Aplicaciones
        SET estado = 'Rechazado'
        WHERE id = @aplicacionID;
    END;
END;



CREATE PROCEDURE EvaluarSubsidioComplementario
    @aplicacionID uniqueidentifier
AS
BEGIN
    DECLARE @propietario INT
    DECLARE @ingresosfamiliares FLOAT
    DECLARE @otrossubsidios INT

    -- Retrieve values from the Requisitos table
    SELECT @propietario = propietario,
           @ingresosfamiliares = ingresosfamiliares,
           @otrossubsidios = otrossubsidios
    FROM Requisitos
    WHERE aplicacion = @aplicacionID;

    -- Update the Aplicaciones table based on the criteria
    IF (@propietario = 0 AND
        @ingresosfamiliares < 4640000 AND
        @otrossubsidios = 0)
    BEGIN
        -- Approve the application
        UPDATE Aplicaciones
        SET estado = 'Aprobado'
        WHERE id = @aplicacionID;
    END
    ELSE
    BEGIN
        -- Reject the application
        UPDATE Aplicaciones
        SET estado = 'Rechazado'
        WHERE id = @aplicacionID;
    END;
END;

CREATE PROCEDURE EvaluarSubsidioPreferente
    @aplicacionID uniqueidentifier
AS
BEGIN
    DECLARE @propietario INT
    DECLARE @ingresosfamiliares FLOAT
    DECLARE @cierrefinanciero VARCHAR(50)
    DECLARE @cabezafamilia VARCHAR(50)
    DECLARE @otrossubsidios INT
    DECLARE @inhabilidades VARCHAR(50)

    -- Retrieve values from the Requisitos table
    SELECT @propietario = propietario,
           @ingresosfamiliares = ingresosfamiliares,
           @cierrefinanciero = cierrefinanciero,
           @cabezafamilia = cabezafamilia,
           @otrossubsidios = otrossubsidios,
           @inhabilidades = inhabilidades
    FROM Requisitos
    WHERE aplicacion = @aplicacionID;

    -- Update the Aplicaciones table based on the criteria
    IF (@propietario = 0 AND
        @ingresosfamiliares < 4640000 AND
        @cierrefinanciero = 'cuenta con cierre financiero' AND
        @cabezafamilia = 'mayor de edad' AND
        @otrossubsidios = 0 AND
        @inhabilidades = 'sin sanciones por proceso de asignacion de subsidios vivienda')
    BEGIN
        -- Approve the application
        UPDATE Aplicaciones
        SET estado = 'Aprobado'
        WHERE id = @aplicacionID;
    END
    ELSE
    BEGIN
        -- Reject the application
        UPDATE Aplicaciones
        SET estado = 'Rechazado'
        WHERE id = @aplicacionID;
    END;
END;


CREATE PROCEDURE EvaluarSubsidioPreferente
    @aplicacionID uniqueidentifier
AS
BEGIN
    DECLARE @propietario INT
    DECLARE @ingresosfamiliares FLOAT
    DECLARE @otrossubsidios INT
    DECLARE @otros VARCHAR(50)

    -- Retrieve values from the Requisitos table
    SELECT @propietario = propietario,
           @ingresosfamiliares = ingresosfamiliares,
           @otrossubsidios = otrossubsidios,
           @otros = otros
    FROM Requisitos
    WHERE aplicacion = @aplicacionID;

    -- Update the Aplicaciones table based on the criteria
    IF (@propietario = 0 AND
        @ingresosfamiliares < 2320000 AND
        @otrossubsidios = 0 AND
        @otros = 'interes')
    BEGIN
        -- Approve the application
        UPDATE Aplicaciones
        SET estado = 'Aprobado'
        WHERE id = @aplicacionID;
    END
    ELSE
    BEGIN
        -- Reject the application
        UPDATE Aplicaciones
        SET estado = 'Rechazado'
        WHERE id = @aplicacionID;
    END;
END;