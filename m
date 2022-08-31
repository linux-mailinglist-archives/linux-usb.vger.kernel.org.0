Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C005A835B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 18:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbiHaQil (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 12:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiHaQi3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 12:38:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BBED7D20
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 09:38:28 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id p8-20020a17090ad30800b001fdfc8c7567so3738777pju.1
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OaCyZzLvcCpsyTCEH1A5MS9EZVvRVfWIIgcRnBjIWNQ=;
        b=qIKKi3mMHcII/hptopT7BPHoIw7FFlwg4NC8lfWdKaKsPIQJdXj+RH5gDdBK1LWVan
         seOvLPJrVW96WV2gHcnNFHxjPCkPmP7RffnD3BP0Pwf1w3mXK8Za3UItXcazf3hPU1x5
         JgUOecmjIXsajFKqKeWQm4Mnkck57YXp11dCXez4Jr7dQo6cdwgcHf3OOW8jPBrTuieO
         HXUAA7xy+nbzbJM7BGF6/tqKBEHESPFvtW7hGrZBpuPUQQX+bdEv+qeYMtvX8b4OUiw+
         1WSjsIvXvIDqCQ3L42aNS4g75ZqEumYMaj9P9Pg+/JR1cA/Dhml3cq0nRi3lF0xiXz0L
         obfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OaCyZzLvcCpsyTCEH1A5MS9EZVvRVfWIIgcRnBjIWNQ=;
        b=VVjDYdIe5kkf0S03H4q1W30XghFZ8VX8H7ZL2zKg20y01tu1n/FXcxblJ7r/CrwPYO
         pFrcky6iTA98Up/V8LMHndkXiWA+sgisFQ7PvU/JKlhV+rt6gJhKJaHqphJF2gSz7JLM
         PpBSvN6wZBafqR5owg2Uxhli1ZHruz5ewSFQuTi/o7L2eCY6biusglogLQMCzwEbbrrk
         uvSewhUwGZyAR5N9kIGlqneTN+fm6f/MRX65DuqP4C5bzcVTd/JRPM/7yctYz7J7sP2y
         7Br1GdaUGYbwVZsSf31Sq2WDV4AywKfbHlX1xm6B2d4yPyfOhHUOpL96ptY2RsSP72ok
         MyDQ==
X-Gm-Message-State: ACgBeo1W1mX9sERdhQU6pC5hK1UKq6MtQtVx/uaoLskqF4xB6a8cQY17
        sIQfh9RztqbEh5iksWn2hjPzXRIh2N4G+/CzGb0nqg==
X-Google-Smtp-Source: AA6agR7I6xbpfl75ceIqVJBTjukdoUKCCOmfzwNe16ntKyJTAvN6DjpOK5/plQG24Rnw0IxxmZbTzUXRqZ9SusdgKV0=
X-Received: by 2002:a17:903:41c6:b0:174:3acf:8294 with SMTP id
 u6-20020a17090341c600b001743acf8294mr26109933ple.118.1661963907879; Wed, 31
 Aug 2022 09:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com>
 <DB9PR04MB8412164E22460736FB15B8D687789@DB9PR04MB8412.eurprd04.prod.outlook.com>
 <PA4PR04MB9640F578AEF2558BA3F08F8889789@PA4PR04MB9640.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB9640F578AEF2558BA3F08F8889789@PA4PR04MB9640.eurprd04.prod.outlook.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 31 Aug 2022 09:38:16 -0700
Message-ID: <CAJ+vNU10JeQg7GO+cd+Twn_uE4Hsh0T422+vZKT-DW517OD-RA@mail.gmail.com>
Subject: Re: imx8mp USB OTG/dual-role
To:     Jun Li <jun.li@nxp.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Jacky Bai <ping.bai@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Felipe Balbi <balbi@kernel.org>,
        Fabio Estevam <festevam@denx.de>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 30, 2022 at 8:11 PM Jun Li <jun.li@nxp.com> wrote:
>
> Hi,
>
> > -----Original Message-----
> > From: Jacky Bai <ping.bai@nxp.com>
> > Sent: Wednesday, August 31, 2022 9:18 AM
> > To: tharvey@gateworks.com; linux-usb@vger.kernel.org; Linux ARM Mailing
> > List <linux-arm-kernel@lists.infradead.org>; Jun Li <jun.li@nxp.com>
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; Jun Li
> > <jun.li@nxp.com>; Rikard Falkeborn <rikard.falkeborn@gmail.com>; Lucas
> > Stach <l.stach@pengutronix.de>; Philippe Schenker
> > <philippe.schenker@toradex.com>; Felipe Balbi <balbi@kernel.org>; Fabio
> > Estevam <festevam@denx.de>; Marcel Ziswiler <marcel.ziswiler@toradex.com>;
> > Shawn Guo <shawnguo@kernel.org>; Marek Vasut <marex@denx.de>; Francesco
> > Dolcini <francesco.dolcini@toradex.com>; Aisheng Dong
> > <aisheng.dong@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>;
> > dl-linux-imx <linux-imx@nxp.com>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>
> > Subject: RE: imx8mp USB OTG/dual-role
> >
> > Jun, as we discussed before, any conclusion on how to handle the USB OTG
> > ID pin in RM?
>
> The NXP datasheet for iMX8MP already changed the ID pin name to be with _DNU
> suffix, RM may be updated in next version.
> If legacy ID is going to be used, any normal GPIO function can be selected
> for it, extcon is well supported in dwc3 controller driver.
>
> More comments for Tim, see below...
>
> >
> >
> > BR
> > Jacky Bai
> >
> > > Subject: imx8mp USB OTG/dual-role
> > >
> > > Greetings,
> > >
> > > I have an imx8mp board (imx8mp-venice-gw74xx) which has a DWC3 USB
> > > host controller using imx8mp PHY
> > > (drivers/phy/freescale/phy-fsl-imx8mq-usb.c fsl,imx8mp-usb-phy) and
> > > DWC3 host controller core (drivers/usb/dwc3/core.c snps,dwc3) with
> > > imx8mp glue (drivers/usb/dwc3/dwc3-imx8mp.c fsl,imx8mp-dwc3).
> > >
> > > One of the 2x USB 3.0 hosts is connected to a USB Type C connector
> > > using a
> > > TPS25821 USB power switch and config controller which handles the CC
> > > pins on and VBUS enable as well as drives the mux sel pin of a
> > > USB3 mux to route the USB SS pairs to the appropriate half of the Type
> > > C connector. This device has no I2C or other management bus - only
> > > VBUS, FAULT#, SINK#, and POL# outputs based on CC pins.
> > >
> > > I'm not clear how to describe this in the device-tree in order for it
> > > to function as a dual-role controller for host vs device mode.
> > >
> > > The TPS25821 has a FAULT# signal that routes to IMX8MP GPIO1_IO13
> > > pinmuxed as MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC and a SINK# signal
> > > that routes to IMX8MP GPIO1_IO10 pinmuxed as
> > > MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID. Additionally the VBUS output of
> > > the TPS25821 also connected to the TypeC VBUS pin routes to the IMX8MP
> > > USB1_VBUS pin.
>
> So TPS25821 does not need a driver.
>
> > >
> > > I've noticed there are currently only 2 other IMX8MP boards in Linux
> > > mainline that specify dr_mode="otg"; the DH electronics i.MX8M Plus
> > > DHCOM SOM (imx8mp-dhcom-som.dtsi), and the Toradex i.MX8M Plus Verdin
> > > SOM (imx8mp-verdin.dtsi). I'm not clear how these are hooked up or if
> > > USB dual-role work on these currently. I did notice that
>
> NXP iMX8MP EVK has not enabled type-C port due to the SS orientation
> switch binding is still in discussion, but you don't need a SW control
> in your case so you are okay here.
>
> > > imx8mp-verdin.dtsi looks like it does not enable the phy or core via
> > > status prop and uses invalid 'over-current-active-low' and
> > 'disable-over-current' dt props.
> > >
> > > I am currently using the following with imx8mp-venice-gw74xx:
> > >
> > > /* USB1 - Type C front panel */
> > > &usb3_phy0 {
> > >         status = "okay";
> > > };
> > >
> > > /* USB1 dwc3 glue */
> > > &usb3_0 {
> > >         fsl,over-current-active-low;
> > >         status = "okay";
> > > };
> > >
> > > /* USB1 dwc3 core */
> > > &usb_dwc3_0 {
> > >         pinctrl-names = "default";
> > >         pinctrl-0 = <&pinctrl_usb1>;
> > >         dr_mode = "otg";
> > > };
> > >
> > > &iomuxc {
> > >         pinctrl_usb1: usb1grp {
> > >                 fsl,pins = <
> > >
> > > MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC    0x140
> > >
> > > MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID    0x140
> > >                 >;
> > >         };
> > > };
> > >
> > > And currently v6.0-rc2 enumerates the host controller even without a
> > > Type-C to host cable attached which tells me that OTG_ID isn't doing
> > > its job. I vaguely recall some confusing statements on the IMX
> > > community forum that these pins might not even be used on the IMX8MP.
> > >
> > > How should I be describing the device-tree for this scenario in order
> > > to get dual-role behavior?
>
> Could this dts work for you?
>
> /* Config the "ID" pin iomux to be GPIO */
>
> pinctrl_usb1: usb1grp {
>                  fsl,pins = <
>                       MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC    0x140
>                       MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10    0x140
>           >;
>  };
>
>  extcon_usb: extcon_iddig {
>                  compatible = "linux,extcon-usb-gpio";
>                  id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
>  };
>
>  &usb_dwc3_0 {
>          pinctrl-names = "default";
>          pinctrl-0 = <&pinctrl_usb1>;
>                  extcon = <&extcon_usb>
>          dr_mode = "otg";
>  };
>
> Li Jun

Jun,

Thank you, this does appear to work as intended as dual-role. I was
not aware of linux,extcon-usb-gpio.

And thanks also Alexander, your usb-dual-role via connector method
works as well.

Which method is preferred, using extcon or using usb-role-switch via a
connector as in Alexander's patch?

Additionally, where is it appropriate to put the pinctrl for the OC
and ID pins in the usb_dwc3_0 (dwc3 core) node, the usb3_0 (dwc3 glue)
node, or the usb3_phy0 (phy) node?

Best Regards,

Tim
