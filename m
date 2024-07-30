Return-Path: <linux-usb+bounces-12608-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E29405A8
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 05:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22C91C211CD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 03:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D0D14659D;
	Tue, 30 Jul 2024 03:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nVNfHea+"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46CC433C1;
	Tue, 30 Jul 2024 03:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722309079; cv=fail; b=FFnNkiJ7SldhMJDUOPtB7s6motWTv4YhTlOB5oqofuzJ0sanA+Y4fRNqdIW72JyLWPCyRMyW5xibAged7krlw8UpiqAcwk6xETNMWvns6cRy9/buyGo2NrnA1dhUWFF+kl9SdQsCtOnx9zO7aAjP11VcWNg6BoPRXK3ExcxnHPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722309079; c=relaxed/simple;
	bh=msDmlF4cughrc3gSPdQ3M2C3/87Tvr2eLN1rS7gd2pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fzk9poaTkwbfJinsBQO5tO/2gDU+thw0zr2HONFy2rTMdWN8Gb9I+ianZofMqa0RKZbEwzVasve5REpzD4PML47r0Nmt/r8+26+uMm6l38+Z8gPgpl7/9lMJy0ilVXHGH58rywlxlIGHuxDV0E6TRM4WpxAWZSZLEic1cClrcuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nVNfHea+; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kN3DGcLTAAGqUQhK0bz0l06d0IgZyq2DHVI/MZas1EYcZzUd6puUunl0a22so2d8kGbvo8maPfjuiW/oadfnVa/+/rlskllOsiRGZ8YeYNmbHuz8+Bmrc/XQRXV5nt3GO+n6nbHSsx6YbbQIOKPE0Qsxjx3tCYf8FTFROVhIXcB9nxs76PUnRI530M1F2eAzblFLRg8V76SUMM4P+Jf2E+adg2lmSIA+XDi2QkcViAW2nhQBc3P+rsMKYJztq42CGeRudz2V5Rn61L0Nz+clrYAdW1q6LsB/F1NvOWo3ZKUp0QrPRNq9AT2w7l8qM26pnr4EA8xAA3z11Gez99UblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWaHd6n9LY8WfFFmvR4gTGMysZNPElevp23FLVT5WI8=;
 b=agUeuS1Sn9W72xUI+xhK8LTfmeW2JaB9Npp2HMsPdyhb3kjL+VYOnxhXVVsp9X/o4DwWmks/IoDyOQMTp4Y6Y3KEALiJBVdQZPce6qjbN7jFcMYEWgqRsLBbkAbn0VUd2jxWr+2lP/Hl63ty3WQdNQE5VhjLPlS/Ax3hxsgtI95bm8nykbxSwEJjwtDnQiBz9APQinF+hWHTn8JJAGjXV9XYmpr+KIBgLQ/fYUMBWrK+064PecZQ+3884ViepFHKjOpFwMuKeVweDrr1F6aGYGPnlRYFCj9VzwHsvdXVELBwRh2Lky3A7kEYxuXYtyjKQKxK2zgUZ9oL6EApN98+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWaHd6n9LY8WfFFmvR4gTGMysZNPElevp23FLVT5WI8=;
 b=nVNfHea+TC4M+PS3yzR0m5jymEAYe8h4PoN7b4awFtd/9Arnv8p4eR1EdJbf+cw+CsCPaHzut1nJeQe8gRdnTTXmPUGcUFkLnWGekSpOdQrgN/0KTcxS7HSJ2Jf4dEDxSlGkEui8L45dEeGhm58AIQCqK8NM9cRRljJLUAW+iwoH2GgaudpwVaUrhnTcPLe3rE1piGNmqrQ3mx5eTVFFcbWZLQsJFK/13G8YyCtQ/A7j7usftOFhMXcR7J9HO2U1qZ3i5c0+4yg06M9dyGqLmL0P20iWcx6oe94i6W5neijMyyM/NLpHc7sQRJ/5KtfYnsz8poUKitcL+NX2BT9iCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 03:11:13 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Tue, 30 Jul 2024
 03:11:13 +0000
Date: Tue, 30 Jul 2024 11:08:36 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH 3/3] arm64: dts: imx8mq-evk: add typec node
Message-ID: <20240730030836.xu5qq7xgse77gzb3@hippo>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <20240729081039.3904797-3-xu.yang_2@nxp.com>
 <2qifmfgul7ks6kozm455jci4rdbfnh5wft3nyt6pdnov6tcbst@vjosluwibkg7>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2qifmfgul7ks6kozm455jci4rdbfnh5wft3nyt6pdnov6tcbst@vjosluwibkg7>
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: 99599304-dc7a-447d-8744-08dcb045449c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c71K7NmNs35iwuZ+HK+p5cttP5vK7OSXDarjCPZls9GRLIudUGhSbrjD/hhS?=
 =?us-ascii?Q?kul1N8fEAWiNOxljiz/hhaAn4xjszjAUaFzRPWaWhV/z2gj15W1YfC1JN2ql?=
 =?us-ascii?Q?+TnkyHNl9+rjaS8suuwuULGdLT7RHaYDVonFg+r4hcJEMQlypFGuzU1tBSCz?=
 =?us-ascii?Q?gkywmGSQomnRe3ILLCw6QOd8xWgc8OqwosxGdfiA4nP8PXvouSMSx1cpMnnd?=
 =?us-ascii?Q?SFXrDZDelO9Fpj22Nkjvjgakwxywx9EzKh+GnuQaQ8dHpfGX4f/x7jRUxYfq?=
 =?us-ascii?Q?xVNMRd7W8wg/RTg8Nn6d9VFJZrvQpn57KfgVST3dameW+CON4JVFTPISZnUm?=
 =?us-ascii?Q?Kb0W0gddCywyJJj6D9PAEYU/8TXdZLy06CC0tTSjrqNeJPzK06rQztZC3eEe?=
 =?us-ascii?Q?/2ZKbVsDH7t6SccTEmVRTtyXKcfPDZWuoghANzq1snx+rquo8tOEVE/x5gIq?=
 =?us-ascii?Q?FnxPxkGtKjmRgjgi1BmyrqTQbodnYodAL+fxzfFeoUPH/H8yzBCzpZzmyqfz?=
 =?us-ascii?Q?LmHGNK5qLSKt3oNEscZfxdCyekhJYUDpggzWqICmtZeYXi5oJ0tvTx5DEI/+?=
 =?us-ascii?Q?zNTTZ2cm0zoi77xj86DOuqtkFzV2QPNAnCW+YQFqXykCaY7+UFIXnS+7KPk7?=
 =?us-ascii?Q?ooUkBkapX5/b5jyRnZhw2SgqSqOMjQXj9YVvxI0JrNo8qKKuPmX52aZkHJt/?=
 =?us-ascii?Q?4DGAQgNEC7yUcpnmZilgkaX0mIlx/8DGOS3rj4C4ZuuZ1fq5Rkqj+TiT06vY?=
 =?us-ascii?Q?xTgjtUBn8wBX2OLGXgMdwdfmIWbaxpFa+GvH/RRNvrJQAppHsH2uWKFZx7Iu?=
 =?us-ascii?Q?9V3qt3QjD9D6ErgBX6H+Ja2PMl1R7yChpdXaZ2xCtjqA2lBvSqJVheJ5s35S?=
 =?us-ascii?Q?1QEmh0YajR/1SVyZ/nKi28oyXRhpYfE5ZbhC0FY8pjhN6SZoHHFwTwXtW3Np?=
 =?us-ascii?Q?yuR8TPahob/7kS4HjpjUhElKbaIUc5Ayl459EQpxu30YRbC6IRU3nQdTPehQ?=
 =?us-ascii?Q?jPACesMvS1gTUXxdE1jsxd4oh+aXtFg/vPEqnM/4ZFZfA3ceY1zF+RoNGQ/5?=
 =?us-ascii?Q?auXyPyfpv3GG9zQFKluvsurXA+7LEP/1wD2Z7cZZs0b7zz2HTFVyIJMUWj9A?=
 =?us-ascii?Q?yesG7eqsgw93bSg/V+o0LcFDIYCaO9uCHJc90qHllnmogtfMm2eHyMFd1usL?=
 =?us-ascii?Q?naz4oAYXbRgENbKkb7evBpsWQVZutTO1YPNY0ahKioo9Ex6iG0BIYcyJsLMc?=
 =?us-ascii?Q?kuRhyye3rHdOoQ36nxT2o5kFBx4L1umAoUHkHVAGqjy3csh9yHxICYn3gfkP?=
 =?us-ascii?Q?S5m0aLz4tB2bMLj9/hFx9B1x8GXRsnKZ6G66Qo6qRMovxjGlIADSnVd+bKuH?=
 =?us-ascii?Q?38R5mK0JeavsOidyOdu/r5nr+R/Jcc5P/MdA/aJlYhBY26XPfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ggIjnI+vm2w5U9ORveGMM+9HgEb+MZbWUFAoWKdgozsotXTNSeTkLd96+JHA?=
 =?us-ascii?Q?B5mhwHnykpJeKXTTYqXNrDOjykW07alUqTFJVi2vBW8klq0dDmgt01GOjYXP?=
 =?us-ascii?Q?o32qOWQpvNJE4/ZzR02EJLVFvMVaqBHESsrJGbJuqZrQNDpPIdmqjUuwDd18?=
 =?us-ascii?Q?p15LZTiftf0q0JVGnL/16cKoYdCoE5UJb6MFX4gRqnm2P+viIxr0ZKz1Rxa1?=
 =?us-ascii?Q?yxsayDZIkgUQX4+QLUlJVKZEokXo7an0wQcNH4g3/YCJvWkplrfk90kF4pny?=
 =?us-ascii?Q?GqSKvyeIblLpSrcDzITmGlZRW/JaAQy1WguNjDmUxVTtdxIkNYfbjMm0bVKt?=
 =?us-ascii?Q?+PoAQUT5HAgTPGGbVCGj6J17mORsUKuu8ykhNssloAlR2CrY4HIWyea87fxv?=
 =?us-ascii?Q?0s7pi8dE6sE4aaPVWz0L4FO+EaRHFl+A7DccB3UAqLrUx2T11v1kGHit8pwW?=
 =?us-ascii?Q?9/LAnnm449qHPPR0XduP5gKqXm82IfAq+wUYVQYWpwbaB5bZpkXU4gokzRbq?=
 =?us-ascii?Q?CEFPwXtbjMp+74nIYNUeOL/UkjgmFKnQqi7wmeotNLrdmLyA1vpxR0lwwcIv?=
 =?us-ascii?Q?1fcYtRu3WdjzYFyxUFxdtL4AYaqLcUjRpsomoPL1cBTTmBXXfDvWY0hO4+Uh?=
 =?us-ascii?Q?WJxYkxJhtZvLqTQb0WW5A9tA00k4L3GKSFI9LuAD/DdTREenez+KVjxPssyT?=
 =?us-ascii?Q?NgMLxWSlgLP5QjfeP3+fdKXPfTgG1Pi9UpDjkwVUfjDVob1ZVAE58Q8/QOnR?=
 =?us-ascii?Q?mOUMOXXRKFHfuqk1Z4qvx4u7DEECm54aCixPQ105cUSO9VBMuDj+riqq4jLF?=
 =?us-ascii?Q?o/1dq6D1azhqCY7z+4Gbzrj0txddqG5zGN9pmZPlPlQXNl+jashZcWamEM2o?=
 =?us-ascii?Q?AKOztahQAGtcP5XT9fpqaIffAVWiCxg55iJBBVS1yUJRp3JaT4l4DI6Dn0Q6?=
 =?us-ascii?Q?00osKb7o3atO/Y6o3KGZcBNFEa0QtnzMTdXt5DDcdlkV84JSa7PfWsiBEKoq?=
 =?us-ascii?Q?71Swn/0UMDNdO5VFR48DjNoPu9hUhhMghepEd5gzUuiZJhChiFd1HvVxqX4T?=
 =?us-ascii?Q?QGiDXeS3M+x1EbSq2FLoxPQ8Qb6vBqJLqX+ags3G9rnUbmxuq00sWbbluLR/?=
 =?us-ascii?Q?Q0LJrm+rlNmkwKGs7nUhf3ZFny/9s4dRb+izhDGeAwfxSF/bp1fPjC3FfMiL?=
 =?us-ascii?Q?IB829eECym4JUELymcOpEOFYw9Je2DpmzLcSGVmo5/1R4KnWjUFqNyn3R73r?=
 =?us-ascii?Q?pDJzAir5CXNnN1UigzxhRZHayg8dBqp2epQSAFDjmmX33wtoXi33y11GM1gB?=
 =?us-ascii?Q?8mpZLCHzUCGTw8pOnRAEtOAQ881cDFbvFhDoxwY7PB9ZRwsF9Fkd2ROEwoke?=
 =?us-ascii?Q?0uHW7q/1X/v/GbQTf9ySbq8tHjku8hUnuKV1CEts3CtiLyC97QM0Sir1GkMf?=
 =?us-ascii?Q?78W9Hv/BEkXELx5lqIvZFUEhHFCTXRcoNJ5Qi1nptFJupE23W6M5bDyg/Ysw?=
 =?us-ascii?Q?K0RStDictjRHR9A7DoHfWuHba7fhsIvAD95+PwPwdceEGf/hp20WVNowmrF+?=
 =?us-ascii?Q?NjhCvH/DwzO3R98I8fMcCBifJoOMlIheyJOv6V9C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99599304-dc7a-447d-8744-08dcb045449c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 03:11:13.1500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xU7VrZzbBCdLFznfjJb1N3Wr3NDicDUVMhmYUr+rauZ0qH40cIRv6+JzTucwtjN+tjHItiDJ5mc9Lbs5aR9CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630

On Mon, Jul 29, 2024 at 10:56:31PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jul 29, 2024 at 04:10:39PM GMT, Xu Yang wrote:
> > The first port of USB with type-C connector, which has dual data
> > role and dual power role.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 93 ++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > index 7507548cdb16..008e8c37c76b 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > @@ -6,6 +6,7 @@
> >  
> >  /dts-v1/;
> >  
> > +#include <dt-bindings/usb/pd.h>
> >  #include "imx8mq.dtsi"
> >  
> >  / {
> > @@ -27,6 +28,20 @@ pcie0_refclk: pcie0-refclk {
> >  		clock-frequency = <100000000>;
> >  	};
> >  
> > +	ptn36043: typec-mux {
> > +		compatible = "nxp,ptn36043", "gpio-sbu-mux";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_typec_mux>;
> > +		select-gpios =<&gpio3 15 GPIO_ACTIVE_LOW>;
> > +		orientation-switch;
> > +
> > +		port {
> > +			usb3_data_ss: endpoint {
> > +				remote-endpoint = <&typec_con_ss>;
> > +			};
> > +		};
> 
> If this the "SBU" mux, then why is it connected to the SS lines?
> Where are the SS lines further going?

The gpio-mux is able to switch SS line. ptn36043 is SS orientation
swich here.

> 
> > +	};
> > +
> >  	reg_pcie1: regulator-pcie {
> >  		compatible = "regulator-fixed";
> >  		pinctrl-names = "default";
> > @@ -315,6 +330,50 @@ vgen6_reg: vgen6 {
> >  			};
> >  		};
> >  	};
> > +
> > +	ptn5110: tcpc@50 {
> > +		compatible = "nxp,ptn5110", "tcpci";
> > +		reg = <0x50>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_typec>;
> > +		interrupt-parent = <&gpio3>;
> > +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +		usb_con: connector {
> > +			compatible = "usb-c-connector";
> > +			label = "USB-C";
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +			try-power-role = "sink";
> > +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> > +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> > +				     PDO_VAR(5000, 20000, 3000)>;
> > +			op-sink-microwatt = <15000000>;
> > +			self-powered;
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					typec_dr_sw: endpoint {
> 
> the DR (dual role) isn't a physical signal. These ports descrbie HS
> (high speed) lanes, please consider naming them correspondingly.

Okay.

> 
> > +						remote-endpoint = <&usb3_drd_sw>;
> > +					};
> > +				};
> > +
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					typec_con_ss: endpoint {
> > +						remote-endpoint = <&usb3_data_ss>;
> > +					};
> > +				};
> 
> No SBU port?

Yes, this board doesn't use SBU signal.

Thanks,
Xu Yang

> 
> > +			};
> > +		};
> > +	};
> >  };
> >  
> >  &lcdif {
> > @@ -445,6 +504,28 @@ &uart1 {
> >  	status = "okay";
> >  };
> >  
> > +&usb3_phy0 {
> > +	status = "okay";
> > +};
> > +
> > +&usb_dwc3_0 {
> > +	dr_mode = "otg";
> > +	hnp-disable;
> > +	srp-disable;
> > +	adp-disable;
> > +	usb-role-switch;
> > +	role-switch-default-mode = "none";
> > +	snps,dis-u1-entry-quirk;
> > +	snps,dis-u2-entry-quirk;
> > +	status = "okay";
> > +
> > +	port {
> > +		usb3_drd_sw: endpoint {
> > +			remote-endpoint = <&typec_dr_sw>;
> > +		};
> > +	};
> > +};
> > +
> >  &usb3_phy1 {
> >  	status = "okay";
> >  };
> > @@ -597,6 +678,18 @@ MX8MQ_IOMUXC_SPDIF_RX_SPDIF1_IN		0xd6
> >  		>;
> >  	};
> >  
> > +	pinctrl_typec: typecgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_NAND_CE2_B_GPIO3_IO3		0x17059
> > +		>;
> > +	};
> > +
> > +	pinctrl_typec_mux: typecmuxgrp {
> > +		fsl,pins = <
> > +			MX8MQ_IOMUXC_NAND_RE_B_GPIO3_IO15		0x16
> > +		>;
> > +	};
> > +
> >  	pinctrl_uart1: uart1grp {
> >  		fsl,pins = <
> >  			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

