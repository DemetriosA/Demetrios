<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xhtml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="demetrios.css"/>
                <title>The fragments of Demetrios of Skepsis</title>
            </head>
            <body>
                
                <!--<div id="banner">  to be added; dimensions could change 
                    <img src="banner.jpg" height="144" width="1264"/>
                </div>-->
                
                <div id="menu">
                    <h3>
                        <ul>
                            <li><a href="...html">Introduction</a></li>
                            <li><a href="...html">Fragments</a></li> <!-- whatever else we choose -->
                            <li><a href="....html">Contents</a></li>
                            <li><a href="....html">Indices</a></li>
                            <li><a href="...html">Maps</a></li>
                        </ul>
                    </h3>
                </div>
                
                <div id="navigation"> <!-- change, improve -->
                    <h4>
                        <a href="{preceding-sibling::text[1]/@id}.html">Previous</a> | 
                        <a href="{following-sibling::text[1]/@id}.html">Next</a>
                    </h4>
                </div>             
                
                <xsl:apply-templates/>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="teiHeader"/> <!-- bibliography still in header, though -->
    
    
    <!-- Text templates -->
    
    <xsl:template match="text/body/div[@type='edition']"> <!-- style in css -->
        <div id="content">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="body/div/head">
        <h3 align="center">
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="ab/seg">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="seg">
        (
        <xsl:value-of select="@n"/>
        )
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="cit"> <!-- style in css -->
        <div id="citation">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="cit/ref">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="floatingText"> <!-- see if/how this works -->
        <div id="content4">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="quote/l">  <!-- indent in css -->
        <br/>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="text/body/div[@type='apparatus']"> <!-- style in css; smaller then 'content', slight indentation? or style completely in css -->
        <div id="apparatus">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="text/body/div[@type='translation']">
        <div id="content2">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="text/body/div[@type='commentary']">
        <div id="content3">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/> 
        </a>
    </xsl:template>
    
    <xsl:template match="geogName[@ref]">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:value-of select="child::node()"/> 
        </a>
    </xsl:template>
    
    <xsl:template match="placeName[@ref]">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
        </a>
    </xsl:template>
    
</xsl:stylesheet>