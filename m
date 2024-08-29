Return-Path: <linux-usb+bounces-14269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60C963F93
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 11:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1961C2177D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 09:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A745B16133E;
	Thu, 29 Aug 2024 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Tq2BfKhJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DF4A00;
	Thu, 29 Aug 2024 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922649; cv=fail; b=NmgDhhBImENF37Z48Jdv15QP0VxSbdEgn7gwR3wvqfFlB1L+iAmFyVOQckOTYI21TuDZ2WEOiEUg67c87CIxQiATGFc7UdiBpKIKMSW6GLCNOUqCf6ddofEDgxs7IAc7qX1cgKqtpPQnYRTrX+xitjZfAV1Pm6EXxQH77/yQbnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922649; c=relaxed/simple;
	bh=/kqXK9cQhIfuWXSsshCrONdcikrqWZAuZlwqq/zmt38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kutbl5TH8il5hkzRLpW6eAPZ3TljOpgp2jdedI0xYZlKjs1oRvw/h3uKwWyOM4UTOXEctWwq4mXDz3rmrWM3dhW7Wt2uKsZdkj4n+lwNCpyze3j/K7u1+oJ+xVTX2hMTsGECxfzbVOHarVYpavkfCZh1kMXekHKE8rKaahUCWa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Tq2BfKhJ; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGy+9zL0rdI/0TCiSvzrclFJo1jY2lnWRoMoo99QVE53pIQ/9I+xH0ZMAclnmXHM97VxFKy8xzYDBxuDLtXakgdX1BHERN8QJh+b8sZC0fXt/pqskHm9H9wvMbdY88zk8Sx9vTDkiUInczNbeyoeP8MPNKq8hbcFmM8J9B7PLcNg47pkIrvv9m2nU3UOb8mz2X53+dX6SuTt355RKLtgeCurSeKp9T/ImGbEaylBndO1RkitM0Gq107V+ySqREIqYTlgdqEhq9fsyjeB770xqg5tdbczcKr1V9X0V4WflsTcl8eCuJFSlGp3n650DLP+sM2wbK9DDgzd8/BxCom2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejmztoxhueFV8+gO79ieKGa4eHzKgVP4eRkX3Me+VhY=;
 b=GnxljFVX/Viv67MOJ24BjL7H87jjRlCh5v7Xrt48cnhWybegcDhRE+mV91KJyMncfnwqJb/NgykbWwut/myCMBfwGbZ5RPxCNIFLAGVVEDHvy4NaLQvnmtcXNuxnxjZozjDQJY1Ppw4S0qbt8Ob1R+2g8O7GemCT0ZQ7eiE8el2jCG6zxSn1RG0VAY6kxOBG2oC1QPAimFrpUSxmicCREPpWbg4P30pjdN83VwMuS4nNsIwBlEVLpqti1lY3Jw/npPPX9tgIp8rgUirEpPfau1X7J1gSfMk/1zhSGg3UU8WLyZdxTCAIckvUYhnEsfXWU0euQP1VNorY7Kv5XM+fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejmztoxhueFV8+gO79ieKGa4eHzKgVP4eRkX3Me+VhY=;
 b=Tq2BfKhJg9iFX1eCfJdbj7hYv+QtQTWIJYEKlSiMPYZj3GRjvUACv1qP70yEy27WQoET5GNAxRNch2CCIcnJm71sM7oZTFUSKN4NeFVB/Ig4ldWB33lq71oBbhrVkMrCzfwTC+F1e9JCbpddOhpb9NMYMZAqpMHkcVHIgfbbRN2rcdlLBNS8IDJzoH52Y1H1NakAK3RqjQgkEl2YeWj54oKfW/fbuakbS+Q1vGaaS5aORogJokYro707g/HFiMxQz0MdRJlGgESXMAC2e7p/xY7Dn3ef0l/wk8j6AHBq1AcZ6znvH//1Y8wBStXIJK5QASXM6CAyVhC4bSWnCJX3Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 09:10:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 09:10:44 +0000
Date: Thu, 29 Aug 2024 17:09:35 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
 property
Message-ID: <20240829090935.ktc7jgd2en4qay2h@hippo>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726113207.3393247-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efb02c9-ad78-4dde-dd16-08dcc80a763a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n6F+WTwwDKAbknMpmL6j9KbgYMtgojFQhgLScDgodWm2ltM58J3xOyplj/tT?=
 =?us-ascii?Q?NEchL5nqyk4C5WHvCtXLE2WjZUn00XWLxmNQ+oNwDv2ZpawLyOcVRH2T48Ej?=
 =?us-ascii?Q?3aXrnr/Mkh/GifZecokXcwUStnJhpO8Eawb8RAzVKAej/BlqfX+1Ce78Exw3?=
 =?us-ascii?Q?s8OOqWJkXDfqtKXjFJqJlN5mDwFR7NpzBsS4rSN1z7SH5+gyxVZ2P0RoR458?=
 =?us-ascii?Q?nkqYsAe1AGE+USMaNyWFaASO1e4cXC0xIztacAwR/+V0y78cJCkFaUoUuESa?=
 =?us-ascii?Q?y7DpmVlH/UxF9VeYTsVXQm8X4aiJrbqAKWKSY2fJaGoPqtFCwQL0O5IiegV3?=
 =?us-ascii?Q?ex6e8y9SMP0hWJXyVU4NfxIt60B0UK+9FkBnvk0c/vLRgCWb2QOA93sCd1iY?=
 =?us-ascii?Q?CbyXJ0TLRm3CO98jSUjNNH4FacV0+xnYbQEiNR/+QVU53iwH+Wv6VyZxDpz3?=
 =?us-ascii?Q?/9FTooGZIK3Er+1fFG6nJCcomcIs/xi9ty+zOTV7ndy6fSA8omV0fhsXzQBK?=
 =?us-ascii?Q?rl4maMiafGMmb5HDJ8AMx1jbzWZ2LPAAcR2wer3X03CkPI2ns7w64Sm52Dr+?=
 =?us-ascii?Q?k+QApSRpI8KjzTPC4cCCI4FyRPsI46zDb7XvJqqU7DNrTQJjcR0Y0f5fdL4i?=
 =?us-ascii?Q?AQ7aghUrxoojt2DkZo5CYNktmlmXzmlK4yERUTCAhfMVMBeci1X8oEWzQAE4?=
 =?us-ascii?Q?tOoqowD1YC7B69cW0UqWUECBKqpG03e7CXkO+Ou7O4y6EbYaVlqL2AAXhNCr?=
 =?us-ascii?Q?s1yQbpNG/tEEdSUx289MIsqjziqd48GOX+0KqLE/n7rlswBUYerr+q8OyYOH?=
 =?us-ascii?Q?GvxThdS+PZp+ck+ye+yrAerqI8KthuKXXrgrigxFBMWDAfhncgv2HMmqIr4u?=
 =?us-ascii?Q?kXYtfsXKG+nxIdDnVUrg1Gm0FORHevAPtB6nHdBa98yJkJVOLSrS5UdeE2BG?=
 =?us-ascii?Q?yrsM1gjEMpDKQJMa/S7OHe9u8ogZyPka1JFIDzJup0F4K2jxgwTKqBqPQItX?=
 =?us-ascii?Q?o5qJm7quKwEz6kU8kjJ4poRm7QMkl+yGqb7qRmFNdL3opBDJSs+i7ooRwxHd?=
 =?us-ascii?Q?vriSLczs+TBQatUzFuprEXkbkttS9RwPtP6ST1yma/Y4WeMW5NJKr/mfZgwA?=
 =?us-ascii?Q?M3Eq2CU118veo7Dq/tmlhK2CgcDWVfK9Afv0rYGeLCcNJiwbJTO4ZtKHzzfO?=
 =?us-ascii?Q?5GxzLO+MrrWvm8wyy692nqu28uRZUfNEUtn4C4tHLZdu0XX9vJdean5wUqUB?=
 =?us-ascii?Q?iZ7jPu1SX07GG9blNzhY7VgfBQyNmdquQO92DaNqJypIlH3o6u8kw/rQIrfe?=
 =?us-ascii?Q?ll0v6JonBCfNtffiVJnAg9RARfjkttN7wkU57CGQ9TWLNfGkG/GETLE65xWi?=
 =?us-ascii?Q?ar+KhZVA6qkwCaLtMsL3zwx0VCdwXaCdRm1MgxnlO9xpNkzWw0KL2hY5Dtr4?=
 =?us-ascii?Q?zrMD4p2JinU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sBprjybqIth5GASBrQXLRInKVlRI3HTEVpROtHxpznJ6/nCh0l+d0n9YBAw9?=
 =?us-ascii?Q?guC6L+4ZwNmBBuom7QFOBZkkzBQjmByOwc121NUumPZXWtZ52eO031+mBVBF?=
 =?us-ascii?Q?WGS+Gm0g7g/3GjQp8HEHy7qmaEAti1NfJ6/Z7VSWM9iMEbaspAvYt6r+tlMq?=
 =?us-ascii?Q?N8uRO9kXCvdV4pi1HThkswDwhVDkco1qAc30OzDc4oiZrgtuUST8nmyYyEUB?=
 =?us-ascii?Q?NIrCsMs9BlmFZkA4roPRdIBJBm7SG0Xmfmp1zt9MgAeWTj/15/e8Hhke2iHi?=
 =?us-ascii?Q?zlxx2BxF5a6/RxkmCGSu+1MSGtD5s8AZ1FnqOPFusTpvIj7gBR+3JzAs2xbu?=
 =?us-ascii?Q?HamvkzWU4M06aX/pUnh8xLXrdwJR3RJIgPhsluT3Jb7o0rdf+YX6rFEhVily?=
 =?us-ascii?Q?idHfrznMcv2lxeDRmgjJLX/80XdCJhbs0pJbj5L9nPsqFN6MAbzQIjgUvPKl?=
 =?us-ascii?Q?UpVDTh5dx6nYi5hYfrooEezQVA/E/991VsQTW8ouPOSK4B8k5lJL7P4+vbcW?=
 =?us-ascii?Q?Rnxt8xCaI8B9UvCnNU3KrWMNA5cdSToXvGpxcnj1YE8x50RjlwDLdknmHgsZ?=
 =?us-ascii?Q?H0eJYhrkVa3E5J/3nRYMqdXnwplhQfF+IsPK656PdxJngpqEdwC/Y3gwFQOf?=
 =?us-ascii?Q?5ShxD74twIAncvVam8CemHSJ+P/ov/f4bBmM/V9FKJ6D+qssMkOFoFYj2C/P?=
 =?us-ascii?Q?ofstQdSNtfSa38JoBBeylPpKdRp4Kf5AC7Jz6yEjJoi3XFTSo6Ux8LzWzvl+?=
 =?us-ascii?Q?TkAsqF6vHFK4OoA5UeyshSKj7spq6alIkj36Xw1O8ULkB5Zc/pYz9WT9R6pH?=
 =?us-ascii?Q?g40boq8i7QvueXeXjFntU/38LSSyDcHCs7+hkcxmgLlM7Em2zkbH7qaWWGp/?=
 =?us-ascii?Q?fOrbZd7L3d91Lqf0wFBpw6knsYLiYYwqfSjA7qZto1bqsTfsxt8BT/TjkRea?=
 =?us-ascii?Q?lwoqM2uVlOnKnYH5AOX6HPiNONffhnkgE66vBpXzQ+v38nbJs2f9HC7+xhKG?=
 =?us-ascii?Q?0jHf7fRW4+zD6wiAKk6dj0PUGywARhT1t570mQmvzvmLtVHK+XT99Y27Z5oe?=
 =?us-ascii?Q?1s0mSmXRrpaXnFzvmj6ZwAvAbn/ZL/qQdAyBzqyA8PA5Za110l2DLQJQJf2L?=
 =?us-ascii?Q?gyISG9dOkt9x6XQgqmrfMv9PqQiKV9/QQ8/9FewIUuYxtvGfLLXiGLz1LJF0?=
 =?us-ascii?Q?ey578979njE/cj6MK2dEFxdrKmc0tS/fF9gx0uruHHbyQ9nNVTshBmNlc0zz?=
 =?us-ascii?Q?LZC3KbpIVEAD2h6yslCDqTwuCBdj/cTUZTjhnDxDOs3nEzcKao8F3h97zDld?=
 =?us-ascii?Q?g9LL5Svk9lkf/+2NzHPEFpxufTKBAAjCLZ9gaYuVF3N//hz1ICWQneApN8l/?=
 =?us-ascii?Q?Kl7H0X0Ubp7TVxbdQpd2DpeA7hrkzbTzyLG2fzTWDP87EQdHMVzekbvlqmiQ?=
 =?us-ascii?Q?Eexq71lUX6qpgl3NlODymUOjWMmnQT3c/MO31XyYovFy+hI7Qx9EOujEePAr?=
 =?us-ascii?Q?Uo+/iHt9ODAsJyraYYq71f//rAWiQhDtT9OKQcW36X2z0ajRRGhw4Ji/oJoX?=
 =?us-ascii?Q?AJphrsSlbvNgiMFuEc9Y2EyQEutNF0TwEiWUvg59?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efb02c9-ad78-4dde-dd16-08dcc80a763a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:10:44.1828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9/EO2MpMDRWAoXezF6q0t3kFzf3DwasYd203g892hdPAxMSpqqFLJlmcprwOxG6NsU4WahOMFZriuA1TWQn+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726

Hi Greg,

On Fri, Jul 26, 2024 at 07:32:04PM +0800, Xu Yang wrote:
> i.MX7ULP need properly set System Integration Module(SIM) module to make
> usb wakeup work well. This will add a "nxp,sim" property.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - add else branch suggested by Rob
> ---
>  .../devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> index f4b1ca2fb562..ce665a2779b7 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> @@ -87,6 +87,12 @@ properties:
>      maximum: 119
>      default: 100
>  
> +  nxp,sim:
> +    description:
> +      The system integration module (SIM) provides system control and chip
> +      configuration registers.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>  required:
>    - compatible
>    - reg
> @@ -110,6 +116,17 @@ allOf:
>        required:
>          - fsl,anatop
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: fsl,imx7ulp-usbphy
> +    then:
> +      required:
> +        - nxp,sim
> +    else:
> +      properties:
> +        nxp,sim: false
> +
>  additionalProperties: false
>  
>  examples:


Could you please pick up patch #3? Rest of the patches are mainlined.

Thanks,
Xu Yang

> -- 
> 2.34.1
> 

