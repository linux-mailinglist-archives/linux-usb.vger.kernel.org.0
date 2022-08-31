Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC235A781A
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 09:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiHaHtu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 03:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiHaHtA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 03:49:00 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58925C2E9A
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1661932132; x=1693468132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rg5BpRgOaAuH3ZkKcryXgflmwL6yiYYEJS6kl4M3yis=;
  b=RvYgtSc8rBxCOH9R0RW5SJBI2Ev7n+oDsERUDOAVPAK/fN0y+C/5UjC/
   mc0jmxqrDBf9Q1iQ+Y/88NMkS4AxqEtnsjrDe4fobFRaGbjOQmtR2qyOp
   k2qk47STNuzdtZWNBWLpj6klC1cs8rt4cccpvqoDKfo0jkfhCIP+6uQ1m
   NrP1jouz/faDaY2c8nCem6zSr7/7sLISI6kY9KL4P6Od37hb25UhyDy/3
   2Kd/417PXKei3EZkOd4+8ym8cubu9MOi0gQvfwPwqXnK4X0LwdEN5C6b4
   30NIWldlV/yg4O3CI0lfZDqRIdUskChrfUDzpwurgdSDl/WDPOGpEjGYy
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,277,1654552800"; 
   d="scan'208";a="25901430"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Aug 2022 09:48:37 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 Aug 2022 09:48:37 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 Aug 2022 09:48:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1661932117; x=1693468117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rg5BpRgOaAuH3ZkKcryXgflmwL6yiYYEJS6kl4M3yis=;
  b=a+A/zPqNV3ezLmLJwJ9KwMVz9r/GR+Y7Cz08wkNN3msPvl2pQ145LSq0
   y8K7+eiV8E08W7wN9XyYygxPfAK6IQcbCpwsZ/fCHcGnbl/ZkFmrrwSRz
   Dh9QTdyobKczEr4eZz4F67uMw8WNRzdzXZy2VhtwpnrvH3foZ15FXCJ9c
   jChWEoWPJlypWO6TgONXQQLxeeT9Nb8rxafwcBIaGMGuyUvtvJ4q4E6zS
   MMVxQYSq+DF4Ik2gKytkWkvTeqLxTtSDLRQXKV41Cz9F5a8iAOY1wIc7L
   0Fom4jXyO4hI/c1OtKFTb2cJNQJr3swQtskpzDtj1XkXowQ5umivv+/L7
   w==;
X-IronPort-AV: E=Sophos;i="5.93,277,1654552800"; 
   d="scan'208";a="25901429"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Aug 2022 09:48:36 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 40419280056;
        Wed, 31 Aug 2022 09:48:36 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "tharvey@gateworks.com" <tharvey@gateworks.com>,
        Jun Li <jun.li@nxp.com>
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
Subject: RE: imx8mp USB OTG/dual-role
Date:   Wed, 31 Aug 2022 09:48:34 +0200
Message-ID: <1907644.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PA4PR04MB9640F578AEF2558BA3F08F8889789@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com> <DB9PR04MB8412164E22460736FB15B8D687789@DB9PR04MB8412.eurprd04.prod.outlook.com> <PA4PR04MB9640F578AEF2558BA3F08F8889789@PA4PR04MB9640.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi everybody,

Am Mittwoch, 31. August 2022, 05:11:38 CEST schrieb Jun Li:
> Hi,
> 
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
> > Estevam <festevam@denx.de>; Marcel Ziswiler
> > <marcel.ziswiler@toradex.com>;
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
> 
> The NXP datasheet for iMX8MP already changed the ID pin name to be with
> _DNU
 suffix, RM may be updated in next version.
> If legacy ID is going to be used, any normal GPIO function can be selected
> for it, extcon is well supported in dwc3 controller driver. 
> 
> More comments for Tim, see below...
> 
> 
> > 
> > 
> > BR
> > Jacky Bai
> > 
> > 
> > > Subject: imx8mp USB OTG/dual-role
> > >
> > >
> > >
> > > Greetings,
> > >
> > >
> > >
> > > I have an imx8mp board (imx8mp-venice-gw74xx) which has a DWC3 USB
> > > host controller using imx8mp PHY
> > > (drivers/phy/freescale/phy-fsl-imx8mq-usb.c fsl,imx8mp-usb-phy) and
> > > DWC3 host controller core (drivers/usb/dwc3/core.c snps,dwc3) with
> > > imx8mp glue (drivers/usb/dwc3/dwc3-imx8mp.c fsl,imx8mp-dwc3).
> > >
> > >
> > >
> > > One of the 2x USB 3.0 hosts is connected to a USB Type C connector
> > > using a
> > > TPS25821 USB power switch and config controller which handles the CC
> > > pins on and VBUS enable as well as drives the mux sel pin of a
> > > USB3 mux to route the USB SS pairs to the appropriate half of the Type
> > > C connector. This device has no I2C or other management bus - only
> > > VBUS, FAULT#, SINK#, and POL# outputs based on CC pins.
> > >
> > >
> > >
> > > I'm not clear how to describe this in the device-tree in order for it
> > > to function as a dual-role controller for host vs device mode.
> > >
> > >
> > >
> > > The TPS25821 has a FAULT# signal that routes to IMX8MP GPIO1_IO13
> > > pinmuxed as MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC and a SINK# signal
> > > that routes to IMX8MP GPIO1_IO10 pinmuxed as
> > > MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID. Additionally the VBUS output of
> > > the TPS25821 also connected to the TypeC VBUS pin routes to the IMX8MP
> > > USB1_VBUS pin.
> 
> 
> So TPS25821 does not need a driver.
> 
> 
> > >
> > >
> > > I've noticed there are currently only 2 other IMX8MP boards in Linux
> > > mainline that specify dr_mode="otg"; the DH electronics i.MX8M Plus
> > > DHCOM SOM (imx8mp-dhcom-som.dtsi), and the Toradex i.MX8M Plus Verdin
> > > SOM (imx8mp-verdin.dtsi). I'm not clear how these are hooked up or if
> > > USB dual-role work on these currently. I did notice that
> 
> 
> NXP iMX8MP EVK has not enabled type-C port due to the SS orientation
> switch binding is still in discussion, but you don't need a SW control
> in your case so you are okay here.
> 
> 
> > > imx8mp-verdin.dtsi looks like it does not enable the phy or core via
> > > status prop and uses invalid 'over-current-active-low' and
> > 
> > 'disable-over-current' dt props.
> > 
> > >
> > >
> > > I am currently using the following with imx8mp-venice-gw74xx:
> > >
> > >
> > >
> > > /* USB1 - Type C front panel */
> > > &usb3_phy0 {
> > > 
> > >         status = "okay";
> > > 
> > > };
> > >
> > >
> > >
> > > /* USB1 dwc3 glue */
> > > &usb3_0 {
> > > 
> > >         fsl,over-current-active-low;
> > >         status = "okay";
> > > 
> > > };
> > >
> > >
> > >
> > > /* USB1 dwc3 core */
> > > &usb_dwc3_0 {
> > > 
> > >         pinctrl-names = "default";
> > >         pinctrl-0 = <&pinctrl_usb1>;
> > >         dr_mode = "otg";
> > > 
> > > };
> > >
> > >
> > >
> > > &iomuxc {
> > > 
> > >         pinctrl_usb1: usb1grp {
> > >         
> > >                 fsl,pins = <
> > >
> > >
> > >
> > > MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC    0x140
> > >
> > >
> > >
> > > MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID    0x140
> > > 
> > >                 >;
> > >         
> > >         };
> > > 
> > > };
> > >
> > >
> > >
> > > And currently v6.0-rc2 enumerates the host controller even without a
> > > Type-C to host cable attached which tells me that OTG_ID isn't doing
> > > its job. I vaguely recall some confusing statements on the IMX
> > > community forum that these pins might not even be used on the IMX8MP.
> > >
> > >
> > >
> > > How should I be describing the device-tree for this scenario in order
> > > to get dual-role behavior?
> 
> 
> Could this dts work for you?
> 
> /* Config the "ID" pin iomux to be GPIO */
> 
> pinctrl_usb1: usb1grp {
>                  fsl,pins = <
>                       MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC    0x140
>                       MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10    0x140
> 
>           >;
> 
>  };
> 
>  extcon_usb: extcon_iddig {
>                  compatible = "linux,extcon-usb-gpio";                      
>                                                                            
>                               
 id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
>  };
> 
>  &usb_dwc3_0 {
>          pinctrl-names = "default";
>          pinctrl-0 = <&pinctrl_usb1>;
> 		 extcon = <&extcon_usb>
>          dr_mode = "otg";
>  };
> 
> Li Jun

I just send a patch for USB DR support on our TQMa8MPxL+MBa8MPxL platform, 
added Tim Harvey and Li Jun on CC. This is quite similar but uses usb-role-
switch instead of extcon.

Best regards,
Alexander



