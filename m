Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B13C172EE3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 03:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbgB1Cve (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 21:51:34 -0500
Received: from mail-eopbgr60089.outbound.protection.outlook.com ([40.107.6.89]:21836
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726943AbgB1Cve (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 21:51:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFH0mB7NqWYDHTidTfFWlma8apNXJn5L313go6brMhXfkYx/8SWwSWYVvldCwExyCcqiWRr92BAbXvZbFARgRYDuCL9+p4DGm6fO6IICpULCgjagw3swPChMGbN5tZRC8ijVzo6YquiJn+ryMa5z2oOBy8keFPOspeFwrEsNfC2hiX7MzzCLGFQDc0TEWCo4n2TKGwtRAYDZ9nvTaRVjYJctG3kQVf9ALO/8LEjYHEVNuCM5+NBVie7wx4F8pv8so3CLZxYFbe96/BNCatuMnec+feX4dKCneiNGrY5ZpD22qK7uuf6mz9n0bVxyBJbZwkmo7smKlqc5Aigp5jt7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vefV7JIMZQzPKgcQQtF7kpV9MTt6BXX8haC3ia8RvUI=;
 b=iorL+4qAjQdbi4xZ7YcqJLrU5+cddcogCnZBqZslDk1592DkZByKLCosK5kV34EvS4rmRW5ph//W8sxt+n5Nr0o3cg1O6eP68Qz4VbqAR06NML0+N5n0P13gGh5X8kKHhrmLpQ3z9ZzqJgpUVqmYnVO+Cg0MX08JK5GpMtHqYRz9f6agDMDyVdH4CHrPU1sKpdMmiMIKmkstfYkztoo99sXioSx3ObNEwTsJYsbGjDGh7Q8TSXhHePhRLpSJK74CuOrUuMVr+D1e0tTvWqNILB1Wa0YVFO9Jg9bA5jfgT3gxgWodSBGN53yj6NejkrwefjFguOOZrZutQfJnXzNolg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vefV7JIMZQzPKgcQQtF7kpV9MTt6BXX8haC3ia8RvUI=;
 b=s49NSOGYGmnZC0e1PMyZzCTk1uH+Js5KEx1+CMTzeiRpJd19zHHZKFMgQZnVesKQX4bl+yjWhfOHOfBRT4sljsjj7KZlSvdK/JQP+dGhybsZ4w/8uecyXD9HhalluJ4xk48GxkIPVsmnZdTodsBpXO0fxBgYb8DhYrrhmeGM6uI=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5822.eurprd04.prod.outlook.com (20.178.125.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 28 Feb 2020 02:51:28 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Fri, 28 Feb 2020
 02:51:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
CC:     "jun.li@freescale.com" <jun.li@freescale.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Topic: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Thread-Index: AQHV7VqVZ4BeDr6e5UuTM5ZPfBO9kqgu5JsAgAAEwYCAAAyagIAABoeAgAAFTBCAABreAIAAzJeA
Date:   Fri, 28 Feb 2020 02:51:27 +0000
Message-ID: <20200228025129.GA31815@b29397-desktop>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
 <20200227111838.GA24071@b29397-desktop>
 <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
 <20200227122045.GB24071@b29397-desktop>
 <20200227124406.6kbgu3dbru4qmews@pengutronix.de>
 <VI1PR04MB53270541BB66CAB1EB8F00008BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20200227143914.mi3vsltrtyo5sqed@pengutronix.de>
In-Reply-To: <20200227143914.mi3vsltrtyo5sqed@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e7c3a1a8-b33d-4a9d-c4f9-08d7bbf91b9e
x-ms-traffictypediagnostic: VI1PR04MB5822:|VI1PR04MB5822:|VI1PR04MB5822:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB582272056118CA706905A19B8BE80@VI1PR04MB5822.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(199004)(189003)(5660300002)(8936002)(8676002)(66446008)(81166006)(66946007)(91956017)(66476007)(33656002)(53546011)(66556008)(2906002)(76116006)(44832011)(6506007)(966005)(186003)(26005)(64756008)(33716001)(45080400002)(478600001)(4001150100001)(6916009)(4326008)(71200400001)(6486002)(316002)(81156014)(86362001)(1076003)(54906003)(6512007)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5822;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ndk8f9MuYIUyD2Z7L0yoayLPyDSTe8/n+8P/yq0IQnp9gTHxLHAds0GgvYyztkbtmtuLRPHOoxjeb2ozdbdPlajuIXdnOLLNy5o8EadAy7ZQar+jMJkq69d4ethRcfNsqZNH73g0Aqmy1v7MIp+tNDXdZHIAenhr/2aCra8UjgAGuAZO2E7uBQmc16ebRXzHlO7EhWkt5/KbUc5cqYGm5/IVbso/NgmH/SToUvLD/vuq3C8/zUE8jcMbHoTrFTEJqxpbxmCTLRGm+DYtER8+mWcnzxYsoaIz/l/lbi4R/XOpJWkfpcb8qVxKvN5wyW3hNUf9UBS89xjNaLFCo8fmnaEAyhvzBsshdiSPu98He0l9RV6bI9ELvhDcum1yX2vQQCzYnrJ98gtGoa+cZN1kKpuDJHViysBzE0lu1bob4lv4QBntoWKODlqMJgLmRMy8l3crvHmD8agHKjZ2uROqyULGfGukH8i/aE0LoYt4TEpsXK+46hrNQQ+vSVmDQouuW9G4LWKCs6qvhh/rHuETWw==
x-ms-exchange-antispam-messagedata: oPWaQimnAjNbMILknoaVainhlYOuCWCxTmLBwQS44FtNIYUzarRZt4jueFmvp1Iomc12PkP87mzfroTSyhdBNnAh0wsFnH9ibf3Ry+lJ/4QGntjQxTPD1YPXyrt6Hf54VqTW/Wa0R6TUGeDux4ql+w==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <34BA4C0A29E36F41AE3E26B98E9B53C0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c3a1a8-b33d-4a9d-c4f9-08d7bbf91b9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 02:51:27.9606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTXLFoJKUFd/gfR9rOBHUBQvdu5V5wXq2vIb3K7xYr+MZljTV3MOXSL9ov5ZNrZvVzx+gkiB52BFFpgQVgWdOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5822
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-02-27 15:39:14, Marco Felsch wrote:
> Hi Peter,
>=20
> On 20-02-27 13:30, Peter Chen wrote:
> >  =20
> > > > >
> > > > > Note, I'm using a imx6q which has the CI_HDRC_TURN_VBUS_EARLY_ON =
set.
> > > > >
> > > >
> > > > Do you have a VBUS regulator at your dts, and add it at controller'=
s
> > > > node? See: arch/arm/boot/dts/imx6qdl-sabresd.dtsi as an example ple=
ase?
> > >=20
> > > Yes, that's my use case too.
> > >=20
> > > > If you have set CI_HDRC_TURN_VBUS_EARLY_ON, the VBUS is controlled =
by
> > > > chipidea driver, not by USB core through PORTSC.PP (ehci_ci_portpow=
er).
> > >=20
> > > I know, pls have a look my the patches.
> > >=20
> > > I had the problem that the vbus regulator wasn't turned off during a
> > > suspend/resume logic. The first issue within the usb-core should be f=
ixed by [1] (v2
> > > RFC is on the way). You never run in that case if you don't fix this.=
 After I fixed it
> > > the port-power is called during suspend but obviously the regulator d=
idn't get turned
> > > off because we don't add it to the priv->reg_vbus.
> > >=20
> > > This patchset should fix this and get rid of the CI_HDRC_TURN_VBUS_EA=
RLY_ON
> > > flag.
> > >=20
> > =20
> > Hi Marco,
> >=20
> > I may understand your case now. At old USB port design, the VBUS is nev=
er allowed to
> > turned off to response the USB wakeup event. But the expected behavior =
has changed
> > after pm_qos_no_power_off is introduced for USB port, it is allowed the=
 port is powered off.
>=20
> Luckily we have git :) and I my archeological findings are:
>=20
>  0ero Patch 2012-07-07) 1530280084c3 usb: chipidea: add imx platform driv=
er
>  1st  Patch 2012-10-23) ae0fb4b72c8d PM / QoS: Introduce PM QoS device fl=
ags support
>  2nd  Patch 2013-01-23) ad493e5e5805 usb: add usb port auto power off mec=
hanism
>  3th  Patch 2014-10-13) 11a7e5940514 usb: ehci: add ehci_port_power inter=
face
>  4th  Patch 2014-10-13) c8679a2fb8de usb: chipidea: host: add portpower o=
verride
>  5th  Patch 2015-02-11) 6adb9b7b5fb6 usb: chipidea: add a flag for turn o=
n vbus early for host
>  6th  Patch 2015-02-11) 659459174188 usb: chipidea: host: turn on vbus be=
fore add hcd if early vbus on is required
>=20
> A few more details:
> - Since day 0 the imx chipidea driver supports the regulator but it was
>   only used to turn it on (0ero Patch). Later the regulator support was
>   shifted to the core and optional.
> - 1-2 Patch added the pm_qos_no_power_off support
> - 3-4 Patch adds the support to disable the regulator
> - 5-6 Patch adding a workaround for patches 3-4 which breaks the
>   regulator power-off support.
>=20

Thanks for tracking it so detail.

1-2: pm_qos_no_power_off is default on, and it is a standard USB working
way. In fact, no customer mentioned that before, and even for me, it is
the first time to try it.
3-4: It is not adding support for gpio-base VBUS control for chipidea,
it lets the USB core control the VBUS instead of controller driver.
5-6: With patch 3-4 introduced, we found issues at imx6 series SoCs
(see detail at the last reply), so we add quirk for imx6.

> So as you can see the pm_qos_no_power_off was introduced before the gpio
> regulator vbus power-off support was added.
>=20

Like I said it is default off, we don't know there is such feature
at kernel. In my mind, the VBUS is never off for host.

> > PORTSC.PP could be controlled by USB core, but USB VBUS's power is not =
controlled
> > by this bit if the VBUS power enable pin is configured as GPIO function=
, that is your case.
>=20
> Yep I know :)
>=20
> > CI_HDRC_TURN_VBUS_EARLY_ON is introduced by fixing a bug that some i.mx=
 USB
> > controllers PHY's power is sourced from VBUS, the PHY's power need to b=
e on before
> > touch some ehci registers, otherwise, the USB signal will be wrong at s=
ome low speed
> > devices use case. So, this flag can't be deleted, it may cause regressi=
on.
>=20
> Pls check my archeological findings and again pls check my patches. I
> deleted the flag because isn't required anymore afterwards.

I have already checked your patch, your patch deletes CI_HDRC_TURN_VBUS_EAR=
LY_ON
quirk, and it may cause regression.

>=20
> > The solution I see is your may need to implement chipidea VBUS control =
flow by considering
> > pm_qos_no_power_off at suspend situation. You may add .suspend API for =
ci_role_driver,
> > and called by ci_controller_suspend/ci_controller_resume, of cos, bette=
r solution is welcome.
>=20
> I fixed it within the core [1] and here at the chipidea side.
>=20
> [1] https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
kml.org%2Flkml%2F2020%2F2%2F27%2F669&amp;data=3D02%7C01%7Cpeter.chen%40nxp.=
com%7Cad9b3833ae2f433d93ef08d7bb92d4a0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7=
C0%7C0%7C637184111614326500&amp;sdata=3DSPwwBEGBco6IdP8ufmAnJeeRxuAXGLa0xzY=
lzFA%2FAvg%3D&amp;reserved=3D0
>=20
> You will never enter the ehci_ci_portpower() during suspend without [1]
> if you are using a vanilla kernel. So IMHO this case can't be tested,
> sorry.
>=20

Through set pm_qos_no_power_off as 0, the VBUS will be off. You
never need to call .ehci_ci_portpower again. You may try my second
suggestion for fix chipidea issue. I will reply your RFC patch for
USB core.

--=20

Thanks,
Peter Chen=
