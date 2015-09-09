%% 
%% This is file `wrr.bst',
%% generated with the docstrip utility.
%% 
%% The original source files were:
%% 
%% merlin.mbs  (with options: `head,,ay,cay,nm-rev1,note-yr,volp-com,edby-par,blk-com,ppx,ed,ord,lab-it,and-xcom,em-it,{}')
%% geojour.mbs  (with options: `,ay,cay,nm-rev1,note-yr,volp-com,edby-par,blk-com,ppx,ed,ord,lab-it,and-xcom,em-it,{}')
%% merlin.mbs  (with options: `tail,,ay,cay,nm-rev1,note-yr,volp-com,edby-par,blk-com,ppx,ed,ord,lab-it,and-xcom,em-it,{}')
%% ---------------------------------------- 
%% *** wwww *** 
%% 
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{merlin.mbs}[1996/05/29 3.8 (PWD)]
 %
 % NOTICE:
 % This file may be used for non-profit purposes.
 % It may not be distributed in exchange for money,
 %   other than distribution costs.
 %
 % The author provides it `as is' and does not guarantee it in any way.
 %
 % Copyright (C) 1994, 1995, 1996 Patrick W. Daly
 %-------------------------------------------------------------------
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in ENGLISH
 % This is an author-year citation style bibliography. As such, it is
 % non-standard LaTeX, and requires a special package file to function properly.
 % Such a package is    natbib.sty   by Patrick W. Daly
 % or:                  chicago.sty
 % The form of the bibitem entries is
 %   \bibitem[\protect\citeauthoryear{Jones, Baker, and Smith}
 %        {Jones et al.}{1990}{key}...
 %---------------------------------------------------------------------

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  skip$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {non.stop}
{ duplicate$
   "}" * add.period$
   #-1 #1 substring$ "." =
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\it " swap$ * "\/}" * }
  if$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }

 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The language selected here is ENGLISH
FUNCTION {bbl.and}
{ "and"}

FUNCTION {bbl.editors}
{ "eds." }

FUNCTION {bbl.editor}
{ "ed." }

FUNCTION {bbl.edby}
{ "edited by" }

FUNCTION {bbl.edition}
{ "edition" }

FUNCTION {bbl.volume}
{ "volume" }

FUNCTION {bbl.of}
{ "of" }

FUNCTION {bbl.number}
{ "number" }

FUNCTION {bbl.nr}
{ "no." }

FUNCTION {bbl.in}
{ "in" }

FUNCTION {bbl.pages}
{ "" }

FUNCTION {bbl.page}
{ "" }

FUNCTION {bbl.chapter}
{ "chapter" }

FUNCTION {bbl.techrep}
{ "Technical Report" }

FUNCTION {bbl.mthesis}
{ "Master's thesis" }

FUNCTION {bbl.phdthesis}
{ "Ph.D. thesis" }

FUNCTION {bbl.first}
{ "1st" }

FUNCTION {bbl.second}
{ "2nd" }

FUNCTION {bbl.third}
{ "3rd" }

FUNCTION {bbl.fourth}
{ "4th" }

FUNCTION {bbl.fifth}
{ "5th" }

FUNCTION {bbl.st}
{ "st" }

FUNCTION {bbl.nd}
{ "nd" }

FUNCTION {bbl.rd}
{ "rd" }

FUNCTION {bbl.th}
{ "th" }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
  #-2 #1 substring$ "1" =
     { bbl.th * }
     { duplicate$ #-1 #1 substring$
       duplicate$ "1" =
         { pop$ bbl.st * }
         { duplicate$ "2" =
             { pop$ bbl.nd * }
             { "3" =
                 { bbl.rd * }
                 { bbl.th * }
               if$
             }
           if$
          }
       if$
     }
   if$
}

 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{geojour.mbs}[1996/01/02 1.0 (PWD)]
 % Copyright (C) 1994, 1995, 1996 Patrick W. Daly
 %-------------------------------------------------------------------
MACRO {aph} {"Acta Physica"}
MACRO {aisr} {"Advances in Space Research"}
MACRO {amsci} {"American Scientist"}
MACRO {anigeo} {"Annali di Geofisica"}
MACRO {anofd} {"Annals of Fluid Dynamics"}
MACRO {angl} {"Annals of Glaciology"}
MACRO {andmet} {"Annalen der Meteorologie"}
MACRO {andgeo} {"Annales de Geophysique"}
MACRO {andphy} {"Annales de Physique"}
MACRO {appopt} {"Applied Optics"}
%MACRO {afmgb} {"Archiv f\"ur Meteorologie, Geophysik und Bioklimatologie"}
MACRO {atph} {"Atm\'osphera"}
MACRO {aao} {"Atmosphere-Ocean"}
MACRO {atenv} {"Atmospheric Environment"}
MACRO {aujag} {"Australian Journal of Agricultural Research"}
MACRO {aumet} {"Australian Meteorological Magazine"}
MACRO {blmet} {"Boundary-Layer Meteorology"}
MACRO {bams} {"Bulletin of the American Meteorological Society"}
MACRO {cch} {"Climate Change"}
MACRO {cdyn} {"Climate Dynamics"}
MACRO {cbul} {"Climatological Bulletin"}
MACRO {cpam} {"Communications on Pure and Applied Mathematics"}
MACRO {cap} {"Contributions to Atmospheric Physics"}
MACRO {dsr} {"Deep-Sea Research"}
MACRO {dhz} {"Deutsche Hydrographische Zeitschrift"}
MACRO {eco} {"Ecology"}
MACRO {envres} {"Environmental Research"}
MACRO {envst} {"Environmental Science and Technology"}
MACRO {ecms} {"Estuarine and Coastal Marine Science"}
MACRO {geoint} {"Geofisica Internationale"}
MACRO {geopub} {"Geofysiske Publikasjoner"}
MACRO {geogeo} {"Geologiya i Geofizika"}
MACRO {gafd} {"Geophysical and Astrophysical Fluid Dynamics"}
MACRO {gfd} {"Geophysical Fluid Dynamics"}
MACRO {geomag} {"Geophysical Magazine"}
MACRO {georl} {"Geophysical Research Letters"}
MACRO {ga} {"Geophysica"}
MACRO {gs} {"Geophysics"}
MACRO {ieeetap} {"IEEE Transactions on Antennas and Propagation"}
MACRO {irp} {"Infrared Physics"}
MACRO {ijawp} {"International Journal of Air and Water Pollution"}
MACRO {ijrs} {"International Journal of Remote Sensing"}
MACRO {jam} {"Journal of Applied Meteorology"}
MACRO {jap} {"Journal of Applied Physics"}
MACRO {jaot} {"Journal of Atmospheric and Oceanic Technology"}
MACRO {jatp} {"Journal of Atmospheric and Terrestrial Physics"}
MACRO {jce} {"Journal of Climate"}
MACRO {jcam} {"Journal of Climate and Applied Meteorology"}
MACRO {jcm} {"Journal of Climate Meteorology"}
MACRO {jcy} {"journal of Climatology"}
MACRO {jcp} {"Journal of Computational Physics"}
MACRO {jfm} {"Journal of Fluid Mechanics"}
MACRO {jgr} {"Journal of Geophysical Research"}
MACRO {jga} {"Journal of Glaciology"}
MACRO {jh} {"Journal of Hydrology"}
MACRO {jmr} {"Journal of Marine Research"}
MACRO {jmrj} {"Journal of Meteorological Research, Japan"}
MACRO {jm} {"Journal of Meteorology"}
MACRO {jpc} {"Journal of Physical Chemistry"}
MACRO {jpo} {"Journal of Physical Oceanography"}
MACRO {jra} {"Journal de Recherches Atmospheriques"}
MACRO {jsi} {"Journal of Scientific Instruments"}
MACRO {jaes} {"Journal of the Aeronautical Sciences"}
MACRO {japca} {"Journal of the Air Pollution Control Association"}
MACRO {jas} {"Journal of the Atmospheric Sciences"}
MACRO {jmts} {"Journal of the Marine Technology Society"}
MACRO {jmsj} {"Journal of Meteorological Society of Japan"}
MACRO {josj} {"Journal of the Oceanographical Society of Japan"}
MACRO {jwm} {"Journal of Weather Modification"}
MACRO {lao} {"Limnology and Oceanography"}
MACRO {mwl} {"Mariners Weather Log"}
MACRO {mau} {"Mausam"}
MACRO {meteor} {"``Meteor'' Forschungsergebnisse"}
MACRO {metmag} {"Meteorological Magazine"}
MACRO {metmon} {"Meteorological Monographs"}
MACRO {metrun} {"Meteorologische Rundschau"}
MACRO {metzeit} {"Meteorologische Zeitschrift"}
MACRO {metgid} {"Meteorologiya i Gidrologiya"}
MACRO {mwr} {"Monthly Weather Review"}
MACRO {nwd} {"National Weather Digest"}
MACRO {nature} {"Nature"}
MACRO {nzjmfr} {"New Zealand Journal of Marine and Freshwater Research"}
MACRO {npg} {"Nonlinear Processes in Geophysics"}
MACRO {nc} {"Nuovo Cimento"}
MACRO {om} {"Oceanography and Meteorology"}
MACRO {ocac} {"Oceanologica Acta"}
MACRO {oceanus} {"Oceanus"}
MACRO {paleoc} {"Paleoceanography"}
MACRO {pmg} {"Papers in Meteorology and Geophysics"}
MACRO {ppom} {"Papers in Physical Oceanography and Meteorology"}
MACRO {phitrsl} {"Philosophical Transactions of the Royal Society of London"}
MACRO {physrev} {"Physical Review"}
MACRO {physzeit} {"Physikalische Zeitschrift"}
MACRO {pps} {"Planetary and Space Science"}
MACRO {procrsl} {"Proceedings of the Royal Society of London"}
MACRO {pag} {"Pure and Applied Geophysics"}
MACRO {qjrms} {"Quarterly Journal of the Royal Meteorological Society"}
MACRO {quatres} {"Quaternary Research"}
MACRO {rsci} {"Radio Science"}
MACRO {rse} {"Remote Sensing of the Environment"}
MACRO {rsi} {"Review of Scientific Instruments"}
MACRO {rgeo} {"Reviews of Geophysics"}
MACRO {rgsp} {"Reviews of Geophysics and Space Physics"}
MACRO {rdgeo} {"Revista de Geofisica"}
MACRO {revmeta} {"Revista Meteorologica"}
MACRO {science} {"Science"}
MACRO {sciam} {"Scientific American"}
MACRO {ssr} {"Space Science Review"}
MACRO {sam} {"Studies in Applied Mathematics"}
MACRO {tellus} {"Tellus"}
MACRO {tac} {"Theoretical and Applied Climatology"}
MACRO {tagu} {"Transactions, American Geophysical Union (EOS)"}
MACRO {wrr} {"Water Resources Research"}
MACRO {weather} {"Weather"}
MACRO {wafc} {"Weather and Forecasting"}
MACRO {ww} {"Weatherwise"}
MACRO {wmob} {"World Meteorological Organization Bulletin"}
% MACRO {zeitmet} {"Zeitschrift f\"ur Meteorologie"}
 % End of journal definition file

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't := }
        { s nameptr "{vv~}{ll}{, f.}{, jj}" format.name$ 't := }
      if$
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " et~al." * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.names.ed}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}"
      format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " et~al." * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    {
      author format.names
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    {
      editor format.names
      editor num.names$ #1 >
        { ", " * bbl.editors * }
        { ", " * bbl.editor * }
      if$
    }
  if$
}

FUNCTION {format.in.editors}
{ editor empty$
    { "" }
    { editor format.names.ed
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$
    }
  if$
}

FUNCTION {format.full.names}
{'s :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " et~al." * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.key.full}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.key.full}
{ author empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {editor.key.full}
{ editor empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.full
    { type$ "proceedings" =
        'editor.key.full
        'author.key.full
      if$
    }
  if$
  emphasize
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  "\protect\citeauthoryear{" make.full.names * "}{" * write$
  label write$
  "}{" year duplicate$ empty$
    { pop$ "????" }
    'skip$
  if$
  * extra.label * "}]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in
  " " * }

FUNCTION {format.date}
{ year duplicate$ empty$
    { "empty year in " cite$ * "; set to ????" * warning$
       pop$ "????" }
    'skip$
  if$
  extra.label *
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.connect
      series empty$
        'skip$
        { bbl.of space.word * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { bbl.number }
            { bbl.number capitalize }
          if$
          number tie.or.space.connect
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { bbl.in space.word * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bbl.first 't := }
    { s "second" = s "2" = or
        { bbl.second 't := }
        { s "third" = s "3" = or
            { bbl.third 't := }
            { s "fourth" = s "4" = or
                { bbl.fourth 't := }
                { s "fifth" = s "5" = or
                    { bbl.fifth 't := }
                    { s #1 #1 substring$ is.num
                        { s eng.ord 't := }
                        { edition 't := }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  t
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { convert.edition "l" change.case$ " " * bbl.edition * }
        { convert.edition "t" change.case$ " " * bbl.edition * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { bbl.pages pages n.dashify tie.or.space.connect }
        { bbl.page pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    {
      "(" number * ")" * *
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ", " * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { word.in booktitle emphasize * }
        { word.in booktitle emphasize *
          " (" *
          bbl.edby
          capitalize
          * " " *
          format.in.editors *
          ")" *
        }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bbl.techrep }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      word.in
    }
    { bbl.volume volume tie.or.space.connect
      bbl.of space.word *
    }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}

FUNCTION {format.publisher}
{
  publisher "publisher" output.check
  address output
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  crossref missing$
    { journal
      emphasize
      "journal" output.check
      format.vol.num.pages output
      format.date "year" output.check
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      format.publisher
    }
    {
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output
  format.title "title" output.check
  howpublished output
  address output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      format.number.series output
      format.publisher
    }
    {
      format.chapter.pages "chapter and pages" output.check
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      format.publisher
      format.edition output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.pages output
      address output
      organization output
      publisher output
  format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  format.authors output
  author format.key output
  format.btitle "title" output.check
  organization output
  address output
  format.edition output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.btitle "title" output.check
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  format.title output
  howpublished output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.btitle "title" output.check
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address output
  organization output
  publisher output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.title "title" output.check
  note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { bbl.and
              space.word * s #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.label
        'author.key.label
      if$
    }
  if$
  emphasize
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  ", "
  *
  year duplicate$ empty$
     { pop$ "????" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {calc.short.label}
{ calc.short.authors short.list
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}"
      format.name$ 't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "aaaaa" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.sort}
{ editor empty$
    { key empty$
        { "to sort, need editor or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.sort
        'author.sort
      if$
    }
  if$
  #1 entry.max$ substring$
  'sort.label :=
  sort.label
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { last.label next.extra }

INTEGERS { last.extra.num number.label }

FUNCTION {initialize.extra.label.stuff}
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{" swap$ * "}" * }
  if$
  'extra.label :=
}

EXECUTE {initialize.extra.label.stuff}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
  calc.short.label
}

ITERATE {bib.sort.order}

SORT

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
%% End of customized bst file 
%% 
%% End of file `wrr.bst'.
