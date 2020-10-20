Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7546028CE72
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 14:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbgJMMgd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 08:36:33 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37968 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbgJMMg3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 08:36:29 -0400
Received: by mail-ot1-f65.google.com with SMTP id i12so18891297ota.5;
        Tue, 13 Oct 2020 05:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0I2nUhKAUkN0gDoj7V+EmIRDGVHGTcY/dusxiBAUN3o=;
        b=nhAs1y45mbuXOebxOzwHCYnO6n1i/E20h+y5VO3uaOVZ/PjcKKg5ZnaLOWtdyeC2/1
         hELNAk/jrUAW+w4tYRBltF4VyBHHxoH037Y2iPU5iYPm+jt+rxIMZnTPmteq4RqROlre
         hBHRCGuksR3+YjB4RviISLv2wcNl/58/D1aKqu9NmNCgO4Phm1YIpIcXsWX0gC/JAIYB
         ojwsmm0AoGN1PSfvBX+LYqJMgmXtGOEEQEMUDbDy8FBLsPQJwvZ2ymFRp4KG43Y6txam
         XcnS0l3icdrjqujegNfu201yhrdyHvHT/LqJ/bEdHyFMr484GuobgEmjPaWHC46V+ehj
         ID4A==
X-Gm-Message-State: AOAM5326x7YdR4kDGAivZN8xlF9/2fpZPj5nEWpXQE+2sZs/D0KchfUE
        BKBmvKkFG1Kq1BuLIhoZBd/Qeyz38PJ7
X-Google-Smtp-Source: ABdhPJzCZ2J1Czm/HqseIyTZmavaQRMQbnd8KSnXrwdDF7l//K82KmJP6NcEfPOGbdWf0gTzDJrPIg==
X-Received: by 2002:a9d:44e:: with SMTP id 72mr20600563otc.88.1602592586920;
        Tue, 13 Oct 2020 05:36:26 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm11329506ooy.36.2020.10.13.05.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 05:36:26 -0700 (PDT)
Received: (nullmailer pid 3304365 invoked by uid 1000);
        Tue, 13 Oct 2020 12:36:24 -0000
Date:   Tue, 13 Oct 2020 07:36:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/18] dt-bindings: usb: Convert DWC USB3 bindings to DT
 schema
Message-ID: <20201013123624.GC3269269@bogus>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201010224121.12672-11-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 11, 2020 at 01:41:13AM +0300, Serge Semin wrote:
> DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> Controller schema, but with additional vendor-specific properties, the
> controller-specific reference clocks and PHYs. So let's convert the
> currently available legacy text-based DWC USB3 bindings to the DT schema
> and make sure the DWC USB3 nodes are also validated against the
> usb-xhci.yaml schema.
> 
> Note we have to discard the nodename restriction of being prefixed with
> "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> are supposed to be named as "^usb(@.*)".
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Alas applying the usb-hcd.yaml schema on the DWC USB3 nodes will cause
> dtbs_check failures since a lot of "snps,dwc3"-compatible DT nodes are
> named with prefixes like "^dwc3@", "^usb[0-9]@" and even "^dwusb@", while
> usb-hcd.yaml permits the "^usb@" prefix only. As I see it the better but
> more painful solution would be to fix the corresponding DTS files (it's
> some of the Qualcomm, HiSilicon, Exynos, Allwinner, Omap, Stih, APM and
> Freescale DTS'es) so the DWC USB3 DT nodes would comply with the generic
> USB HCD node naming schema. Alternatively we could either extend the
> naming space in the usb-hcd.yaml or extract the generic properties to a
> dedicated DT schema file. What do you think?

IMO, we should fix the node names.

> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 295 ++++++++++++++++++
>  2 files changed, 295 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> deleted file mode 100644
> index d03edf9d3935..000000000000
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -synopsys DWC3 CORE
> -
> -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> -      as described in 'usb/generic.txt'
> -
> -Required properties:
> - - compatible: must be "snps,dwc3"
> - - reg : Address and length of the register set for the device
> - - interrupts: Interrupts used by the dwc3 controller.
> - - clock-names: list of clock names. Ideally should be "ref",
> -                "bus_early", "suspend" but may be less or more.
> - - clocks: list of phandle and clock specifier pairs corresponding to
> -           entries in the clock-names property.
> -
> -Exception for clocks:
> -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> -  one of the following:
> -    "cavium,octeon-7130-usb-uctl"
> -    "qcom,dwc3"
> -    "samsung,exynos5250-dwusb3"
> -    "samsung,exynos5433-dwusb3"
> -    "samsung,exynos7-dwusb3"
> -    "sprd,sc9860-dwc3"
> -    "st,stih407-dwc3"
> -    "ti,am437x-dwc3"
> -    "ti,dwc3"
> -    "ti,keystone-dwc3"
> -    "rockchip,rk3399-dwc3"
> -    "xlnx,zynqmp-dwc3"
> -
> -Optional properties:
> - - usb-phy : array of phandle for the PHY device.  The first element
> -   in the array is expected to be a handle to the USB2/HS PHY and
> -   the second element is expected to be a handle to the USB3/SS PHY
> - - phys: from the *Generic PHY* bindings
> - - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
> -	or "usb3-phy".
> - - resets: set of phandle and reset specifier pairs
> - - snps,usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
> - - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
> - - snps,dis-start-transfer-quirk: when set, disable isoc START TRANSFER command
> -			failure SW work-around for DWC_usb31 version 1.70a-ea06
> -			and prior.
> - - snps,disable_scramble_quirk: true when SW should disable data scrambling.
> -	Only really useful for FPGA builds.
> - - snps,has-lpm-erratum: true when DWC3 was configured with LPM Erratum enabled
> - - snps,lpm-nyet-threshold: LPM NYET threshold
> - - snps,u2exit_lfps_quirk: set if we want to enable u2exit lfps quirk
> - - snps,u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> - - snps,req_p1p2p3_quirk: when set, the core will always request for
> -			P1/P2/P3 transition sequence.
> - - snps,del_p1p2p3_quirk: when set core will delay P1/P2/P3 until a certain
> -			amount of 8B10B errors occur.
> - - snps,del_phy_power_chg_quirk: when set core will delay PHY power change
> -			from P0 to P1/P2/P3.
> - - snps,lfps_filter_quirk: when set core will filter LFPS reception.
> - - snps,rx_detect_poll_quirk: when set core will disable a 400us delay to start
> -			Polling LFPS after RX.Detect.
> - - snps,tx_de_emphasis_quirk: when set core will set Tx de-emphasis value.
> - - snps,tx_de_emphasis: the value driven to the PHY is controlled by the
> -			LTSSM during USB3 Compliance mode.
> - - snps,dis_u3_susphy_quirk: when set core will disable USB3 suspend phy.
> - - snps,dis_u2_susphy_quirk: when set core will disable USB2 suspend phy.
> - - snps,dis_enblslpm_quirk: when set clears the enblslpm in GUSB2PHYCFG,
> -			disabling the suspend signal to the PHY.
> - - snps,dis-u1-entry-quirk: set if link entering into U1 needs to be disabled.
> - - snps,dis-u2-entry-quirk: set if link entering into U2 needs to be disabled.
> - - snps,dis_rxdet_inp3_quirk: when set core will disable receiver detection
> -			in PHY P3 power state.
> - - snps,dis-u2-freeclk-exists-quirk: when set, clear the u2_freeclk_exists
> -			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
> -			a free-running PHY clock.
> - - snps,dis-del-phy-power-chg-quirk: when set core will change PHY power
> -			from P0 to P1/P2/P3 without delay.
> - - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
> -			during HS transmit.
> - - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
> -			park mode are disabled.
> - - snps,dis_metastability_quirk: when set, disable metastability workaround.
> -			CAUTION: use only if you are absolutely sure of it.
> - - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
> -			utmi_l1_suspend_n, false when asserts utmi_sleep_n
> - - snps,hird-threshold: HIRD threshold
> - - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
> -   UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
> - - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
> -	register for post-silicon frame length adjustment when the
> -	fladj_30mhz_sdbnd signal is invalid or incorrect.
> - - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
> -			only. Set this and rx-max-burst-prd to a valid,
> -			non-zero value 1-16 (DWC_usb31 programming guide
> -			section 1.2.4) to enable periodic ESS RX threshold.
> - - snps,rx-max-burst-prd: max periodic ESS RX burst size - host mode only. Set
> -			this and rx-thr-num-pkt-prd to a valid, non-zero value
> -			1-16 (DWC_usb31 programming guide section 1.2.4) to
> -			enable periodic ESS RX threshold.
> - - snps,tx-thr-num-pkt-prd: periodic ESS TX packet threshold count - host mode
> -			only. Set this and tx-max-burst-prd to a valid,
> -			non-zero value 1-16 (DWC_usb31 programming guide
> -			section 1.2.3) to enable periodic ESS TX threshold.
> - - snps,tx-max-burst-prd: max periodic ESS TX burst size - host mode only. Set
> -			this and tx-thr-num-pkt-prd to a valid, non-zero value
> -			1-16 (DWC_usb31 programming guide section 1.2.3) to
> -			enable periodic ESS TX threshold.
> -
> - - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
> - - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> -			register, undefined length INCR burst type enable and INCRx type.
> -			When just one value, which means INCRX burst mode enabled. When
> -			more than one value, which means undefined length INCR burst type
> -			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
> -
> - - in addition all properties from usb-xhci.txt from the current directory are
> -   supported as well
> -
> -
> -This is usually a subnode to DWC3 glue to which it is connected.
> -
> -dwc3@4a030000 {
> -	compatible = "snps,dwc3";
> -	reg = <0x4a030000 0xcfff>;
> -	interrupts = <0 92 4>
> -	usb-phy = <&usb2_phy>, <&usb3,phy>;
> -	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> -};
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> new file mode 100644
> index 000000000000..24808fc2c7e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -0,0 +1,295 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare USB3 Controller
> +
> +maintainers:
> +  - Felipe Balbi <balbi@kernel.org>
> +
> +description: |
> +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> +  be presented as a standalone DT node with an optional vendor-specific
> +  compatible string.
> +
> +allOf:
> +  - $ref: "usb-xhci.yaml#"
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: "snps,dwc3"

Don't need quotes

> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clocks:
> +    description: |
> +      In general the core supports three types of clocks. bus_clk_early is a

s/bus_clk_early/bus_early/

And the others too.

> +      SoC Bus Clock (AHB/AXI/Native). ref_clk generates ITP when the UTMI/ULPI
> +      PHY is suspended. suspend_clk clocks a small part of the USB3 core when
> +      SS PHY in P3. But particular cases may differ from that having less or
> +      more clock sources with another names.
> +
> +  clock-names:
> +    contains:
> +      anyOf:
> +        - enum: ["bus_early", "ref", "suspend"]
> +        - true

That's unfortunate...

> +
> +  usb-phy:
> +   minItems: 1
> +   items:
> +     - description: USB2/HS PHY
> +     - description: USB3/SS PHY
> +
> +  phys:
> +    minItems: 1
> +    items:
> +      - description: USB2/HS PHY
> +      - description: USB3/SS PHY
> +
> +  phy-names:
> +    minItems: 1
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  resets:
> +    minItems: 1
> +
> +  snps,usb2-lpm-disable:
> +    description: Indicate if we don't want to enable USB2 HW LPM
> +    type: boolean
> +
> +  snps,usb3_lpm_capable:
> +    description: Determines if platform is USB3 LPM capable
> +    type: boolean
> +
> +  snps,dis-start-transfer-quirk:
> +    description: |

Drop '|'.

> +      When set, disable isoc START TRANSFER command failure SW work-around
> +      for DWC_usb31 version 1.70a-ea06 and prior.
> +    type: boolean
> +
> +  snps,disable_scramble_quirk:
> +    description: |
> +      True when SW should disable data scrambling. Only really useful for FPGA
> +      builds.
> +    type: boolean
> +
> +  snps,has-lpm-erratum:
> +    description: True when DWC3 was configured with LPM Erratum enabled
> +    type: boolean
> +
> +  snps,lpm-nyet-threshold:
> +    description: LPM NYET threshold
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +
> +  snps,u2exit_lfps_quirk:
> +    description: Set if we want to enable u2exit lfps quirk
> +    type: boolean
> +
> +  snps,u2ss_inp3_quirk:
> +    description: Set if we enable P3 OK for U2/SS Inactive quirk
> +    type: boolean
> +
> +  snps,req_p1p2p3_quirk:
> +    description: |
> +      When set, the core will always request for P1/P2/P3 transition sequence.
> +    type: boolean
> +
> +  snps,del_p1p2p3_quirk:
> +    description: |
> +      When set core will delay P1/P2/P3 until a certain amount of 8B10B errors
> +      occur.
> +    type: boolean
> +
> +  snps,del_phy_power_chg_quirk:
> +    description: When set core will delay PHY power change from P0 to P1/P2/P3.
> +    type: boolean
> +
> +  snps,lfps_filter_quirk:
> +    description: When set core will filter LFPS reception.
> +    type: boolean
> +
> +  snps,rx_detect_poll_quirk:
> +    description: |
> +      when set core will disable a 400us delay to start Polling LFPS after
> +      RX.Detect.
> +    type: boolean
> +
> +  snps,tx_de_emphasis_quirk:
> +    description: When set core will set Tx de-emphasis value
> +    type: boolean
> +
> +  snps,tx_de_emphasis:
> +    description: |
> +      The value driven to the PHY is controlled by the LTSSM during USB3
> +      Compliance mode.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +
> +  snps,dis_u3_susphy_quirk:
> +    description: When set core will disable USB3 suspend phy
> +    type: boolean
> +
> +  snps,dis_u2_susphy_quirk:
> +    description: When set core will disable USB2 suspend phy
> +    type: boolean
> +
> +  snps,dis_enblslpm_quirk:
> +    description: |
> +      When set clears the enblslpm in GUSB2PHYCFG, disabling the suspend signal
> +      to the PHY.
> +    type: boolean
> +
> +  snps,dis-u1-entry-quirk:
> +    description: Set if link entering into U1 needs to be disabled
> +    type: boolean
> +
> +  snps,dis-u2-entry-quirk:
> +    description: Set if link entering into U2 needs to be disabled
> +    type: boolean
> +
> +  snps,dis_rxdet_inp3_quirk:
> +    description: |
> +      When set core will disable receiver detection in PHY P3 power state.
> +    type: boolean
> +
> +  snps,dis-u2-freeclk-exists-quirk:
> +    description: |
> +      When set, clear the u2_freeclk_exists in GUSB2PHYCFG, specify that USB2
> +      PHY doesn't provide a free-running PHY clock.
> +    type: boolean
> +
> +  snps,dis-del-phy-power-chg-quirk:
> +    description: |
> +      When set core will change PHY power from P0 to P1/P2/P3 without delay.
> +    type: boolean
> +
> +  snps,dis-tx-ipgap-linecheck-quirk:
> +    description: When set, disable u2mac linestate check during HS transmit
> +    type: boolean
> +
> +  snps,parkmode-disable-ss-quirk:
> +    description: |
> +      When set, all SuperSpeed bus instances in park mode are disabled.
> +    type: boolean
> +
> +  snps,dis_metastability_quirk:
> +    description: |
> +      When set, disable metastability workaround. CAUTION! Use only if you are
> +      absolutely sure of it.
> +    type: boolean
> +
> +  snps,is-utmi-l1-suspend:
> +    description: |
> +      True when DWC3 asserts output signal utmi_l1_suspend_n, false when
> +      asserts utmi_sleep_n.
> +    type: boolean
> +
> +  snps,hird-threshold:
> +    description: HIRD threshold
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +
> +  snps,hsphy_interface:
> +    description: |
> +      High-Speed PHY interface selection between UTMI+ and ULPI when the
> +      DWC_USB3_HSPHY_INTERFACE has value 3.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: ["utmi", "ulpi"]
> +
> +  snps,quirk-frame-length-adjustment:
> +    description: |
> +      Value for GFLADJ_30MHZ field of GFLADJ register for post-silicon frame
> +      length adjustment when the fladj_30mhz_sdbnd signal is invalid or
> +      incorrect.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  snps,rx-thr-num-pkt-prd:
> +    description: |
> +      Periodic ESS RX packet threshold count (host mode only). Set this and
> +      snps,rx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
> +      programming guide section 1.2.4) to enable periodic ESS RX threshold.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 16
> +
> +  snps,rx-max-burst-prd:
> +    description: |
> +      Max periodic ESS RX burst size (host mode only). Set this and
> +      snps,rx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
> +      programming guide section 1.2.4) to enable periodic ESS RX threshold.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 16
> +
> +  snps,tx-thr-num-pkt-prd:
> +    description: |
> +      Periodic ESS TX packet threshold count (host mode only). Set this and
> +      snps,tx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
> +      programming guide section 1.2.3) to enable periodic ESS TX threshold.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 16
> +
> +  snps,tx-max-burst-prd:
> +    description: |
> +      Max periodic ESS TX burst size (host mode only). Set this and
> +      snps,tx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
> +      programming guide section 1.2.3) to enable periodic ESS TX threshold.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 16
> +
> +  tx-fifo-resize:
> +    description: Determines if the FIFO *has* to be reallocated
> +    deprecated: true
> +    type: boolean
> +
> +  snps,incr-burst-type-adjustment:
> +    description: |
> +      Value for INCR burst type of GSBUSCFG0 register, undefined length INCR
> +      burst type enable and INCRx type. A single value means INCRX burst mode
> +      enabled. If more than one value specified, undefined length INCR burst
> +      type will be enabled with burst lengths utilized up to the maximum
> +      of the values passed in this property.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 8
> +    uniqueItems: true
> +    items:
> +      enum: [1, 4, 8, 16, 32, 64, 128, 256]
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    usb@4a030000 {
> +      compatible = "snps,dwc3";
> +      reg = <0x4a030000 0xcfff>;
> +      interrupts = <0 92 4>;
> +      usb-phy = <&usb2_phy>, <&usb3_phy>;
> +      snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> +    };
> +  - |
> +    usb@4a000000 {
> +      compatible = "snps,dwc3";
> +      reg = <0x4a000000 0xcfff>;
> +      interrupts = <0 92 4>;
> +      clocks = <&clk 1>, <&clk 2>, <&clk 3>;
> +      clock-names = "bus_early", "ref", "suspend";
> +      phys = <&usb2_phy>, <&usb3_phy>;
> +      phy-names = "usb2-phy", "usb3-phy";
> +      snps,dis_u2_susphy_quirk;
> +      snps,dis_enblslpm_quirk;
> +    };
> +...
> -- 
> 2.27.0
> 
