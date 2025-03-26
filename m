Return-Path: <linux-usb+bounces-22187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69EA71D0A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 18:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0D9173759
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 17:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F9D213E70;
	Wed, 26 Mar 2025 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="SJvKN4hr"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140FF2135B4
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743009794; cv=fail; b=pARXnSg0QF4AAmKTC3rDpzoF6FCDfTG8N34RGXDZJrrxVLJCmKEZM8rjwXNRqi1zJ1sh14kFuoPXzMjgaugyCByZ0Hhqbyqk8kK1Hms1sJQ8F8yIjCvj/r+k4OU+xAi1P/uvX5wUokSc1/Unqpl+CQeaMdJeLDlQ8ftvlgoUluY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743009794; c=relaxed/simple;
	bh=AEH7WL2AgcTMWE64x73iXpgfmFWASI5OXmr5s09XU9A=;
	h=Message-ID:Date:From:Subject:To:Content-Type:MIME-Version; b=E7oEYVoRR5z1nT//+/ZZkYW536rcSDoanW8ZVbJIJylSxbMcwWE7mcFUY+GB2JvwoCfQdKsVfQm23kZNzluQ4YDG0TDU2vGrftdSahMAm+EUGMzap/hfz0QMEJHY0+VmDJYU+Mr0fw4P9sBPoCb/l6Xjjd1MJQ5pr20Wt3HfWlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=SJvKN4hr; arc=fail smtp.client-ip=209.222.82.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49]) by mx-outbound22-19.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 26 Mar 2025 17:23:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfKLbt82cNIuEaZ6o6hXKYB/qO6FjKoTGmzmPWxdLDshEGseQGTnimC/157CcRjimsfHrX2aX/gKWC1ffzUb4xkbsDesddH4s+Om9f7DgsHhEho4J6XII+sdVjvq9iQfJk4VdURwGWvBXgNXJo687hEgDYXq5PifgJP3fuom9S1BBLzjVC5TCtcpeGPToBe4Oq65myryiMUC4knWaK6+K1NiViNRpE+g+pCEYH1x8dj8WUQCe5xKFsVezlmOarKW9qACJd7sYSERo0lQLCPA8YryLMpsKdQLXh1E22zjELH93kXyZ36WMd2Cp98rSl5/xRKzQr1FrDOZ5XxuTK2eTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWbJ3VQnXKBOnSbK2mshDn86pqZp4njs64qdrP2fZgE=;
 b=ADPz+S12zkuo2iGX6OHzXZo6KkIwNX7VeDZoV77C72+LllObEFvjdCO0KHv2oBgjt0TLsAwuHXvM6lU4d3G0Aq3PvRNS1quaHIV3pVqgMODhwOHx15ZtMUK4RYTW5yfNEhdLl+kJlnp1/Ib/JJEbGLykFxHimMoKv4+ewUUehZ5zIo9QR0zbrDvLR1NzUUReMWbqHpO2WnQKgxnvb/KsRO3ENJsfE6ZTa1JI10wq5G/rmcsmw2EMgcG/9/oXxsNLNfsOoZTZj35Qi5ygFAFSdSpQSe4tjHCdncu/WXFCBu9vDWi5LVIXEqgLQ+xvKo3JaaXe6Bwd+cqfT09EF0fPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWbJ3VQnXKBOnSbK2mshDn86pqZp4njs64qdrP2fZgE=;
 b=SJvKN4hrBIkcFAJpbqeij7RtDkDAS6++I3OBNZg/FYPtBPQCbaN9LsdNPrVVKVWdDewDJnl/LapCEfiiK2fttcs0s4KtfFaIKLBaEr+vbFK6BJ3AvIUC1fFPuDpDJ/hUTCpU8Q0ekXNcHx7SMxeyXqGAr0HbxIq0jS2HgMvUGjxFY5/TbFHV/oI0uE29N4zkWGYx98XHbKev8i4A4U4kf8KKVQ46iULFHg5q5T2d6TL8pgw5+7wII16z0S9VjlhPoJHb6hV0rOXC+6IJ2Xhi6uX0DD8dR2iBzk/6h/kUzs0WomZTsxqZN1CK9ykmqQjxXb9WtopZtLT1rFrDe3o7oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by CO1PR10MB4771.namprd10.prod.outlook.com (2603:10b6:303:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 15:50:32 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 15:50:32 +0000
Message-ID: <cc40e75d-1a7c-424a-8edb-3ae17bfd1462@digi.com>
Date: Wed, 26 Mar 2025 16:50:28 +0100
User-Agent: Mozilla Thunderbird
From: Robert Hodaszi <robert.hodaszi@digi.com>
Subject: Handling incoming ZLP in cdc-wdm
To: linux-usb@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|CO1PR10MB4771:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b71a66-bc22-4edf-69a1-08dd6c7df03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkI4bWlPR291TklIdUV3WXA1ZGh3a2VNWnc4MXBXb051d1hPN3B6Z1NDY0s2?=
 =?utf-8?B?K1lsclQ4L3U4ODlQSzNXcW1GYXZ1MzFLUkorcm9qaE5BZFNLQ2IvNWlUWG9W?=
 =?utf-8?B?NFdQOVB0dmFQdGRPaWVTdmJ6R04rR2Zmb1IyWllQV1RDMGZEWlZicDdDK2RG?=
 =?utf-8?B?UFNmYVpoSTRISEFvU0Ruc1g2UldqVld3ZkdNblZhNDY5L2IzeWFFR3ZIVWxh?=
 =?utf-8?B?ckxCUlFjRTgvbmNSVmRCbmtUZHVmTkExWThqbUo2RXZmVlo3WUFSWVlPMW5q?=
 =?utf-8?B?WlE3SFpKclJkNnhjUUJkdjBSUG5odHhuTUJxMy9qOEtieEk1RkZYbU9hNEw4?=
 =?utf-8?B?dHF2c28rQm1SbEg1UkxwU1FXZWh5VmdsSElhK1B3ZEdzWUxxbFhTUGtJQkto?=
 =?utf-8?B?bm92TjlKOG8rS0xVcy82SnNENHBFZ0pmYVhhaFhXRys1aUFtRDZHU0FWT3Fr?=
 =?utf-8?B?WENVM0krY09Rb1IvL1JYbUxod216eTl5alBoNjMyZlhBTXJHTnVuQUVkdCt0?=
 =?utf-8?B?VmpKZDBtRDErSlFQak5HYXFFOGNNTUk3LzJOcDB6OVhMS0FhRlkraFBNeTc3?=
 =?utf-8?B?K1pXb3NaZVFsdS82OUcyV2ZwZkFZa1BDTmJic09uWWJyMXRRWVZiTUkwV01I?=
 =?utf-8?B?cWtiZnE2T3FYbWVaejNHL0VSSk8rSDhTMTVPUVJBalFQeGVGQ1U3TksxWnJq?=
 =?utf-8?B?NFF6NzRWNXdpclBXQXNLOTVWUk9kMkppTlRMUEtWVGNydFE3bDduV1ZBR0M4?=
 =?utf-8?B?Y1YwaDRWZGFmZ203KzNlNkNqQWRLK1ZzWkFvRDJ2NXk4SnBndVRGK0wxaHRa?=
 =?utf-8?B?cHNITUJmaEZnbTAxODVVTGRzSVFlKy9MQXV1Zk84R0tLdjdvMk9jSDFPYVFh?=
 =?utf-8?B?c3g4UklMQXZwbjFFTzc5Mi9qS2JvVzh1SFlTR2hxRnluSUNrdytnSG5vSXM2?=
 =?utf-8?B?eHZ5RkdjWmpyb1lTelpJaWY3aElaU3pUT2VqdW8rS1k4YWxBUHU1K0xyS3VG?=
 =?utf-8?B?VjJOaUtkakVVK3ZZK3VuNXpqc285N3c2MkxKdmo0SmFVUXNsajJiNVJzSVg0?=
 =?utf-8?B?ekxvMHpUVnNnaUl5T3F2ZktlcG9aUkE0RnRRUGZOeklqSW1DQmpMbVVWNjlS?=
 =?utf-8?B?eFNtY3JzbzdmR3ZoTmlqWis1a1FYY1U0aTlOaC82SkF0cmU0YlU4cDROaWF4?=
 =?utf-8?B?L1U2cWNJbG5sSWErQVhjT21zNkU3K2R4SnQxQU5reXUwYzZOd2JvZzFhOSts?=
 =?utf-8?B?OFgxSzYxWlQzNXR0dG5yekQ4RGd5ZmI2Zlp2Q0hVeFJBWjMvNXZacWdzTEFX?=
 =?utf-8?B?UFUvbDFjV2pTcnU2VEl6bU1HaVQzZXgrZFZESGhaa2RwckxneUJGVlh1TEdU?=
 =?utf-8?B?NHRDTmlXMW9wbTNEbGM3eWhWMkNHSzd6WTBTeUNTL3ROUHRnaTFvN3kxWlNB?=
 =?utf-8?B?REJvMUxxU1plWkdzMGtoaFM3TDZteGVCQTBXMXN4cWkrdHhqTWxEaXVxa2dj?=
 =?utf-8?B?U25yU29YdFZ6bnI3clI4Z0lzanBVczN0Sng3ZVc5TkJuYXRqQzhlMmYzeFVF?=
 =?utf-8?B?TkF0Z3RPcHkxQ1FJYXNsNUFIUzNOeTZnR3M5ZDduL0FrdDd4T3BPREFTbThM?=
 =?utf-8?B?UTI0QUdsNU1iWDAwUFJrSXVMa2Vtc1h6d2RuS0JTbDI0U1dwRVRKVUlKQWNG?=
 =?utf-8?B?TkVyTnZXdG54RllDcG1ZN0huV3ZEYitYeENTa2R4ak9ORE01eWZJOTBSSFZl?=
 =?utf-8?B?K3FCYnAvUjA5YkFGQ2FOU20yeE9XV211eXJ6bVhHWjZpQXpTWk9FK1ZFN2Nh?=
 =?utf-8?B?VGE3WVZ3ZUthaHdLSWhlTGVrdURkQmJqRmpFdGd1c0czbVB0bXFQdFJ5ZnVh?=
 =?utf-8?Q?EqSgL0YviFFZo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2RUSSs2TW5QZGNDQkNjUytjSU1hUzQvZ2hnVkJYOTUrSDFCUDZEZnhCMFJh?=
 =?utf-8?B?QThvWktRRTZvVlRDWi8wOXdOaFN2WDdDdVBxb0ZLbVJSejNNaXF4NllRaXdm?=
 =?utf-8?B?N21FSGdmcmI0OGtmWHRXa1gwN2NubWUzazRicWhHbENXZFNWREw4eitPMGtK?=
 =?utf-8?B?Rkc1NVoxMXBzcEh6eFJLWEgvOHE3eEprREhBeCs4MTc5N1dtdCtKZ3pibXV2?=
 =?utf-8?B?QUtPaVJvanVTZUZjbG5sVHhrck93bkI0RjJlZ01pYlZMbktJYStHdmc0WWcw?=
 =?utf-8?B?NHZTd0ZJNmo2SGdTVHlEdlZJaUhzRkJla1dFS2NxRXorbmwrbFBVK3pGSUsr?=
 =?utf-8?B?Mi9PajFmM0xib0cwNVFaVkRscnIzOEYwMUlyenJ5UEU0a050RElzL0hSTWpK?=
 =?utf-8?B?N2JsdGptVnUrOUl6T1ZxVVNsUFhad3UycmdrdVVMUTgyT0hhc0tNMWwvMUR6?=
 =?utf-8?B?Tm1KaHA3SW9tTU9HKzJCMTFYSzFMUTRKODFISkUzZkk1U21BRHkyemdpaGM5?=
 =?utf-8?B?eW1QTUJEOS9PZlcwNEhBSUZVU1VxWGJwQjZacW5MVURQakhWNUE4QW1xV2Fw?=
 =?utf-8?B?WFF1THJZTjFtUDZxanRUOVY4aTdhTGs0RjJDdGdUSlF3MHFvdFVmallLL2s0?=
 =?utf-8?B?ZncreTRaWE02VU52cFRoaG9sWDF3SXRDdVRaRGxFa0pOa1lVU3M4empBM1dO?=
 =?utf-8?B?L0U0M1Q5OEtqcmxDV0dmeExNdEdxREZVZHhnZDR4bllPZ3lGV2c3WEVhN2lw?=
 =?utf-8?B?OS9UYysrVDFJdHhjcWEyMnlaUndoVG03cjZDMUxiY0tnM2tMYnNscTBEanMv?=
 =?utf-8?B?dk9TTFJmMFlVVDhiUzBPaVlWNnpMdTBPdUJINlZ1cHoxK2R4eERLT0lrNXh0?=
 =?utf-8?B?cXVoU3VjTTloNDdJS2Z3eE1CSWt6N0VXa0Q5WDM3MVZ6Vlh0RGwxL1BkRnFS?=
 =?utf-8?B?Qlg4UWxvZ3daT1BsY044ci9uY3pNblpEZVNJbEh0SzRTMEhWQTExMkhjMlhV?=
 =?utf-8?B?NHZ4YVgvSmNtVFlpSzBRdGpXZENGbWszOTh1WVp2N2U2NTdLbTYxUnBsNVJK?=
 =?utf-8?B?OEcraWdSZGQ3QzUzeFI1R1pJRy9sSFhGM3hmeExmamtXbHhTdTVycVQ3MExq?=
 =?utf-8?B?bnJzTjd3L2RvNUx2MWU4NVFERDZRS09TUEdTZmpvNnE3THMxSXlTc2J4YjFH?=
 =?utf-8?B?eW1ManlCVlEwODNuSVQzVjRjWFVrY1dFQTI0SkdqVkJrbzl0b2RPa1g5UzB2?=
 =?utf-8?B?bCtlanBUSjFWc3dZVUc3V3hLTUpqYXZkTTZ2WURMYUZjU2R2SXBScm5pbE5L?=
 =?utf-8?B?LzFIWDYzMy9QRldXZTYyeUEyVis2N3VNbjFENzVGYmFuWnNYbmxRSnRyaklt?=
 =?utf-8?B?Q0J4UjAwejhkbEpmaE9VQkJHY1ZKY1VmeHBPQzJRbWtpNnZjYUVWMlNWMHNp?=
 =?utf-8?B?ZzRlWVpYUjhOM1hUN0VZL1hFY3NFQlZ3c21ZUG1XNkhZZW56N0JWUm5QbzhS?=
 =?utf-8?B?VDQwLys3SVVvMVNTbXcxSklha2RBZGtqWXR1dXo4bmxVZENIR01va3QrN0hr?=
 =?utf-8?B?amoyUjRYaGhFRkhxZWpWKzdHY0dMMXA5OTAxbGxRZDV0dUFBZzZObUl6dmVw?=
 =?utf-8?B?ek5KZ3ZFVGFhejZNRERDNWp6ajhnZzdBOVUzbno5b1pNM0llZHlYS0xnaUdI?=
 =?utf-8?B?bVowZ2JML0NKejNEQ1BMMmVjb0pNUlc3c2dwZWZHNWZQUEdweGRLcDczenB0?=
 =?utf-8?B?QVB6bEM4QWtaTjNURUk0OTMrL0xnK3Azby96N3d5VmpqL2YvODdKNVZGT2JP?=
 =?utf-8?B?QUJOY0JFS1ZlY3JZcFJzK0tNYlBmeVBENnJiUjhDcEFTdUg1NG5HcktoYVZ6?=
 =?utf-8?B?NkNVL1hJWFM3bTNsZmE5VXNPRWdQT2o5bjFNWmNHTk85TzlnSTh1Nk42dTVz?=
 =?utf-8?B?cEdZSVgxS2laZWlUMjkxSCtXMndlZCthb1JoQnh0QnVWbXpXV3pZWEx4LzlT?=
 =?utf-8?B?Q2xIYS9uUFkwRHVSZ29uYStaaWUzT2ZPdE9nY1lvSnpkUmttcGxPYlNVZldL?=
 =?utf-8?B?TFB6NXhESXI3M1BubFZkMlBmYUZESVZiM0d0NVhKbjBaZjM3TkxGZTBqbUts?=
 =?utf-8?Q?IAoroauXotXLognnOF+t6fc2v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b71a66-bc22-4edf-69a1-08dd6c7df03a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 15:50:32.1127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfatgjIOkV7oejaSxL89jwOOCW+JnKQhvMaT6ntCZ7JdXXmJbtvCLfpi4DfIso3kJIdWKFYXkwmyMth7Kdn2KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4771
X-OriginatorOrg: digi.com
X-BESS-ID: 1743009788-105651-7705-1857-1
X-BESS-VER: 2019.1_20250319.1753
X-BESS-Apparent-Source-IP: 104.47.51.49
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsZGBqZAVgZQMC0lzcjCJNE81c
	jIINXA3MLSMCUt0djUzNLE0sw4NcVcqTYWAEOx/T9BAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263436 [from 
	cloudscan17-44.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

Hi,

(Sorry for the long mail, but want to describe exactly what is happening!)

I'm having a weird error with a certain modem (Telit LE910C4) + ModemManager. In some circumstances (e.g. SIM switching while there are some other ongoing transactions already from ModemManager, or stopping ModemManager in the wrong moment (again, ongoing transactions)), I can make the qmi-proxy stuck, and can only SIGKILL it.

qmi-proxy gets stuck in g_unix_input_stream_read() in glib.

ModemManager tries to read an incoming message (/dev/cdc-wdm0), so it calls g_pollable_input_stream_default_read_nonblocking() (glib), which first checks if the stream is readable with g_poll(), and if there is, it reads the data in g_unix_input_stream_read() (glib).

What g_unix_input_stream_read() does: it polls first (uninterruptible (EINTR) loop, this is where it gets stuck finally), then reads the data. If the read function returns with EINTR or EAGAIN, another loop starts, and goes back to poll().

When the issue happens, the modem sends us a lot of zero-length packets. I see a 10+ INTERRUPT_IN URBs, without CONTROL_IN URB, because qmi-proxy is busy with close the connection (sending CONTROL_OUT URBs, and doing other things). In the INTERRUPT_IN URB's last 4 byte (cdc-wdm driver doesn't handle that), I can see the exact same number. I guess, this is the frame ID, as usually that gets incremented. So I think, modem tries to inform us about a pending message over-and-over. That's incrementing the desc->resp_count counter in the cdc-wdm driver.

Finally qmi-proxy gets to the point to try to read in data (and call the aforementioned g_unix_input_stream_read()). But the modem is only sending back ZLPs, I suppose, because it informed us multiple times about the same pending packet, and it doesn't have anything more to send us (and it makes sense to send ZLP in this case).

The problem is, wdm_poll() always return with EPOLLIN even when wdm_in_callback() receives a ZLP, as it sets WDM_READ. So it makes sense for glib to think, there's a pending packet. In wdm_read(), if the packet's length is 0 (desc->length = 0) and WDM_READ is set, we reach

    if (!desc->length)

line, where it puts out another URB (as the resp_count is not 0), clear WDM_READ and go back to "retry". The second time we test WDM_READ, it is obviously not set yet, and as we are reading non-blocking, the function returns with EAGAIN.

And that is the issue here, as glib in this case thinks (with reason), that OK, it has to try to read the packet again, so it goes back to poll.

Then another ZLP succeed, wdm_poll() returns with EPOLLIN, glib calls wdm_read(), which return EAGAIN, etc.

Finally modem runs out from ZLPs as well, and has nothing to send us, so we just wait in wdm_poll(), and we cannot even interrupt this loop, as this is a non-blocking call, and EINTR is disabled.

-----------------------------------

I think, that should be fixed in cdc-wdm. So I'm wondering, what is the right approach here? Should we just return with success with a 0-length packet from wdm_read()? Consider ZLP as an error in wdm_in_callback, and schedule service_outs_intr work, like if desc->rerr is set? Other?


Thanks,
Robert Hodaszi


