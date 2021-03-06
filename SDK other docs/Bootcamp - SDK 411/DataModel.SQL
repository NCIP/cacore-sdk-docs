DROP TABLE ACTIVE_SITE CASCADE CONSTRAINTS
;
DROP TABLE BINDING_SITE CASCADE CONSTRAINTS
;
DROP TABLE GENE CASCADE CONSTRAINTS
;
DROP TABLE JOIN_ORGANISM_ORGANISM_NAME CASCADE CONSTRAINTS
;
DROP TABLE JOIN_PROTEIN_GENE CASCADE CONSTRAINTS
;
DROP TABLE JOIN_PROTEIN_ORGANISM CASCADE CONSTRAINTS
;
DROP TABLE JOIN_PROTEIN_PROTEIN_FEATURE CASCADE CONSTRAINTS
;
DROP TABLE JOIN_PROTEIN_PROTEIN_NAME CASCADE CONSTRAINTS
;
DROP TABLE ORGANISM CASCADE CONSTRAINTS
;
DROP TABLE ORGANISM_NAME CASCADE CONSTRAINTS
;
DROP TABLE PROTEIN CASCADE CONSTRAINTS
;
DROP TABLE PROTEIN_FEATURE CASCADE CONSTRAINTS
;
DROP TABLE PROTEIN_NAME CASCADE CONSTRAINTS
;
DROP TABLE PROTEIN_SEQUENCE CASCADE CONSTRAINTS
;

CREATE TABLE ACTIVE_SITE ( 
	ACTIVE_SITE_ID NUMBER(38) NOT NULL
)
;

CREATE TABLE BINDING_SITE ( 
	BINDING_SITE_ID NUMBER(38) NOT NULL
)
;

CREATE TABLE GENE ( 
	ENTREZ_GENE_ID NUMBER(38) NULL,
	NAME VARCHAR2(250) NULL,
	GENE_ID NUMBER(38) NOT NULL
)
;

CREATE TABLE JOIN_ORGANISM_ORGANISM_NAME ( 
	ORGANISM_NAME_ID NUMBER(38) NULL,
	ORGANISM_ID NUMBER(38) NULL
)
;

CREATE TABLE JOIN_PROTEIN_GENE ( 
	GENE_ID NUMBER(38) NULL,
	PROTEIN_ID VARCHAR2(250) NULL
)
;

CREATE TABLE JOIN_PROTEIN_ORGANISM ( 
	ORGANISM_ID NUMBER(38) NULL,
	PROTEIN_ID VARCHAR2(250) NULL
)
;

CREATE TABLE JOIN_PROTEIN_PROTEIN_FEATURE ( 
	PROTEIN_FEATURE_ID NUMBER(38) NULL,
	PROTEIN_ID VARCHAR2(250) NULL
)
;

CREATE TABLE JOIN_PROTEIN_PROTEIN_NAME ( 
	PROTEIN_NAME_ID NUMBER(38) NULL,
	PROTEIN_ID VARCHAR2(250) NULL
)
;

CREATE TABLE ORGANISM ( 
	NCBI_TAXONOMY_ID NUMBER(38) NULL,
	SCIENTIFIC_NAME VARCHAR2(250) NULL,
	COMMON_NAME VARCHAR2(250) NULL,
	ORGANISM_ID NUMBER(38) NOT NULL
)
;

CREATE TABLE ORGANISM_NAME ( 
	ORGANISM_NAME_ID NUMBER(38) NOT NULL,
	VALUE VARCHAR2(50) NULL
)
;

CREATE TABLE PROTEIN ( 
	UNIPROTKB_PRIMARY_ACCESSION VARCHAR2(250) NULL,
	UNIPROTKB_ENTRY_NAME VARCHAR2(250) NULL,
	PROTEIN_TYPE VARCHAR2(250) NULL,
	PROTEIN_ID VARCHAR2(250) NOT NULL
)
;

CREATE TABLE PROTEIN_FEATURE ( 
	BEGIN NUMBER(8,2) NULL,
	END NUMBER(8,2) NULL,
	DESCRIPTION VARCHAR2(250) NULL,
	PROTEIN_FEATURE_ID NUMBER(38) NOT NULL
)
;

CREATE TABLE PROTEIN_NAME ( 
	VALUE VARCHAR2(250) NULL,
	PROTEIN_NAME_ID NUMBER(38) NOT NULL
)
;

CREATE TABLE PROTEIN_SEQUENCE ( 
	VALUE VARCHAR2(250) NULL,
	LENGTH NUMBER(8,2) NULL,
	MOLECULAR_WEIGHT_IN_DALTONS NUMBER(8,2) NULL,
	CHECKSUM VARCHAR2(250) NULL,
	SEQUENCE_IN_FASTA_FORMAT VARCHAR2(250) NULL,
	PROTEIN_SEQUENCE_ID VARCHAR2(250) NOT NULL,
	PROTEIN VARCHAR2(250) NULL
)
;


ALTER TABLE ACTIVE_SITE ADD CONSTRAINT PK_ACTIVE_SITE 
	PRIMARY KEY (ACTIVE_SITE_ID)
;

ALTER TABLE BINDING_SITE ADD CONSTRAINT PK_BINDING_SITE 
	PRIMARY KEY (BINDING_SITE_ID)
;

ALTER TABLE GENE ADD CONSTRAINT PK_GENE 
	PRIMARY KEY (GENE_ID)
;

ALTER TABLE ORGANISM ADD CONSTRAINT PK_ORGANISM 
	PRIMARY KEY (ORGANISM_ID)
;

ALTER TABLE ORGANISM_NAME ADD CONSTRAINT PK_ORGANISM_NAME 
	PRIMARY KEY (ORGANISM_NAME_ID)
;

ALTER TABLE PROTEIN ADD CONSTRAINT PK_PROTEIN 
	PRIMARY KEY (PROTEIN_ID)
;

ALTER TABLE PROTEIN_FEATURE ADD CONSTRAINT PK_PROTEIN_FEATURE 
	PRIMARY KEY (PROTEIN_FEATURE_ID)
;

ALTER TABLE PROTEIN_NAME ADD CONSTRAINT PK_PROTEIN_NAME 
	PRIMARY KEY (PROTEIN_NAME_ID)
;

ALTER TABLE PROTEIN_SEQUENCE ADD CONSTRAINT PK_PROTEIN_SEQUENCE 
	PRIMARY KEY (PROTEIN_SEQUENCE_ID)
;




ALTER TABLE ACTIVE_SITE ADD CONSTRAINT FK_ACTIVE_SITE_PROTEIN_FEATURE 
	FOREIGN KEY (ACTIVE_SITE_ID) REFERENCES PROTEIN_FEATURE (PROTEIN_FEATURE_ID)
;

ALTER TABLE BINDING_SITE ADD CONSTRAINT FK_BIND_SITE_PROTEIN_FEATURE 
	FOREIGN KEY (BINDING_SITE_ID) REFERENCES PROTEIN_FEATURE (PROTEIN_FEATURE_ID)
;

ALTER TABLE JOIN_ORGANISM_ORGANISM_NAME ADD CONSTRAINT FK_ORGANISM_NAME 
	FOREIGN KEY (ORGANISM_NAME_ID) REFERENCES ORGANISM_NAME (ORGANISM_NAME_ID)
;

ALTER TABLE JOIN_ORGANISM_ORGANISM_NAME ADD CONSTRAINT FK_ORGANISM 
	FOREIGN KEY (ORGANISM_ID) REFERENCES ORGANISM (ORGANISM_ID)
;

ALTER TABLE JOIN_PROTEIN_GENE ADD CONSTRAINT FK_GENE 
	FOREIGN KEY (GENE_ID) REFERENCES GENE (GENE_ID)
;

ALTER TABLE JOIN_PROTEIN_GENE ADD CONSTRAINT FK_PROTEIN4 
	FOREIGN KEY (PROTEIN_ID) REFERENCES PROTEIN (PROTEIN_ID)
;

ALTER TABLE JOIN_PROTEIN_ORGANISM ADD CONSTRAINT FK_ORGANISM1 
	FOREIGN KEY (ORGANISM_ID) REFERENCES ORGANISM (ORGANISM_ID)
;

ALTER TABLE JOIN_PROTEIN_ORGANISM ADD CONSTRAINT FK_PROTEIN 
	FOREIGN KEY (PROTEIN_ID) REFERENCES PROTEIN (PROTEIN_ID)
;

ALTER TABLE JOIN_PROTEIN_PROTEIN_FEATURE ADD CONSTRAINT FK_PROTEIN_FEATURE 
	FOREIGN KEY (PROTEIN_FEATURE_ID) REFERENCES PROTEIN_FEATURE (PROTEIN_FEATURE_ID)
;

ALTER TABLE JOIN_PROTEIN_PROTEIN_FEATURE ADD CONSTRAINT FK_PROTEIN3 
	FOREIGN KEY (PROTEIN_ID) REFERENCES PROTEIN (PROTEIN_ID)
;

ALTER TABLE JOIN_PROTEIN_PROTEIN_NAME ADD CONSTRAINT FK_PROTEIN_NAME 
	FOREIGN KEY (PROTEIN_NAME_ID) REFERENCES PROTEIN_NAME (PROTEIN_NAME_ID)
;

ALTER TABLE JOIN_PROTEIN_PROTEIN_NAME ADD CONSTRAINT FK_PROTEIN2 
	FOREIGN KEY (PROTEIN_ID) REFERENCES PROTEIN (PROTEIN_ID)
;

ALTER TABLE PROTEIN_SEQUENCE ADD CONSTRAINT FK_PROTEIN10 
	FOREIGN KEY (PROTEIN) REFERENCES PROTEIN (PROTEIN_ID)
;
