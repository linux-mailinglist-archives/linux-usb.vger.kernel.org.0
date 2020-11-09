Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95F22ABED6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 15:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731070AbgKIOiH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 09:38:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:52714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729976AbgKIOiH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 09:38:07 -0500
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C73B21D46;
        Mon,  9 Nov 2020 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604932686;
        bh=1EhLTYBAx6izuftlV7HeZNLE3o3knmEM9oG0vm1AZ9w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CTsM6gyzxanTlfPdsXpiDoL5m9MFqh7QirAz2FPLhKk/o38NfXZQVeUvhkJnUvQJR
         xh1J8KZbOI8rpSgKDLtlB2NMljLr9owbmsVAYpIn5Ps9UDG8W9uHqj2Xfj3d5B/7ZZ
         p4Anqj89D84g31G3SIUCBHMLRZHyBtPfGMevJwRU=
Received: by mail-oo1-f46.google.com with SMTP id l20so2242568oot.3;
        Mon, 09 Nov 2020 06:38:06 -0800 (PST)
X-Gm-Message-State: AOAM533U6cqyO/4K8N+jNCpiTYzKL/8caefOq1TvsXXdLRjU9ZPoQOjF
        pQfuzJFTpx14+1cNj3wZaN6iRLVK2/T+dAUWQg==
X-Google-Smtp-Source: ABdhPJzsywgteDGfcmRGeodpD5h/7LtCCLWwr6TGwQJKLa8WhoWvqJtUY2d1KEdEJc1AuoBHcgBcLu2uKlwEGBlZInw=
X-Received: by 2002:a4a:6f4d:: with SMTP id i13mr10267741oof.25.1604932685560;
 Mon, 09 Nov 2020 06:38:05 -0800 (PST)
MIME-Version: 1.0
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
 <20201105222559.GA1701705@bogus> <VE1PR04MB6528DB5965EFE139C7E0FAFA89ED0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <CAL_JsqJxvkG05Ds7Wa4RBU8eDqr4O=OcmgyogAYQjVwhcs02aA@mail.gmail.com> <VE1PR04MB6528D5291F820CDDA8EBE65A89EA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528D5291F820CDDA8EBE65A89EA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 9 Nov 2020 08:37:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+OB=aGN+sVAtN89x3LjaRXi_BCy94uceDKmvD+7MnV0g@mail.gmail.com>
Message-ID: <CAL_Jsq+OB=aGN+sVAtN89x3LjaRXi_BCy94uceDKmvD+7MnV0g@mail.gmail.com>
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

On Mon, Nov 9, 2020 at 6:24 AM Jun Li <jun.li@nxp.com> wrote:
> > From: Rob Herring <robh@kernel.org>
> > On Fri, Nov 6, 2020 at 5:07 AM Jun Li <jun.li@nxp.com> wrote:
> > > > From: Rob Herring <robh@kernel.org>

> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: typec-orientation-switch
> > > > > +
> > > > > +  switch-gpios:
> > > > > +    description: |
> > > > > +      gpio specifier to switch the super speed active channel,
> > > > > +      GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> > > > > +      GPIO_ACTIVE_LOW:  GPIO state low for cc1.
> > > >
> > > > What does active mean? There isn't really an active and inactive state,
> > right?
> > > > It's more a mux selecting 0 or 1 input?
> > >
> > > Yes, I will change the description:
> > > gpio specifier to select the target channel of mux.
> >
> > I wonder if the existing mux bindings should be used here.
>
> If only consider typec switch via "gpio", existing "mux-gpio"
> binding may be used with property "mux-control-names" to be
> "typec-xxx" for match, but we still need create typec stuff at
> mux driver to hook to typec system, so little benefit, considering
> this binding is going to be for a generic typec orientation switch
> simple driver, I think a new typec binding make sense.

You can instantiate drivers without a compatible. That's just the easy
way. However, using the mux binding doesn't necessarily mean you have
to use 'mux-gpio'. Consider if you need to do more control than just
the GPIO line. For example, the chips you mentioned may have a s/w
controlled power supply or reset.

Also, consider what the mux would look like with different control
interfaces. That could be I2C or some sub-block in a PMIC or ??? I'm
sure we already have some examples. I'm not happy with these piecemeal
additions to TypeC related bindings that don't consider more than 1
h/w possibility.

> > > > I think you want flags 0 (aka GPIO_ACTIVE_HIGH) unless there's an
> > > > inverter in the middle.
> > >
> > > This depends on the switch IC design and board design, leave 2 flags
> > > (GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW) can cover all possible cases.
> > >
> > > NXP has 2 diff IC parts for this:
> > > 1. PTN36043(used on iMX8MQ)
> > > Output selection control
> > > When SEL=0, RX_AP_*/TX_AP_* are connected to RX_CON_2*/TX_CON_2*, and
> > > RX_CON_1*/TX_CON_1* are connected to VDD thru low ohmic resistor.
> > > When SEL=1, RX_AP_*/TX_AP_* are connected to RX_CON_1*/TX_CON_1*, and
> > > RX_CON_2*/TX_CON_2* are connected to VDD thru low ohmic resistor.
> > >
> > > Board design connects RX_CON_1*/TX_CON_1* to typec connector CC1, so
> > > GPIO_ACTIVE_HIGH
> > >
> > > 2. CBTU02043(used on iMX8MP)
> > > SEL        Function
> > > --------------------------------------
> > > Low        A to B ports and vice versa
> > > High       A to C ports and vice versa
> > >
> > > Board design connects B to typec connector CC1, so GPIO_ACTIVE_LOW
> > >
> > > Therefore, we need 2 flags.
> >
> > I'm not saying you don't. Just that the description is a bit odd.
> > Please expand the description for how one decides how to set the flags.
>
> Misunderstood your point, OK, I thought the "how to set the flags" was
> simple and clear enough:
> Use GPIO_ACTIVE_HIGH if GPIO physical state high is for cc1; or
> Use GPIO_ACTIVE_LOW if GPIO physical state low is for cc1.

Okay.

> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > +    ptn36043 {
> > > > > +        compatible = "typec-orientation-switch";
> > > > > +        pinctrl-names = "default";
> > > > > +        pinctrl-0 = <&pinctrl_ss_sel>;
> > > > > +        switch-gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
> > > > > +
> > > > > +        port {
> > > > > +                usb3_data_ss: endpoint {
> > > > > +                        remote-endpoint = <&typec_con_ss>;
> > > >
> > > > The data goes from the connector to here and then where? You need a
> > > > connection to the USB host controller.
> > >
> > > The orientation switch only need interact with type-c, no any
> > > interaction with USB controller, do we still need a connection to it?
> >
> > If you have 2 USB hosts and 2 connectors (and 2 muxes), how would you describe
> > which connector goes with which host?
>
> One instance of typec orientation switch defined by this binding only for
> One typec connector. With that, my understanding is
> Whether a connection need be described depends on if the connector
> (typec driver) need notify the host controller driver to do something
> (e.g. role switch need a connection between controller node and connector
> node for controller driver to swap usb role). If the mux/switch control is
> transparent to usb host controller (e.g. my case, usb controller drivers
> normally don't need do anything for orientation change), there is no need
> to describe connection between orientation switch node and host controller
> node.

There can be several reasons you need to know the association. When
writing the DT you can't assume what information is or isn't needed.
That may vary by h/w or can evolve in an OS and the DT shouldn't
change.

Rob
