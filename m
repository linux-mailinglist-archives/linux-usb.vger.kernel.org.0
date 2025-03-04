Return-Path: <linux-usb+bounces-21337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCFA4DF99
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 14:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 039C37A2336
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 13:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934EB204695;
	Tue,  4 Mar 2025 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MHwv2sl6"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2075.outbound.protection.outlook.com [40.107.247.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB2D1E505;
	Tue,  4 Mar 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096086; cv=fail; b=Rm5oLzMhQVbqSt4AaNg67o0D9RMsbhKjIs3aaxm+9IalUTnv62T2e5JSSJUUIeor0zd1lucKYmRkQHpNpQhpXGuMyvHe++twzl0ACYKCvwx9ZQf7AOUeul2nmPk+4OE9MKGaNntfy3KQcmpLsuxX8rTVLiO0CV3xggUwXgC34DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096086; c=relaxed/simple;
	bh=ckDc0uw6WALL0yfZ7Y92ggyiqglippfa2PnAePtUEiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jezzr4lC2GSGEIhyS7LehCxb13TpebZ5ZWqUClR2DckXAQf4U0zVpRMsDwxNoo08aW9glHUm97fhlOtYlQsjMy8Dc3CRe3cjuvhsefBCAQHop49NL+xS8cOroOGEwlQ0VorfLNVskL9pZWo+4LSTuTk+mDJm8VDHmft630d4tlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MHwv2sl6; arc=fail smtp.client-ip=40.107.247.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o18Oec6Zf5a5EQ1u3gDha7UTBAZhhHVDbGdCZ5IY/MXckUw5LojrFrB9uHSvHlLhhqmi7QSHKy4rdyIzMzzO8LxgAAQsd+0iPZIcrAlLJVoHF7gfx95DJE+iXEF+0agDCsIubhytPDhRgH606bJKREoH4kDo1aH2JUDNuI83V7rB5nbH+EMDeNNVXKryomvdWa61+lYGrsiB3M5nV6n65TobtRQth5mEkVP56+SKfMB6i/a0RrlbyRDeZXlhB4CvGk6UekExhS7ctNOop8aaRZ7mKa5s4CF1//NvXa2Ej4PHBXwA2SCdnvnVtUdbEteflPKQOdt/XmCADh+VHJZPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18nnqiTqXjVZXBvDUb8nQoQmeR6zQavY6TC/4MOtbMY=;
 b=AGwjeLFmHo3IgNi5fqmOBV0qXBeSvfXs3P5uDoppN2U+X/4Qg4bTXv1fE3k35kf45sdI+l6vieVyCBvE8iq51IQZZEGLjoHxmrymY0/+GIfrnOXkxTmNx4cqApry4CpNG9fAYCcol5V0g3lGVANZTVN4q6cirkXw7XDdV97tHU66PyJ6zH4nP1TSoWmNA02nw9V5PIZ5I2TWDraVqQ2J3P5QRiJ66jD/jHqc404pavpbOg1iT2XkLtTEpsnfR0eBrO6uzsicWIHTLTswnNz2buE6IoeTs6uy3Rsubi4wXv2DNb5Tzg5d0hNdpLor0vc/cPQoeaBP86em0hj+epMF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18nnqiTqXjVZXBvDUb8nQoQmeR6zQavY6TC/4MOtbMY=;
 b=MHwv2sl6UnM9UiY/td0T8wTI0cgg5YLzuEJGLV8gHelue6jwnqoDs/8C4hiGa+bGueeezirDI08ZS2o32bLEQtGaLq9u5PX/mVOdXu5Oz9zdge+IRVDanZ+/Ymo3GjXfJsNfNqPrueCTUCvfOA5mBYEiSEkrdyn40mi0SoXpolvj7+ZMK0o0iZefUC6tOz9LOWmEYBhTwpoHubBU67FDWkRez9zK63ZkW6qy/1ASg6uUYcvzwMMU0pcPaNk9e4EUm1Eu/Lg6V/Tmiy5VZErC2MV3WcDCROhCwkWr8uoIoRbJw8E+KBsh8Vg4qHKLB9syXT8l0ftONTkLyDU7MeoFqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 13:48:01 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:48:01 +0000
Date: Tue, 4 Mar 2025 21:44:32 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250304134432.ss4yrda2gjo3f44i@hippo>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-4-xu.yang_2@nxp.com>
 <3342061.aeNJFYEL58@steina-w>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3342061.aeNJFYEL58@steina-w>
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 16cb0d41-3baa-4189-c6e2-08dd5b232df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1duVmpCUDVpYkpabU5pTEQvdEs3L0NMb1Bid0RJbGdlNkZHNitBZVBOR0hS?=
 =?utf-8?B?M2c5YkhoL0VqUlZrM1RuVmhPMSt1aitEODRQMHRvVmVyR1RXeE9yZFZsTG5F?=
 =?utf-8?B?RG8zcWdVaDBrZFFvaFlvN1RBa3FIcUY4QUxqM2l3OUk1QTc1eXF4eTVNUkNp?=
 =?utf-8?B?R08xazlNSmdnZzVtL3JZY2ZpdldwQ3FCSzJnRnJOZkoxeTNoeDJPYnkyTGM1?=
 =?utf-8?B?bUZlTE1YdkIvUW9xTUxOZGY5aGRoR3pYNkNYV05xQzFRYWI5Q3Y5bFBTV1hO?=
 =?utf-8?B?K1ZCU2YzZmxRTEJBVXZVODdvZXBldjc1RVJleHdFZFNGK08reVUxUllsc21w?=
 =?utf-8?B?aGQrT0tKbTlETzB6SDhzb3Vpd3BIZUlGNG5POEd5ZTAxZW1HaUpPZUlHYkk2?=
 =?utf-8?B?THVxTmJNd2hFMDlYTEVlNE9UeEZoS0lsaWhVT1JtaXhwcGZqTXo2WnRjSy90?=
 =?utf-8?B?eEtNL1hVT25uRkcrSVVRd0JSK21jaTl3alRMSHFCOWFRR3p5dUIrcEVzYVRl?=
 =?utf-8?B?R2xSSlNaSVhOVnRjWWlZai85dnhXc01nc2NWSDE2ZUUzWWF0UlFpN3VKTnpV?=
 =?utf-8?B?bXdvOHBuUmZmNG1HbkJMTUQ1K3phMXJHYmV0UXVHcTFrRFRyZThyMXZCNnRT?=
 =?utf-8?B?NHBRdWVwYmlFRUY0cG5namt2SGNnTVlhMkoweVNiMHdNRGZXVEVmZzltbVRp?=
 =?utf-8?B?VkZMMEhqVEhKVGVzeGpBK1FwdUhIOW5vYnpEbHRUWlNmYW1UK09VVGozcUFv?=
 =?utf-8?B?V0lHS1JaaS9RaEpHMzFBd3NIR2E4NjUvajFCTzBMRlFzZzZ4Vzc3ekR4UE1T?=
 =?utf-8?B?UmRWNE9xQUNuR0x1dFRlQVBnMU1OOXIvRWFnOFJDeEhLK0F4TzlTM25FZlFt?=
 =?utf-8?B?SkFQSC83KzNMVUU3VktnUFRVb3hZNTY3d3dMUjlLRXA5MDhXWHdvbTlrL2VU?=
 =?utf-8?B?SHZFY0lka3ZLemI3TVorYzFScmtjWUY4ZGpGdTIwRHpCTzd3REZFdGdWSHYz?=
 =?utf-8?B?blAzYldBVVgvSk9qMTFjZWRGeDFiTGpZcXl0RVdmaUhpdzd2WTVJZ25nTlMw?=
 =?utf-8?B?RXZvMjdvclJnVE5oakFqTldaSThnNkI3SSs4STQra1l0dUN5VU9rVExKS2kw?=
 =?utf-8?B?VHRlNnBqSld5dHdFSkUrVzJKNFVVM241dHhlSVZqUXVLbjVvRWFFSW1TVjk1?=
 =?utf-8?B?N3AxOWI2UjhGZnc0ejAya3FpV2xWaWwvT3hZaFNRcEg1SzBUbjdJa3dWeXJU?=
 =?utf-8?B?dkd4WHpxMS9kalNCU3FVUG14eWRjZk8zWThDZUw2aCtXV09GNTRNT2ZpU0tp?=
 =?utf-8?B?eGwraGZEbllxU05GWEdHdkVCYllaMHZFV3pORWNjanp3OWw3akY5T0RjeFd1?=
 =?utf-8?B?UkM2cWIzQlNoeGFkUWw1bVMrOVpCRzY2VXBqVm10dWNOaVNydjBwUzQvN3Za?=
 =?utf-8?B?NkN3RVRrcW5Xb1g2NmpBVlp5OVU3RkRzRER5Z1AvYzhOd2NvYXFVMFNGUjZF?=
 =?utf-8?B?ZnpxcWdzUmRPSlJuemVmWFJSNzU5amFjcERlMHFTdDEramN1QTBaaS8vRVdE?=
 =?utf-8?B?S29zWm1UWXZBaERaMHpRVERLRm85U0RnM0x1VGlNNnIwYmlJT3FYNi8wZGNx?=
 =?utf-8?B?cUhQdUNMVmVmRGJPTWZlY2ZEL0pxOG9iNVFxR2V3ek9xdTRGRlh3K1JUcDh1?=
 =?utf-8?B?RUc1ckFOd292c3M1MWg1SjY0dXlkRkkwbFpGMTBjSmNYVUVKMHB1NzZMQSty?=
 =?utf-8?B?RFJjZnU2QXpvOURhVE5nalhxVlErRmExM2RkaEd4NGNhSitJZHc0eFROSldi?=
 =?utf-8?B?c2ptaUpMSWdRVmVJNVZDL2ZMK05BN2tESFlxMzVzb25jOTl3VlhQQVFnUm1Y?=
 =?utf-8?Q?Cdcf2GboLkcXY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekEveW9GVnlEWExNOE5WOW0rMWw5Q0VEcVRBK2hsMnNnZkkrbFdyWVRlZExW?=
 =?utf-8?B?UEhNcFVCR0ZjR25tLzJEVGNTeHA2LzJGLzlMdzlJajI0NE9vcytXdVhhOHhD?=
 =?utf-8?B?K1VKNXR1RndoM0tFN0FSRUZScWJHWnUwdnRxR0ZKTG80elEzalZpMTlaVXR6?=
 =?utf-8?B?aTJtYWlFaVJxMUtXRGlkQnVyMU1wcDdKSTFHVzNOZDRZeHoxc09oWnJaK1hC?=
 =?utf-8?B?TjkxbmQzTy9SZ1FCeWtBbEJEYW9mcVNBL2ozbWhLZmdob1pZTmNvQmpidmVw?=
 =?utf-8?B?QTREVjZkeEk0Q3Q2cmhsajBkS1UxRldaSjR1a0NmSFFFZllyU3lTNGNRcWZW?=
 =?utf-8?B?MWJRcFdCQjVBNi90TVV3bkJqbXRCYzBsc0VnKzhaRUE4bFdkMkhPdDErNDRI?=
 =?utf-8?B?RWFmb21kTGcvZWljUEM1NVpUZ3ZzUk1IZnE2eEVvdXhUamxnQm10WE1DWWZP?=
 =?utf-8?B?MS9hejc1OHNWVlhLQkJNOGp2VFl5OWwzUjdoQTcwMk1sODlFTXh1T3ZMMTJv?=
 =?utf-8?B?OGlTT1NueW9CZjdDdWhncW9hZXRrRjFjV21ybFhubE5ZVlM2VlIxMmJoRmNz?=
 =?utf-8?B?bDN4L2poZlRReWlaSlJPMFBEU1dNT0l2VUpaMDh6VEdmdnNFTS85V1cxdXc5?=
 =?utf-8?B?bzlsanVLT1dDTjJCUkVIUEdkUkVjb0pnZ2xMZTBZZEtOUE1rSTZUTk5qSW1T?=
 =?utf-8?B?bmpjdVY0YXdrUEUrUm9FK2VxSlV5UVhLYzZNRm9RQzJxaFo3K01YQXEyT3Bh?=
 =?utf-8?B?WldSMGF2Znc3dWZpNlkwc1BEdkNmWmI0RCtxV0kzSDhtRjlKZDJPVlliejhE?=
 =?utf-8?B?dmY1QVNjUVhwby8wdHdaNDVSL3N6YndEU3U1QUdJQWhDU0RYeHJaZ01sVzRs?=
 =?utf-8?B?dXMrMzBycHVsQmNvblVPY0I3bXJoei84d0VhVGVwdUFpbXJDUWgxcW9CK3NH?=
 =?utf-8?B?eklCbWpEdU9ZNmdsaGxaZUJVZ2pETGRVcUUwSmVPNTQ2aFdmR3QyQytGejh2?=
 =?utf-8?B?TkRYSDVwZGxlc2JwakxjbmVhc295bm5zdmE1aVZ6V3UzM0wraUNaSVFxdXQr?=
 =?utf-8?B?angxc1U3TE10VHZRUlVKK2dvNnZoV2lHeGd4UmF3VDZCN3p1OHNHUXFVeHhL?=
 =?utf-8?B?ZE45OGFLcStORU5pa0g4cE5lWDNvc3dtZTA0K0JKTUFlRzhTei8xeEtGRzVo?=
 =?utf-8?B?YlloWWJ0alNnWGRFRm5wMkVWY1pQYnVwR3dIeWdwWUFWMGFxc2gxalVFWkNB?=
 =?utf-8?B?UHZqTFJOSEE0MkFJdFFwSklaUm5wV2YyUFVNVytOL1BtU1RtNmNkVmZuYzVj?=
 =?utf-8?B?WFk3N2s1NHVwbXIxeUIrL1kzbW4yR2paOGtEVDUwNVU1Rit5WC9TQTlWVnMw?=
 =?utf-8?B?bWxBdW9UREt1RE00cHEvOTlnT2k2WVZScmpDcURmNkhFNXNIeG9iYitodmFS?=
 =?utf-8?B?MWErYWp3MUE0ZWdHV0xVOEl2VUV5UTMvd2Y5Y0NVN3E3VlQ3SEZGSDlaVjhl?=
 =?utf-8?B?MWpvZG1zKzBhN0xYOTlpcHNCcUdxeklXV3VYcHpxN1VCZ283aUtFMG16VGww?=
 =?utf-8?B?R1gxVG5PMjNEeWdNSUNkTGp5cUNKMzNXUDdOUWp0TVEwTnV2aVJ2WGlzdUpZ?=
 =?utf-8?B?enM5OHdNUC9LUVZhKzBYUzk5MDBwNGhOZ0Nlb1c1TlljWFpybDgwNGhhYnNn?=
 =?utf-8?B?dFNTKzdVVzhpb0dLMnZ1a1owY3VQT0ozdzF1ZHBmdzYwcm11YWNqV3NkODNx?=
 =?utf-8?B?L2N2R2IrV2tZL2dpMitxaWY2anllVStnL0xFWGhjcVVQMGp1dDBHbTM0QW04?=
 =?utf-8?B?RlV2ZU9NUXJSVWNpNDJGMmZRWm92ZDZYYXU0RUd3QXVkcXljOHVsNXNGdUJs?=
 =?utf-8?B?Z2NDaFUwamVnSDZjVUN0YnYwVVlQcURCeWljck96cjNSL1VwaXdVbDJsOGFy?=
 =?utf-8?B?OEEzVFNoeFVvOWhIT3IwMDZrU0M1OE5oNjVhMlArdnl1amNqSHUwYXRUM2Z1?=
 =?utf-8?B?N1pFZzBKRXhaRmRWaGtORHVvQjRKK2FaNWtBZUZvUkZIb0huV0duSWxVbVRm?=
 =?utf-8?B?S1M1NmFML2xYWTFSMzVMZmIwSEY0U0tLRWdORmszNFNkcWE2VnA3djZXQUZ3?=
 =?utf-8?Q?Cf0hIV53rvW8cLX2/dfhJ5YO/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cb0d41-3baa-4189-c6e2-08dd5b232df5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:48:01.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUnSDfUh8y5PoQlihQiVxqN7gvU7Qm1wiJ9nhHomdr0Yuyw3vggcBgqN9tCV3WDTpkozs7f7zQjkfw5s8xw2mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

On Tue, Mar 04, 2025 at 10:50:06AM +0100, Alexander Stein wrote:
> Am Montag, 3. März 2025, 04:33:41 CET schrieb Xu Yang:
> > In previous imx platform, normal USB controller interrupt and wakeup
> > interrupt are bound to one irq line. However, it changes on latest
> > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > This will add wakeup interrupt handling for i.MX95 to support various
> > wakeup events.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> > Changes in v4:
> >  - warning if no irq provided for imx95
> > Changes in v3:
> >  - include <linux/irq.h> to fix possible build issue
> > Changes in v2:
> >  - rename irq to wakeup_irq
> >  - disable irq by default
> >  - enable irq when suspend, disable irq when resume
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 35 ++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index 1a7fc638213e..2baae9e6e673 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -6,6 +6,7 @@
> >   */
> >  
> >  #include <linux/module.h>
> > +#include <linux/irq.h>
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > @@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
> >  	struct clk *clk;
> >  	struct clk *clk_wakeup;
> >  	struct imx_usbmisc_data *usbmisc_data;
> > +	int wakeup_irq;
> >  	bool supports_runtime_pm;
> >  	bool override_phy_control;
> >  	bool in_lpm;
> > @@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> >  	return ret;
> >  }
> >  
> > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > +{
> > +	struct ci_hdrc_imx_data *imx_data = data;
> > +
> > +	disable_irq_nosync(irq);
> > +	pm_runtime_resume(&imx_data->ci_pdev->dev);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  {
> >  	struct ci_hdrc_imx_data *data;
> > @@ -476,6 +488,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> >  		data->supports_runtime_pm = true;
> >  
> > +	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> > +	if (data->wakeup_irq > 0) {
> > +		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> > +						NULL, ci_wakeup_irq_handler,
> > +						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > +						pdata.name, data);
> > +		if (ret)
> > +			goto err_clk;
> > +	} else if (device_is_compatible(dev, "fsl,imx95-usb")) {
> > +		dev_warn(dev, "wakeup irq is missing\n");
> > +	}
> > +
> >  	ret = imx_usbmisc_init(data->usbmisc_data);
> >  	if (ret) {
> >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > @@ -584,6 +608,7 @@ static int imx_controller_suspend(struct device *dev,
> >  	}
> >  
> >  	imx_disable_unprepare_clks(dev);
> > +	enable_irq(data->wakeup_irq);
> >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> >  		cpu_latency_qos_remove_request(&data->pm_qos_req);
> >  
> > @@ -608,6 +633,9 @@ static int imx_controller_resume(struct device *dev,
> >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> >  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
> >  
> > +	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> > +		disable_irq_nosync(data->wakeup_irq);
> > +
> 
> if (data->wakeup_irq > 0) is necessary. I'll get a NULL-pointer
> dereference on imx93.

Okay. Thanks!

Best Regards,
Xu Yang

> 
> Best regards
> Alexander
> 
> >  	ret = imx_prepare_enable_clks(dev);
> >  	if (ret)
> >  		return ret;
> > @@ -643,6 +671,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> >  		return ret;
> >  
> >  	pinctrl_pm_select_sleep_state(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		enable_irq_wake(data->wakeup_irq);
> > +
> >  	return ret;
> >  }
> >  
> > @@ -651,6 +683,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> >  	int ret;
> >  
> > +	if (device_may_wakeup(dev))
> > +		disable_irq_wake(data->wakeup_irq);
> > +
> >  	pinctrl_pm_select_default_state(dev);
> >  	ret = imx_controller_resume(dev, PMSG_RESUME);
> >  	if (!ret && data->supports_runtime_pm) {
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 

