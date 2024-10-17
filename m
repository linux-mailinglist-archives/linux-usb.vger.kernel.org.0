Return-Path: <linux-usb+bounces-16359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0556D9A200B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 12:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B951C21F3D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 10:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2266A1D2F61;
	Thu, 17 Oct 2024 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d4S/TY+k"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFA01D31B8;
	Thu, 17 Oct 2024 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729161025; cv=fail; b=rw9bk+Vz7cLQTWKbFqj+ieAmo40+Bb8kZP30W3bbIfPbHAalu1q2bL/3v3VTqFrWVjE+9HPH6ywbnzOp8K/b6HWuhvKiX0l9pQ+P936rOeXssl8zZtG4bys1bP4toISai+nGS1k4Im0Pi/zO7F6ovm8qfjsdpGF7+iLXfHmPIm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729161025; c=relaxed/simple;
	bh=ytrBQFSRpiwWKzCPF8UfzjzZFeKRtFTUwEwJdzvTFDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ANTl370M2NARC4vgQfAtdeaF5iJKFapTFVYX57lsV/OzvMB9tSU4luEdJIh0tnkyiZ2f3dtcc9ImkDLx1ZwHBj4/bTMgyelpFH6MTR3NC3p1drW0eEa3nR7p/74J97uHriGDWQOzP/vWlfnjoZSrQq9NVJtlesZqnQxlhJACerI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d4S/TY+k; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHAN873rY6aqQ4tpKQmmnI0jYeFPDDRLEIpWAeZEwcOOeKlY8t/dbJG1t4u7Wc//xgUBZrXH+OREYFwo948AOBWwYEzQtkDbIe4/d+eZZjZIdPhHmsiLP628FupugjGmn8WLZ3rg8U4GIZJ7StzLkxIXueiqO2xTQ+E+aG17D9Sk3/iE97OiO6iMZfYPVLcf0n58IUJOgIVN/sDeCRIkpU7QH9VYW6IPApRBb1n90n5UwXALvE466X3W2GZTev4OUV/8Iv6VmCj+s2c4q6GRF1+/fuNEQbrhQ6LPdUJSf4TeAyrVXD/Aa4i1+1RnZsdXnX8aieiofYlVGHY/tMse8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V06I2Aj0ORKeHp1cIJFpw/uKY3w0Xi5ELaj91/6CnNY=;
 b=fogPSyLKNWR8YeNOwkoVGK5Dc4QEXCkQRHgDdqpLrT6N0iGoFOnX4nSJkS7DLXFNAOrkDRpF3ow6W4oTbTkrPsWVO/dYVwI5i3RD3pWhMd77I76nV4l/PH6yxK9+0gs5LSlHZ+FXh9QH/Uh/AVeo9SunWlq6qgljUJ17u7QyxPg4D3qwK1z/YVwartcqd0IOVs95JwKK8cqrqw/7cUH1Vm/CZo5/pRdMOVYjDBs0zBtzgXJ0wvNYzzFVGCQBvsnIEqs+NNr8Ybch2wrOQgYr4lC/98mrOiv8YwXoHK6PYTR0sjnDqSjsSQK79g5XVWP9sh4UHmGQ/ncE1oTsWN4ejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V06I2Aj0ORKeHp1cIJFpw/uKY3w0Xi5ELaj91/6CnNY=;
 b=d4S/TY+kfMXrgaRRtkAlA7CzNdVJVw/ycQIOGqJM2zeZcrz8fdRla5+RS9KI81f3m0lO/AZiZT8eK6pMIf5KYJmVeJoB4crIU3EHakeJk6tiDLkXvn8O1K3Fv46baI/ytHmgKukN/xoFx/HhZaQ8MwsK/zF+5YJy6CB/JtgEs8YIoH20mEIfwEIUpBsVetXGgcWyxfGXHkyXbgDz3e6UcNLWM8nyCitcpqxuMs3HfkWue8/05iWNnEXOc+zRB9dcfTRY5tIQWjScw9y68SaiweJ79QXjBwJwYgCfLZefPPqZioVLLzLI1VW48FKVblOIQZYoMCUJ2TT2BRKZipW82w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 10:30:17 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 10:30:17 +0000
Date: Thu, 17 Oct 2024 18:28:11 +0800
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
Message-ID: <20241017102811.oweshkoxavt2l4hi@hippo>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com>
 <22464382.EfDdHjke4D@steina-w>
 <20241016104140.rjmszgplmql4hwrs@hippo>
 <3252989.5fSG56mABF@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3252989.5fSG56mABF@steina-w>
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: cd782633-4aa1-48f0-4106-08dcee96b148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HEqXpJPlC0Ez5imshhdGvxacSxx8d3wqC5YNozW2Qk0W8rLtQJ8xMftL+k+1?=
 =?us-ascii?Q?lkRwj9w5T/8b0ULf0gYQ6AJSf7AqLK6CLHg/w/x/CtoJzy8IqUdRBkBzkatM?=
 =?us-ascii?Q?hpH7vMQaCX9CzZBm2XlOdQSZlMFgX1JaK4OicsQsrTTRZHT3Lv9X6C323kax?=
 =?us-ascii?Q?iJbdHlST46Psl5/rTBPFeUolxz5m1QHdl2Wu5MFqZUv5mo5cz6QS9GdGSyA+?=
 =?us-ascii?Q?zr2TQuoQwJlBYhMo8VPMnt3bseWOb4JYgXnLny+hm5Wq1VMph/pLoIWPdbR9?=
 =?us-ascii?Q?lWmfETOqExxXMJebMvfGZ7+OnWVBBAZL9pVmx66nB3NRDN03x1N1z3m/Fb9r?=
 =?us-ascii?Q?g+5uOqBb8YW2J2lvSpYgSeFKNkDtWRHWJRG+h09X2x5SZyPG3wVthq2YUggX?=
 =?us-ascii?Q?ghgAZT4uiBG71j3G6p/S/a86/SzHsiKDxwNzoWGcDbLVjb/ExqbqMB8dt0JN?=
 =?us-ascii?Q?d0gOaeZcQQX7jdOwQoG/dcaYAonkpkAdhZxLQiqPVhwI5PXgW/Db1Bgj2lCo?=
 =?us-ascii?Q?fjIWJeDj44VH5nyqsXBKzOo5mcEWIE0BBCiVX9FXVN3lgfdcq2WY63nvcBhI?=
 =?us-ascii?Q?Tw0P5KdffBtKH9ZIcXH24N5/Sh8jDw1sdxp+ayOv+VmW6hodF/PM7FpBnL2q?=
 =?us-ascii?Q?FZ1UXmuQBqNBh/O8YdeWwIwNvR2WQmoYe5/gXTxPveuPQ9zmrltqjPXFAwjw?=
 =?us-ascii?Q?8L6eGX7i/zE+GFHtJdJX2fR3hK00EeL9GQ738gYuEr0jygP266csIpIkhTnr?=
 =?us-ascii?Q?MdC4xWeskrLN08CZ1/6wUn3ysGidp6JFn37nXhGRjmM/9yuuEQf0p6ukdsYM?=
 =?us-ascii?Q?PyjrEc8EsAGOXZDubh8bZ4O7jLTgvlSKRKygdkY/2H1syRMlDsp+bHYu+zLk?=
 =?us-ascii?Q?lx5WN12uidxhRUpOFH0ecd8mz498NSsoLz9khQ0irA5/QwWFeqv9y1YNHV4P?=
 =?us-ascii?Q?U6J91bQBnqNaIU55GSpK3zs1m261XE0XriAVDW0nUOlhvraILdYo0M4XfN4Y?=
 =?us-ascii?Q?yenvbgk5JabffaZWbeEKlp7Yjfr3tW/f8z2u4d0kJtdxJyuxpYs0dCklFPLb?=
 =?us-ascii?Q?YiytctxNF2nHE/zYmZus0HT0/6pnpTT9CqHnB23Y7F3RTKqwDQndqRkGdvsY?=
 =?us-ascii?Q?33h8Q4m35FSNLNUlUKTzDz+esl+TYuzvtkEnLjAm1XgO7OXXsnGPeOBIwIvH?=
 =?us-ascii?Q?B8ZSiYn+UA/FGULDW1NGAZ+Mz1FTTDVWUgKwvEbGjQHpPHafG08iswC3+R4f?=
 =?us-ascii?Q?RsjMqiOEOvSiKHEKSbsaV8DXPYn0X/nij39saL84wS2Eaj012/JG3sWZ4lM5?=
 =?us-ascii?Q?YSdcLQJm5FKpxwEWE2hAuMgQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TQQi7mbSrw4ZjTjW5RvQpbDof+YqZ+P23V6j367QGPjbB9iT3ZqiclgA2uwX?=
 =?us-ascii?Q?EgWp8/aItfkJnzRuEz2KI0bbBESMGra877Wn17Axg0HTrMX9ls5/b8u7R4eM?=
 =?us-ascii?Q?mbkOYzVzHOm+98fjceS9b0Q+gzENo0I+oLXbIpA+a9o/UpqKfrbxS2YEbs7J?=
 =?us-ascii?Q?wqxMX33b0wGd9+7AZukpaKU3EJ/Nu8+a9Ut36PuX1HtYYzAPFegen95+xM3+?=
 =?us-ascii?Q?7/VXA09nVK6Z07WhkmPmvZJhiTFobfk9svQk10L6SGZNa7rSh1oVbMuaf4yR?=
 =?us-ascii?Q?di6PU9XQyXKn2o5alGK9OOSCu7A0C1a5++gzb7LsZgzLluapWum+ygNoAEV1?=
 =?us-ascii?Q?Mao9zZZtT2v50g31g4bVsliugbGLgBs4nVDbWLGHlfQQsvO5CtyfNX8PFycS?=
 =?us-ascii?Q?GOK+E/PrxgoLGCspk+NDd2MazuloJljhOXEAa5LI8hdJ0WxMvXuM6P9A5xqL?=
 =?us-ascii?Q?onDbxo/fzbfrzh2tV0MjJ3ty/4XUG3YQao8/GRLsgacASc4PialQNjGacsev?=
 =?us-ascii?Q?rfuenIAzxlFrvW7/VvVVy2HzHLeqSze8IVGDHdMi4YCEGGu+9SfRbSRx0zR0?=
 =?us-ascii?Q?/LI5B2ZBoAe/0iI0fI2HeSvP9sYrh53hZBcKlgf0f2YXOffUhaIgE3bg6qly?=
 =?us-ascii?Q?TncSjsKcqVGLDcBHh/tp2Sr7V4aITlABEcQIJ9+zJ5XzXfiO3EpkoEf20sXj?=
 =?us-ascii?Q?jW181nkeInkpaCcDHYEcfoZBkYDqV/UjW2K9vR5JhBz5qmxWlwB1fhTm1FBf?=
 =?us-ascii?Q?8ahLSVz8gVNoF0rs3TB19ics2iSJaQnpWy+ICzPNidIZKhvYZ85LeKlLO5du?=
 =?us-ascii?Q?08iarh/tuEVl/zGNbpIt4WInFedJ5yH4Qv3iTypHSXpyoyXyGa3sT5B6z2ur?=
 =?us-ascii?Q?TPliruvB5Vzx184ivAfg7T8a2BwTmUz1qkV/P0mg3TNx41crxsRHH1MjdTcK?=
 =?us-ascii?Q?lSPGYe+4TuyH4P/sG3AQEYn+I0/vGQsyZ03PwVSJCE8bGu/L0HkQa1hyIojV?=
 =?us-ascii?Q?gZxoQi+de5NjVKE2SyoFrpIMH4Ht2I+QKx7U4lgb+h6oBCt75ehPeJ5HWfII?=
 =?us-ascii?Q?kYHR9mOW5T9E7qU/JvfTR8/tloynoKkxPafns6/F1HH2/lUvPkKktQ+f0WKS?=
 =?us-ascii?Q?qCAJvsyLyMwzwATDT1/rDxEYV1Zz+lEX+VH+kXRGfxuUKTvlNwrX1MHNzbrm?=
 =?us-ascii?Q?eBvUtvT9Gy4qlsEWlufx1O2r7WdjbnIPCpiagLDabSZoY4r01qDsAI8GCJTD?=
 =?us-ascii?Q?81igLWxhhdG9zOCnTiOnik0uQZ5/cKqu8ZSRLHGfCw6f+iHKuXGAfBOEFzaq?=
 =?us-ascii?Q?CoXLKziO+ciVQdr7fICliwz0vlvpjLdR02HUcvYH59XHyKVUXzuTrlxViR+7?=
 =?us-ascii?Q?V1D1iLQNafqHIulpcoxr1dF6GIPZa4HrukYqQgK12pjU03PlHe/GrD0+8ZT8?=
 =?us-ascii?Q?nzxF1l6cIGDsgYvLNiUzAQTAV5wag/IllQuFV9h4TRHNMCdW0n8Ka5WWssQu?=
 =?us-ascii?Q?1r/a9QvRmU91xalWBRxPVgY7imKvJWDdzujQRUE6zeBJFy7mGATgEXns+92Q?=
 =?us-ascii?Q?1SB5lAS48Zhu0satLhb5eqG1aXRUBdq1r1rVIER2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd782633-4aa1-48f0-4106-08dcee96b148
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 10:30:17.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRYoBI/kTZ73plmuOEAw/EFk1dK0RQ+wzFBAxS/UpsotuIiODqg5q9TaSRNSISssZgAosfGJD1KhGj7QqqviIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827

On Wed, Oct 16, 2024 at 01:03:53PM +0200, Alexander Stein wrote:
> Hi,
> 
> Am Mittwoch, 16. Oktober 2024, 12:41:40 CEST schrieb Xu Yang:
> > On Wed, Oct 16, 2024 at 10:53:50AM +0200, Alexander Stein wrote:
> > > Hi,
> > > 
> > > another thing I just noticed.
> > > 
> > > Am Dienstag, 15. Oktober 2024, 13:10:17 CEST schrieb Xu Yang:
> > > > Add usb3 phy and controller nodes for imx95.
> > > > 
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > 
> > > > ---
> > > > Changes in v2:
> > > >  - no changes
> > > > Changes in v3:
> > > >  - no changes
> > > > Changes in v4:
> > > >  - reorder nodes
> > > > Changes in v5:
> > > >  - no changes
> > > > Changes in v6:
> > > >  - rebase to latest
> > > > Changes in v7:
> > > >  - no changes
> > > > Changes in v8:
> > > >  - no changes
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
> > > >  1 file changed, 43 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > index 03661e76550f..e3faa8462759 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > @@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
> > > >  			};
> > > >  		};
> > > >  
> > > > +		usb3: usb@4c010010 {
> > > > +			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> > > > +			reg = <0x0 0x4c010010 0x0 0x04>,
> > > > +			      <0x0 0x4c1f0000 0x0 0x20>;
> > > > +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > > > +				 <&scmi_clk IMX95_CLK_32K>;
> > > > +			clock-names = "hsio", "suspend";
> > > > +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			#address-cells = <2>;
> > > > +			#size-cells = <2>;
> > > > +			ranges;
> > > > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > > +			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> > > > +			status = "disabled";
> > > > +
> > > > +			usb3_dwc3: usb@4c100000 {
> > > > +				compatible = "snps,dwc3";
> > > > +				reg = <0x0 0x4c100000 0x0 0x10000>;
> > > > +				clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > > > +					 <&scmi_clk IMX95_CLK_24M>,
> > > > +					 <&scmi_clk IMX95_CLK_32K>;
> > > > +				clock-names = "bus_early", "ref", "suspend";
> > > > +				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > > > +				phys = <&usb3_phy>, <&usb3_phy>;
> > > > +				phy-names = "usb2-phy", "usb3-phy";
> > > > +				snps,gfladj-refclk-lpm-sel-quirk;
> > > > +				snps,parkmode-disable-ss-quirk;
> > > > +				iommus = <&smmu 0xe>;
> > > > +			};
> > > > +		};
> > > > +
> > > > +		usb3_phy: phy@4c1f0040 {
> > > > +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> > > > +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> > > > +			      <0x0 0x4c1fc000 0x0 0x100>;
> > > > +			clocks = <&scmi_clk IMX95_CLK_HSIO>;
> > > > +			clock-names = "phy";
> > > > +			#phy-cells = <0>;
> > > > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > > +			orientation-switch;
> > > > +			status = "disabled";
> > > 
> > > I got these dtbs check warnings:
> > > 
> > > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> > >  phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
> > >         'port' is a required property
> > >         'ports' is a required property
> > >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> > > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: 
> > >  phy@4c1f0040: Unevaluated properties are not allowed ('orientation-switch' was unexpected)
> > >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> > 
> > Are you checking on usb tree? You need below two dt-binding patch.
> > 
> >  - dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
> >  - dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"
> 
> Yes, these patches are already in linux-next. I'm on next-20241016.
> 
> > > 
> > > 
> > > How am I supposed to specify a port when the usb3 is used in host mode, thus
> > > no USB Type-C connector and no 'port' OF-graph accordingly?
> > 
> > Host-only mode with Type-A connector? No Typec-C connector?
> > Sorry, I do not get your meaning.
> 
> Yes, no Type-C connector. Actually not even a Type-A as there is an
> on-board USB hub attached to this host.

Understood. imx95 usb phy can work w/o typec. So I may need modify the
dt-binding to be similar to the following format:

If property "orientation-switch" exist and compatible contain "fsl,imx95-usb-phy",
then refer to usb-switch.yaml.

However, I'm not sure how to do that now. Do you know?

Thanks,
Xu Yang

