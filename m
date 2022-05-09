Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D7351FA91
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 12:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiEIK5f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 06:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbiEIK5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 06:57:30 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B0B1D5739
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 03:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652093615; x=1683629615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A3194mi1GV+YG66HDRkh7GUfgk1ts6DfZLKUeb0FEhQ=;
  b=k7mQ8GZ8/Zxp2QWWqA0JZL+F9ZkqIFi/N9YXlrdGgarIN84+sMtp/etz
   KrXGU7gWCLEQ6yTKLFcLzN2EHyF3X25Uiqb+mh6FxHgj+PfJafYgIle1K
   N0498+0WEob1EsTj4t9UCfrim2lgITFJf8r9iQLYcQsvgPRlYoTC0c2xP
   1HH5/5R/cVwD0kMuLj6m0oS+7p7qzwMQGMqFPGPwCTLQO2YzNAktsYmG2
   U7JX9W9jAz+FG/XSCEqUO5h9K+9dcfZyCSC7MLpjOGoGwLh/G8Coh9vfw
   pW6JDWBPIo+ajKNTZfuB4Jz+RwZKu1F/IA5Dt1EmsL+1+CVjyOkZ+eeUi
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647298800"; 
   d="scan'208";a="23751530"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 May 2022 12:53:32 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 09 May 2022 12:53:32 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 09 May 2022 12:53:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1652093612; x=1683629612;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A3194mi1GV+YG66HDRkh7GUfgk1ts6DfZLKUeb0FEhQ=;
  b=nnJ1ZBhdQ8PbBKlHJ04avQMBy07AnjNV6UrjK4Q24f1fUO76d2DPCvuD
   wJs2enDDSkFcb31RTMgswrZUqpy0S96KCICpXau4HoaTKtjJN1JaQiuit
   QxzDqrflREk8I1BaqCSmh/clrVaOmj49VuVBgLfWJedK+7PTZX1eLqzFQ
   CMgaFvLPQTrYVLVVu1sKsZg/24jOm/2F0LBOPGmC47ZHUzpjA3ro2PAaF
   c1mo9ZKlD0AWvH3xtACA4tCZHtsxYSc1NBv5dv+20bO7qCN6/XwFlKton
   LbTw5lumrZSJ8vmsIi5jalzFdRlqrgMFdFx0QpbwKvIBxVM5fwD4OXCT0
   A==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647298800"; 
   d="scan'208";a="23751529"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 May 2022 12:53:31 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DDED9280070;
        Mon,  9 May 2022 12:53:30 +0200 (CEST)
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
Subject: (EXT) RE: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime pm for HSIC interface
Date:   Mon, 09 May 2022 12:53:30 +0200
Message-ID: <1793103.atdPhlSkOF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PA4PR04MB96402FC5407EE75EE77D27BF89C69@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com> <1792784.atdPhlSkOF@steina-w> <PA4PR04MB96402FC5407EE75EE77D27BF89C69@PA4PR04MB9640.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URI_HEX autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, 9. Mai 2022, 10:16:44 CEST schrieb Jun Li:
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: Friday, May 6, 2022 3:38 PM
> > To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> > <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
> > ci_hdrc_imx: disable runtime pm for HSIC interface
> >=20
> > Am Freitag, 6. Mai 2022, 09:09:22 CEST schrieb Jun Li:
> > > > -----Original Message-----
> > > > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > Sent: Wednesday, May 4, 2022 3:06 PM
> > > > To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> > > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> > > > Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> > > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB list
> > > > <linux-usb@vger.kernel.org>; linux-arm-kernel@lists.infradead.org
> > > > Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_i=
mx:
> > > > disable runtime pm for HSIC interface
> > > >=20
> > > > Helllo,
> > > >=20
> > > > Am Dienstag, 12. April 2022, 13:36:55 CEST schrieb Jun Li:
> > > > > > -----Original Message-----
> > > > > > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > > Sent: Monday, April 11, 2022 9:52 PM
> > > > > > To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
> > > > > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > > > > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
> > > > > > Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
> > > > > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > > > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB
> > > > > > list <linux-usb@vger.kernel.org>;
> > > > > > linux-arm-kernel@lists.infradead.org
> > > > > > Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
> > > > > > ci_hdrc_imx:
> > > > > > disable runtime pm for HSIC interface
> > > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
> > > > > > > > -----Original Message-----
> > > > > > > > From: Peter Chen <peter.chen@kernel.org>
> > > > > > > > Sent: Saturday, April 9, 2022 10:20 AM
> > > > > > > > To: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > > > > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > > > > > > > <gregkh@linuxfoundation.org>; Shawn Guo
> > > > > > > > <shawnguo@kernel.org>; Sascha Hauer
> > > > > > > > <s.hauer@pengutronix.de>; Fabio Estevam
> > > > > > > > <festevam@gmail.com>; Pengutronix Kernel Team
> > > > > > > > <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>;
> > > > > > > > USB list <linux-usb@vger.kernel.org>;
> > > > > > > > linux-arm-kernel@lists.infradead.org
> > > > > > > > Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
> > > > > > > > disable runtime pm for HSIC interface
> > > > > > > >=20
> > > > > > > > On 22-03-29 10:14:36, Alexander Stein wrote:
> > > > > > > > > Hello Peter,
> > > > > > > > >=20
> > > > > > > > > Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter=
=20
Chen:
> > > > > > > > > > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > > > > > > > > >=20
> > > > > > > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > > > > > > > With the add of power-domain support in commit
> > > > > > > > > > > 02f8eb40ef7b
> > > >=20
> > > > ("ARM:
> > > > > > > > dts:
> > > > > > > > > > > imx7s: Add power domain for imx7d HSIC") runtime
> > > > > > > > > > > suspend will disable the power-domain. This prevents
> > > > > > > > > > > IRQs to occur when a new device is attached on a
> > > > > > > > > > > downstream
> >=20
> > hub.
> >=20
> > > > > > > > > > > Signed-off-by: Alexander Stein
> > > > > > > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > > > > > > ---
> > > > > > > > > > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC
> > > > > > > > > > > link to mounted
> > > > > > > >=20
> > > > > > > > USB HUB
> > > > > > > >=20
> > > > > > > > > > > on usbh device. Cold plugging an USB mass storage
> > > > > > > > > > > device is working
> > > > > > > >=20
> > > > > > > > fine.
> > > > > > > >=20
> > > > > > > > > > > But once the last non-HUB device is disconnected the
> > > > > > > > > > > ci_hdrc device
> > > > > > > >=20
> > > > > > > > goes
> > > > > > > >=20
> > > > > > > > > > > into runtime suspend.
> > > > > > > > > >=20
> > > > > > > > > > Would you please show the difference between cold boot
> > > > > > > > > > and runtime suspend after disconnecting the last USB
> > > > > > > > > > device?
> > > > > > > > > >=20
> > > > > > > > > > - Power domain on/off status for HUB device
> > > > > > > > > > - Runtime suspend status at /sys entry for HUB device
> > > > > > > > > > - "/sys/..power/wakeup" /sys entry  for HUB device
> > > > > > > > >=20
> > > > > > > > > I hope I got all entries you requested.
> > > > > > > > >=20
> > > > > > > > > For reference this is the bus topology:
> > > > > > > > > lsusb -t
> > > > > > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub,
> > > > > > > > > Driver=3Dci_hdrc/1p, 480M
> > > > > > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub,
> > > > > > > > > Driver=3Dci_hdrc/1p, 480M
> > > > > > > > >=20
> > > > > > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p=
, 480M
> > > > > > > > >     |
> > > > > > > > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage,
> > > > > > > > >=20
> > > > > > > > > Driver=3Dusb-storage,
> > > > > > > >=20
> > > > > > > > 480M
> > > > > > > >=20
> > > > > > > > > Bus 2 is a different connector and doesn't matter here.
> > > > > > > > > I'm disconnecting
> > > > > > > >=20
> > > > > > > > 'Dev
> > > > > > > >=20
> > > > > > > > > 3' in this scenario.
> > > > > > > > >=20
> > > > > > > > > After boot up with the bus as shown above:
> > > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > > > > disabled
> > > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > > > > active
> > > > > > > > > $ cat
> > > > > > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > > > > on
> > > > > > > > >=20
> > > > > > > > > After disconnecting Dev 3 from the bus ('usb 1-1.2: USB
> > > > > > > > > disconnect, device number 3' in dmesg) the status changes
> > > > > > > > > as follows (without the patch):
> > > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > > > > disabled
> > > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > > > > suspended
> > > > > > > > > $ cat
> > > > > > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > > > > off-0
> > > > > > > > >=20
> > > > > > > > > For the record, when applying the posted patch this
> > > > > > > > > changes
> > > > > > > > > into:
> > > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > > > > > > > disabled
> > > > > > > > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > > > > > > > suspended
> > > > > > > > > $ cat
> > > > > > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > > > > on
> > > > > > > >=20
> > > > > > > > Okay, I think the problem here is the power domain for USB
> > > > > > > > controller is off at runtime, but USB controller/PHY needs
> > > > > > > > to detect the USB wakeup signal at runtime, so the USB
> > > > > > > > controller/PHY's power domain should be not off. The proper
> > > > > > > > change may keep power domain on at runtime, and the power
> > > > > > > > domain
> > > >=20
> > > > could be off at system suspend.
> > > >=20
> > > > > > > Can this "hsic phy power domain off breaks wakeup" be confirm=
ed?
> > > > > > > Like with some hack to move hsic phy power domain on some
> > > > > > > other device
> > > > > > > node:
> > > > > > >=20
> > > > > > > non-usb-node {
> > > > > > >=20
> > > > > > >         ...
> > > > > > >         power-domains =3D <&pgc_hsic_phy>;
> > > > > > >         status =3D "okay";
> > > > > > >=20
> > > > > > > };
> > > > > > >=20
> > > > > > > Just make sure this non-usb-node to be runtime active when do
> > > > > > > hsic hub test.
> > > > > >=20
> > > > > > Thanks for that suggestion. I apparently does work. Using the
> > > > > > this small patch
> > > > > >=20
> > > > > > --->8---
> > > > > > diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi
> > > > > > b/arch/arm/boot/dts/imx7- mba7.dtsi index
> > > > > > b05f662aa87b..cba2f9efa17e
> > > > > > 100644
> > > > > > --- a/arch/arm/boot/dts/imx7-mba7.dtsi
> > > > > > +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
> > > > > > @@ -580,6 +580,7 @@ &uart3 {
> > > > > >=20
> > > > > >         assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
> > > > > >         assigned-clock-parents =3D <&clks IMX7D_OSC_24M_CLK>;
> > > > > >         status =3D "okay";
> > > > > >=20
> > > > > > +       power-domains =3D <&pgc_hsic_phy>;
> > > > > >=20
> > > > > >  };
> > > > > > =20
> > > > > >  &uart4 {
> > > > > >=20
> > > > > > --->8---
> > > > > >=20
> > > > > > The HSIC power domain is also attached to to uart3.
> > > > > >=20
> > > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
> > > > > > /devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.se
> > > > > > rial /devices/platform/soc/30800000.bus/30b30000.usb
> > > > > > /devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
> > > > > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > on
> > > > > > $ echo on >
> > > > > > /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
> > > > > > 30880000.serial/power/control
> > > > > > $ lsusb -t
> > > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > > 480M
> > > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > > 480M
> > > > > >=20
> > > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > > > > >     |
> > > > > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=
=3D,
> > > > > >=20
> > > > > > 480M
> > > > > >=20
> > > > > > [USB
> > > > > >=20
> > > > > > disconnect] $ cat
> > > > > > /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > > > > on
> > > > >=20
> > > > > Just want to be sure this was done with hdrc imx runtime PM enabl=
ed.
> > > > >=20
> > > > > > [USB reconnect]
> > > > > > $ lsusb -t
> > > > > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > > 480M
> > > > > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p,
> > > > > > 480M
> > > > > >=20
> > > > > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > > > > >     |
> > > > > >         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=
=3D,
> > > > > >=20
> > > > > > 480M
> > > > > >=20
> > > > > > Hot plug detecting still works as you can see the USB device
> > > > > > number increased.
> > > > > >=20
> > > > > > For the records, there is no difference to this patch in
> > > > > > removing the power domain from USB HSIC device. I just wanted to
> > > > > > keep the diff small.
> > > > >=20
> > > > > This is good enough to confirm this, thanks.
> > > > >=20
> > > > > I don't have a HW with HSIC enabled for test, and I am not sure
> > > > > the initial state of power domain is on, can something like below
> > > > > deserve a
> > > >=20
> > > > try?
> > > >=20
> > > > > diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
> > > > > index
> > > > > 3cb123016b3e..f5467ef18e33 100644
> > > > > --- a/drivers/soc/imx/gpcv2.c
> > > > > +++ b/drivers/soc/imx/gpcv2.c
> > > > > @@ -416,6 +416,7 @@ static const struct imx_pgc_domain
> > > > > imx7_pgc_domains[] =3D { [IMX7_POWER_DOMAIN_USB_HSIC_PHY] =3D {
> > > > >=20
> > > > >                 .genpd =3D {
> > > > >                =20
> > > > >                         .name      =3D "usb-hsic-phy",
> > > > >=20
> > > > > +                       .flags     =3D GENPD_FLAG_RPM_ALWAYS_ON,
> > > > >=20
> > > > >                 },
> > > > >                 .bits  =3D {
> > > > >                =20
> > > > >                         .pxx =3D IMX7_USB_HSIC_PHY_SW_Pxx_REQ, @@
> > > > >=20
> > > > > -930,7
> > > > >=20
> > > > > +931,7 @@ static int imx_pgc_domain_probe(struct platform_device
> > > > > *pdev) regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
> > > > > domain->bits.map, domain->bits.map);
> > > > >=20
> > > > > -       ret =3D pm_genpd_init(&domain->genpd, NULL, true);
> > > > > +       ret =3D pm_genpd_init(&domain->genpd, NULL,
> > > > > + !(domain->genpd.flags &
> > > > > GENPD_FLAG_RPM_ALWAYS_ON)); if (ret) {
> > > > >=20
> > > > >                 dev_err(domain->dev, "Failed to init power
> > > > >                 domain\n");
> > > > >                 goto out_domain_unmap;
> > > >=20
> > > > This does indeed the trick. But AFAICS the downside is that the
> > > > powerdomain is enabled, even if USB is not used. Not sure if this is
> > > > acceptable though.
> > >=20
> > > I think GENPD_FLAG_RPM_ALWAYS_ON is the right thing to do if the HSIC
> > > port need the power domain on to detect remote wakeup, what's the
> > > exact meaning of "USB is not used"?
> >=20
> > Exactly, GENPD_FLAG_RPM_ALWAYS_ON is the right thing to to iff the HSIC
> > port needs the powerdomain. But what about the case when HSIC is not
> > enabled at all? That's what I meant by "USB is not used".
> > AFAICS setting GENPD_FLAG_RPM_ALWAYS_ON enables the powerdomain
> > unconditionally from any user.
>=20
> If HSIC is not enabled at all, seems the power domain of it will not be
> touched by kernel, so there maybe mismatch between the actual HW state and
> the SW state, but this is another topic.
>=20
> For this HSIC case, a second thought I think the better solution maybe
> correct the power domain to its right user, since this power domain
> is for phy, so:
>=20
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 008e3da460f1..039eed79d2e7 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -120,6 +120,7 @@ usbphynop3: usbphynop3 {
>                 compatible =3D "usb-nop-xceiv";
>                 clocks =3D <&clks IMX7D_USB_HSIC_ROOT_CLK>;
>                 clock-names =3D "main_clk";
> +               power-domains =3D <&pgc_hsic_phy>;
>                 #phy-cells =3D <0>;
>         };
>=20
> @@ -1153,7 +1154,6 @@ usbh: usb@30b30000 {
>                                 compatible =3D "fsl,imx7d-usb",
> "fsl,imx27-usb"; reg =3D <0x30b30000 0x200>;
>                                 interrupts =3D <GIC_SPI 40
> IRQ_TYPE_LEVEL_HIGH>; -                               power-domains =3D
> <&pgc_hsic_phy>;
>                                 clocks =3D <&clks IMX7D_USB_CTRL_CLK>;
>                                 fsl,usbphy =3D <&usbphynop3>;
>                                 fsl,usbmisc =3D <&usbmisc3 0>;
>=20
> Could you please try if this can work for you as well?

This does indeed work as well. If you both disable 'usbh' and 'usbphynop3',=
=20
the power domain is switched off as well.
I'll create a proper patch for this.

Alexander



