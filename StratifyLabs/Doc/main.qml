import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import StratifyLabs.UI 2.0


ApplicationWindow {
  id: window;
  visible: true;
  minimumWidth: 400;
  minimumHeight: 640;
  title: "SL.UI";

  property string version: "SL.UI 1.0 based on StratifyLabs.UI 2.0"

  width: 400;
  height: 600;

  property bool doPush: false;

  property alias screen: animationContainer.screen;

  onScreenChanged: {
    doPush = true;
    var n = animationContainer.next();
    var p = animationContainer.previous();
    if( (n !== undefined) && (n !== animationContainer.screen) ){
      nextScreen.text = n;
      nextGroup.visible = true;
    } else {
      nextGroup.visible = false;
    }

    if( (p !== undefined) && (p !== animationContainer.screen) ){
      previousScreen.text = p;
      previousGroup.visible = true;
    } else {
      previousGroup.visible = false;
    }
  }

  SDrawer {
    id: drawer
    width: 250;
    height: parent.height;

    function shut(item){
      drawer.close();
    }

    function setActiveItem(name){
      for(var i = 0; i < menuItems.children.length; i++){
        if( menuItems.children[i].active !== undefined ){
          if( menuItems.children[i].label === name ){
            menuItems.children[i].active = true;
          } else {
            menuItems.children[i].active = false;
          }
        }
      }

    }

    style: "info";

    property string menuStyle: "left btn-naked text-on-info";
    SContainer {
      style: "fill";
      attr.paddingHorizontal: 0;
      SPane {
        style: "block";
        SColumn {
          id: menuItems;
          EDrawerHeading { label: "Menu"; }
          SHLine{ attr.paddingVertical: 0; }
          EDrawerHeading { label: "Getting Started"; iconString: Fa.Icon.smile_o; }
          EDrawerItem { label: "Introduction"; }
          EDrawerItem { label: "Theme"; }
          EDrawerItem { label: "Attributes"; }
          EDrawerItem { label: "FontAwesome"; }
          SHLine{ attr.paddingVertical: 0; }
          EDrawerHeading { label: "Layouts"; iconString: Fa.Icon.object_group; }
          EDrawerItem { label: "Animators"; }
          EDrawerItem { label: "Columns"; }
          EDrawerItem { label: "Containers"; }
          EDrawerItem { label: "Rows"; }
          SHLine{ attr.paddingVertical: 0; }
          EDrawerHeading { label: "Indicators"; iconString: Fa.Icon.star; }
          EDrawerItem { label: "Alerts"; }
          EDrawerItem { label: "Badges"; }
          EDrawerItem { label: "Icons"; }
          EDrawerItem { label: "Labels"; }
          EDrawerItem { label: "Panels"; }
          EDrawerItem { label: "ProgressBars"; }
          EDrawerItem { label: "ProgressCircles"; }
          EDrawerItem { label: "Texts"; }
          EDrawerItem { label: "ToolTips"; }
          EDrawerItem { label: "Wells"; }
          SHLine{ attr.paddingVertical: 0; }
          EDrawerHeading { label: "Input"; iconString: Fa.Icon.pencil; }
          EDrawerItem { label: "Buttons"; }
          EDrawerItem { label: "CheckBoxes"; }
          EDrawerItem { label: "Dropdowns"; }
          EDrawerItem { label: "Inputs"; }
          EDrawerItem { label: "RadioButtons"; }
          EDrawerItem { label: "Sliders"; }
          EDrawerItem { label: "TextBoxes"; }
          SHLine{ attr.paddingVertical: 0; }
          EDrawerHeading { label: "Models"; iconString: Fa.Icon.database; }
          EDrawerItem { label: "JsonModels"; }
          EDrawerItem { label: "Lists"; }
          EDrawerItem { label: "Tables"; }
        }
      }
    }
  }


  SModal {
    id: aboutModal;
    title: "StratifyLabs UI";
    standardButtons: 0;
    SColumn {
      SLabel {
        style: "left padding-zero";
        text: "Version";
      }

      SText {
        style: "block";
        text: version;
      }

      SLabel {
        style: "left padding-zero";
        text: "About";
      }

      SText {
        style: "block";
        text: "StratifyLabs UI 2.0 is a QML framework that works, looks, and feels much like the twitter bootstrap HTML framework";
      }

      SButton {
        style: "btn-outline-info";
        iconString: Fa.Icon.github;
        text: "Fork on Github";
        onClicked: Qt.openUrlExternally("https://github.com/StratifyLabs/StratifyQML");
      }
    }
  }


  SColumn {
    style: "block fill";
    attr.paddingVertical: 0;
    SContainer {
      color: STheme.brand_primary;
      z:1;
      SRow {
        SButton {
          span: 1;
          style: "left btn-naked text-on-primary";
          iconString: Fa.Icon.bars;
          onClicked: drawer.open();
        }

        SLabel {
          style: "text-on-primary";
          span: 1;
          text: animationContainer.screen;
        }
        SButton {
          span: 1;
          style: "right btn-naked text-on-primary";
          iconString: Fa.Icon.info_circle;
          onClicked: aboutModal.open();
        }
      }

    }

    SAnimator {
      id: animationContainer;
      style: "block fill";

      onScreenChanged: {
        drawer.setActiveItem(screen);
      }

      Component.onCompleted: {
        showScreen(current);
      }

      resources: [
        Introduction {},
        Theme {},
        Attributes {},
        FontAwesome {},

        Animators {},
        Columns {},
        Containers {},
        Rows {},

        Alerts {},
        Badges {},
        Icons {},
        Labels {},
        Panels {},
        ProgressBars{},
        ProgressCircles{},
        Texts{},
        ToolTips{},
        Wells{},

        Buttons {},
        CheckBoxes {},
        Dropdowns {},
        Inputs {},
        RadioButtons {},
        Sliders {},
        TextBoxes {},

        JsonModels{},
        Lists{},
        Tables{}
      ]
    }

    SContainer {
      style: "padding-zero";
      // anchors.bottom: parent.bottom;
      // Layouts.a
      Rectangle {
        anchors.fill: parent;
        color: STheme.gray_dark;
        opacity: 0.80;
      }
      SContainer {
        style: "condensed";
        SRow {
          SGroup {
            id: previousGroup;
            style: "left text-on-primary";
            span: 2;
            SButton {
              id: previousButton;
              style: "left btn-naked text-on-primary lg";
              iconString: Fa.Icon.chevron_left;
              onClicked: screen = animationContainer.previous();
            }
            SText {
              visible: !STheme.isScreenSm;
              style: "text-on-primary";
              anchors.verticalCenter: previousButton.verticalCenter;
              id: previousScreen;
            }
          }
          SGroup {
            id: nextGroup;
            style: "right text-on-primary";
            span: 2;
            SText {
              visible: !STheme.isScreenSm;
              style: "text-on-primary";
              anchors.verticalCenter: nextButton.verticalCenter;
              id: nextScreen;
            }
            SButton {
              id: nextButton;
              style: "right btn-naked text-on-primary lg";
              iconString: Fa.Icon.chevron_right;
              onClicked: screen = animationContainer.next();
            }
          }
        }
      }
    }
  }

  onWidthChanged: {
    STheme.updateScreenSize(width);
  }

  Component.onCompleted: {
    STheme.brand_primary = "#244E99";
    STheme.brand_secondary = "#383838";
    screen = "Introduction";
    STheme.updateScreenSize(width);
  }

}
