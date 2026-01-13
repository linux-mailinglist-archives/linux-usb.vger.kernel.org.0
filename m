Return-Path: <linux-usb+bounces-32235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB825D17C98
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25712301E9AA
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0622D389E19;
	Tue, 13 Jan 2026 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Cti/rAcp"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16457389460;
	Tue, 13 Jan 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298032; cv=fail; b=cXymbgxFyAO5ruRNlrqPWyGRivn7pWy39xz0DqXyHsZjeqkLVPaSomyYu+ZnV+G7Hlts4mzerb1uBlULwb03NtacGcZ63Wg18xk9dDVaohUEdksiRA01Gc5B4E0/2kkBUqZCzbTL2iqKm69NdBLekkMcLT7+5Af0wtYyXKDGad8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298032; c=relaxed/simple;
	bh=pzeUxTT3RV+/Xcn1D3snwMrEPzHZa1zg3QOGxFm+O/g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=r7rBBxzSvoRkUNj2dQVVr4aT56sPQVRIkNVBEkbFJGLrGi294hmj/DaACkTha1mUU9mYlmGCAtvZwMb3R9iH2zGPgkbCoIB2/h55DYZwbHLPe5U2I4SyELwGNErK8FMIESP8Q6S8xSODuuc6k2lPjT1l64GiizkxFfN0bDmKLaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Cti/rAcp; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hottHDWaGLLxs7Qiz5Fc18Pp3pGzoM45UXoCiIpkmHoJEyJdQcQrYnLNZUh2hKkGUM/hFWQUnCzsQ99AiUEm/bK/1UBafcjM5b8an9YBMb1BnbdYvUFZv0FHkyQoni1LC0g5kOA1woCbFwq4ZeivOfLxEn+9+nOk3gGAOxKi5T1hWUEDBrqbixWXRnH6T8BNn/gMmnNk81WA1yf7Z0c8ihrRFEXxtibKLcB3Fy/CUldQ/28dZ5BPv5DVXYvnzTs3oT67zyKFNfCFhv/asNQBAWS2/oT8F+F71NEJ/gafs5gpu9YjJXGRTmxirerY36NzW+1mE6LDujUtvpgne9GxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKN+fN8BLjEZXTzjK/FF+ytumogtHlNP8gpq6CKHaQk=;
 b=ws092C59M9oeHMVcRSef7u64Ggtnmg0BnNvQ6VWtlqFWWbyyxoXjUw3uhxOgeCF9F14QRTWfsz3b1gkQkyTdDpw11KdJknMf30DHzKtFk737EsUKgL/4ebzpzZLEf5qhG1iKS45ZihkjxNY8OShT/0xkGW+KzGqoq4AafqVWCmRGku4nO1y9uUxTBKL1JeruMPXJk8EZ+AeLS5lm4KtMroHyAR8ZlG0/KkY+KhYOd76dKETrxG1ir1UL4ZJKSwtORNTvMe+HqRb6OpTdJ+OSRpx+q75r/78rp5Wun+9CcpliDBFzFZztXtUhE2OUxIt/qZovKvjUNdkgY9FopfzqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKN+fN8BLjEZXTzjK/FF+ytumogtHlNP8gpq6CKHaQk=;
 b=Cti/rAcpN8OfxLCT7hnFaDgzCKrlqDXga7gE/KcRPJOXED3itA3RQHwts6hi9xw/K+MgyJ/M9EphID+qz4P8C6iP/iZsrbQUIv/3hv8vXddcs/HmSMLjLhgCmOQJ4Nu77RMmUOWO64QfFa9v2jrYogoAub4IfdIH8dmiuYwtbSfADAbgpA4OFkyBOQ5ylo9IfITDcdv6apcDAx1m3vsQ5LGwozixHkSJkDe8Di94py0OfxQV0L/5mTS9eG+PW5h+Vhux1/6cDLRZmD1RvWOBhXdHUiYXXYdiCv3GQznTkhBOY9wIlCZy8PlOsxW3ttRHPKeoPMEwCM8Lp9pw+9zpIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:53:46 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 09:53:46 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Tue, 13 Jan 2026 17:53:09 +0800
Subject: [PATCH v2 3/4] usb: gadget: uvc: return error from
 uvcg_queue_init()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-uvc-gadget-fix-patch-v2-3-62950ef5bcb5@nxp.com>
References: <20260113-uvc-gadget-fix-patch-v2-0-62950ef5bcb5@nxp.com>
In-Reply-To: <20260113-uvc-gadget-fix-patch-v2-0-62950ef5bcb5@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: jun.li@nxp.com, imx@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768298011; l=1033;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=pzeUxTT3RV+/Xcn1D3snwMrEPzHZa1zg3QOGxFm+O/g=;
 b=L94Eu66y2QiqrsbFguSEx55nkeYaj1PpLR79AIQ5PoQ/Mx1N9cfepSw1q0Tu7Nb9u/vdxD3L+
 O6hUvDnBIwmDsexVs79XaWPfZMDugRNODotISOUTQPGjrRwyIf165FM
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae6162f-bafb-41c2-5e31-08de5289a511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHRxMVVBak1QWUdrSkI3M0c0THNJMkI5bTc0YXRMMjVnV0xKenRFRDFkanAx?=
 =?utf-8?B?dkc2bTg1VVBEZVZvbVFlQXZLci82eURjMlV5Uk43Qzl3VHhqZm9wZnNZVTJp?=
 =?utf-8?B?aEFKRS8rZ3BjSVpkS2dHbXNnazU1OFkvdHVUZkFJRGllakpLd1NDdWdNMG40?=
 =?utf-8?B?NmlZR002WnVqbk4xeDUwOFdEalJNS1hzakE0SGdPbXoycm5ldlZLNGprY0VJ?=
 =?utf-8?B?cTlxVGVDL1lJa0Fua0tjRVdUcVJnbUxVRjFXL1dWYmVKQ1lrVHZWSmtDSVJl?=
 =?utf-8?B?VWVMeWdtZy9VdDRodkU4a3JGa1QzMU9rQlVWTjVDUjhObENWY1BBdlRoSTJp?=
 =?utf-8?B?bUVuNDhVenU3OW9NTjFLUlhGVnNKdzUzVmtiUEFma3ZSL3Z0SFdTRS9Ra0Zv?=
 =?utf-8?B?TEUrQUt3Z3BBOEtLd2hGNVBybTJFdHVFcjNWa3BsQ2JYUlR3cE1YLys3eXZO?=
 =?utf-8?B?a0ROSERPS21UVmRFaENMeUJMMkFhQ2U0Z0JzODVFdGt3QU1mOHhHRGxmdVlQ?=
 =?utf-8?B?T29mK3ppRnVuYTNsN1MzekJ1NzdPNHRuYzVVRG5uVFpSNFplZjMxR3lNUktF?=
 =?utf-8?B?d1Z2SEV5aGJmWHlGYWYwNjUvTHNTdTVvRnVTYzIvUzZCbXhSNTNWbGlXd1pV?=
 =?utf-8?B?bDRKdzJINW9lU1NkamlDdnJMKzFwRkh6bUg4T2szdjZleFExZWRWVGpoekNi?=
 =?utf-8?B?MEtLeHlhb3gyL3ArQ2hIRUdPTWloRndpQ0V2N0dHWTVzQ3dmZm9sT29VOU9F?=
 =?utf-8?B?MmF3dWMrUjA1MkgwVUhXa3IydGQ0U1UrNTVYeDlGWG9xYUMxYnIwcDFsWjlv?=
 =?utf-8?B?cjloTUNWNEM4T1dJR0RuWjI0QVM0TW1hU0E0SG9CMm53UDV5U1ROd0RHdnNO?=
 =?utf-8?B?dFpuQzlGcENCYWdHcCt1VnN3TjJEaTdWWThFTVhSRi9hazB2NnB5ZDFpTk45?=
 =?utf-8?B?b2JzQ3h5bGlPbnZwUDJFOTdJTTJFRHVBYVROOXg5NWVQdnkrQklVTDVocmxw?=
 =?utf-8?B?K0NRNkpOZzlZN1FCbDBuTTBHVlFTNG5sdldSTTgwNksySmxMMzZBYk1IZ0JR?=
 =?utf-8?B?OFU5YndReWFkT3NNMHh5WWtkQlNDV1RnRnRyaGlUU2xJOTN6aGE0U1MxN1hp?=
 =?utf-8?B?Tyt0QXBEWW05WUVjWU0vU2hYeU80VUUyYTFwRTV2UzZXVTJxMHZWQjNhNGcr?=
 =?utf-8?B?V2FHai8zYjNzVzVUSHhtclRJajdRUXRGeGVwd3FCR3hwRDMzaFkrZmhVNTBZ?=
 =?utf-8?B?eEJwWkZnWldBUENiSE5ycXNNbnB5djRpNm03NWFyYnZnTE1sU1ljTFhZL1Vo?=
 =?utf-8?B?eGxEWUU0NTdKWXZHODRTbmk5dnBuejRwNjlOMjRIS25qRXBTTS8xb3RVZldm?=
 =?utf-8?B?NE96KzNiMEhsNnRuTmhYZVlBS21EdWlNN0NXeXNSQlFHZjREK215SXcxRTBV?=
 =?utf-8?B?eTJ4Z0dEajh0QkhBbU1tNU5wb2dFLzhGZEZBWm85RG9TUWpDcW1MMytZYmtC?=
 =?utf-8?B?UmZ4cVdWQU9hdmpDT2Q4bitDblJyWE96WWpBT0RLQzI4ckE1UnJjMC8vdjVE?=
 =?utf-8?B?YlhJSkdzSjZuVkpqNDNYeXovRW1WT1Fka09rZjZhdkk0aUpmRjVDMkoxRDVT?=
 =?utf-8?B?eGtzSkFWOEFLRUNkYVlyQzdzL2FLS00xQkFkMlYrb3VqdFBnSEl5eWJ0UTF3?=
 =?utf-8?B?Nm5ueUJwRmxITHJidkxaTWFYZm1MTHRMTjg0a0lkK2tlbFFkaDMvNFlSVlZF?=
 =?utf-8?B?c2RUK1R0N3BDNzlOL2dzWlNUVTh0eVhxbGgvWmRKd0hJbm5mYmtET05wTDFB?=
 =?utf-8?B?T2xuZThJNjBsRjhRRVZMNmRqOEg5WFg5Z1k3WVBqN1Z5MUlZWWpUM0pOS2tm?=
 =?utf-8?B?LzNTN09xMmxmZlBKMjVvbjBPMFg4Wlo4allaZkVwd0w5Z0tGTUlSSnJJcXZZ?=
 =?utf-8?B?TVpVaHQvamZJbHU3ZVZDNVRGWmlNZ0JFd0hnWkVHWFNBZU10MmI5V3BxbTdl?=
 =?utf-8?B?OWt4akVyYjJxejdQNlE2djFab1VydEYveUFDemRhREoxdUFlL2ZOVE9DU1Vl?=
 =?utf-8?Q?GYweGK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1luVkVBT3RNbk42aVNxLzc4TzdNcHdoNXFhRVZBYWR1WUkwTkh4WG12Rk9H?=
 =?utf-8?B?V1J4NDNoUWJPR0FaWDl5aGhKQVZVUjZZWXAvbHBVc1pBa25OTEl3MUl6QXBy?=
 =?utf-8?B?ZE1lL0t2WmZrSjlxZENOZEFxUFN6ZGJ3UkxxV1Z3NkhtNFd1RUllTTlqbEhR?=
 =?utf-8?B?Q3hMbXpJK0tkamNKQTM5eVRuSlN0V2hOcjlDRkVUUkVheDZNYWFNK1haWndD?=
 =?utf-8?B?d0VneVFGMm1ZRUpLWDZMRUpvNGxMcFdsaGxNUXlYSFphekFSS09ENXV2QXRD?=
 =?utf-8?B?Qyt4a01ZNjdZYmVwcTJ2aHNnbmFOMTd0U0NibWpTbmY3VkR1VDdmem9IeG8x?=
 =?utf-8?B?Z3VSMEswSHd3c1lMeUdQREVPWWUyUURkUWk0cHE0UURmTC9OQVNnVzlrZm43?=
 =?utf-8?B?am1mZG9CODBrYXF2aWVWRm1JTzZCL0FBTCtEeG9UZ3RnRFc4REp0MEtWazBN?=
 =?utf-8?B?WVFxc3g0WVlqcEVsMEcxR0p1bFZEY3I3UjlhMlZtWHBBa2czUm5tdVJ4RjV1?=
 =?utf-8?B?enRQNkpEbDNuY1FNaS9zVGxyTjM5YXR4RWZkb3BIZ2padUJaOGJtT3NVZjBr?=
 =?utf-8?B?NlJEZGRSdWQxUGE4K0o2eFBRWVEvSUoxMFY1aEg4Y2FFZHBYYTFHWUpmZGxR?=
 =?utf-8?B?UVNWbm9ob0VWOVNVUVhYVndqTzdqeXZFQVlDQlVTblRrcUFtWmxpV1llOFRZ?=
 =?utf-8?B?N0p6UjVXVTM3R2ttY0tPVk5WVUR1VTJpdkttQWFwT3ByVm9CMWFOZUdGd1Uz?=
 =?utf-8?B?dVVtd0dpUmNiV3ZwUnJnK1RYbkRVTjdSSXNyQ1lSakgxL0RLcnVGdFV0TVNp?=
 =?utf-8?B?NS94TytNWWIycVJZMnBmWlZlZHRpWlNFVWxHdHh3dzh0WE1MVU8vd2Mvb2I5?=
 =?utf-8?B?VERRQXAxL1poUHQ3YUI5UUdZdmFwcVpvWDNBM0NCczlST0IzQ09nY0JrcEVo?=
 =?utf-8?B?WUlsYkIvWkM5NkMxcndwUGo4OXV1ZGdVSGZlczVBem1ieFhTQUdCQzQwTHVm?=
 =?utf-8?B?bnpmbm10UjJOSys4NmlhWTVVdFN3aWJDSGo0T2hSRGY4TXFSWW9JdVlTaGtn?=
 =?utf-8?B?ck5acFRLTTQ0TUtzTW1NeGtpb1JrWUNmYmlsNzRoYnRxNXdPazFyOUpnU0dR?=
 =?utf-8?B?ZTk2VGZ5L1AwQXUxNTREY0xNT2Q4OHpXQ0JJTWphK0pBWk5QNEVPOW5lTEFT?=
 =?utf-8?B?MmlPdXF6UFFaaHhER3NyYmxVZHliMGFlTGR2azl1U3hOdDFQbnVWZXczbGFY?=
 =?utf-8?B?ZGs0bGR2anBlVVBYREtmKzJtUG10cHB4Z2R0bCtJd3hnbHFOS0h5Z3U5SXRo?=
 =?utf-8?B?Y0prc25sRlN5TkhXaEx2WUtxdVFDNHdSeE4vNFhONWRqNmNrVk80TUxXZ043?=
 =?utf-8?B?UlRhZ0J4eDNPVU5DalhoZTAwdXRBNjJWeFp0TUE3Y29pcmwvWVFmZnU2SXJB?=
 =?utf-8?B?RjB2bUxpQ2FJMStwOThoSkN4SEFHYnk0b0hXYmVSdGlSVUlpdWxsZk9jY1lx?=
 =?utf-8?B?N1FES1J2dExXRXlJaSt0TGpqOHh4cU9tZ2h1SEJwVVFzRWdOcEhoWFdjcGNy?=
 =?utf-8?B?ajVjazd6LzNUQVZhM3dlRS9oVHp4VWdRQ2Jhdk9XZkcraW1uVEhZSW1lK2tn?=
 =?utf-8?B?RC9mZTZQZ1BuNWtTQzQyUFMwWTNRVjkzN2Y2QXY2Y3M0eVpHQnFnSXdjTHA0?=
 =?utf-8?B?Y0gvakxwTkFveDhxTTRNRSt5RlhaZUw5aFd1WDNNWDVaeGdKQ0h4SHd5am82?=
 =?utf-8?B?U05NaDZxcDJkUEttbGp2d1c5VGt5cE9VQUhsN1lrQjdLUWh6OU8waW1YT3l5?=
 =?utf-8?B?SmU1RmkvTXAvRkloT0hlMUpnL2h0Z0NzLzEzT2NJbTZ5T3dmODgxNkt2dzVp?=
 =?utf-8?B?RDRGaXc1NlJMNStZQ3Q0SHN1WHV6SGc0bHRSNUpzem10THdydzRheGNhWWsr?=
 =?utf-8?B?QUhTSllCMjB4ekVqLzZHR3ZZL0lma2xPWXk4bzVudzhvd3kvRENjZ2ljVWZs?=
 =?utf-8?B?NC9DdEUwRWdHVExwZk1KaEptUExWTEFFbWJkUzdKaXU5VUpUU0FqUG4yWHR1?=
 =?utf-8?B?bThCdmtyaWl1bFFITy9UWFF1VXVrdzlGbHA4VitrYWU0ZlQxMmxmSThjMzdk?=
 =?utf-8?B?akl3UU1zM0NMSGk0RXhwRW5LLzM3bktNb2I4NGJ5WVZheEt3eThXOXVDYjlV?=
 =?utf-8?B?NEV1MmV5dWxVOU9vVVJRaFk0U0tEeFJacVdpT0N4Q1FSUTJQQnFNVU8rbGk2?=
 =?utf-8?B?TXB0akd2NHZ0UkJKQjVvVlU5UkJRTDJnOUxpY09oemw2cHlXWjhTdjgrbnRR?=
 =?utf-8?B?NDVyalE3Q3NJaHNvUkdtWjJRUXMzUVk5MVdEaGYyM2VGM29SdjNwZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae6162f-bafb-41c2-5e31-08de5289a511
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:53:46.7702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioF4eksbsuVzI7SaDXiUGPr79UWnWiUErg0Wt4DhHhGjEkGGJD+S40+TRZJAtYdVymkeFRMYNijx4Z1Qgm7c8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798

uvcg_queue_init() may fail, but its return value is currently ignored.
Propagate the error code from uvcg_queue_init() to correctly report
initialization failures.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
---
 drivers/usb/gadget/function/uvc_video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 9dc3af16e2f38957198bf579987f4324fc552c5d..f568dee08b3b7273be124a673682c02d20f7c77b 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -838,7 +838,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	video->interval = 666666;
 
 	/* Initialize the video buffers queue. */
-	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
+	return uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
-	return 0;
 }

-- 
2.34.1


