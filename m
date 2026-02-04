Return-Path: <linux-usb+bounces-33079-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK8SOjLhgmnhdwMAu9opvQ
	(envelope-from <linux-usb+bounces-33079-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:03:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82951E22D5
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 07:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 640B83051A8F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 06:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292DF366DB8;
	Wed,  4 Feb 2026 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fmeAmDOM"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258B3112AD;
	Wed,  4 Feb 2026 06:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770184961; cv=fail; b=nOBbTNYuHXy0m14txbL8NsWJMkzvC0Xl9YlXRydbDOII5yjm7exjInM8TH93+TK0ElgkPZXOkJbwVxSRrqTu0iOznImgyHRFThui9LdkxPKe3ozH302wVPnYlcxHpCsH5nAvUEeZgw6nhDmf+C6Im5hlaVtfSfNTw15IL5+XkbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770184961; c=relaxed/simple;
	bh=9kLwFmJ+uv/O5Xt8GOsDYfwVHTcmv6eeLjf6I4VEmr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PJjLMc1HB0OTbIQ4tK8gdVBdsMSbTsPVxsLFERKj1T0eJRRjRd8I2yYQKNpMi0fnjQzP5uqMpgwgk2Hcb5KrmQx+nOvfg9x4cdVd27EK8ccGsQIZYzlNBbaHFu7tqnZjizBCyyD/AR3p6790UdvFdGeVZiR6jG4UqrIPmS36/0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fmeAmDOM; arc=fail smtp.client-ip=52.101.84.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plg/Z5HAPopccNhUoOOCUtSjtB2SUknzH3CxgAZ8X++pnV3MFUDSmjH3AWVRnCpefj11Tu8XVsLM4JHZLuh6synoAq5uUuBADJNg8Krm0n/VOh/SPu3+Dq0m3i4+hbS5lW28dcMyBXz4l8jKn2ynRd5XBGjaihnpU/5Rxq9ylZUEcq3GIVviLfvRClk9qTr/1wulySV032hteW9Y1/Xfd59xnx8p0QzgyM7dlWbqAGpuSQyuRnOxaJhhiFBOxIQAeTvsxRCesw4gY63Zb+1yaG347VLAvoEgUpwYU/oDaNMpXYzIvspzqCxqjeL/HJp6SgZA5KmpkecT1BWKsnmbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxDmqJz2BgrF8SFTIwwiZwKTL7npbVE+W6tkmYvrJbQ=;
 b=MgaOnM4jNwF+eqH+5aJ3x3MdMGIaGHuc9/8o+4ZcCH4uMrvpXYvL82uodbTaMexiCLe9f5jSbpb0ihc/uYNKOQWL9shoQCgIybOQEysiMHpxMiHQ5N355j2Az1GOHCeOvKfSnic37aDiAUZLZP6kCQTEs6D6sFx+ZB6X5l/GxJYA2dRecdJySGgZh7GX0QNNz+Dy3rp5vOCwyl7NaYfIRpMuW3FH+gshTcXJr2re/LtKu4wYx0KRz5V7hhIoGzCQhMRAB/dt28n8cbPNxvTpGI3X9mwMYKtoPEc2hGeDK/bZYJ12Tfi0oI4iwX32MG55989abTag2bM6znLjxyN0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxDmqJz2BgrF8SFTIwwiZwKTL7npbVE+W6tkmYvrJbQ=;
 b=fmeAmDOMabgE5+xjYgAWtf9NUns3sUSuXrWyYZlHdNj/q7XJHC4PAqSp6F5xk8x4zMX2hA61CpaCSs8ziGfWpkcGtzwVyQrhcZlHq6nqDWZD1BNevaNp6yiPrSgNIU+7cHI17sJx6tESU23/0ACUGs0WD45UY2vNWRpdge2itHiAu7/S2DH62XhZUHjiXxUDD7mFQGhbfzClB+vaiCXRp85ld+c0pl7zPgx9ODtLWF+f10h0gZDp8IJgHhKrCxBW6lYybgFxheubvWayMz+4q9DexGgdCJMAzf4fldDcsxGyO2qzP+Hec7r1RybaFa6+d2MjfCoyZM/EZOa7chMlJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV4PR04MB11941.eurprd04.prod.outlook.com (2603:10a6:150:2e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 06:02:35 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 06:02:35 +0000
Date: Wed, 4 Feb 2026 13:55:06 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Li Jun <jun.li@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Message-ID: <n23jaztri3mbjbbprk52qso63tzt4ylo23ueawdfnfqaqlz2g5@sfxfteokzrzr>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
 <20260203002405.5wxsceuc47m6hrud@synopsys.com>
 <aYFMfPeeQusS1UR4@shlinux89>
 <20260204015208.rpgp623pj37nldbm@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204015208.rpgp623pj37nldbm@synopsys.com>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV4PR04MB11941:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf7e15a-5921-43ca-832e-08de63b2fe09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|27256017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmdLdzhnR0RSVW1zTG15eUZlaXc1VW1tbVRqc05hRXRCNmdxNTVCRjBvcWxE?=
 =?utf-8?B?SnMyMEpBUW9uTlFodzVMZ0p5dktoSlptb3kyalNxSDkxNlNTclRKcWxvSGgw?=
 =?utf-8?B?YjdQT1dHMzkzd3ZGZURoZmpiR1F6d3dZMDR2RldTMmZ3OHFwUHJaamFYekpI?=
 =?utf-8?B?ZlFPSEVuRm9YNjhIVVl4N2p4SnVCaTlBQnBISUllMTdTWGhFR0NDR1J2YmV3?=
 =?utf-8?B?ZE5jQlVybDBkU3dzRUpiQUJzeWp0R2tFN1dSMGdMcmtmUXpoRmtham5aa2JR?=
 =?utf-8?B?WmNiL2hieTlLc0lkaVkwRkRrWDVMaG1YcnJ4eTZvSURieTJPV0hOb2ROSlFo?=
 =?utf-8?B?R2lFMDRxRmY2MHdUQmFyemhwS294NlVaNU02L2hKQ3dBZlpFQmhEV0xFbUls?=
 =?utf-8?B?SnVweE5FelhhQjZvMzBQMi9DWHhBbWhKM2VXL0xYT0t3NHlrRXdWK3pkN2RD?=
 =?utf-8?B?ZW9aNzVGMXZFcWZFMTRhQXlSbHlFSXpzbGN0ZEdQeTNyNk9jdGRaK1hEa2tR?=
 =?utf-8?B?b3J4SEpYN3JmZzR2Rk1HY2NlVjRaOFJSVUxrNWoxYWNNckp0RGptYWtmRWVO?=
 =?utf-8?B?d0NQZmdDNDgrWjVWQjM3K2FINGpGR05sbDRQZ0dvRlE3SzQwMU85cDFHaGlQ?=
 =?utf-8?B?RXc5TDhRK05kVVNLd2NWUEZZS1ZPcnBhSEtIbEhKeUZ3YzA1WVcxdGhVek9Z?=
 =?utf-8?B?YzNub1lmdnJNUmlNMWp2VFdabUZpQTIvMjdhQTBaSE5ibEpCSzFjK2Y5NGtq?=
 =?utf-8?B?U2h6R0lVYkY0Tlg4ZjBpRjZLN0RudnUrM3NPWmlLR0V0V0Q3R0pVZ0hPRXE2?=
 =?utf-8?B?Mnh6V0VrNzR4ejVUTmtVSy9pNDFEVXNWdHFuN212ZGd0WnF5VHNYMEFlUzlB?=
 =?utf-8?B?czVHbVpQS21sLzU0VlI3dXZqVElhTUZzL244WFNpbzQ0RU5lUDNUUnJoRUFo?=
 =?utf-8?B?TTJkL2lySzZkcDV2Nkh2ZmRHQThoNUl4bThhdWZrYzhjNzNKaXdvdFVqYm9w?=
 =?utf-8?B?SnQ2UWJScGx5UTVaaWhRZVV2eWx5SHhKYiswSjkrbzI3UGJQOG4zaTRBRGlK?=
 =?utf-8?B?NkxFbXFCRGZvV3U0RHZmZlNHeCtWQnpDTUZuM2RmR1g0NmZrSjZJOENLM2hE?=
 =?utf-8?B?Zi82WjBMK3hOdW5jQXpFdGtSOEdNVzAxNXVuMkdxVEpueXA2WFNwck9PZzZ5?=
 =?utf-8?B?dm5pM0l3SmtpTWE4ZUJlQWFqNkx4L0Y0a1RWdjB4S3hwUnlpZUh6eC92RS9q?=
 =?utf-8?B?cFdkcWNManRZNy9NZDlOQVVKVUEwT1N2dEF4SjdOL0N6elhYVHl1U3pHL0tG?=
 =?utf-8?B?K0tHY1Q5eThUbkErckp0UFlyelIyYzlvUTNVZVVJL3ZJa25rQkRMc1lpZUp4?=
 =?utf-8?B?dGpzaWRmbm9xaUNpN1dkVUpKeE9GdkhDRXZkbXhkU2pYWlRoU0VBWUhnZ05D?=
 =?utf-8?B?Y2I5dXR2Z1k3L0ZFaWpGVVRtZThQNVE5QU9pdEZBQkE0OStxUEpiOVU5NXlM?=
 =?utf-8?B?RzhNTzRpd0o3YmUyTGZMTTcrcmFod2hoaDFhUXBNMHR1M3lPeDVqWTl5NGNS?=
 =?utf-8?B?dkdPTW5DWG9YcnZIaEgxQkxrQjQzeEZkT1c4LzBwOTFtc3JpT0ZBdzZtclcr?=
 =?utf-8?B?NklmakRqUXhLY3lWOW4reE51d1dRZHgxQzBzQWNvL2ZjYnhDaGdKdkY2QkJ5?=
 =?utf-8?B?bEhVYWMrVXR3SjFxaEs4eEpVZjlPV1BWWmJvQkZ0dFloYnhSK0QxWlhDM3BW?=
 =?utf-8?B?Q0FKOE1vVDFMS1JoVGIrTDZiODJyV0I2Z0VQOUNabWhSZXdGdmxTcDZyWm9D?=
 =?utf-8?B?enc5T0Z5OTh3dVVTUFBsNHkwZ0hsZ2V2L0gySzJRM2gvYUl5MFErSkxna3g5?=
 =?utf-8?B?dlErdmRoelVxenljSmJGdHFmbktXdld0L0p1NkRsZytDbzVlaDR4dnhmRGo0?=
 =?utf-8?B?ZFExMURMNDZWaE82YkN2aVQrVFlpeDVSVEZwdmZwamFGSS9GNTZHMDh5SHVW?=
 =?utf-8?B?cjRyTm5DbVJRekJrOUVBMm1OWDdUNVdPZEdaeUNpS2R4ZUZ5NG5SSm0wT0R2?=
 =?utf-8?B?WlhkbW5sUTUzeTZMTHZlcXF2elRVVThPNS94YUdmQTJ0YXR6Vmo0UzcxZFRk?=
 =?utf-8?B?ZGcyaXMwbXVCV1RQUDJzc1BLSkNSZVI1UzkramhuTFlKUjI3U29FbG5ERWFH?=
 =?utf-8?Q?AD9ldilqKZyFzdJNiZwfX1peImJu9QLzXH2lfXTRKmnq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1F2L3dsQVAxK1VWZjNVTitqbTV1SjV3VWtKaDFtVVcvNzlXdzg2bDMySDZI?=
 =?utf-8?B?NEIzV1hWUHU1UGI0RVJ6bVp0Rllrcm0vOGlLcWNoUTNFM1IxSWJaY29tZklQ?=
 =?utf-8?B?Sm0rZ1JMTkk2NFIyL3pQVnA3Q1FRNjFla3loZDR3SUhHaHFTdUJ1ODc3dkxG?=
 =?utf-8?B?WGZEYTRGbzAzdHJMcEovMStCaU9MQVlpd000S3o2QnU1a1NhRE9JYlpaQmgy?=
 =?utf-8?B?UDV2dHExZGdFNTBCR1MzUjdoNHpHZlhpSm1acWFnS0VtZEVHaUw5RnBiYTdC?=
 =?utf-8?B?RGpxajFqSHYwU3Izb3FzNlVqUWM5anc3N1dqalRtWW5IUGR4Y0QxdnZTYnNz?=
 =?utf-8?B?TzRzUXNqTVFSVTM1Q3Q1OXRSZ1FVWFFzZjFFN1I4bnlMMXYyUVRPZzZXM1Bx?=
 =?utf-8?B?bmJQbksrWXk5T1R6aFBKYXIxZitKNHBjUDdrallGWHliSVQvR3RIclFMSFRk?=
 =?utf-8?B?NFQ2SEplNVJYSzZ2bHZncFdZNzBhbU1KSzAyMzd3QVhoVEdHekluV0w5UlQy?=
 =?utf-8?B?akpnNUo5YUhJRzVlNE9CTW5vZnRJQ0VhbnU0TjhFMXdzWUl0Nnk5SUd4VWk2?=
 =?utf-8?B?T0owdHJpSjJ2UlQwR3VWcU9rYlRrSW4rVnFBTGN1VlRsNmpEVU4vV3ZiOWEz?=
 =?utf-8?B?aFBkN1BONit5Mzd6ek8wTFp0SDRpaFo0OTU0ejVxUHdUTFFuQUZ0bk1CTGhK?=
 =?utf-8?B?aXRqZUVROTc0N3dnTXZOcUlBTndsbjF3YWh0cUFUcXZrRnVuUXd4Z1hNTXV1?=
 =?utf-8?B?UDNOYU1XWUh0R2ova0ZZRHdudWN4cjQ5NWc5YkhNRzFOYWNYMzdHRnAwNWVW?=
 =?utf-8?B?YkRZeFNLcFhsaERvSTVXaGhYTE1mVGdzTkxJUXhYRFp5UmNLSnRGU29uaW01?=
 =?utf-8?B?WVBCVXJ0YnZybmk3TnpEazBXNmRDbnlvVTFvV1RlaXIxb2puNU83RWxFVGwy?=
 =?utf-8?B?UVlBNDVvVFgxSllUc252QmgxRTdONS9GVmFlVElIdTFhZ2tJWDBENTN3QjVo?=
 =?utf-8?B?WWhXSzFZN0FPTVhwc1ZieEhRcURoajJ1U2lEMFJsTU0rc3p6QXpkUHB2U2hD?=
 =?utf-8?B?TUhmd004aGRUVTR3N2JDYW9HL3YzdWtaeFNLWWUwRjZ3aE9uczRFRkJaRkdi?=
 =?utf-8?B?WUEzZHZPdUJvSHFZQWhLZisrUEpwSk5yNkJOQURmVEEwZGluSXFJbFVmcmo1?=
 =?utf-8?B?Q1RBZGJidnY4TG55UjR5NXp5bVdZWktmYWlDMXpyU1lMOGtjLzhWbndZd0hy?=
 =?utf-8?B?WGlXTUxCR25WbWlabDdsOU1UaXM1MThQZ3BMTDlsZzUrQTlXdnovNzQ4UUdT?=
 =?utf-8?B?T3pUMnRHK0FtYVRFMDBtNGZGSHV6MU5zL2lkUEd4RkJQWDlSNDJQdEtNMndz?=
 =?utf-8?B?RlJBbU90dGdNV0xDRkM1dksxWFdqM3JsdkJXbXIrVmNQaHNyYnV2anQyS1By?=
 =?utf-8?B?RldIMzlleFlqRW1TUm5lSTJJUHJuYmxJK2h3aFU5c3hhd2YvcEtTaE5OdjEy?=
 =?utf-8?B?T2ZvOVg2N2tKYm44azFVVzFUcGZqZDE2N3VibnlSeE1nZW9lcVFPVWZJRnVI?=
 =?utf-8?B?M0dxRk00QjFGQVVFdkZuTjNTbCt0U1d6VTNtMnJZTUQ5SHQrWHZ5VmNtMEFO?=
 =?utf-8?B?RXNuUldRUUpzek1SdEwwaXQ5RG1mbEQxM3V4K082QkZVRWdFU2ZEVDVZQTlT?=
 =?utf-8?B?dDdFa0FnaG5QVi9sK0lERGRKY1lFZHNjOVQvcVlFeGlnaTdPZ2lYVW01UVFy?=
 =?utf-8?B?SVBSL2Q4RnFCSWtVeU51eUduY0Vzczk4aXlVVE1xSHVUSUJVbndCWUt6OFRN?=
 =?utf-8?B?RzROSnhTU01Mdm9BNVhXK00wbjhqWTVqc2poVTZsbkM0T1pqcEl4d25GOUIy?=
 =?utf-8?B?QmUrNjMzZU5kT0lrbE81VTZLNjZlZXh6SVpvSCtGNmY2UjFJRHFidTdjN21u?=
 =?utf-8?B?NE91YU00TVBtb2hTSktRcEVrUmR4OUthNHBiQm9MTVgrUDNyaVJsNGpnTDNw?=
 =?utf-8?B?SVNEV003aGRZMWNNSVhmeUFLTDFLZ0xPUjI2ZXQwczRsRVBzZHVZWTVXVFBx?=
 =?utf-8?B?b2RuMzFzMVJJUm8rRDNjN0pjUGVOS1VJbVNCalhVZkwzb2ZCS1Zkb2xPYVVC?=
 =?utf-8?B?ay9lTWZKTkhOREl6bm5ZMHM2MkdyNVlmWlpTbkpDOFFFc1E1aHBjcmYzWkVE?=
 =?utf-8?B?WnNvQjBtam1FM3BoT1pHcE16TWFXRWRtWVJvRUxVWVVrNHZqUVVNOHVDb3Ja?=
 =?utf-8?B?ZGR1dEhGUmpVUUd6WmxLTGUvbzBsNGZjTEpheFFTeXFBSUxFM2hVd2dtVFJz?=
 =?utf-8?B?end0NmFrOWdTbTVFeGJCWlR3S0dBc2hSQ3VXdmx6QmNNWGRRSzJEdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf7e15a-5921-43ca-832e-08de63b2fe09
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:02:35.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aba4upIZAfQ6rgOCVr0QWlRhszo8iQ6XtZy5TeMcYWojmKCK/G+1hVNSbIb1Bxb0ZSLcZajuDCfURT7tW59y7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11941
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33079-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82951E22D5
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 01:52:15AM +0000, Thinh Nguyen wrote:
> On Tue, Feb 03, 2026, Peng Fan wrote:
> > On Tue, Feb 03, 2026 at 12:24:08AM +0000, Thinh Nguyen wrote:
> > >On Mon, Feb 02, 2026, Xu Yang wrote:
> > >> The current design assumes that the controller remains powered
> > >> when wakeup is enabled. However, some SoCs provide wakeup
> > >> capability even when the controller itself is powered down, using
> > >> separate dedicated wakeup logic. This allows additional power
> > >> savings, but requires the controller to be fully re‑initialized
> > >> after system resume.
> > >> 
> > >> To support these SoCs, introduce a flag to track the controller’s
> > >> power state and use it throughout the suspend/resume flow.
> > >> 
> > >> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >> ---
> > >>  drivers/usb/dwc3/core.c | 9 +++++++--
> > >>  drivers/usb/dwc3/core.h | 2 ++
> > >>  drivers/usb/dwc3/glue.h | 3 +++
> > >>  3 files changed, 12 insertions(+), 2 deletions(-)
> > >> 
> > >> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > >> index c07ffe82c85049364c38c7ba152aab0ff764d95e..9d4326da5ec7669fa714707fb24556723cab51b8 100644
> > >> --- a/drivers/usb/dwc3/core.c
> > >> +++ b/drivers/usb/dwc3/core.c
> > >> @@ -2314,6 +2314,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
> > >>  			goto err_exit_debugfs;
> > >>  	}
> > >>  
> > >> +	if (data->core_may_lose_power)
> > >
> > >Can this be passed down as part of the dwc3_properties within the
> > >probe_data? I'm trying to consolidate all the dwc3 properties to one
> > >place.
> > >
> > >> +		dwc->may_lose_power = true;
> > >> +
> > >>  	pm_runtime_put(dev);
> > >>  
> > >>  	dma_set_max_seg_size(dev, UINT_MAX);
> > >> @@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > >>  		dwc3_core_exit(dwc);
> > >>  		break;
> > >>  	case DWC3_GCTL_PRTCAP_HOST:
> > >> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> > >> +		if (!PMSG_IS_AUTO(msg) &&
> > >> +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
> > >>  			dwc3_core_exit(dwc);
> > >>  			break;
> > >>  		}
> > >> @@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
> > >>  		dwc3_gadget_resume(dwc);
> > >>  		break;
> > >>  	case DWC3_GCTL_PRTCAP_HOST:
> > >> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> > >> +		if (!PMSG_IS_AUTO(msg) &&
> > >> +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
> > >>  			ret = dwc3_core_init_for_resume(dwc);
> > >>  			if (ret)
> > >>  				return ret;
> > >> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > >> index 08cc6f2b5c23631a752c77fd7394e5876c929f0a..5b1358f36490a001bc9e68139224f7be70a57995 100644
> > >> --- a/drivers/usb/dwc3/core.h
> > >> +++ b/drivers/usb/dwc3/core.h
> > >> @@ -1117,6 +1117,7 @@ struct dwc3_glue_ops {
> > >>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
> > >>   * @usb2_lpm_disable: set to disable usb2 lpm for host
> > >>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
> > >> + * @may_lose_power: set to indicate the core may lose power during pm suspend
> > >>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
> > >>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
> > >>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> > >> @@ -1369,6 +1370,7 @@ struct dwc3 {
> > >>  	unsigned		usb3_lpm_capable:1;
> > >>  	unsigned		usb2_lpm_disable:1;
> > >>  	unsigned		usb2_gadget_lpm_disable:1;
> > >> +	unsigned		may_lose_power:1;
> > >
> > >This name sounds like a quirk of a broken SoC.
> > >
> > >Perhaps rename this to something such as power_lost_on_suspend or
> > >needs_full_reinit?
> > 
> > How about out_band_wakeup?
> > 
> 
> IMHO, it's not as clear. It doesn't describe the problem or the action
> to take. Can we use needs_full_reinit?

Thanks for the suggestion.

Agree with Thinh. And checking out_band_wakeup flag during system suspend 
implies that a wakeup event was triggered.

Sure, will user needs_full_reinit.

Thanks,
Xu Yang


