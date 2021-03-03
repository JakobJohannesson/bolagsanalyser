
# Bolagsanalyser <img src="man/figures/jakobjohannesson.png" align="right" width="120"/>

I dagsläget är det många som fortfarande använder sig av en excel/word
kombination för att göra sin bolagsanalys, vilket innebär att mycket tid
spenderas på att underhålla sina rapporter, strukturera mappar,
validering och uppdatering av datamaterial. Därför skapade jag
bolagsanalyser.

Målet med paketet bolagsanalyser är att leverera en komplett
reproducerbar analysprocess till en bredare skara investerare.
Bolagsanalyser är främst riktat till personer som har tillgång till
Börsdatas API, men om intresse finns kan även mallar för personer som
inte har tillgång till Börsdatas API skapas.

Varför använda sig av Bolagsanalyser? Fördelarna är att dina analyser
blir reproducerbara, filerna som du skapar är enkla att ändra utan att
hela projektet förstörs. Vidare så bygger Bolagsanalyser på Börsdatas
API som primära datakälla vilket innebär att all data i din rapport
uppdateras konternuerligt, så när en ny rapport kommer så skriver du
bara ut rapporten igen så är all ny data där.

Fler fördelar är att du skapar nya projekt för varje bolagsanalys som du
gör, varje analys använder sin egen mapp och har inget extern beroende
av andra tidigare analyser. Vidare så innebär detta att du inte behöver
tänka på att använda dig av copy paste när du ska göra en ny analys,
arbetet blir helt enkelt mycket strukturerat direkt. Yttligare fler
fördelar är att du sparar otroligt mycket tid genom att slippa söka runt
så mycket för statistik information. Sista fördelen är att alla dina
rapporter kommer att hålla ett stabilt format.

Nackdelen med att använda sig av paketet är att det är svårt att göra en
mall som är lika snygg som exempelvis en CFA analys. En annan nackdel är
att du behöver använda dig av R, vilket kanske inte passar alla.
Generellt är det främst text som man kommer att skriva (precis som en
vanlig rapport som är skriven i Word), därför kanske detta inte är något
problem. Efter ett tag är det lättare att skriva i R än vad det är att
skriva i Word.

## Se exempel

#### *[Evolution](https://www.jakobj.se/test/evolution.pdf)*

#### *[Fortnox](https://www.jakobj.se/test/fortnox.pdf)*

## Installera Bolagsanalyser

``` r
devtools::install_github("jakobjohannesson/bolagsanalyser")
# Ladda även ner mitt tidigare paket borsdata
devtools::install_github("jakobjohannesson/borsdata")
```

## Kom igång

För att använda dig av Bolagsanalyser behöver du tre saker: R, Rstudio
och en Börsdata API nyckel. R och Rstudio är helt gratis, däremot kostar
Börsdatas API ca 2500 sek om året. När du har alla dessa kan du köra
igång.

Börja med att starta Rstudio, gå till konsolen (“Console”), kör sedan
“devtools::install\_github(”jakobjohannesson/bolagsanalyser“)”. Om du
inte har devtools så kan du installera det först genom att köra
“install.packages(”devtools“)”. Ett paket som även behövs är mitt
tidigare r-paket
*[{Borsdata}](https://www.github.com/jakobjohannesson/borsdata)*. För
att starta en ny bolagsanalys, gå till “File –&gt; New project –&gt; New
directory –&gt; Bolagsanalys med Bolagsanalyser –&gt; Ange namnet på
bolaget –&gt; Create project”.

Nu är du inne i ett nytt projekt. Du får direkt fem olika filer:
“mall.docx”, “.rmd”, “.Rproj”, “.gitignore”, "\_bookdown.yml" och
“Bolagsanalyser\_logga.png”.

RMD (R Markdown) är den viktigaste, här kommer din bolagsanalys att
skapas. Öppna denna fil med Rstudio och ändra i filen, **lägg in din
Börsdata API nyckel på rad 8.**

**ID:** Ändra även id på rad 7 till det företagets börsdata id som du
vill ha, den är standardaliserad till Evolution med id 750. Det går att
få ut “Börsdata id” värdet från Börsdatas terminal i beskrivningen på
företaget eller använda mitt tidigare paket
*[{Borsdata}](https://www.github.com/jakobjohannesson/borsdata)* och
funktionen “fetch\_instruments”.

I RMD filen kommer du att skriva din bolagsanalys. Det kanske är
konstigt och svårt i början, men systemet är väldigt enkelt när man lär
sig. Testa dig fram och läs om R markdown så kommer du att lära dig
kvickt.

**mall.docx:** Här kan du ändra i stilmallen som används, denna används
som grund för olika stilar på rubriker, texter, headers och footers.
Inget av innehållet i denna mall används.

Bilden “Bolagsanalyser\_logga.png” är loggan som används i outputen till
“mall.docx”, om du vill ha en egen logga så ändra på denna. Filerna
"\_bookdown.yml“,”Rproj" samt “.gitignore” behöver inte ändras.
“logga.png” är loggan för företaget som du analyserar.

## Kontakta mig

Undrar du något kring paketet? Skicka ett mail till mig:
<jakob@jakobj.se>

Senast uppdaterad 2021-03-03.
