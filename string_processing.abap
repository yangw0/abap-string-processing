CLASS zcl_string_processing_ DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_string_processing_ IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  
  DATA: carrier_id    TYPE string VALUE 'AA',
          connection_id TYPE string VALUE '0017',
          flight_date   TYPE d      VALUE '20260322',
          airport_from  TYPE string VALUE 'JFK',
          airport_to    TYPE string VALUE 'LAX',
          txt           TYPE string,
          result        TYPE i,
          text          TYPE string VALUE `  ABAP String Processing  `.

*--------------------------------------------------------------------
* Example 1: Using Text Symbols with Placeholders
*--------------------------------------------------------------------

    txt = 'Flight &carrid& &connid& on &date& from &from& to &to&'(001).

    txt = replace( val = txt sub = '&carrid&' with = carrier_id ).
    txt = replace( val = txt sub = '&connid&' with = connection_id ).
    txt = replace( val = txt sub = '&date&'   with = |{ flight_date DATE = USER }| ).
    txt = replace( val = txt sub = '&from&'   with = airport_from ).
    txt = replace( val = txt sub = '&to&'     with = airport_to ).

    out->write( txt ).

*--------------------------------------------------------------------
* Example 2: Using Text Symbols in Output
*--------------------------------------------------------------------

    out->write( |{ 'Carrier:'(002) } { carrier_id } | ).
    out->write( |{ 'Connection:'(003) } { connection_id } | ).

*--------------------------------------------------------------------
* Example 3: String Functions
*--------------------------------------------------------------------

    out->write( |Original Text: { text }| ).
    out->write( |Uppercase: { to_upper( text ) }| ).
    out->write( |Lowercase: { to_lower( text ) }| ).
    out->write( |Length (strlen): { strlen( text ) }| ).
    out->write( |Length (numofchar): { numofchar( text ) }| ).

*--------------------------------------------------------------------
* Example 4: FIND and COUNT
*--------------------------------------------------------------------

    result = find( val = text sub = 'A' case = abap_false ).
    out->write( |First occurrence of 'A': { result }| ).

    result = count( val = text sub = 'A' case = abap_false ).
    out->write( |Total occurrences of 'A': { result }| ).

*--------------------------------------------------------------------
* Example 5: Substring
*--------------------------------------------------------------------

    out->write( |Substring (offset 2, length 6): { substring( val = text off = 2 len = 6 ) }| ).

*--------------------------------------------------------------------
* Example 6: Reverse + Condense
*--------------------------------------------------------------------

    out->write( |Reversed: { reverse( text ) }| ).
    out->write( |Condensed: { condense( text ) }| ).

*--------------------------------------------------------------------
* Example 7: Regex Example (PCRE)
*--------------------------------------------------------------------

    IF contains( val = text pcre = 'ABAP' ).
      out->write( 'Regex Match Found: ABAP exists in text' ).
    ELSE.
      out->write( 'Regex Match Not Found' ).
    ENDIF.
  
  ENDMETHOD.
  
ENDCLASS.