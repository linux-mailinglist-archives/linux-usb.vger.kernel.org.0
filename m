Return-Path: <linux-usb+bounces-14267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35316963F4B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 10:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B99441F25572
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 08:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9597518DF84;
	Thu, 29 Aug 2024 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NwEe88LO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904EB18DF80;
	Thu, 29 Aug 2024 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921762; cv=fail; b=lur29rZstecYJOQ+c8Iyo6W/8kngLFmP3m9aJimYjuZyOllYt3IBVJjSHZsves88583+KfpEZphDAkNjkZQ6yrI+VVXIrnzCfbjnVpaG4YtUgu4YwvfuUptEqqoWAKjEBFvWLMKK09IX0NNDZMkQMbM3SFDM+7LvW8GAfR8Tzjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921762; c=relaxed/simple;
	bh=HONK3pzTEtHlGFSEhnATAgj9j5ZyWJClFOwjDlXc9u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JFL8fGkA7zZinw2AGT6s7SOU0lH1AALcul136QNNqAHepUyr9DTvK0dNk3knJelmCI40exwt++5wadMyg0mt114rthBF026+CBIcE9YK32aPrkjNpeq5ga7dBjZE1phrnuHtBZd2pz4CgVfiRuSdOVLCwgRu4Etk2hpELUneu7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NwEe88LO; arc=fail smtp.client-ip=40.107.22.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoJOZyEWSYL7h12Q65+bjIb0aPlCMNDVxAalzitvMBv1RR/haa6Xm0R33GNAzuRSt7KMr6RJ8zC75E/cVGTmJvfVGI6v+mtiouDDk9wbjLt2ugmwNDGQoHeXr3ZrZOEIvu8jioCRvNyyhW5cynsWzFx6kJQlDet4dA2d+Zitvac/1wcCQM5q2hHawkojJ+JPd6yoIe5z1hia/bIohCFGIr4IpQJ0u97JqcvahB8pqGJWcShtRwopCNKLANCDEvXjeIzKVNySgqnpV6F6lI6r31KY6y5XfWIsp5PCyclqM7FqoEd4u7OLlkXVTAabjGlR4DHwX+3ckDWpNTOAd3hu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DouPeljZfXG7BPHIQh8DzNMzoD3gMuGArvrHoaCirBA=;
 b=YidFp3U0SbP29PnzkzlqKaA0ZnvWDpATsz/YUowgpxS5riYlf6XcI9ztytRL1OsvBxxB34FBC9XuTeMOHfUBOEVOW2lya/pVtmCYMUmF9OczyZE2tHPkcRDjaXVX07pHVP02/7M+G+kDkR63VnYmQI4Q6EAMPLPNbyDSPNCFaWvNoTND75ZHG0PUUuDryiLYVdVb0TGF8vYnmAntL1fnEq/ioICrGAnjWTAUcnAFZL8qZdHm6Y3PqRf6eK7ywDqEcgbF5BPPdyXwS5qzH6IrmsvZU31Bgd/2JlPURzbWDK3dYY/TzblA+lxtTWZtPqlhFyAemIp1JtBIB5pW/MLCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DouPeljZfXG7BPHIQh8DzNMzoD3gMuGArvrHoaCirBA=;
 b=NwEe88LOfqw3vOE7usV/8RPPe9fUZlP0EKUTGcpqcrFBdY9UtwBzYy7ExS4iR4HYxAW/vSHMmxQJRZWpkDC/P1tMYtTJHIio/AxSNYFGOPWHPqjBsmVy7OzYDQe/lrHA4kLxH/ERwHHsN98wW1r0SPYMzm5OCa+ergQIyaZ7ZGhF7RBCoKev6gYzCVp1TipXkg/OH5tNEWTwAOvfbWy8bsS7hVJmKZmrN7aDDV1V0tLALxzVFsuPNKfCPu9ivFTC14AW9DHlZQGE3GOzQKryV9QDzH5ztUlY6fsGhXC2Z3X6mgJh5x5ze5K5RvSyAamUXrQfCttv47ggpG2PAlMO8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10882.eurprd04.prod.outlook.com (2603:10a6:800:27a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 08:55:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 08:55:56 +0000
Date: Thu, 29 Aug 2024 16:54:44 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 6/6] ARM: dts: imx7ulp: add "nxp,sim" property for
 usbphy1
Message-ID: <20240829085444.ayfp2zkeeyxya2ju@hippo>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-6-xu.yang_2@nxp.com>
 <20240826065612.ol4fjib4g2jrvoy7@hippo>
 <Zs6A4OEgaC8a3gcw@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs6A4OEgaC8a3gcw@dragon>
X-ClientProxiedBy: SG2PR01CA0138.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10882:EE_
X-MS-Office365-Filtering-Correlation-Id: e5119068-326e-47e7-bc6a-08dcc80864da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YYqnTsRxVC38/44Q9acV+GqjEksln2cceTmxakSNA34lIn8LKaDRFRACiIAi?=
 =?us-ascii?Q?+ZHQvK0iAvd0S+26BcUIfmx/HAQkiJ9ObNvL75E/2nF62nXNrVwTnlxIMyWI?=
 =?us-ascii?Q?KW/Xkf294pkE0gesIDGIRBX5gP+7LenSweZTt6zd9KdMAqLKxA0bvOhj27eB?=
 =?us-ascii?Q?XFhxZomjl/Z6eCOt5k7+CeJnWhaCyMa5O3F1gaB+0t4jtQkZyerMhrT9O7M1?=
 =?us-ascii?Q?MvXw2he3D9ctp91lnjIK62T/8vSAtoj8XjmgDcTJu8IXiSaWb59P89jp+NaC?=
 =?us-ascii?Q?sYEaGmmKBcsolukHSPLxUzwLJmJD02y6IKxcYEyFZNIF6pZBh3A0nYFYFdhQ?=
 =?us-ascii?Q?Sqndpzb6uT5qOR3yX97kwALEsox+Hn04sWFOs8p+kBj+/SCuB9Ye7gIpPs6/?=
 =?us-ascii?Q?kBlNvAlQbZ/LmoY5JjGatQqsWXurihiM6qkUPtuejZ6x29YBEaDpDDnoCp4/?=
 =?us-ascii?Q?hzCQbhKC37N55BzEc7K3LgIsJbgO9oM4jSl2AS5y5upBz5VeiWSQ/NU7BqnV?=
 =?us-ascii?Q?EnHEutA9FuTAzYcSYNlSsTnOBJjRrr8s30elQnm8EpsxpLYfjlOsH+I4rtjX?=
 =?us-ascii?Q?6lJgfDwiUfDhwdQ0BFHjllVxsOg6Y1lzws65QTeWb7MLIidQOblbzJ1kIaLJ?=
 =?us-ascii?Q?nP+YCJQ7vVKSXaPajxxkhRRfTxO08t4KVXxr76Jf5s1lLfl4ZmzvEU0AH0ja?=
 =?us-ascii?Q?M/RG8FHjWbsUqNO763VOsPhMB852unhAHAYACQdxkSpgeHMf8wMOCRqRzjxZ?=
 =?us-ascii?Q?1Cx4TIzoTYrWhuEqza5aw/qP7b/d0K5Y9J9of27cCVX4dscuME7icvUf2LKo?=
 =?us-ascii?Q?OqsU+PWpl0fxnnvYvxmZCaMQTd9opRNvUHjhgdHgN7ol7FE0WTXJ6FxZDBhi?=
 =?us-ascii?Q?MPISlocXsVl0MQwhuEkshJ7fW5n4mtLizBiIluJ5Vu2nA1bepWWBX1+lARAu?=
 =?us-ascii?Q?RlY6sVNcFyxuDzOdSdkoMLTGbBllAkCSNtQh17J4BBeS9xtODTTofKC9MCCu?=
 =?us-ascii?Q?OGO6zW80Jqxs7ofhiDqI1/uYy3JRQr4kpq68XG62//8HxOBchh9TPlABKRp3?=
 =?us-ascii?Q?ko2sWo+FUw3E92ZFeX5JidyQFh0C+fr3Pzz5BTmTthkqNk/vfiLxdUX1Ujd6?=
 =?us-ascii?Q?3ZwGwDuJtKm4q77bylq+PcnyJVwsm0GIPjPxoSihdkcm/WZGd1OzCcQ9XExf?=
 =?us-ascii?Q?iwv/Tcld+f/PcZQTso+C7+wroA5ZVBAybtvxeEiqevFO80NiTTvaGuj5b555?=
 =?us-ascii?Q?fJUBdtK/9apTGvUmMTRxt42S3h/tqv/msaFq9Wr7QfTK9BIYn5jQllR9Xjmf?=
 =?us-ascii?Q?Qm5Gdm/AVIZCt3ucRMpUiolT6S4xM+MHwkh3B8/Zixg1BZ11przd3v1TPaxM?=
 =?us-ascii?Q?tTgWo6ISD0PERBrLDwy5/jfBL2hHE8+FSu6J4xGF5fjlPcXt6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W21YimEuGgebP6Y0+DigQ55bnzNGKOnw2QirD4btWwcpdY1orgkiRfHJIm1k?=
 =?us-ascii?Q?aYqLrheOKuzq8/klSXcZ+ziQJeLOGnFU1tA0rBILkFImvX8qYSfG0CMR7pL/?=
 =?us-ascii?Q?yGN4v10QsvWOjTSRz79BjfCUZ1FqlWodl8mW3T2H4ZT2IQh1Nadsdn0g+iKx?=
 =?us-ascii?Q?PO+LPayerGxpUv/+3ewt8NPpgKBjFzof8QAdZcjh/BsyoPhi45eTykNPL+pZ?=
 =?us-ascii?Q?EOcSinPwAQnxNN8IF6svl0bKOaJfCzsik9QlL6ZRsoyPvOJT0q62uRYLndP9?=
 =?us-ascii?Q?ycpocPJ8+u5RL5xo6eJmc6dbyn34uZmGyA4wt0xocgud78eJqUbjF4iHgJRi?=
 =?us-ascii?Q?OtbRX0/B/JlDWZC8OcO72nF+c5Ywjxy9o7QgIZItTav7JcFRLPEC9yCaUoi0?=
 =?us-ascii?Q?Nn05iTf7tOYrTLUqtYut47/jp2S5Ahi2mMgSYfz9CHusVk/vi2nGkCfXs5Gn?=
 =?us-ascii?Q?zIOFq49eJzJDnj9SKyS+yrlVJ+ewxwYSNOzeVwJNuC8If4y+ki2VYZT2OwWk?=
 =?us-ascii?Q?v0ooytDyJoKgLov54XtbWH+7YNFwbcWgBYdnfzfNZEpyQ4wH1FzH2F0cDO5N?=
 =?us-ascii?Q?cfj7t2sPIFuIFQ1hTBufig9HhKbsUsAYoE6PbmtlonEAZqFoJdfjLzu20Rok?=
 =?us-ascii?Q?2aKiEqy/JW4Gk8T1qZJtdtP+jYl/M8SlNlUaG9VNPCyXKsWVWbvMMNiw2+nU?=
 =?us-ascii?Q?NcpBPm63K0W3BsiJw+mJAV8GNZ9YJs170GWtUxRjckcvn8H36rk9gbsv9QgQ?=
 =?us-ascii?Q?TTKBBCK7s9kwmLE7l4ZfgGuqMS9sOge8Sez+h+HlmGyUo0N+BLHEh8uSAv6y?=
 =?us-ascii?Q?NG6uNnWY656hbuXVQ/T1uRYQcK8cty8UrXJ7T5sadZozMHqfxf+dyEkxytBX?=
 =?us-ascii?Q?QPtx2gmgMkzgaRBgZuYlkIwgrZDEOaGlu+XmTUptxP93dwe8cMEn7eR5txz3?=
 =?us-ascii?Q?QLPVovtRbkpt1wc3L6RbaZs1fWS1y9MR8d1dRo6gZe7H/qU7VAYAa+LO9PjG?=
 =?us-ascii?Q?NIE35D3iIgGT2LB07FavH1lHqeACuUWzHue9AFFo3kdnMqtgdxAAeLKV+xZp?=
 =?us-ascii?Q?f7ZxaW8Uj6hdcQBGKGFZ19ROa7ONA548kwVWB18SHinY+JPywLS/U0vsn5QZ?=
 =?us-ascii?Q?TNf9sfVao9Bnsnoizd6lYmSvdznhkO3VYMejOhhjhvzf2vQ5/40/EvSxoZsr?=
 =?us-ascii?Q?AcOdG0RO7SAoV9ylnfs+bXhdISATy92jfWaucCBYPNHNCal1ao0fO3Of8lV4?=
 =?us-ascii?Q?a20rcSCPuIU1Bj6uOEVYLoRWAhZna4Dp+c7ZxBP3VocrcQKRBILUu9V8AYvk?=
 =?us-ascii?Q?SML6kIh49V2LK4X0P9q7KVmQe5LlaIxPo0YGsp+1sB6R4wGc+fnmyNnofWc/?=
 =?us-ascii?Q?5s/qClgIkhmX0eaA8es7th6JdswPx0S03VfCQYtrhMJ5RZA1FMxk0+PxuMOS?=
 =?us-ascii?Q?FvzhhJx+MlyBArj16GKK3vNhiDSKsyj3jGjE5OuQtcItkD+TZFp4WdsEPGBC?=
 =?us-ascii?Q?FZW7FTz0DCa8fBMllxTtOiGEJ02djWFCNDviIqoyyFZbI5Wbu4QPvgxFkArJ?=
 =?us-ascii?Q?xNjVzS2Ks2HkafLVtCv3QD5tjovZtLnB7Pm9PzY3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5119068-326e-47e7-bc6a-08dcc80864da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 08:55:55.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GJCAnMTLZg3OpalUjHh869rH/dTlwlVNgUX+xcu1x/12tbkFMaXllWIYhuAeI2owY7kHe1VVIGU4O9Ob1NWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10882

On Wed, Aug 28, 2024 at 09:44:00AM +0800, Shawn Guo wrote:
> On Mon, Aug 26, 2024 at 02:56:12PM +0800, Xu Yang wrote:
> > Hi Shawn,
> > 
> > On Fri, Jul 26, 2024 at 07:32:07PM +0800, Xu Yang wrote:
> > > i.MX7ULP need properly set System Integration Module(SIM) module to make
> > > usb wakeup work well. This will add a "nxp,sim" property for usbphy1.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - no changes
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > > index ac338320ac1d..b093f2a447ae 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> > > @@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
> > >  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> > >  			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> > >  			#phy-cells = <0>;
> > > +			nxp,sim = <&sim>;
> > >  		};
> > >  
> > >  		usdhc0: mmc@40370000 {
> > 
> > Could you please pick up patch 3 and 6?
> 
> Patch #3 should go via usb tree, and ping me on #6 after #3 is applied.

Okay.

Thanks,
Xu Yang

> 
> Shawn
> 

