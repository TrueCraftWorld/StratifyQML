/*
Copyright 2016 Tyler Gilbert

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


import QtQuick 2.15
import StratifyLabs.UI 2.0

Text {
    id: control;

    property alias label: control.text;
    property alias attr: attr;
    property alias style: attr.style;
    property alias span: attr.span;

    SAttributes {
        id: attr;
        fontHorizontalAlignment: Text.AlignLeft;
    }

    font.italic: attr.fontItalic;
    font.family: attr.fontText;
    font.pointSize: attr.fontSize;
    font.weight: attr.fontWeight;
    color: enabled ? attr.fontColor : attr.fontColorMuted;
    verticalAlignment: attr.fontVerticalAlignment;
    horizontalAlignment: attr.fontHorizontalAlignment;
    wrapMode: attr.blockWidth ? Text.Wrap : Text.NoWrap;
}
