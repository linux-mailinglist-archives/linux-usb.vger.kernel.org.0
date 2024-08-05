Return-Path: <linux-usb+bounces-13084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EA947719
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 10:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76EF61C20D38
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 08:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA8614D6ED;
	Mon,  5 Aug 2024 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eLMpfJEC"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B513D26B;
	Mon,  5 Aug 2024 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722846178; cv=fail; b=aBPxcGnXQtTnXsgG5XQAsRm4wNCUVgtWTCf7rZJXa6kouNtDucpsYWLgB4h9rPLhvkR2vEHsRbgu7M8bTirp7Fz2TyUMxa7zUy2oSKycAm03G/D5OHznTVwP7jQjF2At/vXoNBkc37T+a7kA/Dxr26YRXBh9+QGRqJ2RBlGoGaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722846178; c=relaxed/simple;
	bh=hYPYpkv/wztRiwyjhYqbZQQzBGwD7NZ4Q7oltZ3H7is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fXK9hvaeI3JjoG/ISVY6N7NuZdbLTocMWWOTikfLCRf4Zn+vm3YVSIIzpZsTqz1pm9P3HZHcDbjqil+zQL80qbOelJKvTmwpsNC6uNMgeNmwqRrEXPTJa5xCXoZcB8bCIPjqFf3yw35/n9k4M/yohcGURUslrPzJlngR41D9abk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eLMpfJEC; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=do1wD9NBzn5EWyVtG/UCAIXCZt12EFkw5QdXtSNVyvgMwFI881E/QAURumtFrtD/UkWLBRRNNLzdDyacCvmitsUqfknHPh73TPlZQvsckDhFcXm4Ds6Nys4C0ZjlaQnfbFlE1Ihm+p8ABQpgpTkZmDPnHFb36g2889PE/79NIbp7qRUE0tI10Sqwiy2RJzatil1TJk9VyNpYxYgjix+zTYQl9CzUWmgjkx2a2CLXHCOT+NlTQzzh9R0utm33ZfpRwgey68U5LRVgn9x5AMmfLa6VMAMU29Zy0NAOxOfnG0lpMW+GBOxkkPhfX+GfCfGlHi3m5bcLBEjCHYVhNouy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G02YygDFqa+17AW1Rx4N5Cg4v1h9qx5amWsxBx1CurQ=;
 b=BfcFRFn6OloV2jCgxYzhKk2xCkZf6sQL5xQhWgyMaZyWFw15KYkMZO0rESja0tLXm0RHku6DetD27joAmis08Fbsd7mg462+YFTXZgAvgIbclEQA7UASHs/aIWQSN6xLbTuYq2WGt9pTRdByKZyYL6mWZhTITDXO5+qn9o3ZcU2fmnKHYk1dx9QGvIY/RxeR7B8FEB8BGORvkRO8w2iMlv78saoipq8SuUPif8iERECxmbDNZfKWQe40JT0DvueALl2or3RmMzCqD2HxUwWuBV/4MEj9ojupcd1QjqRcQARpVIfG/oodv5+PCGw2gLFo1kAMmV5B8gu2FK+Ruba+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G02YygDFqa+17AW1Rx4N5Cg4v1h9qx5amWsxBx1CurQ=;
 b=eLMpfJEC49+5mN24Wq6OTNOeoHTJ6oMiLa20LNnd44gholBZ4e1/vSWUxLhzor11NpMBPRmjd+2leoJei98RWk2QMbakDZzq/ohqKZibWwWXTAwprYcwhl8tT1ZeglTdDwfKdc7k1GErP13pES82mtLya6JonHR7iy8LncEcoTKN0Fe3XgHAFNnRBuG62dmoiKTcw1xKP5jJK++XpCL30Zydj1v+Y/+n/MjpaW1xLAFAgSfeNT38aB42/cp8axfgypuNOhL8cI0jHTVTyroKx5/583DL7ns2w1bKOjitVx9AVFk+N2l2nR7CVVcrRHQ/7mVSMYJ3+PyfC9LIecUCGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 08:22:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 08:22:51 +0000
Date: Mon, 5 Aug 2024 16:22:11 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: imx8mq-usb: add compatible
 "fsl,imx95-usb-phy"
Message-ID: <20240805082211.ngrokcmzuijnu26d@hippo>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <21557eac-44f0-451d-a194-c5d545cacbee@kernel.org>
 <20240805070429.rqykjd3ap5swd5vl@hippo>
 <0e1b0f11-152e-402c-97ea-788c7830267f@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e1b0f11-152e-402c-97ea-788c7830267f@kernel.org>
X-ClientProxiedBy: SG2PR02CA0081.apcprd02.prod.outlook.com
 (2603:1096:4:90::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f1b02d-a4ea-4db9-443b-08dcb527cc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YsKs5JIek+mmNANsuouRffExJYNKhnrgm+XjCB2ti4iqCVXnQmaRm9gZW3Oy?=
 =?us-ascii?Q?h5v4C/vDRIGSAnOv+U4GSV33MuJITUztjsgCU5ewlP2QA60hiLP6skSFTlC2?=
 =?us-ascii?Q?20bgXfBgArtcwrIFgeNqVWI5UyDIKVJtXiex44ieB8Boa6PUkHpGB2U8Buvn?=
 =?us-ascii?Q?ctYZy2/9YoyiAF7SExAI/abMUv03c5TyFBF35YxCfsbTO+KkN4Fd2k5ylX5O?=
 =?us-ascii?Q?D44a1KmW6aZ+nGgEQQXdqKS8jlhRLtRLVZS7zATH+AWksc9Fw9i5rA2yxDeV?=
 =?us-ascii?Q?/QLBn/3/6pdvTOkrJBJkzJGBHW+MD1RtF5rKX4eCHsN6a+nz1j54IcQ1msUu?=
 =?us-ascii?Q?f9VxfnFbAnDBE5Yo4zgwz6vu3nI9eEIxcmD4sjFBXUUT9r8VcWFuOsDzXad8?=
 =?us-ascii?Q?9EK4szMYNLF20a3OjVKasfxM2gvnILudPplvYMvZl1sgI7ZYOFLOHF1iRumd?=
 =?us-ascii?Q?q8/XORLGUU7iva62mkCJnK+30oBEaGLuCckNxE82uS5vBiRsA76fhu365bpQ?=
 =?us-ascii?Q?OwDtninL5cXaQ/+LlySgZ9C2m3gONdDWjp90tTxsJpNZ447yGQ2kudn+DQZJ?=
 =?us-ascii?Q?ycYBnQFKj4aifUoN+B5fIBVeXP6+8EVBhc50r4CtAOe/TvnqUOtmCBi7cHef?=
 =?us-ascii?Q?vUU3DEHK2UfAMaJxcsH5G5PwDSgOV77AzN/MQ8FiNfEj6aItQJfCMpr+aGPz?=
 =?us-ascii?Q?HYBl+TnOTlUpLL2eEL5ASDKeBbGfiLWu1Nlq7A3G8puoUTAISnm2prV9aEfW?=
 =?us-ascii?Q?xFiMjqoNm2nNzAlRuxVYjoEx9QeHbW4opIKiBQglA42FjPQtgByf6WQ0eqQp?=
 =?us-ascii?Q?QugavargB12c+76hljR/za8m9EzerPiwU5SFwMaSenN7EcvPvpKgHt6IAKTq?=
 =?us-ascii?Q?tgkZWz1PiQiakJ29WtbYkJGRKOMH4BcUhBXWnnmgLS7LHjw+du6kkcgXh9f/?=
 =?us-ascii?Q?CApYmoOnGSMgqcHnc67XIaCyeKju5PYcIeZ/mZdK/BmvalfguYO4DME1fMhs?=
 =?us-ascii?Q?jCeYEngZphxfUoHvGoPXBh0nuzF1k5NauyP04wi1hkNV1lNgHUgEx0Ne7PaJ?=
 =?us-ascii?Q?P7uHTQLSyU2OzOj6Bd7cLFxz9NF4WHrT4okokgV2IeHGBGbHRytiGYFeuSa0?=
 =?us-ascii?Q?AXFb+408Pp9SppZXmcJcI0AGuMGj2CbX2jhdYOVoMs8RuR3JB4SIXRgbqwMc?=
 =?us-ascii?Q?R8qGntT+L6haAzixzmXaPnjVXiuCCr4R+DHii1PQZQYjoUej702V/rYjFyyE?=
 =?us-ascii?Q?iFOM0wAmUDFEa1TftH3IzVd7IWD74VF03OxXpF0Y+VhkDcMXNyg3dD+7zsdv?=
 =?us-ascii?Q?UYkpkBKcMt6s8FFUfnLqADIrSv5lV3jlmOV/fqoQ7S7vQ/DZ2MlwZqJRpAph?=
 =?us-ascii?Q?3UOrL+NOGes2Y8zkD8AuDtNkMld9ci1uz9LZpobDYeYsWyPZSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hYnQL7NseWDQ4bF37Z/9v9VXROlBGanbvVF42gBRE/1kPA/tQZ1YLbYSd7rU?=
 =?us-ascii?Q?kGolfZkcqgClswnf4Abi/uKrpkVnEqH3zd9SKbc+Stqp/SKLv6OR7sjA5Ccx?=
 =?us-ascii?Q?oRcq4NsEnohIMyHDXR6W6Vy+w/4MJr32TB1yxK4EWmlURa6z+gQjfOXTninP?=
 =?us-ascii?Q?URLajNCNCol1lA1izlt0vxCGKVa5jP+9wYpUjeRDsgryTJRTsgmn3C4AHOiw?=
 =?us-ascii?Q?Pss58eqzAiGXtGFs0yj0x6vtJW0HofZkz0clvOBypmZQUyIgqFooDGJePHQ1?=
 =?us-ascii?Q?RzYtN6xXIwduMSthk/CwvB0aFRSs76pTqdNWmuM+JCSWh8kGd3JrNawIkBni?=
 =?us-ascii?Q?Wp9rmfocdL1dNY+ZVxo5q+x4o/Vj9ZZ51h+8BYsmhqpoAKIlGTOQx0O/JOYU?=
 =?us-ascii?Q?Yg9xuSaAysJJkVbb2eanbmCkMnTjj5TSMNoArMU1b3KeROO3WyLXMnoQFxF5?=
 =?us-ascii?Q?u44todrlUI/cZdx4SjAUvygc9DjOTSsng1UZcxNStQqJM6QS/2Pmgf8ZBipw?=
 =?us-ascii?Q?vD9KC1r75tGz4EXJ7aBMdqCJ2NMpe77M16ggCZFvw8SLP/0wFpyD5sKkhYLm?=
 =?us-ascii?Q?9riIR5uWznL4ONdVZpb7TEppZ5w359GNAaDa0Qhly9LZtw/qnkzUSD1m2J1o?=
 =?us-ascii?Q?fwfJCxVAF9PYwjScN/z+q2JyDJDcBlXOsa4ElLZwbZAWCwnXdwgGXXQCf7oL?=
 =?us-ascii?Q?eFIrYAlqSuCFmMj5xiGKHlZRzc5S9FvqvBNOetARPP9ak+8ZPfmiNe1zkjrs?=
 =?us-ascii?Q?WRqRz3XtddPDfc1XfitN97FwFmDnt1GQ7C4i/f2qjGIA5Xm8YwHKW2MzmxkW?=
 =?us-ascii?Q?AVyFIj4a21o2XHQt3kqkS5W6HbPnCs8/E9AyAMcSxSr/NsoWYHREOgKHWbRj?=
 =?us-ascii?Q?oZzxONjI50fJyWrMHlcJASqSbw8qsCqqy5opqyHTwtSDiaA/JyWEIALtBpKn?=
 =?us-ascii?Q?5j/e4OYbyLu8+XDEk2yY5YfS23Gc36MFULFw/JicT4LiW23MJECHn58bX5vM?=
 =?us-ascii?Q?RDQqDqUCJT8uCvixCZGNlkIL9EJQ4snuXIjUaJEDaVbrzE+1PZgTCguHrjrX?=
 =?us-ascii?Q?ySsh46ogxVC46kf2/3Vy8e4WuAbcDYIfTpbqABM5PuVPO8cTkIQbaj0tGx8t?=
 =?us-ascii?Q?iIohQlwfa5BRfdp3nPjR4vtYGhT0RRhBG4BuoiT0zWB3a6/+qdXswc1qM75r?=
 =?us-ascii?Q?mNbzdkLJJV/dlX3A7odbuVJpVQMjq+o7a20NX2vUX4DFK9cVRUp0sgz/IURC?=
 =?us-ascii?Q?3bwIhuA0xTqreoj/Hy1tbMCCekAemtPX84LkfpBqKw8nmzVhmJd9ts0eEtpi?=
 =?us-ascii?Q?kKsIgamNrB7TANW77gBVo708MPeq2V8raHnRWyfNKF8RITR5de5ZYrfz/k/i?=
 =?us-ascii?Q?XW94jpHzvsKnvMtdcthbdjt0kEOjEPOKqE2WA9DtXMcBcgY1yobg0ShZ/J+Y?=
 =?us-ascii?Q?+rcjTaQeIV15Iw7dnSZTNmp6D8Drw9EF9vK8xbTbQK/83CE2J4v0XIb65aQz?=
 =?us-ascii?Q?xPxWxn/DELas9WUCjTOvtE8xkSjNPig2wh3PRQFtQm6G48ByL9rpkhgUt0Ac?=
 =?us-ascii?Q?r/jwOwOuvAG5MyNQtpPhrvquJQU9GEGgkhyRaxcL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f1b02d-a4ea-4db9-443b-08dcb527cc0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 08:22:51.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Sg8Eq7iH85pB1BFpKxs7NuwuRK97STRI6qeBfCoSproAXZ2+7JbVkG9xjVD96ZRjdUg1qzAmPbmBJnZS8MD5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599

On Mon, Aug 05, 2024 at 09:22:18AM +0200, Krzysztof Kozlowski wrote:
> On 05/08/2024 09:04, Xu Yang wrote:
> > On Sun, Aug 04, 2024 at 04:16:34PM +0200, Krzysztof Kozlowski wrote:
> >> On 02/08/2024 11:16, Xu Yang wrote:
> >>> The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
> >>> compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
> >>> to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
> >>> block. Since i.MX95 usb phy is able to switch SS lanes, this will also
> >>> add orientation-switch and port property to the file.
> >>>
> >>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >>> ---
> >>>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 40 +++++++++++++++++--
> >>>  1 file changed, 36 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> >>> index dc3a3f709fea..b0a614a9556d 100644
> >>> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> >>> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> >>> @@ -11,12 +11,17 @@ maintainers:
> >>>  
> >>>  properties:
> >>>    compatible:
> >>> -    enum:
> >>> -      - fsl,imx8mq-usb-phy
> >>> -      - fsl,imx8mp-usb-phy
> >>> +    oneOf:
> >>> +      - enum:
> >>> +          - fsl,imx8mq-usb-phy
> >>> +          - fsl,imx8mp-usb-phy
> >>> +      - items:
> >>> +          - const: fsl,imx95-usb-phy
> >>> +          - const: fsl,imx8mp-usb-phy
> >>>  
> >>>    reg:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>>  
> >>>    "#phy-cells":
> >>>      const: 0
> >>> @@ -28,6 +33,17 @@ properties:
> >>>      items:
> >>>        - const: phy
> >>>  
> >>> +  orientation-switch:
> >>> +    description:
> >>> +      Flag the PHY as possible handler of USB Type-C orientation switching
> >>
> >> No need to duplicate definitions of properties.
> > 
> > I replace it with "orientation-switch: true".
> > 
> >>
> >>> +    type: boolean
> >>> +
> >>> +  port:
> >>> +    $ref: /schemas/graph.yaml#/properties/port
> >>> +    description:
> >>> +      A port node to link the PHY to a TypeC controller for the purpose of
> >>> +      handling orientation switching.
> >>
> >> Same here. You probably miss reference to usb-switch.
> > 
> > How about port? Should I replace it with "port: true" or
> > 
> > "port:"
> > "  $ref: /schemas/usb/usb-switch.yaml#/properties/port"
> 
> You can drop both if you add ref to usb-switch and use
> unevaluatedProperties.

Got it! It's helpful

Thanks,
Xu Yang

> 
> Best regards,
> Krzysztof
> 

