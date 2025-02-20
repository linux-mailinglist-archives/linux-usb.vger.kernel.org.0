Return-Path: <linux-usb+bounces-20859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03590A3D6F8
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 11:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03D32189B3FB
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4D11F1523;
	Thu, 20 Feb 2025 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BX0W7xOV"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD531F03E5;
	Thu, 20 Feb 2025 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048132; cv=fail; b=qVrtkoNLul8AFtvZrwnvA3/kMLGPn067MwEoTWDPJtJ5VkByrMVBECsdNuQz3swM8C9G8eIdEWnV/FgaQPgkGGRNsBG+855g7crmeIaOo+DiQUDDgoriG8BEPr+x2ok1FMySqNfDn75g2YwatrAW9unI4tCOe8W5rRkQqnpj8qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048132; c=relaxed/simple;
	bh=jV8Frpydj/P/MwN0f2l2BLWTEnmrcYy27SUrCGTc5LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dAtiKJ3f1jFEzJeCXDnGZN7+MpaeHQxFqO7LO9Q6bMUWiAroAzYBqE27hfcFCzLlV7GjqwcNeLobcDk+t8JYb7F8vDCXXYaOmk593zPjiOgul6EiFEqS/uAwvu/S9lGS06HdI6ioFVfkiGp/0Lc2aU8fc1cZN9WR5eBbttiRJS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BX0W7xOV; arc=fail smtp.client-ip=40.107.20.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xA1yuLRjFYMW3JPwQADFdmryGAhurJy0vmbeRMl2i/E2wCLOb1BJdVUHazX2q7JQwcn02C8frjNIfN4/nyfcV5hFfHbYhsiHY+ewScDVCijOxWCuRpaIJa1npvIXyaV7Tz1/dI4oeNEU+8PwMig28h56O3QQ7DIDaI6kPuqO30X2UGHqOY4E8yqg50lhgxMz2LXxT8iuzHcV2LfHmmwNZmHtaduk1eTtdW9hjFod/yqgFHBjGRqJ1rLaIv3dcPkgJNrRmwiMJe8K/8WNuCy/VyNQu9HD/p4m22s5fWTAg0vRVLnIFLk8PGQ2i7z7xcCyYDMZXMZUZ1u5IXxwLLJBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uT3t6uBmWyh7yf2ifrOiRV/I3NjB8X/2LcFjW6fCyWY=;
 b=o1GtZchCDpU1IWfWc7YilNfaKaL+69K3j7Tu37lS0ZXwXpDOYVoz0J3wli/ryomtISedokPdG04SNQjaxG/nTk/y8IpcqR/oN57KJm05OyFfZeneKFpglSXG4ovoKWuWLpoULY5RDNC5/bgod42VksZvMbf9sh06P1sFJJg1oROlkxDZBJPiLZF5OQiD5jOUjnBqW5ZHuRW6Rlj2dy8HK+k/odqmpkot5j4RD+Z/E0KEyO6a4W9sgUS6UQzAjFoi8iCgcKmCKQZUkXtArycymDrdylyLC8qN1zz/qDuactpg6WbmvfWsMN4n720RrUUA27s45/e3bqH4jNPEvGj2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT3t6uBmWyh7yf2ifrOiRV/I3NjB8X/2LcFjW6fCyWY=;
 b=BX0W7xOVW+nEGUNbt5OvywHnbWjpwYCMgLlfHALh2IxodkFx2Z5Ik/zbXSGMtxffpaq4MeM4wsy390ge72JCGl/aAMcxSOSK1hm6goyU497t7Fzbymq/oUkFylyP6Vi3dHWJBbxsTNV8rfo1vIXlh9cj//FZJ1k2TYAJMRiKVmh7qkKAQZ74B0P+yLSxkkil339FikGa364u89TAEBB4DIEqr9n+YAvUrFMolD67dogVGaV6HPe8X4gUsFx695F7vlYxV8xa50gZRnaPDQqn+tAm5g3KNi+N7L5h5l/a7TUMxRsP3uR+e0eFOEqsW1ScAJoxXUKhskI5s4fbrVoi5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 10:42:07 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 10:42:07 +0000
Date: Thu, 20 Feb 2025 18:38:45 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 6/6] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Message-ID: <20250220103845.4jdfmmmffpiye46o@hippo>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-7-xu.yang_2@nxp.com>
 <Z7ZBbE3KdBJiWkyA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7ZBbE3KdBJiWkyA@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DB8PR04MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 231ee588-1eef-4ef8-f3f8-08dd519b3903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gDUYdgfW2SCNaiXStHDljMQ8fxxDzvU1dUbaQcUNsl58HazTi44vNn7Ecd+b?=
 =?us-ascii?Q?RHW/EtixxtHXztQobtWm54tkqUuteF1O5bgK2FUZXq3QiEfYCOKMIUAamkL1?=
 =?us-ascii?Q?C8vVVR+nw3U0+XFE+WKH5J5Vq7ku0PftuBhFR01h/PU75RKfx6fLdG7j7225?=
 =?us-ascii?Q?1z5XqMixdnKaCrbuzIhZutxaDRP7qz1j+hngW/otFD3CFv7H8Nw98xwPm0uY?=
 =?us-ascii?Q?oYWIuhTu3i/tv9BTg1wpQqQN9uE5b0ohsHsYVy9e4foAldleg7atk6wRUzUV?=
 =?us-ascii?Q?EpFTQsj1JeD+KWyl8sBhAXqj8D2FSeaNFzpEpj0r72OsRB9wCetojatEOzJ0?=
 =?us-ascii?Q?ty92tDKgOw70sNbT9aTHXgNRSgvuvJqG2XEc4/O/bPIkM2cmf9HUCshaNniE?=
 =?us-ascii?Q?21NVtWHZPXA5I9sX6+1iJxk8DqMmp7D8ajGu3vucxtxUKrMuN/UCmKoFulB0?=
 =?us-ascii?Q?o7D7pF/mdDAOBHcizmHQ02y8KLNT9+xm68mf4Ozjn8UwaWK7nMf9b3J2/8xZ?=
 =?us-ascii?Q?+ajwHdv4Po/Ue1sFCzp4DRsGRFcvLoFVbvFVzE5mJeXJw5QDoMDCjPhtgphA?=
 =?us-ascii?Q?Wk2CKOPbtKvqu6zNBc6mKgtJYqPmjBEXRXeDfk5V+83Gbs/xtTsqjL+yXRKa?=
 =?us-ascii?Q?3It1hroomeNfDhj23FL6khIrZfEDYU+WEyY9ncp3AfJGmDGjdjZBw0Tfn5tE?=
 =?us-ascii?Q?Pn1W6L+t8AWh/M4CovAYJwXaWb5lvJHwQ1DvGDPlHKrv7p6wzacNyEh5+env?=
 =?us-ascii?Q?ksK/SH91Bg77qZp/jvOz9r2qm8MW6f7fJok85y8wB/MNh/Yx99RqaLnS0VDy?=
 =?us-ascii?Q?32F/dHZOkWltvLeSAuRJdcn5WItoGWweljJtSH8mmm6fzO/6HLkGS+uHCWja?=
 =?us-ascii?Q?iVEglSGGVZxmOrMqKO0K8oDCw7sCT8kJRLcALtOStv6xm5xpnedpMC7WvKnz?=
 =?us-ascii?Q?x87EMBo/4VTBtjALzQW97UwzhxL7vKajFiLNaf56C+PLv5IECzXoh8PgNDjF?=
 =?us-ascii?Q?0VMUoZFQODzMIURLRcTZ3sotsz6QfNilkQUwjbPkZNI001E5R5SSl5BuGzrz?=
 =?us-ascii?Q?vgG5xk4QFLHJe0gGl558XW4l84feNiKykumT7aNKEt7HJrAmau/IKIlXr0qO?=
 =?us-ascii?Q?rjcO5/EDsQ7vM0w0XAkcrfZu8S0VcsjlFawhnS9VKpy685i9g7FHeaNWx+cC?=
 =?us-ascii?Q?oq59dF3ou+hg11Qmy9qbZLSm9g5C6MhSEIxQPE3ULMENHleAf2afIFau8/cM?=
 =?us-ascii?Q?K0ia+HqD+lhUBbKaZE0W+0sPRgB2HDQNPbbW+D3SM9h3iF1hKzexzamgNCd+?=
 =?us-ascii?Q?95vDn8XVyx+GL4aOmKgP/WC/Hbv58ckxpx59M2QzvYXc+HSgcIss7ysgkE7u?=
 =?us-ascii?Q?WJECY0J+97pVk+TXKJaJu/iSej9cZJ3EnOdv4NTVfBtNkUEV4kckK8j66arS?=
 =?us-ascii?Q?p5T/ueRs50vXle0n4S4MApsgoN6w1n66?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G+JZMC2YUUAnO1/Wbjrco6u/IpcFfYxHBb00n5aqjcEJJyhbTXz0mYQ+elUA?=
 =?us-ascii?Q?/PfqVAdw3iT7K42me+jGaVE2zTcdQCqNiAMB3I3itXOKbK1L1QvPYmdv+OE3?=
 =?us-ascii?Q?qIy+e8+fxtOWhDKDGd2Qt5xA91IbB5YfJk00HTCNMZ+vKABgZm1IVyP/fYj6?=
 =?us-ascii?Q?JNLmPdKCSv3lgKvYGHZacn+9gNcw32ffdOCuOV/2pN7fhSUJ/c9oyFOWTpsC?=
 =?us-ascii?Q?ZQHlgHsWSeuid4gJxZG+eJi4ef0gS6bU6IZI2J7XAIktEA1frCZVU6ioJ/cx?=
 =?us-ascii?Q?za7HKaqwoiKSUVzOfxbj/TjdR5mJONfoSGW5RGYjIOR96d6EwOkm+OpBMaMJ?=
 =?us-ascii?Q?SrqukHflJ7olrpGNWqLLdyqlGlrGP4dUzdGob0NSnxRYhMWhQ+6p+Xh+j7MP?=
 =?us-ascii?Q?A3vPV7TZMedlskzLIwidB6T4v7mI3dvQKFjl/5/wFp+D7c79VxBGnGRGR7Zv?=
 =?us-ascii?Q?63vvHPnjRuK3wRK86HfO9wHuVpWvob0IfqCKUmS0GfAHfey06OrcKl+zKfSi?=
 =?us-ascii?Q?2aROwJUqNnH5Q7zoFMAoe0D3XeewOyXFvel8xrFuRYqaiH9LAiBcJLLiYSoO?=
 =?us-ascii?Q?vzhyORQD3CvwOaJaMVSgASLvrbzhub2jRwgQwch+FnOfj5BCI5cc5pBaBa9U?=
 =?us-ascii?Q?0OOYEPU7dwo8ekHlCOHhAheXAXrWHCwVvOl7VxcefqGCnzH1H2OUymRZarhR?=
 =?us-ascii?Q?mV0Kk+X78HvWl660dmZrKonSkND2YmBya7Crbq98DIXiDF6hBcLgk0WeBAf9?=
 =?us-ascii?Q?pSvL7XpiP+G/Qr7itRVQoL+9wPcUWdwyZS7U6iI2+owdvRVGPXt7koSwcFdv?=
 =?us-ascii?Q?59cdRY5YJNeN6QSOUvZTbRYhGI/iwF42VL29SJFI1i2ErVrlvmJmKcDZd0Gl?=
 =?us-ascii?Q?nXC3vhR/feqMop5WbxUTFxhJSk96HaGnlUNWIveGjBW+mN7YKMQqwZEgzvAh?=
 =?us-ascii?Q?YphrNh1gckFm3Pa71YJS6I22eLsj1PdrBG5qq1ihAXUHG5hMQ+FwScv2IuKP?=
 =?us-ascii?Q?I6HOfwSyB/QI90OJ2M1TIR1SLqWAEdcRTfdF6pkkcimSaSwmaDNAkZkWzxzp?=
 =?us-ascii?Q?pKn/0ip+bC2zRlfl0tTlL7UDmxk9PocvKUAQY5c7UWJsTHuUjbradBVThru4?=
 =?us-ascii?Q?nX0g+JazB0Y54JPk1PcvIDN+3ijaGpCXCTbXx4r3n2Lc93bJPzFO1YC+kyzz?=
 =?us-ascii?Q?6Wco86KPI4TbaCTQMwu7VuiVtuXiobs/uzXwYpBiXjysjC6knlJMZFPeq2hi?=
 =?us-ascii?Q?1womv8MjoMxdn3mqSZCkkc00whhVpf1F6UBDMW2lDBwk0BhuL01qFnY/qUWd?=
 =?us-ascii?Q?2BiJ7WsEMORrFmmJSAHHFlPEBFmcpWYpSoacig98btdl1AewRtelrS8kjvHN?=
 =?us-ascii?Q?Uq7uWt+oQf1YTZdSdojMSftVtdQwQwnNqiW1x82AVSz0qeJ5b+VyqpSY9Z5b?=
 =?us-ascii?Q?96O/7ikeoJH8Wri+x3L8zGWiQYMKlQGpAMtsUPmGo83pw7klcQ8fmkepFcJp?=
 =?us-ascii?Q?xy+/3dqCtq+46wYXxXG3/DnS8TQcg6mYKsNPkjf8dhm3PKst1Ge9TfoFra8h?=
 =?us-ascii?Q?2j4+4tu/3CkABKnKAxhr3J8RwGB5Z9s2TAbsYC9c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231ee588-1eef-4ef8-f3f8-08dd519b3903
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 10:42:07.6652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: da7M2AgmeHD/fzU6xAedXtXHnoW5jQKKNOJIYWAfn1rMPWRXKeY/PHyyV/FwAw4JSrFpVX75R4LTyfaGESdu6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180

On Wed, Feb 19, 2025 at 03:39:08PM -0500, Frank Li wrote:
> On Wed, Feb 19, 2025 at 05:31:04PM +0800, Xu Yang wrote:
> > On this board, USB2.0 is a host-only port, add vbus regulator node
> > and enable USB2.0 node.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  .../arm64/boot/dts/freescale/imx95-19x19-evk.dts | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > index 25ac331f0318..0505cfe2778f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > @@ -133,6 +133,15 @@ reg_slot_pwr: regulator-slot-pwr {
> >  		enable-active-high;
> >  	};
> >
> > +	reg_usb_vbus: regulator-vbus {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB_VBUS";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		gpio = <&i2c7_pcal6524 3 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> 
> try alphabet order, regulator-vbus should after regulator-usdhc2

Okay, will do.

Thanks,
Xu Yang

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> 
> >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		compatible = "regulator-fixed";
> >  		pinctrl-names = "default";
> > @@ -461,6 +470,13 @@ &sai3 {
> >  	status = "okay";
> >  };
> >
> > +&usb2 {
> > +	dr_mode = "host";
> > +	disable-over-current;
> > +	vbus-supply = <&reg_usb_vbus>;
> > +	status = "okay";
> > +};
> > +
> >  &usb3 {
> >  	status = "okay";
> >  };
> > --
> > 2.34.1
> >

