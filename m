Return-Path: <linux-usb+bounces-32286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58619D19FF6
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC85D30587A6
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3283393DE0;
	Tue, 13 Jan 2026 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JjIfxcgc"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D8B3939C2;
	Tue, 13 Jan 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319090; cv=fail; b=luENfGAN0miOhOff5L1b+PxQ7IPdb+aTzEYE5gdN7PeyuhXNxLyWaZtqWHXVRkDyYU6cQh9xD0VzS/mmOrRY+Uj8UiRWTetL7V03V2hM9dbXXexQjErkop1NUUTruNlrJW9u+YHWMDPYXa5qEpzfKqGRA98sEheXUa5kbdZ2sEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319090; c=relaxed/simple;
	bh=zMTNhq6oWtrV4oSvabfLhB/FSDNSNNZ37qDaB8IqEM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HakLEt1Tx2SK7lD5oW2qJDuhsMlyf6+eHMsdAH4r50YyjCknc1aoZUk9rwyboU1M5ite3vqI3sW6jVbFiQsOrTu+6sdPWfb48QDCaKptpd/z6qFcyCStgh7ESoQSwEVyw6Q2OH+avK6QfRyMOWCYNPxWFi7ZtowOEQynQBxWhWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JjIfxcgc; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pllKtafrWTjXTRM16p80aT6oRR0B42jVqcAvk8N1QidGXBxSUkhUeVFzyWem9gNwBPAnTgDzkZXk3FsFLr4CPl7Sns4PDh9pcjt1YlP5GedPaxLkoa7k0FYgN5MxqVO1veh+lxdb66WDP6CQDEnhSdjkomv5kPgDr/r1NhDywwPgut10rnIcCLYDj7utC00YDsJ3dJsFmv9s/0DqPW02uIF/lmw136TlLarmD5PiKcs+C3ZVyq/cGfkSfzirItPMDomFTxCNZ+XF6hX4V1/IOQHLP4INs4r3PbVw3PFbkI8A+GzGQ337q+rjcVwMIOwHPTU6gxEPmWwyFHWIigaOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkFJjUO5N0cF3qPzqnHbRgFX5+g0RSTsjGwsVVAC++I=;
 b=rwYAr0UzcNkBYiK2b6lv5eoG+wYdKvITNL8CG7q6Z9UZ2DJ0huFOSzm+3yveOzvRnu1auCThHWeORWH+w3FXx30slhw2WMTFRbLhZvzgP5CCxALIhHKE06ehXQhapm820AGVYZYF/1jU3jAcYlJfnjm6wSlm2UIqyVtYIV8m+G5RoGIcQGee9icZILLUdW8mpYNAmFRrd4XotYo8S8tQVUNpsMm3M4u95EVyfoiTfoa7o8OBSv4IWC9WZQF8fXk1r79aT4G7gD9ZpU4mSrPYbaaBfFjtTbdROk7qxLGZQIBhddPwqHzqkK0NGNIITQDei8SBXoRxzV53wCGiynbM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkFJjUO5N0cF3qPzqnHbRgFX5+g0RSTsjGwsVVAC++I=;
 b=JjIfxcgc92dmW1910WXrU9qzFoVUA/yvXF/OwH23aaUYXNQrHfeNZbmFzBZKeKM2LqSv8C7dje8qzC7pQMzRDFpV/LCvNL1/ledEgr4OqTz1HeJZSHxWKW2MYPNVQuYUk1EPLu1wxrdV5IDw7u1WHTOjhw+Ql/JJwP7gRwfkR/YVLv1ZtNpChrM4oqL1+wtPSicjUHMbfdbUR1XJv/Y9grR6cN/sMt4IBcUEAKybwXlOIYonLouch/faMWS7cvmIf4xobEkd5TSeL4z/mXFdOFmepa/knLUSIPxHIORwi5gMlYq0Y/FDLFGoqG3rlffaC6RXNwlY4g8AF7evMH6Rww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 15:44:45 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Tue, 13 Jan 2026
 15:44:45 +0000
Date: Tue, 13 Jan 2026 10:44:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>, jun.li@nxp.com,
	imx@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: gadget: uvc: retry vb2_reqbufs() with
 vb_vmalloc_memops if use_sg fail
Message-ID: <aWZoZQ6z24zx9To7@lizhi-Precision-Tower-5810>
References: <20260113-uvc-gadget-fix-patch-v2-0-62950ef5bcb5@nxp.com>
 <20260113-uvc-gadget-fix-patch-v2-4-62950ef5bcb5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-uvc-gadget-fix-patch-v2-4-62950ef5bcb5@nxp.com>
X-ClientProxiedBy: PH7P220CA0140.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::17) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc55bdc-1b21-4e4c-1826-08de52baace3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mIIN3w7cao6XEtFZ+TqOrbL0KoQsiDjKsqRgOh3Dd7hFlXKazM4xo87UI6mL?=
 =?us-ascii?Q?Ze9U0kX9mFsbdQ+YNvtMzhXBcKrCs4Xxt3lt3KdV+7JE69IZyd+Rw4CnfWt/?=
 =?us-ascii?Q?fjckle0dj3IaBy2WJjcoBfix4x0/p83KIMtNNa67k2YgoVbL0HQ5s7U6hicx?=
 =?us-ascii?Q?2J63r/JhDHXB/GRHlnIyiWxlEGl8e5Hwr/YCtWryIcZSFNNJ1KzDKzqf5/jw?=
 =?us-ascii?Q?3YNFPAskwMDUNHARXNfQxlHuv603CjPSFjCZLQ+y4RVqF9iQsS+PtufkYVOS?=
 =?us-ascii?Q?cOcvrb1CfF6/hrxtITbUygWGm8KKLCCSnG6d2McuyGKHIZJrEokCRoQNc5zN?=
 =?us-ascii?Q?b7coIpIoKkVUSNtcV77Vpl/rJCNt/9Jj8x4NODcDFDIqoDy9EkPox9ESn7Xr?=
 =?us-ascii?Q?pM0oL4xGrsddfrKPqjmRKwpPcbFcPy5A7jerud4Srh79lgDaTHM5Z6kbCpIl?=
 =?us-ascii?Q?g45RkmFdYbUe2Nlw2GVIF9tOX1DVdwDMlpa9q/jsiJLItX5luE4s9tSWrvvY?=
 =?us-ascii?Q?kvaF03G+Zh7FF+gyCTk9cd2tCTSz6Z4NTPcdea8Qqa2EOgHHWAlZ27z5V0zJ?=
 =?us-ascii?Q?WHPMhrJfUW/ineRdWmzAYyO5wyk2AEW/Ft2EKA4ByIbgaz9qVJXQVkOahKdf?=
 =?us-ascii?Q?sD+EmAG/VtJ7vIpWDn8yzsxbchC0TcMz84mdcIyIcMLPqQPkOj2NPw2MjRD4?=
 =?us-ascii?Q?VPqRatKWbKqSWfHOIkiMp5kggFsKjS8yCws6nJoPUTWx7v4VHGqbXBqytkv1?=
 =?us-ascii?Q?d1vlXeCVTpo2F5VoEb5AqmIkicEub1ZAViQnpsBJrG+NLTQOsCX9AUTxqIzq?=
 =?us-ascii?Q?a1U/Q08omd6tCMQbpV+8mMISKUVdpRTXsszxTt69lIVopjAsPBaDTwUE4uLA?=
 =?us-ascii?Q?O8NYFfTJF8aoXXwQ50eM3lsdM6WrAHDgPg6A+JHlY6wP8Nwhd/n8voTO1O2T?=
 =?us-ascii?Q?meJlyWyLiHxrmkH4evJvwZkKWTSsSV6WQd20Kzna/H+YXkC8kephRdMRaKZw?=
 =?us-ascii?Q?Wxb9hLRCTmeL4AStoKjyNfU2cq2QIsZH2SOG5r1w+vgU8kek9ZJMCMNTJ3L3?=
 =?us-ascii?Q?sGpicQwaPIn2viTkcD6BNABO13LlB5YtnDzq/iQi4FzuG90WUE7TnHwoKLrk?=
 =?us-ascii?Q?0Iw1iKtKHC6tW40Fav2BRS2tQ7x6FKcdqtjTq49pt9w/r1g6DPPx1vmK5WyL?=
 =?us-ascii?Q?9B+YOBZuMfDF7FbWT7Egjvg4v+Jj4pAP2C7FmHJkb3zdelrL8DeSyGol9p09?=
 =?us-ascii?Q?y5TYgVhhWybblcLnrvYTBNjhaCPe3sfw5NJNDUzwhIvLqoHdgfRdNaQi3CIi?=
 =?us-ascii?Q?iJIcWnHbFdCIMVv44PUfti6ZA27yi74/UYx4ScC4roR9sMDfKxffRFPkrizv?=
 =?us-ascii?Q?fx3/CbPiJMeqe9le5lodPDI8cnohCBFHMmhdacusG75wWo+pNgWULeURyepW?=
 =?us-ascii?Q?96j6L2aS1rL5rfzbZ7GlHK0bfAcGHbMIoRFTuIt6I0j2l9CijzfPYmsXFt2R?=
 =?us-ascii?Q?znlQq4a3naTM4UmtdKs2eIgm+A5R22egV4Rd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6WrDGZZNLFLLMtmtKAmmLiVmiNJBnvTcrDTgyu2HhvlgYXlILDDnLegL65Sw?=
 =?us-ascii?Q?Q2lqI3tdqbqU4t0AGSD025RA9KB2GHsw0M86uBwiO1VIkK4Ma47onB4t62AT?=
 =?us-ascii?Q?7J3623axdLC9RvzkXZcgVqS0A8kIcMxF3vFoF+jPT19aYActo41ANNNJpD6v?=
 =?us-ascii?Q?7mupEPmQVmp8kK1If2lRP7WtnFICHhQxAc41OhOSAKB2SGGQr7GM43zMUy9k?=
 =?us-ascii?Q?5rUDlafhtUN27iu95uTk7DXtzcvgAXDVOAqByxFRDOh1MPSURCtSYzG9abFu?=
 =?us-ascii?Q?AhSjYf3W3QguyeZtf9en05bf9aI1X6g1Du8laPA6NU8H1D6CiuzTPawCHOLM?=
 =?us-ascii?Q?PgUtfmjyKNXZDxoijFQXmG+GNj3yHQJeNnyXfbiRVCoWjViBk7Z5pHzqXh2G?=
 =?us-ascii?Q?iKeNF2aQjKuDHKMuglnXrAKf7KWAKGG4DRvmO5srnGeeaAOE4AkEVPbHnAxF?=
 =?us-ascii?Q?JQAJRkojNLDR8kN+pcPWdxPFE0BLErEBlSKsmKp+rXpkfnMF/+WUYkUMtrPf?=
 =?us-ascii?Q?sRHzHJoYQ4rPXx3P0Es1KvbOSRk/NKB3VfYz0xscesnird7kbwFTWKuBa4L2?=
 =?us-ascii?Q?RfA/SnTFuN1yg86MLRwDy6kynfp/Vh838RH7ksDOUZuN8mLQILG0pUNH/CoV?=
 =?us-ascii?Q?Ed2H6ayMxWlK8WqVH+Ke/HAJ4bYFQEKYfu52jgt7r3mpR7RdYGQuZhqhLaJw?=
 =?us-ascii?Q?2hIG+T/j2IWIbdpA8UJ4BuNJwnVy12yjZhQodxJxTdn3EBfiFd/3Cju/X+Sx?=
 =?us-ascii?Q?Wj3ne5vG+owny2T6wVm7zam8MffC8wgxqz2tAFXYvZX4v+MvaC2oSv1tGH3Q?=
 =?us-ascii?Q?hTQHjtYISp7SEMSPa+ba0M2ZgQB4LrErBe4d6hQW97rKZgg/MDNfHRpvx0D6?=
 =?us-ascii?Q?HpOBERb/EmX1nmIK3LbC73bmRsRKTObpUkeYKHz6TPlTNxSU3tGm3QQQYB1/?=
 =?us-ascii?Q?LOIeZ98jU6Cz+FUlw9/VXm+cMJpXwHEn6zEHQYGUjjUGo52WNeXj/maacPkL?=
 =?us-ascii?Q?G/X8X4Kl/rEwH6S3ejqcP9wVkzBClJtPEhPfTMfVqxtbRHJ599K8/RFwsEu3?=
 =?us-ascii?Q?XvqoJ96f+CWDG6LUP1tvgtarE7MsmFOQ7h5xko1tviYpa4BBUkhzyRX88f81?=
 =?us-ascii?Q?Yf2avML4ygljKl+iUHb75vA89tUmCzyoPz1LnLUOGDW7n7lAySY5oOslSKp6?=
 =?us-ascii?Q?8kMEwFW8JGXSY3Fq0fIzSZnd2FJNBRdzs7FY/6I/tSR7ruB76WLo+3IAUgWb?=
 =?us-ascii?Q?d7/PmyU44VYFlO6VmANof3WVjMAvwAQ3esPdoXJinCJpxhnNRw/N1zyTh7nd?=
 =?us-ascii?Q?D5Mfzlhq49Qgcsg8g0QQ62rX7PfpO6ehXNq2STbqpRUsxkr969sCYOfCxORz?=
 =?us-ascii?Q?7uxLcwv6UxBOug40sfOQF6c2G7AwSudXoisMPDsQ9qqXLkRb9hO8a5EXVyli?=
 =?us-ascii?Q?QHHhsKujFWmmzFC2phmFQGS7l9Xl/bsxoLEcAgdJPtQFjn2qI2KLfUGpqjOp?=
 =?us-ascii?Q?cu3R5ddPccodzX4QEnDiSIsYELstrphvAVWMGx8x5/qkUmVS7/yCxE2GrID6?=
 =?us-ascii?Q?dLiZc8x+ASqbq063xF8HMS4wuJpmPe+K2p01bqYmzE6qQ2pflUpzyBW/0r5+?=
 =?us-ascii?Q?SU/Wh+5x7bYM2rhx4hKYYA/5j21Ry2IuX1rtEce84MWas+AUrMEw9EezOUfO?=
 =?us-ascii?Q?ExoUZgmwptF6+P2paJUpiWzo4iVoiNGj9QopB5+IvsaqNkiG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc55bdc-1b21-4e4c-1826-08de52baace3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:44:45.3249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29dg544eLfvgnHTGB6y6hWeeWTTTvfSgcM8uQJmDOtTgzr1xMwBKnLUD4zLs8IO0K8FxVmgwQUxv7wih096V2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On Tue, Jan 13, 2026 at 05:53:10PM +0800, Xu Yang wrote:
> Based on the reality[1][2] that vb2_dma_sg_alloc() can't alloc buffer with
> device DMA limits, those device will always get below error: "swiotlb
> buffer is full (sz: 393216 bytes), total 65536 (slots), used 2358 (slots)"
> and the uvc gadget function can't work at all.
>
> The videobuf2-dma-sg.c driver doesn't has a formal improve about this issue
> till now. For UVC gadget, the videobuf2 subsystem doesn't do dma_map() on
> vmalloc returned big buffer when allocate the video buffers, however, it do
> it for dma_sg returned buffer. So the issue happens for vb2_dma_sg_alloc().
>
> To workaround the issue, lets retry vb2_reqbufs() with
> vb_vmalloc_memops if it fails to allocate buffer with vb2_dma_sg_memops.
> If use vmalloced buffer, UVC gadget will allocate some small buffers for
> each usb_request to do dma transfer, then uvc driver will memcopy data
> from big buffer to small buffer.
>
> Link[1]: https://lore.kernel.org/linux-media/20230828075420.2009568-1-anle.pan@nxp.com/
> Link[2]: https://lore.kernel.org/linux-media/20230914145812.12851-1-hui.fang@nxp.com/
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Changes in v2:
>  - add more information in commit message
> ---
>  drivers/usb/gadget/function/uvc_queue.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> index 21d80322cb6148ed87eb77f453a1f1644e4923ae..586e5524c171f115d98af5dda43fb800466f46d2 100644
> --- a/drivers/usb/gadget/function/uvc_queue.c
> +++ b/drivers/usb/gadget/function/uvc_queue.c
> @@ -182,7 +182,15 @@ int uvcg_alloc_buffers(struct uvc_video_queue *queue,
>  {
>  	int ret;
>
> +retry:
>  	ret = vb2_reqbufs(&queue->queue, rb);
> +	if (ret < 0 && queue->use_sg) {
> +		uvc_trace(UVC_TRACE_IOCTL,
> +			  "failed to alloc buffer with sg enabled, try non-sg mode\n");
> +		queue->use_sg = 0;
> +		queue->queue.mem_ops = &vb2_vmalloc_memops;
> +		goto retry;
> +	}
>
>  	return ret ? ret : rb->count;
>  }
>
> --
> 2.34.1
>

