import StratifyLabs.UI 2.0

SRow {
  SButton {
    span: 3;
    iconString: Fa.Icon.inbox;
    label: "Label";
  }
  /*
      SButton accepts both 'text' and 'label' for
      the text value of the button.
    */

  SButton {
    span: 3;
    iconString: Fa.Icon.map_pin;
    text: "Text";
  }

  SButton {
    span: 3;
    iconString: Fa.Icon.level_up;
  }

  SBadge {
    span: 3;
    iconString: Fa.Icon.life_buoy;
  }
}
