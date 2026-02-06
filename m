Return-Path: <linux-usb+bounces-33135-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJa1AmjAhWnEFwQAu9opvQ
	(envelope-from <linux-usb+bounces-33135-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:20:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB45FC980
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A40313096B93
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 10:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FC336F428;
	Fri,  6 Feb 2026 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g0KottZh"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE036E484;
	Fri,  6 Feb 2026 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373049; cv=fail; b=eFHxJLxYXrWr53DX1wBZWQx6u2hfKZuU5DzmBYv8cg1/FHbh0hRb1I3SchfrpA0lJeWugdGdcqo3CX8HAMhAhs0y5Wxvn2srjjC+gZku0Pbj1+7uGfFfB+5KdjdSmG0zHwFRy2gE3iXKGLzTiGR0hBphRGEA7CqQafOeew0pet0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373049; c=relaxed/simple;
	bh=rr3HeemWmXYy/H3E8ThsJUteNM9I3JHUTvLZO8Ic2to=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OyJcIQ8bhohx6+nj7N+Iqrkssl8BPC+q/n9DLhcw+OvE4hIunPQQ2VtKfuSWif3Db67zbjuvpMn6jQyaSwi/nIEnR298ql4yqASh/7s7ewzibqlUy1lnAhV3DIBdz8/QiiGZx7RqaGOTjLgcOOt49d0eO6NsLE1P81Tumyp14Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g0KottZh; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EL56g/VcDKNKG3OX65fDx5sP+m9fLBn3WSpiBatiVMM0tHcjfxFBwKQbBiI0u2pn3sM4cGViTxg9yQTVdTw+CiQsAGHFovAou5ITt+ak/cL0Ac6oi1JJIClD4soMY/XlcrmcbB/NMrDg37MQLAlNbSNd3a9Vd8D17cAEzfHxUw/CB4Nza9wTrJnNirNShBMwbeUWDC2L4vOlB8tceJplWr6ao5m2XI23N927CW9BnLsWTfAQuP0xNEPqm8lReDVoLJYgX8YYT57BmONdyhSjbjh0XAIUEoKCEqph5HT81ggJfkUZYHeoLNK1j/gQYOScGp3zEWYBCdJw2Wq8ev1E9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csRbh7zQh6y6tovMXyYafmZMjkPRxupAUUB+t3/AaBU=;
 b=sD/YxluLh3aqxqCN7ZSjNjnhGRBm6qDthR2i4XmXfszfV27KDXLN25P9koKllHKbZoZ2KtoXH1qY1T1FuyjC/Y0Y/PHsD7SZ9ikxK2zwemsMcyjZzfo2Uvh2ff777/5PnV5kkhi3ZQ6p8l5Aa/SI+SAH1oUdL801Fweeie1/UgRglQeuIhAo7GVuE7k36vo+x7mOkmMoppINR8AZ9/v9tWZEeg2tsyVLnY0RWWUo7VBS21rrXFS3pfiPNNgsc1AVlzgpGKipMckoyy13E8Q+SwRSWcAdLyV2eO0qXfb+kS1Zyz95qMqNkrBRc4ptiNrV71zyPF1POj3sla4Mi/4MAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csRbh7zQh6y6tovMXyYafmZMjkPRxupAUUB+t3/AaBU=;
 b=g0KottZh3CaSAE05V75dDsuy6AeNAhGfugrXIB6GWZl+XTa23Zo4n4otqu6QczIAkSgK362NjgYnxujoTb9jPJhfEhlpGBdy2kKKDsrZjNAcnCLDD4TWTxZYa3TP4YRKbrwoMaS3FfbPhkaTbF7ofxIxn84ePbpZd3JGmGDDg+ALe7jgMEzp4gRIKS4f2v1IZcKdbKivvLRZvnzrKrm9+wCRbsCBP9jjJ3tIJcyPHlOYs9UIwBKhMve/2PB+KcxSyOIYvxVZaAqASyLZGqur4OHWorAnFW9yK6Me6TV+gZjvMFy8vYinnR0076vkEiOJAbwosRHKul5xV4xT6KYeQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS1PR04MB9477.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 10:17:25 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 10:17:25 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Fri, 06 Feb 2026 18:18:50 +0800
Subject: [PATCH v3 2/3] usb: dwc3: add needs_full_reinit flag
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-2-ebd9b9b77049@nxp.com>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770373141; l=3767;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=rr3HeemWmXYy/H3E8ThsJUteNM9I3JHUTvLZO8Ic2to=;
 b=jdElVG/v6BrXxHn/zsOXsGzsvvEc6cKBdH2OXxWL4zA1WieycUVeYL4E4+ipudvUDHP5xLloh
 tggkOc2VonSDPL1o0FDvbodXkz70Qs2OGUF8pkXBccEMiBNafg/4lys
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:3:17::23) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS1PR04MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6785b3-bf1a-4fde-cc38-08de6568ec95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDR1THNGcG4zLzBiaGwwd3BvRmdlUFRCaUV1dEM0bHMzWXpsc3IrWmZRR1Ir?=
 =?utf-8?B?NGM2cldUcDVnUVdtNllZWEU0TVNrWXQ0ZFNoNExxQklicm1OTzNNZFg1K3oz?=
 =?utf-8?B?R0ZQOEhuT0puZHFtSThPR0FvL0ZJWnBsR1U3RUJja3o0d2xmazlPMWJsMFVR?=
 =?utf-8?B?NFQrbzN0ZTJCVkplS0YvcFloR0xHYkY2djU5WWNtUFIrYi9wbUdSNEVHNkEr?=
 =?utf-8?B?QmxxQnEzcFdJaXBzWVNKQ3NTd2RBT3lTMFpFdGJORFljSVpNUFdTNkZ0bDNH?=
 =?utf-8?B?UXVhUWZ4TDFDVWQ1VGRHMncyK0lqRS9BaHlROUt6ZTdCa3hneEpEa29MUGND?=
 =?utf-8?B?M1luelQ1UXE3V09aeVYrOGtxandkYkVMTU5YWWx5QXV3SDRVNUdzK2doUjMw?=
 =?utf-8?B?bUY2K1dFQlFOTGhIdWw0MkRodk1JL3FwWEFoc0JaN1ZwdmU2aWQ4N2lkV09R?=
 =?utf-8?B?QWl1S29OZXFBNmIvVEZheHRnMXB3UUdCaW5yR0RyWUpiYUdkc1o0L0Q0M1JB?=
 =?utf-8?B?S2ZhVmxwV1JnVks4MEZ4NEpJWWwxNy92RFloNllyWkNna3lvbStad0FzZmJv?=
 =?utf-8?B?Mm4wN3JPZytjQ25lOXI5YW1qazdtRmZ3MXVlczJPeVNyRlBOOUl6eGhhRkJx?=
 =?utf-8?B?Y3VSaHhscHgybWtKaThsdXMrMEthL2p0MkY4RG8vaEFVZEl0WDd2bk9XSmVK?=
 =?utf-8?B?YUNnREdwb0ZsTVpxU2VPT1RCOGc3cTEvM05mbUdLSmJPUE5KcDB4NFpXSVZZ?=
 =?utf-8?B?VEZqSzE2L0ZMWTMxcC9FcGpEU3FMZWZXVWdWYXZPd29ZamdPSWMrQVYvM1Vo?=
 =?utf-8?B?UDFoSzlnaDlvbWViVktHakJhTGlTbGNDRnQrcDQvaGJOM05qdHBjSXhVZ2RK?=
 =?utf-8?B?UVpTY2p2WXZieVRtTkh1aWI2UmE0Q1lVbDJBQnN4QzZWL0JJempBK1N3ZkFL?=
 =?utf-8?B?SXRUUzU5cU1sZmpraTFETno4NWJiRmF4YVh1N20zdnRHUWlSS0xTTEtZOEEv?=
 =?utf-8?B?RXhacmhRZlNiMzBrYW9jKzJGZ2RsSnVXOTVWeksyR256K3Y1Rko3Q0czUEJV?=
 =?utf-8?B?dzkyVXVwM2ZHTmxGQXdhZ0hOTnE1YVBCSzk2dzFsU3Y2ZXhyRGUyS2RFS1o4?=
 =?utf-8?B?bDJJbXZmcjZpZ1ZjSzlGQmZDZmk5UzVNL3RUWEVtNjNWZXQ3cTV6NlpvZERT?=
 =?utf-8?B?UlFGeFZwK0RrWHdOVjVjK05yd0E3eTVGc2hqQTlxUERaQ2JERERqL2JCVmRh?=
 =?utf-8?B?RXlqdHBJeE5kNFo5T0JWY3BKNVM4KzJyTFhLSkdUbmdKNmxBV1FGenlMV2xJ?=
 =?utf-8?B?UW9tTjQ5bmNyU1k0MDFWbWVWOXdUMFBhSWNDT3ZVejJTZ29zdmltMWNrd2hr?=
 =?utf-8?B?R3JweGgyeTg5dEZnYzc4TURoMloxekRTSzVBczN6bDJhM29JTnNlUHNKc01w?=
 =?utf-8?B?SGQzYWVZbDhlZjBydzBNQVcvQlNIUmJBaUFhc2FPRlVBTmYvSmtSMFY1TlVp?=
 =?utf-8?B?UUoyamlwRnJ0WFFPY1RwenJIdElOcld1ZndHaEZNZElTOWJNMGRXVE5DcnhN?=
 =?utf-8?B?TEdlWEZ4TGtqSnJKLzFVUW4yU0RRZnkvTVpsMzFKaHRLcE9sYzd6L3F6b1I5?=
 =?utf-8?B?ZlRQaEI3L3VISUkxWlpsUkFwNGs4eE1JaVBZeUVTK01rdlVRN3d4QzNQVVlD?=
 =?utf-8?B?MWtFc1JmYVNhU0J4MEU5d2RaKzVyQjA4dXQ2cXJFNVNKVDVzMk9XN3Q5NVRK?=
 =?utf-8?B?bGgxSy9iNDJCTUR2MDJ2WTlUM01iK2l1d3Y5NlBWTzN4Rml0bjRuWk41Zk4w?=
 =?utf-8?B?MHlwQndmc2s2MUkzV3pmQlQrbWFNR24vTXNoL2ppZEVwaXdqTEJld3c3VG1L?=
 =?utf-8?B?Nzh6SVluVm9VV011M0Y4RWlhOERZUEhnaHZaMnF4ZWtFa0NBRzhQRlk5c242?=
 =?utf-8?B?RlUycThEWUQ4N0JyRld4M2JScHN5QVhqVUh4V0krblltR2haY3hJRGU5ZzZL?=
 =?utf-8?B?UC8vNitCUkNpN3IxVWdFNmtRVFRpOW5EZy9IK0UyejQyL0FhV0h3VzNBYUVr?=
 =?utf-8?B?bEhwUmppTGZQMUt1Zi9NWHJ2SWpjeng2dHlPNm4vZTBRY3hmWS9TREYzSkox?=
 =?utf-8?B?TG4vRkQzRDJLamdFTDhiTVU5THpFeW1oZEtFbUJ4OFkvTUhMc0VBakZTUWM0?=
 =?utf-8?Q?T3Rr1pTEmrokDtoNxoetVWkr/mbnPMb2bzCIZBgCink+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzJEK3JhZTdSdFRwYTdYYjlTWkdSWE4zQnYyOHZJcWRZNXAzRnc2K2tPMU1T?=
 =?utf-8?B?M2dETUxtVnFoK0QvWkVpRkErMU0rY0V1Q0Q0QXFJOXdhaVZyWXA0Nk43L3Ev?=
 =?utf-8?B?bXAwRk5sTS9zbzNUcURKclZObXpoeUV4YTU1VHlyK3hNV3hXVUJxeFdYMFNz?=
 =?utf-8?B?NGlKWXZBKy9QWGViTGVSQnE5YzZ3OWduUEhDQnhqb2owYUpQYjNRTGZEVGZx?=
 =?utf-8?B?NlpjRGl6S09kaHBwL3BtcUQ3ZUtwVG5NNDBBR0RvOVRBSXVlTWNDNnRMaXFw?=
 =?utf-8?B?NHN4N0xFalhrZ1BnUC9Wd1NCd0xZUlBXVFlEdUl5SW04T0dQWjVURDdZQXZs?=
 =?utf-8?B?ZXcrcmJuNy9wRmdpbFRES0JpZEVTSE9RNGRFWU9CRWpwRzBzdnNoRTQvRnZH?=
 =?utf-8?B?SFdhaGdqWHlHNHllZ2MxR3haUmUxWnEvVWk0d0lITHBVcm15UjE4aWtxRktq?=
 =?utf-8?B?MjFMWUdpT2pSNXpRTFhFc2hHdnAzQ0FLbk1xZXUxSHpsdHdvK1V4UXMvVFRF?=
 =?utf-8?B?NkwydWl6UmN3aTN1QVVPdnd4ZSt4K0w2UUFINWMyRVRYOGRGeEtoUXA1OGtp?=
 =?utf-8?B?SzdSS1ZCRUk4ZUpsWVMyaUNPN3F3bnJLdC9tSmVMVGNXUEtrRVhpQzdaNUE1?=
 =?utf-8?B?VVF0SXVqenpxbUgvSVhpUjQ5cWJOK1BGWS9KK3VFWTcxcThET0ZlaHRaQ21J?=
 =?utf-8?B?Um9lWGcwNWFiZmwzUVNpL2xKdW9EYk52TVk3WUN6dS9yczNVc3UwSFV4VVBq?=
 =?utf-8?B?TmY3Wld0Q0dHUWZZdHlpVkdURkVjMGwyb011Mkc3YXMrdTdqZ3BJN2VHa1BH?=
 =?utf-8?B?ZnVCbG1RNGtCdUREVVNWVm9CTXF1aHhwcVN1em5UclJiN0xpeDg4bnJzVjdU?=
 =?utf-8?B?OGpqSkQzMG1RMk1WOHI3QlZ5OStTcy9NSXZ3am5PeVUrNHNkRE1NWVhaM2RP?=
 =?utf-8?B?V1g1K1hLT0lONDZGZW0rVWZXcEM1b01HdkJNbnkwYjltd04va0ZEY3owZDh0?=
 =?utf-8?B?RU9tV2NzZ0x6L2NMem1vQjBzWkZhNWdTMWxJRkEzRmZCZjM1cEk2THYzM1RP?=
 =?utf-8?B?TVk5czg2WmdrS3VFQktxbEtiZ1cxSm1Zb1NhQTl0aU41d1B4MFphKzVkS2dq?=
 =?utf-8?B?Y25DZlNVa0c3S2plV2VDaVp3Z29ydTE5R2Z2cVpIbW5taStBbXRpNldyT1U2?=
 =?utf-8?B?SWRyOUJ5cmQ0eDhNUFVjSEs3ZThhN2NIcXN1NXpkdFFCbDloQVZoZnF1akVq?=
 =?utf-8?B?c0liNmFHSlFKSlgvSGRDV2RBWUM3SHgwSytCMzBwK0ZzR05xem1ndGxnL2pF?=
 =?utf-8?B?QlB5K3FVT0pCK2x3VVVmSkRiSEJyV3hucytTZ2kzWldkekZLNkk3RFRPRWhs?=
 =?utf-8?B?TWFSKyt6WUR4RjZ6bkJ5QW9qUDN2VURsMWF3bVJoaEZPb0gvbTNLdmV4SUVq?=
 =?utf-8?B?ZTE4N05TKyttSm5HbkEzcjhCTUVIZDAvYm1GR0RFRDE5UXZXSnl1N3VqYm1Y?=
 =?utf-8?B?bGJ1Q0ZIZGgyZG1mT2czV3dTWUZoZFYwUlFndjh3eWRGV0k5UTlsaFdBT0Vl?=
 =?utf-8?B?bWgzVGZNZ3JLQmJYL3dRNm9uMUVkM1NkYkk4UEVnWWFROG9rc09SUlRXZXBT?=
 =?utf-8?B?c0tpL3c1YStQdmVVMUF5bU5DTU14S3FzWmYrZnN2UE5oRTN5Q1crdFVLZlJi?=
 =?utf-8?B?OHpwRGliSFBzZHUydTVsbG5sSFVWVUxVaFoxM2FEd3JnM21OSGRKSDFuSmN0?=
 =?utf-8?B?bFV0ZUVaWTA3Q3hhdW1jNzcrdTF2SWNpMzJhbFpId3BzR0JDZzZEM3RzNHFY?=
 =?utf-8?B?QVFHeFBwN1ZTUS9uRjNRUTFLUUQrcDYxNHI4bGMwNm5xV0k1SXd6YTROUUNH?=
 =?utf-8?B?SmZrdmUxTkkxZlJjTWJQekdycGhKb0pNVkE0TDB1dHoyd1NveUtqWWtKYTJO?=
 =?utf-8?B?N0ZZT1AzK1AxN2hrUEFGZ0VYblhLa1hMTndkTkRkd1VoSjA0L2dEMTEwQ0Yr?=
 =?utf-8?B?UndlSTRRYUQzdDhzbEd6ank4M3Q5cjMzMjFqTU03QVZ1T3EzNFZOdi9ObEJW?=
 =?utf-8?B?d2hPcmpuMVlmcDE3R1FaQmFjazBhRnZOMHNncEw3eXVtalhmSThIMHJPbi9L?=
 =?utf-8?B?bkpWZkw4dnAwZWtUVlBLU0ltSExCNnZuNmQ5UFkvb3hrNXZ0dktFbnZnSWpC?=
 =?utf-8?B?eGhMSEh5aklIL0oxSDNBUnpORUZqU2lLOU4xZnVZeHFrYWtpZG9wckg4MkZT?=
 =?utf-8?B?ZWZsRzFlYndvWWJ3UjhXTCtTVUI3YVpEakRId1pIK1BWaGpQcFVrblIrWWNN?=
 =?utf-8?B?ZUwrNW1CaTNEejV1VVlnZlhWU2lwVHRROU0yY213c3VicVJ5b25nUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6785b3-bf1a-4fde-cc38-08de6568ec95
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 10:17:25.6900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMsEmLGGjZTh+rooAbXbZzgKYt9bLWf2FpunPDfHWeFe022xglA/YKEKd/sXodxJ/kAWtqNGKOIsuzbLknI3kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9477
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33135-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DB45FC980
X-Rspamd-Action: no action

The current design assumes that the controller remains powered when wakeup
is enabled. However, some SoCs provide wakeup capability even when the
controller itself is powered down, using separate dedicated wakeup logic.
This allows additional power savings, but requires the controller to be
fully re‑initialized after system resume.

To support these SoCs, introduce a flag needs_full_reinit for the purpose.
And the glue layer needs to indicate if the controller needs this behavior
by setting a flag core_may_lose_power in dwc3_properties.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - put core_may_lose_power into dwc3_properties and check it in
   dwc3_get_software_properties()
 - rename may_lose_power to needs_full_reinit
---
 drivers/usb/dwc3/core.c | 9 +++++++--
 drivers/usb/dwc3/core.h | 3 +++
 drivers/usb/dwc3/glue.h | 3 +++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c07ffe82c850..c5e0a1705b6f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1675,6 +1675,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	u16 gsbuscfg0_reqinfo;
 	int ret;
 
+	if (properties->core_may_lose_power)
+		dwc->needs_full_reinit = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
@@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			dwc3_core_exit(dwc);
 			break;
 		}
@@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_resume(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
+		if (!PMSG_IS_AUTO(msg) &&
+		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 08cc6f2b5c23..01d92d680ba4 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1117,6 +1117,8 @@ struct dwc3_glue_ops {
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm for host
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
+ * @needs_full_reinit: set to indicate the core may lose power and need full
+			initialization during system pm
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1369,6 +1371,7 @@ struct dwc3 {
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
+	unsigned		needs_full_reinit:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index df86e14cb706..d4ea635c92fb 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -12,9 +12,12 @@
 /**
  * dwc3_properties: DWC3 core properties
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
+ * @core_may_lose_power: indicate the controller may not remain power during
+ *			 system pm
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
+	bool core_may_lose_power;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\

-- 
2.34.1


