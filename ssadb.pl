# Tue Aug 10 13:05:08 CDT 2010 putting this under RCS.
# Fri Nov 21 10:19:29 CST 2008 Recheck for Campbell Collaboration in database list.

sub escape {
    my($toencode) = @_;
    $toencode=~s/([^a-zA-Z0-9_\-. ])/uc sprintf("%%%02x",ord($1))/eg;
    $toencode =~ tr/ /+/;    # spaces become pluses
    return $toencode;
} 


sub Munge() {
	($term) = (@_);
	$term =~ s/ABI%2FINFORM/INFORM/;	
	$term =~ s/CIAO\+-\+//;
	$term =~ s/CWI.*/CWI/;
	$term =~ s/Statistical\+Abstracts.*/Historical\+Statistics\+of\+the\+United\+States\+%28CD/;
	$term =~ s/Keesing.*/Keesing/;
	$term =~ s/Philosopher.*/Philosopher/;
	$term =~ s/Reader%27s\+Guide\+Retrospective.*/Guide+Retrospective/;
	$term =~ s/Statesman%27s.*/Statesman/;
	$term =~ s/ViVa.*/ViVa/;
	$term =~ s/Marquis.*/Marquis/;
	$term =~ s/Health\+Source%3A\+Nursing.*/Health\+Source%3A\+Nursing/;
	$term =~ s/Women\+and\+Social\+Movements.*/Women\+and\+Social\+Movements/;
	$term =~ s/GPO\+Access.*/GPO\+Access/;
	$term =~ s/PsychiatryOnline/Psychiatry/;
	$term =~ s/EBM\+Reviews%3A\+Database\+of\+Abstracts\+of\+Reviews\+of\+Effectiveness.*/Database\+of\+Abstracts\+of\+Reviews\+of\+Effectiveness/;
	$term =~ s/Making\+of\+the\+Modern\+World.*/Making\+of\+the\+Modern\+World/;
	$term =~ s/Test\+Collection\+%28UofChicago%29/Test Collection/;
	$term =~ s/Campbell+Collaboration+%28Register+of+Campbell+Systematic+Reviews%29/Campbell Collaboration/;
}

$lf = "";
$dlpre = "http://eresources.lib.uchicago.edu:18332/V/?func=find-db-1-title&amp;mode=titles&amp;format=001&amp;scan_start=";
$dlpost = "&amp;search_type=contains";

$apatip = "At APA's Psycnet page you have to deselect the databases you don't want to search.  The fastest way to do this is to uncheck &quot;Select ALL&quot; and then check the database you do want.";
$wilsontip = "Select database(s) from checkbox list.";

%handlemap = (
	"17th-18th century Burney Collection newspapers" => { "handle" => "/h/burney" },
	"19th century British Library newspapers" => { "handle" => "/h/19britnews" },	
	"19th Century Masterfile" => { "handle" =>  "/h/19cm" },
	"19th century U.S. newspapers" => { "handle" => "/h/ncusn" },
	"ABI/INFORM Global (ProQuest)" => { "handle" =>  "/h/abi" },
	"ABSEES- American Bibliography of Slavic and East European Studies (EBSCO)" => {"handle" => "/h2/sbh" },
	"Academic Search Premier (EBSCO)" => { "handle" =>  "/h2/aph" },
	"AccessUN" => { "handle" =>  "/h/accun", "tip" => "Scroll to bottom of listed databases." },
	"AgeLine (CSA)" => { "handle" =>  "/h/ageline" },
	"Alternative Press Index (OCLC)" => {"handle" => "/h/altp" },
	"Alternative Press Index Archive (OCLC)" => {"handle" => "/h/apia" },
	"America: History & Life" => { "handle" =>  "/h/ahl" },
	"American FactFinder" => {"handle" => "http://purl.access.gpo.gov/GPO/LPS7702", "nd" => 1},
	"American Periodicals Series, 1740-1900 (APS Online)" => { "handle" =>  "/h/aps" },
	"Anthropology Plus" => {"handle" => "/h/anplus" },
	"Archive finder" => { "handle" => "/h/archusa", "tip" => "See Archives USA for information on Archive finder", "nd" => 1 },
	"ArchiveGrid" => {"handle" => "/h/archgrd" },
	"Archives USA" => { "handle" =>  "/h/archusa", "tip" => "Included in Archive Finder. Go to &quot;Collection Search&quot; or to &quot;Repository Search&quot; and limit to USA." },
	"ArticleFirst (OCLC)" => {"handle" => "/h/artf" },
	"ATLA Religion Database with ATLASerials (EBSCO)" => { "handle" =>  "/h/atla" },
	"BAS: Bibliography of Asian Studies" => {"handle" => "/h/bas" },
	"Biography and Genealogy Master Index" => { "handle" =>  "/h/biogmi" },
	"Black Thought and Culture (BLTC)" => {"handle" => "/h/bltc" },
	"Book Review Digest Retrospective (Wilson)" => {"handle" => "/h/brdr", "tip" => $wilsontip },
	"Book Review Index Online" => {"handle" => "/h/brio" },
	"Business Source Complete (EBSCO)" => { "handle" =>  "/h2/bth" },
	"C19: The Nineteenth Century Index" => {"handle" => "/h/c19" },
	"Campbell Collaboration (Register of Campbell Systematic Reviews)" => {"handle" => "http://www.campbellcollaboration.org/index.html", "nd" => 1},
	"Catalog of Federal Domestic Assistance" => {"handle" => "http://purl.access.gpo.gov/GPO/LPS1729", "nd" => 1 },
	"Catholic Periodical and Literature Index (EBSCO)" => {"handle" => "/h2/vah" },
	"Central and Eastern European Online Library (CEEOL)" => {"handle" => "/h/ceeol" },
	"Century of Lawmaking For a New Nation" => {"handle" => "http://memory.loc.gov/ammem/amlaw/lawhome.html", "nd" => 1 },
	"Charity navigator" => { "handle" => "http://www.charitynavigator.org", "nd" => 1 },
	"Chicano Database" => { "handle" =>  "/h/chicano" },
	#"Child Abuse, Child Welfare and Adoption Database" => { "handle" =>  "/e/db/maroon/child.html" },
	"Child Development & Adolescent Studies" => { "handle" =>  "/h/cdas" },
	"Child Trends DataBank" => { "handle" => "http://www.childtrendsdatabank.org/", "nd" => 1 },
	"Child welfare information gateway" => { "handle" => "http://www.childwelfare.gov" },
	"Child well-being index" => { "handle" => "http://www.soc.duke.edu/%7Ecwi/", "nd" => 1 },
	"ChildStats.gov" => { "handle" => "http://childstats.gov", "nd" => 1 },
	"CIAO - Columbia International Affairs Online" => { "handle" =>  "/h/ciao" },
	"CILP: Current Index to Legal Periodicals" => { "handle" =>  "/e/law/cilp" },
	"CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)" => { "handle" =>  "/h/cinahl" },
	"CIS: Current Index to Statistics" => { "handle" =>  "/h/cis" },
	"Cochrane Central Register of Controlled Trials (OVID)" => {"handle" => "/h/ccrct" },
	"Cochrane Database of Systematic Reviews (OVID)" => {"handle" => "/h/cdsr" },
	"CountryWatch" => { "handle" =>  "/h/countrywatch" },
	"CQ Electronic Library" => { "handle" =>  "/h/cqel" },
	"CQ Weekly (CQ Press)" => { "handle" =>  "/h/cqweekly" },
	"Criminal Justice Abstracts" => { "handle" =>  "/h/crimjusabs" },
	"Current Contents (ISI)" => {"handle" => "/h/ccc" },
	"CWI - Contemporary Women's Issues (OCLC)" => { "handle" =>  "/h/contemporarywomensissues" },
	#"Directory of health and human services data resources " => {"handle" => "http://aspe.os.dhhs.gov/datacncl/datadir/", "nd" => 1 },
	"Drug Abuse Warning Network" => {"handle" => "http://purl.access.gpo.gov/GPO/LPS79143", "nd" => 1 },
	"EBM Reviews: ACP Journal Club (Ovid)" => {"handle" => "/h/ebmacpjc" },
	"EBM Reviews: Database of Abstracts of Reviews of Effectiveness (DARE) (Ovid)" => {"handle" => "/h/ebmdare" },
	"EconLit with Full Text (EBSCO)" => { "handle" =>  "/h/econlit", "tip" => "Scroll down in listed databases." },
	"Economist" => { "handle" => "/h/economist" },
	#"Education Abstracts (EBSCO)" => { "handle" =>  "/h/educationabstracts" },
	"Education Full Text (Wilson)" => { "handle" => "/h/omnifile", "tip" => $wilsontip },
	"Education Index Retrospective 1929-1983 (Wilson)" => { "handle" => "/h/eir", "tip" => $wilsontip },
	"Educational Administration Abstracts" => { "handle" => "/h2/20h" },
	"ERIC (EBSCO)" => { "handle" =>  "/h2/eric" },
	"ERIC (OCLC)" => { "handle" =>  "/h/eric" },
	"Ethnic NewsWatch (ProQuest)" => {"handle" => "/h/enw" },
	"Facts on File" => {"handle" => "http://www.2facts.com/" },
	"FactSearch (OCLC)" => { "handle" =>  "/h/factsearch" },
	"Factiva" => {"handle" => "/h/factiva" },
	"Family Law Reporter" => {"handle" => "/h/famlawrep" },
	"Gallup Brain" => { "handle" =>  "/h/gallupbrain" },
	"GAO reports" => { "handle" => "http://purl.access.gpo.gov/GPO/LPS16212", "nd" => 1 },
	"GEOBASE (OCLC)" => {"handle" => "/h/geobase" },
	"GPO Access (via USA.gov)" => {"handle" => "/h/gpoaccess" },
	"GPO Monthly Catalog" => { "handle" =>  "/h/gpo" },
	"Grants.gov" => {"handle" => "http://purl.access.gpo.gov/GPO/LPS41115", "nd" => 1 },
	"HAPI: Hispanic American Periodicals Index" => {"handle" => "/h/hapi" },
	"Health and Psychosocial Instruments (HAPI)" => { "handle" =>  "/h/hpi" },
	"Health Source: Nursing/Academic Edition" => {"handle" => "/h2/hch" },
	"HeritageQuest online" => { "handle" => "http://www.heritagequestonline.com/", "tip" => "You must go through http://www.lib.uchicago.edu/e/db/maroon/heritagequest.html from off campus." },
	"Historical Abstracts (EBSCO)" => { "handle" =>  "/h/histabs" },
	"Historical Statistics of the United States (Millennial Edition)" => { "handle" =>  "/h/histstat" },
	"Human Rights Watch" => { "handle" =>  "/h/hrw" },
	"Humanities and Social Science Index Retrospective (Wilson)" => { "handle" => "/h/hssir" },
	"IBR: International Bibliography of Book Reviews" => {"handle" => "/h/ibr" },
	"IBZ: International Bibliography of Periodical Literature" => {"handle" => "/h/ibz" },
	"InsideGood" => { "handle" => "http://www.insidegood.com", "nd" => 1 },
	"International ERIC: Dialog\@Site" => {"handle" => "/h/dialogsite", "tip" => "Select database(s) before clicking &quot;begin&quot;." },
	"Keesing's Record of World Events" => { "handle" =>  "/h/keesings" },
	"Kids Count Data Book" => {"handle" => "http://www.aecf.org/kidscount/sld/databook.jsp", "nd" => 1},
	"Left index" => { "handle" => "/h2/left", "nd" => 1 },
	"LexisNexis Academic" => { "handle" =>  "/h/lexisnexis" },
	"LexisNexis Congressional" => { "handle" =>  "/h/congcomp" },
	"LexisNexis State Capital" => { "handle" =>  "/h/stcapuniv" },
	"LexisNexis Statistical" => { "handle" =>  "/h/statuniv" },
	"LGBT Life with Full Text (EBSCO)" => { "handle" =>  "/h2/qth" },
	"Linguistics and Language Behavior Abstracts (CSA)" => { "handle" =>  "/h/llba" },
	"Making of America" => {"handle" => "http://moa.umdl.umich.edu/", "nd" => 1 },
	"Making of the Modern World: The Goldsmiths'-Kress Library of Economic Literature" => {"handle" => "http://infotrac.galegroup.com/itweb/chic_rbw?db=MOME" },
	"MapStats" => { "handle" => "http://purl.access.gpo.gov/GPO/LPS80974", "nd" => 1 }, 
	"Marquis Who's Who on the Web" => {"handle" => "/h/whoswho" },
	"MEDLINE (OCLC)" => { "handle" =>  "/h/oclcmedline" },
	"MEDLINE (Ovid)" => { "handle" =>  "/h/ovidmedline" },
	"North American Immigrant Letters, Diaries, and Oral Histories" => {"handle" => "/h/naildoh" },
	"PILOTS database" => { "handle" => "http://www.ncptsd.va.gov/ncmain/publications/pilots/index.html", "nd" => 1 },
	"Political science & government abstracts" => { "handle" => "/h/wwpsa", "nd" => 1 },
	"Political Science Complete" => { "handle" => "/h2/poh", "nd" => 1 },
	"Professional development collection" => { "handle" => "/h2/tfh" },
	"PubMed (MEDLINE)" => { "handle" =>  "http://purl.access.gpo.gov/GPO/LPS1783", "nd" => 1},
	"Mental Measurements Yearbook" => { "handle" =>  "/h/mmy" },
	"NASW Register of Clinical Social Workers" => {"handle" => "/h/naswrcsw" },
	"NCJRS: National Criminal Justice Reference Service Virtual Library" => { "handle" =>  "/h/ncjrs" },
	"New York Times Book Review" => {"handle" => "http://proquest.umi.com/pqdweb?RQT=318&VName=PQD&clientid=13392&pmid=7850", "nd" => 1 },
	"Newspaper Source (EBSCO)" => {"handle" => "/h2/nfh" },
	"Official Document System of the United Nations" => {"handle" => "/h/odsus" },
	"Official Index to The Times" => {"handle" => "/h/oit", "tip" => "Times of London, England." },
	"OmniFile FT Mega (Wilson)" => {"handle" => "/h/omnifile", "tip" => $wilsontip },
	"PAIS International (CSA)" => { "handle" =>  "/h/pais" },
	"PEP: Psychoanalytic Electronic Publishing" => { "handle" =>  "/h/pep" },
	# OCLC doesn't list Periodical Abstacts.
	#"Periodical Abstracts (OCLC)" => { "handle" =>  "/h/periodicalabstracts" },
	"Philosopher's Index (CSA)" => { "handle" =>  "/h/philindex" },
	"Poll Track" => {"handle" => "/h/polltrack" },
	"POPLINE" => { "handle" =>  "/h/popline" },
	"Population Index" => {"handle" => "/h/popindex" },
	#"ProceedingsFirst (OCLC)" => {"handle" => "http://newfirstsearch.oclc.org/dbname=Proceedings;done=referer;FSIP/", "nd" => 1 },
	"ProceedingsFirst (OCLC)" => {"handle" => "/h/proceedingsfirst", },
	"Proquest Newspapers" => { "handle" =>  "/h/pqnewsstand" },
	"PsycARTICLES (APA)" => { "handle" =>  "/h/apanet", "tip" => $apatip },
	"PsycBOOKS (APA)" => {"handle" => "/h/psycbooks", "tip" => $apatip },
	"PsycCRITIQUES (APA)" => {"handle" => "/h/psyccritiques", "tip" => $apatip },
	"PsycEXTRA (APA)" => {"handle" => "/h/psycbooks", "tip" => $apatip },
	"PsychiatryOnline" => {"handle" => "/h/appi" },
	"PsycINFO (APA)" => { "handle" =>  "/h/psycinfo", "tip" => $apatip },
	"Public Documents Masterfile (Paratext)" => {"handle" => "/h/pubdocs" },
	"Reader's Guide Retrospective (Wilson)" => { "handle" =>  "/h/readersguide", "tip" => $wilsontip },
	"Regional Business News (EBSCO)" => {"handle" => "/h2/bwh" },
	"Reports & Testimonies (GAO)" => { "handle" => "http://purl.access.gpo.gov/GPO/LPS113321", "nd" => 1 },
	"Research Guides for Foreign & International Law" => { "handle" => "http://guides.lib.uchicago.edu/content.php?pid=67915&sid=594452", "nd" => 1 },
	"Roper Center for Public Opinion Research" => {"handle" => "/h/ropercenter" },
	"SCIRUS (Elsevier)" => {"handle" => "/h/scirus" },
	"SCOPUS (Elsevier)" => { "handle" => "/h/scopus" },
	"Social Sciences Citation Index (ISI)" => {"handle" => "/h/ssci", "tip" => "Use the &quot;Web of Science&quot; tab and deselect the other databases." },
	"Social Explorer" => {"handle" => "/h/socialexplorer" },
	"Social Services Abstracts (CSA)" => { "handle" =>  "/h/ssabs" },
	"Social Theory" => {"handle" => "http://soth.alexanderstreet.com" },
	"Social welfare forum, Official proceedings [of the] annual forum (1874-1982)" => {"handle" => "http://www.hti.umich.edu/n/ncosw/", "nd" => 1 },
	"Social Work Abstracts" => { "handle" =>  "/h2/swh" },
	"Sociological Abstracts (CSA)" => { "handle" =>  "/h/sociologicalabstracts" },
	"Sourcebook of Criminal Justice Statistics" => {"handle" => "http://proxy.uchicago.edu/login?url=http://purl.access.gpo.gov/GPO/LPS3639", "nd" => 1 },
	"SourceOECD" => { "handle" =>  "/h/sourceoecd" },
	"STAT-USA" => { "handle" =>  "/h/statusa" },
	"Statesman's Yearbook" => { "handle" =>  "/h/syb" },
	"Statistical Abstracts (of the United States)" => { "handle" =>  "/h/census" },
	"Test Collection (UofChicago)" => { "handle" =>  "/e/su/tests/" },
	"THOMAS: Legislative Information on the Internet" => { "handle" =>  "/h/thomas" },
	"U.S. Congressional Serial Set" => {"handle" => "http://www.lexisnexis.com/congcomp" },
	"U.S. Supreme Court Records and Briefs, 1832-1978" => {"handle" => "/h/usscrb" },
	# UNData has replaced ...
	#"United Nations Common Database" => { "handle" =>  "/h/unstats" },
	"United Nations Data" => {"handle" => "http://data.un.org" },
	"United Nations documentation: research guide" => {"handle" => "http://www.un.org/Depts/dhl/resguide/", "nd" => 1 },
	"United Nations Publications" => { "handle" => "http://bibpurl.oclc.org/web/16394", "nd" => 1 },
	"ViVa: A Bibliography of Women's History" => { "handle" =>  "/h/viva" },
	# All occurences of Web of Science are for SSCI.
	#"Web of Science" => { "handle" => "/h/webofscience" },
	"Wilson Biography Indices" => {"handle" => "http://vnweb.hwwilsonweb.com.proxy.uchicago.edu/hww/jumpstart.jhtml", "nd" => 1, "tip" => $wilsontip },
	"Women and Social Movements in the United States 1600-2000" => {"handle" => "/h/wass" },
	"World Education Encyclopedia" => {"handle" => "/h/wee" },
	"World News Connection" => { "handle" =>  "/h/worldnews" },
	"Worldwide Political Science Abstracts (CSA)" => { "handle" =>  "/h/wwpsa" },
	"Yearbook of International Organizations" => { "handle" =>  "/h/ybio", "tip" => "Select from pulldown list or from box list." }
);



$proxy = "http://proxy.uchicago.edu/login?url=";





################################
%topics = (
	"Addiction/Substance Abuse" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'PsycINFO (APA)',
		'MEDLINE (OCLC)',
		'MEDLINE (Ovid)',
		'PubMed (MEDLINE)',
		'Drug Abuse Warning Network',
		'PAIS International (CSA)',
		'Child Development & Adolescent Studies',
		'CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)',
		'Academic Search Premier (EBSCO)',
		'ERIC (EBSCO)',
		'ERIC (OCLC)',
		'SCOPUS (Elsevier)',
		'SCIRUS (Elsevier)',
	],
	"Adoption/Foster Care"  => [
#		'Child Abuse, Child Welfare and Adoption Database',
		"Child welfare information gateway",
		"Child Trends DataBank",
		"ChildStats.gov",
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'Sociological Abstracts (CSA)',
		'PsycINFO (APA)',
		'Child Development & Adolescent Studies',
		'Academic Search Premier (EBSCO)',
		'SCOPUS (Elsevier)',
		'Social Sciences Citation Index (ISI)'
	],
	"Aged/Elderly/Gerontology" => [
		'AgeLine (CSA)',
		'Social Work Abstracts',
		"CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)",
		'Social Services Abstracts (CSA)',
		'Sociological Abstracts (CSA)',
		'MEDLINE (OCLC)',
		'MEDLINE (Ovid)',
		'PubMed (MEDLINE)',
		'PsycINFO (APA)',
		'CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)',
		'SCOPUS (Elsevier)'
	],
	"Biography" => [
		'Biography and Genealogy Master Index',
		'NASW Register of Clinical Social Workers',
		'Marquis Who\'s Who on the Web',
		'Wilson Biography Indices'
	],
	"Book Reviews" => [
		'Book Review Digest Retrospective (Wilson)',
		'New York Times Book Review',
		'Book Review Index Online',
		"Humanities and Social Science Index Retrospective (Wilson)",
		'IBR: International Bibliography of Book Reviews',
		'PsycCRITIQUES (APA)'
	],
	"Child/Children - policy, welfare, development, youth" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'Child Development & Adolescent Studies',
		"Child welfare information gateway",
		"ChildStats.gov",
		"Child Trends DataBank",
		"Child well-being index",
		'Academic Search Premier (EBSCO)',
		'Kids Count Data Book',
		'Social Sciences Citation Index (ISI)',
		'SCOPUS (Elsevier)'
	],
	"Community Development/Organization/Services" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'PAIS International (CSA)',
		'Sociological Abstracts (CSA)',
		"LexisNexis Academic",
		"Left index",
		"Ethnic NewsWatch (ProQuest)",
		'Alternative Press Index Archive (OCLC)',
		'Alternative Press Index (OCLC)',
		'ABI/INFORM Global (ProQuest)',
		'Business Source Complete (EBSCO)',
		'Regional Business News (EBSCO)',
		'CIAO - Columbia International Affairs Online',
		'Worldwide Political Science Abstracts (CSA)',
		'American FactFinder',
		'SCOPUS (Elsevier)'
	],
	"Crime/Criminals/Corrections/Criminology - adult, juvenile" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'Sociological Abstracts (CSA)',
		"Campbell Collaboration (Register of Campbell Systematic Reviews)",
		'Criminal Justice Abstracts',
		'Worldwide Political Science Abstracts (CSA)',
		'NCJRS: National Criminal Justice Reference Service Virtual Library',
		'Sourcebook of Criminal Justice Statistics',
		'Academic Search Premier (EBSCO)',
		'Social Sciences Citation Index (ISI)',
		'PsycINFO (APA)',
		'SCOPUS (Elsevier)',
		'Public Documents Masterfile (Paratext)',
		"ChildStats.gov",
		"Child Trends DataBank"

	],
	"Disability - developmental, mental, physical" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'Sociological Abstracts (CSA)',
		"ChildStats.gov",
		"CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)",
		'MEDLINE (OCLC)',
		'MEDLINE (Ovid)',
		'PubMed (MEDLINE)',
		'PsycINFO (APA)',
		'Linguistics and Language Behavior Abstracts (CSA)',
		'Academic Search Premier (EBSCO)',
		'Social Sciences Citation Index (ISI)',
		'PsychiatryOnline'
	],
	"Economics" => [
		'ABI/INFORM Global (ProQuest)',
		'Business Source Complete (EBSCO)',
		'EconLit with Full Text (EBSCO)',
		'Factiva',
		'Making of the Modern World: The Goldsmiths\'-Kress Library of Economic Literature'

	],
	"Education/Social Work Education/School Social Work/Special Education" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'ERIC (OCLC)',
		'ERIC (EBSCO)',
		"ChildStats.gov",
		"Education Full Text (Wilson)",
		"Educational Administration Abstracts",
		"Child Trends DataBank",
		"Professional development collection",
		'LexisNexis Academic',
		'LexisNexis Congressional',
		'Child Development & Adolescent Studies',
		'Education Index Retrospective 1929-1983 (Wilson)',
		'International ERIC: Dialog@Site',
		'World Education Encyclopedia',
		'Campbell Collaboration (Register of Campbell Systematic Reviews)'
	],
	"Family - policy, therapy" => [
		'Social Work Abstracts',
		"Child welfare information gateway",
		"ChildStats.gov",
		"Child Trends DataBank",
		"Child well-being index",
		'PsycINFO (APA)',
		'PsycARTICLES (APA)',
		'PsycBOOKS (APA)',
		'PsycEXTRA (APA)',
		'PsycCRITIQUES (APA)',
		'PsychiatryOnline',
		'MEDLINE (OCLC)',
		'MEDLINE (Ovid)',
		'PubMed (MEDLINE)',
		'Social Services Abstracts (CSA)',
		'Child Development & Adolescent Studies',
		'Sociological Abstracts (CSA)',
		'Academic Search Premier (EBSCO)',
		'Family Law Reporter'
	],
	"Gender Studies/Sexual Diversity" => [
		'LGBT Life with Full Text (EBSCO)',
		'CWI - Contemporary Women\'s Issues (OCLC)',
		'Sociological Abstracts (CSA)',
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'PsycINFO (APA)',
		'PsycARTICLES (APA)',
		'PsycBOOKS (APA)',
		'PsycEXTRA (APA)',
		'Child Development & Adolescent Studies'
	],
	"Health/Medical Care - administration, policy" => [
		'MEDLINE (OCLC)',
		'MEDLINE (Ovid)',
		'PubMed (MEDLINE)',
		'SCIRUS (Elsevier)',
		'SCOPUS (Elsevier)',
		"ChildStats.gov",
		'CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)',
		'Health Source: Nursing/Academic Edition',
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'PAIS International (CSA)',
		'Social Sciences Citation Index (ISI)',
		'Health and Psychosocial Instruments (HAPI)',
		'EBM Reviews: ACP Journal Club (Ovid)',
		'EBM Reviews: Database of Abstracts of Reviews of Effectiveness (DARE) (Ovid)',
		'Cochrane Central Register of Controlled Trials (OVID)',
		'Cochrane Database of Systematic Reviews (OVID)',
		'PsycINFO (APA)'
	],
	"History, US" => [
		'America: History & Life',
		'Reader\'s Guide Retrospective (Wilson)',
		"HeritageQuest online",
		'Academic Search Premier (EBSCO)',
		'C19: The Nineteenth Century Index',
		'Social Sciences Citation Index (ISI)',
		'SCOPUS (Elsevier)',
		'LexisNexis Academic',
		"Archive finder",
		"19th Century Masterfile",
		"19th century U.S. newspapers",
		"U.S. Supreme Court Records and Briefs, 1832-1978",
		'Newspaper Source (EBSCO)',
		'American Periodicals Series, 1740-1900 (APS Online)',
		'Social Explorer',
		'ArchiveGrid',
		'U.S. Congressional Serial Set',
		'U.S. Supreme Court Records and Briefs, 1832-1978',
		'Public Documents Masterfile (Paratext)',
		'Historical Statistics of the United States (Millennial Edition)',
		'Women and Social Movements in the United States 1600-2000',
		'Social welfare forum, Official proceedings [of the] annual forum (1874-1982)',
		'Century of Lawmaking For a New Nation',
		'Making of America',
		'North American Immigrant Letters, Diaries, and Oral Histories'
	],
	"History, world" => [
		'Historical Abstracts (EBSCO)',
		"17th-18th century Burney Collection newspapers",
		'C19: The Nineteenth Century Index',
		'SCOPUS (Elsevier)',
		'Social Sciences Citation Index (ISI)',
		'Proquest Newspapers',
		"19th century British Library newspapers",
		"Economist",
		'Official Index to The Times',
		'Making of the Modern World: The Goldsmiths\'-Kress Library of Economic Literature'
	],
	"Housing/Homelessness" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		"ChildStats.gov",
		'PAIS International (CSA)',
		'Sociological Abstracts (CSA)',
		'ABI/INFORM Global (ProQuest)',
		'Business Source Complete (EBSCO)',
		'SCOPUS (Elsevier)',
		'Social Sciences Citation Index (ISI)',
		'Facts on File',
		'Academic Search Premier (EBSCO)',
		'LexisNexis Academic',

	],
	"International Social Services/Policy/Work/Welfare" => [
		'PAIS International (CSA)',
		'Worldwide Political Science Abstracts (CSA)',
		"ChildStats.gov",
		'Campbell Collaboration (Register of Campbell Systematic Reviews)',
		'Sociological Abstracts (CSA)',
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'International ERIC: Dialog@Site',
		'Social Sciences Citation Index (ISI)',
		'SCOPUS (Elsevier)',
		'POPLINE',
		'Population Index',
		'Business Source Complete (EBSCO)',
		'ABI/INFORM Global (ProQuest)',
		'Factiva',
		'CountryWatch',
		'Human Rights Watch',
		'Child Development & Adolescent Studies',
		'Alternative Press Index (OCLC)',
		'Alternative Press Index Archive (OCLC)',
		'CIAO - Columbia International Affairs Online',
		'IBZ: International Bibliography of Periodical Literature',
		'World News Connection',
		'Statesman\'s Yearbook',
		'ABSEES- American Bibliography of Slavic and East European Studies (EBSCO)',
		'BAS: Bibliography of Asian Studies',
		'Central and Eastern European Online Library (CEEOL)',
		'SourceOECD',
		'Official Document System of the United Nations',
		'AccessUN',
		"United Nations Publications",
		#'United Nations Common Database',
		'United Nations Data',	
		'United Nations documentation: research guide',
		'Yearbook of International Organizations',
		"Research Guides for Foreign & International Law"
	],
	"Management/Business" => [
		'ABI/INFORM Global (ProQuest)',
		'Business Source Complete (EBSCO)',
		'Factiva',
		'Regional Business News (EBSCO)',
		"LexisNexis Academic",
		'PsycINFO (APA)',
		'SCOPUS (Elsevier)',
		'Academic Search Premier (EBSCO)',

	],
	"Nonprofits/Charities/Foundations" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		"Charity navigator",
		"Grants.gov",
		"InsideGood",
		'Business Source Complete (EBSCO)',
		'ABI/INFORM Global (ProQuest)',
		'PAIS International (CSA)',
		'Sociological Abstracts (CSA)',
		'Child Development & Adolescent Studies',
		'SCOPUS (Elsevier)',
		'Catalog of Federal Domestic Assistance',
		'Grants.gov'

	],
	"Poverty/Poor" => [
		"ChildStats.gov",
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'ABI/INFORM Global (ProQuest)',
		'Business Source Complete (EBSCO)',
		'EconLit with Full Text (EBSCO)',
		'Sociological Abstracts (CSA)',
		'Academic Search Premier (EBSCO)',
		'Child Development & Adolescent Studies',
		'SCOPUS (Elsevier)',
		'PAIS International (CSA)'
	],
	"Psychotherapy - adults, children" => [
		'Social Work Abstracts',
		'MEDLINE (OCLC)',
		'MEDLINE (Ovid)',
		'PubMed (MEDLINE)',
		'PsycINFO (APA)',
		'PsycARTICLES (APA)',
		'PsycBOOKS (APA)',
		'PsycEXTRA (APA)',
		"CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)",
		'Child Development & Adolescent Studies',
		"PILOTS database",
		'SCOPUS (Elsevier)',
		'Academic Search Premier (EBSCO)',
		'PEP: Psychoanalytic Electronic Publishing',
		'CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)',
		'EBM Reviews: ACP Journal Club (Ovid)',
		'EBM Reviews: Database of Abstracts of Reviews of Effectiveness (DARE) (Ovid)',
		'Cochrane Central Register of Controlled Trials (OVID)',
		'Cochrane Database of Systematic Reviews (OVID)',
		'PsychiatryOnline'


	],
	"Public Policy" => [
		'PAIS International (CSA)',
		'Sociological Abstracts (CSA)',
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'Social Sciences Citation Index (ISI)',
		"GAO reports",
		'SCOPUS (Elsevier)',
		'ABI/INFORM Global (ProQuest)',
		"Left index",
		"Political science & government abstracts",
		"Political Science Complete",
		"Worldwide Political Science Abstracts (CSA)",
		'Business Source Complete (EBSCO)',
		'Alternative Press Index (OCLC)',
		'Alternative Press Index Archive (OCLC)',
		'Population Index',
		'Poll Track',
		'Gallup Brain',
		'Roper Center for Public Opinion Research',
		'CQ Electronic Library',
		'Facts on File',
		'LexisNexis Congressional',
		'LexisNexis State Capital',
		'U.S. Congressional Serial Set',
		'LexisNexis Academic',
		'Public Documents Masterfile (Paratext)',
		'GPO Access (via USA.gov)',
		'GPO Monthly Catalog',
		'THOMAS: Legislative Information on the Internet',
		'CILP: Current Index to Legal Periodicals',
		'Human Rights Watch',
		"Ethnic NewsWatch (ProQuest)",
		'Proquest Newspapers',
		'Century of Lawmaking For a New Nation',
		'CQ Weekly (CQ Press)',
	],
	"Race Relations/Racial Diversity/Minorities/Ethnic Groups" => [
		'America: History & Life',
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'SCOPUS (Elsevier)',
		'Academic Search Premier (EBSCO)',
		'Sociological Abstracts (CSA)',
		'PAIS International (CSA)',
		'Social Sciences Citation Index (ISI)',
		'Ethnic NewsWatch (ProQuest)',
		'Alternative Press Index (OCLC)',
		'Alternative Press Index Archive (OCLC)',
		'Anthropology Plus',
		'HAPI: Hispanic American Periodicals Index',
		'Chicano Database',
		'ATLA Religion Database with ATLASerials (EBSCO)',
		'Black Thought and Culture (BLTC)',
	],
	"Religion/Spirituality" => [
		'ATLA Religion Database with ATLASerials (EBSCO)',
		'America: History & Life',
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'SCOPUS (Elsevier)',
		'Sociological Abstracts (CSA)',
		'Philosopher\'s Index (CSA)',
		'Catholic Periodical and Literature Index (EBSCO)',
		'CINAHL: Cumulative Index of Nursing and Allied Health (EBSCO)',
	],
	"Social Change/Activism/Advocacy" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'Sociological Abstracts (CSA)',
		'PAIS International (CSA)',
		'Alternative Press Index (OCLC)',
		'Alternative Press Index Archive (OCLC)',
		'Regional Business News (EBSCO)',
		'Social Sciences Citation Index (ISI)',
	],
	"Social Policy - service, welfare, work" => [
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'PAIS International (CSA)',
		"Left index",
		'CILP: Current Index to Legal Periodicals',
		'Sociological Abstracts (CSA)',
		'SCOPUS (Elsevier)',
		'Alternative Press Index (OCLC)',
		'Alternative Press Index Archive (OCLC)',
		"Political science & government abstracts",
		"Political Science Complete",
		"Worldwide Political Science Abstracts (CSA)",
		'POPLINE',
		'Population Index',
		'Social Sciences Citation Index (ISI)',
		'GEOBASE (OCLC)',
		'Academic Search Premier (EBSCO)',
		'ABI/INFORM Global (ProQuest)',
		'Business Source Complete (EBSCO)',
		'Regional Business News (EBSCO)',
		'Human Rights Watch',
		'Proquest Newspapers',
		'GPO Access (via USA.gov)',
		'GPO Monthly Catalog',
		'Public Documents Masterfile (Paratext)',
		'Social Theory',
		'Campbell Collaboration (Register of Campbell Systematic Reviews)',

	],
	"Social Science (general)" => [
		'Academic Search Premier (EBSCO)',
		#'Periodical Abstracts (OCLC)',
		'Social Sciences Citation Index (ISI)',
		'Current Contents (ISI)',
		'ProceedingsFirst (OCLC)',
		'ArticleFirst (OCLC)',
		'OmniFile FT Mega (Wilson)',
		'SCOPUS (Elsevier)',
	],
	"Statistics - on social work and social service topics" => [
		'Statistical Abstracts (of the United States)',
		'STAT-USA',
		'LexisNexis Statistical',
		'American FactFinder',
		'SourceOECD',
		'Sourcebook of Criminal Justice Statistics',
		'Kids Count Data Book',
		"Child welfare information gateway",
		"ChildStats.gov",
		"MapStats",
		'Historical Statistics of the United States (Millennial Edition)',
		#'Directory of health and human services data resources '

	],
	"Tests - assessment, psychological" => [
		'Test Collection (UofChicago)',
		'Mental Measurements Yearbook',
		'Health and Psychosocial Instruments (HAPI)'
	],
	"Urban Planning/Urban Studies/Urban History" => [
		'Social Services Abstracts (CSA)',
		'Social Work Abstracts',
		"Left index",
		'PAIS International (CSA)',
		'Sociological Abstracts (CSA)',
		"Political science & government abstracts",
		"Political Science Complete",
		"Worldwide Political Science Abstracts (CSA)",
		'ABI/INFORM Global (ProQuest)',
		'Business Source Complete (EBSCO)',
		'Regional Business News (EBSCO)',
		'Social Sciences Citation Index (ISI)',
		'Academic Search Premier (EBSCO)',
		'GEOBASE (OCLC)',
		'Social Explorer',
		'SCOPUS (Elsevier)',
	],
	"Women" => [
		'CWI - Contemporary Women\'s Issues (OCLC)',
		'Social Work Abstracts',
		'Social Services Abstracts (CSA)',
		'SCOPUS (Elsevier)',
		'Sociological Abstracts (CSA)',
		'PsycINFO (APA)',
		'LGBT Life with Full Text (EBSCO)',
		'Women and Social Movements in the United States 1600-2000',
		'ViVa: A Bibliography of Women\'s History',
	]
);












#<script type="text/javascript" src="wz_tooltip.js"></script>
# <p>This is Eileen Libby's list of databases to use for working on
# topics in social work and social services.  Under each topic she
# has provided a very rough listing, from most useful to least for
# doing general work in the topic.  Note that for more
# specific subtopics, the ranking will be different.

open(LINKS,">tips.html");

print LINKS <<"EOT";
<html>
<head>
<title>Database Tips</title>
<link rel="stylesheet" href="ssadb.css">
<style type="text/css">
ul li { margin-bottom: 12px; }
</style>
</head>
<body>
 <h2>Database Tips</h2>
 <ul>

 <li><strong>Use the right database.</strong>  Don't look for
 journal articles in a statistical database, for example.</li>

 <li><strong>Take time to learn different databases's search interfaces;</strong>
 it will be worth it in the long term.</li>

 <li><strong>Use the right search terms to focus your searches.</strong>
 Different disciplines often use different terms when referring to
 similar concepts.  Notice how results expand or narrow or become more
 or less meaningful with the use of synoymns.</li>

 <li><strong>Eliminate redundant terms.</strong>  For example, when using
 "Education Abstracts" don't use "education" or "school" as a search term.</li>

 <li><strong>Use logical operations to focus your search.</strong>  Ovid and
 OCLC provide methods for combining terms with "and" and "or" operators.</li>
 Effective use of these operators, along with good search term selection,
 can dramatically improve search results.</li>

 <li><strong>Save your results on disk or by e-mail.</strong>  You can lose
 work for a variety of reasons: you inadvertently close the results
 window; your session times out (OCLC sessions time out after 10 minutes,
 for example); a hardware or software fault on the database server can
 wipe out results.</li>

	<br>Options:
	<ul>

	<li>E-mail results to yourself.  Some databases e-mail query
	logic along with the search results. The logic can be pasted
	into the database to reproduce the results at a later time.</li>

	<li>Save results to a USB (flash/jump/thumb) drive.</li>

	<li>Save results to <a target="_newws"
	href="http://webshare.uchicago.edu">http://webshare.uchicago.edu</a>.  
	Login with CNET id and password.</li>

	</ul>

 <li><strong>Don't hesitate to ask SSAd Library staff for help!</strong></li>
 <ul>
    <li>phone: 773-702-1199</li>
    <li>e-mail: &#115;&#115;&#97;&#100;&#64;&#108;&#105;&#98;&#46;&#117;&#99;&#104;&#105;&#99;&#97;&#103;&#111;&#46;&#101;&#100;&#117;</li>
 </ul>
</ul>

</body>
</html>

EOT

close(LINKS);
open(MAIN,">ssadb.html");

print MAIN <<"EOT";

<html>
<head>
<title>Electronic Databases for Social Service & Social Work Topics</title>
<link rel="stylesheet" href="ssadb.css">
<!-- Don't get framed. -->
<script type="text/javascript">
<!--
if (top != self)
     top.location=self.document.location;
//-->
</script>
</head>
<body>
<h2>Electronic Databases for Social Service & Social Work Topics</h2>


<p>Click a topic to get a prioritized list of databases.  Clicking
a database name opens the database in a new window or tab.  The
<img align="bottom" src="inform.gif" alt="METALIB information page
for database"> icon links to the <a
href="http://www.exlibrisgroup.com/category/MetaLibFAQ">METALIB</a>
description page for the database, which provides a brief description.
Hovering over the <img align="bottom" title="Some helpful usage
info." src="help.gif"> tip icon displays usage information. Here
are <a target="linkframe" href="tips.html">some tips for using
databases</a>.  There is also an <a target="linkframe"
href="alpha.html">alphabetical list</a> of all databases referenced here.

<p><b>DSM-IV-TR</b> is on line at <a target="_newpsyconline"
href="http://proxy.uchicago.edu/login?url=http://www.lib.uchicago.edu/h/appi">http://www.lib.uchicago.edu/h/appi</a>
(PsychiatryOnline).


<p><a href="list.txt" target="_newplaintext">Plain text version of list for printing</a>.

<table cellspacing="0" cellpadding="5" width="100%">
<tr valign="top">
<td>
<h2>Topics</h2>
<ul style="{font-size:75%;}">
EOT

foreach $t (sort { lc($a) cmp lc($b) } keys %topics) {
	$c++;
	print MAIN "<li><a target=\"linkframe\" href=\"dblinks$c.html\">$t</a>\n";
}


print MAIN <<"EOT";
</ul>
<td width="66%" height="100%">
<iframe name="linkframe"
frameborder="0"
width="100%"
height="95%">
</iframe>

</table>
</body>
</html>
EOT


open(LIST,">list.txt");

print LIST<<"EOT";

Electronic Databases for Social Service & Social Work Topics

EOT

foreach $k (sort { lc($a) cmp lc($b) } keys %topics) {
	$l++;
	print LIST "$k\n";
	open(LINKS,">dblinks$l.html");
	print LINKS "<html><head><link rel=\"stylesheet\" href=\"ssadb.css\"><title></title></head><body>";
	#print LINKS "<h3><a name=\"$l\">$k</a></h3>\n";
	print LINKS "<h3>$k</h3>\n";
	print LINKS "<ul style=\"{list-style:none;}\">\n";
	for $i (0 .. $#{ $topics{$k} } ) {
		print LIST "\t$topics{$k}[$i]\n";
		$t++;
		$term = escape($topics{$k}[$i]);
		&Munge($term);
		if ($handlemap{$topics{$k}[$i]}{"handle"} eq "") {
			print LINKS "<li><font color=\"red\">$topics{$k}[$i]</font></li>$lf\n";
		} else {

			if ($handlemap{$topics{$k}[$i]}{"handle"} =~ /^\//) { $baseurl = "http://www.lib.uchicago.edu"; } else { $baseurl = ""; }

			if ($handlemap{$topics{$k}[$i]}{"tip"} eq "") {
				print LINKS "<li><a target=\"_new$t\" href=\"$proxy$baseurl$handlemap{$topics{$k}[$i]}{'handle'}\">$topics{$k}[$i]</a>\n";
				if ($handlemap{$topics{$k}[$i]}{"nd"}) {
					print LINKS "</li>$lf\n";
				} else {
					print LINKS " <a target=\"_new$t\" href=\"$dlpre$term$dlpost\"><img alt=\"METALIB information page for database\" title=\"Link to METALIB description.\" align=\"bottom\" src=\"inform.gif\" border=\"0\"></a></li>$lf\n";
				}
			
			} else {
				$comm = $handlemap{$topics{$k}[$i]}{"tip"};
				print LINKS "<li><a  target=\"_new$t\" href=\"$proxy$baseurl$handlemap{$topics{$k}[$i]}{'handle'}\">$topics{$k}[$i]</a> <img align=\"bottom\" title=\"$comm\" src=\"help.gif\">\n" ;
				if ($handlemap{$topics{$k}[$i]}{"nd"}) {
					print LINKS "</li>$lf\n";
				} else {
					print LINKS " <a  target=\"_new$t\" href=\"$dlpre$term$dlpost\"><img title=\"Link to METALIB description page.\" alt=\"METALIB information page for database\" align=\"bottom\" src=\"inform.gif\" border=\"0\"></a></li>$lf\n";
					
				}
			}
		}
		#print $handlemap{$topics{$k}[$i]}{'nd'};
	}
	print LINKS "</ul></body></html>\n";
	close(LINKS);
}



open(LINKS,">alpha.html");
print LINKS "<html><head><title>Alphabetical List of Databases</title><link rel=\"stylesheet\" href=\"ssadb.css\"></head><body><h2>Alphabetical List of Databases</h2>";


print LINKS "<ol>\n";

print LIST <<"EOT";

----------------------------------------------------------------------------------------------------------

Alphabetical list of referenced databases and their web addresses.
Addresses beginning with a / are handles.
Prepend http://www.lib.uchicago.edu to these to obtain a URL.


EOT

foreach $name (sort {lc($a) cmp lc($b) } keys %handlemap) {
	print LIST $name . "\n\t" . $handlemap{$name}{'handle'}. "\n";

	$t++;
	$term = escape($name);
	&Munge($term);
	if ($handlemap{$name}{"handle"} eq "") {
		print LINKS "<li><font color=\"red\">$name</font></li>$lf\n";
	} else {

		if ($handlemap{$name}{"handle"} =~ /^\//) { $baseurl = "http://www.lib.uchicago.edu"; } else { $baseurl = ""; }

		if ($handlemap{$name}{'tip'} ne "") {
			$comm = $handlemap{$name}{"tip"};
			print LINKS "<li><a target=\"_new$t\" href=\"$proxy$baseurl$handlemap{$name}{'handle'}\">$name</a> <img align=\"bottom\" src=\"help.gif\" title=\"$comm\">\n" ;
			
			if ($handlemap{$name}{'nd'}) {
				print LINKS "</li>$lf\n";
			} else {
				print LINKS " <a  target=\"_new$t\" href=\"$dlpre$term$dlpost\"><img title=\"Link to METALIB description page.\" alt=\"METALIB information page for database\" align=\"bottom\" src=\"inform.gif\" border=\"0\"></a></li>$lf\n";
			}
		} else {

			print LINKS "<li><a  target=\"_new$t\" href=\"$proxy$baseurl$handlemap{$name}{'handle'}\">$name</a>";
			if ($handlemap{$name}{'nd'}) {
				print LINKS "</li>$lf\n";
			} else {
				print LINKS " <a  target=\"_new$t\" href=\"$dlpre$term$dlpost\"><img title=\"Link to METALIB description page.\" alt=\"METALIB information page for database\" align=\"bottom\" src=\"inform.gif\" border=\"0\"></a></li>$lf\n";
			}
		}

		
	}

}
close(LIST);
print LINKS "</ol></body></html>\n";
close(LINKS);

