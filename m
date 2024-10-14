Return-Path: <linux-usb+bounces-16166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB199BFCA
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 08:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B71C1283582
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 06:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1351213D893;
	Mon, 14 Oct 2024 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bCPKhBVb"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2042.outbound.protection.outlook.com [40.107.241.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7350614036E;
	Mon, 14 Oct 2024 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728886158; cv=fail; b=iwb7ueiLCJ1A95M+BGEDboYCCjwIyq9X+Xkj2CGFkAT4OYY3s+I0FB+SpUVD8bBdI1ynM0A5rJxIP+ylaYMiZv2chqtjuSLp955cKz1U4V92wAe+S1Kh5Ydx4RHw0zFuydfpQD9atA7YScLK8lrguhx13NUluMDqMGK86X+KYcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728886158; c=relaxed/simple;
	bh=uvFJ25rVDhuzXXALHqaE2LCgH2IvLtuRZJYokPJ40OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rkb9v97mJLE85sS+kl+mzWjsDdjKDzxkB86OTBHz9a1/EzdWZJGixtC1ZqaPQGinGS7s9FZ5q4XJVdyrPxCWKInhHA+ZGP3N8Jitn2wgG0U/Dx9AL0R//XeGDYitt0IJh9LOtIujuXvLVDxkPqXCtcq5vvMPeNpHSe02mV0ujzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bCPKhBVb; arc=fail smtp.client-ip=40.107.241.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEqK9MiZMkIGvVnHr9RGklFqWjpEqH25u9ih5bcHWIyQbor7QnX/njzeFnaTDHAb04KhsFrigAuK8+RuC2Lv9eS5gpGmUTIxFde+JV8ftIpO2FkCgk24I1pf4TukxcyBm9uJBq5ve4pVvLH+HWNLZSo+U4iWU1Q1MHxAVNwfOD+p62Oqh/n/O5SQGT1geVStpnRYfCI500UkO+WualXAlwPEWbB9roZps9J5k5qykcWQTVtx6zs+3694v+E2jzA0JT0L/uxcqrS42kvliTBa7KD9XpMJIvdB3D+NMzEV+iBuZIli9zKx3ElGtpyE/nUGtJt1wAW54Mm6SBBFEaRT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJCXz99O7+v2C8fCh//VpHfLHePhsgegoTHQjUf16W0=;
 b=CI3Ss3EtaC6dhIQHyZGWS8S1tunb+HHjX5zSB0OyHp/nBqPh1EKQSWcKaeIngRpn1J24KDRp1b62MCA2xP3mkmrn9V832I7ehtr55iO8kg627jcpxUE1SMMdVOTIx/H57pBlxapGRfhTOF+TamZhh/Lq2hOg0c+rSBhkKw6h3OYysUnR6zA31a9HxcUQl7WPPAR8es2SYVyH/tblKds2vmafby+GvKIB7unJNgDd+BtwMSHuy9HxCjCYOHunVLKcOIO0DsFdzBaEud8VmcQZ+P5L/jjqqOrcybcSIb23eGwzm6LVut77WwK668u0MVtcHl1nCTvfZCMTzUrXc0sb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJCXz99O7+v2C8fCh//VpHfLHePhsgegoTHQjUf16W0=;
 b=bCPKhBVbTyaUBfVcaYGmSnKbwvEZ0HdmWA7iBEtZLw/LexfoWlW++/9Uu8zOwbFWzhdZu2Vb28JaR5y4hTV6yClHfif03i+j+sPunZk5shpHVSw4KCwDxVty0SpHmVTllkLrysAknCmq4mOfM/0QxVCZBVbzzT+iDfqYVO0h40Hp25ah6E9+2XSL9VWHlk5SdIE1FoT5RrMiRkG7HFVhZl6HUYc4sSQ3b6FQFQaudt63/GUnJnn3yHxPg2ZGBkG8qZaZPaCYC+CCwLWA35AywSWnXJpJrv09Ato42BpWOKEm5sdCt+EFOGHRvPzYakbX0kwHsATaVq9opEUczJm03A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB9020.eurprd04.prod.outlook.com (2603:10a6:10:2e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 14 Oct
 2024 06:09:13 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 06:09:13 +0000
Date: Mon, 14 Oct 2024 14:07:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v7 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <20241014060703.yfcouhrtiwfyemhr@hippo>
References: <20241010090822.3915064-1-xu.yang_2@nxp.com>
 <ZwqzaKH9Ub8poNgX@vaman>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwqzaKH9Ub8poNgX@vaman>
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: 1998af72-1a43-4afe-7bcd-08dcec16b988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ry+lv/X4DcXZulcLx0vhUy//+UCrYdyNY6inURdNGMKKOQwvKZ1xgeKMEskA?=
 =?us-ascii?Q?u/OiWsn4/2J9Kb1BfvxrvD+btVurA4EJMk8/4KEKQlUDzI+grT9KLwcA+6bx?=
 =?us-ascii?Q?ocNk2B0UBwqDKROlDbxT4W0GgwvoeEuFt9951bMnCv4ohrIIlGDwAR/7L/Ur?=
 =?us-ascii?Q?XMHB9Y2mPQUQ3BUJst8j+Vx/Zzu9fT8gIKoHoRmpwC7SZ3eIuiZGZteccz7z?=
 =?us-ascii?Q?4Vqc8LH6kJ7V/9zTJhUmgtjc8hHEVBnioHURAsHzeRxgwAacGlf/jwjn6E9e?=
 =?us-ascii?Q?ZWaIcVZDnFid4gzDmRz5bhsZAWg5MoiDHr2tOCbfxw1h1KQdRlTukxp/84FO?=
 =?us-ascii?Q?gBwdzfLeY3PS4OOt3qhiZ7wcrDm0D7es11ldngdKL/4zkqwyPJUs9RJSIAk+?=
 =?us-ascii?Q?lZ0ZsXtXCU9/TT1kOlmjZ0CavrmUT/rjYGwINdcIwrMSLJtFa3+56XlYZWwr?=
 =?us-ascii?Q?yEc82sgWB7Yv6jRkaeNAB98qvh+AoFK+DyQakzSjz9PH/JgET+L76mNuWxbZ?=
 =?us-ascii?Q?P4EK8uT/+rfAVcJXEbJJNkC6pTh7u/iyLCpttZ/fW3WqDPXXob1SnRea+Dy1?=
 =?us-ascii?Q?lbfaYFQx7T3xoofrtuz6Bh0f8VEbCP0yQhU/RvCvQzNd+T3z7Aha2kEefgP8?=
 =?us-ascii?Q?VPsnQu8qfxNMIahr0v1SEY8FCXqd1ENQgJC1yE7pHJS8F3laAss8QhHic+at?=
 =?us-ascii?Q?7z6tAmea51I19ZnFlBwope65s3RtFfMqqOjAoehp9yd/SjGyDiiM/iIuPOll?=
 =?us-ascii?Q?HXSAv6enz/19BBhiIrGIn/co/3t1Wm6vanaokFSeeZ+2RsmXA00Y2uihIuVV?=
 =?us-ascii?Q?TD41hbb3yaK/8XFnT7rLzzwQdRH76onsOalqnR/iCM2vy4HuiYavKtROT0AN?=
 =?us-ascii?Q?T+dM9tN62LhTfvow1vLbtcFQ/V59exSFz1H+g0eDJ4QRAVg+DfA/eg35c6rL?=
 =?us-ascii?Q?zSKth9mU/ziMreCia8CS3q5DAqWsje4mH/EMWwP6cmvu76gadvkjZ5aUxxSs?=
 =?us-ascii?Q?hCinme6A1JefZWsGc8ofL10D6PcQo700Zh4DeMN8j9GvUTnTdFdMJeBQRjxT?=
 =?us-ascii?Q?pDL5ajqLPr2GVoAuOVyIBtqoZ1PrPLTzRw6JJL8zaiNEmatgoqm6MKQnA/aT?=
 =?us-ascii?Q?6I5Pt8l/kJONosYKYutXb1ReLDeYU9hgvzEIsiK11gt3CKsRojd4FN4LyQdi?=
 =?us-ascii?Q?zvUC2dm0U1og/UGOO50lWjtCn7DAHi4Wxj/nIWhhZl2YoRnqrBJ02bAUOsGi?=
 =?us-ascii?Q?V3RWrLjmRwyADKpgNwMSNH4ah4WhQBxdmgdJVj6hqg0/eOdPVA4sfaqsfJnh?=
 =?us-ascii?Q?FTwp4y4FxFlGJdW9ryHIhwkVhvLv0Vn2Xn8XIzNVEduaHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SaQY5laakmjjJ/CRlQXA7k2gAL8uZswlfvDpDB05ETAaOs65G2o9LBFBXcps?=
 =?us-ascii?Q?/qmFM0gtcACm/2rCpJTgbFsY7tL+eFoMWcWmMdThVBdRvrfCRuBz9OD+FmZX?=
 =?us-ascii?Q?Reih4Jx3K07wESiirvcY+uaM2mL3gpLRfWX0cH0Xyg9IBJVbf4z0Et959S0C?=
 =?us-ascii?Q?hnT3ZwYTi543NvEEwVm+PjcAsTyuAbKy54AYO0Nmnohclw6fxWVq62FQYxLu?=
 =?us-ascii?Q?RHUuXAFzTts7omDPt9M5DCSnVfdWEz8iW6pIsMYZABtT7whHm9knf87AsFN5?=
 =?us-ascii?Q?aiR4fAzF5z4pF//GgPb1cErGXlWsQbtrO+zual+Cc0ZRHDAzhvveRtxzH09i?=
 =?us-ascii?Q?T+4iYb19Z7uajr/vgn3ZpCpWypehxNL/iXAuD3O8XASvd/z7sI3e7JCaWgvt?=
 =?us-ascii?Q?2Z6CkzTJzDbNNRbYNROBNDa963aOPDKCKuKidnrHp0BVp8ls+jc9QU6X2c6J?=
 =?us-ascii?Q?INKt2hpHnMYF+KK6kj5FTjOD0DJjYxcawWsfa9O6AyokVeryOAFMqG74UfQO?=
 =?us-ascii?Q?qe6aKSiY5vg7h6megjxahd57VyNJcEVKh0CThmwpJsC/U2JHUJPeXU/ZM2By?=
 =?us-ascii?Q?shMyzFrPaBrNuElRNEkfXNVEOaIp5FtjHfo9BYhFQrTTxXjWt1E9meH4qU+7?=
 =?us-ascii?Q?yt6V1eFaO6jEYpLKFrRfAzi3G6e26GRJ/pMtfh6CgpKLsC45JjmU6Sf9vrmE?=
 =?us-ascii?Q?IgfJOi/4C3pwwpxATVU28unhH1Sc/pZwkZcsE6HD9er7hYGZESOk4HHso075?=
 =?us-ascii?Q?beeO42vCB1v8uUgCl5wrfFDtvGL2rUV6Na9X6Ed/q6Ow7RmJoohVzecGTE5v?=
 =?us-ascii?Q?3dd9Xwb4VMuiEgKYV7L9CgksL72moVJ6eZQLpvAXWevU701qK5bGOH6MM4OA?=
 =?us-ascii?Q?Fj/2jVtRXVvp5pct3tKcscUfZcTVsNNYUEJlzaqK1pre7qBIY8D/bRYB8GIa?=
 =?us-ascii?Q?7rQe+nlSEvT/WWH4WvgYF4PggoMO/uOt9u5Ixyr8svE1zopX7teZuUovEEYW?=
 =?us-ascii?Q?yP7i4iNDbYyUSZ2XOGkFEruKlAhPCthDsL3S2Dzrk5aOk643h0af18XoEPsl?=
 =?us-ascii?Q?963DwTXbaCYN+vYWrlpBnD6i8fIVJEw15B85VRGf98kOxou94wl4cElZbJ3b?=
 =?us-ascii?Q?L/5Jhbw3Td2UqDt/thZykFV1PPrGAznhCcPRQ+VU6/oV2ZmEjwYg/zGnCc5x?=
 =?us-ascii?Q?DbpHMAmIP2/X0rml2NtOQJBuL70NgGR2H8LaSwBWSTtJzG0Oig3OLq0sWJKw?=
 =?us-ascii?Q?iD9BAKJpaY9AL6ClufssRXzRoLElTnWm9ZtQC9eWmD0mV0uJpcNxsSNqIRvP?=
 =?us-ascii?Q?imnlNBS3zbaAhAD5H7F1KCTyO23prJ2EF3NvI5uU1FnaxId/iSONzJmGvQGR?=
 =?us-ascii?Q?PJG4GbwdMNaZxppA7PfxGFgpB/dYbJ+GKkjYR2+pc6Q6uki7nWy3adGznJyx?=
 =?us-ascii?Q?7zHgT3Mt+14ADb3gbSKps7j6NLmHAx8aD1//etYasgJkJrysbsY5ODboq96z?=
 =?us-ascii?Q?jdEJYEALfnV5oF0aIlO076S4mM7yOzfbpDUUcAoaSkqaplTC+y3S9yTH4SjI?=
 =?us-ascii?Q?AjtgYzY0TOfnkmeN9naiVGqgCcBxXAbX3yYqLo4P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1998af72-1a43-4afe-7bcd-08dcec16b988
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 06:09:12.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waO+UMW0QRI0efpd6LkrahO9h3MefS7Dg3I3pkY748cpDVSVPzgEqVtoGKcdRtRf6su07vUy+/s6uTkpb6AVzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9020

On Sat, Oct 12, 2024 at 11:05:36PM +0530, Vinod Koul wrote:
> On 10-10-24, 17:08, Xu Yang wrote:
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
> > Changes in v4:
> >  - remove compatible check for imx95
> >  - check whether tca register region exist or not, yes means has tca,
> >    otherwise skip tca setup
> > Changes in v5:
> >  - no changes
> > Changes in v6:
> >  - no changes
> > Changes in v7:
> >  - fix sparse warnings in imx95_usb_phy_get_tca()
> > ---
> >  drivers/phy/freescale/Kconfig              |   1 +
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 243 +++++++++++++++++++++
> >  2 files changed, 244 insertions(+)
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
> > index adc6394626ce..661191276b27 100644
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
> 
> lowercase please

Okay.

> 
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
> > @@ -64,6 +120,175 @@ struct imx8mq_usb_phy {
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
> 
> Why to put a wrapper over an API, call this instead?

1. We add a warpper tca_blk_get_typec_switch() to get typec switch device,
   when it's not needed, we can call tca_blk_put_typec_switch(). So the
   function name tca_blk_get/put_*() could be paired and clear enough.
2. We don't always call typec_switch_unregister(). It depends. This phy
   driver can be used without typec switch in Type-C module, so we need
   call typec_switch_unregister() when use typec switch and needn't call
   it when not use typec switch (see below). 

> 
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

tca_blk_put_typec_switch() do nothing when not use typec switch.

> > +
> > +#endif /* CONFIG_TYPEC */

Thanks,
Xu Yang

