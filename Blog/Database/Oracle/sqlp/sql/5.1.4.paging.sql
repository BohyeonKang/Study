--DROP TABLE BBS;
CREATE TABLE BBS
(
    Catalog     NVARCHAR2(30),
    num         NUMBER,
    RegDate     CHAR(8),
    Title       NVARCHAR2(50),
    Descpription NVARCHAR2(2000),
    Writer      NUMBER,
    CONSTRAINT BBS_PK PRIMARY KEY (Catalog, num)
);

CREATE UNIQUE INDEX IDX_BBS ON 

INSERT INTO BBS VALUES ('공지', 1, '20160101', '01 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 2, '20160102', '02 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 3, '20160103', '03 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 4, '20160104', '04 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 5, '20160105', '05 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 6, '20160106', '06 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 7, '20160107', '07 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 8, '20160108', '08 공지', '', 0);
INSERT INTO BBS VALUES ('공지', 9, '20160109', '09 공지', '', 0);
INSERT INTO BBS VALUES ('공지',10, '20160110', '10 공지', '', 0);
INSERT INTO BBS VALUES ('공지',11, '20160111', '11 공지', '', 0);
INSERT INTO BBS VALUES ('공지',12, '20160112', '12 공지', '', 0);
INSERT INTO BBS VALUES ('공지',13, '20160113', '13 공지', '', 0);
INSERT INTO BBS VALUES ('공지',14, '20160114', '14 공지', '', 0);
INSERT INTO BBS VALUES ('공지',15, '20160115', '15 공지', '', 0);

SELECT * FROM bbs;

SELECT *
  FROM (SELECT ROWNUM no, num, title, COUNT(*) OVER () CNT
          FROM (SELECT num, title
                  FROM bbs
                 WHERE RegDate >= :dt
                   AND Catalog = :cat
                 ORDER BY num DESC)
         WHERE ROWNUM <= :page * :pageSize + 1)
  WHERE no BETWEEN (:page - 1) * :pagesize + 1 AND :pageSize * :page;
  
  
SELECT *
  FROM (SELECT ROWNUM no, num, title, COUNT(*) OVER () CNT
          FROM (SELECT num, title
                  FROM bbs
                 WHERE Catalog = '공지'
                 ORDER BY num DESC)
         WHERE ROWNUM <= 3 * 4 + 1)
  WHERE no BETWEEN (3 - 1) * 4 + 1 AND 3 * 4;
 
SELECT *
 FROM (SELECT num, title
         FROM bbs
        WHERE Catalog = :cat
          AND num < :no
        ORDER BY num DESC)
 WHERE rownum <= :pageSize


SELECT *
 FROM (SELECT num, title
         FROM bbs
        WHERE Catalog = '공지'
          AND num < 11
        ORDER BY num DESC)
 WHERE rownum <= 4

 
SELECT *
  FROM (SELECT num, title
          FROM bbs
         WHERE Catalog = :cat
           AND num > :no
           AND rownum <= :pageSize
         ORDER BY num)
 ORDER BY num DESC;

SELECT *
  FROM (SELECT num, title
          FROM bbs
         WHERE Catalog = '공지'
           AND num > 4
         ORDER BY num)
 WHERE rownum <= 4
 ORDER BY num DESC;
 
 SELECT *
 FROM ()


 
 
 SELECT *
  FROM (SELECT num, title
         FROM bbs
        WHERE 'N' = :btn
          AND Catalog = :cat
          AND num < :no
        ORDER BY num DESC
        UNION ALL
          SELECT num, title
          FROM bbs
         WHERE 'P' = :btn
           AND Catalog = :cat
           AND num > :no
         ORDER BY num)
 WHERE rownum <= :pageSize
 ORDER BY num DESC;
 
  SELECT *
  FROM (SELECT num, title
         FROM bbs
        WHERE 'N' = 'N'
          AND Catalog = '공지'
          AND num < 10
        --ORDER BY num DESC
        UNION ALL
          SELECT num, title
          FROM bbs
         WHERE 'P' = 'N'
           AND Catalog = '공지'
           AND num > 10)
         --ORDER BY num)
 WHERE rownum <= 4
 ORDER BY num DESC;
                
SELECT *
 FROM (SELECT num, title
         FROM bbs
        WHERE Catalog = :cat
          AND num < :no
        ORDER BY num DESC)
 WHERE rownum <= :pageSize
 UNION ALL               
SELECT *
  FROM (SELECT num, title
          FROM bbs
         WHERE Catalog = :cat
           AND num > :no
           AND rownum <= :pageSize
         ORDER BY num)
 ORDER BY num DESC;
 
SELECT num, title
 FROM (SELECT num, title
         FROM bbs
        WHERE 'N' = :btn
          AND Catalog = :cat
          AND num < :no
        ORDER BY num DESC)
 WHERE rownum <= :pageSize
 UNION ALL               
SELECT num, title
  FROM (SELECT num, title
          FROM bbs
         WHERE 'P' = :btn
          AND Catalog = :cat
           AND num > :no
           AND rownum <= :pageSize
         ORDER BY num)
 ORDER BY num DESC;
 
 
 SELECT num, title
 FROM (SELECT num, title
         FROM bbs
        WHERE 'N' = 'P'
          AND num < 10
        ORDER BY num DESC)
 WHERE rownum <= 4
 UNION ALL               
SELECT num, title
  FROM (SELECT num, title
          FROM bbs
         WHERE 'P' = 'P'
           AND num > 10
           AND rownum <= 4
         ORDER BY num)
 ORDER BY num DESC;