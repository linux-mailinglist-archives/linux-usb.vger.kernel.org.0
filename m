Return-Path: <linux-usb+bounces-14072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9E95E9A2
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 08:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169561F21899
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 06:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796888289E;
	Mon, 26 Aug 2024 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RJFjgltu"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80DE84047;
	Mon, 26 Aug 2024 06:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724655445; cv=fail; b=Erye5FqlaynKTjTnHLHvqdMCGgg5v+lTmWgfkQ0PJ1TyM19ZDlJygyIrcMcyQHbx4qWS5CVPl3tfWTmQJZ9fIT+TfRCpkfjo9VQwoLiWZqYA5setvYI9l+xKknLOBJ7mWP9lWQ4I5JU09gnqsoY5tL5TGFoDcHpHZMeqFCqqS1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724655445; c=relaxed/simple;
	bh=kJ8nWrAs4dxjXnouHO3LuS6iOgFMNtu1VWhH3utQg/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ijMYfQJYm72a+FArY3+ZA6KIk4w931CuFW6UMRlt50Nl74/jVG5IpdCVxP2CbkngwhaOAogI52X08WxOEYwAJLkS7ysbhwr3Jn/uDJGBU2kVp9WI81Gf5MVTZ7OG04FVj1rezFzAlHuaVKJRAHa1IiEoeCiWuCorJpzthuId4AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RJFjgltu; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM6B+QUthFnyS3mA8gKmyjiVo/Vg4LWmFd/dhzuk/OY7dPMKhVTpLjdG2ztkke7aLin2IHwZPc6goz+zdtozK9vYYJYN6PHFYLm6VteloIFOV2qd/yhLJJ2i9u9le5nanF1xfSbW/sDzwQKnId2mz3U1PtvkX+YcSpPDOej8umCTi9xF03BFi/ufDGM8yvSTFcSG2v+UQHIIksW7+tTq9txtntbAlC5Z9ylAUVAweBUqpeNZM8cTr4aBOmvCu93fAIFSoOSmDuW/9Kk5u0cA6j/gYegeg3NdxpOSw3WAfzqu1Cs/eHiuroE9NR7TShOXXuuVJJlWeFxuQY9UdFNLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AsGABcu5YLx0vkm/xaT19vN7TQKOm3fAUeeCTLcBhk=;
 b=pIbe6kV98Yf6zb6iMDqZmNGKT/UCOlZ3HrVtjeWOI6gKvBTnJnGApI58qM2c/K6xijTj4iQv7l/iuZVMwAi0J5n2P9/A/UZPxUTFdMpMm8G1zCMxB7ZT4Qbkq3QmWJii7tuhAdV9rxPHBnkN7/RuzDupIn6o8fD+DFO2zUUTHSM6kVH/eNsHDPgCwKU9hs6PyTRqAhevko4diWVrgu3E3+fICSnewDokupuOnyxkKyOFPGjdQuHdp5QloKM7XtCg6atFJQa4XT1xwT1IkatI8Uxlj79LtRlsM9MI+GGq1TPcerzRalL0fRbSQ1ZlQOWxZR4UA0b63RxELVmuSz2Mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AsGABcu5YLx0vkm/xaT19vN7TQKOm3fAUeeCTLcBhk=;
 b=RJFjgltuTqW6639o+FsIepus6OXmKi541Xe+9s0kOG35EPvT6Nm2SJ6j/GQ4o1GpH5sIOua2jEE0GKTJr0PhN+jt3fULMEK8lQqfkdyCkm+padcbSIz2lZKk420MCwYFgR69mzX5fhDLYjG7siTJYu7SVmJVTvuZ08P3G2Fy2MUtvotUHytd5TicXcKneshg2aSSPKYnITx3O5HCJT+UP3vGv4zSv+OSv12SKHo+Ng/T2nYz7HR2yXSyVxxQfz4zKGZoAiWIEEeM0nB+vVOMnEZObowVH2ZXqAeJv8qbm2HzmjsKnIts8mwITkh09GQArKKJEMSCFxtoVAZzSH2wgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6925.eurprd04.prod.outlook.com (2603:10a6:803:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:57:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 06:57:18 +0000
Date: Mon, 26 Aug 2024 14:56:12 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 6/6] ARM: dts: imx7ulp: add "nxp,sim" property for
 usbphy1
Message-ID: <20240826065612.ol4fjib4g2jrvoy7@hippo>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-6-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726113207.3393247-6-xu.yang_2@nxp.com>
X-ClientProxiedBy: SG2PR02CA0089.apcprd02.prod.outlook.com
 (2603:1096:4:90::29) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2c7da7-87d3-4afd-3b8f-08dcc59c538f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8PeMED0Dzcm+1Yeyru02/nJDRpU3TxcO5umP/qPLYKmS6x7el+MlMSGwwoPS?=
 =?us-ascii?Q?hcL34I9WkAVidqMb5hEE7/hzTEKU2Qh8GCvScMIw9afTloWGjwN4SxN12LO1?=
 =?us-ascii?Q?m4VWkb3oaNYhFF9uZGFf0Lj89mz6CR8NXTfABdGS/KmjBbnjOxhbbwJc9+J8?=
 =?us-ascii?Q?BgnCahmOK3d+Uj7T2aON8/ok8YQjDj/TtiU7l+Zw2gQnTCHM+DKS1PAzJuks?=
 =?us-ascii?Q?j9Jk/ihFTNvzILa5GxAXy1h8lhfj1GhGSPM2sAL0Hug91U13AvZ2MtnxqhdT?=
 =?us-ascii?Q?SqHWW6lKGQSdVmfdWhLkem5XZRlbQCOkVODQ+hwPEQsA0tnTpOUZjwsGwfGp?=
 =?us-ascii?Q?lFX5uaCb4TiqxDEN3p81jT9G37h3bRSvkk5+JjPAhBUMKGMeytoc3lOqSrhh?=
 =?us-ascii?Q?1WXR5YvQZZ1AHiNHlIDY3BXK3X5dal7P8gKmGUGjE0vqDXJR1YP4cj6I2tPI?=
 =?us-ascii?Q?mArubzl11FqOohANhod+BkFFpmJO7xeesKxLfrqe7lW+5H8uP0gaiZWdEMTD?=
 =?us-ascii?Q?HMuHvIhy//yrHufDuBmjgzRHy7/nywtPrRoB838MUup0KdzBWs8BOmvAiezd?=
 =?us-ascii?Q?XusvkavTi4mT0kappKAodJijgJwJrqdECNF9KBri9jtlXV5JfZYW4XEJG1WU?=
 =?us-ascii?Q?y9Gahp01D/BOfWTSnQr+rQhIGM6s41u0MMOgQfyhEqjUd+AmTwki+IDQ0UHc?=
 =?us-ascii?Q?SXlwyxqK5KENJigA2uqRNHE4zN+jB6sq1HIKMv6HwqKtBiBLUfdJyeRJRRS7?=
 =?us-ascii?Q?AcMoQmkfnF4OTvoDF5HGIxDMlMjINhs2HLN/ibbBvL6Znr+KV1fXzJIgwNhA?=
 =?us-ascii?Q?FP/FONafaP8gumGsm9231OWWMTwXmyiLVIMYXCcja3Jc4t9T4Haa2EyP6Zqt?=
 =?us-ascii?Q?YqoZnkdV7LeS5uXpg18iGvgoCfz5Pord9ljgJ7cS8zN0LcYkZ6cZsrMc9fMD?=
 =?us-ascii?Q?Ymu2uErpErgc3CnSMDDJUihheWNfOdtVist4OF22gUt3sG5UlPz1LHeslCtt?=
 =?us-ascii?Q?L6LCM7wioxelCAld1iPslcVctDHJs6Lq7X9AyIE3Cc6BaN7P6JiLWsa1Bn5y?=
 =?us-ascii?Q?+gTTVV7p/iLI0iq5I18iolCFQZK/CrkGIfm0Y0AHO9+Mx6T8Z0M6cYrCymn5?=
 =?us-ascii?Q?cxBAL1QiaBmycuv0tDYqe+hZFZLfGdwAG8KZckOjq1iYFJ9Fd3RRyBiof2d8?=
 =?us-ascii?Q?Kce0lPnzQw+2Sq+oNe+6QtS+4hTT4iQSAIu6SRasDZ7Kughzwp2hywfh34vh?=
 =?us-ascii?Q?i9LZd71sZ37pZzLVNzrlj3UPQCpqehQ1qCAYqEgHBD9Pm5AJPKrVIKP1Pr8r?=
 =?us-ascii?Q?BNkFAbukKqG2BckYYOnoBUw74MI2mlLjTmICohRsxR3uGr7aDqPsBXA21DEZ?=
 =?us-ascii?Q?pda9MGPyJq2jrNLA8JMwauEg47m5KXOxc2QOhbTsMKwHD/2XpAb+91DvEDO9?=
 =?us-ascii?Q?mF9tlaNqflU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GKhF9rM+cruo2vMzOaXItahFlRHpO4xyQ/iHxesv9XDNfnPHtF9OB9MdfSHK?=
 =?us-ascii?Q?yyaFBQOr5Xs/r1qXi9nwTuCHJfDexonsW8IBwj/EfllQeX/C4WvWMeGUdixH?=
 =?us-ascii?Q?gYLDprUCpJRF2N8VYRF8QAD9/za6CL9mL0c3T5ppmCYAAAME0nHu4YUBVQup?=
 =?us-ascii?Q?Ca29ei3BlrEdir7HuzxtNYbKRUovjBcxkp/JhZXqJ2xhtNLM2CZo6hMqz/Bk?=
 =?us-ascii?Q?+jBwtSriCjmdYlFHY2Tmgr6nC8sRZso2PPBsMo+XpIUjEzvwH1xyjr6aniIf?=
 =?us-ascii?Q?0a2lI4hJ+ulIci3YltzcROfZFuKh6z6+JOQKRHlNBZJ2QoRrLOaODLXLwjFO?=
 =?us-ascii?Q?a/gkacX62g79IRMNOW3Igj/R5xGNi9HN+sjjvuRngGOxTl3986YNzhaRXdd1?=
 =?us-ascii?Q?gRy0Rn10IyGtBShC8sk3rGdLmg9YvbrOMHKXPIqJoyEi5ZCwWG+D6JKXmgzZ?=
 =?us-ascii?Q?TCYDKRABFYhgic0ucA/zJpsr8PojL+EpfP1dc3ul9b4N3rm0n4/BmSUbaB7d?=
 =?us-ascii?Q?FAMGzWbPx1+GiEV8GuFY5OxdGByNCS4unCQibkXx9FuuVddd8Anfz+MKg9ph?=
 =?us-ascii?Q?SRhiawzXrS8AkWV/95TCIkBcrZvPOopOVfWwlRllt7dfuzQFdiv4JBPflg52?=
 =?us-ascii?Q?lfjbwj7iDDL9AmFB4NXRaG2DI8hxK1o/nBnnVxVvJ+JC/EkKyS6ctnFiR96p?=
 =?us-ascii?Q?pEuYxwclgsBEQ5UtdiBsi+reTO4DgBvsMKE+mvuTv2jwRtf2RD/ejy3Ya+3Z?=
 =?us-ascii?Q?wMgIPTcOA40cYOXhxaI1DMDEpxutux1rSPg4aMWs0Krqgs0A+lA1ezGbob4i?=
 =?us-ascii?Q?RuazuBvGkeuu/oW7/lHKoS8gKlBQDEWC5bJrAFoggFo89lNDRtuyQImpj1Tf?=
 =?us-ascii?Q?EJmbVhMBQU5U33RMPcl8Vmyo1J41XxuKGTM3jR4NUmEBnPsCN4YKh8up88Zd?=
 =?us-ascii?Q?ZIk/OsbffnYQjmKb6cIiEg0beZ/ponEYWpMYzb/c9Qi7cO3sHmO0QAfREehJ?=
 =?us-ascii?Q?JLn9mVki6lBzb8iHPysxOkDSzQu9QAn4svO8jDVUbCXz6U1PFNdCm61d58ih?=
 =?us-ascii?Q?U4WvVzxzrA5e3IhcUxhJwd5EG8Hsy6xXYt1y3KStXJTQjUzxRjdD/y1NadJW?=
 =?us-ascii?Q?iBJqpVnm5EUSLXMhJmMzIN69iq4nctyseqpuCCG3ppNJFaxWDMvHsCzAJWeh?=
 =?us-ascii?Q?wpgv1AS/AijVMxgK9/gAhTsDIritR78HvEoAOJVbjmSE3MmlNcW10f20vT7N?=
 =?us-ascii?Q?kyqS0COVWPJsnDX9NfFCZeoXjoSd2W1UU+e3E6L3J5j+zRDFWuBUQNrYukw5?=
 =?us-ascii?Q?TwQdtoOGty94zBr2DQHNsFfh+2Rhfwxf2A2VsD192Ypp/00SZDyS8n+RrIOW?=
 =?us-ascii?Q?gSODlTBafDj2af2U5ghkJCUVl8+MW1wWcMi1b7beiYDtCQ2NXBNY98ged+By?=
 =?us-ascii?Q?IPx39aesgi57JoVmZnCkJm6pBO2PaGojOSO2SXfdIASS8FN3rWljC5i663Pl?=
 =?us-ascii?Q?OG4A1BJTxAU3WMsI4atN0+anhA3OApPUsNeOd7pIB1DraLPze6cEbPj4O6B7?=
 =?us-ascii?Q?3blNl/gLGyOgQwGx+hOS6udxI4A7HzL8RKdSDmeb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2c7da7-87d3-4afd-3b8f-08dcc59c538f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 06:57:18.8517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 649KGs4MjNIEObTURDCkLv++tzy+IZ7/2770cVT0FGuojf/6j4PI5C/lRzsvPUCYAr6s2gvbhoSgpugWMqJhhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6925

Hi Shawn,

On Fri, Jul 26, 2024 at 07:32:07PM +0800, Xu Yang wrote:
> i.MX7ULP need properly set System Integration Module(SIM) module to make
> usb wakeup work well. This will add a "nxp,sim" property for usbphy1.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no changes
> ---
>  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> index ac338320ac1d..b093f2a447ae 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -214,6 +214,7 @@ usbphy1: usb-phy@40350000 {
>  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
>  			#phy-cells = <0>;
> +			nxp,sim = <&sim>;
>  		};
>  
>  		usdhc0: mmc@40370000 {

Could you please pick up patch 3 and 6?

Thanks in advance!

Best Regards,
Xu Yang

> -- 
> 2.34.1
> 

