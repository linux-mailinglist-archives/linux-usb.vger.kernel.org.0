Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227CE2A9790
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 15:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbgKFOYi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 09:24:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:59812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727166AbgKFOYh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 09:24:37 -0500
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55C0F2151B;
        Fri,  6 Nov 2020 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604672676;
        bh=8R/HkQhxiIJtH+pu6bTEhw47dgED0NJDh0oJeQr18Nk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BgazNXKjLS8bFbjvTK1EL5rNDNhSaCTiVw6n+p2pcw/zKzNtM8qHAkw1Dz+Eh8GJ5
         tP42vEfgMnb4GpweRcdG1mVPgrjrJotDRSSDMhp0lXrVFxMpS8F033xhI7DEkBQMPk
         5R7P2CkT6HIN5iSi/WtQdO+pYom534RqIojwcATU=
Received: by mail-ot1-f51.google.com with SMTP id y22so1356938oti.10;
        Fri, 06 Nov 2020 06:24:36 -0800 (PST)
X-Gm-Message-State: AOAM533xjNcPMAiqnbVW/XA+aQXS2Y3AoD1FHOo6ZxhbAZIwZEVZ4fRK
        +pgs9CrUqIVSpUm3SV8Is659KaH23wA7sN7VpQ==
X-Google-Smtp-Source: ABdhPJz2lZyE8yejc5mq35b+Eqmy+/owOscHu1zVRHO7y1Dz83CYFrC4m0AbhGpdw/6gbzSieZ5FVR3NO0kbPXPXrl4=
X-Received: by 2002:a05:6830:2259:: with SMTP id t25mr1324932otd.192.1604672673035;
 Fri, 06 Nov 2020 06:24:33 -0800 (PST)
MIME-Version: 1.0
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
 <20201105222559.GA1701705@bogus> <VE1PR04MB6528DB5965EFE139C7E0FAFA89ED0@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528DB5965EFE139C7E0FAFA89ED0@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 6 Nov 2020 08:24:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJxvkG05Ds7Wa4RBU8eDqr4O=OcmgyogAYQjVwhcs02aA@mail.gmail.com>
Message-ID: <CAL_JsqJxvkG05Ds7Wa4RBU8eDqr4O=OcmgyogAYQjVwhcs02aA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
 switch simple driver
To:     Jun Li <jun.li@nxp.com>
Cc:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 6, 2020 at 5:07 AM Jun Li <jun.li@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Friday, November 6, 2020 6:26 AM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: heikki.krogerus@linux.intel.com; rafael@kernel.org;
> > gregkh@linuxfoundation.org; andriy.shevchenko@linux.intel.com;
> > hdegoede@redhat.com; lee.jones@linaro.org;
> > mika.westerberg@linux.intel.com; dmitry.torokhov@gmail.com;
> > prabhakar.mahadev-lad.rj@bp.renesas.com;
> > laurent.pinchart+renesas@ideasonboard.com; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter Chen
> > <peter.chen@nxp.com>
> > Subject: Re: [PATCH v5 1/4] dt-bindings: usb: add documentation for typec
> > switch simple driver
> >
> > On Tue, Nov 03, 2020 at 07:40:07PM +0800, Li Jun wrote:
> > > Some platforms need a simple driver to do some controls according to
> > > typec orientation, this can be extended to be a generic driver with
> > > compatible with "typec-orientation-switch".
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > > No changes for v5.
> > >
> > > changes on v4:
> > > - Use compatible instead of bool property for switch matching.
> > > - Change switch GPIO to be switch simple.
> > > - Change the active channel selection GPIO to be optional.
> > >
> > > previous discussion:
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatch
> > >
> > work.ozlabs.org%2Fpatch%2F1054342%2F&amp;data=04%7C01%7Cjun.li%40nxp.c
> > >
> > om%7C78ca5205695149e2743208d881d9c753%7C686ea1d3bc2b4c6fa92cd99c5c3016
> > >
> > 35%7C0%7C0%7C637402119664101856%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> > >
> > AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
> > > 8TY%2BPRIui6HhxhYE1%2BLmwWL38Vp7SY1Ceb5rGG%2B4DUo%3D&amp;reserved=0
> > >
> > >  .../bindings/usb/typec-switch-simple.yaml          | 69
> > ++++++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > > b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > > new file mode 100644
> > > index 0000000..244162d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/typec-switch-simple.yaml
> > > @@ -0,0 +1,69 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > >
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > >
> > +cetree.org%2Fschemas%2Fusb%2Ftypec-switch-simple.yaml%23&amp;data=04%
> > >
> > +7C01%7Cjun.li%40nxp.com%7C78ca5205695149e2743208d881d9c753%7C686ea1d3
> > >
> > +bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637402119664111854%7CUnknown%7CTWF
> > >
> > +pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> > >
> > +Mn0%3D%7C1000&amp;sdata=HjWfKlDLyqb%2FKLlL6vdnyPe%2BnB8pSllhokIXQ%2Bw
> > > +yyw8%3D&amp;reserved=0
> > > +$schema:
> > >
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > >
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cjun.li%40
> > >
> > +nxp.com%7C78ca5205695149e2743208d881d9c753%7C686ea1d3bc2b4c6fa92cd99c
> > >
> > +5c301635%7C0%7C0%7C637402119664111854%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> > >
> > +iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am
> > >
> > +p;sdata=z0bO47QVl5gw0UE%2Bx3a5E27ALgz568zp%2Bf4suGlch%2Fo%3D&amp;rese
> > > +rved=0
> > > +
> > > +title: Typec Orientation Switch Simple Solution Bindings
> > > +
> > > +maintainers:
> > > +  - Li Jun <jun.li@nxp.com>
> > > +
> > > +description: |-
> > > +  USB SuperSpeed (SS) lanes routing to which side of typec connector
> > > +is
> > > +  decided by orientation, this maybe achieved by some simple control
> > > +like
> > > +  GPIO toggle.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: typec-orientation-switch
> > > +
> > > +  switch-gpios:
> > > +    description: |
> > > +      gpio specifier to switch the super speed active channel,
> > > +      GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> > > +      GPIO_ACTIVE_LOW:  GPIO state low for cc1.
> >
> > What does active mean? There isn't really an active and inactive state, right?
> > It's more a mux selecting 0 or 1 input?
>
> Yes, I will change the description:
> gpio specifier to select the target channel of mux.

I wonder if the existing mux bindings should be used here.

> > I think you want flags 0 (aka GPIO_ACTIVE_HIGH) unless there's an inverter
> > in the middle.
>
> This depends on the switch IC design and board design, leave 2 flags
> (GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW) can cover all possible cases.
>
> NXP has 2 diff IC parts for this:
> 1. PTN36043(used on iMX8MQ)
> Output selection control
> When SEL=0, RX_AP_*/TX_AP_* are connected to RX_CON_2*/TX_CON_2*, and
> RX_CON_1*/TX_CON_1* are connected to VDD thru low ohmic resistor.
> When SEL=1, RX_AP_*/TX_AP_* are connected to RX_CON_1*/TX_CON_1*, and
> RX_CON_2*/TX_CON_2* are connected to VDD thru low ohmic resistor.
>
> Board design connects RX_CON_1*/TX_CON_1* to typec connector CC1,
> so GPIO_ACTIVE_HIGH
>
> 2. CBTU02043(used on iMX8MP)
> SEL        Function
> --------------------------------------
> Low        A to B ports and vice versa
> High       A to C ports and vice versa
>
> Board design connects B to typec connector CC1, so GPIO_ACTIVE_LOW
>
> Therefore, we need 2 flags.

I'm not saying you don't. Just that the description is a bit odd.
Please expand the description for how one decides how to set the
flags.

>
> >
> > > +    maxItems: 1
> > > +
> > > +  port:
> > > +    type: object
> > > +    additionalProperties: false
> > > +    description: -|
> > > +      Connection to the remote endpoint using OF graph bindings that model
> > SS
> > > +      data bus to typec connector.
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        properties:
> > > +          remote-endpoint: true
> > > +
> > > +        required:
> > > +          - remote-endpoint
> > > +
> > > +    required:
> > > +      - endpoint
> > > +
> > > +required:
> > > +  - compatible
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    ptn36043 {
> > > +        compatible = "typec-orientation-switch";
> > > +        pinctrl-names = "default";
> > > +        pinctrl-0 = <&pinctrl_ss_sel>;
> > > +        switch-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
> > > +
> > > +        port {
> > > +                usb3_data_ss: endpoint {
> > > +                        remote-endpoint = <&typec_con_ss>;
> >
> > The data goes from the connector to here and then where? You need a connection
> > to the USB host controller.
>
> The orientation switch only need interact with type-c, no any interaction
> with USB controller, do we still need a connection to it?

If you have 2 USB hosts and 2 connectors (and 2 muxes), how would you
describe which connector goes with which host?

Rob
