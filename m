Return-Path: <linux-usb+bounces-33092-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ+CECwog2kxigMAu9opvQ
	(envelope-from <linux-usb+bounces-33092-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:06:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B52E4E63
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 12:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D7263014BD9
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 11:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB0C3E9583;
	Wed,  4 Feb 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WW7SmPVx"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8233E8C66;
	Wed,  4 Feb 2026 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203129; cv=fail; b=SilbuXOBb6kaYklr+kVM1bI+3nhcz9WX1DvZk3t4b+Mz/HUkaPffCs/1PtxYQYjnVybXm1UJwIWfGySFmFHJSWzeWZCjsn7PeDLQAEgrrbUu37pjzRLuzHZELYBX0io2qxIO7U2CXdBwgsXm5pkj1jXjatWVDBHj5EjTX8EED6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203129; c=relaxed/simple;
	bh=3+PXuM6phdsbIfffq4RPjwv2H/1YnHZDeTiasz7litU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TtLhXLS8TeiivNsVO5fGk1p4l7ICiUIkmyWlbHdtP/JwLTWJrrWIJ5We6raql5tzGtrcvagUr9DzuatNocdcgylJMVdry3JQnSsnP35FrKApP3/F3cDX5fHUC5b0olD9OLvzciPYiDYvUqhCJeF9zy/MC1Ta3nfXRFXnRDmp9XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WW7SmPVx; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syj7fWWZas31dwVh5BzPBrYidzVQNdd4F9rXsye1nzk65GJco0CwbRhEUlR0LTQRJMgSLMvRKwIAXX+WduFoDxuNtbNG4uFXWLWITMwumXsl14VNaeFatE3hJGy/g0tLC5L0UTVHUXCrhoUNaZr8Wtbdxw84BWSmi9jmLrZaSPYBVzluWS2TuE2+0GARSybMiIiSnJZ7e4yMPLyApZ/2UBOzWcEqw7ZOX7UC7rw3RvZ5H/F4Nf81jzLwnnA6Xc/IY7SAt+ZqPipGWCvLrXnekjSVKJuKNuNNX/3PRAVX6anYCi4FA4mhhx+DQ53+UrBXGCS/E4GmPyh8hf0YbsL6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lv0BSmv+3pshiotSAwMKsk8HyHM/SAVlrXKt2KNYUrQ=;
 b=E3IHftIlTuQ5FbEkinHQSJiEWnb7yQjHnE/eb2xYyrpVJtBheM3ZfrXD9GnLsk6x9yOKY3Xj+KTLpGQvshnnLNDDDmj7+yGmf81jIZhonHxMybHQRkf83tV10qHjWKOAnRXsMb9xM+tWfbFxMH4sdm3S9rjpkmJwdUM3CEg6781o78LGIY/2kAE4NCrF9aBczTOuXK4Mk9jfPuqR3WG5ju/fJBOjYGe1HvTKRzFj/qk03Vnk0Tn76q6hqe1jWDb5LQAojix5DX3ZD/IPno49DvpljF+ZbsB575gesruFsQ/sZ59/fUX+wPZr/dc2s8oVndUdE9qlhDO1T3IKKnAP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv0BSmv+3pshiotSAwMKsk8HyHM/SAVlrXKt2KNYUrQ=;
 b=WW7SmPVxP0wT+RBkvNrS6P+lXRrg0oGFRHop3ZwRhB1oUOUHyjWs2XzdCt3HE7r54H4AtSy4HEAurULd1i8X8viHjNhRiHB0GOVsT90NdKzaF5qvr0DeLVcYaK8JGkoEOfh+jq4M9g43AdmJ2uhB/sLLMT0f6q4A0lvCKGX9Yl+RCr14cYnKHbpC9fYZFR4HzLglgwGO37GfvvXcu8SZ+iT7/e6HvcgoEFczk+J+ovi2hdus4acwk3rRfkHfw0OAaku2r7LvhLPrzYLmeVy8E7r+q0blSC+Hqh8nHl1smXrl6KBTjYx6gQyWZSmPJAgCTENuJbqtGv0mgnJLq11hbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB11303.eurprd04.prod.outlook.com (2603:10a6:150:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 11:05:19 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 11:05:19 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Wed, 04 Feb 2026 19:06:18 +0800
Subject: [PATCH v2 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-3-d2c9b5a58c01@nxp.com>
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
In-Reply-To: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770203208; l=14727;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=3+PXuM6phdsbIfffq4RPjwv2H/1YnHZDeTiasz7litU=;
 b=EmWt18NLPtWhQXmzg0AmvK4pOydSj2isovs7EgPVO9kmnd0SlEc0yGpy6kx5/ce8k2k7EK2J7
 C4BpikN7OGQBZdvtN5f1XZnaGJ9R3sog5RivT8Jwf/KoT3lYul8sySU
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB11303:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc1689b-5df9-427a-3e47-08de63dd48ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTFkTUVlTHNVNE9ZdFpoL09hbEJmcURjandxWTVmbk1oT0FHTnRJd0dSS3hC?=
 =?utf-8?B?YnA4ZEFPZmd2cjJTMGRUekJuMkY1SFMzemQwSE1La1h1NFlCVjY0VUgvM25l?=
 =?utf-8?B?WGR0V1Nxd2hzSlp3a2Y1OHA4TDFaZjhMVzlZRnNDVjc4YjJhMkNiSG9uazNB?=
 =?utf-8?B?cjlEQWszVU13OVU3d0taQmpMUnBwS2Y0TVZtSEEzWnRhS3d2SS9raGthV3JH?=
 =?utf-8?B?V3F4SFhhWDJnTXFkWU1xYWw1b1lQUmUyaUV6RVVYVVhmamIwalNBeW1PNFAv?=
 =?utf-8?B?MlFqdmUzOXcvYlRLQldIUnRjVXhEQU1YV1VnNkJiaGEwUDFKbU9RZ1FIWkU0?=
 =?utf-8?B?UEtZWTNrdDhvOVYwcmcwa20vMFFnZ09aaE9UZ1hLcTkvaHJlN1dPYXNOWDVL?=
 =?utf-8?B?V1MyNnNtZ1NFUU0rVWYxY1FCVGpvaHMrYjdxMVpWenJWd2V6S2F0OEMzTlJQ?=
 =?utf-8?B?RlNCU1FBaFZSZytHWERSRU5HdnllWVBzMUs2VU14OUxWTHkyaUo5OExoZnBS?=
 =?utf-8?B?bmJqM1NwMnIzVHpOL0pJSWVyL0M2QU51aHRBczBRZVBpYlVocEhUUTRWWnFk?=
 =?utf-8?B?d002bWgrNGVRVU12WWtERkhuU2xJL2dIcnFqODdXRXRRWStoSnFweUhnZE5Y?=
 =?utf-8?B?ZHFybUZzZWJvdjZvYUoybW92ZzlUN3hJNlArMk5mOWtWQjZvN1VubjRpZUNa?=
 =?utf-8?B?NUNhU2RmQ0prcG5OSkZjTEpORnlybHFpWUdtREVaZ1FUQmFEdTdmbEg3a08r?=
 =?utf-8?B?QW8raERZVWNuVDlTcTVmN1JtdzhoUDBtdWhJZEdhT2xoU2JrQ3RncUQ5Zm4v?=
 =?utf-8?B?YlFLR0tiVkxvMGMxUitJaHd0ZytKU1c2OVZxN05Zb25ZWmx4YzQ2R2FHdE1O?=
 =?utf-8?B?TklYSlVwT05Za3dpODdCUTlZVGloSndUbHBxSW82QTlUZmN1c1ZHNWk0ci8v?=
 =?utf-8?B?ZFlNVG00aFFKWmk2NjBkZDJjcXZNMjZVQklqSytLaXpvdDRIU2NraEE2S1Zj?=
 =?utf-8?B?Z0J0ZEEzRnVaZ0FuK05aeFIrS213SERoQ1JUTkFrelA2VmNtMEl1dVhlYjhJ?=
 =?utf-8?B?TElHVzc3a3B4dnpaMlVVL2E5cVVjM1FSY1A2ZUhxZEhCSDN5L2tKc05mUTJJ?=
 =?utf-8?B?Y25WVjdKb0wvR0VIQkVpSWRzY3lGczRvZVQyWjk4TVZjOEpUVnRldzlZRFJj?=
 =?utf-8?B?TThmT0xaWVJXZUZmZmh6Zk4vK3NZMjZFM2E5d09jV3hNckN0Q2dTNXArL0tv?=
 =?utf-8?B?Q2RnaUVidkJGVUd2a2FkYnR6NW1YUUpKeVNSditBaWx2a0drSVJDNHNzMTly?=
 =?utf-8?B?bmJ3V3crem1GNVhmTjVtaWdiQlZiYWhoVUJ4bitsS2ltQ05WVUhRSjkyaXMv?=
 =?utf-8?B?TGwzNzNscjdHTEtUcjhlUDBaMldaMjlDNnQyZ29CdUJaRHVwaG1Wcnd4eFZN?=
 =?utf-8?B?ODNCOXlNNFdGRTUxSW9KdjNFYWsxVWtBK01UendDcUt6Q2krRXFTb1VKUFBj?=
 =?utf-8?B?aXhxYVY3bXFtcHVoZGU1dEpmejA2blZOcDNrOEF2QXlmRHZHWWpzWFZLODIy?=
 =?utf-8?B?NEVXN2hNcXUzN3hZK0NwOXFZWEZTL1lwZW5jQkp5Z25kc1gxVlRiLzdobWhw?=
 =?utf-8?B?TjFPM1F2ajQ0cEx1RWFrT0JxdkVWR0NOem9kUUdkRlNsalBjTHVpUHg2QUh0?=
 =?utf-8?B?N29PVENCTThzaDYxcTMxbURVbUVLZ2M3RHVySFpNYjQwYU5IV1YwZ1BYdjl1?=
 =?utf-8?B?djRlZUhKUkdIL0c1bG11aWswVDJMQlA0Y1hqZ3BrRG93bnoybTFaVGovNU9S?=
 =?utf-8?B?UUtBdlRKakFzanl6V01pUU1iVjdzSTMvWFVaL3FqRm9NZ2lPWU5IVUh2VzFS?=
 =?utf-8?B?N0VmcnFrcTBrdXkrN29IcitUV2ptelRhTUhwbDRRZ3BiNlhTenB2ZEFEUVcx?=
 =?utf-8?B?ckIrYjgzZmdGU0NPajVHMWd6dFpSU21iZGxLVEZoa29KMmlwR1J0ZDU2SGxB?=
 =?utf-8?B?Um1FKzE3ZTY4bitpYzBuYUwvYk1ncGFsVEVDQTRFOVJGUWpOb3J5ek1qazNp?=
 =?utf-8?B?Yk9kNlBpTVhIUWF1cmtLTnlERFVZZ21UN1VSaXZNR0QzeStQMlFZazFxMzFt?=
 =?utf-8?B?VC9UN3paeE9QR1JDbHh0aDdKNlpxMEs4MjdYZDVXWVJSbkd1bWxXMlRxQUUx?=
 =?utf-8?Q?Tz3Y83wyQpvQ9EDxwfEULHL6MPCMX6YeeccSht1KitDm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDFncnZ2SGs0QkRMaVVyUzVrd3BHaWRhaThMem4zUmtnUEF6Sk54enBYS01n?=
 =?utf-8?B?bGR5ZmNJU0l5UDFLcmpNai9hck5peCt2YXFIYVdla3N5cVZyUXpnVURsaGhy?=
 =?utf-8?B?NUl5MEIzNEpQc2pjZTNjQTV3bC9rTVROb1luSzMvTHl4Umd1RXMxWkF2Witz?=
 =?utf-8?B?Zmd5ZWNNWlBMOHNpTis2YTZ4SnMwWmYwdTRTbmJJWWd6eWZKRUhoTzdpL1Nx?=
 =?utf-8?B?ZVhsQVVHRGJLSUtIc1prT2gzeFVTN0FySEhpRjVXNmUyaUNCVHZ1QUpsRUJ0?=
 =?utf-8?B?UHJzSUYxdzU2bGVTVUY2NFhFRmlORmROVm4yZGtBMnF4OFZGYWE4cWp6czJR?=
 =?utf-8?B?czNuLzlTRTBoSDhDelhGZmNCaEdINkVYeDU0MDUrR05pY1Npazg2S3R6dmxS?=
 =?utf-8?B?ZjUvQzJWc1JEWlBMV0NTRE54Tiszd1A4Qi9nVzBFcEJIYnVDdWdhMkRLaWFC?=
 =?utf-8?B?RDI4VStLM28vOHY3Z3dLQlRpQ1BUQ0N1VXdMK1RxWTJHVDBhY25Sc1NtSXMx?=
 =?utf-8?B?ZkEyOGVJYlBHWDlIbkVTemZOdlNCMXFtRTcyWUlYUEloSTczS2wrWmZqNnBG?=
 =?utf-8?B?S3lyMjVYb0RLN2NyYTAyckRmTVlqd0l4N2c0bHFDU3hyM21tKyt0V0dDUnFL?=
 =?utf-8?B?ZXlHbkFvWGx4NUdydWdxV3F3UFQ2aUo3MmNORW5qelZ2Y1VHNEFQOGJ6cGdw?=
 =?utf-8?B?QThZcnZXenFzM0RZK1Z5eTVFUUpvdStRdjFvaWNmN2Z6bEMxVTkveXdPTkRU?=
 =?utf-8?B?QXgrQ01JeVlLZ2JVcE5EVjlWSzkvUDE2VEd1eG5QVGMzYmphNllveVlLZXlR?=
 =?utf-8?B?ZEhENWJTZVd4OXhOS2JrQ0I4WENIcFptQlBJdEJCSUQyRVpZa0ZqR3R5VStH?=
 =?utf-8?B?OEVtWGplZXlGY2tpc1RWMXVXdkp3SjdXb3NnUUlnZk45a0pQTWo4OGRsOFJY?=
 =?utf-8?B?ZG5sUEh3aWNmTURMcU05aHQ5aTJ6UUxiUVc2S2VHRnUwY0xZdVNxVjd4OTVz?=
 =?utf-8?B?eW1sUFhDa2VKSGUxdzJ2VHpJdmF0OUpqSkZ2enhXYkhaNTJjdmRzL01jRkpl?=
 =?utf-8?B?LzNnOCtzNzZVendLOHNERm10aExRKzY5dmIwb3BPNVV4clJsbFh0Ly9tT3M4?=
 =?utf-8?B?dTBFbSs3LzNuUG11NjdFK2JyVUdWM0NESlg4NDdxUFdJNFZmeDAwd21QWUlI?=
 =?utf-8?B?YjF1MXZkWmYwbk9ma0QzbE1UZWVNb3VYTUs3bUpRMzh3WWRWSWJyWXMzNk1W?=
 =?utf-8?B?STQ0TGNGR1RGemhvMzJsVG9uZHhnVS9ud0VVbEFPamFmcm1IbXJPaHd3QjZR?=
 =?utf-8?B?eE5VZjcwTjltVDdRKzZHNkZaQVZMQ0FibFJsRkVSdmpEYkx0S05aYnljamR5?=
 =?utf-8?B?bTI4ZWsxVktMRytmQldMOFVzcDV5T2JGd3JmWU12OUVBTVJhcDQ1TzN0WmxJ?=
 =?utf-8?B?eVhXMk1ZMGlyWHBSbWlyR2JhU2FValB4MDZRSXBPRnh4OUxMYnNZNFB1QXlB?=
 =?utf-8?B?YXhJRzZKR01uOCtLZ3dnZ1dPVGFmYk56aXlIOUREN2xoNWx2UFFBK0xqNjVq?=
 =?utf-8?B?K3pwandGSE8yYWx3anV4anZObTdtM1lPNGJ4aE1TQkg0T05UYkh1N3JFZU1B?=
 =?utf-8?B?aVZvaXFaNTN1Um9PUlVQVDR5ZUdtL1p6L3VFcnBSMzRJUTV1ZFR3V1NiRGZW?=
 =?utf-8?B?NTdPZ1J1YW9YT05hcVZaWjR6VzRjeDc0UzRTZ2RaVUZBV3RkUVFxZ00rR0NV?=
 =?utf-8?B?Q0hNWWZwb21jN1l3VncvRzNVMU1TQVpLWnJpaGRNUlU3NHRDVWxrNjVGTWJh?=
 =?utf-8?B?aEpmcVRTYmxORFM1VWgveFlGVXQzMVRjM1dLSml5VUVMKzBFaU1PTU1LYytw?=
 =?utf-8?B?NnJheWViMmVTQkRRSldXR2FxTE02R29ZVHdpKzVGSWQrV2p5S2NqOEw4ejB0?=
 =?utf-8?B?MEE2RDFwMDJHUHVEWHRONXlCSFQ2c0pMYVphRytJRU9EUHBoTi8vaExnYUNt?=
 =?utf-8?B?RGhNZVNFUWEyemNEaVpQRlc5bXVZTGQ0OUtEeHlwT2FXUzBIaTVuZGI2WlAw?=
 =?utf-8?B?TWhhUXhDS2M3eWd0emVldVJBWFZ1ZHYrdmlDa09OT2p5MUJGMHJIOUNrVGtw?=
 =?utf-8?B?cExiZmswT24zL3huL09kN3A1VGxsalRwNFlQbnQ0WWNxQlVuZDJzV2d4bGlF?=
 =?utf-8?B?VFovYzlkcldGQjVKMXY3anZNeHBjaDJqSngxZUt3RFl4Y08wMnQ3ZnJ3QzFP?=
 =?utf-8?B?SDZBRnorMHg2cGpVUDVVNVZ4UWo1QXVuZmMxb0xXd0VBeFMxVHQ5OG84R0FG?=
 =?utf-8?B?YmFJM1IrT1VJcjh6V3o1VkkxZThOZjdqNTY5cFBWMitkTVpXcUNodz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc1689b-5df9-427a-3e47-08de63dd48ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:05:19.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+flr0oyuTR9gQzdB6Ra0ok0DN0GFnHkzJEiT3FQmBHagc+nNWrV7/MpIT54c40nveuyy7D7lLFdqfZo5BcMxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11303
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33092-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid,probe_data.properties:url]
X-Rspamd-Queue-Id: 70B52E4E63
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation. To support the flatten model devicetree, DWC3 USB core
driver already support to directly register and initialize the core in
glue layer using one device. And many notification can be received in
glue layer timely and proper actions can be executed accordingly.

To align with mainstream, introduce a new driver to support flatten dwc3
devicetree model for i.MX Soc. Besides this driver disabling wakeup irq
when system is active, no other function change in this version compared
to dwc3-imx8mp.c

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - fix code style
 - add IRQF_NO_AUTOEN
 - remove pm_runtime_* in dwc3_imx_remove(), dwc3_core_remove()
   will do that
---
 drivers/usb/dwc3/Kconfig    |  12 ++
 drivers/usb/dwc3/Makefile   |   1 +
 drivers/usb/dwc3/dwc3-imx.c | 430 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 443 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 240b15bc52cbd5d5c9d08d9fddd8c63202de1a3c..18169727a413ee72405a89f477e4da16946e1764 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
 	  functionality.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_IMX
+	tristate "NXP iMX Platform"
+	depends on OF && COMMON_CLK
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
+	default USB_DWC3
+	help
+	  NXP iMX SoC use DesignWare Core IP for USB2/3
+	  functionality.
+	  This driver also handles the wakeup feature outside
+	  of DesignWare Core.
+	  Say 'Y' or 'M' if you have one such device.
+
 config USB_DWC3_XILINX
 	tristate "Xilinx Platforms"
 	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 073bef5309b5b5d381c8c4690221091b4df7904a..f37971197203e1379d554da9d60860360ea9c3fe 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
+obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
new file mode 100644
index 0000000000000000000000000000000000000000..404ab644ff86dc103114862232c47e5c3f75c8ef
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
+ *
+ * Copyright 2026 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "core.h"
+#include "glue.h"
+
+/* USB wakeup registers */
+#define USB_WAKEUP_CTRL			0x00
+
+/* Global wakeup interrupt enable, also used to clear interrupt */
+#define USB_WAKEUP_EN			BIT(31)
+/* Wakeup from connect or disconnect, only for superspeed */
+#define USB_WAKEUP_SS_CONN		BIT(5)
+/* 0 select vbus_valid, 1 select sessvld */
+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
+/* Enable signal for wake up from u3 state */
+#define USB_WAKEUP_U3_EN		BIT(3)
+/* Enable signal for wake up from id change */
+#define USB_WAKEUP_ID_EN		BIT(2)
+/* Enable signal for wake up from vbus change */
+#define	USB_WAKEUP_VBUS_EN		BIT(1)
+/* Enable signal for wake up from dp/dm change */
+#define USB_WAKEUP_DPDM_EN		BIT(0)
+
+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
+
+/* USB glue registers */
+#define USB_CTRL0		0x00
+#define USB_CTRL1		0x04
+
+#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
+#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
+#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
+
+#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
+#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
+
+struct dwc3_imx {
+	struct dwc3	dwc;
+	struct device	*dev;
+	void __iomem	*blkctl_base;
+	void __iomem	*glue_base;
+	struct clk	*hsio_clk;
+	struct clk	*suspend_clk;
+	int		irq;
+	bool		pm_suspended;
+	bool		wakeup_pending;
+};
+
+#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
+
+static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
+{
+	struct device	*dev = dwc_imx->dev;
+	u32		value;
+
+	if (!dwc_imx->glue_base)
+		return;
+
+	value = readl(dwc_imx->glue_base + USB_CTRL0);
+
+	if (device_property_read_bool(dev, "fsl,permanently-attached"))
+		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
+	else
+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+
+	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
+		value &= ~USB_CTRL0_PORTPWR_EN;
+	else
+		value |= USB_CTRL0_PORTPWR_EN;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL0);
+
+	value = readl(dwc_imx->glue_base + USB_CTRL1);
+	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
+		value |= USB_CTRL1_OC_POLARITY;
+	else
+		value &= ~USB_CTRL1_OC_POLARITY;
+
+	if (device_property_read_bool(dev, "fsl,power-active-low"))
+		value |= USB_CTRL1_PWR_POLARITY;
+	else
+		value &= ~USB_CTRL1_PWR_POLARITY;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL1);
+}
+
+static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+	u32		val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
+		if (PMSG_IS_AUTO(msg))
+			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
+	} else {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
+	}
+
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
+{
+	u32	val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
+{
+	struct dwc3_imx	*dwc_imx = data;
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	if (!dwc_imx->pm_suspended)
+		return IRQ_HANDLED;
+
+	disable_irq_nosync(dwc_imx->irq);
+	dwc_imx->wakeup_pending = true;
+
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
+		pm_runtime_resume(&dwc->xhci->dev);
+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		pm_runtime_get(dwc->dev);
+
+	return IRQ_HANDLED;
+}
+
+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		/*
+		 * For xhci host, we need disable dwc core auto
+		 * suspend, because during this auto suspend delay(5s),
+		 * xhci host RUN_STOP is cleared and wakeup is not
+		 * enabled, if device is inserted, xhci host can't
+		 * response the connection.
+		 */
+		pm_runtime_dont_use_autosuspend(dwc->dev);
+	else
+		pm_runtime_use_autosuspend(dwc->dev);
+}
+
+static struct dwc3_glue_ops dwc3_imx_glue_ops = {
+	.pre_set_role = dwc3_imx_pre_set_role,
+};
+
+static const struct property_entry dwc3_imx_properties[] = {
+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+	{},
+};
+
+static const struct software_node dwc3_imx_swnode = {
+	.properties = dwc3_imx_properties,
+};
+
+static int dwc3_imx_probe(struct platform_device *pdev)
+{
+	struct device		*dev = &pdev->dev;
+	struct dwc3_imx		*dwc_imx;
+	struct dwc3		*dwc;
+	struct resource		*res;
+	const char		*irq_name;
+	struct dwc3_probe_data	probe_data = {};
+	int			ret, irq;
+
+	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
+	if (!dwc_imx)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dwc_imx);
+	dwc_imx->dev = dev;
+
+	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
+	if (IS_ERR(dwc_imx->blkctl_base))
+		return PTR_ERR(dwc_imx->blkctl_base);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
+	if (!res) {
+		dev_warn(dev, "Base address for glue layer missing\n");
+	} else {
+		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(dwc_imx->glue_base))
+			return PTR_ERR(dwc_imx->glue_base);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
+	if (!res)
+		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
+
+	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
+	if (IS_ERR(dwc_imx->hsio_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
+				     "Failed to get hsio clk\n");
+
+	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
+	if (IS_ERR(dwc_imx->suspend_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
+				     "Failed to get suspend clk\n");
+
+	irq = platform_get_irq_byname(pdev, "wakeup");
+	if (irq < 0)
+		return irq;
+	dwc_imx->irq = irq;
+
+	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
+	if (!irq_name)
+		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					irq_name, dwc_imx);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
+
+	ret = device_add_software_node(dev, &dwc3_imx_swnode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add software node\n");
+
+	dwc = &dwc_imx->dwc;
+	dwc->dev = dev;
+	dwc->glue_ops = &dwc3_imx_glue_ops;
+
+	probe_data.res = res;
+	probe_data.dwc = dwc;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+	probe_data.properties.core_may_lose_power = true;
+
+	ret = dwc3_core_probe(&probe_data);
+	if (ret) {
+		device_remove_software_node(dev);
+		return ret;
+	}
+
+	device_set_wakeup_capable(dev, true);
+	return 0;
+}
+
+static void dwc3_imx_remove(struct platform_device *pdev)
+{
+	struct device	*dev = &pdev->dev;
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+
+	dwc3_core_remove(dwc);
+	device_remove_software_node(dev);
+}
+
+static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
+		dwc3_imx_wakeup_enable(dwc_imx, msg);
+
+	enable_irq(dwc_imx->irq);
+	dwc_imx->pm_suspended = true;
+}
+
+static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	dwc_imx->pm_suspended = false;
+	if (!dwc_imx->wakeup_pending)
+		disable_irq_nosync(dwc_imx->irq);
+
+	dwc3_imx_wakeup_disable(dwc_imx);
+
+	/* Upon power loss any previous configuration is lost, restore it */
+	dwc3_imx_configure_glue(dwc_imx);
+
+	if (dwc_imx->wakeup_pending) {
+		dwc_imx->wakeup_pending = false;
+		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+			pm_runtime_put_autosuspend(dwc->dev);
+		else
+			/*
+			 * Add wait for xhci switch from suspend
+			 * clock to normal clock to detect connection.
+			 */
+			usleep_range(9000, 10000);
+	}
+}
+
+static int dwc3_imx_runtime_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	ret = dwc3_runtime_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_AUTO_SUSPEND);
+	return 0;
+}
+
+static int dwc3_imx_runtime_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	dwc3_imx_resume(dwc_imx, PMSG_AUTO_RESUME);
+	return dwc3_runtime_resume(dwc);
+}
+
+static int dwc3_imx_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_pm_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	ret = dwc3_pm_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_SUSPEND);
+
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(dwc_imx->irq);
+		if (device_is_compatible(dev, "fsl,imx95-dwc3"))
+			device_set_out_band_wakeup(dev);
+	} else {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+	}
+
+	clk_disable_unprepare(dwc_imx->hsio_clk);
+
+	return 0;
+}
+
+static int dwc3_imx_pm_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	dev_dbg(dev, "at %s\n", __func__);
+
+	if (device_may_wakeup(dwc_imx->dev)) {
+		disable_irq_wake(dwc_imx->irq);
+	} else {
+		ret = clk_prepare_enable(dwc_imx->suspend_clk);
+		if (ret)
+			return ret;
+	}
+
+	ret = clk_prepare_enable(dwc_imx->hsio_clk);
+	if (ret) {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+		return ret;
+	}
+
+	dwc3_imx_resume(dwc_imx, PMSG_RESUME);
+
+	ret = dwc3_pm_resume(dwc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void dwc3_imx_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_imx_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_imx_pm_suspend, dwc3_imx_pm_resume)
+	RUNTIME_PM_OPS(dwc3_imx_runtime_suspend, dwc3_imx_runtime_resume,
+		       dwc3_imx_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_imx_complete),
+	.prepare = pm_sleep_ptr(dwc3_imx_prepare),
+};
+
+static const struct of_device_id dwc3_imx_of_match[] = {
+	{ .compatible = "fsl,imx-dwc3", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc3_imx_of_match);
+
+static struct platform_driver dwc3_imx_driver = {
+	.probe		= dwc3_imx_probe,
+	.remove		= dwc3_imx_remove,
+	.driver		= {
+		.name	= "imx-dwc3",
+		.pm	= pm_ptr(&dwc3_imx_dev_pm_ops),
+		.of_match_table	= dwc3_imx_of_match,
+	},
+};
+
+module_platform_driver(dwc3_imx_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 i.MX Glue Layer");

-- 
2.34.1


