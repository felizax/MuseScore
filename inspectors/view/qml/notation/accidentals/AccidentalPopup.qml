import QtQuick 2.9
import QtQuick.Controls 2.2
import MuseScore.Inspectors 3.3
import "../../common"

StyledPopup {
    id: root

    property QtObject model: null

    implicitHeight: contentColumn.implicitHeight + topPadding + bottomPadding
    width: parent.width

    Column {
        id: contentColumn

        width: parent.width

        spacing: 12

        StyledTextLabel {
            text: qsTr("Bracket type")
        }

        RadioButtonGroup {
            id: radioButtonList

            height: 30
            width: parent.width

            model: [
                { textRole: qsTr("None"), valueRole: AccidentalTypes.BRACKET_TYPE_NONE },
                { textRole: qsTr("Parenthesis"), valueRole: AccidentalTypes.BRACKET_TYPE_PARENTHESIS },
                { textRole: qsTr("Bracket"), valueRole: AccidentalTypes.BRACKET_TYPE_SQUARE },
            ]

            delegate: FlatRadioButton {
                id: radioButtonDelegate

                ButtonGroup.group: radioButtonList.radioButtonGroup

                checked: root.model && !root.model.bracketType.isUndefined ? root.model.bracketType.value === modelData["valueRole"]
                                                                           : false
                onToggled: {
                    root.model.bracketType.value = modelData["valueRole"]
                }

                StyledTextLabel {
                    text: modelData["textRole"]

                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}