Return-Path: <linux-usb+bounces-5841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BBC848B91
	for <lists+linux-usb@lfdr.de>; Sun,  4 Feb 2024 07:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4E6328528A
	for <lists+linux-usb@lfdr.de>; Sun,  4 Feb 2024 06:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAC07494;
	Sun,  4 Feb 2024 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="rnZ6QNiI"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2043.outbound.protection.outlook.com [40.107.8.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C779CC;
	Sun,  4 Feb 2024 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707028966; cv=fail; b=ghXYq7od/gzNUfYDF6wF2fDQLPy7a90B4kVON2TKh1Of5sG3RgXxFgoYj6AQzgBbnbw2fa3EMze6e6EAoN5F+kYKea9GLHfHopltRdBPQm9eSQzA+NPN5xaavwz1eCN/U+GGsDF9/YiDGIkvEOjvkv69als0kr+AebBj52wqZvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707028966; c=relaxed/simple;
	bh=avKzmcqLhRat6TutbtlfKozlwFLssi/5mxxiKB5rxAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SPnMGDOY//7ZDYu6+OazDT4G9ZP02RpD9hrgTY5xIvzfP7J7T1sgtQ17n9c7mLsRpueXA4hRJ41feGDm84KOb/hh8jpl4oA6C1TMmmp+Shv5M7G00MFqrec+Q5KQtYPwa+8pLqQCtg5sqtruaERw/JQLU8UOSjwNuZ+6bV4z+pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=rnZ6QNiI; arc=fail smtp.client-ip=40.107.8.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meml3meqwqo2NPpx4YlK507fq1N4q544LZgPMU8/89he0xxXgM4rlfUN3tbcybH3W+EtVEQzDYk5nhhUiV1FKmUfYOPIwwYwaEIosqSP5lSNjIaQJ+6aUsuixwvhutl/ilDI775z5dDX7Kqg91jkK9oijiKK44+QIFVaDStzEagZvB0FE/4DTL18ZFyCrHwRaI9ZMdTparo9J5Avjlhs7aKOYyxhUxo9ybh1a1XVc8dD3InB+JNC09VqE+CybL0L76guNZVwcEPgNVCKK26Y6q51AjzpInMbNM6Tm30eXo+Hg3rMHP0qRpVzg9IrytTuYsL6UV4WdWBlRKvOuO3aTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCK14bspbvw818w/eaWJ7+3bZXaSrw8CRcb2pTpo6Cs=;
 b=U1gTuEt/X0EC7A/6yiVb9ajGHabkdZW0AcUp+75I8reEoy6Jy5WuCMVAg2sTJaG4cPoIuy+1Hque27P7ONaihgy9t3Rs/B3GmfyvnB8NNeElS89Cmiicq7QmUmuHcCn9yzmSTTu/piGX+90Ivl1EYsjMDWC/06odp7DL+p3dLwqT4Q4dGC3ndovEoHz6zn4KnHlrVwv6fnolIbU564eCILLKKNZxiI12Sk/+zCOgthPvQfh5QWUbOtdXfXdIljGuxAH44UCOYXwh9F3loiAd/vjNp2zDmdA5Zk0Fxe/V9k8K7ZelpKeOtgAxHHXrHAALBrh4vjrhYsCuswRYhlsjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCK14bspbvw818w/eaWJ7+3bZXaSrw8CRcb2pTpo6Cs=;
 b=rnZ6QNiIDBhYTYU4nsZ7gwgEswzxDb/a9QyOz2YQIgN45zeoheKDH/volOOWtlSO/4ELxUsx/DIoSy5t5tIMgpkD96+QGPMXz/4poaXIBpZTp++Qz+7NTtK99Fu4dZk2kTtuQs2huRnH71avHcSypRpOfUMBauHhl5fsFrWTRD4=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 06:42:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 06:42:40 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "peter.chen@kernel.org" <peter.chen@kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v5 2/8] arm64: dts: imx8ulp: add usb nodes
Thread-Topic: [EXT] Re: [PATCH v5 2/8] arm64: dts: imx8ulp: add usb nodes
Thread-Index: AQHaVDnMHmbgQeA9Hka54mt36ts0SbD2GfuAgAOniYA=
Date: Sun, 4 Feb 2024 06:42:40 +0000
Message-ID:
 <DU2PR04MB8822A46A819FCB9B121E1D658C402@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
 <20240131114324.3722428-2-xu.yang_2@nxp.com>
 <20240201225139.GA1885965-robh@kernel.org>
In-Reply-To: <20240201225139.GA1885965-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PR3PR04MB7308:EE_
x-ms-office365-filtering-correlation-id: 53b525c4-afcf-47a0-d78d-08dc254c7ba3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 D8doQ5dK7ovAPvbjeRfguGwtZS3FGMh1D0SJSnIS4IzuFjvrIvumDm9f1e0z4U5lZ+82Scel3ZktYOj5bMu+x9CXqN0QXsk5PLvckfdRXQkJBJE2NGbEXGyoylBI7q49t4tFlaEXlXp9Rq1IaQlbvokaNROX+Iqb81d5p4ot9Y77qZdxloSvDoJQdMDdIKqGLHz4j9ziElQyy4bJxa+1oeeyFg5P5PAIaNe4VL1Thw31Lh3mXFa4kSW/mUIf/5o0XKfDgJqhwfkY9YAbVv8JsU1m2f3DgIlQfX3AluPHwq/WLtcA8opRKmTCy9x4UEqqTTBD5lxNr1yNBRQU2giDhESfkW/0iE3I00OpyWjfXUOi9oDxV/HTql2jHc0LAnbySvRH2XKYNL+MnOmpWD4DuvtylEEzuncv1CgTB1wzYsTMaa6wN+XUScNNHCiK4NB8vyRW+o+4pgesi8f7YXDSUvg2dLBWL1m4qBbIUn6/ESw18l32cbMtIfmRcIXWlDDAguxvlqluqEy7TY768Qi4Lw0HRabnFnyYEMxqLpvPToL2LgyjNc/4ZN81y+RVGVBDGTGfDTjZIG8Z6vlLLAzkm5xY8YRVupKFTNhsMZ1nz1MYkZmkAWdNb4LSnSE1Q3zi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(33656002)(41300700001)(9686003)(966005)(86362001)(478600001)(38070700009)(26005)(83380400001)(7416002)(5660300002)(2906002)(64756008)(66946007)(316002)(54906003)(66446008)(66556008)(66476007)(7696005)(6506007)(71200400001)(52536014)(38100700002)(8936002)(8676002)(76116006)(4326008)(122000001)(6916009)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vvtv66pgbtx7NZ3WiHhJyJCRgbkH2YIJZTfCFnigsDZpXWE0KRIqEuZ/sGeE?=
 =?us-ascii?Q?AaC3y3rESjRvCgrme693zpd1geFMyuBdpdaDjRqITtunAQOPp/UBRn0i3fr/?=
 =?us-ascii?Q?XjY3/Oyhl+Azlw6lUbK0nxYXNKhk3Jr6zqyNwYdGVPBBPNxhoH2ptGENJrWm?=
 =?us-ascii?Q?igHVWRYG1sMhPlLnbVbVMpRSSa02V3/y3UfYNMXtNNNXQClyhSOIvp/ujtxk?=
 =?us-ascii?Q?/GRJKkxowaPLuA2J/mhKkW6/jfPtK+eSI0upujyXkgHzGAoWF70VHO9PF/lQ?=
 =?us-ascii?Q?qrKST11NJ8IfSM681kJz2PuhDOIdciCejjSUEMXcucdPX97XlodrtZKrzX8L?=
 =?us-ascii?Q?fyd51PIC99TJQSFtl7PVvUeUCzFg6IcmEIiEnft/Lths9esF5SmWBd7WP3Sc?=
 =?us-ascii?Q?ypB1pe/mFyb+MzR4ELMMpYgJrbcsrJmLEWXXsw9LGUQaMH2gkKQ6cMR8HaQK?=
 =?us-ascii?Q?sh4Wx3AI7s4B0u7fB0Ead5eomSOXfGKjMLhZ3lFaI67Qxs4kBKBpUo/g5iDK?=
 =?us-ascii?Q?vUfEqjORH+2ICQYepH44H337JStossfHGg+MsWHzyDOyBPXvJh2x+Rd2Zc4Z?=
 =?us-ascii?Q?YwZrSXx1FGe47g4rAfbpdIaNSlm8iySuna3nRRsGxIrwTHrM0a65Qum2HKqG?=
 =?us-ascii?Q?Hoz86Twp7KyCnEjsNZDNZNUXRGaFb6CD750xMaPiT/shOU3KNJ6bBSZhCSL3?=
 =?us-ascii?Q?zfwVHS1/K8+T4tNQ5m+iwrQtm5wnf1zcENKu8k2gvR565arkwXXijpsKQoV6?=
 =?us-ascii?Q?2vfzhczkxb2u9vH8EXd3MfDSWLOz3DaYSIMTzAXKYVMg6F3Wg4GNFsWLZyWX?=
 =?us-ascii?Q?ykNJBO6ZkRWY3Lh3QGQx0ci0U5QN1BJH0h/Mx+XZQ53AQa7e2+X+tuu07SA6?=
 =?us-ascii?Q?vxjcXthw2uY9ZbDLvamRwbE7AsP1akCffgev4fxqMJnWw3KUNQB/kmQZS2Fs?=
 =?us-ascii?Q?jQX16iUxZggjkU1ksnZ9ztviNYktdKW045uzjvpHgynE4EDFkdubJq1kb2nb?=
 =?us-ascii?Q?Aq+RUxYmoG7QtepSKtDtR7qQn9iXcnCNTRRHgA/YuiYHHJoFbfH3CxKTGkug?=
 =?us-ascii?Q?MsfW3dfS/gScdTXgUVxS+U1j9XeoGKd1EwXSSIuFrDznww+6eUNg/GXWan/k?=
 =?us-ascii?Q?5HCpto57bWxJEzpicShiz1FndpvQDZvckr5IByBXfiH4xE1BYrxiJW+skWkb?=
 =?us-ascii?Q?aCwOKBDhShO+ziSGd5hrwcLltObAu4fEAcP+pTOjGthDQxYofeDpzpIhndc7?=
 =?us-ascii?Q?lItx/ArDXeQsP5yOYxKD2FVHfkZoHbZn9Nxxg3cWPQS9SSKg+NhRNj6pJUfE?=
 =?us-ascii?Q?SBFq9ZozIJsi7Yhp/NCJ18isHkyfDVlYf1ntg2l+SeqlfOO69aulVoXSC2ve?=
 =?us-ascii?Q?yOyHKEjAEuiEoPud2o4uj0jQ3xTsIm8XJOEbI5FFUU310T+57svakLi1/CF2?=
 =?us-ascii?Q?GU4pKmk4+Nw2oOCHaNnMAQtQRG0ojzPwJuZP4Hi8NkunBHBsN2eQdt2hGNYY?=
 =?us-ascii?Q?0pBAyd0nNRtTXy4GZOnPmgD59dt6+wj/kvM8WXeb3gDm5iJOiKRcSUyiHB2y?=
 =?us-ascii?Q?Hsyb+Ubfm+ROJrOFE6I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b525c4-afcf-47a0-d78d-08dc254c7ba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2024 06:42:40.1411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QMZhFdVuj2yXqt6FA0XwxvrQmhd3rkDnkqZLOJYdmlBNtIgZzBYGbRsGOp7hw+FmkBfIG5X1vLUzoVTNMlQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7308

Hi Rob,

>=20
> On Wed, Jan 31, 2024 at 07:43:18PM +0800, Xu Yang wrote:
> > Add USB nodes on i.MX8ULP platform which has 2 USB controllers.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v2:
> >  - no changes
> > Changes in v3:
> >  - no changes
> > Changes in v4:
> >  - no changes
> > Changes in v5:
> >  - no changes
> > ---
> >  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 64 ++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx8ulp.dtsi
> > index c4a0082f30d3..ead1f57e08ef 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > @@ -28,6 +28,8 @@ aliases {
> >               serial1 =3D &lpuart5;
> >               serial2 =3D &lpuart6;
> >               serial3 =3D &lpuart7;
> > +             usbphy0 =3D &usbphy1;
> > +             usbphy1 =3D &usbphy2;
>=20
> Drop these. We have no use for aliases to phys.

Checked again. Yes, these two alias can be removed.

>=20
> >       };
> >
> >       cpus {
> > @@ -472,6 +474,68 @@ usdhc2: mmc@298f0000 {
> >                               status =3D "disabled";
> >                       };
> >
> > +                     usbotg1: usb@29900000 {
> > +                             compatible =3D "fsl,imx8ulp-usb", "fsl,im=
x7ulp-usb", "fsl,imx6ul-usb";
> > +                             reg =3D <0x29900000 0x200>;
> > +                             interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVE=
L_HIGH>;
> > +                             clocks =3D <&pcc4 IMX8ULP_CLK_USB0>;
> > +                             power-domains =3D <&scmi_devpd IMX8ULP_PD=
_USB0>;
> > +                             phys =3D <&usbphy1>;
> > +                             fsl,usbmisc =3D <&usbmisc1 0>;
> > +                             ahb-burst-config =3D <0x0>;
> > +                             tx-burst-size-dword =3D <0x8>;
> > +                             rx-burst-size-dword =3D <0x8>;
> > +                             status =3D "disabled";
> > +                     };
> > +
> > +                     usbmisc1: usbmisc@29900200 {
> > +                             compatible =3D "fsl,imx8ulp-usbmisc", "fs=
l,imx7d-usbmisc",
> > +                                             "fsl,imx6q-usbmisc";
> > +                             #index-cells =3D <1>;
>=20
> Deprecated. Why are you using this?

Do you mean "#index-cells"?=20
We are using it all the time.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/=
tree/drivers/usb/chipidea/ci_hdrc_imx.c?h=3Dlinux-6.7.y#n137

Thanks,
Xu Yang

