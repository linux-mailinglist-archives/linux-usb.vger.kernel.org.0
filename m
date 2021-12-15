Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69D64761AA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Dec 2021 20:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344222AbhLOTZL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Dec 2021 14:25:11 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:41483 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235593AbhLOTZK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Dec 2021 14:25:10 -0500
Received: by mail-oi1-f176.google.com with SMTP id u74so33039578oie.8;
        Wed, 15 Dec 2021 11:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=32zLJ3TNqnOwO6y7fg065qNudmynfCS6OIzueys5qVo=;
        b=K+fjHNoLeM37FG5ZZ57cKhJ6GuHIyMO2HWLCdwYG/4PBg+XoavaJHiuy1CnUfHFc+2
         xhfkgv4kVuSZYAACMQfvDxsd/2RNCxmHiuu86NzsspaBHYNpyGS4YNT6XqRfxUE+8FEN
         owt+WNX3fxzY85UbORKQVdH0T/sP7mAtrz4mutALaN8axb81gGHT/SEb8xKVcbROYzpk
         GfroTCnBCPlqiv6i4mzep7qn6jDCKeIFLXLn+oHwzbgHyTav/FG+CvFNowVjT0djSJ4y
         QADBh4X7cjlBOi3AP1QaBqkjL0Ei6gKLtqXR761J/IcWB/6AWJvBaaGBJae+LAcGpy82
         Hozw==
X-Gm-Message-State: AOAM530Rivg0Yee0DU4IKoYVrgRGTjY7/iHJfMqHX5FaBq1Spct93KHK
        v4rsumVlcXMAHJ2J/W4HRg==
X-Google-Smtp-Source: ABdhPJw1OAX3rdDybRGvx0K0wpJQOTArn94PLs/bIt3zY9UZ9MGAd7oUUHwI8C6ktnchAwMjgc1/JQ==
X-Received: by 2002:aca:6c5:: with SMTP id 188mr1210175oig.117.1639596309812;
        Wed, 15 Dec 2021 11:25:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 109sm615981otv.30.2021.12.15.11.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:25:09 -0800 (PST)
Received: (nullmailer pid 1686342 invoked by uid 1000);
        Wed, 15 Dec 2021 19:25:08 -0000
Date:   Wed, 15 Dec 2021 13:25:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: usb: chipidea: Convert to json-schema
Message-ID: <YbpBFKeuSK4v7Fdz@robh.at.kernel.org>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209165339.614498-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 09, 2021 at 05:53:36PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the ChipIdea USB2 bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/usb/chipidea,usb2.yaml           | 310 ++++++++++++++++++
>  .../devicetree/bindings/usb/ci-hdrc-usb2.txt  | 158 ---------
>  2 files changed, 310 insertions(+), 158 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
> new file mode 100644
> index 000000000000..0e36259f23ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
> @@ -0,0 +1,310 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/chipidea,usb2.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: USB2 ChipIdea USB controller for ci13xxx
> +
> +maintainers:
> +  - Peter Chen <peter.chen@freescale.com>

This should have a reference to usb-drd.yaml I think.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx23-usb
> +          - fsl,imx27-usb
> +          - fsl,imx28-usb
> +          - fsl,imx6q-usb
> +          - fsl,imx6sl-usb
> +          - fsl,imx6sx-usb
> +          - fsl,imx6ul-usb
> +          - fsl,imx7d-usb
> +          - fsl,imx7ulp-usb
> +          - lsi,zevio-usb
> +          - qcom,ci-hdrc
> +          - chipidea,usb2
> +          - xlnx,zynq-usb-2.20a
> +          - nvidia,tegra20-udc
> +          - nvidia,tegra30-udc
> +          - nvidia,tegra114-udc
> +          - nvidia,tegra124-udc
> +      - items:
> +          - const: fsl,imx6q-usb
> +          - const: fsl,imx27-usb
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phy_type:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The type of the PHY connected to the core. Without this property the PORTSC
> +      register won't be touched.
> +    enum:
> +      - utmi
> +      - utmi_wide
> +      - ulpi
> +      - serial
> +      - hsic
> +
> +  dr_mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: dual-role mode of the interface
> +    enum:
> +      - host
> +      - peripheral
> +      - otg
> +    default:
> +      const: otg
> +
> +  clocks:
> +    items:
> +      - description: reference to the USB clock

From the report, i.MX needs 3 clocks.

> +
> +  resets:
> +    items:
> +      - description: reference to the USB reset
> +
> +  reset-names:
> +    items:
> +      - const: usb
> +
> +  phys:
> +    items:
> +      - description: reference to the USB PHY
> +
> +  phy-names:
> +    items:
> +      - const: usb-phy
> +
> +  vbus-supply:
> +    description: reference to the VBUS regulator
> +
> +  maximum-speed:
> +    description: limit the maximum connection speed to "full-speed".
> +
> +  tpl-support:
> +    description: TPL (Targeted Peripheral List) feature for targeted hosts
> +
> +  itc-setting:
> +    description: Interrupt threshold control register control, the setting should be aligned with
> +      ITC bits at register USBCMD.
> +
> +  ahb-burst-config:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: This vendor-dependent property is used to change the AHB burst configuration and
> +      should be aligned with AHBBRST at SBUSCFG. See the ChipIdea specification for the details on
> +      each of those values. If this property does not exist, the reset value will be used.
> +    minimum: 0
> +    maximum: 7
> +
> +  tx-burst-size-dword:
> +    description: This vendor-dependent property is used to configure the TX burst size (in 32-bit
> +      words). The value represents the maximum length of a burst while moving data from system
> +      memory to the USB bus. This property takes effect only if the "ahb-burst-config" property is
> +      set to 0. If this property is missing the reset default of the hardware implementation will
> +      be used.
> +
> +  rx-burst-size-dword:
> +    description: This vendor-dependent property is used to configure the RX burst size (in 32-bit
> +      words). This value represents the maximum length of a burst while moving data from the USB
> +      bus to system memory. This property takes effect only if the "ahb-burst-config" property is
> +      set to 0. If this property is missing the reset default of the hardware implementation will
> +      be used.
> +
> +  extcon:
> +    description: A list of phandles to external connector devices. The first phandle should point
> +      to the external connector which provides "USB" cable events. The second should point to the
> +      external connector device that provide "USB-HOST" cable events. If one of the external
> +      connector devices is not required, an empty phandle (0) should be specified.
> +
> +  phy-clkgate-delay-us:
> +    description: The delay time (in microseconds) between putting the PHY into low power mode and
> +      gating the PHY clock.
> +
> +  non-zero-ttctrl-ttha:
> +    description: |
> +      After setting this property, the value of register ttctrl.ttha will be 0x7f; if not, the
> +      value will be 0x0 (the default). The value for this property needs to be chosen very
> +      carefully after consulting with your IC engineer.
> +
> +      On most ChipIdea platforms, the "usage_tt" flag at RTL is 0, so this property only affects
> +      siTD.
> +
> +      If this property is not set, the maximum packet size is 1023 bytes, and if the total packet
> +      size for previous transactions is more than 256 bytes, no further transactions can be
> +      accepted within the frame. The use case is single transaction, but higher frame rate.
> +
> +      If this property is set, the maximum packet size is limited to 188 bytes and more
> +      transactions than in the above case can be handled. Transactions will be accepted as long as
> +      188 bytes or more of space are left within a frame. Software needs to make sure it does not
> +      send more than 90% maximum_periodic_data_per_frame. The use case is higher amount of
> +      transactions at the cost of a lower frame rate.
> +
> +  mux-controls:
> +    description: The mux control for toggling host/device output of this controller. It's expected
> +      that a mux state of 0 indicates device mode and a mux state of 1 indicates host mode.
> +
> +  mux-control-names:
> +    const: usb_switch
> +
> +  pinctrl-names:
> +    description: In case of HSIC-mode, "idle" and "active" pin modes are mandatory. In this case,
> +      the "idle" state needs to pull down the data and strobe pin and the "active" state needs to
> +      pull up the strobe pin.
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum:
> +        - default
> +        - host
> +        - device
> +        - idle # mandatory for HSIC
> +        - active # mandatory for HSIC
> +
> +  # i.MX specific properties
> +  fsl,usbmisc:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: phandle to non-core register device, with one argument that indicate USB
> +      controller index.
> +
> +  disable-over-current:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: disable over current detect
> +
> +  over-current-active-low:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Over-current signal polarity is active low. It's recommended to specify the
> +      over-current polarity.
> +
> +  over-current-active-high:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Over-current signal polarity is active high. It's recommended to specify the
> +      over-current polarity.
> +
> +  power-active-high:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: power signal polarity is active high
> +
> +  external-vbus-divider:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: enables off-chip resistor divider for Vbus
> +
> +  samsung,picophy-pre-emp-curr-control:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: HS Transmitter Pre-Emphasis Current Control. This signal controls the amount of
> +      current sourced to the USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition.
> +      Refer to the TXPREEMPAMPTUNE0 bits of register USBNC_n_PHY_CFG1 in the documentation for
> +      more details.
> +    minimum: 0
> +    maximum: 3
> +    default: 1
> +
> +  samsung,picophy-dc-vol-level-adjust:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: HS DC Voltage Level Adjustment. Adjust the high-speed transmitter DC level
> +      voltage. Refer to the TXVREFTUNE0 bits of register USBNC_n_PHY_CFG1 in the documentation for
> +      more details.
> +    minimum: 0
> +    maximum: 0xf
> +    default: 3
> +
> +  # NVIDIA Tegra specific properties
> +  nvidia,needs-double-reset:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Specifies a workaround for the USB1 port that needs to be reset twice internally
> +      some Tegra devices.
> +
> +  # deprecated properties
> +  usb-phy:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle for the PHY device. Use "phys" instead.
> +    deprecated: true
> +
> +  fsl,usbphy:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of usb phy that connects to the port. Use "phys" instead.
> +    deprecated: true
> +
> +  nvidia,phy:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle for the PHY device. Use "phys" instead.
> +    deprecated: true
> +

> +  # USB bus
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

Covered by common schema (I think).

> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true
> +
> +additionalProperties:
> +  $ref: usb-device.yaml

This is wrong as usb.device.yaml applies to child nodes.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +dependencies:
> +  mux-control-names: [ mux-controls ]
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/berlin2.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@f7ed0000 {
> +      compatible = "chipidea,usb2";
> +      reg = <0xf7ed0000 0x10000>;
> +      interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&chip CLKID_USB0>;
> +      phys = <&usb_phy0>;
> +      phy-names = "usb-phy";
> +      vbus-supply = <&reg_usb0_vbus>;
> +      itc-setting = <0x4>; /* 4 micro-frames */
> +      /* Incremental burst of unspecified length */
> +      ahb-burst-config = <0x0>;
> +      tx-burst-size-dword = <0x10>; /* 64 bytes */
> +      rx-burst-size-dword = <0x10>;
> +      extcon = <0>, <&usb_id>;
> +      phy-clkgate-delay-us = <400>;
> +      mux-controls = <&usb_switch>;
> +      mux-control-names = "usb_switch";
> +    };
> +
> +  # HSIC
> +  - |
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@2184400 {
> +      compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
> +      reg = <0x02184400 0x200>;
> +      interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&clks IMX6QDL_CLK_USBOH3>;
> +      fsl,usbphy = <&usbphynop1>;
> +      fsl,usbmisc = <&usbmisc 2>;
> +      phy_type = "hsic";
> +      dr_mode = "host";
> +      ahb-burst-config = <0x0>;
> +      tx-burst-size-dword = <0x10>;
> +      rx-burst-size-dword = <0x10>;
> +      pinctrl-names = "idle", "active";
> +      pinctrl-0 = <&pinctrl_usbh2_idle>;
> +      pinctrl-1 = <&pinctrl_usbh2_active>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      usbnet: smsc@1 {
> +        compatible = "usb424,9730";
> +        reg = <1>;
> +      };
> +    };
