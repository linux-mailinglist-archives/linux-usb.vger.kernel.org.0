Return-Path: <linux-usb+bounces-13863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872AE95B31D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 12:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D227283D30
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 10:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DF9183CCC;
	Thu, 22 Aug 2024 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EppBzzpS"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75314A0B8;
	Thu, 22 Aug 2024 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724323403; cv=fail; b=gxIToOKyIaPeXIk7X+6iH/jle9ub+UQ7sCfjH88PlLClsqsCQTO3DNH5X+dJlXPjqTyzhYMUtc6CEag6F8LQT+WmWvQ+HIiB0VfHwVYD6Gqq1tFi7C1WUzRbSDiC2Ebh0u+LtnzFXm60t9A6ryxBobDgGAHbYdYiUlAvX/hBZOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724323403; c=relaxed/simple;
	bh=2T3ecmVeD9D7CBVvkjGJ0oMoXqqSugTZ3OhW/60X+PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LVh41GX+fRCGkU++C6T+uCmp0etBaU3+tQxGbeCmdEBUSaidJJSZ8AUK+xQ4J2MJgdi5cB0l5YbI9NkrpX9Kpq2LRnr4eEq/KJDfbiUjsBE1NGjuMMRhsQOTKzRHlXKSAUn337HXNDXgZ9tWUrucahiYEbcU5HTPQOUZq87VwPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EppBzzpS; arc=fail smtp.client-ip=52.101.66.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGJFx9i958NYA4ad8OxmA9aUEXVw6QD5CjFpmb5LC38WyJbYGgeDdO2yN7W2gDFGpRNBa5qjXk8Smb9XI65g7W6YGS4vW/o0LQeTwTJcOxOFi28eh6QcOS76qLTjzp95PfSFKj8o8E/OLeBR8eRQCo6bpSJjehxTAzk2eRiQsCWcOiaqYdlryLc+WV/MJ3E+evrvwo+y/MDKiMB+0WBQ7EgZqQcZTt5IRYKw3s8GQbC25EO8jRfqWq8ZYgtHRHBnNDvcWmW4PrkVt80f+r1E/1qU3ks0+hfFrw9xF7m/AfhSRCVlf0aWZtreXIgY2CqshoWqH67ASEY3IH4x19ybkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBytKZ2cnu4FLbaDBxsiXSEE57gLDsHICQpaISLHp1M=;
 b=GbBLKA6/wkLQkI+NQaPau86euvkT5JRoUNjqyY3C32lttmTguMMvS6rRIo236N436Lf5uwzqxmcI7SAdcvyr8RPy6qt+5DGqDrLJ3XN4j7HWDpvXOkc+k2JyfMaxHEaxexOfAeBzqyG0GRSjE9jfz7fCoFUGq3NbXWVSVoaBcfF8ungYq+vASZTx2iKafSEry7XkbHXx0i29n7bb25hJ2id7UFNpbMbuL4HW/YADSuWDyCquKttmW89b4wdPFwvz1LeQMAbYtcfEMwlvAX6i3WQ3yyORpMXUIdAui20HCerddLPCExh6iDpn4viYlRh3mu0PpUJ/0elNpwf0WnD4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBytKZ2cnu4FLbaDBxsiXSEE57gLDsHICQpaISLHp1M=;
 b=EppBzzpSAvlmbh2w3WRuyMkFzp/gFGlfDCnPKpZmFGeh6SPNQ9Rv2jpmBePx6jU7RYth1dY0DtoMLQsLQOS+hr+YmUP03ZH6Dq5NHBstkyPsoC8hstwNTgu5uvnaLCmVK8RN26yGgpsN0O/6u4YCUljTXxy1uYo4FLOgwW2XvimWUcshi2Asg71KAiAiQVNe5jO3BSvMy4PzXRm7xBu6wLfAEAB+5fB2Gb4+1BdAlo//bHQgopfcKiON8AG2AI8E46fo43J03u5SQckQh2tyRjcnanqTlevin4jYtBdpop0YReAwuRBXOO6rfwAP2tLjd1eXb3E48siJ6OcsE3hZ3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7529.eurprd04.prod.outlook.com (2603:10a6:10:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 10:43:17 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 10:43:17 +0000
Date: Thu, 22 Aug 2024 18:42:21 +0800
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
Message-ID: <20240822104221.no4xsxqu3l5mdbtu@hippo>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726113207.3393247-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: AM8P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 8543a776-a33e-413a-4ff9-08dcc2973b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qdgOAvbEl6FVdbNprkkOJi6jjX7YJIaanA0Lg00DG7m0xM0itzLDLvkmapBV?=
 =?us-ascii?Q?i2oZ8S3n9S1/X21VXN7YpAA6aeQ9y+udYzRVA8UQCuCIYhS4PIlsDuvrIXAh?=
 =?us-ascii?Q?+OIcElR5Rh3MgZ+53wq3seoFAKDBhnb38GGh551SUH1vYV4yjNHzGU8BngCs?=
 =?us-ascii?Q?pN/2/MxU3te/EBN/UqA4moPbKeWeY38FFkhrJbUZDUcBLgWmk4xJ3nUW0wJV?=
 =?us-ascii?Q?FodAQUYlySNEELwfOMnQ6zXKB5cRcYaROYbNJ6fVqGJjIPQ0gXuEwoc4WG2B?=
 =?us-ascii?Q?3+iWPVitY4JKd85IORcDDGRfqQwJZGUdGOf8R9+gERRud9rm3iU+5rxqDEzO?=
 =?us-ascii?Q?hkc6U91XLhO69zZC7rlV5NmiKOJ2GoAmyvBIMEBOMO2bLeKAUYlp0w5nnPF0?=
 =?us-ascii?Q?VrAnINdtViBS2a6jCF007xkn8LDfryT51I19B6Ldc5+ryirAjhkchpyEW0cf?=
 =?us-ascii?Q?QGBjQyGzwKkV4RfxLYDwjpfEIqaVWHKNy69JFEu2NShMcueuwryZp0+P94LI?=
 =?us-ascii?Q?2IZVNOx5LFd+rMwel10yF1+rSblWtDNTR4bDxJyqBrUptgVHGjLPHOE7wKSN?=
 =?us-ascii?Q?PquYpouYxycb4DLRO5wYBZUOEUu2Cji65TrKzPyaBwZyIag0AqsmY4Whmqtq?=
 =?us-ascii?Q?t14gejkvWUhKmNrrDglpN/J3ypPB1djST7BluvSObxh1luGbP7hNN7KrMCMb?=
 =?us-ascii?Q?6WFnMQ9OkVxCVOEsTG17Fq/+B9yKWIeIZUtS/t6Ki7yfqwTBKX9zqsq0dtHV?=
 =?us-ascii?Q?aBcbWXn44DNeMILfRosif2cO4ZumJfSbNkoZawt72nQAkAABJL7Svatl/1Wz?=
 =?us-ascii?Q?rFqduXpfLWDKTuE2DHqP4NCMUYTUNkwfKACMDy6tPhz2hYYO7GMQYJtrzh5t?=
 =?us-ascii?Q?MCDokJtHK3tnS2X5th3CuJg76GDFefenVhKcqCZtj7uhYMq44MtGp6IqaE5J?=
 =?us-ascii?Q?wWRGZzycxv8VQvB40hUOO6W7j5uUArD+PYSTxBHXjowGuTioQ1CfJSyIwHep?=
 =?us-ascii?Q?XrMNMaxhHERQUpTlNXgl4cdIJYyw5HHCsMNNStLSWVw1hsUakij9/CFWcedZ?=
 =?us-ascii?Q?8rECZ5XM+sASYourqLeGbCB4Wv2JUdWjd6R3JfP9HvLUCLHZA0ePtQXdu97Q?=
 =?us-ascii?Q?gb5FRyf8TcAfrncT3oZMzCsMOQnjUa0jUexH3v1j5XIlxBo/3iFQ4njRKC/n?=
 =?us-ascii?Q?WmkwwMrw7nbkDdgHl3HrcKsCifX/E/XrZu0fCmx/Hodx26FjQoD5Wq+4rCyn?=
 =?us-ascii?Q?gQGKJmBf+ckt+P52138xybBRD2uU/jN0e+iQEpIICYYBXhwDVPAiIwgwHp5w?=
 =?us-ascii?Q?ExsXaP97WmM15XnooEF2jLgNxWA4H1Mz8kA4l6hV/vIlEVImkI9njMrl5ANx?=
 =?us-ascii?Q?u8+O/0GX9eJ7CAYaiGP/ZaK/ExXjd9IYOG805JMyfOC+tjQwf2PBOplg9jy2?=
 =?us-ascii?Q?P28/Noxw0sM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?58de3Vh4AjxtBy0EHeFueCkt7B1VS6ERKNy6VX7GklIp6yFzm4wjv3GihiKw?=
 =?us-ascii?Q?JRV6XeoSpMoCkV558KhRmNeRSSmzolkurdzLQcDdjMEs4wuXvTFtznvxoBcj?=
 =?us-ascii?Q?r9XSSzHRrfAI6ldAwxbTXuJblbtDP5xmgGMwMtpPRefKjsoU3bD4gtMhE0zD?=
 =?us-ascii?Q?OS+9Ec88igQHUoPwXoNU4exkcX6/kiKwgmirsEDrO+J60s6gk0162gokPAzS?=
 =?us-ascii?Q?rwA8mrVyxbbNXn32+rn0SkfIhUMJR2gmWWYXA6TTGHSDk0esdj6MrXXqm843?=
 =?us-ascii?Q?zbPJD9em3Aul+XwVI4KXXBmnKXMHOJd6RKN+CtkhCezX8mJ/cxqbAUKUMTzx?=
 =?us-ascii?Q?uGEaloU8p29ehBeTPVlBBxNnpVUV00Khw99k+JwEq7dII0bfSalGyC9TYwyT?=
 =?us-ascii?Q?+f8NZh9eejTvJN6bQg0K1Can7yf0uDgpFpxXj/Jh5MODSqJE23xOLLHYowVo?=
 =?us-ascii?Q?Bi/O+NgBNfTZkwmeBEx0ePKqY/mYO6ldcseA0iijRz2Z5548ciJMmKa1Wn5B?=
 =?us-ascii?Q?stBPtBnal/WNJfwXY3J3TKJvW9rOpk8PkOdKbEImAOb/ewJOPlxnslX30g7G?=
 =?us-ascii?Q?dx7Gilr3Hox/39B5NXsqI8TyrvsqpTRzpvGcglduYnmrCRdzZ4IUZJKNCFX8?=
 =?us-ascii?Q?eDFZsYTHbNdrsQTthro+pxRhdIbNFlaKNw6d1zbZBX2MK2yROHw3YIM9V7Yw?=
 =?us-ascii?Q?4Z+pzI+cMf8/3jirlyKSPYzc4RMWzmqdhM8+ye1dedw/gUMIZm0RRsGBsuHT?=
 =?us-ascii?Q?6Unea6sIXUjayy8T/OX11SJt6c60r77w9IfWz3lf1580WrnWc6HSz+/4hrZN?=
 =?us-ascii?Q?Ko0dY8brbvXxOyDuOoUaXdB34sb9k+AkJzpdlUcZKBoqALJFZs3VxkIrvRvj?=
 =?us-ascii?Q?X1H0uvRvdA2QhTdSP9WPJVkGLxjXkLC0Ik1MI+l0Y/VqO9FtB9GxhHd8w3Hs?=
 =?us-ascii?Q?ozSGFqmUEjuRgS1Bu7uIJch2KRI7riMrhqNJTLo0AFFt+0Q4HHFLCtS/ZOfR?=
 =?us-ascii?Q?HnCB+LRPKl0uMXuS/7oBwrmY4mIcPFwwBN/cvydZcMgjLMYBm7gZZ+5iaND1?=
 =?us-ascii?Q?qxl0hXYi6gU64WwZtF52I53An/AM9QsJEmUKpb5eEppLuQMjwWXBPTZAj0Nt?=
 =?us-ascii?Q?/Z/+196ZrnPyk4i+3bZHHFyDeMOaNY/aUYngaU/44VXg0aOge1tdfZccU+TJ?=
 =?us-ascii?Q?s4Q9GU6vInOO+H0at5O6WGUmyx49uO79sJ+5w6YIyQJaR4ewgqtUrhMx7NmQ?=
 =?us-ascii?Q?yUSGWc29+cf89d7TNAA7KV+b1UNqBfTtO8ZJA0+wPbxzbPZRVLFW2ZsYgVYa?=
 =?us-ascii?Q?NNWpGJZWnnkF/bTuAGF++8xd0UZcGJkE0hnIitCqM4JsCyMYm3wdgGwronF4?=
 =?us-ascii?Q?YE5Aqq+dwoQEvl+asmPlwAjjfHIANdJ/rQhz22WF2WzT/MLMpainECUEGwRo?=
 =?us-ascii?Q?tiWW2QfScQd3gd0rRgBJuk8UEM2JOnts0fVCBFblSgivE1YnxMdpT0Hob6aW?=
 =?us-ascii?Q?LBDL5cHWo8n31ljrdAPoVMNfyekYSrxOBLPj36Oi642j4qb7eehb8+lHpjW+?=
 =?us-ascii?Q?iafNgKsXbQNwiUIQsra0FtDP0ynIazFvj2QzJwwo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8543a776-a33e-413a-4ff9-08dcc2973b49
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 10:43:17.1713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05iYFd8EwvBqrkXy6hsIQYcgIi7lUQxvG2X0xk8CiWOqPe5BID2fA2ZO5yIenykKdNX+UhqkNc9e3maqOiC2aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7529

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

A gentle ping.

If it's fine, please add tag for this binding patch. The rest of the
patches (expect dts) are already merged to mainline.

Thanks,
Xu Yang


> -- 
> 2.34.1
> 

