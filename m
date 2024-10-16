Return-Path: <linux-usb+bounces-16311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4BC9A07A8
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 12:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 856EC2832C6
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 10:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78B2206E92;
	Wed, 16 Oct 2024 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jO4gWulJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C91C9DC8;
	Wed, 16 Oct 2024 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075438; cv=fail; b=TkEOTrMUbNWexVW2zkKy/Rh7P99Q/BeGOsqJHCdG6zC0rO//vaZVYRZBSE6PlinMuwLxc/wFkMAAUbF4RXNI6xTBBeJPCjO/sTXb/2w/7BUtp+yrE6kXQUJ6Q+37UiSeQeYmVLAWh4XxcRBxlNRqtNrnFyL7y5mjOy4j7SprwV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075438; c=relaxed/simple;
	bh=zGLvbI2vlYOGt7fXApHA34mb/I8feHeWmfDJebAQIuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pUxlR6NguCW0KVRCu8iSNe6WBuDPTgsm6nMNp9boYShf0q8ZqSr91JFAjZ7Xx1/IgysMTxF1Dc4imq6HsfxX8k9slmj1fSVZJrGKap95kW8mYtKus61JAt66bJdL+Ka36YmaMC9aAUb/H53P2MHqIrrjxwHPHYfOLlmoi8opVv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jO4gWulJ; arc=fail smtp.client-ip=40.107.105.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NW52egabVvtYu+kVG1edL+AwUH4ilXmQ9fPcylGYpk8azcmn/v5JQJ3rogJ9Q9EldQuwPOVfc6q19IhSj6jY6HXOGakj4sW6LSCKf0crjiOFMIUzkia13gEjY+izU/lyDuawJyz5xLlE1xcdZSYKOg2UPogBaOBrYuqw1H+EEHImNTH4SEB9A+7IMETJstSSEP5JjfS39Wlng9idQq1kMFU2ShHmE941AYodPI10DCvY87eDTW1OqNhVshIfcV7M7M2ZrZRpOUrVIn2YihPZAR9vWUuVG74giWOfypzaeuVKEnUzRqc5RpTPJ8Hv3L1OidnofIFzj7zzIJTpqUbA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwrdhX7U6VDaLR2MOQMYcab7/RqWXQU2V231e1drDZ4=;
 b=tLuWC+kvsnALashjBRcBaJAzBUXpMI5j/hDLRcmUjgSrURcDP9aeEiUqdPpwPZ3igEknyTgltq/1Z+T/XPvgHc/UQ1ZVyvNpENt4j4O7Qghmjlw/d8DMANJXqe/1gNZl3EEXCe4V8UkO9D1+7aqdECXQtlo1mwi40jbJY88x/nwHQPnoaY4IKZdp8n66BAkavHvB2OQfM7t0SAALgb3PbXyqJdLmSkyu084sW5JtqVK9ywzD4fplH0NGerhR0q9y5jm2d+0jUI8458hjc5dQshJgzQ+E6TIi0Q0dspBQ4tyxsO1uxl5PAulEWPh981ipiXwP8UkmkKFc8Vv8Fs3E7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwrdhX7U6VDaLR2MOQMYcab7/RqWXQU2V231e1drDZ4=;
 b=jO4gWulJltXxxY/QgYc+hhFTurCw7nPNv1HBXn+3BiOFzl7Vk2zsSGBPfSL/In3K4FOh/Zbe496lQEWliaiFIWlzaJcQdifEiJcQbqEfAlGDro0Bxoetwc4BCgT+tVyOXtv/kS8wXd3CoWruPMR45RZvclucksQ/cPLtYaGLXswWKqv7CF5Rm9VxVqb7R2rsVywpXyN6pCNXCl30H89k5liI77WNJopRDhmdDvQeNFfu9Nukf00nJd4V5lFVpgqxhPFxspiU+bmO8V/DUCH03uARhqcSxVlY4xUenlPuraJ8K1Li1XADdQywRbMAXo/gfeDxJHgYFR5ITiGivjyuMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB7524.eurprd04.prod.outlook.com (2603:10a6:20b:286::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 10:43:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 10:43:50 +0000
Date: Wed, 16 Oct 2024 18:41:40 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v8 2/3] arm64: dts: imx95: add usb3 related nodes
Message-ID: <20241016104140.rjmszgplmql4hwrs@hippo>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com>
 <20241015111018.2388913-2-xu.yang_2@nxp.com>
 <22464382.EfDdHjke4D@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22464382.EfDdHjke4D@steina-w>
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b509060-290b-4a69-3a08-08dcedcf6bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?61thMrVR+Ak/IcsgyYAhK8jaw5MObzNVBW7ctSlel3IqNq7s0m7q4Yu7Sxe9?=
 =?us-ascii?Q?8sRPXadxSp0oS4bF+gioDFxTkvBFbPZ7vl/4+tSuJc7DRl7yx6urJskmh0JX?=
 =?us-ascii?Q?+9XgkwexmjbmZPscRmClkYQA9SCEoLUGc5F9wRX0B5tli1LaWCb4SWR4n8Kg?=
 =?us-ascii?Q?981Zom/2S7lYsZ2XE0p7Lz8eAk5BmVEafp0MMg5fKMQ/nyxhYMsSD7aLht/S?=
 =?us-ascii?Q?OffW22IAY4nXZfbUuUnTaOavWcF7cEAcHbh3ksMunnQk6KtkdEeTnB7tosod?=
 =?us-ascii?Q?cbI8CsZP6ilk/efsOt5HBjNFSkSfpP14LPPf668i2atmTPj+Ze+ucOJv20UA?=
 =?us-ascii?Q?fbKnazvSuCaZaJcd+w97x+kETE9G9kfoGrM0n3SC6z1sqteOb3shwPgA4Oep?=
 =?us-ascii?Q?aHorM7SjNTkR7tI9gJ0WuGEbtMNp0jN1A/d/RzaGmRZOb3IaTU4Np2HLlP6t?=
 =?us-ascii?Q?hHZ+f7t86SGrIwSPbEgiDs78rNnTqz6CQfAwgvurEugSWHTsJaVEA0efuhem?=
 =?us-ascii?Q?7x3DrdGGqFfwhoSm1Zy6mIebVRMNEv+xKWvzIJx8Kt1ngA9mvaSeeT1auHy/?=
 =?us-ascii?Q?5n05OGTlaBMqgUvuhFCbOQsPagwrlOqOsptwOf77T0BnMfoHO/eOlsD1FJvR?=
 =?us-ascii?Q?Y9HSuG5DGSDjY/7Pyj5fp9u8aIRmDf9/s1lDfVmH820PgOaVDXaHDsbz4UV2?=
 =?us-ascii?Q?kgSu/4tOi0b+jwT7HVjg3BXUISWO+rM6l0PbYOIxTGdHjtD/BZfcOprA7VvU?=
 =?us-ascii?Q?zh44kdIGiO8Fc8S/Z1dN3eXF47+HuudgxSbJDqy5GgVQvbDec/F8NMCCBSdM?=
 =?us-ascii?Q?P1SUO7ppAz7zPT2H/1nj2+S/xOe9fOwHUvh8DCzR6hSrKi1K7nVewHbyMxYy?=
 =?us-ascii?Q?wchVBqsKyxeTYvagYAEkE5RGOIYK25pDOoeDnsOqXthSccFQknfR5AGBKQYX?=
 =?us-ascii?Q?wmS+9WKge0T26W/1FmXUHx9hn8gXQXn2XDCYyp7Ce92mYZewqAkyUnvi8mZL?=
 =?us-ascii?Q?YzEyCnrYs8Nd4IWJgkYJNp8xQui+VirdlcvhJBU9ayihGeBynlaTV6dNJ1g8?=
 =?us-ascii?Q?EfGbeW8sbw/wb11Fy/mcKkb2YyqAh/0s+vwpJ1ZMlZUose/x1FSotQ4kJT5h?=
 =?us-ascii?Q?4XfuXd2sgdLH90ugtfDhNX/HFEEP2DejRqtMFOV0/VM62h1wID1TpXmcOmS5?=
 =?us-ascii?Q?90eMLmbBorN0WCHkb6FZbrsQ+pAJ1JXKKXEoGziyZ6x9al88e5MkJ//QjwIC?=
 =?us-ascii?Q?yJ0zZ9m9EDTLiPrEeVkmlXZQBwW3NXBOl1HigTjr2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xoawyEuAqB4PA+djBrRuBvnmWT8CQrV+F4oc4XX1mSgwfMoEeqCFmVTPtUYF?=
 =?us-ascii?Q?7xxb7lf2hvhVJglp17oebpOAqyGx4WC0X6V/Jr1PaWGlwdj0sdPOLogIO46j?=
 =?us-ascii?Q?ipcVWRsqr48anjOVodpo/ba2UNKeTVtt4Z2nBuquVSjO0FeHfiVoIGAxo5Gx?=
 =?us-ascii?Q?gD7sxmKqMsgCWpOT7ayweVKRBO5tSjpSDkD28wNIGUnpnFiknBpjKfQSqu/W?=
 =?us-ascii?Q?YiaiVWd27oTi+ONgQTi02RxVlkkEeTvlM4fjyaPzbAhu850hJqB0hfMBhz+A?=
 =?us-ascii?Q?83oB2SN8g34plD9foH1ZCyPImjjfRv4ZwGOoF5zLQaElaT2+wCJvvEYGRLO2?=
 =?us-ascii?Q?iYeb9k4ZxR6Uz8MR8fgk5tKI3r7y1dAwkRBNKOXAuYcf5My8mdTMKYVzFpKw?=
 =?us-ascii?Q?UwDwnZbmT6eYNfVXla4Z37cJs/pZOxa2xcgOWKsHZLWA0nWlO7keMB5kzKb2?=
 =?us-ascii?Q?HPRKxA5Q8yx0gEq4GWn+CQiX/cl8md5VCAHJF8/xtm2XL/jFFZu87jFMSC7B?=
 =?us-ascii?Q?YjDtyAmJJE3Eh9Y4XGnilj9u0MSq1MT7dwekuDeq2oUtdyjVE+MDb4eD7vP1?=
 =?us-ascii?Q?j4+A6+/+M7xI5u7D65i4pGmOAGHKgzFbgXqjb0UkpQelYgKrX6u6zYvXuHLl?=
 =?us-ascii?Q?E0GDTmu/+GKw1s7Ga/vmJH/vd9rdBhu6m9/sJnB2pI/hInZbAzFy8txBwZtq?=
 =?us-ascii?Q?E8P3/oi6xXK6Xf4nqpPRSxVTlytMgAXs7JYysfc3FAbSbfB8Tk/MuKoRNHBK?=
 =?us-ascii?Q?joEPXdzqeMST3XR8rjj3j81iwI9+KxPC3M6bK1UUsd6Jy2d9vs8VkZ5w1OY7?=
 =?us-ascii?Q?XQ53OD+7PLFpdjSN2rqqAAeTR9ZA/R5JJVLswQKHS6GY3oR8u+pwFuabq1UY?=
 =?us-ascii?Q?/kXsBdbKwaVevAAfTth4r08NQ0JDenl5P7PxH94lx304ZCtBLDEJUyInNvHS?=
 =?us-ascii?Q?XN9FDS0c+zXdio4fsnpy3vNJ4QewZVbxZqEbsGQYCy67jkrYtgjzb+aTFXjB?=
 =?us-ascii?Q?NNzPPPWtYXt0fiQpwpXn5N3WHu6m+pblxnrBpxBckDx+fsMfL9dNXBM9Jhms?=
 =?us-ascii?Q?4NxnRFAJ97NJSmMKdq1jbFUfdn7wXu4aZGZ1xBMnizX89pd3rXgKGdXloSZS?=
 =?us-ascii?Q?+2xFx8oelMs3KZZS6mmU1g+u+uVX71dlUXr9NwK0u6f44gmrN0y8f1Zc/M7u?=
 =?us-ascii?Q?MpAUdmCJe7448VIO8R/tXEH8ZHZG32tMMMgJ4L8NTurb9OoTJtSTlmtWu5YQ?=
 =?us-ascii?Q?zpTlV37Yg4FPxlnRVLrBCz0+yn24piAVVrgZGCGbH5ILfUoVV9gBVD716Tke?=
 =?us-ascii?Q?CIYRVz+PysO66L//qahKhhG+oLefpCLTgtr8v49KawsaDSy90CYS3lS9Sh3O?=
 =?us-ascii?Q?ypok+80nVNe0rRgVRH5SHG53JzNqQKNp+iwGCVgmPMNyBY2ZGkuH8ZU+m/Dx?=
 =?us-ascii?Q?6RULP94ijpEwqsz+gua624CUFkrZQyu2B7OwXVOknHuasKwAs50AXQuRTP6N?=
 =?us-ascii?Q?ePogMkyLYdmwO8adVPUHdFHmzIbHq9mffHdv7pEwxU9QS83iiZsXudIh5a06?=
 =?us-ascii?Q?0X4Y8D6n5VokDiGerWx4nbr0zPHVd6l1JDDMMuZk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b509060-290b-4a69-3a08-08dcedcf6bce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 10:43:50.5747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYU5xwICd9Wg+J6LfVXgaBKTLk5oyuPmyPBRZtOGFp7Ovo2U3wKJne6sn707Hg3n/AGRwUkxVS3sByd04nXhRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7524

On Wed, Oct 16, 2024 at 10:53:50AM +0200, Alexander Stein wrote:
> Hi,
> 
> another thing I just noticed.
> 
> Am Dienstag, 15. Oktober 2024, 13:10:17 CEST schrieb Xu Yang:
> > Add usb3 phy and controller nodes for imx95.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - no changes
> > Changes in v3:
> >  - no changes
> > Changes in v4:
> >  - reorder nodes
> > Changes in v5:
> >  - no changes
> > Changes in v6:
> >  - rebase to latest
> > Changes in v7:
> >  - no changes
> > Changes in v8:
> >  - no changes
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 03661e76550f..e3faa8462759 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
> >  			};
> >  		};
> >  
> > +		usb3: usb@4c010010 {
> > +			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> > +			reg = <0x0 0x4c010010 0x0 0x04>,
> > +			      <0x0 0x4c1f0000 0x0 0x20>;
> > +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > +				 <&scmi_clk IMX95_CLK_32K>;
> > +			clock-names = "hsio", "suspend";
> > +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> > +			status = "disabled";
> > +
> > +			usb3_dwc3: usb@4c100000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0x0 0x4c100000 0x0 0x10000>;
> > +				clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > +					 <&scmi_clk IMX95_CLK_24M>,
> > +					 <&scmi_clk IMX95_CLK_32K>;
> > +				clock-names = "bus_early", "ref", "suspend";
> > +				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > +				phys = <&usb3_phy>, <&usb3_phy>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> > +				snps,gfladj-refclk-lpm-sel-quirk;
> > +				snps,parkmode-disable-ss-quirk;
> > +				iommus = <&smmu 0xe>;
> > +			};
> > +		};
> > +
> > +		usb3_phy: phy@4c1f0040 {
> > +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> > +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> > +			      <0x0 0x4c1fc000 0x0 0x100>;
> > +			clocks = <&scmi_clk IMX95_CLK_HSIO>;
> > +			clock-names = "phy";
> > +			#phy-cells = <0>;
> > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			orientation-switch;
> > +			status = "disabled";
> 
> I got these dtbs check warnings:
> 
> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
>  phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: 
>  phy@4c1f0040: Unevaluated properties are not allowed ('orientation-switch' was unexpected)
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#

Are you checking on usb tree? You need below two dt-binding patch.

 - dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
 - dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"

> 
> 
> How am I supposed to specify a port when the usb3 is used in host mode, thus
> no USB Type-C connector and no 'port' OF-graph accordingly?

Host-only mode with Type-A connector? No Typec-C connector?
Sorry, I do not get your meaning.

Thanks,
Xu Yang

