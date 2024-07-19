Return-Path: <linux-usb+bounces-12284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B4A937481
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2024 09:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C61BF1C21016
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2024 07:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CD757C8D;
	Fri, 19 Jul 2024 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="bCfowr+u"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04096383AE;
	Fri, 19 Jul 2024 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721374824; cv=fail; b=aUn4iVaAlRs4zqhG1p9cSRra9kdAhpsuyGgnMwR7JwO+JzzXGJUUv8Pihs5Br9XtntvelEkRdVuGLHnuexh8x5Fr0mw/4cltA9JteGtmiYH2mqrz50y3OrGMzFgtBW91sFTDC0fjTGrrFzRLJvlYP30WhTNZC9RJ7tFtSXV6BfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721374824; c=relaxed/simple;
	bh=pay4tQmkVWFDZ6ZysdH0k0Lgz9I6F30KJB+n3lOQnQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qrPZ3OuxgK1FCLkedYc3Q9EYflBWmvIk3oSKCmaFaUuttw9wQvPu67baqEMGCYGivOtlzQz7lEsnjYOBHM8YKXMc2kQkZlFYFwvzwcIw13LRd6nmww+MPG3tb1dzOMb3EQuSSvrUneFc6def7H724Sex8fk/XHyaI5O1gcxo8po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=bCfowr+u; arc=fail smtp.client-ip=52.101.66.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGKYeYQassQqnMtNdGAvBXgguXGGyRMOn6GcTaBE/kUsSoemuk0mRnHztBx4LJUEiUArsZA5Jwihp8upq1CstpJVGSJtqDDsOwlzt8c/9xpRFFMdzFQmgqOIcjVDENh7rZF/9SOX4pmaGlTZvNXtGSwycVhRirhQbpBKm2gGaCiiJ3xpFAxzG77AwoklXWdpmnuCTqqACZ1IchDzOC5GxLALB3Q2xmrIH7CmQ7ZrMi9lpM7+kNkaKBX4+k04CDR/i5c6XYr82cGF9rFEpfLEqAxp9KE3zIRL9akTxwDnhD/NRoITGstipTlPa3PDE1wF7ohz9NHxHEDjeEnZnuv6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHNmiSYfmrbUy3H9XMSQC9AlAhfz6iTU/kfDi3XwJ2c=;
 b=pfHhacJjs+YoU//YqEWHQlbXGy3j8bs6QXCMNivWeUvqr0q15X9g0LBWi0FJTLEIcc9QJU1GmB3kJlKsehFF0Xlv+tnTsqxaDCXkTx7h7OklJUV37x1A/br4Kn+da6ZaPWnznzQquBEO5TRl8I2KHVsKbKI1yS7l5LLAfiyIFupq4XRhcSSTCkdojB9jCzCiV2GZOTO1c8r6auIEb2choQ9+vueeiXbOq8VY904U4rKr5AcVmsV/CzxYDJhzSvSg7Kogbr/K75MNverR7bOHNG4NIYCFRJJMj31LuLb6le/X1i92lft7jsiZb0UoDs+Y5F0cSiISsY9Vw0ZWJAriZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHNmiSYfmrbUy3H9XMSQC9AlAhfz6iTU/kfDi3XwJ2c=;
 b=bCfowr+uv+bhN6v2eLqsyZKn821/OOktUU4omgLH3nMX9gh12+XoMxzrKxq6lFFtCZZ5ROr0XepjDgE3NSaHXjkP0L8Wdbkffxi03EqOQA/oVwqbsSOVDRCic9CH7Mx2NsyZKBxD9lPuzbRvxmFNJ5Y5HdIbXPALzcVR2z5LQ9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8365.eurprd04.prod.outlook.com (2603:10a6:102:1cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 07:40:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 07:40:18 +0000
Date: Fri, 19 Jul 2024 15:37:52 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 5/6] usb: phy: mxs: enable weak 1p1 regulator for imx6ul
 during suspend
Message-ID: <20240719073752.x3fonxhfsdnhwheu@hippo>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
 <20240718102637.3964232-5-xu.yang_2@nxp.com>
 <Zpkw+HLGndoP/0xW@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zpkw+HLGndoP/0xW@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7e4553-c8fb-4e95-3fca-08dca7c607da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uOUhrcfeG5iXJcBja8N+CD2sGhEUWRdeaV2GmlyloIEE5yN3KlCBFn2P7Zef?=
 =?us-ascii?Q?c44Y8+See7wlH/qKhaZWF6VpaFNGmiRolGZOtlnHFnSpRQAxyBnMhHsB2hry?=
 =?us-ascii?Q?mJLLzQ+w6kyTGY2TtsondurDuIAO5QTtQ2nXmgH/+J53bJcPO1gQbuQFaY2l?=
 =?us-ascii?Q?ooAG3UXBWaWK6mF2gOwaiAsaRCVZhK8YqKYUm4w9dQugExDYLn1l1qVbZMXX?=
 =?us-ascii?Q?5R2Nnv/nZwDWYN62bZjcWqIBrrxJIiaGB75hBTruKoSHWYOSf5zkFQkdp0dn?=
 =?us-ascii?Q?CfEetWDHHWRKJufrltVtGUGIZ8HqdFrH+TmdEpHN6P0rTkqVoBwtERjSnnrz?=
 =?us-ascii?Q?i9jaj7b2/Ltc88uPFMlpVD1etPOdmcwHYTg1KTqhMZoo9NW6NZX+0RyLL4MU?=
 =?us-ascii?Q?oJ0+dFyOsZ28ERUx13Hy2yHuc4US3wQcbnNSZomAqa/b8gcm8w+ObhojT7WM?=
 =?us-ascii?Q?WmfsUeTP77ANniLxTUOEA6cks5TfP5tM1jWNVvm0vgN+AtcgrhB3J2ZJroFV?=
 =?us-ascii?Q?qMrn5tIS+AVZDGhYg7cpWl09xrQlVEu1ak+bLu7kfrnkKuy/iej7eHnLKjU0?=
 =?us-ascii?Q?/Om2eCskVi3Yp5auclcrDreZiqzzQFMrTLwEFwU1bnnlUxcotbyU2RmJYsqK?=
 =?us-ascii?Q?8/w/WANYHsn2M7bTAaogszqCNqLCMDUgVcxaFoGtl9zy3Ys611Gva6cnA2RK?=
 =?us-ascii?Q?KiX7+bRwnuE3n3vQ2LE2seEd7FTADXmCI9hRkSiqtXBu66sn8U0oGD9+aka+?=
 =?us-ascii?Q?LYyi1ce1jEwGHlmFhZXIoJ8VAuhWWgLY7GsWkYzQpGv4vKL5fzNMYUs1wDLU?=
 =?us-ascii?Q?F9bgXU9jMnZvnHzPtJi8susr67yc78PUdCxBP64tHz6qDVyCraILJnHkSUmk?=
 =?us-ascii?Q?KmQLRaR1rkqDgJWdlRJv1hAglNq/nEq8E3WDbQJ5dTfbmGkuLes1/izDPZN0?=
 =?us-ascii?Q?J1vX5wNmEESekCucXG1MCRkuLBLph7SJHtEeUO5acxdwMBRmxt0nq8rP9SKE?=
 =?us-ascii?Q?/UxV2AmsMJL1wmQi+LsdiUQWizIzf+M0ixXmd3J8B02VJ2SwezrBDW1Au9jI?=
 =?us-ascii?Q?uCs78gg1oyzcJBFlWjZKUCC6lL9PD+BgkDdHFgYV29QfAwpUWqIugb2ARE37?=
 =?us-ascii?Q?7LIyKttNRt1E6F9MLtsOw/lmawT4dI303sh5aE35xf/oeEVZyrbBS7f8u5r0?=
 =?us-ascii?Q?V84uMcfjSBoYCuwdFpVTrJXMvKqg8mvIphF/rCMKhMozJNYADNNjIm8KfhTb?=
 =?us-ascii?Q?adcg442FQunX/3uwotxVQ4gKyaAFTHGB3E0IohSepRCiatLgrh1jHvuSEQOU?=
 =?us-ascii?Q?3QLlJgIYe7bmhNQXl5Mw3J/yOV++/8TU5XRght05WYQ69Nrgf8dbDz0Jy/Yd?=
 =?us-ascii?Q?llsgHArDrlciCXxZmLRqC1AX6z6flLJfeDClXcciXFfgQKRAZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YWCa0UFLaK4VZ8Lt2dTCdXDOq28BYugHGHuM2V1Epo8E5QBhzhhsjginV83w?=
 =?us-ascii?Q?HM/RJ1B0Yv/ky2efpAylu0NkecgMpWTiBtTH0KtEPuSx1gnOL/VxGOwCntPg?=
 =?us-ascii?Q?CKWJTtxvvAT24vSa0EY1WkpFlILk99q2ctevC4OB6qRU+IHMwFTIndiJYvez?=
 =?us-ascii?Q?u9GP9gLWeZQnhZcm24zSaIVdp3u6y0IbFT9xIs5fnMm1rBTS4J8Uv2qwQV9Z?=
 =?us-ascii?Q?fHYClgnc38X0JJlhEU01B2Y+s3MPQE6qdT/YGAZs7eRxBRgxmJTjYk1ZpmtB?=
 =?us-ascii?Q?bnn1zItxDSJKisGTvVNe1c5A/vj+hKUgLr2mSlfIMa1Dj2REyRmgHfGnEfog?=
 =?us-ascii?Q?X2G7beghc04WJQ3PeRSAY5ilrLCDckF/+J9wnMi/tCAODCPbbGf6DR5C7kQ9?=
 =?us-ascii?Q?4Zlt5iEGcSrLhGxHJuVXK3kE0y846cGmI5BojLSKCVn61QqOczKz/IOJ8TYn?=
 =?us-ascii?Q?UmSuK7Pw449CyogVfGoXhVW3ua5zzVrUDJuXy0Nlqa1x66AXputMtn6/QudN?=
 =?us-ascii?Q?mf05sLLnH1P91z4zzx5XkHO/6aCp7NwNaoguQIuF3Z73InlGC4MmOlJ9WqD8?=
 =?us-ascii?Q?2u0cQkuxBGwqZ9jwQJyZurHl3HjvP/NEbcbsUvIguzoymaNODfI/1YiJt0AY?=
 =?us-ascii?Q?FvJlzGY1VtvyWM/AYQ5lGcLx3s9Y05Rf4SrZVyNEqXX2z9p3RhpFsVbX9Ton?=
 =?us-ascii?Q?lq/jRgHpm9iIkWaA5RwdPt6U4p8a7N2u5X72JtG1LyTEixgQPQVvgYWUtxmq?=
 =?us-ascii?Q?0/v84HtsVptriDlYmMy1TvD/hyUN/Xb6MSpvYj86G7CxIEiuMl1AKS+5vGw0?=
 =?us-ascii?Q?KsCp/LsgR9URsu0gJP4wWpsEyJ98tSqTDDK6xqnbh3vxKrZcV+IeZGfNKMCX?=
 =?us-ascii?Q?IC7NYVcER02CMgVE0zcvw96iyHMg/p4gMzOCP/kxmkcTKbFlGrrbt27dxDxK?=
 =?us-ascii?Q?znRzpskTWoKZaMnoRU1mdPzHolPG4lAfCYb1qHSIobkiHMZzI8fRLEOTMuo9?=
 =?us-ascii?Q?7kTD8s8E7nTEdJ/NKs2T0xoWV9fXUAyAlHaQTKILTdCj9uwGTQX4bPdtgmFX?=
 =?us-ascii?Q?ifO4YFVoD8606qtsc9mjUFJwnfNkPohJ6XtbPOpkvmZ7T7r8xbbYCBkbIN4C?=
 =?us-ascii?Q?gK9Dvbckg7WyY56uGPE1Okdr8NmYx/HCy8aKslT2jSkyTirE6cAw94jLPTdG?=
 =?us-ascii?Q?VuQ+d2yfwpYWfjWeKmMQjso/B0NXQygjV1doG02TA6RJ+oT+EkNd5cgtDaEL?=
 =?us-ascii?Q?P+gSD4GYS48arHkGPOcS43YW0QZ+3olmp9gfytNNcmaOfBYq6JC9IzpC3LCm?=
 =?us-ascii?Q?llTL/XkP6x7wnQCeJQspvHDpYKs8mghVreHbmKZw4UM5eFPVLJ6Un/8XxoPt?=
 =?us-ascii?Q?rPrvAlLZGko/XCjpgXda3uKCUUb4c2JgWt7p0RJQhDVQamA7+Ai8Q39XGkMe?=
 =?us-ascii?Q?1G9WlQgvSS+ghYIAVBZL+1jJNb61TB2kQu5uc6DVVo2a+hmHMlC9PkFZFybG?=
 =?us-ascii?Q?c9vHviQ1Xzn1zzPXKj9V7ls+LHuthb1JvWtLayWWsakcGusSVlAwsGz0CWnU?=
 =?us-ascii?Q?GFCVVjVAgA9TYGXRJeTmZvrwsKYGT9XeVTs8eQCM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7e4553-c8fb-4e95-3fca-08dca7c607da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 07:40:17.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4gIj9bnZ74Dw+/2ycJZxRS3LupRPC7qPt+SQVT3Lz8ihHBbCdMr9jlIw9hbx0oo5TLCbQQuMyaFYsYAfEF2jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8365

On Thu, Jul 18, 2024 at 11:12:56AM -0400, Frank Li wrote:
> On Thu, Jul 18, 2024 at 06:26:36PM +0800, Xu Yang wrote:
> > For imx6ul PHY, when the system enters suspend, its 1p1 is off by default,
> > that may cause the PHY get inaccurate USB DP/DM value. If the USB wakeup
> > is enabled at this time, the unexpected wakeup may occur when the system
> > enters suspend.
> 
> 1p1 is off when the system enters suspend at iMX6UL. It cause the PHY get
> wrong USB DP/DM value, then unexpected wakeup may occur if USB wakeup
> enabled. 

Will change.

> 
> > 
> > In this patch, when the vbus is there, we enable weak 1p1 during the PHY
> > suspend API, in that case, the USB DP/DM will be accurate for USB PHY,
> > then unexpected usb wakeup will not be occurred, especially for the USB
> > charger is connected scenario. The user needs to enable PHY wakeup for
> > USB wakeup function using below setting.
> 
> Avoid use word "this patch", "this commit."
> 
> Enable weak 1p1 during PHY suspend if vbus exist. So USB DP/DM is correct
> when system suspend.
> 
> Reproduce step:
> > 
> > echo enabled > /sys/devices/platform/soc/2000000.aips-bus/20c9000.usbphy
> > /power/wakeup
> 
> echo mem > /sys/power/state,
> 
> 
> then some error happen. 
> 
> Or just remove it.

Okay, will change.

> 
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/phy/phy-mxs-usb.c | 32 ++++++++++++++++++++++++++++----
> >  1 file changed, 28 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> > index 627733a982d1..dcd032678814 100644
> > --- a/drivers/usb/phy/phy-mxs-usb.c
> > +++ b/drivers/usb/phy/phy-mxs-usb.c
> > @@ -71,6 +71,9 @@
> >  #define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
> >  
> >  /* Anatop Registers */
> > +#define ANADIG_REG_1P1_SET			0x114
> > +#define ANADIG_REG_1P1_CLR			0x118
> > +
> >  #define ANADIG_ANA_MISC0			0x150
> >  #define ANADIG_ANA_MISC0_SET			0x154
> >  #define ANADIG_ANA_MISC0_CLR			0x158
> > @@ -123,6 +126,9 @@
> >  
> >  #define USB_PHY_VLLS_WAKEUP_EN			BIT(0)
> >  
> > +#define BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG	BIT(18)
> > +#define BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP	BIT(19)
> > +
> >  #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
> >  
> >  /* Do disconnection between PHY and controller without vbus */
> > @@ -197,7 +203,8 @@ static const struct mxs_phy_data imx6sx_phy_data = {
> >  };
> >  
> >  static const struct mxs_phy_data imx6ul_phy_data = {
> > -	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
> > +	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> > +		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
> >  };
> >  
> >  static const struct mxs_phy_data imx7ulp_phy_data = {
> > @@ -243,6 +250,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
> >  	return mxs_phy->data == &imx7ulp_phy_data;
> >  }
> >  
> > +static inline bool is_imx6ul_phy(struct mxs_phy *mxs_phy)
> > +{
> > +	return mxs_phy->data == &imx6ul_phy_data;
> 
> You'd better define,  MXS_PHY_POWER_OFF_AT_SUSPEND. 
> 
> 	is_phy_power_off_at_suspend(). 
> 
> Actually, you just need know if phy power off instead if it is 6ul phy.
> 

Yes, you are right, but is_imx6ul_phy() may be used in other place and only
6ul phy has this issue, so I'd prefer to keep this form.

Thanks,
Xu Yang


> > +}
> > +
> >  /*
> >   * PHY needs some 32K cycles to switch from 32K clock to
> >   * bus (such as AHB/AXI, etc) clock.
> > @@ -891,18 +903,30 @@ static void mxs_phy_wakeup_enable(struct mxs_phy *mxs_phy, bool on)
> >  
> >  static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
> >  {
> > -	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
> > +	unsigned int reg;
> > +	u32 value;
> >  
> >  	/* If the SoCs don't have anatop, quit */
> >  	if (!mxs_phy->regmap_anatop)
> >  		return;
> >  
> > -	if (is_imx6q_phy(mxs_phy))
> > +	if (is_imx6q_phy(mxs_phy)) {
> > +		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
> >  		regmap_write(mxs_phy->regmap_anatop, reg,
> >  			BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG);
> > -	else if (is_imx6sl_phy(mxs_phy))
> > +	} else if (is_imx6sl_phy(mxs_phy)) {
> > +		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
> >  		regmap_write(mxs_phy->regmap_anatop,
> >  			reg, BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG_SL);
> > +	} else if (is_imx6ul_phy(mxs_phy)) {
> > +		reg = on ? ANADIG_REG_1P1_SET : ANADIG_REG_1P1_CLR;
> > +		value = BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG |
> > +			BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP;
> > +		if (mxs_phy_get_vbus_status(mxs_phy) && on)
> > +			regmap_write(mxs_phy->regmap_anatop, reg, value);
> > +		else if (!on)
> > +			regmap_write(mxs_phy->regmap_anatop, reg, value);
> > +	}
> >  }
> >  
> >  static int mxs_phy_system_suspend(struct device *dev)
> > -- 
> > 2.34.1
> > 

