Return-Path: <linux-usb+bounces-20839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56727A3CA07
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 21:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12446189B434
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 20:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1DB23F277;
	Wed, 19 Feb 2025 20:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ci5GfBqW"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFA623C368;
	Wed, 19 Feb 2025 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739997438; cv=fail; b=Lu77CxCnTb8Wdaq5Ydt/DsIC5VzLiwHqgMgXIEbdNwc+rAImieLXh+Po6TaZ6iDRaE2QSdP4wwoFzCVPmRUGkXGNn3z4ac0FtAI4BTz6lyD2V1yUHWNT0y5DqkZV5CdCWYhwlMQ+i3GAtYe4OsagXudeTdEC7pIK+2hkFcZV7Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739997438; c=relaxed/simple;
	bh=RsX1bOwihk/zit4d3miUyJ3t0Zf0+YnXOO50yvs27M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gVRx+MBwL0wnNTdXLQ6RQlawN31s/Js91MIJc/YpxPoOG7KNZJFN2XcNeLSGsU70H0cyde7PYn/jRmwYTNclTW/3RD6HdF6LBU3+WBfwA3PkPyOt4PYlxzrFQlkffy58uYZQ3moq/nKihIgeYXNgNDyHEW0+Uk2XIMTfHu31GZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ci5GfBqW; arc=fail smtp.client-ip=40.107.20.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zH66C9bHejde3pidRXcoBjxH4PxRc0v2CzXV72GmubmjvRs32AMXJ/hMDPs1vTLpgjaPMJP+JvgWnM9M3CFftZlZYKbSSF954PFgXIhpEkKTvMQ/5x3b7GBCeK4SfqVcMPTSkzSWeH+h4vzilGWC22h8Iee/ckFC+i2yTDLl2g39T+RPmk3MACex6U3mK+DZFjhJZSSi5NUQjhIKUXdgu9ZPhq7qYccfkcEZemtb9/OBj3yZfiz79f/z9+Fr/agy4bYCnyhNJMZShdMl+WtAwz/pLzkKN8ii3AbtRdv+Mv0mTWpO88xz/10RgxWKsOqS56c+HQyGOdr6+9eBfJkwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuXFuYpB7N8Qj4xIeP3ZFYIBb2emM/S3s83YSxASg0I=;
 b=ZR6FH/w1/0bwXIHycmdOO7l8ZZa6twnh5P9V5KNrAWSxFsP96QSG6ZqB7pUeuxY1qgYvCqKZ+2aZjxGxcgjQs6gg2x/xVuEzcYwpLQbig8YVfA2X6qa5QeP6eXppnat4yhkoMksBRwnpsjZJ8Ymt/V9thYD22fPK6XjZ1plpNt0MxKCVnJY4LgPinK2Fc14fj6LafG5hWKXVQlxEY174qGngRCQ9XpaUYa4xjg/7BHOU33tC03EY54m12gCYCGCOB4G4LqpgAdLe1DrNPPutYHK2ymCWXvn4l9+K2P9BbQoh4yFgzSQjwfox1qdbsQ92pdg1WMDPpsFgtJni5ek1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuXFuYpB7N8Qj4xIeP3ZFYIBb2emM/S3s83YSxASg0I=;
 b=ci5GfBqWXsy+YhbfGquW2cx/hN8LyGcVT99isDFiyx3MiGrBPzJZvaDQu1BRvxNp0aDTnpbMn4WkYacTsoLFm5DGA1MktS3pZPbGGoCZNSx308EEGeyMTfxixoDLP3d/+wLHb3T8HA4OGiSiY/EUfcJapmKt9Nslb/K4u9pA8APm1BuaA3pzhYaKAvLHJlsiMTaD3IluKUQaJmahcRVK91uTFtXgZj7Zb90i1/2fAhwaaB1Z4T4EPn+X13nIWm6Ku3CI11D7ag0WTkI4fspowFrKqIPMj6KEY79oMGVTc+5x4Q6D4uctnyoSKE9CxNGq6Z7mV7yft6zTrIV5POR+IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9804.eurprd04.prod.outlook.com (2603:10a6:150:114::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 20:37:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 20:37:13 +0000
Date: Wed, 19 Feb 2025 15:37:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 5/6] arm64: dts: imx95: add USB2.0 nodes
Message-ID: <Z7ZA8bH6r4q7NiP/@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-6-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219093104.2589449-6-xu.yang_2@nxp.com>
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9804:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9847b0-3ecf-4535-daaf-08dd512530e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cf4FLFzwMDmYREZiuRWX8aWcKdK+mjQEBCDFjW4XyAWJ2QHttUWaD4ceCham?=
 =?us-ascii?Q?1/ldVVTNCoavr/MLSkZqCrEjSU0bUsJlwFoo74ITrqNU+B8tzmY3B8VbZshP?=
 =?us-ascii?Q?tYhSMGXurNDwQw8MShastVRmfX7yOuvK43Ar44j9ozVf/7puVFoLZBNB8dbK?=
 =?us-ascii?Q?W5LkmGYo1H0D9cINVlunKE1JCQ50kn/fkFy8WBDFcKbWnQ1nY7js4hD/uvo3?=
 =?us-ascii?Q?JjltIGrq/4hAPBLEcDsKt30CjxXpqpeq6J2O5STuvZGNbQIWsO67NbN/XP8w?=
 =?us-ascii?Q?lDBfAuJaB+KPgFlCxIYC1rFWaR8OGJ32L4LDnIGhXf++6uVwb47Wzvmqslrq?=
 =?us-ascii?Q?e7x7zNPKO2TJVWZa8vlsZZ3k3hRhMddrDRBXaRL+pY8pPXkHPsbWYDuxYLAJ?=
 =?us-ascii?Q?t7VkifTsYktmdKajx/9qgbEw2lDnTo/h81mHjUWt6OG/Mt4ykesZ72SeyhL0?=
 =?us-ascii?Q?IvEXs6OYkGE/Cbh3ji2h8hXM1jV7EzhSCFwBIAcEhTOh2Kq01RdjT5uGzsK4?=
 =?us-ascii?Q?io1faIxYvlxXOjATR3j+n8shXUpG2f36DX0T2m+NosVeEi9No+GWJ4bg0uFT?=
 =?us-ascii?Q?fL5aRHvgiJe1AmU8y4nGPYq4mZdm0tOP9aR9AtMH8xI+hbxzF4wwqCNvxhVe?=
 =?us-ascii?Q?jWqEPOUSsNPzMXdMnhItGzmn/nEBzQ0RXbfXBz5SsromW8ajzjzMzvPTzfcm?=
 =?us-ascii?Q?LFfQdHRk0DmntUhjyFvWcSNE4DdZV1y/LfA0LErBo2JiugUHJCrv1MzfcFnX?=
 =?us-ascii?Q?lfAVu+t/xXY61VDodSePZ9vI8V+9X39K+NkEkNRg37bNqMdhrDg8jKP4jY6r?=
 =?us-ascii?Q?isJyiADo0ihlLGMIrfSL18P4U5VxD1iQC/rbMiRXJJjrcn7hiCM8t4FejVyK?=
 =?us-ascii?Q?ipkFVGuOkc4AtVa+8ZyKUMFk+6a+9ERRQl9A1+CGIAdUW+LiCpBtxYVvk3KT?=
 =?us-ascii?Q?WZbbCTPKLyX1uPimWrSeAJQ7ckYe54rNkwJOfKo5/e7Am+j4q8/ErGlYODP/?=
 =?us-ascii?Q?QXvTD+f4zwE5Ajefj4jlX86X13iDRDQhmQ0WagLbL8VFgjxWb1VofRJwEmiZ?=
 =?us-ascii?Q?XW2Av/He1+jsdhUJXjNUIzTJVFVYol8iEjOob8+fNYFwKUuFMltG3ZsCof8l?=
 =?us-ascii?Q?xOzrlXRjesbMYeOqtfZZ7d/rG7YxTpx9viVjunYB8SSLCmO9vdBko6RMlMjV?=
 =?us-ascii?Q?PCPFvGo7nv65klrRuI4KEZ6+0/W6eVxIGnrhvWEbpPvBRqbG7oY2NhlQRLAp?=
 =?us-ascii?Q?tkBrY5Fa3bRp+mK9SmIXG3IOKVmeKEOLEgUy3Rxc20iEhOvyt8RUXVPBxGZB?=
 =?us-ascii?Q?0ykHLgpKuzXg1OrgJTSCvFLOtVztFHsLKrNk31hWBUIAEpBxIVRFhutPQsyG?=
 =?us-ascii?Q?WCre/qLkgwUac/aUDwE1+N9wKsqzy5rUwrApXrlFgiF1JzxmHaXxn8i5AzpL?=
 =?us-ascii?Q?6xrv3CAOgt/+H29bUddJxFwCknWhtcZl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TmgdyH6VJdE6Pzse2ekQPbo1T2GGSJyR4jF/cvanXHUS6H3e0K/d8EHX5CpD?=
 =?us-ascii?Q?6DW5yiDe7eSaT9gE8vLYvQcaqFHMHGPVWnB1IWhu6SksqRl2r6oTctZmHqPP?=
 =?us-ascii?Q?afPn7felG5SDzet613/HqkBMKnI3tOqk4utNIgp1OCCgbh/iH4/mjhSGtDHh?=
 =?us-ascii?Q?X0gpoyV3dEGC4tQuJGZdNekF54xkE+li88zT4QvpDcNoSPh7WyuoeI04qRLK?=
 =?us-ascii?Q?tqxHIQlyd9PI1MIzmCm9cOANHsC8A82UWh8rT+kv/Qbw49EfA5Twp49VK91b?=
 =?us-ascii?Q?FSYtUI8X3N8aY6GA8JDiRKHaRD/LGmtE31ZxV3LgyCzsO1MsrRAuQUPhfiPW?=
 =?us-ascii?Q?FCLVzsFRRc/bgYJarnRBbM20iNs6mJTYOsgX78XrbXn5vk0onVCwhMrh0Zx4?=
 =?us-ascii?Q?hcROAzb4ZXQlK/nq06XLcDuMC+SiuyydjHVTybF5K4viwQPtnO/Hx4rhA5jh?=
 =?us-ascii?Q?UVTaOdV2g+rkvBh2UvH9CkPtqUcZmoPxgFSfiQzBEYLLuoCM+bwPqqu0bxWm?=
 =?us-ascii?Q?y9GLn62fVNTNGrIJBuTlnO8k+sQzx1R+lmOaIgFAoIziLybtCCbVvcHse82L?=
 =?us-ascii?Q?4INgVzmkGecG3OwqeyTeb2vHhSHFvQyDNNZDlQrWR6PwspnEB4iP1Tg5GYHZ?=
 =?us-ascii?Q?aeHdqwkYZ/A/ekCQ5kRFtF4oSAXdn+DXrveAkt2ZDJOpPljWulgWnvxdYJM6?=
 =?us-ascii?Q?RqhS7SJKQnGNrzVBMEskyPBqEGrM/BGijQ6wiOE6IId+4zX9/Dl1MfKYZHG9?=
 =?us-ascii?Q?WIlsKvT8sqWYpSuai7YAympAaHzRx0AJG3ieCq9u3jFOK3KB+sCH+vRvfMB3?=
 =?us-ascii?Q?B6pM8PXn6ndqCO0KgcuifqttkvjQmv0f4hMaGadP0JdgB1M5eNtkQdCqvooQ?=
 =?us-ascii?Q?LKSyy2buE54OHSLF0i1FK44XZ4klciQccrwn2GuMqDEZLqpajEtoAZS7DFAW?=
 =?us-ascii?Q?sxgeznWntCazxK2StsevJUO9s9ev754dMPTb92zb3JAFhHabFH1YlccTGG4R?=
 =?us-ascii?Q?xip9uE3GvUjh4Nb2sWvRVw+I1aZ6hPK3mf6vwZ/oyfs6MMkKEL6aJQU1vliw?=
 =?us-ascii?Q?yDLs1izk8smYCED5EAfhEZQrG/KmaLaiRF4f5Y8iWtzVpMvTOJNiQF4K/s4j?=
 =?us-ascii?Q?pQDQP3Z2yTzLDbikzCvQBj4OWlRSyHiPCfuYP1GeZ1CQl+S3tdIBRY8gGci2?=
 =?us-ascii?Q?iqjaqZS8YxQimuL8/JDNSCxqo947rT4j95zxazg2tkhjzGYdkrfOaE3VSfts?=
 =?us-ascii?Q?GZnnpI0Gml5wA7zKDxFL2b1idiS3e52NmlCz+UOKQwLN9RXBVYTh4O8FQSRz?=
 =?us-ascii?Q?h59I7gjkAXLWxpgYyNdZgXgdSA6a+l6q5RQDXwUDAIWXKd0u4zJq/T0fszqc?=
 =?us-ascii?Q?gEPn7MkA75aBE/T4V0REUbObb5BRMke08fvXwxzdOk6lbsmToRDnCD8jdbTJ?=
 =?us-ascii?Q?m9qHKNGek/UeOeQDALHtIzFEc1SGPwujDS4eU3X485UZov3ODUnTbpfh0yek?=
 =?us-ascii?Q?di1uJ6+dwuRncUsMnCErLsMRCEnwUzxCSELeDPeQEuDm9gjeakvUg/Ao6uiq?=
 =?us-ascii?Q?nH60v5aFUP4WwdYMSHzMMPhlWn8a+vZSxecdQ741?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9847b0-3ecf-4535-daaf-08dd512530e4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:37:13.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XynHr9Rd1NfF4CnQbC4yyZ3vFCIeOi0Kv8TQLHJ0G+3z+7SlyjMzzPjx3hB6kwexJ+OiHS4ai/Yr5nv1+rWPUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9804

On Wed, Feb 19, 2025 at 05:31:03PM +0800, Xu Yang wrote:
> Add USB2.0 controller and phy nodes.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 0b64a1df3c7a..a7c87b9843bd 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -463,6 +463,13 @@ its: msi-controller@48040000 {
>  		};
>  	};
>
> +	usbphynop: usbphynop {
> +		compatible = "usb-nop-xceiv";
> +		clocks = <&scmi_clk IMX95_CLK_HSIO>;
> +		clock-names = "main_clk";
> +		#phy-cells = <0>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -1579,6 +1586,29 @@ usb3_phy: phy@4c1f0040 {
>  			status = "disabled";
>  		};
>
> +		usb2: usb@4c200000 {
> +			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
> +			reg = <0x0 0x4c200000 0x0 0x200>;
> +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> +				 <&scmi_clk IMX95_CLK_32K>;
> +			clock-names = "usb_ctrl_root", "usb_wakeup";
> +			iommus = <&smmu 0xf>;
> +			phys = <&usbphynop>;
> +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> +			fsl,usbmisc = <&usbmisc 0>;
> +			status = "disabled";
> +		};
> +
> +		usbmisc: usbmisc@4c200200 {
> +			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc",
> +				     "fsl,imx6q-usbmisc";
> +			reg = <0x0 0x4c200200 0x0 0x200>,
> +			      <0x0 0x4c010014 0x0 0x04>;
> +			#index-cells = <1>;
> +		};
> +
>  		pcie0: pcie@4c300000 {
>  			compatible = "fsl,imx95-pcie";
>  			reg = <0 0x4c300000 0 0x10000>,
> --
> 2.34.1
>

