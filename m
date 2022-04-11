Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3F34FBDCD
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 15:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbiDKNyq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 09:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346739AbiDKNyp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 09:54:45 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F05B22A
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649685150; x=1681221150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uVCp9lbl3DacKwiMLAKk56VKwcGscxXB3PdLEPb/B6g=;
  b=ljrrldsJRzWl0J+2KQZWDVrxLeZ1xkmsN0Bxkm9ZYipt1bEo8aK16vGj
   +oSHX18vaBhPStlCVS743tR6OGX+i68MlAFCMCaNaQ9uRLDX+oleLfozw
   Rg+QhXfeImWsh0t1kwiohO5FOmFdMcotl7PdVCMwEGuEaRuKt5KGbJhNf
   rL/NU3T/Mb2rxsDL7Q9o0U9+A+ri6D/OGDBsQTIjvPCHr7TJ9dzss+5wj
   yl17iR7A/HXbP0ROg63VqZycmlalcjdN5Z0d9zjX6qqHbYTX8sWegEpUA
   mwFREgLM9zjPxaxeH3ioY9cf8yt3qUYyY0nr59gliAXYNO4r1wSA3D5C1
   A==;
X-IronPort-AV: E=Sophos;i="5.90,252,1643670000"; 
   d="scan'208";a="23225291"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2022 15:52:28 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Apr 2022 15:52:28 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Apr 2022 15:52:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649685148; x=1681221148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uVCp9lbl3DacKwiMLAKk56VKwcGscxXB3PdLEPb/B6g=;
  b=kuSKUmDZbUY3EYO+XPezpWqNRNIygz1gNqR6zMjCYdHnAz3aqiabQHlh
   1L/qG9vSN2Pmpe4QCKCtu5i8cejmvIdngn/zGkEeDUevuTy5hkF/IXH68
   eG/5qPGdX8V8P0PUSWXJFQS50xlfX+3jYzTvb4TdQpWRa0YOysPCp6zbv
   f1yJ8/SDp5A1Yv35Iq3BUYyaUr0S7Zrs3yDQ7ZLQfh4JQDUoTCV73eLku
   tlXcnBV9U2/DNrvYnFvZ4iNgtGXkhPIvA2bpZz9qwqwgIHcP3okCzTXTk
   5PGDhSQuCeyq2funxYLY7UGs4xYtjLieW/hx5sP9eDjF6ofCrfpC6ehLH
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,252,1643670000"; 
   d="scan'208";a="23225290"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Apr 2022 15:52:28 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 59A55280070;
        Mon, 11 Apr 2022 15:52:28 +0200 (CEST)
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
Date:   Mon, 11 Apr 2022 15:52:27 +0200
Message-ID: <1911252.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <AM6PR04MB43268743D6321FBCF6A5169F89E89@AM6PR04MB4326.eurprd04.prod.outlook.com>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com> <20220409021948.GA3618@Peter> <AM6PR04MB43268743D6321FBCF6A5169F89E89@AM6PR04MB4326.eurprd04.prod.outlook.com>
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

Hi,

Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
> > -----Original Message-----
> > From: Peter Chen <peter.chen@kernel.org>
> > Sent: Saturday, April 9, 2022 10:20 AM
> > To: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
> > <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable
> > runtime pm for HSIC interface
> >=20
> > On 22-03-29 10:14:36, Alexander Stein wrote:
> > > Hello Peter,
> > >=20
> > > Am Dienstag, 15. M=E4rz 2022, 02:23:23 CEST schrieb Peter Chen:
> > > > On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
> > > >=20
> > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > With the add of power-domain support in commit 02f8eb40ef7b ("ARM:
> > dts:
> > > > > imx7s: Add power domain for imx7d HSIC") runtime suspend will
> > > > > disable
> > > > > the power-domain. This prevents IRQs to occur when a new device is
> > > > > attached
> > > > > on a downstream hub.
> > > > >=20
> > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > ---
> > > > > Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to mounted
> >=20
> > USB HUB
> >=20
> > > > > on usbh device. Cold plugging an USB mass storage device is worki=
ng
> >=20
> > fine.
> >=20
> > > > > But once the last non-HUB device is disconnected the ci_hdrc devi=
ce
> >=20
> > goes
> >=20
> > > > > into runtime suspend.
> > > >=20
> > > > Would you please show the difference between cold boot and runtime
> > > > suspend after disconnecting
> > > > the last USB device?
> > > >=20
> > > > - Power domain on/off status for HUB device
> > > > - Runtime suspend status at /sys entry for HUB device
> > > > - "/sys/..power/wakeup" /sys entry  for HUB device
> > >=20
> > > I hope I got all entries you requested.
> > >=20
> > > For reference this is the bus topology:
> > > lsusb -t
> > > /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > > /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
> > >=20
> > >     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
> > >     |
> > >         |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3Dusb-s=
torage,
> >=20
> > 480M
> >=20
> > > Bus 2 is a different connector and doesn't matter here. I'm
> > > disconnecting
> >=20
> > 'Dev
> >=20
> > > 3' in this scenario.
> > >=20
> > > After boot up with the bus as shown above:
> > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > disabled
> > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > active
> > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > on
> > >=20
> > > After disconnecting Dev 3 from the bus ('usb 1-1.2: USB disconnect,
> > > device
> > > number 3' in dmesg) the status changes as follows (without the patch):
> > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > disabled
> > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > suspended
> > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > off-0
> > >=20
> > > For the record, when applying the posted patch this changes into:
> > > $ cat /sys/bus/usb/devices/1-1/power/wakeup
> > > disabled
> > > $ cat /sys/bus/usb/devices/1-1/power/runtime_status
> > > suspended
> > > $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
> > > on
> >=20
> > Okay, I think the problem here is the power domain for USB controller is
> > off at runtime, but USB controller/PHY needs to detect the USB wakeup
> > signal at runtime, so the USB controller/PHY's power domain should be
> > not off. The proper change may keep power domain on at runtime, and the
> > power domain could be off at system suspend.
>=20
> Can this "hsic phy power domain off breaks wakeup" be confirmed?
> Like with some hack to move hsic phy power domain on some other device
> node:
>=20
> non-usb-node {
>         ...
>         power-domains =3D <&pgc_hsic_phy>;
>         status =3D "okay";
> };
>=20
> Just make sure this non-usb-node to be runtime active when
> do hsic hub test.

Thanks for that suggestion. I apparently does work. Using the this small pa=
tch

=2D-->8---
diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi b/arch/arm/boot/dts/imx7-
mba7.dtsi
index b05f662aa87b..cba2f9efa17e 100644
=2D-- a/arch/arm/boot/dts/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/imx7-mba7.dtsi
@@ -580,6 +580,7 @@ &uart3 {
        assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
        assigned-clock-parents =3D <&clks IMX7D_OSC_24M_CLK>;
        status =3D "okay";
+       power-domains =3D <&pgc_hsic_phy>;
 };
=20
 &uart4 {
=2D-->8---

The HSIC power domain is also attached to to uart3.

$ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
/devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.serial
/devices/platform/soc/30800000.bus/30b30000.usb
/devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
$ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
on
$ echo on > /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
30880000.serial/power/control
$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 2: Dev 3, If 0, Class=3DMass Storage, Driver=3D, 480M
[USB disconnect]
$ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
on
[USB reconnect]
$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dci_hdrc/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3D, 480M

Hot plug detecting still works as you can see the USB device number increas=
ed.

=46or the records, there is no difference to this patch in removing the pow=
er=20
domain from USB HSIC device. I just wanted to keep the diff small.

Best regards,
Alexander



