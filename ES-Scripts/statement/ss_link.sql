select paper.ID as P_ID, paper.Title,
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
expert.Realname, expert.WorkPlace,
expert.WorkHistory, expert.Introduction,
expert.Field, expert.Email,
expert.Hindex, linkPaperAuthor.ID as L_ID,
linkPaperAuthor.PaperID as L_P_ID, linkPaperAuthor.AuthorID as L_A_ID,
linkPaperAuthor.AuthorType
FROM (paper INNER JOIN linkPaperAuthor ON paper.ID = linkPaperAuthor.PaperID)
INNER JOIN expert ON linkPaperAuthor.AuthorID = expert.ID
