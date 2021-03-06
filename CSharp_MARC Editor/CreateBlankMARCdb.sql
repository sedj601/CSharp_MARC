/**
 * Editor for MARC records
 *
 * This project is built upon the CSharp_MARC project of the same name available
 * at http://csharpmarc.net, which itself is based on the File_MARC package
 * (http://pear.php.net/package/File_MARC) by Dan Scott, which was based on PHP
 * MARC package, originally called "php-marc", that is part of the Emilda
 * Project (http://www.emilda.org). Both projects were released under the LGPL
 * which allowed me to port the project to C# for use with the .NET Framework.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @author    Matt Schraeder <mschraeder@csharpmarc.net>
 * @copyright 2016 Matt Schraeder
 * @license   http://www.gnu.org/licenses/gpl-3.0.html  GPL License 3
 */
 
CREATE TABLE [Fields](
    [FieldID] integer PRIMARY KEY ASC AUTOINCREMENT NOT NULL, 
    [RecordID] nvarchar(2147483647) NOT NULL, 
    [TagNumber] nvarchar(2147483647) NOT NULL, 
    [Ind1] char, 
    [Ind2] char, 
    [ControlData] nvarchar(2147483647), 
    FOREIGN KEY([RecordID]) REFERENCES Records([RecordID]) ON DELETE CASCADE ON UPDATE RESTRICT);

CREATE TABLE [Records](
    [RecordID] integer PRIMARY KEY ASC AUTOINCREMENT NOT NULL, 
    [DateAdded] datetime NOT NULL, 
    [DateChanged] datetime, 
    [Author] nvarchar(2147483647), 
    [Title] nvarchar(2147483647), 
    [CopyrightDate] integer, 
    [Barcode] nvarchar(2147483647), 
    [Classification] nvarchar(2147483647), 
    [MainEntry] nvarchar(2147483647));

CREATE TABLE [Settings](
    [RecordListAtTop] bool, 
    [ClearDatabaseOnExit] bool, 
    [CustomTag1] nvarchar(3), 
    [CustomCode1] nvarchar(1), 
    [CustomData1] nvarchar(2147483647), 
    [CustomTag2] nvarchar(3), 
    [CustomCode2] nvarchar(1), 
    [CustomData2] nvarchar(2147483647), 
    [CustomTag3] nvarchar(3), 
    [CustomCode3] nvarchar(1), 
    [CustomData3] nvarchar(2147483647), 
    [CustomTag4] nvarchar(3), 
    [CustomCode4] nvarchar(1), 
    [CustomData4] nvarchar(2147483647), 
    [CustomTag5] nvarchar(3), 
    [CustomCode5] varchar(1), 
    [CustomData5] nvarchar(2147483647));

CREATE TABLE [Subfields](
    [SubfieldID] integer PRIMARY KEY ASC AUTOINCREMENT NOT NULL, 
    [FieldID] bigint NOT NULL, 
    [Code] char NOT NULL, 
    [Data] nvarchar(2147483647) NOT NULL, 
    FOREIGN KEY([FieldID]) REFERENCES Fields([FieldID]) ON DELETE CASCADE ON UPDATE RESTRICT);

CREATE INDEX [FieldID]
ON [Subfields](
    [FieldID] ASC);

CREATE INDEX [RecordID]
ON [Fields](
    [RecordID] ASC);