Return-Path: <linux-usb+bounces-13179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4889949F82
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 07:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 123BFB2206B
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 05:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD3F198E7E;
	Wed,  7 Aug 2024 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cqFjnrV/"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679B191F83;
	Wed,  7 Aug 2024 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723010273; cv=fail; b=APmBhthEDSb3RlOfpj5nNBcGRJrxG7B+2GCMuNRhv7xTaYdhurG6JAAohU4g9y0s3gFhBJ8Cjz4f5u8AyfrkprZ9aLwW9BY9pmYZ2wJfmzirZXPjZbq7dIqch91RLLrbM5AMVLbtkKtArakQ/phLQAROLa2DDQ7y5WQ4nUK+R2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723010273; c=relaxed/simple;
	bh=e58YL5pAqjjj3wslBv5GUTwa/gBl0eafuupPUPzB0Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ugtl6tcDbU6v8DJeDEUAsxCwsFml5XkyFQUKZDeDVtwwj/9Xj/8XH5QB4kXlGJ+CLhewtbxFLnVEb9MNBpu/Gg/XOKrQDovmqDj1HEdDThdZ+j+in5lNKzj8RPVeztzxPjBQ4yNqJQ4oQV7MkynuwolEG27L7O+pu1bPGzczYFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cqFjnrV/; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miEdg55+l76eKD3RTnDBHC2/vhzSSjSpZrD8vhMdP9aKk3ZpKqWfuqIaAUmGieXgO/zDiCzGvRrfcFvWSFVAbkU3DFGVYiadev01LKK05FS7rlYa9ioiBFm7FBfUXL2soBiNFNSZkZ1wmCTGQMCMu2rpG9VIQVcXnBi4gEO20hWEYLQEJEPkfjwdhA3zV+MuR+Qduir0bR5enXm/k16cueYDYxsOyBkVT5IBShDGFW6ZAJANWYto/XdgsYfqZdePyYQyhZYOjzwYUmV8KTQCJf8cQDhc116vy9gmVRlZsGPxEF2WP5gD63uuPfEuaBRqpUpdbAD4zZL3AVhHM1UARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMRB4OuNU34OxWMaeaZLFCv0lcsETNZZ4qBjQMarex0=;
 b=a9+IVTHmp1PQNpdsW9zfIiEHuwaIDBiuUuAKicL8dw4M+mpbR92Is0irdgP9OATjlflShh5F+AqnfdaCTAZ+6vVJRavdoe/Cdgz8bde7H4U0IyxwH7nbg+/el4DeClGHwJspsfHBO39ATNQTD0ciHdhCBd4R2rwvzyQ75x1MHmqb1QCtjY/FsyKDDPqdjasuhrUIleh+LKG5g22xrqbcZ0NhufY6+qt6m+klMa1/LwWg2RM8/bYCE1LNs6cZMZ5u82ScGY1Q096y3Zl7lQuRCpnqrF4sN2yUVu3jGV0VsppP9Cgriw+EcJlm8Zm4CmaBpCli3wsSP30nBinSjmGUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMRB4OuNU34OxWMaeaZLFCv0lcsETNZZ4qBjQMarex0=;
 b=cqFjnrV/iAsBeqL2JZcV0lvrlp+lIEJbLsYdwrwQ/HN3GdgqTRbpg3Ttux+ZHGcJFBIdcB3MGSyc3Jw6OmTxWnaiPbHoFzgnQJ+fJSA8v1a6nrO7PatLsIVo5u91AdJhkxEjB3jB3Or324PRYnHJmCOw4o0Kr213mKGS8YMYX8XcUVpP0RPvRnvAuV3KoYZ3eBLxicFcKXgGan8x41YTzzuUuCvRoi6AVauttm+sNuXSBOpkx9TnKVUDfDZSkyzc5NkLvhKV6jsuO+MJFGkhExt7PqcKqtLdX06zoAm6upv8+9Nm+6v4W6BL4LbpJbFAJDcm/L2nnGYue1+/1FpvsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7364.eurprd04.prod.outlook.com (2603:10a6:20b:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.12; Wed, 7 Aug
 2024 05:57:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 05:57:48 +0000
Date: Wed, 7 Aug 2024 13:57:01 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: imx8mq-usb: add compatible
 "fsl,imx95-usb-phy"
Message-ID: <20240807055701.o7fo43efvv3jxlhv@hippo>
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
 <160dd5fc-83ba-4311-a173-44521342a3d8@kernel.org>
 <ZrJLS37GFmvkQpml@lizhi-Precision-Tower-5810>
 <bfe6430c-a022-4e8f-ab7f-8d8e8cb10fca@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfe6430c-a022-4e8f-ab7f-8d8e8cb10fca@kernel.org>
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 74edc89f-aa1b-42e3-494a-08dcb6a5dce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H38ipgLvWLGgcuonI0x6BvEsOzZ2+D8iwprCs83/JD1fRhCho/u62s4F7lYN?=
 =?us-ascii?Q?k29VNWJB1ocTO/Cc0SdBzGVqeHWQ7Fv2IlA/m27qu33F2lHiJBAl2/cZ/gqU?=
 =?us-ascii?Q?HbSx7SMKhF64KCM633yemQWske52yCs7JXxFPvCdX+PnKmxe0wTW0gws86M7?=
 =?us-ascii?Q?mPqPWUwWo+ul8KvrhlWvK9+JzMbv1AmX6uTM0tAL6apQW3z9W4PwPYMObaZR?=
 =?us-ascii?Q?w8bf7I+m9MHEDbkYfrETZBZlwwohOOr8FyRMc0QunsNyQCkPqOQVOL0UY2TT?=
 =?us-ascii?Q?CDfSTMOftUn3GZOAdoRVYnA8yiWDHg0CfhLjRwx1qSsIaJKVdmRAIQ7DeC7O?=
 =?us-ascii?Q?WeptrcIpO8t65YMvwaFtKteLCkwGlvR72009vdIzu5bJMwOD048Cf1MCs0vd?=
 =?us-ascii?Q?D+642IsnE18D5oDpqAS1wrd1Gv/xFNXsUJNPnkKxmrX0onFIhUi8pcEyzBM1?=
 =?us-ascii?Q?Eb5FId1temNoCENcANjSzsSGqgfBMhFFqg9EV9H0wOQvSAborcClr304+FWI?=
 =?us-ascii?Q?Rh5rqit9le15Tuis17+kwReJRupsRL1YoBipNQ0ch8vIOFPrc7NYrCoSC49B?=
 =?us-ascii?Q?z4FY9k7nPJ6Smx7gE2bnZBzo4rUgxKX1inWTvjbZJqhZdjPKlyob7Dc/Lumm?=
 =?us-ascii?Q?cGQbYTdbwJ7YfNaBeBEXOqmG0n6mFjuBmpEsQ/UQg0Kd/yQI6amR5m3RXcli?=
 =?us-ascii?Q?za43nQWlC0BXBil0LxFCtLTUunfgXc3GzHaLoqu5LTeO9NWN2q3Xpu9hXfke?=
 =?us-ascii?Q?UbjZ9xlD1/sZMo2/KlqLHWBX56IYBBnjPN20qktog0MxiESBZlf88mJgJgOg?=
 =?us-ascii?Q?X+jvjSqyvKDlbdRR8pkPH1rTFgol+D0jF29WDm1Obsaz4o6NRCgZ7AZsVn94?=
 =?us-ascii?Q?Nx5sYd9c40f0VIaCQIzMev+aJNX89jEgGm+iAvjYuJeiVbZuubvWVzWOQxDf?=
 =?us-ascii?Q?TwV1vWAEnYL/YpUjUk254XX68XkqZfqkPSej9vNmOtgHwofCQXmVnWPN3Guy?=
 =?us-ascii?Q?ojVGoRfSFSa5mXvjGMD1XSQrFX0EWF3/ftVDX6cqcOVTHx4UnNPfWLMihmv8?=
 =?us-ascii?Q?PeNQIvJcp3pUm7W/j1XteWw6UHX4/kOzRIJygFzSKqtRNskMYOOFMA7b4sJQ?=
 =?us-ascii?Q?p8UCos804X2P8aeq57F3WzKR6gjF+OURYFex0dbzii/gHzQcfvmnjjqagv0v?=
 =?us-ascii?Q?QkGznGzM1XnpXFoODULLm107f6GVcGpNuQnKHM748BH8P2DshjpOn1PpLWhu?=
 =?us-ascii?Q?KXI4dg0JzbGRd16JY8I54UJuDCSUNK5zFxxPFvg42hL5xKTipuG7IgjH+CV5?=
 =?us-ascii?Q?miOQJCziXhPhDNE9aDbzdBkVNSEhkj+8ZSuxHmoEsZGCB1E0ZtIqhTEkWpCM?=
 =?us-ascii?Q?5myLeDCUXKW8SiBMdU48ECqFSjlu3j/Nz/0jIBssrgoiiqsNUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M6yrB0QbKBborhvkZQjEshiMRcR2OYBLeRst+6sISaXs2t7rk2n3vnMAbN8o?=
 =?us-ascii?Q?BV20JMB/tmFnDPBnqsHqKRvq5DkmbDbmvEsFKxDJN3A+O4Ku+ZXas2G9FFNG?=
 =?us-ascii?Q?GnjtP17o30RMzLtJqJvJsreBz4o6q2ERFbUqGWG8NU767N+BL4ukSNlhX3w2?=
 =?us-ascii?Q?49iB5cVwOg4pWIa80WVZUb1vVEsxWylLehgTkA2IeiySFyJqzL7JGTshHnmG?=
 =?us-ascii?Q?LnGXobHwAoUsaWBsUjGz73y7Kn62jVYWX02TBEDxE9zfX7vjPCcCrg7VtM9d?=
 =?us-ascii?Q?Gk7LwHA2uMbllxYwHBu7IsSopTauOhckcPKy9ZqOfmqLvd7H0y3lT814tCzW?=
 =?us-ascii?Q?Se2ZY3IzlaWXd2HOdoE0bKJ9N/z5V/HAK88JTFfroHPpH8+2YFelAXvZuMsX?=
 =?us-ascii?Q?+WV07jcIQlGV2kJyG+SVzA3Zku4qbuyH8jDclZDk+NZJy8KdywZGGZA+gf0w?=
 =?us-ascii?Q?7/UQyaj9UVy47n59KCFXwLetjYOTHbF2/p5hsBRsXaiPrtKMm/fMQ6smxYnX?=
 =?us-ascii?Q?Iv23FAyFpglMLnnNNCKVRa0U460lUyj2IzEeZ2XTeGWoX9BajtQXrOuGLXMJ?=
 =?us-ascii?Q?SJHze2pJ7/yUbApQ0HubfCJvKc4bn2aKlXcwqwYlKk2q0gm8T+LOpxoIsFTH?=
 =?us-ascii?Q?pmfLEtzi4/9qJH0qHbUAe2QhbdO6Bysx+UjGcnKY/9H0pyCyvjF42TCPgdqQ?=
 =?us-ascii?Q?CUQnxivFYlj56/TRNBFvwpzGSIA/lZaF+DpDCESU7IVrk3WJgnR/d6O+2hQX?=
 =?us-ascii?Q?bbgLThrOwQpaO3hVhAixmo0N/Oq3lIBqoktDlhZtI8anFerNxK83egIwQX//?=
 =?us-ascii?Q?kyc7qNSz8iMadkyAKiDUp2TYdP/Qq/1gXD2wiE2wmB4WM50TGEAnIN2Tqxqd?=
 =?us-ascii?Q?mKWYCvfQnkHByuXrBQlwkpvXhS0B9wYO1HTO8CY67X9PDQGg3303h35Tcg8U?=
 =?us-ascii?Q?nE7NPEUBiSuRiYqx4j6LQobcMJXvRxaesJSa7TxfvxgujbTynHQamYDECQwH?=
 =?us-ascii?Q?l2W0JWUcMnqLgqjioKtswwdK/TA/S1GqxVy956sFKQ7GCFStL8HqPa38LYOM?=
 =?us-ascii?Q?3CXbI20UDDn45PcD4wAj2JT+eLUnslplQLRLKnvs1zOSQ3CVh6fYn+BPFKMW?=
 =?us-ascii?Q?SqZVDwae1t/fZdTGCjf6ZQitLCQWespvZhwLcvUOOOVzfbu5Icgf/3Vgx+6C?=
 =?us-ascii?Q?fhETI2QxFnauEbh4S7jfNIwhjrF7jcEZXS9ouPGykum6pRGPPHGq1jJqHuLL?=
 =?us-ascii?Q?JGHFeDMFsiuPrRPjvlRhAriqtVecRNYvw6MYwfDduqoxHSfZS+xabHvvsv7N?=
 =?us-ascii?Q?JtSU4lg3vtBFuvzFPwmk0Br+T5eWYwiTBFpWOwWqQrnyQY7T+Feu4VtQ/5kI?=
 =?us-ascii?Q?BkyEhc9J91oy1dnux02kXnPstNwCWscduKF/XlZAgxXX7q5us/zbD3Zt8MkA?=
 =?us-ascii?Q?rh3vYRotm0S8mE2/SR9kfv/o6Ks6xyiyrItDWXqvjv0zOYu9W7fcd8mi/gpj?=
 =?us-ascii?Q?7l0mV2kVwrsUNYjapHn3R5EYTjj0XJp9p56FMNl9lMjh2LMILbFczNDOkc/e?=
 =?us-ascii?Q?1avdBRrEabv89zkHS+PlK228WqPRfwHDVGFynA+D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74edc89f-aa1b-42e3-494a-08dcb6a5dce7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:57:47.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0eZTjsq+IfAP+gStaVm1esKFC3cPlwdGoegZStrxBX/0ZoOM8lwH7swf6UlQyjmqxa+/TA9E3IO4Q3wdcfkbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7364

On Wed, Aug 07, 2024 at 07:48:43AM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2024 18:11, Frank Li wrote:
> > On Tue, Aug 06, 2024 at 10:29:47AM +0200, Krzysztof Kozlowski wrote:
> >> On 06/08/2024 07:06, Xu Yang wrote:
> >>> The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
> >>> compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
> >>> to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
> >>> block. Since i.MX95 usb phy is able to switch SS lanes, this will also
> >>> add orientation-switch and port property to the file.
> >>>
> >>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >>>
> >>> ---
> >>> Changes in v2:
> >>>  - replace minItems with description in reg property
> >>>  - remove orientation-switch and port
> >>>  - refer to usb-switch.yaml
> >>>  - use unevaluatedProperties
> >>> ---
> >>>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 42 ++++++++++++++++---
> >>>  1 file changed, 37 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> >>> index dc3a3f709fea..6d6d211883ae 100644
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
> >>> @@ -89,7 +94,34 @@ required:
> >>>    - clocks
> >>>    - clock-names
> >>>
> >>> -additionalProperties: false
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - fsl,imx95-usb-phy
> >>> +    then:
> >>> +      properties:
> >>> +        reg:
> >>> +          items:
> >>> +            - description: USB PHY Control range
> >>> +            - description: USB PHY TCA Block range
> >>> +    else:
> >>> +      properties:
> >>> +        reg:
> >>> +          maxItems: 1
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - fsl,imx95-usb-phy
> >>> +    then:
> >>> +      $ref: /schemas/usb/usb-switch.yaml#
> >>
> >> ref should be rather in top-level. You can always disallow certain
> >> properties for devices, if they are really not applicable.
> > 
> > There are some "required" in usb-switch.yaml,
> > 
> > oneOf:
> >   - required:
> >       - port
> >   - required:
> >       - ports
> > 
> > If put on the top, it may cause DTB check warning for other compatible
> > strings, which have not support usb-switch.
> 
> Hm, indeed, that's unusual case to have such different devices in one
> schema. Did you test that above $ref in if: actually works?

Yes, it works and this yaml pass dt_binding_check and dtbs_check. 

Thanks,
Xu Yang

> 
> Best regards,
> Krzysztof
> 

