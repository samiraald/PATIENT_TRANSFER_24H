/*
CREATED BY SAMIRA ALVES LUCIO DIAS
DATE: 28/08/2020
GOAL: Query developed to return pacients transferences in less then 24 hours
between units
*/


SELECT
       ATENDIME.DT_ATENDIMENTO
      ,PACIENTE.CD_PACIENTE
      ,ATENDIME.CD_ATENDIMENTO
      ,PACIENTE.NM_PACIENTE
      ,MOV_INT.CD_LEITO_ANTERIOR
      ,LEITO_ANT.CD_UNID_INT CD_UNID_INT_ANT
      ,UNID_INT_ANT.DS_UNID_INT DS_UNID_INT_ANT
      ,LEITO_ANT.DS_RESUMO DS_LEITO_ATUAL
      ,LEITO_ATU.CD_UNID_INT CD_UNID_INT_ATU
      ,UNID_INT_ATU.DS_UNID_INT DS_UNID_INT_ATU
      ,LEITO_ATU.DS_RESUMO DS_LEITO_ATU
      ,TO_CHAR (MOV_INT.DT_MOV_INT,'DD/MM/YYYY') DT_MOV_INT
      ,To_Char(MOV_INT.HR_MOV_INT,'HH24:MI') HR_MOV_INT
      ,MOTIVO_TRANSF_LEITO.CD_MOTIVO_TRANSF_LEITO
      ,MOTIVO_TRANSF_LEITO.DS_MOTIVO_TRANSF_LEITO

FROM PACIENTE PACIENTE
INNER JOIN ATENDIME ATENDIME
  ON ATENDIME.CD_PACIENTE = PACIENTE.CD_PACIENTE
INNER JOIN MOV_INT MOV_INT
  ON MOV_INT.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
INNER JOIN LEITO LEITO_ANT
  ON LEITO_ANT.CD_LEITO = MOV_INT.CD_LEITO_ANTERIOR
INNER JOIN LEITO LEITO_ATU
  ON MOV_INT.CD_LEITO = LEITO_ATU.CD_LEITO
INNER JOIN UNID_INT UNID_INT_ANT
  ON LEITO_ANT.CD_UNID_INT = UNID_INT_ANT.CD_UNID_INT
INNER JOIN UNID_INT UNID_INT_ATU
  ON LEITO_ATU.CD_UNID_INT = UNID_INT_ATU.CD_UNID_INT
INNER JOIN MOTIVO_TRANSF_LEITO MOTIVO_TRANSF_LEITO
  ON MOTIVO_TRANSF_LEITO.CD_MOTIVO_TRANSF_LEITO = MOV_INT.CD_MOTIVO_TRANSF_LEITO

--WHERE Trunc (ATENDIME.DT_ATENDIMENTO) BETWEEN '01/07/2020' AND '27/08/2020'
AND UNID_INT_ANT.CD_UNID_INT IN ('30','31','32','33','34','35','36','37','38','39','45','44','42','51','53','52','55','49','50')n

ORDER BY ATENDIME.DT_ATENDIMENTO
        ,UNID_INT_ANT.CD_UNID_INT
        ,UNID_INT_ATU.CD_UNID_INT
        ,MOV_INT.DT_MOV_INT

;
