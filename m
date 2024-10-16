Return-Path: <linux-usb+bounces-16310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FFE9A0777
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 12:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51FAF2882BF
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 10:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486FC1D63EA;
	Wed, 16 Oct 2024 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kf9qC6jo"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB9C187850;
	Wed, 16 Oct 2024 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074760; cv=fail; b=RFRf3SIWqJLK2QKW4KyzOiPwOPSMWxLmAkL00pYCCuYgk/RztsvxdmrBRqiXFPRzszxftAQA/mpOL40vFMqLCPZsXXaiFpjTU+IYmptQ68uydDtJRO3RJJKi6myFmX49N5/D5hlpxzQaTw4fOD+veksEXE4L69RE+GjADoIGDHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074760; c=relaxed/simple;
	bh=Sp4bP/IVhRqNRYEnIO1INZi5uYbWdAMURqXDrgBw+Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hYHtBXwQZR3q5fvRlygFO+jezY7XTi/OJ+QJuNVuAuZizTI2Djp5czTcQjjOSsA3ocUrg8f2DdF3B1H1U7b01oExqXgkiPcmMWJI+1dxgfx0Tl6fSng8MOryIjEQzACHDiXip3iUu0MJHZUvJU9g80Fi7iR07NdcXxOZFnK4Zcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kf9qC6jo; arc=fail smtp.client-ip=40.107.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D41fi+APA8KnX1IL/v9l5uqdHhu+LAKqQSFOrxhBsnUMG8O2voVvGtbYo/U14yCGIsFa7JSxvkoCoHOOVN40CWwIlUAceGyE79cg4u4QuqraSRw9WUbvWtPHtvk8tYTYC57sWn95KbxTgiWmskK/cuVvIX9YdQJrKFTsd6vhOFLAC4q1+s7jc3Slo8E6eIjs/M2lbQaDps07EzCxpwTurKOEp3eVY+tdZzMD+JKgU8B6o+8K2+4LoVcf/L15WNEzSjWPDkX6PH598lkJNcB6dNTPf+WOeRrjd6NLHzk9IOd6vqhARg9RQfJkUA4Hh2msL4zNxRDQpFJqKNY9aDdAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+Y2Dk18JOxbxhZ7EAatQkYdIAEA4dl4PRrZXRamNEo=;
 b=bJN7qNYEbYUbP9l+VvXwKASluCAQYBe4kiNsgieezaEAjH2R2wGwozCIHHHuWglkvtacXuJUi6pIFc6pn2E+UhohFH1bMhvMnvUW/gvM052o/siIrb1MOta8xa6P2LUUdYxDV0nkS/08PDHcsXS4eQN9jqcT67m/iRfeZocd509+vEcGX7jCMzDFvVgBw/J7g5JWubNBd4BbWoYURG44nsxoFWJ7p7PikMZm54d2CNkOYs4JVEXKJl8TmMj97z7xdGYhatNd0/u3WpJpDLZVhwew5zlVRO+VsrTq95xeenN2JBgKUrfKPBiITIwd+yFKNbl8IWc5ZQG13gYcRQbzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+Y2Dk18JOxbxhZ7EAatQkYdIAEA4dl4PRrZXRamNEo=;
 b=kf9qC6jowR/H1Dcvnzni86iKxqF52wzNkM8zMphSJPTcpvBEPAZQcrkWT9jHRfqLOa4IcjVDCkZTGONpPf8MmoUCwBpB5q9RA0QpXgC6YRJEYi9nYB7WMmnN0VASRe+8YI9LiAX9YRc4gXlbZyALqY6wqofhsMX1zs6rXtYxJqLKbsBFvnF5H1bVI6fp0RtW0O7ZD3UxjVhTa+pUbS8NAkUZLGPUAF5/v6kE0Be40tNgykd1CAMjuzSemPQChjxTXZ5FTEPxg8yNnlAhokbz5bMuoRXUo5qSkYgshsolJQYaXnMpHXpsaPpwaCEkRmz+/MLvLP4Gth6WDD0FJo6kRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8519.eurprd04.prod.outlook.com (2603:10a6:10:2d2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 16 Oct
 2024 10:32:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 10:32:36 +0000
Date: Wed, 16 Oct 2024 18:30:31 +0800
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
Message-ID: <20241016103031.u42m2jfrdrry4wkj@hippo>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com>
 <20241015111018.2388913-2-xu.yang_2@nxp.com>
 <3321333.aeNJFYEL58@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3321333.aeNJFYEL58@steina-w>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cdaa625-46aa-4b8a-905a-08dcedcdd9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?90FQjIBKY/AIlevePjeDy16BHHxF5ME7U2qaikrZCJqqBvBTKxWDWEZoO6Nu?=
 =?us-ascii?Q?NgvmV09Mhrx7rGSWm1JhhOKlHZOrgsAFnVkDfhLs5xxEKOZzsGVa9Aw96YIk?=
 =?us-ascii?Q?JtQMH53vz33O50Bxj4v9D6Dr+Issj6xQwJRefmJG4HaHhXoBP5UCkZQaj6h+?=
 =?us-ascii?Q?oV/GUH8RW66m146+F7Cuz4lj9/rYhDu+9e63aEU3UkkhIXBjZngvz/gXwgpl?=
 =?us-ascii?Q?RvovHS8BsOU6mhJHtAHja0AjxmeDW/N0hhHAaQozexeq1kFPBaT/IxC+CVZ4?=
 =?us-ascii?Q?tWXZj6rd+QNPtB4SHXe0Oxu4ZsFDP0pv5vh+uWfPFMv1nhKrFi93ZN5tndgh?=
 =?us-ascii?Q?+noby5vc9UfpUI3TnN2DRJKwA0gHVMBbvoCu/2rlE8r5ZSJ2lrmswOTyzUVM?=
 =?us-ascii?Q?8gOqjEhki8vWY+8cg0mVG/Rdrv8L30TkjRJw5dmyGUORuvRS2FWpxgVdHGw9?=
 =?us-ascii?Q?qF8y2AoBw/QHORrUz9oO34J4ohdnQtPm/rneF+BSe2BfkUL616N0BltB9xnC?=
 =?us-ascii?Q?CfqT87c61krK0L+sqV90jZd9MvRiahtIezO/blM6vbjA1Gp5hvG9D1usCS9Z?=
 =?us-ascii?Q?kvwcgWHTYBkN+j0zJxB0xVwfrWcGWVTLhJ+2aCBB92gXpvbTidT044TfTUBz?=
 =?us-ascii?Q?d+g8f/L+IrZT7zKk4EJ5nV1lCaB9H/vNkRKo6cE30WNktuZIA0B5URVFP0Qx?=
 =?us-ascii?Q?ZLfKgIAb4LI/cFoQjwP1dK5h0PYac911tDJP20mkpRrBAd8XNjq3qfWgDGxV?=
 =?us-ascii?Q?POkUz3udlZaMZMQnssOueOh2TNZk/+DRinz+ezeufiUG5g7ZT3omNLL4dk2T?=
 =?us-ascii?Q?vePFOwdITDmfFxtmED8XAjxjYgk7S1+Q+V1C3oJrCAfoBfazsy0Cdt3ywl7s?=
 =?us-ascii?Q?6BcodYiJj76DBjfEcK6dcXe0QtT1EbDLzUIqbHAF5QVZf4Rx4nCQ+l5zIbLf?=
 =?us-ascii?Q?vcA8hP+5WG/Vvn+8/GnmHGZxguJDWOuqn0QrLoHUL2fmv2BxNkWqjI1JLPr0?=
 =?us-ascii?Q?53q60vKJCFbVnBc2QQvON3BgPJmbAtD5qIi3T7yMh5lgT4uxChJymOHxXrCk?=
 =?us-ascii?Q?ip2X0ZKDPLK8TLHTrazWxLA7ufOQXagU3NdSwjap2WyURCEEXbI48e0UJ5rA?=
 =?us-ascii?Q?U3+LZ0ehlI6YL5YJn7pMgLow+mmv/J+ZDOI7lUYuWhHPf00gDBbwYtDOE8ag?=
 =?us-ascii?Q?mE7rfJk+9CWtaGG8uhxBfCLcjFIXCf7AtqPJ20uDW//l7H+NlOusNmhf5uBP?=
 =?us-ascii?Q?DplY5+OANJ2ti5Aw+vOmqb+w8tVPstWbDaP4r45T+wXrU6ohMrf71g1bH1di?=
 =?us-ascii?Q?j5AFSLREjOjEp24plovQ3d2lO91nAOYx1sfiWK5T0xpP/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PM4RA30ihvFonbMQ0pctIvNlJGhS/S2xc36hcZ+WIRROGRqPSen9fBdRY+iY?=
 =?us-ascii?Q?b7e3V3wlp80+9zLvFpPMkoidaUIW/OaDOBpGNTMIUJ6T4E0WUbTbwHTbP/dr?=
 =?us-ascii?Q?DGNbCQ5Ns3I6sl0AiPGsVhWOusA9+zW9l+oL2ClLvwnEWM4qY/e+ZQmYfFYR?=
 =?us-ascii?Q?iEGTcm4gWcb2M8R6xWfwUYGSHyGu9eH/yrfU8E7kNlQ8PhV+56tbY+HqWWyQ?=
 =?us-ascii?Q?mFnXHtIVZKDX3HopD5CGiSGG8SG6sVr+ZbMEFmlAh0aCzKYeZ1deAPItbDEf?=
 =?us-ascii?Q?5ZPLtmH6B8n8rYASVWxRjK8LirjaRdCP/X9o5pSyqc14Nve0Y1jHoCdZWPwT?=
 =?us-ascii?Q?5zTmyO4oPFS+CkHYbNr2rXxHfQLhm5XieIFMMWWRj8ocGeeqQTMazbrqS1xm?=
 =?us-ascii?Q?ux0WVAstkgzuz5CUBpSRhdS7ACvAWf03tK5liXJLSbtGQGn9Ms9b6oAuexnj?=
 =?us-ascii?Q?NT+u895uTDKyAEBYFgFURst6ILX7kYLO+uALcpyIoPj8JKBd2GkB2hjD4Q8r?=
 =?us-ascii?Q?wkCiVJn5T3b5UA45Kl7YGe7Ui+GQMqM7R3OhBUvP0v5Z9ewVOQGEHWe98MDO?=
 =?us-ascii?Q?5b8BEBM+2C+HxH+FHVZhTaGa5raXHDBrTBduxdwg7QF0Sq+jaUwlwltTdWD6?=
 =?us-ascii?Q?PzLHoasFosPaoDvNgnIfjz6hEYom/fG/tzmqSJ3cAT6fAxfRdgO9/PPYJ5qe?=
 =?us-ascii?Q?FNYVF1oii6mlrg8Q90p6qBUOxmipiUNWScMyR24jJMoNtA6xPiOUcFqFSDn/?=
 =?us-ascii?Q?3bunL/u3twJHLzolkKoBo/+VUhe2T048JlvdOzcTBmhCB+YvYugim1uOlYaf?=
 =?us-ascii?Q?xH3DDGrTPPwUv5E2wajbeAh8Bm42bXvpSM1mNfeEkKJXQDwxnjYXF9RSiVqh?=
 =?us-ascii?Q?rAdbpQ6I5cB0UdvkzzfvIaVf0O9Mxvujvyou2NTHcRoutYORmzdGwwGQQJnE?=
 =?us-ascii?Q?RagfCpT5U/XlzO0DkiKYw+KrmuI6ZJOTa0OcBo50w8MKrutRpoh05jSwvgxH?=
 =?us-ascii?Q?SKs0U8K6jpY+QnD3MWlORAuei1b+CGyVj9qJlvaRDJ1E2YdNNV+KlIJSMkmx?=
 =?us-ascii?Q?UaJRviVMK9WoWJvvnyNye8qPnKuzzlk7brYoYMIoojeTIPPFpOs0+PIFC6TX?=
 =?us-ascii?Q?v4ey9qjLfBz85gmvnmlBBg7N3pvN2dI1kemJOORuoVMEzZ24wwBFGvD4KOKq?=
 =?us-ascii?Q?LbB4mJaEtKckSYhhQeLnXnLLYEtoj8uvx/di73bALjLbUbFieVvRcwVZKqBp?=
 =?us-ascii?Q?qh1FpLU6Ws7yHu9kgeNH1m8T3i+EVn6n6T5K6MRZQvSVVX8uAm68aQdvFcSA?=
 =?us-ascii?Q?c8GvQSfSPugQGwgYoHwRxWUnpUxO1FUHMQ6vT18s8OBorqOSEmzUicvOM5Vv?=
 =?us-ascii?Q?Nn1WVwr6KgbfhAqp0/nI899WjVfjpKUljUQ9zRvHwZ/ZKsdN91M+Pc/V87k7?=
 =?us-ascii?Q?JyNeTNFiR1mqaqYg3WcJ7lIAOBhorohN+ARLCE2dzH+EzSj+i+v1eLoKiAHG?=
 =?us-ascii?Q?x5xgTmXw011K817nAsJeGwAmS+HU3NWldNRnXNnPwhAkqj5zlBYJPiG4J77x?=
 =?us-ascii?Q?UQ+TVyhCfp+Uars0bZalm8L9SNF7j66MaGpdRy6W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdaa625-46aa-4b8a-905a-08dcedcdd9d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 10:32:36.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hu5ihbMO4iabjA0yVYAWHS+VgvBbqp7Jri8hFTEWIkcvP584KjeKNP7d6p0XcCFi9VqU0Lxg9jHgyRU/VpuAlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8519

On Wed, Oct 16, 2024 at 10:38:52AM +0200, Alexander Stein wrote:
> Hello,
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
> 
> Downstream kernel also configures
> > snps,tx-max-burst = /bits/ 8 <4>;
> > snps,tx-thr-num-pkt = /bits/ 8 <1>;
> 
> is this not needed and omitted on purpose?

Yes, on purpose. The later newer soc doesn't need these properties.

Thanks,
Xu Yang

