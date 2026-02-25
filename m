Return-Path: <linux-usb+bounces-33690-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIHuGTmpnmntWgQAu9opvQ
	(envelope-from <linux-usb+bounces-33690-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 08:48:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CDE193B2A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 08:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 555573013977
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 07:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C83B27FB2E;
	Wed, 25 Feb 2026 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ea3mDrvr"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602442D372D;
	Wed, 25 Feb 2026 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005682; cv=fail; b=DAJLwglwycn07ZirJ3kAD5jfcGTs1jLM/dr2QytJ2Y6chDALJr1ku5wz3KOmfZ34QPXP0eiNOwLQ0LwkKH6DP7Pn0ZWphEd+asQ0BqyEpU9TAqB3quIfayL2cIg3cXI3cJMMaBIH5TwJE16/zLFsFelsWOT4yWJ4znlPtp/0g2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005682; c=relaxed/simple;
	bh=bLSQURzq12DwGuTcDOEv6rhMGkgbdkX1YIJ73mUWqEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XISAIRWXx4c3Sxjz5XQ97z3m8I6VChjJgVwgudCuFwLTwbPJJKkfrTM6ecCj0HA/slqVTsIzwoUQ6Ju6+9rfY5G1++ArdOd61viyPEs8JSmnesLm81mUJlcpDvvtlGWuBidy+aFvnIJTPWPgw/TFk+mMcXO43e5FCfWdUhCL4A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ea3mDrvr; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFvFf1l93Y6gMIBYizdY9/PerYYzj9iRgdyi4fYcc07gkK07wU6TEIxZHwcqLtOGyH4Eo0jvwBbzh8jXjyZP32Supqsd23ilzH2ZLMjt0gsgWPgzEEOrdtGlsL8qdvqv3VykL1QslitTvjh1E/vZPvTqMlLsXbEatnuWIu/J7DysFM39YfPveuR2mep2paKv4XaAi6MIJbxYy6h7sOf9apgC9pQyVWTjkFW2T06tlZ5SAy3n0Zbi/PYT9xgl99GsQJNnmjFvQZzfGSoeCVLVTMW2uItAkCYrt7QkTl/T85VLdqGUOwz4jf6/1uUWszn1DKLpiz5E30bjgyXqX6neSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3igoETuR5ahU0ze6I6BMgpnnAbV8QvF0CDgHSB6VgyQ=;
 b=KexkOkIq3hkVx3EsuJOr0m05+/pQwG+wKsqC7wKoO8U2t1IPGgjqpPSFp8wo/5yJ3MaagJ1B9kKgeb7A62Jlj/UUEDuO3tHqmSDTBHNU9DKRlQnI2TrYh+Wx3a6MYcKxBeF9eiXdCXfZjk33Zsna2RpBH7SCts6fZqXkCp9x0gWewca+28wX5zFFHA1eVIPkgfiNk5s3PoomD1el5BSzVDSGQW8wsu2TBigPlrFYXIQQWqqkILJcuB0BJMYlWnhiXIs1Np01+UfGvo180AIfjcAPzjOuLymz6OD/xmWEAoGCiueZgfolBXkFlYa5DOL5SqGBxW9Z9tPILHAPRBK5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3igoETuR5ahU0ze6I6BMgpnnAbV8QvF0CDgHSB6VgyQ=;
 b=ea3mDrvrV/ysbA44b+mGaaUwZmWZhE+225YzRTRQuw9gANiuDQZPKN5XG5AN7ByDxarMUfwc3+9rg20C/00NAiKgJOeVpDhUaC35dxoJ6tFaJnoPWApUc6XqSDpeJKHHPThf2zEEYUJc7BiVSFAn9E9//8Ikan03sHV5spCf/IFRebcq6a0+PRmLlV17RlAPsjnKBbTDkusg1n/S6QF2oTtSddjomABxDemGiHMc+x82TZUQ8hoCKYAIxSf/FHoHhSOQBnFAxTwLwANc+t/IUNw1fM+qnegTWU2ABop1f0tXLhWm50dn0AznVoBgHtzxsbYifaPpZXm9A/MM3HZl2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS5PR04MB10044.eurprd04.prod.outlook.com (2603:10a6:20b:682::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 07:47:53 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 07:47:52 +0000
Date: Wed, 25 Feb 2026 15:40:15 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
References: <20260224031909.3546487-1-xu.yang_2@nxp.com>
 <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
X-ClientProxiedBy: AS4P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::18) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS5PR04MB10044:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fa43c9-b38d-4f70-9ac3-08de74422d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2JMWGtPN3BsdGNFeVBHZ21RbUVWN3ZtQ0pHdUoxUVNhL2lpWUVxMG1MSTdX?=
 =?utf-8?B?WGdHa1ZuaUJlc2l0dGNKUXp1S0duc2crcHRITk4zdWkrUXJ0WDliZytuTlRx?=
 =?utf-8?B?YXNXM3h2U2VBTEcrbGxFMTc0SkZaT2M5NjdSNlJqcU1SRXQzU0dkcks5Nmwy?=
 =?utf-8?B?eUMzd2lJVUF2N0lrTVludVZkZGhlZFNnenB5SGJaeG8xbGhxNk8vQjY4ZG9I?=
 =?utf-8?B?cXV0VnZ5cUx4RUVxdmdNb3cvd0VJK3p2Z1ByWGYwZjZBMnRJS1E1dGRHMkhs?=
 =?utf-8?B?TUFXNzcyV0pWNnJOWEM5SkxDRWFSVGRmZXVVTFZQK0V2VWFzdXk3anJ3VlVz?=
 =?utf-8?B?RDJNeitiTTR0Z3dYZkJsMzc2cWs0RndFakI1VzkyL1hTZlNVU3FuRDFNVkR2?=
 =?utf-8?B?WGdBVXBUWm1iNXZzVFBKWk55OUg0ZkVvSi8zenUyallXKzVzdXI3WjdYbWt3?=
 =?utf-8?B?QTYvRDVlVFk5WVdBb2lyd0tZZ2VRRG5hOUw0TTJSZXNHdFpPbDBDNC9TeXR1?=
 =?utf-8?B?ZWhyYjRXaHBFUjQ0ZHhoai82OWJ4eUpVeXFtazJZNHBmTjA1RUFSM0FFZEVz?=
 =?utf-8?B?a2FpWFoyckJQU2dVL0ZtcjVJbStsODhhUnhENmlENFRwSFFTdTVqQTdzaXhE?=
 =?utf-8?B?a0dOVHlmY3hmc2NTQTZYUHRDOUJWQnl5Q2Fyb2JRWjZwYUthVnRINTJ1TjZO?=
 =?utf-8?B?YzlMMGtxS2hySjY0SHp0cTZTUFB4UHRvVms3Y3dlR1FxQXk0UzZOSU1aUXNB?=
 =?utf-8?B?dVlpb2toeFQ0Y3ZEcno1TUxZZDFNS3RuaGk4d1lZSTBhTUI5b1lFakIwaWc0?=
 =?utf-8?B?MnVqWnBIWm9ERmhhNU9pZ3IzOUVuZUZuNkVXaGxQTUswdDlVWHFEeFA2d2Z4?=
 =?utf-8?B?WTRTYStoaS9qT2NQOVp2bUdNcEVRT1ZsalFKNEZ4TW96K0hFZXdHblJ5bHN4?=
 =?utf-8?B?cTRzMSs4UWZaWDZtcDBieG9nTS9uYVNEaXpmUkd5b1Vaa240YXJCdWkxOWg5?=
 =?utf-8?B?bEU4cWw4Zyt5bngwLzZVZkFJVkN6aW9ZZ1ZMYlFaMUsyYWJNU2tPU3ZBNm5Y?=
 =?utf-8?B?RUtGazRBRnVGK1g3aWZ3TlovM3pKRHkwNktzd1BaVGQ1RWJnbXg1RDF3d1Fs?=
 =?utf-8?B?MzJwUVJ0ZmR3Qy9pcnhnNlZMdTVrZCtDejNUYThaQ1c0SW0wamR0R2tudG85?=
 =?utf-8?B?YXBKbmg2a3YvWnQ5Q3NPMVUxNEJuWWtOb1IzZXFha2pqdGkwc2VhTEpyYVVl?=
 =?utf-8?B?SDJoWXJJN0kwaGhrc2xnVVBLRk5zTlVueTc4VmNJZC84NDNXSWlPTGVlOEVN?=
 =?utf-8?B?eFRUc0NZdGt0c0xPSnY2UXNwZHF3VUI5YjdHbjA0emgxeFc1cFJVMUhJS01y?=
 =?utf-8?B?SEVIUlZJZEVEWnpaWjFwZVJ5Z094amx0alFBa1d1OGUyWnlmVnZWYkg4Y1Vy?=
 =?utf-8?B?cGU1TGxzMEM2dW95UmliRUR5aE5GcDgrK3RYQUIzTkdBOUxDamlqQ1oya3FN?=
 =?utf-8?B?QmFDNDJoOXd6ckV3OGRnWG53VEtudkdCWlZsdTk1eFM4M1lSSmJHS1VWSE52?=
 =?utf-8?B?cXNCZG95d2ZyWXB1MXFMbzBTN3VRYzVDZ0pxYkczYzZKb1dMRDNDdHB3TStQ?=
 =?utf-8?B?VWFOMDFSWDJzS05QMmxyS2JCMXFwNGlOZ2tOSGpaWGFJVk12TEVVU2plK0Iw?=
 =?utf-8?B?bFk2Mk5HbzVJUGFRbmJQNkxUcUgzSkJMMHpVc0d5aTBlUmtMU0drb3VrRi9E?=
 =?utf-8?B?U2FxeUlUY0Qrb1ZoMzlMV0ZOblNmK2JndWd5S1phKzdZd1dTK29lVVlIdG9P?=
 =?utf-8?B?WitOd0w1VVowYXJGRm5ZeldNRG5KTjNLTWl0VVRZSXdkL2ZqdzZUTHdFSXJW?=
 =?utf-8?B?eG94cUhzN2pBQW1aRUVlQ2JYeWR3NnJPcEN1R2I4TFptWVBEWkhOTlNtelVW?=
 =?utf-8?B?N3lUYkIwazJ3d1dpTXlYaWJ4SmlDWDIxOU9uY0xrZy8rMEhhSXJvMEhvSlVh?=
 =?utf-8?B?RnJscGJ6ZkFic3VYTVRvdmw4Ry9KWnNhYVJBU29XRTJkSkgzSDBFSm5PM0dK?=
 =?utf-8?B?TXB5dlVESnl3bTZLbGJKQ0NjTllnaHFnN3VpSmJZK04vS1F1M3lNVTVxOGVx?=
 =?utf-8?B?R3E0WWJnamxiRkpnVU5kSjlMVm15Wjk1cFl1bTBtNERETXg1VUszY2JxSVlX?=
 =?utf-8?Q?AuG/cIb2/01srImx0z720+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm5VbjlhZWttcWtkNVdsUVdJVVI4TUhqSWIrK05yN1VpYmRQdXBBVzRrWTIv?=
 =?utf-8?B?TThjMm5LWkR4RHA3MG5QWU9OanJRYjAyV0k0TCs3T1RSZExsYkZ0VDhSMGM3?=
 =?utf-8?B?cEVMNUh6Q3ozb1QwRWNOOHl6RGFFYjRQdS9sMG16bHljYnFwMjFBT2pISEc0?=
 =?utf-8?B?MWloTjE5OWN3VFFCTkRYandObm0rRndVcy9pd1RscHpQL3Q1eFlYeGk5Rzkx?=
 =?utf-8?B?NnZndEc1ZHFjTDNkNHFKRlZkQXZWWFVqNnFXaFRvNSt0VmUrYVJEdFI0N1Vh?=
 =?utf-8?B?cy9PUFRKMm9Ga3AwWDgveC9PcmcwOFFGTjgzR2tPeVJZdzhMbkUzdHhwNUFV?=
 =?utf-8?B?Rmo3TjcyKzNLZ3BmZTFtYnVTSVBPRWpnQVpiV3ZKS2RQUWtvY2R4MnZGbW9D?=
 =?utf-8?B?em5ORUlPL0ZFUmZVMFVJeDc0MW5oUm1QcWJITHpsYlRSMHdsWlRLcEU4T0NS?=
 =?utf-8?B?UWF2YXNjaTR3eHNhQm1YZlpDNndvZzJqUm1ucDRCUWVKSWpnS09KclNWTm9X?=
 =?utf-8?B?WTFUaFBLS0taUi9YQUVRT1p0K2JqcXp3cGloK2RtQmY2OU9sZUhld2NIL2RM?=
 =?utf-8?B?MXRXRGpYb2VEMWUxditBSS80cW0walA1elVRVEllcDZHU1hCU2M3TDRWT0lF?=
 =?utf-8?B?cmdSZFl3UUhRUUZ4S0d6aXNNUHBPYXAzTk50TjllWlZYME5SVWVWVFBjWW1y?=
 =?utf-8?B?aHJyNGExWGhxcWhHRGpSK0Z4OWtQS3VkVFdiVnBwTVYyZ3YzOWNLampKZzBP?=
 =?utf-8?B?ZzlBRzBGeTIwdGk4WkVpVHBNdW9oQndXRk9KWWVQeWdlRmxCMHdJOWZwdWcr?=
 =?utf-8?B?VnB6UTY0MHpjejk3NHEyakJWckpkdjltRU5mSTEvUWlHMk5wVXVyTE5leUph?=
 =?utf-8?B?OTdYOUFyOEE0bVJGb1Jhb0Jaem13bE1yVUlldVhXeHpQU0xlaEFmVURabUgw?=
 =?utf-8?B?b2tKVXhHT3pLUWtFQU8zZVgvRURLUFBCQVlUb0RUYmJua2tFR3AyR0Y5cXgw?=
 =?utf-8?B?aWJxU29Dc3lFeW55cTZ0emxvTFNobnMyL08vYXRNNkFybTdka0F4QXc0RGZu?=
 =?utf-8?B?NThNZjJHcGpLNDJrNUZEbDNZclhqNi9jZTdNelV6QlA0NEppMXlzcmVieElK?=
 =?utf-8?B?TlJXQWtjaitvVmRIWmQ2cTBWZG1oemtMR051Sk5OTjBwUmhteEJWUmZhNGl4?=
 =?utf-8?B?M1FGbnIydElGODZLMGx5YUMvaUUycW9PVW53Ujg0OG5yeVlHdGFORDRpazRD?=
 =?utf-8?B?MnZhK0dzYzlISFBFODNTZHpiRWJoOFg4K2JUTkdrdlhET0VuWXh1eVhpaGVQ?=
 =?utf-8?B?K2piN0kzUnZXdTBnck14dyttT0Y5TkUyWHNCZlZ3eEtobThZbk1uQkk5cDNi?=
 =?utf-8?B?V1ZTZHJCeEhrOW5jMjh2ZW9uc1crM2FvUVVpa3kzOXhRUnlXRlhqNmRaeXVs?=
 =?utf-8?B?UWh6dDc5L3lqSjV5Q0pxQlZBYnRHSE9wR2grVXUydnd6dC9Wa1ZzNUdieTR3?=
 =?utf-8?B?ems1aEY1VCtFOW5DblNTcFR4U3QxQi9xNm42dGREZ3V3N1ZSd2NYYnA3OHR6?=
 =?utf-8?B?bnRnMTNWR1V2dGtNdEMxL3NPUUJoMk8rN01qK25XUjkxZGMwd0JuRzQybDg2?=
 =?utf-8?B?UjFQNE5SYjBhdHFDaFlPeUtYcGhrUVYyMHlnY29vZFpqaEJYOERxSTRRLzZ5?=
 =?utf-8?B?SjlPYVJLd1o5eWg5NjFZVWxjcDdaSHE3YUd5YVZWdWMwR3c5Ymt4OGYwME4r?=
 =?utf-8?B?eVR5cC9EbnkxQ0lyZ09TcjVoNGlmQ2hJeVU0SHhjQzNEL1A5S3RQMHZXTmJR?=
 =?utf-8?B?SUpsK0hjMU9ZRFlUUzZQOEh4QlJXS013dkxvT1daWjB6S2dhSjJCMnMwQ2ZM?=
 =?utf-8?B?RGNBVWZmSlBROUo2SytDaEcvZ3FpTnp6VW44bGNpdVhnKzVlTnAvZ0o3SkRM?=
 =?utf-8?B?Zmt1YTBiY0orenIxWERRRlZPVDRVazN3M0NTTGlGSGQyMjE0dkZBQTkxRFdJ?=
 =?utf-8?B?QnROM2lhMG1KYUZ4eHdKTWhGSytIY3JGQ1djTEtzeWdMMWp1NTBSV0xIQWR1?=
 =?utf-8?B?WmVQUFNxMUtFQXEzOEwxUWNUR2cwMktYQTdlU2o2RGYrenh0SG5GdkNIZy8y?=
 =?utf-8?B?L2ErbzA1SGZ4SlJkeTFIYmlhQnl0c2t1RlByYThMSXhSRnhvSUs5c2NtcktN?=
 =?utf-8?B?eERaVlJ1bjBHLyt3Uk9oYVdaU1U4TTJuL0RPMmNvSy8yd3ovVmkwZ2dmNUZP?=
 =?utf-8?B?NmFSVktsdkVUUFNvU2ZlL3VOMTlILzl3d2xZV1c2MDIxZEZTTXNISS9ORzRa?=
 =?utf-8?B?Q1pIS1U0ZFBkY2xKY08vMHI2dnlpZldQcktXSzhwd3ZZY3FGVTVrZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fa43c9-b38d-4f70-9ac3-08de74422d73
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 07:47:52.8862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxXzuA3cmyhvQVVLNXp8fgKinacTH8jpPPGqLLTNXEjLtajLJMZmVXuQBIJXJvdz1O6HOuZcsfzgbOL4MrCE6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33690-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92CDE193B2A
X-Rspamd-Action: no action

Hi Fabio,

On Tue, Feb 24, 2026 at 09:19:51AM -0300, Fabio Estevam wrote:
> Hi Xu Yang,
> 
> On Tue, Feb 24, 2026 at 12:17 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> >
> > When a port is disabled, an attached device will be disconnected.  This
> > causes a port-status-change event, which will race with hub autosuspend
> > (if the disabled port was the only connected port on its hub), causing
> > an immediate resume and a second autosuspend.  Both of these can be
> > avoided by adding a short delay after the call to
> > usb_hub_set_port_power().
> >
> > Below log shows what is happening:
> >
> > $ echo 1 > usb1-port1/disable
> > [   37.958239] usb 1-1: USB disconnect, device number 2
> > [   37.964101] usb 1-1: unregistering device
> > [   37.970070] hub 1-0:1.0: hub_suspend
> > [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> > [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> > [   37.988175] usb usb1: suspend raced with wakeup event         <---
> > [   37.993947] usb usb1: usb auto-resume
> > [   37.998401] hub 1-0:1.0: hub_resume
> > [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> > [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> > [   38.118645] hub 1-0:1.0: hub_suspend
> > [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> > [   38.200368] usb usb1: usb wakeup-resume
> > [   38.204982] usb usb1: usb auto-resume
> > [   38.209376] hub 1-0:1.0: hub_resume
> > [   38.213676] usb usb1-port1: status 0101 change 0001
> > [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> > [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> > [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> >
> > Then, port change bit will be fixed to the final state and
> > usb_clear_port_feature() can correctly clear it after this period. This
> > will also avoid usb runtime suspend routine to run because
> > usb_autopm_put_interface() not run yet.
> >
> > Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
> > Cc: stable@kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> On an imx6x-sdb board, I still get the inconsistency below even after
> applying your patch:
> 
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> [   20.656414] usb 1-1: USB disconnect, device number 2
> 
> # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> [   28.263516] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> [   28.466813] usb 1-1: New USB device found, idVendor=0457,
> idProduct=0151, bcdDevice= 1.00
> [   28.466949] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   28.467039] usb 1-1: Product: USB Mass Storage Device
> [   28.467086] usb 1-1: Manufacturer: USBest Technology
> [   28.467126] usb 1-1: SerialNumber: 000000000003FF
> [   28.501826] usb-storage 1-1:1.0: USB Mass Storage device detected
> [   28.510452] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
> [   28.517597] scsi host0: usb-storage 1-1:1.0
> [   28.524066] usb 1-1: USB disconnect, device number 3

It's another different problem.

For ports which VBUS are not controlled by PORTSC.PP (always on VBUS
regulator or Type-C controlled VBUS), they are still powered on after
you disable the ports. This will cause PORTSC.CCS still be set after it.

When usb_autopm_get_interface() gets called, hub_resume will check CCS
bit and check new connection again. So you see new device is reported.

Below patch will be a workaround for the issue when you disable the port
many times:
https://lore.kernel.org/linux-usb/20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de/

However, it will still report new device when you "cat usb1-port1/disable".
To fix the issue completely, I guess the usb core needs some sync with the
port disabled state. 

Thanks,
Xu Yang

