Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76A02AEDD4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 10:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgKKJcU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 04:32:20 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:40024 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgKKJcT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 04:32:19 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B0C25803073E;
        Wed, 11 Nov 2020 09:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id P3nRDF2DG9k5; Wed, 11 Nov 2020 12:32:16 +0300 (MSK)
Date:   Wed, 11 Nov 2020 12:32:13 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
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
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201111093213.gio6mrowjvmvnzoi@mobilestation>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111091628.GC4050@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201111091628.GC4050@kozik-lap>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 10:16:28AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > Controller schema, but with additional vendor-specific properties, the
> > controller-specific reference clocks and PHYs. So let's convert the
> > currently available legacy text-based DWC USB3 bindings to the DT schema
> > and make sure the DWC USB3 nodes are also validated against the
> > usb-xhci.yaml schema.
> > 
> > Note we have to discard the nodename restriction of being prefixed with
> > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > are supposed to be named as "^usb(@.*)".
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Discard '|' from the descriptions, since we don't need to preserve
> >   the text formatting in any of them.
> > - Drop quotes from around the string constants.
> > - Fix the "clock-names" prop description to be referring the enumerated
> >   clock-names instead of the ones from the Databook.
> > 
> > Changelog v3:
> > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> >   as either host or otg.
> > 
> > Changelog v4:
> > - Apply usb-drd.yaml schema first. If the controller is configured
> >   to work in a gadget mode only, then apply the usb.yaml schema too,
> >   otherwise apply the usb-xhci.yaml schema.
> > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> >   time.
> > ---
> >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> >  2 files changed, 303 insertions(+), 125 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> > deleted file mode 100644
> > index d03edf9d3935..000000000000
> > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > +++ /dev/null
> > @@ -1,125 +0,0 @@
> > -synopsys DWC3 CORE
> > -
> > -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> > -      as described in 'usb/generic.txt'
> > -
> > -Required properties:
> > - - compatible: must be "snps,dwc3"
> > - - reg : Address and length of the register set for the device
> > - - interrupts: Interrupts used by the dwc3 controller.

> > - - clock-names: list of clock names. Ideally should be "ref",
> > -                "bus_early", "suspend" but may be less or more.
> > - - clocks: list of phandle and clock specifier pairs corresponding to
> > -           entries in the clock-names property.
> > -
> > -Exception for clocks:
> > -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> > -  one of the following:
> > -    "cavium,octeon-7130-usb-uctl"
> > -    "qcom,dwc3"
> > -    "samsung,exynos5250-dwusb3"
> > -    "samsung,exynos5433-dwusb3"
> > -    "samsung,exynos7-dwusb3"
> > -    "sprd,sc9860-dwc3"
> > -    "st,stih407-dwc3"
> > -    "ti,am437x-dwc3"
> > -    "ti,dwc3"
> > -    "ti,keystone-dwc3"
> > -    "rockchip,rk3399-dwc3"
> > -    "xlnx,zynqmp-dwc3"
> 
> What happened with this part of dtschema? It sees you removed it.

You meant "bindings", right?

I don't think it's a good idea to implement that weak binding in the
generic DWC USB3 DT schema. Of course I could have created it under
the allOf conditional schema and stuff. But in that case we would have
needed to support the clock-related vendor-specific peculiarities in
both the generic DWC USB3 DT schema and in the vendor-specific binding
files. That wouldn't be that maintainable. As I see it all the
vendor-specific clock requirements should be reflected in the
glue-node DT schema. The DWC USB3 node binding just declares the
clocks as optional. Moreover the DWC USB3 driver also considers them
as optional.

-Sergey

> 
> Best regards,
> Krzysztof
