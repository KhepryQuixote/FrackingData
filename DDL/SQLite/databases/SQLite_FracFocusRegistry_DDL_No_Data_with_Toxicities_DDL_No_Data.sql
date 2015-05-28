--
-- File generated with SQLiteStudio v3.0.6 on Thu May 28 15:48:03 2015
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Chemical_Toxicities_Blended_Sorted
CREATE TABLE Chemical_Toxicities_Blended_Sorted (
    tox_cas_edf_id    VARCHAR (20),
    tox_chemical_name VARCHAR (255),
    tox_references    VARCHAR (512),
    tox_toxicity      VARCHAR (50),
    tox_category      VARCHAR (50) 
);


-- Table: Chemical_Toxicities_Grouped
CREATE TABLE Chemical_Toxicities_Grouped (
    tox_cas_edf_id    VARCHAR (20),
    tox_chemical_name VARCHAR (255),
    tox_recognized    VARCHAR (50),
    tox_suspected     VARCHAR (255) 
);


-- Table: RegistryUpload
CREATE TABLE RegistryUpload (
    pKey                    CHAR (40)     NOT NULL
                                          PRIMARY KEY,
    JobStartDate            DATETIME,
    JobEndDate              DATETIME,
    APINumber               VARCHAR (14)  NOT NULL,
    StateNumber             VARCHAR (2),
    CountyNumber            VARCHAR (3),
    OperatorName            VARCHAR (55),
    WellName                VARCHAR (150) NOT NULL,
    Latitude                REAL          NOT NULL,
    Longitude               REAL          NOT NULL,
    Projection              VARCHAR (5)   NOT NULL,
    TVD                     REAL,
    TotalBaseWaterVolume    REAL,
    TotalBaseNonWaterVolume REAL,
    StateName               VARCHAR (50),
    CountyName              VARCHAR (50),
    FFVersion               REAL,
    FederalWell             BOOLEAN
);


-- Table: Chemical_Toxicities_Flattened_Numeric
CREATE TABLE Chemical_Toxicities_Flattened_Numeric (
    tox_cas_edf_id                 VARCHAR (20),
    tox_chemical_name              VARCHAR (255),
    tox_recognized                 INTEGER,
    tox_recognized_cancer          INTEGER,
    tox_recognized_cardio_blood    INTEGER,
    tox_recognized_developmental   INTEGER,
    tox_recognized_endocrine       INTEGER,
    tox_recognized_gastro_liver    INTEGER,
    tox_recognized_immunotoxicity  INTEGER,
    tox_recognized_kidney          INTEGER,
    tox_recognized_musculoskeletal INTEGER,
    tox_recognized_neurotoxicity   INTEGER,
    tox_recognized_reproductive    INTEGER,
    tox_recognized_respiratory     INTEGER,
    tox_recognized_skin_sense      INTEGER,
    tox_suspected                  INTEGER,
    tox_suspected_cancer           INTEGER,
    tox_suspected_cardio_blood     INTEGER,
    tox_suspected_developmental    INTEGER,
    tox_suspected_endocrine        INTEGER,
    tox_suspected_gastro_liver     INTEGER,
    tox_suspected_immunotoxicity   INTEGER,
    tox_suspected_kidney           INTEGER,
    tox_suspected_musculoskeletal  INTEGER,
    tox_suspected_neurotoxicity    INTEGER,
    tox_suspected_reproductive     INTEGER,
    tox_suspected_respiratory      INTEGER,
    tox_suspected_skin_sense       INTEGER
);


-- Table: Chemical_Toxicities_Flattened_Boolean
CREATE TABLE Chemical_Toxicities_Flattened_Boolean (
    tox_cas_edf_id             VARCHAR (20),
    tox_chemical_name          VARCHAR (255),
    tox_category               VARCHAR (50),
    tox_cancer                 BOOLEAN,
    tox_cardiovascular_blood   BOOLEAN,
    tox_developmental          BOOLEAN,
    tox_endocrine              BOOLEAN,
    tox_gastrointestinal_liver BOOLEAN,
    tox_immunotoxicity         BOOLEAN,
    tox_kidney                 BOOLEAN,
    tox_musculoskeletal        BOOLEAN,
    tox_neurotoxicity          BOOLEAN,
    tox_reproductive           BOOLEAN,
    tox_respiratory            BOOLEAN,
    tox_skin_sense             BOOLEAN
);


-- Table: RegistryUploadIngredients
CREATE TABLE RegistryUploadIngredients (
    pKey                CHAR (40)     NOT NULL
                                      PRIMARY KEY,
    pKeyPurpose         CHAR (40)     NOT NULL,
    IngredientName      VARCHAR (150) NOT NULL,
    CASNumber           VARCHAR (40)  NOT NULL,
    PercentHighAdditive REAL,
    PercentHFJob        REAL,
    IngredientComment   VARCHAR (500) 
);


-- Table: FrackingDataCommentary
CREATE TABLE FrackingDataCommentary (
    TableName       VARCHAR (100),
    Situation       VARCHAR (255),
    AdjustmentsMade VARCHAR (255) 
);


-- Table: RegistryUploadPurpose
CREATE TABLE RegistryUploadPurpose (
    pKey               CHAR (40)     NOT NULL
                                     PRIMARY KEY,
    pKeyRegistryUpload CHAR (40)     NOT NULL,
    TradeName          VARCHAR (250),
    Supplier           VARCHAR (150),
    Purpose            VARCHAR (250) 
);


-- Index: IX_RegistryUploadIngredients_pKey
CREATE INDEX IX_RegistryUploadIngredients_pKey ON RegistryUploadIngredients (
    pKey
);


-- Index: IX_RegistryUpload_StateName
CREATE INDEX IX_RegistryUpload_StateName ON RegistryUpload (
    StateName
);


-- Index: IX_RegistryUpload_OperatorName
CREATE INDEX IX_RegistryUpload_OperatorName ON RegistryUpload (
    OperatorName
);


-- Index: IX_RegistryUploadPurpose_TradeName
CREATE INDEX IX_RegistryUploadPurpose_TradeName ON RegistryUploadPurpose (
    TradeName
);


-- Index: IX_RegistryUpload_FederalWell
CREATE INDEX IX_RegistryUpload_FederalWell ON RegistryUpload (
    FederalWell
);


-- Index: IX_Chemical_Toxicities_Grouped_CASRN
CREATE INDEX IX_Chemical_Toxicities_Grouped_CASRN ON Chemical_Toxicities_Grouped (
    tox_cas_edf_id
);


-- Index: IX_RegistryUpload_JobEndDate
CREATE INDEX IX_RegistryUpload_JobEndDate ON RegistryUpload (
    JobEndDate
);


-- Index: IX_RegistryUploadIngredients_IngredientName
CREATE INDEX IX_RegistryUploadIngredients_IngredientName ON RegistryUploadIngredients (
    IngredientName
);


-- Index: IX_Chemical_Toxicities_Blended_Sorted_CASRN
CREATE INDEX IX_Chemical_Toxicities_Blended_Sorted_CASRN ON Chemical_Toxicities_Blended_Sorted (
    tox_cas_edf_id
);


-- Index: IX_Chemical_Toxicities_Blended_Sorted_Category_Toxicity
CREATE INDEX IX_Chemical_Toxicities_Blended_Sorted_Category_Toxicity ON Chemical_Toxicities_Blended_Sorted (
    tox_category,
    tox_toxicity
);


-- Index: IX_RegistryUploadPurpose_Supplier
CREATE INDEX IX_RegistryUploadPurpose_Supplier ON RegistryUploadPurpose (
    Supplier
);


-- Index: IX_Chemical_Toxicities_Flattened_Boolean_CASRN
CREATE INDEX IX_Chemical_Toxicities_Flattened_Boolean_CASRN ON Chemical_Toxicities_Flattened_Boolean (
    tox_cas_edf_id
);


-- Index: IX_RegistryUploadIngredients_pKeyPurpose
CREATE INDEX IX_RegistryUploadIngredients_pKeyPurpose ON RegistryUploadIngredients (
    pKeyPurpose
);


-- Index: IX_RegistryUploadPurpose_pKey
CREATE INDEX IX_RegistryUploadPurpose_pKey ON RegistryUploadPurpose (
    pKey
);


-- Index: IX_Chemical_Toxicities_Flattened_Numeric_CASRN
CREATE INDEX IX_Chemical_Toxicities_Flattened_Numeric_CASRN ON Chemical_Toxicities_Flattened_Numeric (
    tox_cas_edf_id
);


-- Index: IX_RegistryUpload_APINumber
CREATE INDEX IX_RegistryUpload_APINumber ON RegistryUpload (
    APINumber
);


-- Index: IX_RegistryUpload_pKey
CREATE INDEX IX_RegistryUpload_pKey ON RegistryUpload (
    pKey
);


-- Index: IX_RegistryUpload_JobStartDate
CREATE INDEX IX_RegistryUpload_JobStartDate ON RegistryUpload (
    JobStartDate
);


-- Index: IX_RegistryUploadPurpose_pKeyRegistryUpload
CREATE INDEX IX_RegistryUploadPurpose_pKeyRegistryUpload ON RegistryUploadPurpose (
    pKeyRegistryUpload
);


-- Index: IX_RegistryUpload_FFVersion
CREATE INDEX IX_RegistryUpload_FFVersion ON RegistryUpload (
    FFVersion
);


-- Index: IX_RegistryUploadPurpose_Purpose
CREATE INDEX IX_RegistryUploadPurpose_Purpose ON RegistryUploadPurpose (
    Purpose
);


-- Index: IX_Chemical_Toxicities_Blended_Sorted_Toxicity_Category
CREATE INDEX IX_Chemical_Toxicities_Blended_Sorted_Toxicity_Category ON Chemical_Toxicities_Blended_Sorted (
    tox_toxicity,
    tox_category
);


-- Index: IX_RegistryUploadIngredients_CASNumber
CREATE INDEX IX_RegistryUploadIngredients_CASNumber ON RegistryUploadIngredients (
    CASNumber
);


-- Index: IX_RegistryUpload_CountyName
CREATE INDEX IX_RegistryUpload_CountyName ON RegistryUpload (
    CountyName
);


-- Index: IX_RegistryUpload_WellName
CREATE INDEX IX_RegistryUpload_WellName ON RegistryUpload (
    WellName
);


-- Index: IX_RegistryUpload_TVD
CREATE INDEX IX_RegistryUpload_TVD ON RegistryUpload (
    TVD
);


-- View: vue_upload_purpose_ingredients_toxicities_only_suspected
CREATE VIEW vue_upload_purpose_ingredients_toxicities_only_suspected AS
    SELECT ru.*,
           rup.*,
           rui.*,
           ctbs.*
      FROM Chemical_Toxicities_Blended_Sorted ctbs
           INNER JOIN
           RegistryUploadIngredients rui ON ctbs.tox_cas_edf_id = rui.CASNumber
           INNER JOIN
           RegistryUploadPurpose rup ON rui.pKeyPurpose = rup.pKey
           INNER JOIN
           RegistryUpload ru ON rup.pKeyRegistryUpload = ru.pKey
     WHERE ctbs.tox_category = 'suspected';


-- View: vue_toxicities_operator_category_toxicity_apis_disclosed_all
CREATE VIEW vue_toxicities_operator_category_toxicity_apis_disclosed_all AS
    SELECT OperatorName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT OperatorName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_all
                GROUP BY OperatorName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY OperatorName,
              tox_category,
              tox_toxicity
     ORDER BY OperatorName,
              tox_category,
              tox_toxicity;


-- View: vue_upload_purpose_ingredients_toxicities_only_all
CREATE VIEW vue_upload_purpose_ingredients_toxicities_only_all AS
    SELECT ru.*,
           rup.*,
           rui.*,
           ctbs.*
      FROM Chemical_Toxicities_Blended_Sorted ctbs
           INNER JOIN
           RegistryUploadIngredients rui ON ctbs.tox_cas_edf_id = rui.CASNumber
           INNER JOIN
           RegistryUploadPurpose rup ON rui.pKeyPurpose = rup.pKey
           INNER JOIN
           RegistryUpload ru ON rup.pKeyRegistryUpload = ru.pKey;


-- View: vue_upload_purpose_ingredients_toxicities_join
CREATE VIEW vue_upload_purpose_ingredients_toxicities_join AS
    SELECT ru.*,
           rup.*,
           rui.*,
           ctbs.*
      FROM RegistryUpload ru
           LEFT OUTER JOIN
           RegistryUploadPurpose rup ON ru.pKey = rup.pKeyRegistryUpload
           LEFT OUTER JOIN
           RegistryUploadIngredients rui ON rup.pKey = rui.pKeyPurpose
           LEFT OUTER JOIN
           Chemical_Toxicities_Blended_Sorted ctbs ON rui.CASNumber = ctbs.tox_cas_edf_id;


-- View: vue_toxicities_state_category_toxicity_apis_disclosed_recognized
CREATE VIEW vue_toxicities_state_category_toxicity_apis_disclosed_recognized AS
    SELECT StateName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT StateName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_recognized
                GROUP BY StateName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY StateName,
              tox_category,
              tox_toxicity
     ORDER BY StateName,
              tox_category,
              tox_toxicity;


-- View: vue_toxicities_category_toxicity_apis_disclosed_recognized
CREATE VIEW vue_toxicities_category_toxicity_apis_disclosed_recognized AS
    SELECT tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_recognized
                GROUP BY tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY tox_category,
              tox_toxicity
     ORDER BY tox_category,
              tox_toxicity;


-- View: vue_toxicities_operator_category_toxicity_apis_disclosed_recognized
CREATE VIEW vue_toxicities_operator_category_toxicity_apis_disclosed_recognized AS
    SELECT OperatorName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT OperatorName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_recognized
                GROUP BY OperatorName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY OperatorName,
              tox_category,
              tox_toxicity
     ORDER BY OperatorName,
              tox_category,
              tox_toxicity;


-- View: vue_upload_purpose_ingredients_toxicities_only_recognized
CREATE VIEW vue_upload_purpose_ingredients_toxicities_only_recognized AS
    SELECT ru.*,
           rup.*,
           rui.*,
           ctbs.*
      FROM Chemical_Toxicities_Blended_Sorted ctbs
           INNER JOIN
           RegistryUploadIngredients rui ON ctbs.tox_cas_edf_id = rui.CASNumber
           INNER JOIN
           RegistryUploadPurpose rup ON rui.pKeyPurpose = rup.pKey
           INNER JOIN
           RegistryUpload ru ON rup.pKeyRegistryUpload = ru.pKey
     WHERE ctbs.tox_category = 'recognized';


-- View: vue_toxicities_state_county_category_toxicity_apis_disclosed_all
CREATE VIEW vue_toxicities_state_county_category_toxicity_apis_disclosed_all AS
    SELECT StateName,
           CountyName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT StateName,
                      CountyName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_all
                GROUP BY StateName,
                         CountyName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY StateName,
              CountyName,
              tox_category,
              tox_toxicity
     ORDER BY StateName,
              CountyName,
              tox_category,
              tox_toxicity;


-- View: vue_toxicities_operator_category_toxicity_apis_disclosed_suspected
CREATE VIEW vue_toxicities_operator_category_toxicity_apis_disclosed_suspected AS
    SELECT OperatorName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT OperatorName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_suspected
                GROUP BY OperatorName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY OperatorName,
              tox_category,
              tox_toxicity
     ORDER BY OperatorName,
              tox_category,
              tox_toxicity;


-- View: vue_toxicities_category_toxicity_apis_disclosed_suspected
CREATE VIEW vue_toxicities_category_toxicity_apis_disclosed_suspected AS
    SELECT tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_suspected
                GROUP BY tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY tox_category,
              tox_toxicity
     ORDER BY tox_category,
              tox_toxicity;


-- View: vue_upload_purpose_ingredients_join
CREATE VIEW vue_upload_purpose_ingredients_join AS
    SELECT *
      FROM RegistryUpload ru
           LEFT OUTER JOIN
           RegistryUploadPurpose rup ON ru.pKey = rup.pKeyRegistryUpload
           LEFT OUTER JOIN
           RegistryUploadIngredients rui ON rup.pKey = rui.pKeyPurpose;


-- View: vue_toxicities_state_category_toxicity_apis_disclosed_all
CREATE VIEW vue_toxicities_state_category_toxicity_apis_disclosed_all AS
    SELECT StateName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT StateName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_all
                GROUP BY StateName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY StateName,
              tox_category,
              tox_toxicity
     ORDER BY StateName,
              tox_category,
              tox_toxicity;


-- View: vue_toxicities_state_category_toxicity_apis_disclosed_suspected
CREATE VIEW vue_toxicities_state_category_toxicity_apis_disclosed_suspected AS
    SELECT StateName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT StateName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_suspected
                GROUP BY StateName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY StateName,
              tox_category,
              tox_toxicity
     ORDER BY StateName,
              tox_category,
              tox_toxicity;


-- View: vue_toxicities_state_county_category_toxicity_apis_disclosed_suspected
CREATE VIEW vue_toxicities_state_county_category_toxicity_apis_disclosed_suspected AS
    SELECT StateName,
           CountyName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT StateName,
                      CountyName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_suspected
                GROUP BY StateName,
                         CountyName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY StateName,
              CountyName,
              tox_category,
              tox_toxicity
     ORDER BY StateName,
              CountyName,
              tox_category,
              tox_toxicity;


-- View: vue_toxicities_state_county_category_toxicity_apis_disclosed_recognized
CREATE VIEW vue_toxicities_state_county_category_toxicity_apis_disclosed_recognized AS
    SELECT StateName,
           CountyName,
           tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT StateName,
                      CountyName,
                      tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_recognized
                GROUP BY StateName,
                         CountyName,
                         tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY StateName,
              CountyName,
              tox_category,
              tox_toxicity
     ORDER BY StateName,
              CountyName,
              tox_category,
              tox_toxicity;


-- View: vue_toxicities_category_toxicity_apis_disclosed_all
CREATE VIEW vue_toxicities_category_toxicity_apis_disclosed_all AS
    SELECT tox_category,
           tox_toxicity,
           count() APIsDisclosed
      FROM (
               SELECT tox_category,
                      tox_toxicity,
                      APINumber
                 FROM vue_upload_purpose_ingredients_toxicities_only_all
                GROUP BY tox_category,
                         tox_toxicity,
                         APINumber
           )
           q1
     GROUP BY tox_category,
              tox_toxicity
     ORDER BY tox_category,
              tox_toxicity;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
