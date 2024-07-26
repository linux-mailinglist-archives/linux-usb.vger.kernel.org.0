Return-Path: <linux-usb+bounces-12456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B793D52B
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 16:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F731F24B10
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C173E171C2;
	Fri, 26 Jul 2024 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IaGpjHIo"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60001CD2F
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722004525; cv=fail; b=p8thN6Tm6Yp97Xtg8mTkmndlW5OWeB/VtCLAsxJ/hCaaGYgG2MD6W816aoj8zRTk1a0X+BWQTgm96CZuHrxj7i3Zq0oPhropOoQWGvt+NRGer6xX20EJATQ/P5quyRwHKqyjyE6iz1FPYk8HNTMjICiraOVS1Hd2a1EMX024UT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722004525; c=relaxed/simple;
	bh=urmMY6j/Yjk1LjMNyGZjYKop3Un3E1TBxrh1rDXEMbA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l7l6b4NZbzO2VhepDD8V2Mhg/egkGAo38w560EpBCQaUPdxu8/78v2QN8qc0XHD4mPCK9FaM1kO+I9AJoPVoy1wk4m0/AqJ3cP6GJ5WPqFYAApaYGeVGH1bF18J1inndoWH3AsCmOWM/enQkyh6oiyubVSjFfqg+AGedgAR/eTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IaGpjHIo; arc=fail smtp.client-ip=52.101.70.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm3dmrWFQEYc70cONYYxxfP5zGoKMDOuIXsj4dCpgR/uepTgk5+KZE8uhzIoLcecjANRwiAfpgfG3seKWhbnUae+7e6uH1+wAc+B5rakgT3FQyeu9iF7e/BheTAW6TnBlR5Ri0usqy0sez8iznp+LqKjsIjRHEXH403Ykvuu0GEi1xJPDfUEifDDdrpewSXdyd7RLQBSpGiVpl7rKx72XGDl216Uv2AFg46YaShHpBPb1DbjD4JwFtl4xX4eC/ZTiz8Oqwthk1r8nmWaT3cYAv4lQDX7SDn/rOfJnFuSu2s5XXjz8skl8SXNlYcFzeNiMzdp9UKGoaSnovri8xzuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQFb6/QqSgPIGwx8t9Zs/AXm0Ms7WOk/wrhEMadISrE=;
 b=w4Ax/p2znD5EZ9TA6+EB0CJ6viVs5IijD5hecRM2pgdkH0VI2Y5Wxx161Citp2G2/yMVGnsD+628T0Kal2NlGMG+DRf/79R/nNpR3LN4Xkow/jcNH7hJ4YOfvkJELJ4a6SFn+0FizZ97BuBT3nLUujKMaojmaYYghPtIvfqfRkoK5rogtyXWJ+pR1ZW7lmpOprgi4ReptwpmNSMhlyfyMdf1T6msJjhs4WhUmjBNScQ/i8Pt3zyt23baji5nCIISWCbaC9Va5mYhnp0ZYM/LP0SU8zhVHRnbiRV4qxLpVxdc+hjWUGAgpvRnajd42YqUyS4elBo01DrnL76JH2FqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQFb6/QqSgPIGwx8t9Zs/AXm0Ms7WOk/wrhEMadISrE=;
 b=IaGpjHIo75PZmbSyEXX7/QUfpkdmvKCAFlanO2sThdRKG0ZNPkONDXUgZ+YAb0LKMsOLyKemWu8mMUkuaT29wbwn1L01wcCQbb2xvlMQc1f1D1lddBGZ3P4hWlXnQSt91GsHxJtn1Uwa6jemjS5WzCBBm3WLI1DWZYAlzvGzBPHfaVz4e/csMHN8u56TtZCgbbOVa2PN7sIXuxe41+7nuZL8k7EjAAr89WoXP8UEIxwikXvQRD8iyZr/53BBqpjkKSPDJ9CRdHK0Og76Z1CvQBCfUnDr7n0iZt92vGefDgTvIbTnu3A8ylOwGu1+HBb08lIUnRsq04VGJtcVO/26DA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 14:35:18 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 14:35:17 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Roger
 Quadros <rogerq@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: cdns3: imx: simplify system pm using
 _force_suspend/_resume
Thread-Topic: [EXT] Re: [PATCH] usb: cdns3: imx: simplify system pm using
 _force_suspend/_resume
Thread-Index: AQHa3tmkuu/7XxRJKEiYNlj7Lkhxj7IIk/6AgAB/HFA=
Date: Fri, 26 Jul 2024 14:35:17 +0000
Message-ID:
 <PAXPR04MB9185FB593C8420C4D8CFC26789B42@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20240725212811.296307-1-shenwei.wang@nxp.com>
 <2024072635-egging-suffix-92d5@gregkh>
In-Reply-To: <2024072635-egging-suffix-92d5@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB9079:EE_
x-ms-office365-filtering-correlation-id: 10bbb54b-7be7-4b52-9638-08dcad802b9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2gVQBs12wfG1arNUprf5/ohiHDxtuk7MUNFWCudtQfNVoeugKpFkgP9BTUB8?=
 =?us-ascii?Q?2LRP1DrMfdvIYBFTvuXYN0wJxrKofpjcLpkvHHEwAgHhH+H7WhP2rGxGQbuw?=
 =?us-ascii?Q?7ZX9UD/0tanevzVnqohfzp5vmlGIRdZaY01mUmzcGgAteMmt5up3ZG84PFV7?=
 =?us-ascii?Q?6qmzag4WTPq+KLK5bJcSw5r5w1RXCdteBaH75x5jt9Qp5Pr+s09B40QBJiaI?=
 =?us-ascii?Q?yRNfg3jPunnkC7J7UKMQRZPk9zK2RURdPto6gjl/s8Dq0GH+SqUhwU6FFITo?=
 =?us-ascii?Q?KtDViMOq38gNN5Cgn2feIbvWrNgQCHaPxYtTzJdRccrg+ZnLQxkuM8wBIYMl?=
 =?us-ascii?Q?1E3U0I8CWho8pClpo9G9aDcu94Uk/WT/6OLe6zHM6NgStOxA7bPNXNcrMkh5?=
 =?us-ascii?Q?il02uicQYrN/wfsKzqbjx90acXHmIvGDDj54P0werTgQI6n61GOBvjxf0wT1?=
 =?us-ascii?Q?FJupOUDgBSR9aYU7392v6AUvHzC2MrjHt2PZwco860BtZsfhLeE4TDEQqMK1?=
 =?us-ascii?Q?IKGXkYU7vXZxwBnF0r9XIq9w6RL/gt3wQClEeT3QU4xITJKR5WX6DLSKzrbc?=
 =?us-ascii?Q?z5tWXScMGY2bNcREUmlWbn9CkdJ5LaIlMmVYuqhPUW9UHCsdeCoT6ylkeE6j?=
 =?us-ascii?Q?PyCXqDwSl9YPTELMzouTNEDjUVzkVxAj/8N/xvBkeR2Uy0D5UUCPw/GgNdYA?=
 =?us-ascii?Q?tNglTmGfAr1k8gvZUX7IgUdRY9hF64RIGQwLMNxE99mLpZNEYsiMxHrSZ7t/?=
 =?us-ascii?Q?IlHGComZ1IM/6W97WsV7oKzD+gAvcdGHfPBtfY8U86wEn3JemAV35nTLpe9H?=
 =?us-ascii?Q?o8NeCvX0Zf4xkoCckgxiB90k5vM6uHEpyKRLBpinnmm0wr/mX4EjVk3V9nqz?=
 =?us-ascii?Q?pqJ8AJlZ5w6nJlRGXBJkRlrwPMxDQJFnt8vi8mdxnrCYEYLvKNEnzS0M80e8?=
 =?us-ascii?Q?z2Yn0EX3zIyRS5hr5jl3XnzwysAbkoArFn2bfIMJlbzyN6XZihZey/sdNvQD?=
 =?us-ascii?Q?Xb8of2W6rwFbqbmA2EeLw9Q6FFenhedN/xE39qI2mpdEIk+BSAewEXIa2qCE?=
 =?us-ascii?Q?nYt5/m3kNse1tzo8eCPUmcC6nWm52UEgdrWhyp6bVzqK/Rx/4Igv5NM941as?=
 =?us-ascii?Q?+MzodU23EgZ/QiM+3LRglI4/q9loeuooJjdxh1zkA1vuGXTAx7EyyKBJGRE2?=
 =?us-ascii?Q?ncYAvcXVmv/Q9chG/RDm2YkJYv3jZYcZ+De8GvF4FPQ9uT3+aO3+vUJaUIaN?=
 =?us-ascii?Q?H5WjBbPj6aBfMwgLHa9Z10xwlQx+2YBf56/PcvDgLqwYiyfkPzbwQsSy7DdJ?=
 =?us-ascii?Q?gYDQcjHauoIG1wI2RJq8m+rgTX0sI4VOFzL+Cp/4gnLVwDUTt9r7L++zUj07?=
 =?us-ascii?Q?ILVbgaP48/fxV5C9KHjlW8EiUTGBwDZ+Q8pn5UyqFC8PqHg1uA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qsGd9gz+rA68JOeI/55BiDlaTW7aVszX7E31Xpf2bbqzABTsHNzi39V7Uxq0?=
 =?us-ascii?Q?H+Z37JhGdMp7HfgiTKD0UejxBI/25tqHHCeyH2sLeVAR5x1EI3KvC4b8m6sc?=
 =?us-ascii?Q?44hcJxQhQY4SodWbPS20aGmTdypDTU+H07yJpQCCIKaAN8qI76k2hW7WlpeK?=
 =?us-ascii?Q?4v+U+zboammfDcNaPYzpyYzZC9uPgq9MZok7yNv1ydweTB0OZ3F2RxUA9fHB?=
 =?us-ascii?Q?ohZh9yVnFB6ko9GcZYHrwBDtXEERYHBX9S6p/PZ+EJ6tGaYBFgQQrp1dNwFW?=
 =?us-ascii?Q?+X4qmAZ5t6zyLx7g6lJ5WDmHxZg+H9C7Om+rZMKLa9RAibv+rFP3DSp9yBzN?=
 =?us-ascii?Q?EglpbxT48cvAY2uFGt0AzbxneZMzjhneKpRYkCA8uBcG/BpdcCDI/l0oXzFY?=
 =?us-ascii?Q?KVubuudhKq95yYm+6tjPgLCxUbMKY5oq7aciTdZ2pqZz3BulTLKybKNWwGwF?=
 =?us-ascii?Q?4VOvdc4hDtLWCm0XEkV/frq9MHPIggPonYg7p4ngfz3yrd8Ka6HsOEQskjVL?=
 =?us-ascii?Q?UNBAdKld+ckWV8NOejIXDJ1vnrLZKv7uZ5CJahsUAyUlYd885NZJC+ljr1ix?=
 =?us-ascii?Q?jxPvsVj64jVx7QTT2rKFssbYaDY2JffaIBk4KOg+rPk9wWbg6hRcefFfqSQ5?=
 =?us-ascii?Q?S/XXph6FgOLmqXOeWYDHjGOByjeX9l17hwPaCJpQaN9HR0iN8wS1Eck5lJT4?=
 =?us-ascii?Q?yVvKCoVzqM/L1dwc9H2rLsngQVyVWRcmvLwdi8e2ISqfVfm1i11dcCwy+ZC9?=
 =?us-ascii?Q?pn0pqy6SOg2vC1Uuu+GSUYiwjHGbZy6jxq0glhTGI/mEa/fTe6owCDzr8kA4?=
 =?us-ascii?Q?UiS2bDRPR0uNVhNFymp+/Io0IwiuTLx7b9SIqxl1ykGeyPw6u8rzGJpe+KF7?=
 =?us-ascii?Q?FOueZxUBlmswwaawJ5tTCRpvjWk11izoRR6vwO2fuFGsKkD6kKhUVudcprVg?=
 =?us-ascii?Q?Ixnlkgg/UWNIphgdp7NgvkPte9aQbZAgtgemsHzjcQd0PabJjMzxIt1TVOpk?=
 =?us-ascii?Q?WRzv1SIhHvTW+RLtA0yQNVmT76V31J+BLiiSuXauvizNhWF1iyuEgbcZTq0J?=
 =?us-ascii?Q?M3RFSujweYs/+8VFE8vnHvvpeh5R+PhnLu8R6MWhanQBcU3C64l6kaGAGXe5?=
 =?us-ascii?Q?zdrFoKei52nAzbu1cNBY45ZxVghHkQAdxH4JVYY4PRv4szt41i+PK0DVC7No?=
 =?us-ascii?Q?AQcc3CIBDjyohw+r2Q//dy4IrfkmDV0vFgPZKvHgeM8VrMbUA+OcC88L4nJR?=
 =?us-ascii?Q?KmuVfG3uUvOMfwZLkOyulM+pDFGYwcOTWh3JuLqOTogeMmY7zAo09jzMqsAF?=
 =?us-ascii?Q?QBMuCqUmcwEcpx51OUpVySvKJIJLp9b6Z2iIjfRc0Os8hqKQKQ7OF3sRKEqf?=
 =?us-ascii?Q?R3n5U5NjPVqTRc95fpDG058jVH4HlgMjjHQc4R4kgF3ItJ/aNHUlie8fgkjQ?=
 =?us-ascii?Q?9cDH0wtqpdy5VQr7gne9p4FaIRO4OeUzzC6tGbrtznoMBabG/B8+AMbI7PMM?=
 =?us-ascii?Q?iH9nhjxd0tuMql4xervndveHvT5YD3JPvJ9k5LcLRSQPu78iMxz/RCcYZGYM?=
 =?us-ascii?Q?pgmNZHtTJXZHlkUGB1fWv6LkJA9vwYTtwCJQTArp?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bbb54b-7be7-4b52-9638-08dcad802b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2024 14:35:17.8317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwVa9CtBJEhFZ2muDAqjDY2qL9JBx/8Bf5Qgsdc+qFE4OAARY50lP6cV4sfhUl618ddCaL0u4DUZbGyFX8uBIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9079



> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, July 26, 2024 1:56 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Peter Chen <peter.chen@kernel.org>; Pawel Laszczak
> <pawell@cadence.com>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> >
> > Fixes: db3c4e366287 ("usb: cdns3: imx: Rework system PM to avoid
> > duplicated operations")
> > Reviewed-by: Frank Li <frank.li@nxp.com>
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  drivers/usb/cdns3/cdns3-imx.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/usb/cdns3/cdns3-imx.c
> > b/drivers/usb/cdns3/cdns3-imx.c index 281de47e2a3b..9051cbe9d68b
> > 100644
> > --- a/drivers/usb/cdns3/cdns3-imx.c
> > +++ b/drivers/usb/cdns3/cdns3-imx.c
> > @@ -360,7 +360,6 @@ static int cdns_imx_suspend(struct device *dev)
> >       return 0;
> >  }
> >
> > -
> >  /* Indicate if the controller was power lost before */  static inline
> > bool cdns_imx_is_power_lost(struct cdns_imx *data)  {
>=20
> Unneeded change here?
>=20

That is an extraneous blank line was introduced in last commit and has been=
 removed as part of this correction.=20
If you prefer to maintain the original formatting with the extra blank line=
, please let me know, and I can revert this change.

Thanks,
Shenwei




