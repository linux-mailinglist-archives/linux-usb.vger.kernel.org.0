Return-Path: <linux-usb+bounces-13066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6DE9473E8
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 05:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DC3F1F21632
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 03:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4C147F5D;
	Mon,  5 Aug 2024 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kk3vldSq"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2042.outbound.protection.outlook.com [40.107.241.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6728B13D50E;
	Mon,  5 Aug 2024 03:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722828494; cv=fail; b=Ud9+xBqdEGKwq68d5igT7E88/EA41bO/KeglOd6OxajMdIiyjai7INDcDNaLE+s3757OtMfnzY5ddE8DVKjccisGbdyo2ZNA/TpckcyAz17LAw5SI9tT0iWoF0zrZzeU5fVpVSib8d/MIWpnj291KNayvxjc7Ehx2qCjYYTurOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722828494; c=relaxed/simple;
	bh=MV/2p04RVOc4pCiZnKFuASmRAG21Xoojb4pSrji1izY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V6RqCrfqvSaYNyD6oAEDeeoUjDCIYV5iGkyZgKIq4zd4siAxgnWmeyJaBdZdBGbv1VM97DFP92eLi+l1loTAywqBks1/jXC5IgVZAlRSM//5HSYS/GO6ADsbPzUtn0GHDGCiqYisYZgZ9dfbQmvUE1xG4JLfcgrVA7ILn99XEDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kk3vldSq; arc=fail smtp.client-ip=40.107.241.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDBpBcWm86sGFr4K8MMH4o0rmObCHvLBGC1EjfY7YGUMt4JTJiDgKY+G8gXsLhNeJYDljaPva/YhldYDpdfVHj6Cm84VanwaluJc6S0r6s/p3WgaP5GelBZVNIOnt56T/DdqI2nCami9OCFfpBccefFdB3aH3Bmdh2N/I35dz+d0Zyk/z3JsRLhq2/xtbcpURFwsz9t1szbOjdh+WiefR8DKJiYOdKjzo2hkq0wRi4IO7eIJJlhtXbcMzwkgQzvLYEDlwLce6S/vooYk9oR8wMB9H6ZWLG52fgSvkVqfQpnvx7cMjnwrlJN6XaeMHGh8ZVichXeac8aPFGoWHXDukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0qOyrV6M5AusPuIo/30TQcHI+a93osSIsiuWpmO9a4=;
 b=ObUmsV5UeYf4gA9FmqkwDeTtMM1yh4WpTBxVfDJ3KPx0JgfYhD57+sIR7vdf7m+3GDGTHdWHZYqlUblQnv11q1AsT5sbP9V0W9mR7y12qiYwHGRWkytVR2pO0M/uGzdgiLhr5tcDnC5ggdBc+iaDTdq7ZxqMUOy5B77yIwW6LxS7R/ER5DS0QjpxcePGyF/YdEYtV7E6uNOvOYABBeP7e7DWI/iIghIdLNnvNn5RPG17kv1nPqgVR4sF3MI4fSJNb+KsX4H2Py6ay18GBLcFG3+hlJqURWS+SVkQSPINw/0BEBl0KIqYQbKejgQcFt+InkR0MBIdgzjZFVqBl/CZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0qOyrV6M5AusPuIo/30TQcHI+a93osSIsiuWpmO9a4=;
 b=kk3vldSqkXAvK9bRfBFzc3H3QHzO/wJIiDkZhET9uHfRcUFK5V1CBvhkeoYKTaY6GfPfiPFUHvhDFo9AQvugHXoCwHDKIsWn+iPhx3BvVMGFEcqe+Kpta8GD5LV2M46xA5FfcgETROnGYRGNpkT0JFAZ4ctyT0nIS2bDdPzuKpgB3UxQwHUVd4JhCGAyMQwRefRDgvBn+JC9lvU2m2npRA9rwbfQfueCbrsbDelYa8MVTPkFzZGWenS1M4mps1vX/8dRXtLY9OiHPXezfNZ93n0l4s4YU6xGmCyTW5tQqFVV+53QViqKdaH06Am4ffj8+6EmSs8jNDSDIKaTepuBJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 03:28:09 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 03:28:08 +0000
Date: Mon, 5 Aug 2024 11:27:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/5] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <20240805032729.awuai5v67lmzq5mm@hippo>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <20240802091702.2057294-3-xu.yang_2@nxp.com>
 <i2o5pk7jnni4bgc6txktus26dtnd6quivxkslgqkelmyb334k6@s5waxd5ep75f>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i2o5pk7jnni4bgc6txktus26dtnd6quivxkslgqkelmyb334k6@s5waxd5ep75f>
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU0PR04MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c8a9be-8d77-4ef6-dfb2-08dcb4fea071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N5ZC9plnJgdQHih20ZFTHvM+Im3C60jzKw64rUmHhfuf6vsy6ucqgmr0vOxu?=
 =?us-ascii?Q?7ynhIZGd8WioA5DO4M5c1evVPLaRodWkB28Ln6AoYTSiXO7GE9Xfrxv89vf9?=
 =?us-ascii?Q?7Mqm9riJs7WIBjtj24C57Mht/veelc63v8WmCqtYQRlmDm5853iaNGzlMeiL?=
 =?us-ascii?Q?+rtNpE85GOspMSY5W9b4xKxkPMyw4aVy2CbQ0HCTMSSGUQ53puc01Ap02ZwO?=
 =?us-ascii?Q?hEM9zDSpgx/Jjv9lrmrN6ngBnqygK19aePkw5Ms9c4s7a5spauEes5U1otw4?=
 =?us-ascii?Q?lupmD/EQo41Dt9xniqO5Yo2NOk4QPTWVRWN18oDP6M4H0vUXJneHakfnNGaf?=
 =?us-ascii?Q?lA9H5vUbAhzHwzyZYUl0IJ+h8eAhp7Ob/0yNO42bCINGEiuD4FVGuReuCUUj?=
 =?us-ascii?Q?g3tj/yOkn1ytHn/UHNqGYyXNx6SQRgTIGUuXUXtHcI6RHcbghO79oZf6GBkf?=
 =?us-ascii?Q?EHJo5AX5dKajpCWCTZiJ46laG1ti2RkLob9NfPvkt7dD3SJ90MNer+nYhpQj?=
 =?us-ascii?Q?lrcQvWSpzfiN+6l//Z9wNwglbjJ5XTlWnW9GUsmb9WHexsCYdO2CWZ81VB5+?=
 =?us-ascii?Q?6V6nD9rCAARgDuLvcWCbmxyGECVhsvoHmnm3hoZ4zOb7r+6wLd1vUIc+Htha?=
 =?us-ascii?Q?LtH0uZdR/gKTOfCTOSa0hgP3nxiEBxe2GnsfA/7qkkd/oMIpeVEQGvU5FYQZ?=
 =?us-ascii?Q?8i9v/HWNsx04nbieuMl3BrsWdPG7rgnuu3AKZe+kUyLu7B3b4urclDMBnNP5?=
 =?us-ascii?Q?f840advHUUSTbDVIG7aGOE/8KO+aM/fZZqURkWVserCe4C4HpyQVlqeOXDgJ?=
 =?us-ascii?Q?XpI85y0964MaodeYTyFXUKxRnRszxgsdzMV42W7lVEYqMoDiGEjLoqPNfFOX?=
 =?us-ascii?Q?nht5JCeOsvESrxkQG1RzS/1A9FWE+wIKey0xlzRB8TTx3LxRDV3ti4KL6UIf?=
 =?us-ascii?Q?B/VUki2XXPTepaCT16cTnOpDQt+Q2CEwTdys+LEJqGCa6yYrKhvTobmxRu27?=
 =?us-ascii?Q?UifoeZY4KBRoUC3IPu+prAjWS76OPLycvZu83GvjnGpZNOtXDUn/ynBUoQCX?=
 =?us-ascii?Q?GiUyk8L7pUSWB4ik82hvIa+nv7ln+wtQuLsK156YhcftHZt0qq+ZUFRzT8TU?=
 =?us-ascii?Q?N7IsK0sYCgY4A+w6NvzWl484ajPVR0khasuFusln+2toyUD6Hm4jaUDGAea2?=
 =?us-ascii?Q?7kHxzFKVEouMyL7oSeG0Fyne6QFRktuFGWUzcwC8KBIRteHOcMvgVG2fUxZU?=
 =?us-ascii?Q?D34aTFvcAx3HUqTGl6LZJeXmF3owDkgm/14VAFP5yJ0/eIGGR0nqZyEyHL+4?=
 =?us-ascii?Q?hxbJ7tgvdqNbB/w8CIM86ycIDnAKTponEYNRkm60PFICoVcJ+5WqIWpjSnya?=
 =?us-ascii?Q?kObPMQ3bVx4PY3/2FLkPE4OqTDPSqQsGYPOUz7iHbi4wtbMO9g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eV7+093SZlt2yJq5Qc0umGqEF7E+HiIENpDgn/5ESP0lK1Fk/Tj1z0JC0GMi?=
 =?us-ascii?Q?oZszReVM3OJPzb9QFB5wjKus1mbJBRVqQZwHI+AvQ/C5qMDKuckzramiQRv3?=
 =?us-ascii?Q?k4amkiC6XqVBjRVE9tCuLI5VvdmVzRerRaXrOVWZHtxQd2nctEs8ayns5FFj?=
 =?us-ascii?Q?UFonuoeymYrKiRv5ps4dFDb6W6KaaEilwk6fNT7pfJ06XnxSAeRF/oeJ5WUm?=
 =?us-ascii?Q?oLGYWX3/y0vSJL3gLkS1/lRZQRL4r/BUxMN0ol1lCpmsFG7XAwlkvxscHX+7?=
 =?us-ascii?Q?UJ2PJGtcbPj7FC+6w9BjkSTrIRbBu1LMPvYL+iKi3U+DiAwlAm2XgO+KrLku?=
 =?us-ascii?Q?SiYqVAQOQYk3VV4AGBo1C1os9gn77rN+TIwSYj+9gwh9g4DIQRBKVV234GW6?=
 =?us-ascii?Q?cq9oCMw6UlGh57to+TmjjB2UYOFX5xtFBD6+rrsHCmxp+kU2GQzP4jIWb6+m?=
 =?us-ascii?Q?MZBr1ESi2M4fvaruQmG0NTdFKJDcm4AQe1SW11eIWIWsIlVgIuMCAehD1oai?=
 =?us-ascii?Q?3C4+o5e82aVgIXYCVpQRrS8tL9h2M72LBWUWsKP1YXKsVUFjdYiUl4GKfNP4?=
 =?us-ascii?Q?iFMPuhfZDl/pIATYzPYFoqK+dBFOd7lIXkGJp+8DPqNJY/4wv17zbaFjytig?=
 =?us-ascii?Q?0r7qOQuf7G021w+OP2GImTfIeWjpWg28hh11sT9/jTghVgAAeRCsSAhEjVlf?=
 =?us-ascii?Q?YkwxqTilRS+ZFBKAUBvRFqYVbkIXWRl77pzsl/BKPc0frqWU3ZAe9BembSQG?=
 =?us-ascii?Q?qJWqXakmzkggOl/4tQxXSwzqLi4kLdysjqodNits3vm6yLt0QVF1LTmkmq6j?=
 =?us-ascii?Q?39UuOG2G1/hr0UaJufD1xJBJCPfUp16McI8upVWFzd9JzlqolSzZvboP9zBh?=
 =?us-ascii?Q?zw9t81rMgFWEcsiyK1RAqvvladvEzwiloP96iqGYcwVhhKNL2EEu4IDon0va?=
 =?us-ascii?Q?MZeqAXlZ4BKFdEj+D94ECKubFQkZd7XKEchRfBeqLTWwfnkP3WMI0jsPihMP?=
 =?us-ascii?Q?omijNeltDKIn+nmWCnOu4H45dWNOL6UFWEEV/P27BFUdQ1OEs+5sJSphz7bM?=
 =?us-ascii?Q?RYhcJuZvz9+fsU5p+hf+3uyHfwIQT15j7FBff+eyCXzjL26+fnzEkZRx9BEI?=
 =?us-ascii?Q?HboQhM9TGhSn3rUKjoybsSdCpE/pwZdIu1ApXxIw0aL1DgAhhYhuV5OHVjIm?=
 =?us-ascii?Q?IvGJv8u2O1qLaZTLEyKHxmsvVqlHEw6HAH8HRl2rC9ThdnW7RYNMqorFtfQi?=
 =?us-ascii?Q?xLeR89TonlOEgYrxFd4hITbzKBh54piOY3Cy32xcaxRtCkDiq25SurQzljJS?=
 =?us-ascii?Q?DfqFAUvaZJ+ozGYmiN+E026ozCVbK/yenGUG6p+ZZh69QtiqauZKGG3vlI0j?=
 =?us-ascii?Q?eQRTXrSjWp2eWrMaYz57pTeCv+WB9p16Rh9x/+L2E+BGyns5fn2FN0bRVbFh?=
 =?us-ascii?Q?WLbQ85Km2d23v1br8Dp/H+boDup9pFnN7D8dwBX73xSqRJbLJnYh1Y6h2PLa?=
 =?us-ascii?Q?s4CJm2VcgtmmsRlliz9UDDqFAQdu+IRjf+kGcOQ5QvYdUehjhlBdDg2R0qic?=
 =?us-ascii?Q?Ls4vQjxOiX8UgHr6lULq71bWJ1tHk6d5g11lyGG5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c8a9be-8d77-4ef6-dfb2-08dcb4fea071
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:28:08.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agLNNliHnkLocX5F6V847BUw4U2nvoIHlOlu1yFkbeaX30aN6yX1kyJfnjSEG5R+yLacOj8qj2SAIdAN6SOH7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9466

On Fri, Aug 02, 2024 at 04:52:06PM +0300, Dmitry Baryshkov wrote:
> On Fri, Aug 02, 2024 at 05:17:00PM GMT, Xu Yang wrote:
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
> > ---
> >  drivers/phy/freescale/Kconfig              |   1 +
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 238 +++++++++++++++++++++
> >  2 files changed, 239 insertions(+)
> > 
> 
> [..]
> 
> > @@ -398,6 +624,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  
> >  	phy_set_drvdata(imx_phy->phy, imx_phy);
> >  
> > +	if (device_is_compatible(dev, "fsl,imx95-usb-phy") &&
> > +			imx95_usb_phy_get_tca(pdev, imx_phy) < 0)
> > +		return dev_err_probe(dev, -ENODEV, "failed to get tca\n");
> 
> Pleas propagate error returned by imx95_usb_phy_get_tca() instead of
> always returning -ENODEV.

Okay.

Thanks,
Xu Yang

> 
> > +
> >  	imx8m_get_phy_tuning_data(imx_phy);
> >  
> >  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > @@ -405,8 +635,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
> > 
> 
> -- 
> With best wishes
> Dmitry

