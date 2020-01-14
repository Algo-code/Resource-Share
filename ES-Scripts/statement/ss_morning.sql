SELECT 
A.P_ID,
A.Title,
A.Origin,
A.SubmitTime,
A.ReferenceNum,
A.Affiliation,
A.Abstract,
A.Fund,
A.KeyWord,
A.ClassificationNumber,
A.Issn,
A.JournalCategory,
A.Journal,
A.Doi,
A.pdf_url,
A.Publisher,
A.Type,
A.Identifier,
A.Hindex,
D.ImpactFactor,
GROUP_CONCAT(A.Realname order by AuthorType) as Realnames,
B.Realname as Realname1,
B.WorkPlace as Workplace1,
C.WorkPlace as Workplace2,
C.Realname as Realname2
FROM 
(
select paper.ID as P_ID, paper.Title as Title,
paper.Origin, paper.SubmitTime,
paper.pdf_url,
paper.ReferenceNum, paper.Affiliation,
paper.Abstract, paper.Fund,
paper.KeyWord, paper.ClassificationNumber,
paper.Issn, paper.JournalCategory,
paper.Journal, paper.Doi,
paper.Publisher, paper.ZcDoi,
paper.Type, paper.Identifier,
paper.JournalID as J_ID, paper.MeetingID,
paper.File, expert.ID as E_ID,
expert.Realname as Realname, expert.WorkPlace as WorkPlace,
expert.Hindex, linkPaperAuthor.ID as L_ID,
linkPaperAuthor.PaperID as L_P_ID, linkPaperAuthor.AuthorID as L_A_ID,
linkPaperAuthor.AuthorType  as AuthorType
FROM (paper INNER JOIN linkPaperAuthor ON paper.ID = linkPaperAuthor.PaperID)
INNER JOIN expert ON linkPaperAuthor.AuthorID = expert.ID) as A,
(
	select paper.ID as P_ID, paper.Title as Title,
	paper.Origin, paper.SubmitTime,
	paper.ReferenceNum, paper.Affiliation,
	paper.Abstract, paper.Fund,
	paper.KeyWord, paper.ClassificationNumber,
	paper.Issn, paper.JournalCategory,
	paper.Journal, paper.Doi,
	paper.Publisher, paper.ZcDoi,
	paper.Type, paper.Identifier,
	paper.JournalID as J_ID, paper.MeetingID,
	paper.File, expert.ID as E_ID,
	expert.Realname as Realname, expert.WorkPlace as WorkPlace,
	expert.Hindex, linkPaperAuthor.ID as L_ID,
	linkPaperAuthor.PaperID as L_P_ID, linkPaperAuthor.AuthorID as L_A_ID,
	linkPaperAuthor.AuthorType  as BAuthorType
	FROM (paper INNER JOIN linkPaperAuthor ON paper.ID = linkPaperAuthor.PaperID)
	INNER JOIN expert ON linkPaperAuthor.AuthorID = expert.ID
	where linkPaperAuthor.AuthorType = 1
) as B,
(

	        select paper.ID as P_ID, paper.Title as Title,
		        paper.Origin, paper.SubmitTime,
			        paper.ReferenceNum, paper.Affiliation,
				        paper.Abstract, paper.Fund,
					        paper.KeyWord, paper.ClassificationNumber,
						        paper.Issn, paper.JournalCategory,
							        paper.Journal, paper.Doi,
								        paper.Publisher, paper.ZcDoi,
									        paper.Type, paper.Identifier,
										        paper.JournalID as J_ID, paper.MeetingID,
											        paper.File, expert.ID as E_ID,
												        expert.Realname as Realname, expert.WorkPlace as WorkPlace,
													        expert.Hindex, linkPaperAuthor.ID as L_ID,
														        linkPaperAuthor.PaperID as L_P_ID, linkPaperAuthor.AuthorID as L_A_ID,
															        linkPaperAuthor.AuthorType  as BAuthorType
																        FROM (paper INNER JOIN linkPaperAuthor ON paper.ID = linkPaperAuthor.PaperID)
																	        INNER JOIN expert ON linkPaperAuthor.AuthorID = expert.ID
																		        where linkPaperAuthor.AuthorType = 2
																		) as C,
(	select paper.ID as P_ID, 
       	journal.ImpactFactor as ImpactFactor
	from paper,journal
	where paper.JournalID=journal.ID
)as D
where A.P_Id = B.P_ID  and A.P_ID = D.P_ID and A.P_ID = C.P_ID

GROUP BY A.P_ID 
