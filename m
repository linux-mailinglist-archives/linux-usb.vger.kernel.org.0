Return-Path: <linux-usb+bounces-22522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57FA7A914
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 20:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34B318933D0
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 18:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200B12528F8;
	Thu,  3 Apr 2025 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R4Pd08rb"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624A171E49
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703933; cv=fail; b=Wnj5ir7otEET+vroCyYSkw37e4EgteGOfwBeI1SrUYpO6uw0ZK4guda9TSoSR9GmYZxRbLtQZvEtO9C3CkT7ktc32wkhwC5srXwHAy3Kv+JCRme371x3///AkuLtT1AXuC7WekqSJ3qQkK21jWjXlrU6dxpTXKxRVU6qkwlyjG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703933; c=relaxed/simple;
	bh=bb4VY4Bs6KRMRM4AL0dhlmsAjM93Ji9iKeUz9YG4EKI=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=j/h22T6I9Hg71TuPN9hpCGrjOuhUAjVC7Q3DYA9uGwGKAqgDkQSg+S9zSKS0tTlh16dIkIX+gtE1kmgnoY/5iNR9apOGxAz5ZOiHwe5MOiXWgE+qm+SnI4nKJ0BEgSYsvn8Kx7U8vy1eVMcTEu5rK9PCxdTHggzKzhJtCQRFFRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R4Pd08rb; arc=fail smtp.client-ip=40.107.212.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDthszPFb5eDSp8HwbL0pAvUG0bQElkwyNdzPoHsYIArtK5RUmNMmZ8L2V8Vt0OxhTsJSmufeTrTZprK5uunQ/jfXSALT15Ehl53wxLAE78GZ8SUtpGu8gF/7YAoqJ2nMY7ikDf6JkiUTxAF8wcvf8zsbGn+28mbc+vmdJ50vJ/HM8IXerAbsTSDQlK+ifBHMCBhNdYxJu7f7teB0t8gIQ047Sv78J+dsU5f3+ZOex/HtigPytzaLVttcvCWhIU73JAjpw0ke0y983oARWqhRzUtkGbW1ACUMIfI7NCO59W9N4mmOFQJxH72NZPk/Juw5oJw8ECPJMLkbE6wncu2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD0FI5289vXuDEdRGnQ8gmShsbCv5LpmYkZm50trqq4=;
 b=hfllKT/LyygzRmbCqTAeRgpfT0xRfwxtl4rG7gEh9FPW/GDi6w0TkFTxYcWrUQYwjptAY4ofgCxgI1pvDc1t2FShAO6DaEjfEEQQmJ0RoRBJfOz5TDQSu8d4cZLMQGJP3tdDJcDOqxzn6sn9TBqjt9Hg71ifT5Ddua+nujMOwQQBSFMDyTiKT7txZnElCTIaiVL542hMyoeX5XBzeqBkNFxE5IhY0BoQYttR6KmKyLq0zXseOTO/Qddhrra3u2GZF6TZOaYJ5EF6xeLVH9igGNYowRgbjr3hT3viuAkMUalbahzhTSbTpWhZPCFMAVuX9yTX91PvLo5CwGzs4ekHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD0FI5289vXuDEdRGnQ8gmShsbCv5LpmYkZm50trqq4=;
 b=R4Pd08rbhbtsyOsEFA6NAPRaO6OunI7zQ3d6ZJKAoXyYGAAl1eqb8MZBBUGCNv7vKYeTHECpIDIyxNVZ/DzXGT66hB6QCvH8MN2nJ3XfVGgrlcEOn/e/wjSOxhVJqcdVfRG0kpy0HxR9PfpAg8RvNP8K3hXJeqJxzzxhUUhgZmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.47; Thu, 3 Apr 2025 18:12:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 18:12:09 +0000
Message-ID: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
Date: Thu, 3 Apr 2025 13:12:07 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
 "Gong, Richard" <Richard.Gong@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
Subject: Wake on connect / wake on disconnect
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: d15fec8a-cfb9-4d37-9175-08dd72db0c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzNUODJ1Q0piRllQais4OWNBWC9rOHRQYlpaekpBN2c2Z1Z3amM4dHdMZEkz?=
 =?utf-8?B?NHpBa2hxd0VJL2U2MnVrMkVEZCtKTmdxeUtMcHRJbldKRGFQZ2RmVlFJM2pN?=
 =?utf-8?B?dEo2VUNQdkNiSzRCRjB1TFZSeDJjZ1hBMS9wMHduOThNZmxQR2gxam9MQ2xI?=
 =?utf-8?B?QnZBdS9ERHJ2UFBjNU45UDlzNWdXellXc0loTWFTWUc4YUx4bUMreUxsckpX?=
 =?utf-8?B?aFBBelBlMVZtZjZlc1k2QXZXanBNTmNVV1Q0QTYycDNnQXUrczU0T0tiZUNP?=
 =?utf-8?B?NW1FNDltemJXZlBJMHhhT1JwT2pGc1QxN2diejFSUzRNcFEzenhJRVJDZENp?=
 =?utf-8?B?TWVpOU5EWmRDNnhOSmRWcXY3YXc5UGFOOXoyS1MyQVhsS3UzbWZveEZ3UG9I?=
 =?utf-8?B?Vno3VUh1Zis1ZldNdjBPN1cvN0laTU8rc3REcjJaVTlkQ0YxQ0tzWmZSMTE0?=
 =?utf-8?B?cnF4SHdSa01PZnE3K1VKWWtxSUxqeFl0aWtyNmo1elVOQnVXbXREamhIRllQ?=
 =?utf-8?B?ci9yT2JvRGFXK2tyMjYxMXJ3bVgyVjZ6ZVhKcHZhRCtaajRFSThVeDNFWkNG?=
 =?utf-8?B?MDNoVHpVQ3NYVERoNXRZR21LSWJJUU80RXluQ3pkUVJ6NGY3b09pZGFoK3Qx?=
 =?utf-8?B?QW5ydm5ZV2tjdDNCN1FYOW5ZdCtaYU9vU3d1YzA1NnBESER3cEFSNnBkbDZD?=
 =?utf-8?B?ZXdFV1M5VlN6bGFXYXNuM1hjdVp0cVo1M2N3bUpjcnNxdjMrQTRtSTVNdm8z?=
 =?utf-8?B?NjZDek1ETm9iTzlRYmc1dmFvUXlxUUtLWEJ6ZGJweHF4MjgwcW5FWHRXMTFr?=
 =?utf-8?B?NTlsdDNaK284Z2ViOG1kVmFGZG0xVDg2R1dJZ3FnWFBLQm4rMWFwWGt5bng5?=
 =?utf-8?B?anUrRzg4MnJvK3pzL1RBQjhRTmhHZ2M4L0ErZlFwZDdjNnYwTnFLNVhGT0lt?=
 =?utf-8?B?UU1UTWMzVkFHUlhNOTNxN2hBQXY4WlhFM2pSNG9EZlVXRUZ4TlQ0Sis1eFpZ?=
 =?utf-8?B?MmVsRDVRTkF4RDVhZnZNK0UzYnVFcVlCbWhMSFAwNHd0MTN2VHp1bkNzVFR0?=
 =?utf-8?B?eU1MajJLck1GRWRvNWI0ckxPZExwK0s2N1Q2MUtSWGpyUEQxenU5MUg0Mnlm?=
 =?utf-8?B?K0RHVWpGbFd3d0EwRnZhczRxNjNZY0M2ZGJUVHBqTHNWdDM1RXdUV3NyNzlm?=
 =?utf-8?B?eDlQazArT2JNdEJJclJ3cTZrYkF5ZWRLbjJIcnVKKzVXQ2xOWERaRVJSQmhT?=
 =?utf-8?B?VGRKZkZjZDhpZmJGUUxvOUpDOWx6eEpteURReXV5Um82SFVWVTAwWCtxZ3dN?=
 =?utf-8?B?LytjdXpaT29MVXNmL3BHTmQ0UWthaWp4MHVIZ1hqMm9tWGVNM3BGaXRhN1ZJ?=
 =?utf-8?B?U3lMSE9GeVlYWVNtaHo1VlhkeUJiQUhkRGFDS1lyWmZYbkdOTGx5bjhYa3FS?=
 =?utf-8?B?eG45dk4rVlFkSC83dkZpSmoxTHlsS2ZrMjJxYTJ0SWxpNkJjODZneVhHSFlx?=
 =?utf-8?B?VG8vQncxTFBKVHZ4TjFWWDdhQXBMMDk2THFzdUJjcm9CSGFpeE5WdnBFVlJX?=
 =?utf-8?B?ZGYrcEFSQStyR1hoZEJIdFFnUTNvTEgxem1tTXQ4aURQV3pMRXFncWF4SzA0?=
 =?utf-8?B?NWN2aS9YZXBkRkdEbUU1dGdDS2dzWkpqRmgwaXdUeWQyOTVFS2dGQTFYeGND?=
 =?utf-8?B?ZnNhVmtWNUtTNlZwUWc5ZkpLakNFeXhJQ3pQeDhyQjNIRXd5Yjd1NWJwZ0hQ?=
 =?utf-8?B?VVIvaWlTeHpOY1kwc1RCZzNPSndCUDloendtQVl5MGFEZldXMVdTNTlZQ0pw?=
 =?utf-8?B?TDQyeGpKOWRXR0FlZFR4OCttdURpYkh0QlczdDBwS1haZ0MvRW9aM3ZLUXJP?=
 =?utf-8?Q?0fa8NNKPwWCBK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjFUZkV4MjA2ZVFaQW02R2FwaXNQOXUxQTNBRXA5MlhNTmladHdVMjVXVUF2?=
 =?utf-8?B?bDN3Z2UxK21VbjlUeTZaSDBzSHZWVlpPUVZ6K3RUZU84c3pjcGtPZFRvVEFy?=
 =?utf-8?B?ZjRROTFFL0ZhSlpPbTZEQlVJQjg3dnYrU3BHWmlLWGZjS2RMRHdNVFdDZWFo?=
 =?utf-8?B?MzhFWVd0bHFPcStpTkVwNStlR29LeUV3RE1qR3c5VGM3QUpwZlYzU3ZyTmZU?=
 =?utf-8?B?MG41VmNpcFF6MjgrdTkxNHh1YkhJRnRSdCtWWVAvTDBTTmx5TUF0cUZvSnZH?=
 =?utf-8?B?cHdhUXUxNmMzWHlGMGdlQmJ2dWNZYWRxQ1l1TUZoaHY4ckFYTlYvMFFld3lO?=
 =?utf-8?B?Y1BKTmJoMGpOeTRGbVY2OCtmc0dFVE1RMEFGMUpETVdKSUcwR00zOEdYR3pS?=
 =?utf-8?B?djVienhTWisvbGJnMWVnVU56UzIvcXpzU3VHWGJpWmNkRlFURjcxOHoxazNh?=
 =?utf-8?B?WXNtb016aDBadGJjUmVyUVdhTmYrK3pETDYwWFQ1czJoeVlWWjEzVHJNK0tW?=
 =?utf-8?B?RW44QTJDZFZZcVpyMWdTM0s4K3BUU1BPS1dlU2FuZ2p3SEpSTjJEVzNVZkFO?=
 =?utf-8?B?Q3U1Zys2akRKcW4xZzRSTjNHRTlqcWZQUWV6MWNRQkU2bmRSRHh1bHRzNTJa?=
 =?utf-8?B?aVIyd1I1TkU0MkorSjNyYTFYbWNJZVB0cDZBblpnNUFDYWhmWmFISUJmcGRz?=
 =?utf-8?B?R1JIU2tRWVpsZmtVYXllb2xTYzZiZnJuS09iOVpXMW1GMXRZMlRIZytObVoz?=
 =?utf-8?B?alpZdDMrc0UySEN3aXg3c0ZIaVBjSitMVGs2WlQ3NGcxZDhGYVZydFFacVRs?=
 =?utf-8?B?SnpzN3ZVWVJuVWdjSW9OdktOY2p3YzBPeHdXTUhLR3NTUS9UTTJqdkp6dHZ4?=
 =?utf-8?B?L3JORFd1TFFoQmpaNG1XQXFJaW50VUs1c0JtTUFPb3RiQ0srT2hwTEpSRUZW?=
 =?utf-8?B?WWVJSm5IbjdSaUpsMzVvVzdaS2ZDODJNNjc3Yi9mOXNlaHF1b2JIVlhIOXFm?=
 =?utf-8?B?b29FWDgzdE8zY2JhOU5zZG9HeGNCOVBETjd6N2NvNmI1NVY3WWNJT0cxOVpF?=
 =?utf-8?B?S2FyUFIxaHA0TWVLZE9uNi9QV2ZVeVVRa2s2dis4OGxnc2t5Qk5MK1hLSEJj?=
 =?utf-8?B?UnZ3Z25WQmhUQ2NCZEE4QnBIMklmdGIxdUhTTVg4WExaTVB0bkZQaERDbnRs?=
 =?utf-8?B?WHMwYzdhM3czalRoZEhXdjJoOHJZV1Mwazg1ZXZ6NnFJcllKc2djSzYxQWFD?=
 =?utf-8?B?UDFEU296TWxDS1Njb1E4UnZvOVEzT1RTb2RhL2hhMFVBVk5uSlJzM3ZDZHdL?=
 =?utf-8?B?NEJKaHNaeFQyalNlZ1E0clJLMkI1UlRRRUFBanZHdThhWnB5cUhWeHRFeTk0?=
 =?utf-8?B?V2hDRlFTNWZnUDR0Qi9HU3drRzdMSFRiVUZXVy9LVFhHdGp6bGw3czJCZEJX?=
 =?utf-8?B?SDRNT05CeStQd29XMDRXaGFINEZ0M0Y1cytCVFA4VER4OTJoblZ5U0VjRGlj?=
 =?utf-8?B?RThQNFdvbW4yYlB6MTRHeVBvT2VTVGg0anU4azVKbkxuTUlwd2Zza0wwdWdH?=
 =?utf-8?B?eDhJek81S0hOUlprbWQvMTJ3NzJFN25ZRmszM1c5SzdLZGNSTGtwVjVxSFBP?=
 =?utf-8?B?Y0d0bzZQZUpSYlV5WGl1Y2hFWGVXMkpmWjl5RGo1ZUhud3hrSEhGbUIzbmww?=
 =?utf-8?B?clh5a21pNUhxQ2pnOHpiWHNtTDFodjI2K0Q1b29sNFh2VjhmZTNROTM1QXQr?=
 =?utf-8?B?WkdwalZZalo3bjRlTzhoSFlEZHBualNNRmw2RktON2tqTmRHQzltOFFKaU13?=
 =?utf-8?B?TVVESEJKemRmUGtOSEE4VGZsL25xaGFHRlZMUXZNWlVkNjZUajNlRkZ0N2Z2?=
 =?utf-8?B?S3pGVmRYS3hTZWdxakRONjJaTTJXMmtNbVpDdCtUWFF0eWJxanF6bmpnZW1p?=
 =?utf-8?B?SnBIQitsWVovNll6YXAyVkVyRk45Sk1YV2xmVmYxYjNYZnhuQzR0eVdaSGN5?=
 =?utf-8?B?U05mb1pOQmthTktHOEpnYTA1ZGZLaGVodTBXZVZUcjNibWh4VzNJaGlwRloz?=
 =?utf-8?B?Nkhvb0RlVGdOUitDOVRVNlJyMzJuV3RBT0FsMzA0dzhUdFVESjhYOFVjWnZt?=
 =?utf-8?Q?p0/yxlbQhjdQAsUQzV5nSn/ud?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15fec8a-cfb9-4d37-9175-08dd72db0c86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 18:12:09.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHEc5i+iEOpEo2yrGxYITeCQBylNnbXxacNnGY5PCeJFPj4ftGEnkECMe6B8ffLj3HeedsTjUnjmBcqlyMrMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

Mika,

Recently there are some conversations about wake-up from 
connect/disconnect happening and I wanted to get some background from 
you about the current policy set in tb_switch_suspend().

Wake on connect and disconnect are only used for runtime, not for system 
suspend.  Would you be open to adding wake on connect as well for system 
suspend?  This should help enable use cases like plugging in a closed 
laptop to a dock (which works on Windows).

Something like this:

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6a2116cbb06f..f2f6a085a742 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3599,6 +3599,7 @@ void tb_switch_suspend(struct tb_switch *sw, bool 
runtime)
  		flags |= TB_WAKE_ON_USB4;
  		flags |= TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE | TB_WAKE_ON_DP;
  	} else if (device_may_wakeup(&sw->dev)) {
+		flags |= TB_WAKE_ON_CONNECT;
  		flags |= TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE;
  	}


Thanks!

