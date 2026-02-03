Return-Path: <linux-usb+bounces-33024-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJfFLbpRgWmLFgMAu9opvQ
	(envelope-from <linux-usb+bounces-33024-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 02:39:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D141D36F7
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 02:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCD753043D17
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 01:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1BF274B43;
	Tue,  3 Feb 2026 01:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Gc9Eq4jF"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DAC23EA81;
	Tue,  3 Feb 2026 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082641; cv=fail; b=pJHPZIIBHCVXdLY11wWMoev2DxCq9qHOpvTI2E8HkoM5srH23O5TKdTbPwpO/d75uvKJM9mm3gbvgk3oWMbVnMOLwv8uBb54ycnRMmu7pDcViKbDBquif6f85ONTKjeHmDLqxPyDjIQ9oa2pevsngWwxEMTRVXSQv8FlCsF0vMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082641; c=relaxed/simple;
	bh=K0UkqH62AxpwVh0trkctijAxN1FPqJ2kJwBi2RLW8GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Io12wp84vMrDzKp2eB9rjgD3kh02KgGgSe91rDsfbuYhiKm1rb1bnNbMzH8eREfk79bPatP4YmmaHF0HJbgT8sENiYkAUujZ+UdWjEicdpwOU6lPE4jSzFWQ/TdDR1wJINL9VPn5i4K1zZoh9HeHDiekFdMEInDcMwrp7z6MaEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Gc9Eq4jF; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoZE7nBRjM+PaxZQE4fVsh5szxG5szvdNmqyGxI3mbNYtfHURUwkbPT1jbIJkkeuwQlfKm99D2x3DsfVIvHbnyyayMOEInGQMS9JbkQRNddQDLBAs3QZFPx4opifxtAx2y4wek2aivB7I55fqZZPUyeLP6Ce54fHgqWt/QUJdmL1aCsOi6m3NyHCaoyhCGU4jXhOrYGLLCA1Yaz27LfmeRbxC1OeSLGrW58A1LSblzdi828gia++O49k9BCc4aOtL/ywSVQWumKHykqwGBioIbQ5lOFj6OY0Rv4fXpIWb8rK2wL9a7MCgi4vYTcBGVQM7Jrxknge3nsZCEriIJm03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZrrasEg9UpesT1EeJV1oSHPJgfi8I4Ndb/hy9RR1RE=;
 b=wUfVC8DAL3hReFoq6BKZR9qzK8vi4MQ3STmS2WuenaiO9vcFxRk89ba+Y6xEd/oCs1QnmVr8a3TM0HN6gOZfd2iXiI+NsowXs1Yc+Co08/UllCqUYuWPnukp305273WptJwMeaypQFgXY+UE6+wNQPknE9zOtG1W/X+OiAbz514gMrKmTJwxzoTVetb4+xN11430IJP8AfwRZ8IbrZtB01BUvD8ZmDvZWYrEUUZAMMv2PKS2RnFVQerOYcfwoYGs0DnE33mAFpjZa8ciGC4/ccrAh19xHjwJbgL8Um84GjkSESdpgBCPnTBd5qEVwn6gqomel35Gqu4FT8EhPQCNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZrrasEg9UpesT1EeJV1oSHPJgfi8I4Ndb/hy9RR1RE=;
 b=Gc9Eq4jFtKnj9MfascpBE9F6UtdyXbHd/mxR2zMyJAKRtl8PIvez0jCWdmXdn4kDQepzyeQl495OFJL0uW3G4DCGXdK6C7mL8Cj9MvFx4NwmhYaag8eO7KWmgKy59BrhKBCAi906VPayfqOQmOHELrOQw/pKMgFynsV77scNZcOJGd2GzWgDL6/jTURxb72pEJ0Td2pKyFreP3MIUIryrkFoKuful5kWwrIgfIuheKXss2A/rqTlpwvq+SCej4Q1Gx/MF2O7vhEAMiPW3swmHveg/xeMz6QzaNsXXLRQw25BhBNSvMykq5KzVy8zS3N9fjSiYb1Ay/53cClcJBDC0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11053.eurprd04.prod.outlook.com (2603:10a6:10:589::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:37:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 01:37:16 +0000
Date: Tue, 3 Feb 2026 09:38:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Message-ID: <aYFRrguYW8Ps8Nth@shlinux89>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB11053:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c3e636-88ce-45f8-5901-08de62c4c318
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PfJq3L9fe2V26pOEDC4XO8MqBvqOBNTTb4dxCZ06Ab8jmJGOGXDJqJakgvfj?=
 =?us-ascii?Q?S6nC3GazNLSYMkLBRxACTqEWyxWxSPCIo+FYLkov/wX5uwxP0P0eBEdTXkQR?=
 =?us-ascii?Q?GIAxY2ejLaMNT8CDKv81pO7OhKLsqwYxH0lNHfo3j0YUhm4yczek9ADa/1V3?=
 =?us-ascii?Q?/Z3ISUdLcrgZeEHQvVt0JfF2YAq6fBjspY0xoTAXV5UAaYh7T9KGWe7VVS8N?=
 =?us-ascii?Q?6F+3/Cx/VzVH0GRofcnIShRp/GD2l8jh3L9zS/aAxdCcAmug2y4jDWXFG3LD?=
 =?us-ascii?Q?sSgWZoyf3hTgnaVHGBCKx8zOpsVbtxd2yHk4XAbHrjEq0rE5JABFT4TidWzh?=
 =?us-ascii?Q?boN9vaDsyamqKo8VC6KeDTaf3y64q+HOuQgGc+wKYlK4T9PM5KaYW9UjkLkv?=
 =?us-ascii?Q?Yt/f/af/1az1EAm4IdFUJfpN4Nh+TbqexDpORkbCbDDE9/aXAHYKYyoq0/rT?=
 =?us-ascii?Q?8l7hrmKOIvsqNG7AkaGrSLPxntOi4pSCBM7CG5sw0/yKzzq1Kfk0xSAwbiyl?=
 =?us-ascii?Q?mZrVyKXz+3cRepV/YrA0yprzKn3iRog2qlA6HICW44IJRUn9BJ4wVZYJRXho?=
 =?us-ascii?Q?nqrWKy2/4OlVtQGB1tPDX+d5A6wrWnUMSnJ4F4fDxuoLEe2Ys9qFmQ2gXcke?=
 =?us-ascii?Q?OsqGQGHH7rR7HgMLifo5ZS/yuy6uz+NHy2xTZMkLFto7gz8v73U1hZlmxPLO?=
 =?us-ascii?Q?FTAD0grsPYeLsmxrqaw3i/5TvdQGW4BnXoEGRoSS/w3QJ0wqlaAUU+Q+W/Ak?=
 =?us-ascii?Q?xDRnhhefVBuNAY8FHacvCC6upx+0GM6sK578wBqXnZ1IhCDbercY1kL/sYGL?=
 =?us-ascii?Q?VBqdN7onoWcNkhlFTh6mkIOclaapALbsRNFH0KCqwJ6BEHER/JSkh90Y4sh/?=
 =?us-ascii?Q?/SnJQUGIyA77pT/0AlmWkSW7P5yrb/FHjjpIzCeYgxWcBTo/KKQnJe5+hXjl?=
 =?us-ascii?Q?z4IeUU2SQDvC1F/fgzpnAB+2UDd/Tph66OJq6MFZVHePXJAUk75g0zyQRVmx?=
 =?us-ascii?Q?XI1fSgX3C9S1d8ohcexE+yJBOO0KMPMUigdV3iHL2HAbocRP3LBWUfjOgf9F?=
 =?us-ascii?Q?slLqfav0vPSMYGahsJ2VTD5PB/HUw6qFatkDnZBurCU6Ry/bsorFqpoeePMb?=
 =?us-ascii?Q?DWYmJIB7waOkMKv/zb7V3a0s3D7yDFu9a7LAT8UzFBZmmAoc9ZFfXir39Dr0?=
 =?us-ascii?Q?CLYPrVbnqR+DyuU494XyITydKG3jgExZK1vkGsA/ohAGWUymk0h1eTCE9gyS?=
 =?us-ascii?Q?tot4+U38IycpsQdW4uzJay4ZCBJFxALxIpBaDWVOkF2hZzM6+2/sSQJhKBns?=
 =?us-ascii?Q?kkTgaGr3zubmfyX5GAnjysl/AEHQ52DOaRjqIHDV/qzNgSvXmyDKfR2q9dSa?=
 =?us-ascii?Q?wPxBNU63gAxziVZck1n6M22Yfj2xSzI2jFRmWksz0lubqCX+bYYe9eSgfNRY?=
 =?us-ascii?Q?t++G1UE7BDaazI2Vz72UZNneX6PLIDXl4V6ZMqTKN6MaPYrB1DRZGyhHS//F?=
 =?us-ascii?Q?TPO0CNfrxUYuff7nQvSVuScw5s5t8yRbZPpaJEsieoTHe+Eh3crGG1m8VWxB?=
 =?us-ascii?Q?R4DZ76E8jcxAGPlW/vcp/h7Zh3uQqdUeZeLHv/hvkmmB8eEVTyhFd2MWfdVC?=
 =?us-ascii?Q?zfmVPRkAktVG6WVRAD8/YEk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zsJVuTGYbp15RiUQM6rZ+Rpem3pP/uehJdKYmpWd0GxJiXdh89EdweGL58Zk?=
 =?us-ascii?Q?zpSJ+6Df6rw87vNEj5ZyXPsXmBztG8cuLfKIrFlaQCa/fExWfh3VY3+9Hty5?=
 =?us-ascii?Q?A7fsf0gGqLtlPY0GqvL4fRlHBP5lJMx0sx7Fd9FNZqs8SBuTD5m32QLVVd9c?=
 =?us-ascii?Q?751t0Q+oPEKCy+3y7GSQV74MtGO9VYge6YucZjZ2tp70Hy7nCdxJ2zvktydf?=
 =?us-ascii?Q?Oi9AP2GCFYjmxIQeDBPz4PodN59t5KC4mqsznmqppQ9CvfbAtTQqyIyeP0o7?=
 =?us-ascii?Q?rBKbvTHAu0tiw0GIhTLJBS1jhh63k1SGoAvTx2OzzzOOp1ZUM/zLmYT241+x?=
 =?us-ascii?Q?vl+RUGu7yNCSmvVnmc+IDGnpgyDPng3LifxXheC9pKf/kVuifY8J9RWhhzqD?=
 =?us-ascii?Q?19eYaTP24lQpiwH1Cpr2CxlJ1Ycb7oL3w6UhkjVtHrDN0KKwFzg43sXIL4+C?=
 =?us-ascii?Q?4d6BxTVga+nvX+lFx6aCH+KFcVpZ1y9n29kmOpA6rssT58w/c/t2z5NjaIKq?=
 =?us-ascii?Q?ESOpj3+NxyXzr8I7ITBxF9zcSqHPpPPLJmVK8K5+mIF5l1xFINNUKTVbkOXy?=
 =?us-ascii?Q?VHO9Y7b16xVQaQPRN+SHxndN2DdGNB12e2o/Bj3HuOqskj922VQuj3icIrGE?=
 =?us-ascii?Q?B8XHUkDmBTr13KIO2JUJ3MkLa72gYybf0JmIb9YybIRWAF9YGrJr6iQ8WO1A?=
 =?us-ascii?Q?NJxWT/X3ujgCIb+v0L0TE4T467RV6Hq2rwb84U4NKaaX4cyd04xlZXg5f9N2?=
 =?us-ascii?Q?acG4CsCUO9fZDC/HAlAIWHcj1kgAm8c9L9zm5KF2coAkcK2pe39A5/sBj4aT?=
 =?us-ascii?Q?tauGYG9hNtX9HHd0X5kTZC7wBeX5/UGz95MxXg3Ud5FhfYXSCUSG6Ko22JFi?=
 =?us-ascii?Q?YjpXZVKDL+NGsGT1wDW5ARsRGyDc6MfBWc6mxS1HwScDd75KcomuE2Q0KN6Y?=
 =?us-ascii?Q?c6pf6X1kwRnBK8qJS49BmTPGVTkYfpecUvOT1em5dEpPrbY0s2JLx928ZgcN?=
 =?us-ascii?Q?qcQ6Vx71c03JJBI+8QI7hfQACBtz1HqHaSMb+QJDDBs/EM6iMvQVbg660ofm?=
 =?us-ascii?Q?wszTlnSjE4+H7BJquXDkJSBcr7KYJizEOSw1Q6uxM9tsarfIgElhCY/Zd9/5?=
 =?us-ascii?Q?hszbBzm/1QkyktZ7dMzkdE1BHJKHX2P+AflGX8IFMB4vjvKmLWWDjf3G7nSe?=
 =?us-ascii?Q?PkE3E0+cRtDGQr45TMtDR3Y3a1POd6Yni0NBX5C2tGMwrv8rSuP5jowtkIY8?=
 =?us-ascii?Q?C/YSpzkJHx3Qd08TnThZrz7hrAsNZVwMa+xosuAYWqBsWA1zxewWDkUj7YNs?=
 =?us-ascii?Q?bh2kwxnUz2xZOcpeSpJ6234DVnPspYehzlrQGauIdJbB5TRmliUUH1BoEMGm?=
 =?us-ascii?Q?6arN2GHtZ/d5EDLUiKot0BAFQWyOQrMrmoRrGzmhT7Fu1P4Y/sApHetuQbNl?=
 =?us-ascii?Q?K353zoLP5bygsMw8/P/XvcBV4xUsIG7FOEtCorsjdarohOKhrH87Aw1xyJVV?=
 =?us-ascii?Q?bbQE9/tR+/T8cFcKtJNHWYNEX3pMD5MVzJ5Uqfxuo6HuO8YR/nRLjFoRvA9l?=
 =?us-ascii?Q?Vcj4/dwp1rWwuLPKm+MDGfA5A5jhrkEd5UVfRlHeYU5am+hgXVA5Q6FSXmp2?=
 =?us-ascii?Q?0BowKFfcIvfLf/XIdmLbNY0e0XgOXfhaKu8pQIKBrzKk2WrvnnwB2i+nqIWu?=
 =?us-ascii?Q?hOiZXWrcOFOCmNBZd31HLIUNKu4Wvz+CXigOW7aV1O/fTupc4EiugeKAULNI?=
 =?us-ascii?Q?I6Lm9lwtUg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c3e636-88ce-45f8-5901-08de62c4c318
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:37:16.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS1GvWV9xts+oOu7qv8aK2rsz59iGPosMyR5n7WDSXuPjsxQEUwmR5ykfpsgGvlfwyErSxSWsRej9rKtvyGPcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33024-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,i.mx:url]
X-Rspamd-Queue-Id: 2D141D36F7
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 06:27:47PM +0800, Xu Yang wrote:
>To support flatten dwc3 devicetree model, introduce a new driver.
>
>Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>---
> drivers/usb/dwc3/Kconfig    |  12 ++
> drivers/usb/dwc3/Makefile   |   1 +
> drivers/usb/dwc3/dwc3-imx.c | 428 ++++++++++++++++++++++++++++++++++++++++++++
...
>diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
>new file mode 100644
>index 0000000000000000000000000000000000000000..57b175e929d7e163df5af7e2265ab7117fa1dc9a
>--- /dev/null
>+++ b/drivers/usb/dwc3/dwc3-imx.c
>@@ -0,0 +1,428 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
>+ *
>+ * Copyright 2026 NXP
>+ */
>+
>+#include <linux/clk.h>
>+#include <linux/interrupt.h>
>+#include <linux/io.h>
>+#include <linux/kernel.h>
>+#include <linux/module.h>
>+#include <linux/of_platform.h>
>+#include <linux/platform_device.h>
>+#include <linux/pm_runtime.h>
>+
>+#include "core.h"
>+#include "glue.h"
>+
>+/* USB wakeup registers */
>+#define USB_WAKEUP_CTRL			0x00
>+
>+/* Global wakeup interrupt enable, also used to clear interrupt */
>+#define USB_WAKEUP_EN			BIT(31)
>+/* Wakeup from connect or disconnect, only for superspeed */
>+#define USB_WAKEUP_SS_CONN		BIT(5)
>+/* 0 select vbus_valid, 1 select sessvld */
>+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
>+/* Enable signal for wake up from u3 state */
>+#define USB_WAKEUP_U3_EN		BIT(3)
>+/* Enable signal for wake up from id change */
>+#define USB_WAKEUP_ID_EN		BIT(2)
>+/* Enable signal for wake up from vbus change */
>+#define	USB_WAKEUP_VBUS_EN		BIT(1)
>+/* Enable signal for wake up from dp/dm change */
>+#define USB_WAKEUP_DPDM_EN		BIT(0)
>+
>+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
>+
>+/* USB glue registers */
>+#define USB_CTRL0		0x00
>+#define USB_CTRL1		0x04
>+
>+#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
>+#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
>+#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
>+
>+#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
>+#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
>+
>+struct dwc3_imx {
>+	struct dwc3	dwc;
>+	struct device	*dev;
>+	void __iomem	*blkctl_base;
>+	void __iomem	*glue_base;
>+	struct clk	*hsio_clk;
>+	struct clk	*suspend_clk;
>+	int		irq;
>+	bool		pm_suspended;
>+	bool		wakeup_pending;
>+};
>+
>+#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
>+
>+static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
>+{
>+	struct device *dev = dwc_imx->dev;
>+	u32 value;
>+
>+	if (!dwc_imx->glue_base)
>+		return;
>+
>+	value = readl(dwc_imx->glue_base + USB_CTRL0);
>+
>+	if (device_property_read_bool(dev, "fsl,permanently-attached"))
>+		value |= (USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);

No need parentheses.

>+	else
>+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
>+
>+	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
>+		value &= ~(USB_CTRL0_PORTPWR_EN);

Ditto.

>+	else
>+		value |= USB_CTRL0_PORTPWR_EN;
>+
>+	writel(value, dwc_imx->glue_base + USB_CTRL0);
>+
>+	value = readl(dwc_imx->glue_base + USB_CTRL1);
>+	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
>+		value |= USB_CTRL1_OC_POLARITY;
>+	else
>+		value &= ~USB_CTRL1_OC_POLARITY;
>+
>+	if (device_property_read_bool(dev, "fsl,power-active-low"))
>+		value |= USB_CTRL1_PWR_POLARITY;
>+	else
>+		value &= ~USB_CTRL1_PWR_POLARITY;
>+
>+	writel(value, dwc_imx->glue_base + USB_CTRL1);
>+}
>+
>+static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
>+{
>+	struct dwc3	*dwc = &dwc_imx->dwc;
>+	u32		val;

In dwc3_imx_configure_glue, space is used. while here, tab is used.

>+
>+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
>+
>+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci) {
>+		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
>+		if (PMSG_IS_AUTO(msg))
>+			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
>+	} else {
>+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
>+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
>+	}
>+
>+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
>+}
>+
>+static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
>+{
>+	u32	val;

Ditto.

>+
>+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
>+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
>+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
>+}
>+
>+static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
>+{
>+	struct dwc3_imx		*dwc_imx = data;
>+	struct dwc3		*dwc = &dwc_imx->dwc;

Ditto.

>+
>+	if (!dwc_imx->pm_suspended)
>+		return IRQ_HANDLED;
>+
>+	disable_irq_nosync(dwc_imx->irq);
>+	dwc_imx->wakeup_pending = true;
>+
>+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
>+		pm_runtime_resume(&dwc->xhci->dev);
>+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
>+		pm_runtime_get(dwc->dev);
>+
>+	return IRQ_HANDLED;
>+}
>+
>+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>+{
>+	if (role == USB_ROLE_HOST)
>+		/*
>+		 * For xhci host, we need disable dwc core auto
>+		 * suspend, because during this auto suspend delay(5s),
>+		 * xhci host RUN_STOP is cleared and wakeup is not
>+		 * enabled, if device is inserted, xhci host can't
>+		 * response the connection.
>+		 */
>+		pm_runtime_dont_use_autosuspend(dwc->dev);
>+	else
>+		pm_runtime_use_autosuspend(dwc->dev);
>+}
>+
>+static struct dwc3_glue_ops dwc3_imx_glue_ops = {
>+	.pre_set_role   = dwc3_imx_pre_set_role,
>+};
>+
>+static const struct property_entry dwc3_imx_properties[] = {
>+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
>+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
>+	{},
>+};
>+
>+static const struct software_node dwc3_imx_swnode = {
>+	.properties = dwc3_imx_properties,
>+};
>+
>+static int dwc3_imx_probe(struct platform_device *pdev)
>+{
>+	struct device		*dev = &pdev->dev;
>+	struct dwc3_imx		*dwc_imx;
>+	struct dwc3		*dwc;
>+	struct resource		*res;
>+	const char		*irq_name;
>+	struct dwc3_probe_data	probe_data = {};
>+	int			ret, irq;

As written above, unify the format.

>+
>+	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
>+	if (!dwc_imx)
>+		return -ENOMEM;
>+
>+	platform_set_drvdata(pdev, dwc_imx);
>+	dwc_imx->dev = dev;
>+
>+	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
>+	if (IS_ERR(dwc_imx->blkctl_base))
>+		return PTR_ERR(dwc_imx->blkctl_base);
>+
>+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
>+	if (!res) {
>+		dev_warn(dev, "Base address for glue layer missing\n");
>+	} else {
>+		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
>+		if (IS_ERR(dwc_imx->glue_base))
>+			return PTR_ERR(dwc_imx->glue_base);
>+	}
>+
>+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
>+	if (!res)
>+		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");

-ENOENT should be better.

>+
>+	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
>+	if (IS_ERR(dwc_imx->hsio_clk))
>+		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
>+				     "Failed to get hsio clk\n");
>+
>+	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
>+	if (IS_ERR(dwc_imx->suspend_clk))
>+		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
>+				     "Failed to get suspend clk\n");
>+
>+	irq = platform_get_irq_byname(pdev, "wakeup");
>+	if (irq < 0)
>+		return irq;
>+	dwc_imx->irq = irq;
>+
>+	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
>+	if (!irq_name)
>+		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>+
>+	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
>+					IRQF_ONESHOT, irq_name, dwc_imx);
>+	if (ret)
>+		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);

Should this be moved to end after all are initialized?

>+
>+	ret = device_add_software_node(dev, &dwc3_imx_swnode);
>+	if (ret)
>+		return dev_err_probe(dev, ret, "failed to add software node\n");
>+
>+	dwc = &dwc_imx->dwc;
>+	dwc->dev = dev;
>+	dwc->glue_ops = &dwc3_imx_glue_ops;
>+
>+	probe_data.res = res;
>+	probe_data.dwc = dwc;
>+	probe_data.core_may_lose_power = true;
>+
>+	ret = dwc3_core_probe(&probe_data);
>+	if (ret) {
>+		device_remove_software_node(dev);
>+		return ret;
>+	}
>+
>+	device_set_wakeup_capable(dev, true);
>+	return 0;
>+}
>+
>+static void dwc3_imx_remove(struct platform_device *pdev)
>+{
>+	struct device	*dev = &pdev->dev;
>+	struct dwc3	*dwc = dev_get_drvdata(dev);
>+
>+	if (pm_runtime_resume_and_get(dev) < 0)

print a error message.

when this fail return, there is no chance to probe success again I think,
because resource not freed.

>+		return;
>+
>+	dwc3_core_remove(dwc);
>+	device_remove_software_node(dev);
>+	pm_runtime_put_noidle(dev);
>+}
>+

Regards
Peng

