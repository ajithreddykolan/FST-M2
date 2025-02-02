-- Load input files
script = LOAD '/root/inputs/episode*_dialogues.txt' USING PigStorage('\t') AS (Character:chararray,Dialogue:chararray);

-- Combine the words from the above stage
grpd = GROUP script BY Character;

-- Count
dialogue_spoke = FOREACH grpd GENERATE $0 AS Character_Name, COUNT($1) AS no_of_dialogue;

--Order
ordered = ORDER no_of_dialogue BY lines DESC;

-- To remove old ouputs
rmf /root/PigProjResult

-- Store Reults
STORE ordered INTO '/root/PigProjResult' USING PigStorage('\t');

