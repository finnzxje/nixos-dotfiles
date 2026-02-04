{
  services.kanata = {
    enable = true;
    keyboards.internalKeyboard = {
      devices = [
        "/dev/input/by-id/usb-ITE_Tech._Inc._ITE_Device_8176_-event-kbd"
      ];
      extraDefCfg = "process-unmapped-keys yes";
      config = ''

        (defsrc
          caps ;
        )

        (defvar
          tap-time 100
          hold-time 150
        )

        (defalias
          ;; CapsLock: tap for Escape, hold for Left Meta (Super)
          caps (tap-hold $tap-time $hold-time esc lmet)

          ;; Semicolon: tap for ';', hold for Right Meta
          ; (tap-hold $tap-time $hold-time ; rmet)
        )

        (deflayer base
          @caps @;
        )      '';
    };
  };
}
