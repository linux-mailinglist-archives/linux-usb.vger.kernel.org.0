Return-Path: <linux-usb+bounces-20840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E155A3CA34
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 21:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1278168A0F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 20:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AF223C8C6;
	Wed, 19 Feb 2025 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ea/0KS8u"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5F24113C;
	Wed, 19 Feb 2025 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739997567; cv=fail; b=RAo1qLgXRLsbSULkruZUMLqyL/4axLvYMIsp9/rI/2ahjSnZ7nj1rpwqVpjyjz/LqR3SlPuMO0+st285pwBk6XG2SmCCPkp794npJ+fvOAMY+JkXZfxxYXu7Rh7+T2+oeNJqshLP9vJmAqXCWW0trTvC3EHoSzJ7dZ4k+YLyA4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739997567; c=relaxed/simple;
	bh=T22+mRQabjL4t5edHjjc+i98iosWuxS0ONztNt46nI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iGNLE5zoGkRa1fUBUN+EscM9/+zNtTmBNDSRuxkObrf3uSqFTzbC6bIj+3q422ilBM0FB9zwc0GlZL6oxO8EAqxYZiuI4dvTq5oWH0fGSS1oZ1bmhtxi4BzgGfBCBBwah73/eSE0kRkhb+T/29Zh5keH06qqLtJTLcJljYqeGCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ea/0KS8u; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2Rp7D41VYlUYX8Ck2is5dZpOly9rbd49SDseumr3I/2rvf7OzV2v699aw1ztzTNbBVcZrwSa8nVPZkuvxHoIun8HOux9TGI8AleQ5udt4IXM3bjxTWlXhJOia/hHrwxwWXLpGBLWfsEwFyRHEuQdKW5xoCwmBdV7OZkYosbM3aqU8GlaxVP+9Xt+1/wNu17IgfpsIA9Jxzdkk5zrL8PW9CHiFGHW6Yee0+4hRP80j6GfzxWsqrg+8jM40a6FGYWAcdnBEjE9CuHJW2MQ9QyXrm0KsUMVrETJ8DYDXPA8sokjFedF2W4PgyJ/oxBp2wwbQy2STHpm2x3K/ZfCFNEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jvc8qxZ8AGDEuyBnSvN6SMDn4fpxdMbh41PxfZG+sNo=;
 b=e8vxQ3IjTQAJ+8q6kcbdNuWl59xn7kEPQ/cH4/65R5suXsyumk58EButIuUJOvNR9IugAdg/qTDe0LkqTrwdCyGeTFKoglRVlrFn07s1PHw5KDvgtGp/YD8gl4xAAkz5JDIHqJrglONLAHAsSkgk1UwfGFEyyNfN/QROuEHWYEqi5xTUQTvTltF+NYI0WHF44chn77/pmOa7Zmbi32U+uQY6dF4fXqT5BWT14itqDaNaBAtt6yrsO0uOthodxHFi/fPwB58y35jEU9IKBcsgfaNhpK9/i2Efy9TZQc1Ce/NGIYsN/5/8nr2BcxVg6tL//Em7vrlOOKUODy2d3DXcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jvc8qxZ8AGDEuyBnSvN6SMDn4fpxdMbh41PxfZG+sNo=;
 b=ea/0KS8u/LbHQoT46sy2GQW1Kc8AHDK5dCNHOi7Mn7l7Zg4aP774cQKu/vZfxjgKcJgUiaYRZWII7Sr6imxpJoXrrkuQ04DrkhbfyMTxwICGWvXqLcU1DGpZLMxEUA3Bsai4qn4MhKSGZofROPx5KEsTNXydOA1IzXZzpkCESkavpyZahMpQzb5Mn3D79Sl6PY9mM4fx8WIXDWY4z+h56RR2OXOpbuojEaVYNhMlrHsmXbsYV1sDusyvdtF9Avzs44QOSAGjGqOm7sDMEB6L1KpsVH7mjMvsYT8CJEjcnw39vcKFqR/71OqUje51OIrJXVldYtulGIyLNkytFB2Yig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB9863.eurprd04.prod.outlook.com (2603:10a6:102:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 20:39:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 20:39:16 +0000
Date: Wed, 19 Feb 2025 15:39:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 6/6] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Message-ID: <Z7ZBbE3KdBJiWkyA@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-7-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219093104.2589449-7-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB9863:EE_
X-MS-Office365-Filtering-Correlation-Id: e9908d43-8dbb-4701-7f3f-08dd51257a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6/c48J1+MTuK3oXks57rSWPW9pcs/giM9/4FRpaSFH9MVMoIFjd4joVXgcxT?=
 =?us-ascii?Q?n9RauASxH4aF77A01s09RiARBV0VmGu/nw9pJzcgGCSn6G6F5VRdreLI9dIn?=
 =?us-ascii?Q?AMuMa7gxrm55TU4KY/RLnYBLCysF9/4zr6QdHQ4ZlTV0/lht3tZmNp/grYF7?=
 =?us-ascii?Q?QBgUGjvnrppfGE5dAuQxj8BXLo5Plj1Ya5VZba9Vx2D2IFzyeWFQbF/SKeb9?=
 =?us-ascii?Q?0n9dEgfwZkCTfjW5nL8u638QaS8jyDEY1//lp24g2MSiVPkoXo9qLDwRKY3O?=
 =?us-ascii?Q?XMieX30kYgFAZC97zI+65cNOgaZ1QVRimpgKqQDSZkZmAFMR0rvHCxJHdwNm?=
 =?us-ascii?Q?l5H7WomjvijDZZDqXY1Wd4fbb4Qo2tWDF6Yv2a3/QWEQLWYKUnC+H8CoGrD6?=
 =?us-ascii?Q?n0b2wFfrF2RE+dDLwRTvsj2gDmZo6f+YNkyf0/erGoybJHPf+x2PMUGh3Jf6?=
 =?us-ascii?Q?mrlHk+wQNdEEU8hxd6VRzSmTfLwYaoGYIyM7ThWMUcfxwrW4kotDrQRQcRz2?=
 =?us-ascii?Q?9ljjtF7hYLZwx+KMtLR3++YWFlzF8cfbBQcXBVdlBqub8mYIh86TYVadqQn7?=
 =?us-ascii?Q?+3EZ/aZj2ESBliOrx8jSG64RNFU1GTyMUfk0S0TvbTcmetra9b48c6hUcmon?=
 =?us-ascii?Q?rWck8wPNWBGsUgqyCWuBDujnAYbeoJhR8EISo0/BaBEtJAG8YiA27EcBkJiu?=
 =?us-ascii?Q?gElb6hXmOWEIGUvjiOrbua+ZXNfP+K5RKfk2RvCHk36qTq5tidCINEIv86jg?=
 =?us-ascii?Q?nPBa7slpf3S8RO/F1yYb94bn0Ccz3DVT5p6gSLQ0rtf7ypgnY20uv6fXo25K?=
 =?us-ascii?Q?UvQtIn8GXB5kr/1d+fwY0UZ8vxSjAqMqyFrsVeHqYaareaNuxb22QgY/HimH?=
 =?us-ascii?Q?B+jhSz+ztr7CjiKupW7FmNWTGibzv5XEl4/6S/I2yPw3ALerWHPDTk0MlW29?=
 =?us-ascii?Q?4up3r61U/GoIZJ+sPHyFRbkAoeHtOn0gghrPmvrG0SZl5zbsEjPvjYkCC2QB?=
 =?us-ascii?Q?U2WKtMMBkWMSeT0tkPS1yav71tCmRo9HjP26LHb2YTj2H+m2gg0X6ZRYtI4R?=
 =?us-ascii?Q?Bj/rBf8Br/3CCO51nBeEUt+ZV/IJxoSaUUHWqotRaNRcBWj0yq/e8jLA3VN2?=
 =?us-ascii?Q?hs0PsQyHDC7skvted9EHQ0af3wChPARjFmNUvRS3do+NXyEy/BgtstIIkIX9?=
 =?us-ascii?Q?HgIsztV61m2/7aUM68mhuL5e8rAzAHpe8i7NJS50ITecZ1hff72z9zjiMCz3?=
 =?us-ascii?Q?W+LZzDjqF3zfKNF2GKg2TR0OVPY3K1p4y/m2HxN7te6p1nsaH6tvcooX7y0x?=
 =?us-ascii?Q?hZxVCByFCwzBXy0zpL6K/KBiHZycM3rO1kEEFavQ1adcIIHjadhuYEEnjPs6?=
 =?us-ascii?Q?RZTgCkG7mzmWatcQgSMFrFMJVojLbA6m6L7scodF94XrS1Gg6S+c3JEjq1V7?=
 =?us-ascii?Q?GN0T4/uU2uBEmvN3OU7k5Y3hjZyQtzYf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UZb+uCUKBrXmWFEgEzvK8S7Fqm7vG2mqPZg9HiWfNXTfIUsCmoYM4UCnlN1S?=
 =?us-ascii?Q?XJW5mw77fI/WpdgnjVhr4hB9mrggrwhwX7kK3DIQC6CKUUD5By1dMuBwr5pb?=
 =?us-ascii?Q?4R67U4YfX5oYqK2ENxF2nTaXfNKFXFgJgc49Cu5sQg7O3XWLwtVwqa9iyHFY?=
 =?us-ascii?Q?ByXVcEQEOint2vCmXOlrDmJWu7CYyaEkmcFtkR05of6yVcynS4ddP9H++wPL?=
 =?us-ascii?Q?2w2NPjKcupDk07r6RBI2Xvi2mDS9ovL7T9sUiIkP++oKc3u/Bm58IVWYY3cg?=
 =?us-ascii?Q?+vCyeR5t+M9GRZNzGEY5HMs4Q+QeaXYqgBERwHg2JzmYkY+2pv4LN74vpJ/d?=
 =?us-ascii?Q?s621rofEDsr/UZhmSffNJliiBcRTpPL5qTibNVAbKRn7whTQ4V4NbO9/WGZG?=
 =?us-ascii?Q?B9ZtRO4ErCZDjvl9O8aXX8/j+oQWtu3uP7WpET9oWTDa2eHPT6GHiYMGBtGv?=
 =?us-ascii?Q?gNXxV2ISrsG68b2nDDqPPb3pKDHFfygPA8GAV4RautuRfb7KaO3YK0CWcq/1?=
 =?us-ascii?Q?4O07Yj2n7I7DNDJ+xpLatFTj3dS0SNA4D+K6xZAzu5+56vVR9sNIEeQcRTek?=
 =?us-ascii?Q?fsHr2JSeyOQL/411Ci1A8UnnSE9xCliFWT6DgZA1kOrbWXcoTuCU8R3cX8Fk?=
 =?us-ascii?Q?13NEUR/K9v77A92Dq7x6pIOTaX9ponZop9FcqNtdNq66vS92QSxRgMz0fpgU?=
 =?us-ascii?Q?0cjruoyNc7qVA79xQ3e2KISTrwk07Go+Dx4yBFlkQg/n+o38XkVIiJfsgFsW?=
 =?us-ascii?Q?DJhSE+Vr6lqksnsQVVqzqwMXVi8oyF+m3/5iRI0ngEYXk+w+0zm1a8B7vluI?=
 =?us-ascii?Q?jNPZjgDKrlepOzh2+XjTHmG1SkSsS9/OD6hHo+AZJ2MZ8qg+9AgqsGK3NJdP?=
 =?us-ascii?Q?sIWHy7dxDexRj5gBU46G92I22XRcZCtIp8vEZqNB7BYb72v5H2W/XIToFgmi?=
 =?us-ascii?Q?RllE5b0aIrhEsoq2k2mAGoqdERHwr+IUH7BeEtEu6T9gOH0kUWj2X2GLB0yS?=
 =?us-ascii?Q?dGx3PdupyVx0BI5ZbeIFc0LeejrrRGItEpZKQC4Onp+xFo/QLcGLQaptRmOm?=
 =?us-ascii?Q?xOh+n2D/RFzS1lqlZR6DQDIBee+WrR/8larYLN5BHcPofE+/Flt/cXpki+Me?=
 =?us-ascii?Q?IeCcrfVvyntjUPI0JW+kZpsZklr5868b52kGGpFkUkrMzCWNUX/+I+r4Qq5Z?=
 =?us-ascii?Q?Cjt9PZ5bnHCr7DNCjhifeYEmA3lHBnvT0Q/Pagvvv2QWb5fXa4zJsHHc8ERg?=
 =?us-ascii?Q?cC83Kph9jmlojpzLWuBkVy7HAFdxgoehgCTk3Pn/rCJ0bB8YyTgwJUT1NQfW?=
 =?us-ascii?Q?pfpZWf7KwAPOc0FbT1X1knts385x5WKbzsHN+UJueFFuW8kxXHUZx/QOOjQn?=
 =?us-ascii?Q?7eYEz2o8Wi7hS85aTMVsZGeo7mlGR/6xKyN9ugojy7Hf4ZYrbanjykuPTHbJ?=
 =?us-ascii?Q?mv/vM+53oWT6tD/vlszp3LFSSZ5T3bmnDxZ4jOptHvvaWOl6oHgWHFQ1SJbb?=
 =?us-ascii?Q?8wi4mfbhOEOKLbqz7RnsRXJo3L31hrrxkG+97xd0nk3n8HJdrYeBgCz4FJa1?=
 =?us-ascii?Q?yDB5BIh4yU48uKPvOXfe1oj6D2etIg++Sh4wux0i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9908d43-8dbb-4701-7f3f-08dd51257a7f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:39:16.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esbMeI00LK/1u+XK9DAN5vWLSo6qVceS/2S03RxcAUkby55KCl1sCgG/1jdWL19as3/D40ZwkDBzqnh/K+E7yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9863

On Wed, Feb 19, 2025 at 05:31:04PM +0800, Xu Yang wrote:
> On this board, USB2.0 is a host-only port, add vbus regulator node
> and enable USB2.0 node.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/imx95-19x19-evk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 25ac331f0318..0505cfe2778f 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -133,6 +133,15 @@ reg_slot_pwr: regulator-slot-pwr {
>  		enable-active-high;
>  	};
>
> +	reg_usb_vbus: regulator-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&i2c7_pcal6524 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +

try alphabet order, regulator-vbus should after regulator-usdhc2

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -461,6 +470,13 @@ &sai3 {
>  	status = "okay";
>  };
>
> +&usb2 {
> +	dr_mode = "host";
> +	disable-over-current;
> +	vbus-supply = <&reg_usb_vbus>;
> +	status = "okay";
> +};
> +
>  &usb3 {
>  	status = "okay";
>  };
> --
> 2.34.1
>

