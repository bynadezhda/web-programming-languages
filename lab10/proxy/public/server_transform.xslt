<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <xsl:template match="/">
 

    <table cellpadding="10">

      <thead>

        <tr>

          <th>#</th>
          <th>Sequence</th>

        </tr>

      </thead>


      <xsl:for-each select="objects/object">


        <xsl:variable name="counter" select="position()"/>

        <tbody>

          <tr>

            <th>
              <xsl:value-of select="$counter"></xsl:value-of>
            </th>

            <th>
              <xsl:value-of select="num"></xsl:value-of>
            </th>
         
          </tr>

        </tbody>

      </xsl:for-each>

    </table>

  </xsl:template>

</xsl:stylesheet>