Return-Path: <linux-usb+bounces-14473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DC2968192
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 10:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81A0D1F219DF
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 08:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA07185B60;
	Mon,  2 Sep 2024 08:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D462Cilk"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111117C22E;
	Mon,  2 Sep 2024 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265300; cv=fail; b=i48FX9COIucILcu3RpIKLSheGBJZrkrDMRIQTiAFqAMZ2Ovdwm9nP8nniZ4Gs/hCWcnDxzTfsKEd7eewz9PmDYmk4X+5EI2Sx8sLcSEdRLRoWqP4mmQ02D+SXpv75BlNMvL5WA729W7h6vUnisdGmYwwG/7S41adJplZ8DPdJgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265300; c=relaxed/simple;
	bh=4CIqznAimNkMbvz3fwBZhGHQX9fmI65/U4wIFhYCU7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XagKojypDwNgXJN4EwKtPfB6E/eG8GSADpDGX6xmkTVCue2o2BcadXE75gMElNqlU5BypEMXQ6XiwklWk/JAo4GMH5DTqSkWO1vMeyV/WrilX1lke0tALqOFYStPqE1OeJ/41NEDPKvnz3ALGiYKAHl6rWN6NbdhxNSyHEPuUeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D462Cilk; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Emxr9EQYXl8jtGdvYZGgolLA7afunIl19Oxv54++OLmcPgHQumyRP5zmJCYcUKm3p6xCDyjnDA27rH9agqQmGRhfuEtMAIfEKncQ3Qn4LZxQwW6ZBI8MyKk0qGV0mF+kpywFe0ZiETzBEOG6gppeg3ryFJHToPBeTkYHEDIEeFtMiWLJS7uWUIWYcTaT/h2GlUHqodGN9JJyvXOAamcEIrhRR/lSjnstztGU3WzkL1zzEx3qLsPA/gR8FotdRnW6k2yGRcWq9BEU56xJRzp3I2DQvc9yz1toMod6itk5Ol9j7iri1JUmSEFecAdG45uZi/dArAJsvbLcBLkRsMhRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDALNLywhNO1XSp33vY1hitkUyHWUsKZSGqjop+144c=;
 b=lF76kOt5UcyDCQ43ednDE/d+BLWwLqJEVGeoL2Py7egEPCDSvy3Xc3m9HY/PBJl02f/ek1teQr24iol0fPlhp7Gs3kY8P+V1ocQU7X2vthgFUjxhTyGiXDjMIX/WHKLrzOaGyZmWxByC2l41NdpQnBGzYdD7GclZV00zycBMWDfjp9cagFItwfXhd95AtvjT1p7UK26GbfapliHu3a5TTJsDYWvSGtYmSFPjmMr5WcEKMB1ZEuH1Zp/28yW5x33gmPFsuqfrSup8C3376pzdVkeh6/Yz+2H6Rl8wZ4I/cjxr3lPMLrUrCRu01tuPiOc3ubbPsZRc7HdvSARDFYG4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDALNLywhNO1XSp33vY1hitkUyHWUsKZSGqjop+144c=;
 b=D462CilkUaPQ3N+ySczsU+k6vI0TG/L1LXGTu8dRhn1NNm9z8zZAwuPuHX559EWlBr6r501tbk3aut5Eu8M2CaqpOJ+dcn5EV/1fr5E5EPe2+BMLI2M3tYARE7WTyL9Bt0xJRRjd0ux5ePRn9O3ItaetHfOiqurty51yEQTiCHzqnYQphxWBJmp2ctXjCSgE0/USRvZwlDlI2vFxJNwONuGihRSfOd54j9ilkgJbfCEvJWP+E16DTVKdGF+ZqyOnk723qskGf4/c+gbtmFx6OOokf9sVEafuo264C3H4N1vV6BnmFmE5oZVf+Mi+WD+xmUeQamxxZvVb8dgCYgR7nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 08:21:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:21:35 +0000
Date: Mon, 2 Sep 2024 16:20:22 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/5] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <20240902082022.32kg6szwuamme7hw@hippo>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
 <20240826070854.1948347-3-xu.yang_2@nxp.com>
 <ZtC5HqOzgDBYc8uW@vaman>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtC5HqOzgDBYc8uW@vaman>
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: d51742e9-e7f2-42e3-653a-08dccb28420a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ywEZ0NCubcdzxjGgsDarDb++4/N1ioGIuwHI4F5kjoCBe3FNVybHa/mGmLKc?=
 =?us-ascii?Q?vB6L6CsySSfDmT3SEDrbpyeaJOnoO9m2gf1uaMIMtw0+qRXop4v2mcX6Wam4?=
 =?us-ascii?Q?ZGW72egqT2yP8FdCyv0H5k8vMu9YsOiSjmg3KlC2FGHpXFNTsZeHGMPSSMM0?=
 =?us-ascii?Q?Z7vO1S3BYDp4Wl58nTU83fyon5fl7RVA0n4wvPDd+krFb7fDfbJFB4fgXB45?=
 =?us-ascii?Q?yACnqCDJ360XFts9z9J5BIArMiHXALILNPrlYCZW09pCAGfG5QF5hUFtvcmc?=
 =?us-ascii?Q?eluGwzrQe7Pgi4d2x6A575Uf3HmuGCNl//c6QqfHGogMLjzhcM1VDeERHk8R?=
 =?us-ascii?Q?AzjmryO8qzQvZRvJCQ7Xxqr1on2dlLqx2YnfNUehom/kMo0t4cetrq+Ex3zT?=
 =?us-ascii?Q?lLUtIbtayEbZnlIrg++iMCu0ockWohQoYSV+wq14EMTlgClBLA3JoW6cff1e?=
 =?us-ascii?Q?UOqnUsNSNedgrJq6i2VuhixGOH03UJ+zUNQymUaL436sdmMlZFNYtGGVwZXm?=
 =?us-ascii?Q?RPMvhoETCXtVmiS/PSLJ81BH5GZD/Zj5Dr50Y5C5BFt9GdQqQTHIudZVA8Xv?=
 =?us-ascii?Q?CxfELv1YYPO0iq80ZZSBGV60+zVqCCeVkDqQ9IPO4y8SqQMCY2RykDz0Wcxs?=
 =?us-ascii?Q?le9ik3r4qZP1yqG8U6AuyXzpTLkYMr8fVXudt/riTjHeemEmuJM4YyIxQ24/?=
 =?us-ascii?Q?Ehzik03qvlyY/O6TpuZfHXacfKxFCEqjY2RnJGHCbeS4FjILs8jskV0reugk?=
 =?us-ascii?Q?Ol0EFXLwuQNkA9cZC4gCyN5PZxUoUp33UX8SYN5kuG13d7W6Wl4/XY9wSi8u?=
 =?us-ascii?Q?iHyZ+xuvZjSJ9Vxt04F3wwlgtYuV/kE9MQmyFK8VuU+E6Li0CKfqOMuxmiuw?=
 =?us-ascii?Q?WFBNIqiV+UR9w9gAr47KrHz0tWPchtyodDx8vDnM1jdtJwFTvYn+fvsojOuB?=
 =?us-ascii?Q?GNjdiCM3L1WkN71tTOfqRjffvBNlMXkutl/iglVKte7VdyPJXw7iNn8rGfNW?=
 =?us-ascii?Q?T9sMu4LlMNbymDxWQ58RMWhyDSkx0iW4/oHjDz2bRwUE9HB9Xhl8kbcmBrIl?=
 =?us-ascii?Q?ZMMG+TUUQLrTcFJpQOhNNrzdyJWVSAsI+0K5Ci+tGYzpGClTT49aGSg1Q9HE?=
 =?us-ascii?Q?oEzVXHJv/lWm+ovC/JulOcw3P7L859GpkvaOlxC3eqcrFFLMPi8pnYFZA90H?=
 =?us-ascii?Q?wo6AAeroNMh2ea0Sc50bFW1fOpkciGDnzmiGcfwHb84L7cjNScLH3W0M20Vh?=
 =?us-ascii?Q?ExEPj2vKmYNzYcvkKOFBh7M8ypMTtuxSq1WzLdkgk/e2C24TPpBRCNYwVoA4?=
 =?us-ascii?Q?1f7BXvnzE71skYfzA2236qazvQgzXPg1ILmaYmT82qkXduBKZsytRk1bMTHv?=
 =?us-ascii?Q?mC21Cb+L9Hxov0yAY7COjfcuyb/OELBCphfGo2dBaF1HrsyFHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6c7VRfLZ80kc+r+XSfg617rmYkDub7Jt8wB58VmbZbksao2cPs4Eb0iUWD5x?=
 =?us-ascii?Q?+U0oLeUbiSZ9X+wo1EPL5C0NzymykfZ+Vy59rRdp2zniGK83A08yt1MtbULT?=
 =?us-ascii?Q?qV/i/ArslM2ZPYLnvjHbND9Dr09W2nF++UtuR187Q2OedtWbE73go2M7A1RY?=
 =?us-ascii?Q?LeftwtLsFuzuS1ufTt+I5qrmkb+3C0F/nzwB7BT1b2+7r39tgTXceS5qEdHd?=
 =?us-ascii?Q?HiPIL11J36jjilD02wD/pnrcObD4A6ZSPOz3Byko05sTcDRpV540GjvhCFyZ?=
 =?us-ascii?Q?6v37W7YMK3sRA2lLS/rCqMhEPrEQUFQiDeAZKaQDfXUnhh0adIw2vM+dvMll?=
 =?us-ascii?Q?QeyvgBQ1pE5bFxOHwNtsY0+Ej3jDflOK7uJ3Gc+Nw86NhRu1ifh+TJ4+0Nqt?=
 =?us-ascii?Q?dOK9nXihPLOLUU/FncHFM8ESF/7UavQLwkYuVhiEKM+Qr2ibSquhb++lhQMO?=
 =?us-ascii?Q?daX570oMFDLzK4laAbc06sd3i+zjIh4kH1Oc4ZoysVkohUL0YcqeIJjKv0MT?=
 =?us-ascii?Q?KmQOX9gyjv667RkGL2se2/InJ2pMFsTBbYBT1kkqqQg5cOYp6gS/m8XaS4Lc?=
 =?us-ascii?Q?7Q/zOvM6RDZ4da35re03QLR6XJ/XzCm1oXt1VLsMZ4qvJygytpgz6n6IBNK+?=
 =?us-ascii?Q?XLYXKY/37b+dOm6DOaaaUWkdkzUQgHc+Znn6mMJkc07CYByY3Hb62cApBlsS?=
 =?us-ascii?Q?EiE/Fa1VcOQ4IHu8S2UAR65Ho+Ydj5XHSZ8aq6K9ayIYG1mIgO/eJHoU0bP2?=
 =?us-ascii?Q?B7qMSiXiINsdMlp2FQYB2auaaCsE4dW9fGmhLFf4pNBIKwlXIWJnEaj4TCAE?=
 =?us-ascii?Q?mIrL+Uo8flKaOpcwWU5QVeiw/noyKWG00xiChUxJPiNv0Xfcp/tsK8QmQL0u?=
 =?us-ascii?Q?9b0jNkxinxy4aqwE2NvtBAVdxbMBiC7baaKnS3mEUfq6UxX8Q2B1wTql0/PP?=
 =?us-ascii?Q?GhkV386SgRNmttz+FR2OZZNNmxOcpKL3zYXzxZ7TgkxXecTJz/JQKNopcMYB?=
 =?us-ascii?Q?YhxHOKn1ack/2BqXrrf6Br80RSHSd0KhXm/97gTw5d6VAm81jw631eiV5SAI?=
 =?us-ascii?Q?KUToB54+3GTefPoJjS1CWCXwkmVC/9GTrIYSCSl25cP6bQjyvO42OpyBD8Zz?=
 =?us-ascii?Q?rmU+IV0ZNd+/uqQeZf2QCU6FOlKfeGlAzXiUiB/NEMSeOE9FdiJZ+DWrKHqZ?=
 =?us-ascii?Q?NobKYz/cr6N+CYSPPZ9wzH3kbEFPK7Tny1t2KsRRjWjLiykVC/xrkxEM5fAn?=
 =?us-ascii?Q?qqJhQKMQ4LsTFzWGGFXHf1Uq5EIvya+0VV5eWMkeRzj0Zi588IskhYt17UX7?=
 =?us-ascii?Q?H7knclj1qJDkX9pSurKUjQUaDnK0lGcPSWhge5Yl4KKthx8kzalfUSbI6wRx?=
 =?us-ascii?Q?rGi4L8HQ5gABZFHT8BIoFdTs9NJU94MTsaKK0ZtY+6GOlAKb+wHZgpusY8p+?=
 =?us-ascii?Q?rnSc7/EvIkJI/Oo2wcsPjC1Q9Mt07LZ6QYAOkEvxVJbQ7X1J94azVpO1gOf7?=
 =?us-ascii?Q?TqxHL9SzZuDXu8wA9VNZMEgdOyu4wh4Kx5PYFp2hS6DSGng1oURvbyhQSsFX?=
 =?us-ascii?Q?XpbWislL+XNwbF6nYQpuVscr1UpjqOt6r123wJl7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51742e9-e7f2-42e3-653a-08dccb28420a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:21:34.9129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ymss1Cdp2vc8HUDByxBhX1rC7HTRHECqUBdSHRWzvEXFESSKp+X0ba44qvwBshM+HX9oIUOgV0RybyXFC7Hqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936

On Thu, Aug 29, 2024 at 11:38:30PM +0530, Vinod Koul wrote:
> On 26-08-24, 15:08, Xu Yang wrote:
> > The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> > two functional blocks (XBar assist and VBus assist) and one system
> > access interface using APB.
> > 
> > The primary functionality of XBar assist is:
> >  - switching lane for flip
> >  - moving unused lanes into lower power states.
> > 
> > This info can be get from:
> > i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> > 
> > This will add support for TCA block to achieve lane switching and tca
> > lower power functionality.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - return the value of imx95_usb_phy_get_tca()
> > Changes in v3:
> >  - no changes
> > ---
> >  drivers/phy/freescale/Kconfig              |   1 +
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 240 +++++++++++++++++++++
> >  2 files changed, 241 insertions(+)
> > 
> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > index dcd9acff6d01..81f53564ee15 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
> >  config PHY_FSL_IMX8MQ_USB
> >  	tristate "Freescale i.MX8M USB3 PHY"
> >  	depends on OF && HAS_IOMEM
> > +	depends on TYPEC || TYPEC=n
> >  	select GENERIC_PHY
> >  	default ARCH_MXC && ARM64
> >  
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index adc6394626ce..8bd6d91951a2 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/usb/typec_mux.h>
> >  
> >  #define PHY_CTRL0			0x0
> >  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> > @@ -50,11 +51,66 @@
> >  
> >  #define PHY_TUNE_DEFAULT		0xffffffff
> >  
> > +#define TCA_CLK_RST			0x00
> > +#define TCA_CLK_RST_SW			BIT(9)
> > +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> > +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> > +
> > +#define TCA_INTR_EN			0x04
> > +#define TCA_INTR_STS			0x08
> > +
> > +#define TCA_GCFG			0x10
> > +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> > +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> > +#define TCA_GCFG_OP_MODE_SYSMODE	0
> > +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> > +
> > +#define TCA_TCPC			0x14
> > +#define TCA_TCPC_VALID			BIT(4)
> > +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> > +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> > +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> > +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> > +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> > +
> > +#define TCA_SYSMODE_CFG			0x18
> > +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> > +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> > +
> > +#define TCA_CTRLSYNCMODE_CFG0		0x20
> > +#define TCA_CTRLSYNCMODE_CFG1           0x20
> > +
> > +#define TCA_PSTATE			0x30
> > +#define TCA_PSTATE_CM_STS		BIT(4)
> > +#define TCA_PSTATE_TX_STS		BIT(3)
> > +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> > +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> > +
> > +#define TCA_GEN_STATUS			0x34
> > +#define TCA_GEN_DEV_POR			BIT(12)
> > +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> > +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> > +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> > +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> > +
> > +#define TCA_VBUS_CTRL			0x40
> > +#define TCA_VBUS_STATUS			0x44
> > +
> > +#define TCA_INFO			0xFC
> > +
> > +struct tca_blk {
> > +	struct typec_switch_dev *sw;
> > +	void __iomem *base;
> > +	struct mutex mutex;
> > +	enum typec_orientation orientation;
> > +};
> > +
> >  struct imx8mq_usb_phy {
> >  	struct phy *phy;
> >  	struct clk *clk;
> >  	void __iomem *base;
> >  	struct regulator *vbus;
> > +	struct tca_blk *tca;
> >  	u32 pcs_tx_swing_full;
> >  	u32 pcs_tx_deemph_3p5db;
> >  	u32 tx_vref_tune;
> > @@ -64,6 +120,170 @@ struct imx8mq_usb_phy {
> >  	u32 comp_dis_tune;
> >  };
> >  
> > +
> > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > +				enum typec_orientation orientation);
> > +
> > +#ifdef CONFIG_TYPEC
> > +
> > +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> > +				enum typec_orientation orientation)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> > +	struct tca_blk *tca = imx_phy->tca;
> > +	int ret;
> > +
> > +	if (tca->orientation == orientation)
> > +		return 0;
> > +
> > +	ret = clk_prepare_enable(imx_phy->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tca_blk_orientation_set(tca, orientation);
> > +	clk_disable_unprepare(imx_phy->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > +					struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct typec_switch_dev *sw;
> > +	struct typec_switch_desc sw_desc = { };
> > +
> > +	sw_desc.drvdata = imx_phy;
> > +	sw_desc.fwnode = dev->fwnode;
> > +	sw_desc.set = tca_blk_typec_switch_set;
> > +	sw_desc.name = NULL;
> > +
> > +	sw = typec_switch_register(dev, &sw_desc);
> > +	if (IS_ERR(sw)) {
> > +		dev_err(dev, "Error register tca orientation switch: %ld",
> > +				PTR_ERR(sw));
> > +		return NULL;
> > +	}
> > +
> > +	return sw;
> > +}
> > +
> > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> > +{
> > +	typec_switch_unregister(sw);
> > +}
> > +
> > +#else
> > +
> > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > +			struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> > +
> > +#endif /* CONFIG_TYPEC */
> > +
> > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > +				enum typec_orientation orientation)
> > +{
> > +	u32 val;
> > +
> > +	mutex_lock(&tca->mutex);
> > +
> > +	if (orientation == TYPEC_ORIENTATION_NONE) {
> > +		/*
> > +		 * use Controller Synced Mode for TCA low power enable and
> > +		 * put PHY to USB safe state.
> > +		 */
> > +		val = readl(tca->base + TCA_GCFG);
> > +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> > +		writel(val, tca->base + TCA_GCFG);
> > +
> > +		val = readl(tca->base + TCA_TCPC);
> > +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> > +		writel(val, tca->base + TCA_TCPC);
> > +
> > +		goto out;
> > +	}
> > +
> > +	/* use System Configuration Mode for TCA mux control. */
> > +	val = readl(tca->base + TCA_GCFG);
> > +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> > +	writel(val, tca->base + TCA_GCFG);
> > +
> > +	/* Disable TCA module */
> > +	val = readl(tca->base + TCA_SYSMODE_CFG);
> > +	val |= TCA_SYSMODE_TCPC_DISABLE;
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> > +		val |= TCA_SYSMODE_TCPC_FLIP;
> > +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> > +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> > +
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +	/* Enable TCA module */
> > +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +out:
> > +	tca->orientation = orientation;
> > +	mutex_unlock(&tca->mutex);
> > +}
> > +
> > +static void tca_blk_init(struct tca_blk *tca)
> > +{
> > +	u32 val;
> > +
> > +	/* reset XBar block */
> > +	val = readl(tca->base + TCA_CLK_RST);
> > +	val &= ~TCA_CLK_RST_SW;
> > +	writel(val, tca->base + TCA_CLK_RST);
> > +
> > +	udelay(100);
> > +
> > +	/* clear reset */
> > +	val |= TCA_CLK_RST_SW;
> > +	writel(val, tca->base + TCA_CLK_RST);
> > +
> > +	tca_blk_orientation_set(tca, tca->orientation);
> > +}
> > +
> > +static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
> > +				struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct tca_blk *tca;
> > +
> > +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> > +	if (!tca)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	tca->base = devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(tca->base))
> > +		return tca->base;
> > +
> > +	mutex_init(&tca->mutex);
> > +
> > +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> > +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> > +
> > +	return tca;
> > +}
> > +
> > +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct tca_blk *tca = imx_phy->tca;
> > +
> > +	if (!tca)
> > +		return;
> > +
> > +	tca_blk_put_typec_switch(tca->sw);
> > +}
> > +
> >  static u32 phy_tx_vref_tune_from_property(u32 percent)
> >  {
> >  	percent = clamp(percent, 94U, 124U);
> > @@ -315,6 +535,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
> >  
> >  	imx8m_phy_tune(imx_phy);
> >  
> > +	if (imx_phy->tca)
> > +		tca_blk_init(imx_phy->tca);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -359,6 +582,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> >  	 .data = &imx8mq_usb_phy_ops,},
> >  	{.compatible = "fsl,imx8mp-usb-phy",
> >  	 .data = &imx8mp_usb_phy_ops,},
> > +	{.compatible = "fsl,imx95-usb-phy",
> > +	 .data = &imx8mp_usb_phy_ops,},
> 
> Okay
> 
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> > @@ -398,6 +623,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  
> >  	phy_set_drvdata(imx_phy->phy, imx_phy);
> >  
> > +	if (device_is_compatible(dev, "fsl,imx95-usb-phy")) {
> 
> so future version will also have this check, so are we going to increase
> this..? maybe better idea is to expand imx8mp_usb_phy_ops and add a flag
> for tca support and set that for required compatible, or make this a
> property?

Ok. It seems like a potential issue. Your advice sounds good. Will try it.

Thanks,
Xu Yang

> 
> 
> > +		imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> > +		if (IS_ERR(imx_phy->tca))
> > +			return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> > +						"failed to get tca\n");
> > +	}
> > +
> >  	imx8m_get_phy_tuning_data(imx_phy);
> >  
> >  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > @@ -405,8 +637,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	return PTR_ERR_OR_ZERO(phy_provider);
> >  }
> >  
> > +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> > +
> > +	imx95_usb_phy_put_tca(imx_phy);
> > +}
> > +
> >  static struct platform_driver imx8mq_usb_phy_driver = {
> >  	.probe	= imx8mq_usb_phy_probe,
> > +	.remove = imx8mq_usb_phy_remove,
> >  	.driver = {
> >  		.name	= "imx8mq-usb-phy",
> >  		.of_match_table	= imx8mq_usb_phy_of_match,
> > -- 
> > 2.34.1
> 
> -- 
> ~Vinod

