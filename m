Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 363D05197DC
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 09:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343940AbiEDHKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 03:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiEDHKF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 03:10:05 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89BC22BF9
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 00:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651647990; x=1683183990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U56Xdui1Y4qWTIdCeiZPdOC0g2FZ4q0LRmDk0czs5RA=;
  b=MbNso2igTL3vnCIvVZdhuR+n8XyBwTXfovEkql4o1OV8L8SauI77ix/d
   Qcv69z/g29dnzuov1zJ4Uov64Ehk1d8+aDzco6IaVP1SuZBCD0BjYwAs8
   STSIdlujTS/Pgh5PVIXNm2PC7HcZcQB+ebtrJtPNmx0b7i+GG4I9pw/Pc
   Qp45EB8M0QbFP/GDrvQHT+jMi1aGtIrFX/nZz/Q7mGadrCzsk3YP6ASXw
   1pb7dy11lGHm812t0KcfR7R2aBEYm7ztlxlDusItFUY7atQ/3ktXskcUA
   sjrtoMgk4qGQGmNUIeUgtYIfa2uH0AXKAIgKNQ60wou+w9qVRp62YKU2r
   w==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647298800"; 
   d="scan'208";a="23655763"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 May 2022 09:06:27 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 04 May 2022 09:06:27 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 04 May 2022 09:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651647987; x=1683183987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U56Xdui1Y4qWTIdCeiZPdOC0g2FZ4q0LRmDk0czs5RA=;
  b=DJH6e+qPGYuXAU6X788ViSn8xgWg+y/MRPAmFSfbMl1WEN+duYIkR99e
   zMNBoRp+36zBccH/RJPN6AFHuq6HYaVBFvMGuzyjJhSxaCEnERyBQXx83
   0y/gUEKeaO9s4c71Na/zwL0FBIQyCsrj8SRcye2qn9NlA9S0YOjdk3nwi
   vOgjbJnJ1rv1outlfRNZgQzeoB/tm07u+5FAL8pN0Uj5M+Zz1V7n57Gxt
   swt27zRaCPQbe8kW9Y26YtGPn4QK/1tuD4uZ4ZRiQ3MaifaXJ00Trrzvc
   iymw8W8GYqNtIZ6NmmhnKwUCW3P+qhRhfsgsbhFbqLgF/WATSt00OsWZ9
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647298800"; 
   d="scan'208";a="23655762"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 May 2022 09:06:27 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 764AC280070;
        Wed,  4 May 2022 09:06:27 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Peter Chen <peter.chen@kernel.org>, Jun Li <jun.li@nxp.com>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime pm for HSIC interface
Date:   Wed, 04 May 2022 09:06:25 +0200
Message-ID: <5566202.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <VI1PR04MB4333D96588BDAB546B61EADF89ED9@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com> <1911252.usQuhbGJ8B@steina-w> <VI1PR04MB4333D96588BDAB546B61EADF89ED9@VI1PR04MB4333.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Helllo,

Am Dienstag, 12. April 2022, 13:36:55 CEST schrieb Jun Li:
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: Monday, April 11, 2022 9:52 PM
> > To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> > <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
> > disable runtime pm for HSIC interface
> >=20
> > Hi,
> >=20
> > Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
> > > > -----Original Message-----
> > > > From: Peter Chen <peter.chen@kernel.org>
> > > > Sent: Saturday, April 9, 2022 10:20 AM
> > > > To: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> > > > Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB list
> > > > <linux-usb@vger.kernel.org>; linux-arm-kernel@lists.infradead.org
> > > > Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable
> > > > runtime pm for HSIC interface
> > > >=20
> > > > On 22-03-29 10:14:36, Alexander Stein wrote:
> > > > > Hello Peter,
> > > > >=20
> > > > > Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter Chen:
> > > > > > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > > > > >=20
> > > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > > > With the add of power-domain support in commit 02f8eb40ef7b=20
("ARM:
> > > > dts:
> > > > > > > imx7s: Add power domain for imx7d HSIC") runtime suspend will
> > > > > > > disable the power-domain. This prevents IRQs to occur when a
> > > > > > > new device is attached on a downstream hub.
> > > > > > >=20
> > > > > > > Signed-off-by: Alexander Stein
> > > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > > ---
> > > > > > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to
> > > > > > > mounted
> > > >=20
> > > > USB HUB
> > > >=20
> > > > > > > on usbh device. Cold plugging an USB mass storage device is
> > > > > > > working
> > > >=20
> > > > fine.
> > > >=20
> > > > > > > But once the last non-HUB device is disconnected the ci_hdrc
> > > > > > > device
> > > >=20
> > > > goes
> > > >=20
> > > > > > > into runtime suspend.
> > > > > >=20
> > > > > > Would you please show the difference between cold boot and
> > > > > > runtime suspend after disconnecting the last USB device?
> > > > > >=20
> > > > > > - Power domain on/off status for HUB device
> > > > > > - Runtime suspend status at /sys entry for HUB device
> > > > > > - "/sys/..power/wakeup" /sys entry  for HUB device
> > > > >=20
> > > > > I hope I got all entries you requested.
> > > > >=20
> > > > > For reference this is the bus topology:
> > > > > lsusb -t
> > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, =
480M
> > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, =
480M
> > > > >=20
> > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > > > >     |
> > > > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage,
> > > > >=20
> > > > > Driver=3Dusb-storage,
> > > >=20
> > > > 480M
> > > >=20
> > > > > Bus 2 is a different connector and doesn't matter here. I'm
> > > > > disconnecting
> > > >=20
> > > > 'Dev
> > > >=20
> > > > > 3' in this scenario.
> > > > >=20
> > > > > After boot up with the bus as shown above:
> > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > disabled
> > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > active
> > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > on
> > > > >=20
> > > > > After disconnecting Dev 3 from the bus ('usb 1-1.2: USB
> > > > > disconnect, device number 3' in dmesg) the status changes as
> > > > > follows (without the patch):
> > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > disabled
> > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > suspended
> > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > off-0
> > > > >=20
> > > > > For the record, when applying the posted patch this changes into:
> > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > disabled
> > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > suspended
> > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > on
> > > >=20
> > > > Okay, I think the problem here is the power domain for USB
> > > > controller is off at runtime, but USB controller/PHY needs to detect
> > > > the USB wakeup signal at runtime, so the USB controller/PHY's power
> > > > domain should be not off. The proper change may keep power domain on
> > > > at runtime, and the power domain could be off at system suspend.
> > >=20
> > > Can this "hsic phy power domain off breaks wakeup" be confirmed?
> > > Like with some hack to move hsic phy power domain on some other device
> > > node:
> > >=20
> > > non-usb-node {
> > >=20
> > >         ...
> > >         power-domains =3D <&pgc_hsic_phy>;
> > >         status =3D "okay";
> > >=20
> > > };
> > >=20
> > > Just make sure this non-usb-node to be runtime active when do hsic hub
> > > test.
> >=20
> > Thanks for that suggestion. I apparently does work. Using the this small
> > patch
> >=20
> > --->8---
> > diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi b/arch/arm/boot/dts/imx7-
> > mba7.dtsi index b05f662aa87b..cba2f9efa17e 100644
> > --- a/arch/arm/boot/dts/imx7-mba7.dtsi
> > +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> > @@ -580,6 +580,7 @@ &uart3 {
> >=20
> >         assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
> >         assigned-clock-parents =3D <&clks IMX7D_OSC_24M_CLK>;
> >         status =3D "okay";
> >=20
> > +       power-domains =3D <&pgc_hsic_phy>;
> >=20
> >  };
> > =20
> >  &uart4 {
> >=20
> > --->8---
> >=20
> > The HSIC power domain is also attached to to uart3.
> >=20
> > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
> > /devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.serial
> > /devices/platform/soc/30800000.bus/30b30000.usb
> > /devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
> > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > on
> > $ echo on > /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
> > 30880000.serial/power/control
> > $ lsusb -t
> > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> >=20
> >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> >     |
> >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3D, 480M =
[USB
> >=20
> > disconnect] $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > on
>=20
> Just want to be sure this was done with hdrc imx runtime PM enabled.
>=20
> > [USB reconnect]
> > $ lsusb -t
> > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> >=20
> >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> >     |
> >         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3D, 480M
> >=20
> > Hot plug detecting still works as you can see the USB device number
> > increased.
> >=20
> > For the records, there is no difference to this patch in removing the
> > power
> > domain from USB HSIC device. I just wanted to keep the diff small.
>=20
> This is good enough to confirm this, thanks.
>=20
> I don't have a HW with HSIC enabled for test, and I am not sure the initi=
al
> state of power domain is on, can something like below deserve a try?
>=20
> diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
> index 3cb123016b3e..f5467ef18e33 100644
> --- a/drivers/soc/imx/gpcv2.c
> +++ b/drivers/soc/imx/gpcv2.c
> @@ -416,6 +416,7 @@ static const struct imx_pgc_domain imx7_pgc_domains[]=
 =3D
> { [IMX7_POWER_DOMAIN_USB_HSIC_PHY] =3D {
>                 .genpd =3D {
>                         .name      =3D "usb-hsic-phy",
> +                       .flags     =3D GENPD_FLAG_RPM_ALWAYS_ON,
>                 },
>                 .bits  =3D {
>                         .pxx =3D IMX7_USB_HSIC_PHY_SW_Pxx_REQ,
> @@ -930,7 +931,7 @@ static int imx_pgc_domain_probe(struct platform_device
> *pdev) regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
> domain->bits.map, domain->bits.map);
>=20
> -       ret =3D pm_genpd_init(&domain->genpd, NULL, true);
> +       ret =3D pm_genpd_init(&domain->genpd, NULL, !(domain->genpd.flags=
 &
> GENPD_FLAG_RPM_ALWAYS_ON)); if (ret) {
>                 dev_err(domain->dev, "Failed to init power domain\n");
>                 goto out_domain_unmap;

This does indeed the trick. But AFAICS the downside is that the powerdomain=
 is=20
enabled, even if USB is not used. Not sure if this is acceptable though.

Alexander



