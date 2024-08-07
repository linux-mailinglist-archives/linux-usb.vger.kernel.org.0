Return-Path: <linux-usb+bounces-13175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E11949DBD
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 04:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C1ED284044
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 02:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3487B18FC92;
	Wed,  7 Aug 2024 02:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="km06dW7V"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C83C39;
	Wed,  7 Aug 2024 02:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722997546; cv=fail; b=AuUc5Chajd3ZzwniAopKWqYwfAHp3HeU/N/S9Chzcf39zq4Fq/9wQQHUwTVUh+PHvIWtFli5hkohf19MOwkl27iNfGU32NMaddvRZPtF6hRNaBIGX2HDV6gZWy0Zj3E1vGvolgq7HX0LsNgCZ3ZQEiaFh3a6USpc3Q2R7nBD8dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722997546; c=relaxed/simple;
	bh=b4OQH0p8+1LVqvhNLwreqP+Eazze/I/mANxSV8XitjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T/g51iGILfQaiEN7zITV+RmS/AkcEHed+FRbexyR2lwgoPeoD7NHmzKGqZfuR54rA0j07pHjIa8MeDzio3V7+9jcsxuG0cTU3EorZ38lhUGkK6azGHZ+56dWmlYe6xnbLf9pOltDvMeggUtoaeCsU8FIIsIaBP6wKnz8BCIVFBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=km06dW7V; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1cBF9WLfJgts6Ia9Ir8qatHbQEPoCK3tmP4TtxNeNRFy6r4xUdKhrfYuaUJ/CqZR8Zv7Rdg8L9B/45WrpBu4vkfZaZEh2nF3WaKf35jx7IhPxW5VqzFm7dDK/U9RKNgHgB3p6dhWNsA2qclSVzxynYV0AJ4kuytq4rhqhDLJofFcwkMGr3VaqM/aQnGWwh4cSPpsxvkFdllUggWLivz3gK0wYTt2NTUY77j840CASOXQfkyy3kDw14V4Y5Y9OAL68xjPkTXZRL9InEsEle8Xh6vVZyN+FWaBTmCHKZb5Ion9wDVJhvXFeyuQn3ibi7BC7cjDFhmX5ZOhAVNiBQMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfofeq8SI0TZ1LWnK6iC7nyVq8kD1OYDN7VMGGuOVJ8=;
 b=G3FKP8Z8EEjAjGC7UF2xS9/ZYr3BeOIpBK3gRYLguF95jefwLPR9QBWzlXL8/8Yvd1TRyO7tH3dlQ8BrKgYAxXcyPiiif3HVL6U98q5FS3WNwyN1Vqz+PSCZukJX7OCxbYFEmt0vGznjsxWwfp20VXMwoORBHOuCG8uTVD3CKp+r9Fg3rAlfo4Pb+GQ/5BF0rCHkPZ4NpLFXv5VXHZQuGu20XsKOSJoaPrUNvxVayyhKiPX80QLFtSyVkk5+pzq3j4hfqO4C79L+Rzk1cxN+xSViCBFv1WdEP3ifj1xktQpseGH/fTgiY4Bqqsj1hJpqTjCrzDzVtwDjLY7UCSFNVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfofeq8SI0TZ1LWnK6iC7nyVq8kD1OYDN7VMGGuOVJ8=;
 b=km06dW7Vrqyflj8vvnrk1d5y0U2taIdVs+9dLAMuCAjg93DMkQ+3RsTe0fJ2ppKQRjzP6cGPHHFkjpi/rRrDUG96odQuj2bUYYggtA2aJ+OT6VNiPa22/B4zkZtGKTHXcwM17xErnO7MmvzFjJE5LcGoBjNYG8Cs1Xy28A8HLY5CdYXI9VIYrZGjy5aXkS0QRkEHAxRXPvF6dHZQWugF107Hvqds3eZgrTeJpHNva1mYsFCZfvtjdbJYXlsiZ6VHpkKdT5QUOqFhPG/wWPtegt4bf36j46ZbnWH99wZdadQ0FV1DRdgHY7oaqRn35yzGOh27jRPQv+H3la9RSlDU3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10909.eurprd04.prod.outlook.com (2603:10a6:10:587::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Wed, 7 Aug
 2024 02:25:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 02:25:41 +0000
Date: Wed, 7 Aug 2024 10:24:58 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com, l.stach@pengutronix.de,
	aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: imx8mq-usb: add compatible
 "fsl,imx95-usb-phy"
Message-ID: <20240807022458.m4njz4tsxfadzro5@hippo>
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
 <160dd5fc-83ba-4311-a173-44521342a3d8@kernel.org>
 <ZrJLS37GFmvkQpml@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrJLS37GFmvkQpml@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10909:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b1156c-4c8b-4879-eb42-08dcb6883b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+C+SmvFE0d764bOuZWx5Qk1P89vKtkmGcoVTr4FX3rtRx4IiwLziJiSOq1nm?=
 =?us-ascii?Q?TCnQADVsdvufFX4U1VG5x1ELvzPYIfOUgc3DqDC1tvR3Fvq+pAJZ0JSTiVFh?=
 =?us-ascii?Q?nhKnKEgerfdDve9NcdinZZDXsJDC/37a2U69yp0ydVvD99iwtoPAhgyqM4zI?=
 =?us-ascii?Q?8TQFswxuHdui396LLeZQfnD72Ew9XVR+3Xc+O/5T1SaDGwzCg20/ySKOWNkv?=
 =?us-ascii?Q?/y8Wk4l1gDUDN5M5RUNyDHRZwxHQV6BkGcUoAB6elzGZ/77oi+V9ChPXHJvm?=
 =?us-ascii?Q?NUaSw45F5BR4ZYI8kBXH30zpl69B0CHoaiezM7yYSahrHukQ2egfIB6wiF36?=
 =?us-ascii?Q?s7kP4pdZY8mZ19yAkyRqnV1PwAVzXfKljkujQMi9Qn9NJs4B8SO42eg+l3oL?=
 =?us-ascii?Q?qmmJKGhRScHmnuTkvp7fgC+QtnwunHsLz0ACA1nPoayzU8R+/0u7EE+S3V4B?=
 =?us-ascii?Q?5hsgOlaqYpVSsRF3NEyl/Szbz2C1NT/i1x1U2/r7BXmjPBsAbk7evW/CI/P2?=
 =?us-ascii?Q?xaVQT6mDhMtCy73GKTPwsz0susc9/gztKkNMJyPsei3bYpjUCxrNK8ATjHdi?=
 =?us-ascii?Q?pT3cdgyYDDFOqb4OVPj8FVJteWkHU1c7P3ItGwMRa2jNrdCwk9oIDeFE/W5X?=
 =?us-ascii?Q?W5YUFY9c6O9xfW8yJjw8E0rtMYV1WRFYgxMPOKwUpBomZtzMMrq1wfCdCwZT?=
 =?us-ascii?Q?hrkMen9/6RppBAjBoVi9zExB1pGDJZwLlgBYicCWu4ySqO4fHjTS3BZ6eKwy?=
 =?us-ascii?Q?oVn2BnUw6zAEPswmgSx5IozfyfZ8DiI9RKLsZWZhBqJOp7DS9sWAMfhSJotf?=
 =?us-ascii?Q?LqdY55uAGzygU+I3xAeXCKQvzcpuZerg5vWoFkIjC76yqmxVSA6/P+EoBT8Z?=
 =?us-ascii?Q?ERe5Koaf7osVZdYV2je1nEDqJGg/v64b/Y54dYCnwiiatc1iy3N34/coGs7m?=
 =?us-ascii?Q?upkw/Q6glbtVuLmQSOmAGoQTBXBHSufh9QAiwDuTJOM/Yu5Y6Nkz1mTh3x1Z?=
 =?us-ascii?Q?3fOqOr7b+4HVIub9UXVK3fSNshBpj+IMumKs+yxXH563TGWFk6wrz6mNS2sA?=
 =?us-ascii?Q?2vpuI5qttxj+9Ddmh+7/VtCsWZRhLw06C6ZSvGEidEfXuJBZwJrcMthsCCqP?=
 =?us-ascii?Q?km3/ltY8AexKlfj3qBGjM23GVWcYQC7+c4yc0NL+xc57J/Z4+6y0Y2cme03m?=
 =?us-ascii?Q?97ApL9pTFHT+b1uvn4PmDK/4cyxy8nDjrhIwN8PkDYNRpHmYOeIaeTylBzJ+?=
 =?us-ascii?Q?261ZdRIY2JNz1aclOppVQn7LE+eXYaPxSLTSoGbxTBuuyGm6KZaOehjUV8PA?=
 =?us-ascii?Q?DtLb8Cian5ihtSMzPq6HYkjVG/rx/8DlkDUqykfgg54IL7rowl5As7XR6H+3?=
 =?us-ascii?Q?nhIs4LA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zsn6dXeVStXiMFbkFALa6YbUZwWyZfCveQvKc7pmWbPbvyXxSi7stvw7nDvS?=
 =?us-ascii?Q?mL93brVVWlG+F2nzTMmFyNAQBINaw/JfoPTahTWaUMiik4YLEJ5iX5Hq4KI7?=
 =?us-ascii?Q?ohaeUIr/y2sHp24ByGUV1lRrMxvxAmKWHni6rLb7VCzhb4HsXtSmHqsdxdum?=
 =?us-ascii?Q?Sjrq8jbP0S+INtz/1/bzsWYKSiSYbDpINYUcKYzKfb8bdTcLoc3EBXmrKtRl?=
 =?us-ascii?Q?6ea7h4uluPC3xYVaBWJSuRSeKb5c5DiRQS4/dDSuoCxDx5f5ktyT7xDTVvCL?=
 =?us-ascii?Q?N3HVQGu0O9tMtCy1/ycfmsOb3j5zt98ERM//4syLyDcHqGnbrrwK9HaQG+dG?=
 =?us-ascii?Q?HarZXVkmCuv5kWln++PJPoNSxfJxJFodOhDre6CIuIMOl4clnBypS7dkqU4R?=
 =?us-ascii?Q?XGSxgy1E/6Jwj4yiNlOejedlpkauSZUKh+zJxS+LyGTNtNs6IIPYeHuYBBVM?=
 =?us-ascii?Q?TScJd+VHch8SPNaPqcTrRS2Sixj5ek1SpdnbN9S9acHYjsrn+t8ylq+R1jNP?=
 =?us-ascii?Q?t3E2O8ygkxcDoaxZwnsMax5YznnMDocvBJ0CcRfFtC4NWOQ6HvONu3gTKyVS?=
 =?us-ascii?Q?CaVM58yh1P3e2vaBhcI5hQ/dhSX46TJK7Gg3K3N/GQnnbqViEXyfqdH0Tkc/?=
 =?us-ascii?Q?lriTfNuMBue7+l6F23NSxQukC6mng0X2WjtroyM89JT6JPswI5ZC+tzekEWf?=
 =?us-ascii?Q?aeHCpvgimFkiyUOLvSYCnyvIvJ1y8pQ6rHi6c95j+v+Fj1fHg6J4V2b4mul0?=
 =?us-ascii?Q?JZvTbjPIINnvFpC6O8as/2Bz2duqCCxGzrwuPIY903M9C8ng6lERLScDi83A?=
 =?us-ascii?Q?JKtw65MyGC9sS8G0uuvYFjrIj5jsbtb0+Wq0zxEsj5TOSTQ9s8V9ikCWLjj8?=
 =?us-ascii?Q?PmuOlgmWV2s4hRzaNn43/cx29kiWtYzmhsFvHvtTDkEco5SIBJb+BEWHW8Qd?=
 =?us-ascii?Q?FeGdNItI2YnWyHk9LfW5RRDQtKCi9GtuDWRbSQUDS2kEKPlrxYow/+Hnt9rq?=
 =?us-ascii?Q?+U16qCM/wlIUuONbxu3EhXV003+Pak9/vrkowaLr5iCDxR1FMcexa08cxF81?=
 =?us-ascii?Q?wZ7aayxegJjf5QI35OYp0gj26XdNrvs5uA6TAjb5wHl9nU70/lFjcWIsE/LF?=
 =?us-ascii?Q?Bgb3bNOcJvjPRvGBpnuVvkAMAL1HfIYVnnba5xSOALpqY/gGxuVNlErs/H2d?=
 =?us-ascii?Q?5k4cqv1BxemanvRL/tWr5cbP/6X4tGatG3KYHy/FFHRT/W/Ne5uqyVWaxvPN?=
 =?us-ascii?Q?nxwj4CYKxd7QXo+Nk6PR/+wG0buzGuzBqX6ZKVLLBq6HhFHS4sidq+PMoSLW?=
 =?us-ascii?Q?ErHVzQOtGTcDdQV9T4IvURYoGJc4cJtGpUdnb8ANcijjF+cCLyQmWRMEwZog?=
 =?us-ascii?Q?oQiUEpvGDwLdnloVbwr6jFCoNCzz4ZTDV2OiT1hCRes5GSycFLMDzv3WOzgL?=
 =?us-ascii?Q?EcKmcTyGG3Uo/UATuBCEqUgi9P0rPchK7Bk+2fLSZPYFQh4Rvkwf7iA9BNmQ?=
 =?us-ascii?Q?f4FvKjibMooPE51PrqondNgUnBCM3pkPW20WoEwCN5EbZHfhD13So6w97TRw?=
 =?us-ascii?Q?S94f0XngM3p4fQepTanWGP/KSCOb3+CR89LR+4Im?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b1156c-4c8b-4879-eb42-08dcb6883b94
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 02:25:41.2399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLsS5sGl0E8SRPSu3CxxxgVXeV+m+IEoJRkmIufsvKX4yPLGzvTpX5UxoLi6+7wrlptVunLuQbfD/MnOwLqJHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10909

On Tue, Aug 06, 2024 at 12:11:55PM -0400, Frank Li wrote:
> On Tue, Aug 06, 2024 at 10:29:47AM +0200, Krzysztof Kozlowski wrote:
> > On 06/08/2024 07:06, Xu Yang wrote:
> > > The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
> > > compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
> > > to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
> > > block. Since i.MX95 usb phy is able to switch SS lanes, this will also
> > > add orientation-switch and port property to the file.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v2:
> > >  - replace minItems with description in reg property
> > >  - remove orientation-switch and port
> > >  - refer to usb-switch.yaml
> > >  - use unevaluatedProperties
> > > ---
> > >  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 42 ++++++++++++++++---
> > >  1 file changed, 37 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > index dc3a3f709fea..6d6d211883ae 100644
> > > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > @@ -11,12 +11,17 @@ maintainers:
> > >
> > >  properties:
> > >    compatible:
> > > -    enum:
> > > -      - fsl,imx8mq-usb-phy
> > > -      - fsl,imx8mp-usb-phy
> > > +    oneOf:
> > > +      - enum:
> > > +          - fsl,imx8mq-usb-phy
> > > +          - fsl,imx8mp-usb-phy
> > > +      - items:
> > > +          - const: fsl,imx95-usb-phy
> > > +          - const: fsl,imx8mp-usb-phy
> > >
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > >
> > >    "#phy-cells":
> > >      const: 0
> > > @@ -89,7 +94,34 @@ required:
> > >    - clocks
> > >    - clock-names
> > >
> > > -additionalProperties: false
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx95-usb-phy
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          items:
> > > +            - description: USB PHY Control range
> > > +            - description: USB PHY TCA Block range
> > > +    else:
> > > +      properties:
> > > +        reg:
> > > +          maxItems: 1
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx95-usb-phy
> > > +    then:
> > > +      $ref: /schemas/usb/usb-switch.yaml#
> >
> > ref should be rather in top-level. You can always disallow certain
> > properties for devices, if they are really not applicable.
> 
> There are some "required" in usb-switch.yaml,
> 
> oneOf:
>   - required:
>       - port
>   - required:
>       - ports
> 
> If put on the top, it may cause DTB check warning for other compatible
> strings, which have not support usb-switch.

Yes, even though I move usb-switch to top and set false for certain properties,
dtbinding check still has below error:

/home/nxf75279/work/usb/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.example.dtb: phy@381f0040: 'oneOf' conditional failed, one must be fixed:
        'port' is a required property
        'ports' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#

Thanks,
Xu Yang

> 
> Frank
> >
> > Best regards,
> > Krzysztof
> >

