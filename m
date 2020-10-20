Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E77028D035
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 16:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388602AbgJMO3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 10:29:22 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:41132 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387516AbgJMO3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 10:29:22 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id D035D8030719;
        Tue, 13 Oct 2020 14:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M3o6heArBTLz; Tue, 13 Oct 2020 17:29:13 +0300 (MSK)
Date:   Tue, 13 Oct 2020 17:29:11 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/18] dt-bindings: usb: Convert xHCI bindings to DT
 schema
Message-ID: <20201013142911.pay7g6gi2a5d72q3@mobilestation>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-8-Sergey.Semin@baikalelectronics.ru>
 <20201013123004.GB3269269@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201013123004.GB3269269@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 13, 2020 at 07:30:04AM -0500, Rob Herring wrote:
> On Sun, Oct 11, 2020 at 01:41:10AM +0300, Serge Semin wrote:
> > Currently the DT bindings of Generic xHCI Controllers are described by means
> > of the legacy text file. Since such format is deprecated in favor of the
> > DT schema, let's convert the Generic xHCI Controllers bindings file to the
> > corresponding yaml files. There will be two of them: a DT schema for the
> > xHCI controllers on a generic platform and a DT schema validating a generic
> > xHCI controllers properties. The later will be used to validate the xHCI
> > controllers, which aside from some vendor-specific features support the
> > basic xHCI functionality.
> > 
> > An xHCI-compatible DT node shall support the standard USB HCD properties
> > and custom ones like: usb2-lpm-disable, usb3-lpm-capable,
> > quirk-broken-port-ped and imod-interval-ns. In addition if a generic xHCI
> > controller is being validated against the DT schema it is also supposed to
> > be equipped with mandatory compatible string, single registers range,
> > single interrupts source, and is supposed to optionally contain up to two
> > reference clocks for the controller core and CSRs.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  .../devicetree/bindings/usb/generic-xhci.yaml | 63 +++++++++++++++++++
> >  .../devicetree/bindings/usb/usb-xhci.txt      | 41 ------------
> >  .../devicetree/bindings/usb/usb-xhci.yaml     | 40 ++++++++++++
> >  3 files changed, 103 insertions(+), 41 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > new file mode 100644
> > index 000000000000..1ea1d49a8175
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB xHCI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Mathias Nyman <mathias.nyman@intel.com>
> > +
> > +allOf:
> > +  - $ref: "usb-xhci.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description: Generic xHCI device
> > +        const: generic-xhci
> > +      - description: Armada 37xx/375/38x/8k SoCs
> > +        items:
> > +          - enum:
> > +              - marvell,armada3700-xhci
> > +              - marvell,armada-375-xhci
> > +              - marvell,armada-380-xhci
> > +              - marvell,armada-8k-xhci
> > +          - const: generic-xhci
> > +      - description: Broadcom STB SoCs with xHCI
> > +        const: brcm,bcm7445-xhci
> > +      - description: Generic xHCI device
> > +        const: xhci-platform
> > +        deprecated: true
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: core
> > +      - const: reg
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +examples:
> > +  - |
> > +    usb@f0931000 {
> > +      compatible = "generic-xhci";
> > +      reg = <0xf0931000 0x8c8>;
> > +      interrupts = <0x0 0x4e 0x0>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > deleted file mode 100644
> > index 0c5cff84a969..000000000000
> > --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > +++ /dev/null
> > @@ -1,41 +0,0 @@
> > -USB xHCI controllers
> > -
> > -Required properties:
> > -  - compatible: should be one or more of
> > -
> > -    - "generic-xhci" for generic XHCI device
> > -    - "marvell,armada3700-xhci" for Armada 37xx SoCs
> > -    - "marvell,armada-375-xhci" for Armada 375 SoCs
> > -    - "marvell,armada-380-xhci" for Armada 38x SoCs
> > -    - "brcm,bcm7445-xhci" for Broadcom STB SoCs with XHCI
> > -    - "xhci-platform" (deprecated)
> > -
> > -    When compatible with the generic version, nodes must list the
> > -    SoC-specific version corresponding to the platform first
> > -    followed by the generic version.
> > -
> > -  - reg: should contain address and length of the standard XHCI
> > -    register set for the device.
> > -  - interrupts: one XHCI interrupt should be described here.
> > -
> > -Optional properties:
> > -  - clocks: reference to the clocks
> > -  - clock-names: mandatory if there is a second clock, in this case
> > -    the name must be "core" for the first clock and "reg" for the
> > -    second one
> > -  - usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
> > -  - usb3-lpm-capable: determines if platform is USB3 LPM capable
> > -  - quirk-broken-port-ped: set if the controller has broken port disable mechanism
> > -  - imod-interval-ns: default interrupt moderation interval is 5000ns
> > -  - phys : see usb-hcd.yaml in the current directory
> > -
> > -additionally the properties from usb-hcd.yaml (in the current directory) are
> > -supported.
> > -
> > -
> > -Example:
> > -	usb@f0931000 {
> > -		compatible = "generic-xhci";
> > -		reg = <0xf0931000 0x8c8>;
> > -		interrupts = <0x0 0x4e 0x0>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > new file mode 100644
> > index 000000000000..c5c177f2e055
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/usb-xhci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic USB xHCI Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Mathias Nyman <mathias.nyman@intel.com>
> > +
> > +allOf:
> > +  - $ref: "usb-hcd.yaml#"
> > +
> > +properties:
> > +  usb2-lpm-disable:
> > +    description: Indicates if we don't want to enable USB2 HW LPM
> > +    type: boolean
> > +
> > +  usb3-lpm-capable:
> > +    description: Determines if platform is USB3 LPM capable
> > +    type: boolean
> > +
> > +  quirk-broken-port-ped:
> > +    description: Set if the controller has broken port disable mechanism
> > +    type: boolean
> > +
> > +  imod-interval-ns:
> > +    description: Interrupt moderation interval
> > +    default: 5000
> 

> Having additionalProperties or unevaluatedProperties is going to be 
> mandatory, so for this add:
> 
> additionalProperties: true

Ok. I'll get to remember this.

-Sergey

> 
> > +
> > +examples:
> > +  - |
> > +    usb@f0930000 {
> > +      compatible = "generic-xhci";
> > +      reg = <0xf0930000 0x8c8>;
> > +      interrupts = <0x0 0x4e 0x0>;
> > +      usb2-lpm-disable;
> > +      usb3-lpm-capable;
> > +    };
> > -- 
> > 2.27.0
> > 
