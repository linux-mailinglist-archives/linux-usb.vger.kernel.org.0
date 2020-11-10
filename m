Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AE42AD9AB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 16:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731280AbgKJPFi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 10:05:38 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:34840 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJPFh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 10:05:37 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CFF0A803086A;
        Tue, 10 Nov 2020 15:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Do_NKVI1Q_hK; Tue, 10 Nov 2020 18:05:28 +0300 (MSK)
Date:   Tue, 10 Nov 2020 18:05:25 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
        <linux-arm-kernel@lists.infradead.org>,
        <linux-snps-arc@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 01/16] dt-bindings: usb: usb-hcd: Convert generic USB
 properties to DT schema
Message-ID: <20201110150525.m7b7nux7av3vzkmj@mobilestation>
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
 <20201020112101.19077-2-Sergey.Semin@baikalelectronics.ru>
 <1603249236.31607.9.camel@mhfsdcap03>
 <20201021154621.a3vtoa4lriwkpnfo@mobilestation>
 <20201026164648.jmp6uiblwoxrqehb@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201026164648.jmp6uiblwoxrqehb@mobilestation>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It seems noone is going to get involved in the discussion. Therefore I'll
fix the patch in the way I suggested in my previous message. Alas I'll
have to remove the reviewed-by tags of Rob from some patches.

-Sergey

On Mon, Oct 26, 2020 at 07:46:49PM +0300, Serge Semin wrote:
> Folks, any comment on my previous message below?
> 
> On Wed, Oct 21, 2020 at 06:46:21PM +0300, Serge Semin wrote:
> > On Wed, Oct 21, 2020 at 11:00:36AM +0800, Chunfeng Yun wrote:
> > > On Tue, 2020-10-20 at 14:20 +0300, Serge Semin wrote:
> > > > The generic USB HCD properties have been described in the legacy bindings
> > > > text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> > > > convert it' content into the USB HCD DT schema properties so all USB DT
> > >           ^ its?
> > > > nodes would be validated to have them properly utilized.
> > > > 
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > 
> > > > ---
> > > > 
> > > > Changelog v2:
> > > > - Discard '|' in all the new properties, since we don't need to preserve
> > > >   the text formatting.
> > > > - Convert abbreviated form of the "maximum-speed" enum restriction into
> > > >   the multi-lined version of the list.
> > > > - Drop quotes from around the string constants.
> > > > ---
> > > >  .../devicetree/bindings/usb/generic.txt       | 57 ------------
> > > >  .../devicetree/bindings/usb/usb-hcd.yaml      | 88 +++++++++++++++++++
> > 
> > > Do we need change the file name or modify it's title?
> > > the title is "Generic USB Host Controller Device Tree Bindings", but
> > > some generic properties, such as, dr_mode, usb-role-switch, otg related
> > > ones, are usually used by DRD controller, this may cause some confusion.
> > 
> > Hm, good question. A problem of the naming and the properties inclusion do
> > exist here. I haven't thought that through when moved all the generic
> > properties into the usb-hcd.yaml bindings file. But I don't think it's a good
> > idea to rename the file. Most likely the best solution would be to split the
> > functionality up as follows:
> > 
> > 1) usb.yaml - common USB controller with generic properties for all USB modes (host, peripheral, otg):
> >    + $nodename
> >    + phys
> >    + phy-names
> >    + usb-phy
> >    + maximum-speed
> >    + phy_type
> > 2) usb-hcd.yaml - DT schema for USB host controllers (EHCI/OHCI/UHCI):
> >    + allOf: [usb.yaml#]
> >    + companion
> > 3) usb-xhci.yaml - DT schema for USB host controllers (xHCI):
> >    + allOf: [usb-hcd.yaml#]
> >    + usb2-lpm-disable
> >    + usb3-lpm-capable
> >    + quirk-broken-port-ped
> >    + imod-interval-ns
> > 4) usb-drd.yaml - DT schema for USB OTG controllers:
> >    + otg-rev
> >    + hnp-disable
> >    + srp-disable
> >    + adp-disable
> >    + usb-role-switch
> >    + role-switch-default-mode
> >    + tpl-support
> >    + dr_mode: [host, peripheral, otg]
> > 
> > So in case if an USB controller is DRD with EHCI host, then it will need
> > to pass evaluation of allOf: [usb-hcd.yaml#, usb-drd.yaml#]. If an USB
> > controller is DRD with xHCI host, then the next schema can be applied:
> > [usb-xhci.yaml#, usb-drd.yaml#]. A conditional schema is also applicable
> > here, like this:
> > allOf:
> >   - $ref: usb-drd.yaml#
> >   - if:
> >       properties:
> >         dr_mode:
> >           const: host
> >     then:
> >       $ref: usb-hcd.yaml# (or usb-xhci.yaml#)
> >     else:
> >       #ref: usb.yaml#
> > 
> > What do you think? @Rob, @Greg, we need your opinion here.
> > 
> > -Sergey
> > 
> > > 
> > > >  2 files changed, 88 insertions(+), 57 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > > > deleted file mode 100644
> > > > index ba472e7aefc9..000000000000
> > > > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > > > +++ /dev/null
> > > > @@ -1,57 +0,0 @@
> > > > -Generic USB Properties
> > > > -
> > > > -Optional properties:
> > > > - - maximum-speed: tells USB controllers we want to work up to a certain
> > > > -			speed. Valid arguments are "super-speed-plus",
> > > > -			"super-speed", "high-speed", "full-speed" and
> > > > -			"low-speed". In case this isn't passed via DT, USB
> > > > -			controllers should default to their maximum HW
> > > > -			capability.
> > > > - - dr_mode: tells Dual-Role USB controllers that we want to work on a
> > > > -			particular mode. Valid arguments are "host",
> > > > -			"peripheral" and "otg". In case this attribute isn't
> > > > -			passed via DT, USB DRD controllers should default to
> > > > -			OTG.
> > > > - - phy_type: tells USB controllers that we want to configure the core to support
> > > > -			a UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is
> > > > -			selected. Valid arguments are "utmi" and "utmi_wide".
> > > > -			In case this isn't passed via DT, USB controllers should
> > > > -			default to HW capability.
> > > > - - otg-rev: tells usb driver the release number of the OTG and EH supplement
> > > > -			with which the device and its descriptors are compliant,
> > > > -			in binary-coded decimal (i.e. 2.0 is 0200H). This
> > > > -			property is used if any real OTG features(HNP/SRP/ADP)
> > > > -			is enabled, if ADP is required, otg-rev should be
> > > > -			0x0200 or above.
> > > > - - companion: phandle of a companion
> > > > - - hnp-disable: tells OTG controllers we want to disable OTG HNP, normally HNP
> > > > -			is the basic function of real OTG except you want it
> > > > -			to be a srp-capable only B device.
> > > > - - srp-disable: tells OTG controllers we want to disable OTG SRP, SRP is
> > > > -			optional for OTG device.
> > > > - - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
> > > > -			optional for OTG device.
> > > > - - usb-role-switch: boolean, indicates that the device is capable of assigning
> > > > -			the USB data role (USB host or USB device) for a given
> > > > -			USB connector, such as Type-C, Type-B(micro).
> > > > -			see connector/usb-connector.yaml.
> > > > - - role-switch-default-mode: indicating if usb-role-switch is enabled, the
> > > > -			device default operation mode of controller while usb
> > > > -			role is USB_ROLE_NONE. Valid arguments are "host" and
> > > > -			"peripheral". Defaults to "peripheral" if not
> > > > -			specified.
> > > > -
> > > > -
> > > > -This is an attribute to a USB controller such as:
> > > > -
> > > > -dwc3@4a030000 {
> > > > -	compatible = "synopsys,dwc3";
> > > > -	reg = <0x4a030000 0xcfff>;
> > > > -	interrupts = <0 92 4>
> > > > -	usb-phy = <&usb2_phy>, <&usb3,phy>;
> > > > -	maximum-speed = "super-speed";
> > > > -	dr_mode = "otg";
> > > > -	phy_type = "utmi_wide";
> > > > -	otg-rev = <0x0200>;
> > > > -	adp-disable;
> > > > -};
> > > > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > > index 7263b7f2b510..ee7ea205c71d 100644
> > > > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > > @@ -22,9 +22,97 @@ properties:
> > > >      description:
> > > >        Name specifier for the USB PHY
> > > >  
> > > > +  maximum-speed:
> > > > +   description:
> > > > +     Tells USB controllers we want to work up to a certain speed. In case this
> > > > +     isn't passed via DT, USB controllers should default to their maximum HW
> > > > +     capability.
> > > > +   $ref: /schemas/types.yaml#/definitions/string
> > > > +   enum:
> > > > +     - low-speed
> > > > +     - full-speed
> > > > +     - high-speed
> > > > +     - super-speed
> > > > +     - super-speed-plus
> > > > +
> > > > +  dr_mode:
> > > > +    description:
> > > > +      Tells Dual-Role USB controllers that we want to work on a particular
> > > > +      mode. In case this attribute isn't passed via DT, USB DRD controllers
> > > > +      should default to OTG.
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    enum: [host, peripheral, otg]
> > > > +
> > > > +  phy_type:
> > > > +    description:
> > > > +      Tells USB controllers that we want to configure the core to support a
> > > > +      UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is selected. In case
> > > > +      this isn't passed via DT, USB controllers should default to HW
> > > > +      capability.
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    enum: [utmi, utmi_wide]
> > > > +
> > > > +  otg-rev:
> > > > +    description:
> > > > +      Tells usb driver the release number of the OTG and EH supplement with
> > > > +      which the device and its descriptors are compliant, in binary-coded
> > > > +      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
> > > > +      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
> > > > +      0x0200 or above.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +
> > > > +  companion:
> > > > +    description: Phandle of a companion device
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +
> > > > +  hnp-disable:
> > > > +    description:
> > > > +      Tells OTG controllers we want to disable OTG HNP. Normally HNP is the
> > > > +      basic function of real OTG except you want it to be a srp-capable only B
> > > > +      device.
> > > > +    type: boolean
> > > > +
> > > > +  srp-disable:
> > > > +    description:
> > > > +      Tells OTG controllers we want to disable OTG SRP. SRP is optional for OTG
> > > > +      device.
> > > > +    type: boolean
> > > > +
> > > > +  adp-disable:
> > > > +    description:
> > > > +      Tells OTG controllers we want to disable OTG ADP. ADP is optional for OTG
> > > > +      device.
> > > > +    type: boolean
> > > > +
> > > > +  usb-role-switch:
> > > > +    description:
> > > > +      Indicates that the device is capable of assigning the USB data role
> > > > +      (USB host or USB device) for a given USB connector, such as Type-C,
> > > > +      Type-B(micro). See connector/usb-connector.yaml.
> > > > +
> > > > +  role-switch-default-mode:
> > > > +    description:
> > > > +      Indicates if usb-role-switch is enabled, the device default operation
> > > > +      mode of controller while usb role is USB_ROLE_NONE.
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    enum: [host, peripheral]
> > > > +    default: peripheral
> > > > +
> > > >  examples:
> > > >    - |
> > > >      usb {
> > > >          phys = <&usb2_phy1>, <&usb3_phy1>;
> > > >          phy-names = "usb";
> > > >      };
> > > > +  - |
> > > > +    usb@4a030000 {
> > > > +        compatible = "snps,dwc3";
> > > > +        reg = <0x4a030000 0xcfff>;
> > > > +        interrupts = <0 92 4>;
> > > > +        usb-phy = <&usb2_phy>, <&usb3_phy>;
> > > > +        maximum-speed = "super-speed";
> > > > +        dr_mode = "otg";
> > > > +        phy_type = "utmi_wide";
> > > > +        otg-rev = <0x0200>;
> > > > +        adp-disable;
> > > > +    };
> > > 
