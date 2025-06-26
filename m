Return-Path: <linux-usb+bounces-25112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8243AE93F7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 04:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E99A3B1E1D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 02:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E70B1BD9D3;
	Thu, 26 Jun 2025 02:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Uyr7nOPl"
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013003.outbound.protection.outlook.com [40.107.44.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A88954BC6
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 02:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750904193; cv=fail; b=hp7oqnjCictIuVR3fqw9xMipqNg+SioudLTedoDgMZ9Dk+q5CDBMw9ngyl2yKXiTYsjVTmvtjm/se/1Mfh2xJzdR6A86K6UgfLPyvlqkMqNCaK+OJUb7FXI4EtQsMDNV/wbFQ+piukfyaQVxGcO0X2yElSgJflLP1WErfsSGcQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750904193; c=relaxed/simple;
	bh=S2V3CCnsgzkAhlIUTwlRVcc6kBIaRofYFPXYSQMwDYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F7uOQGEK5BWEDp7yjq/ilrhabrRfb0ohB+7jbIWPWAWTOCbx8uh+0MIczzIDR+3WKfXaOkJrfo3B2XKCtEYOsKUDg8KGX/cRDrCkMOgk/+Irv4rXk0Jn/zxnCUF6hU0Uclwk8p8Wetf4H4xPUvf+UeseT9n3xYS608FAfVpWnsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Uyr7nOPl; arc=fail smtp.client-ip=40.107.44.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz3IzzL4fO/3kAEGpSrs8dOwmT99uMK9ahlIfkDFTpcZnL97WPAP1vTfXneVEiMV3mDE9OLak1OVAbX0Dw8NZfbkqoklw3JzQak9gKtJMEWZa7YdP7NEFlg5YiamUk32fmglF8be1+Udo4NyFG40VQTfQleKE5QNZFFHWP4Y0TT3lxRWsiF080Km5PQNVnM5vssaklO0hFQqCvtaUlE3+ctXbIsu9ho5Y04d+4iu+uEEJ8NMFJo1Nv6Mr1rmNrajf84cWB9AuQB74Wz5nwu68WZyHT76tXxlRYwABzJ5eqDTklK/OvwaA4qayEO06Y6OVTxbd47i8QdBQPLiSnjL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2V3CCnsgzkAhlIUTwlRVcc6kBIaRofYFPXYSQMwDYc=;
 b=MNaSzdmZCtA9fUGG/yd7Rytm2ISfV4Q31RErGcUXogV6LRe4auIAE01EWETM/N/rxEZVu1mVoD/WodvG8WHNaMuqvSFFdBSP5HvjRxK3d410desPwwcnbR2jdJj/WEePMdRjNOAZYzaP7ry2YW1eA2KMNPUgxLLQH5NvWZt7FH4Q2R0DJ7x8tp/W+FJgswutvtg0YF4tV1KD5MnOWZpepKsNgeg5crejMJbDXYYmQ2ISGNQNA4Lfvfr/K/l5BEyb7Enq/7rXp7hdhuL6nFjYluoYFmCW7oXCesfz3iUMF+yIvNdvwKo+iei0PMtGKzg5+3gcDKYqtxzYkBiZ+XGAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2V3CCnsgzkAhlIUTwlRVcc6kBIaRofYFPXYSQMwDYc=;
 b=Uyr7nOPl9DPpAsuICR1u8DNR8lEP5c7hH92fZfBOHeSLbirhZn57v5QOqz35P2CTTMRKqBrGB2XJIMM9fAnx3B3tfGQXQfFeFhJLC1uoNs1PniBuUPyvxVCnHlc86hx75qdOnQKJ/nMbrmS7SyuAM25rsPBR9TrqVHC3rV+Qg6FykhUe2WhmiG4e1PqqTG2GeW/f8Us1jPW7SRAR8QHd9pAaO36OOFSeMwUP8RwxRJsw3JRjSXQ7/mDNxGlDpDhUBrPs4Qo/7Qxp7uMu3PbzJXX1NzLQIcsPsGEpNYrpBzmBoH0SMrTc5hrxcAA32iBSlNHoeGskk4yMprf7UjizNQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB5787.apcprd06.prod.outlook.com (2603:1096:101:ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 02:16:26 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 02:16:25 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogW2J1ZyByZXBvcnRdIHVzYjogZ2FkZ2V0OiB1X3NlcmlhbDogRml4?=
 =?gb2312?B?IHRoZSBpc3N1ZSB0aGF0IGdzX3N0YXJ0X2lvIGNyYXNoZWQgZHVlIHRvIGFj?=
 =?gb2312?Q?cessing_null_pointer?=
Thread-Topic: [bug report] usb: gadget: u_serial: Fix the issue that
 gs_start_io crashed due to accessing null pointer
Thread-Index: AQHb5eUE0hs25Spr/06lBQ83urxutLQUsqDA
Date: Thu, 26 Jun 2025 02:16:25 +0000
Message-ID:
 <TYUPR06MB6217AF1D00E2E1579EF92825D27AA@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <926a09f1-d0d9-4bc6-8cd0-996cda0af60d@sabinyo.mountain>
In-Reply-To: <926a09f1-d0d9-4bc6-8cd0-996cda0af60d@sabinyo.mountain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB5787:EE_
x-ms-office365-filtering-correlation-id: 6ea550b9-5ab6-40e7-ad52-08ddb4577407
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?OGVRN3diZHdBRmpRNTd6cFlTQnZ4YnBVMXJwMmtacHU1eGNhdmlwTUtmNS9T?=
 =?gb2312?B?WXVDTFdiN2xJUG8yRU52T25EOVNoSCt0NXU3Z2lZYllaTXVJU2dDeVlpeVVj?=
 =?gb2312?B?U05qN1E5dTZnTFY3VlRkZFcwSGpXQWxCa3c2ZkVnWDBQTlJPSjQ2TElWMzli?=
 =?gb2312?B?VkR5OTdzR1RjMnZWd0dJQUpoOUhlL3Y1RTRldHR0NE1CS0RDVllXVUtyRFhD?=
 =?gb2312?B?ZTRiaUE5S1hlQVdOZnVsSE5FSi9LL09CN1hqNXVZVFR0SVgzeUlVbTFqVVVw?=
 =?gb2312?B?cGQ4ZHBvUm1sSWdlWGM2V0tuSnBqdklnREc5ZmJETGtQUXdFcEE0dG4xZ0lE?=
 =?gb2312?B?U01iT2lsTi92MzJ0SUI3MnFNR2xMYzNmaU9maXpQa3FjUCsrOFNVTTE3SDBR?=
 =?gb2312?B?OWRWOUVXeTdNT29uV1hvdUM4czRQN01QM2RoS0NSd1B2eVppeUUzTVlqZDdR?=
 =?gb2312?B?WUFNb2tnYzExdnNWdjZZMEwyT2NEY2hSQ3Vmb0w0MlFHTFBUYXN4ZUNXWk9u?=
 =?gb2312?B?VGw0UlJBY3R4QVN2UDlzSG9sSGtxQXU5cHREYjBmbXArT0FyS2VDUUNVd0Vq?=
 =?gb2312?B?bjhEU2R3Sk5pcVpYQ2pjTGU5QThCUldBV1RDN3k2bmpGQkFKNjVGQVZJRWdY?=
 =?gb2312?B?bEV0eVF4dTBxb3hjOEJZaEYvbmZLSmxQcmdCbFdReWNSZXpzOE9uaHhvVHZj?=
 =?gb2312?B?VWNVbXlkZmUzWHNON2p6cm1wZXFVU0V3cW9GOHZ2Q0hzK09GZlk5UkU0bE5o?=
 =?gb2312?B?Um1lbXV3TnVrYmJqTzZNU2RLSmRSeTVudDdYeCtFM1ZuM0F3azQyaWdmcUYv?=
 =?gb2312?B?N0VMczljM2V0bkRiaDV6WXdJcm45dXRnUjNmZmRvdkMybzh5LzBZUk01UVFK?=
 =?gb2312?B?QXJ6eVk4d2NnemJ4VWFZUXpjdnAzTGV2M1k2cE5zNGRmbk5jZ2gxeElacTQ5?=
 =?gb2312?B?bWRSTGp3cCtSeTBiQ0RXc3ltL3gzMXV2MlVkeHQrTDhlZDJHM3ZEaVVEZ2tL?=
 =?gb2312?B?SWNYK3UzOTU5RWthUnhwdm96NDcrdWlXYTkycEQ3QjlybWZuWEV0eGtkZzJw?=
 =?gb2312?B?MFBkYlhYNWJUd3BwNnZoSERSblRYMlJXa3VhK0MvRzV0eVh6K2JaTEdqRmVT?=
 =?gb2312?B?WGdNMUVxd3JnMlhTQUJLeDErSmtiYzRwSTY5K0x4ZzdNdjFtRkZDenB0QnEr?=
 =?gb2312?B?dytLaDRWWmRZWjZyaEpLVFZxSStqTnAzQTVNWCtuSTZ0Wk44TE0yR1dRVnpE?=
 =?gb2312?B?SkNRYWd4V1g4YTBYeEFZT0h0NXM0MjRwNjBYQ0o4ZDJDKzhCcVBBMGd5emhW?=
 =?gb2312?B?Uks1cWExWFJoUjBKUHlZY2RZOXlLNXNXQ1RRYjYrQ3BVTVphTWVHN1dvWGt6?=
 =?gb2312?B?bWtzS2ZzdGxrKzJHQjNLOFNsVExiRVlXb1JIczMvazJVTzg5Um1vczVhNkhB?=
 =?gb2312?B?SXJlSkhBeWJ6aWRjS2RSNktUeUNva1pLYkV3T2FoNWZ4SUhWU3RFZzFvNnlF?=
 =?gb2312?B?c2dFK1F3NTRKY0NSSGdxa1FWZHFTd2NxRjI5S3VwcE9FUzBpdUtBek9NOFI2?=
 =?gb2312?B?WTVsZ2ZrdS9xNHkrLzE5Wk5yRWo3TGJHQlZjRksxYjdrQkNWTTVEdU5PWjhI?=
 =?gb2312?B?T2h1dER0SHBUdllVQWN2eTF2VThmWmd5bHNmWmR0SEVkNktKa2hDODRmc1Ax?=
 =?gb2312?B?YnJEQVcrc1dMYkFaZXdrMUE0RWhYeUFFV2dhRzZoSCtsNkZWek9udnQrclFp?=
 =?gb2312?B?dnhTdGVFRytSTS9nL3dTbkNvZklOTVB1dTk4VERDYzZTblFmSXQwcXlPVjZq?=
 =?gb2312?B?ZU1qUkFWbE1LMmJMTElRWjdqb3E1S2FzMlVHZDhuY0orUWhqbXJsNUg1V2RS?=
 =?gb2312?B?V25LMldudWZLY3Bhb3pZdGE5QTRwQUNibEZyM1dOU2JkVVhHbVVFc3VkanNw?=
 =?gb2312?B?TVBxQkU4N0NMdXBQZFlvNEdJbyt0clF0aXBxMzZIMlFBT1J4UjgxVncwelZH?=
 =?gb2312?B?SWpZM2x0aUpBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MkVTMHg2NTJvYnd6S0V6M1FIVE1VeVNoYlNKQzNHR0NxOHd0WGhXMEZWR0Vn?=
 =?gb2312?B?MUN6M2lsTzA5alNmYzhyOTZyZUVZTTN1dHNOSFNaVGtuUWxQWGRRY3pWWUtG?=
 =?gb2312?B?VEhWclhRdHdZVzRpR1NQSkFudEpLNTV1RG1RZENUeDZFNVZISmhEd2kvYWs5?=
 =?gb2312?B?c21VeS9MQjJXT2ZrR0J2N0IvdmIwZklwWG1hLzNqNHdvYndWc0ZuVDFnNXRp?=
 =?gb2312?B?TDlkcE9MY1M1QjdmL0VxcTNtejVILy9RVDhYbjZUa3BJU2w0STE4dnlyVHAz?=
 =?gb2312?B?UXVJMFFCY0V5NmhVSHJlcnBtZnhwWmxRZERKa093OUJ4WE9OQktKb0NXY3VP?=
 =?gb2312?B?bm9kMUF1aWd6bFQ4S1o4N2hmUmNZT2tuQ090Y2hJdWI2UXR2ekZoK1VQRFRO?=
 =?gb2312?B?SnFaTVByL09pNFlRVG0zZW1KTk9zQ2ZlVEgzS21EcVZmZEU4NWdERG1SUUxE?=
 =?gb2312?B?YlNRZmxyeFBlcUFEWVZLR1NBM3l2ZTFoWXIwWkxKVVB4L1daSG1lQWhLc2kx?=
 =?gb2312?B?YUdnN2hnaXVUR3J0czU3TDJTWjBvbW5WMHEvY1g2bWZ0NnM1Y2xQN0ZmelJx?=
 =?gb2312?B?aW1QUUxtd3JiRzlMQVhxV0ZUdFBlblhYMStTOERmN1Q5TStWYmhpb08vdFpV?=
 =?gb2312?B?ck9MNWxlZVNtZ3FTWk5NODhYWUllVS9kRmlOQk9CNFVqMEVSNVo4SE5zM2Vw?=
 =?gb2312?B?UVNTejNkNmNUYzdWVGpMUDJ2RGhnUmVSM1ByVitOd3BsYXZ4a2F6L0hRczMw?=
 =?gb2312?B?WWFZWkhSQXIvbUgyVXg3ai9ncDhSL0ZEOXFhSmh6QnFhVjZuYTBqYlh4Qzhq?=
 =?gb2312?B?OFJlSGhkMDhWT2k2WU9kRk52V3EwK3ozay91clZhSlYzZGkvT05OU2dwZkxE?=
 =?gb2312?B?MTB6L1NyemlFeVFSRWZhRFA0Q2FIVkwzT3gxL3Z5bDVaV1FqTEYwNEVuMkdH?=
 =?gb2312?B?Y0dRVjlrck5adkc1bm1ua2x6bWVOcW9nUHJZcUZab2FHNGlmT0hCTnZvcUo2?=
 =?gb2312?B?Ung2TGR4bkhUZmV6WFRnOGpPSGJTR2ZDLzRlaENlc0pRem5VUEtSL2NVUHJp?=
 =?gb2312?B?TGMzZEh6NGNLTXd2SUpJZmZaaU9CTElQZ2o1NFFhWTlsUU4yZklPT1prV2Fv?=
 =?gb2312?B?blF3L0JnRE9DeTNtY0syS0s1THkwVmlIUVgybGVaUzQ0djVvZzlDUjd1OFpY?=
 =?gb2312?B?QXNyNGVVaWZhV3d2TTF4eTZGVTk4Z2wrNjhndzhsLzZWUm5tS09KQWljckpP?=
 =?gb2312?B?Yy9mUGlxeFAwYjRjN3lqYk5UdEJnRGlmZmw5RFd3cU84bkhsMU9CaGcyUEhN?=
 =?gb2312?B?UGVYb21BdEtNZFkrYmw0Ni9xZTlrRHNNajZRMzNrR1JYY0dpelp0ZGVoaWlI?=
 =?gb2312?B?ejlxZUcxN2xTVk5qVnJEWWVlSVc4Q2w2dEZoVlZiSWgyaGgyU3N4NzYxSnY5?=
 =?gb2312?B?VER4VUZ6NVdOZ1RjOW80M3p4UlQ5dk1zb3grNzhpSzNJZUplK3p6TjJ6ZUFx?=
 =?gb2312?B?ZnUvU0ZaMVNjbGc0SVRkcTRleU1lcHFzTHFleFFXbEtNcm1nd2hCY3NlYjJC?=
 =?gb2312?B?TE9TajM1MW9tMUUwZ005RCtWak5rQmxEVmlteUYrcjZDanZsdTJMd3Z2Wk45?=
 =?gb2312?B?ZEZlU3RBTUwwR1lnSHBGamExRjk0UGFUcmhsRTM5d2hwRU5ieCtwTXZxdkhQ?=
 =?gb2312?B?b3FtWjQ0aTVsVXFCRVRjRlYwY0dZQ3NpdCtwYVpuRHFFamt0K1JkNCt3Yldi?=
 =?gb2312?B?SnRyU0p1NzlrYWxzeHVWdFhXcStRSTA1U0ErT0lGWnJLaTdHdFM1T2V3MDAz?=
 =?gb2312?B?V2cvSWlMZmNYQTFLaFJFcFZIcHFUZ3BLOFJRcHZJNzEvVFY3WWJvVlJIQmJJ?=
 =?gb2312?B?UlpjOGV3MG9XVjNBSUFyVisyMEpSNUFZSEo0UjJBUFVrdTFnZHhvenRFbGNV?=
 =?gb2312?B?N1AvejNvQ3ZPdHlCM0wrcjR6TmFJaUVPNWtRdkxZL1V6OElURTQzVGlOSjFt?=
 =?gb2312?B?amV3Q0VkTS93SEVUeHQzMmpOazFCT09rOVJRbVZHMXhOVGFEeXFobGsrVWZJ?=
 =?gb2312?B?eGp0T1lwZzByVzFFc085dU05TCtxb0ZHZXJET0RXeGozNlk1dVdXNXNUWWV6?=
 =?gb2312?Q?REkE=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea550b9-5ab6-40e7-ad52-08ddb4577407
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 02:16:25.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDOe7I/ew7aRS623yhtCptaUfncZZtM/ap6Ox2qTgQJ3BTY/ikLEz5yNZnEubMo+JJdpPmpfoWbkpNvGnyv3dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5787

SGVsbG8gRGFuIENhcnBlbnRlcjoNCg0KPiANCj4gSGVsbG8gTGlhbnFpbiBIdSwNCj4gDQo+IFRo
ZSBwYXRjaCA0Y2ZiY2E4NmY2YTg6ICJ1c2I6IGdhZGdldDogdV9zZXJpYWw6IEZpeCB0aGUgaXNz
dWUgdGhhdCBnc19zdGFydF9pbw0KPiBjcmFzaGVkIGR1ZSB0byBhY2Nlc3NpbmcgbnVsbCBwb2lu
dGVyIiBmcm9tIERlYyAzLCAyMDI0LCBsZWFkcyB0byB0aGUNCj4gZm9sbG93aW5nIHN0YXRpYyBj
aGVja2VyIHdhcm5pbmc6DQo+IA0KPiAJZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3Vfc2Vy
aWFsLmM6NTgwIGdzX3N0YXJ0X2lvKCkNCj4gCXdhcm46IHZhcmlhYmxlIGRlcmVmZXJlbmNlZCBi
ZWZvcmUgY2hlY2sgJ3BvcnQtPnBvcnRfdXNiJyAoc2VlIGxpbmUNCj4gNTQ3KQ0KPiANCj4gZHJp
dmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3Vfc2VyaWFsLmMNCj4gICAgIDU0NCBzdGF0aWMgaW50
IGdzX3N0YXJ0X2lvKHN0cnVjdCBnc19wb3J0ICpwb3J0KQ0KPiAgICAgNTQ1IHsNCj4gICAgIDU0
NiAJc3RydWN0IGxpc3RfaGVhZAkqaGVhZCA9ICZwb3J0LT5yZWFkX3Bvb2w7DQo+ICAgICA1NDcg
CXN0cnVjdCB1c2JfZXAJCSplcCA9IHBvcnQtPnBvcnRfdXNiLT5vdXQ7DQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eDQo+
IHBvcnQtPnBvcnRfdXNiIGRlcmVmZXJlbmNlZCBoZXJlDQo+IA0KPiAgICAgNTQ4IAlpbnQJCQlz
dGF0dXM7DQo+ICAgICA1NDkgCXVuc2lnbmVkCQlzdGFydGVkOw0KPiAgICAgNTUwDQo+ICAgICA1
NTEgCS8qIEFsbG9jYXRlIFJYIGFuZCBUWCBJL08gYnVmZmVycy4gIFdlIGNhbid0IGVhc2lseSBk
byB0aGlzIG11Y2gNCj4gICAgIDU1MiAJICogZWFybGllciAod2l0aCBHRlBfS0VSTkVMKSBiZWNh
dXNlIHRoZSByZXF1ZXN0cyBhcmUgY291cGxlZCB0bw0KPiAgICAgNTUzIAkgKiBlbmRwb2ludHMs
IGFzIGFyZSB0aGUgcGFja2V0IHNpemVzIHdlJ2xsIGJlIHVzaW5nLiAgRGlmZmVyZW50DQo+ICAg
ICA1NTQgCSAqIGNvbmZpZ3VyYXRpb25zIG1heSB1c2UgZGlmZmVyZW50IGVuZHBvaW50cyB3aXRo
IGEgZ2l2ZW4gcG9ydDsNCj4gICAgIDU1NSAJICogYW5kIGhpZ2ggc3BlZWQgdnMgZnVsbCBzcGVl
ZCBjaGFuZ2VzIHBhY2tldCBzaXplcyB0b28uDQo+ICAgICA1NTYgCSAqLw0KPiAgICAgNTU3IAlz
dGF0dXMgPSBnc19hbGxvY19yZXF1ZXN0cyhlcCwgaGVhZCwgZ3NfcmVhZF9jb21wbGV0ZSwNCj4g
ICAgIDU1OCAJCSZwb3J0LT5yZWFkX2FsbG9jYXRlZCk7DQo+ICAgICA1NTkgCWlmIChzdGF0dXMp
DQo+ICAgICA1NjAgCQlyZXR1cm4gc3RhdHVzOw0KPiAgICAgNTYxDQo+ICAgICA1NjIgCXN0YXR1
cyA9IGdzX2FsbG9jX3JlcXVlc3RzKHBvcnQtPnBvcnRfdXNiLT5pbiwgJnBvcnQtPndyaXRlX3Bv
b2wsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5e
Xl5eXl5eXl5eXl4gYW5kIGhlcmUNCj4gDQo+ICAgICA1NjMgCQkJZ3Nfd3JpdGVfY29tcGxldGUs
ICZwb3J0LT53cml0ZV9hbGxvY2F0ZWQpOw0KPiAgICAgNTY0IAlpZiAoc3RhdHVzKSB7DQo+ICAg
ICA1NjUgCQlnc19mcmVlX3JlcXVlc3RzKGVwLCBoZWFkLCAmcG9ydC0+cmVhZF9hbGxvY2F0ZWQp
Ow0KPiAgICAgNTY2IAkJcmV0dXJuIHN0YXR1czsNCj4gICAgIDU2NyAJfQ0KPiAgICAgNTY4DQo+
ICAgICA1NjkgCS8qIHF1ZXVlIHJlYWQgcmVxdWVzdHMgKi8NCj4gICAgIDU3MCAJcG9ydC0+bl9y
ZWFkID0gMDsNCj4gICAgIDU3MSAJc3RhcnRlZCA9IGdzX3N0YXJ0X3J4KHBvcnQpOw0KDQpUaGUg
Z3Nfc3RhcnRfcnggZnVuY3Rpb24gd2lsbCBicmllZmx5IHJlbGVhc2UgcHJvdC0+bG9jaywgYW5k
IHRoZW4gaG9sZCBwb3J0LT5sb2NrIGFnYWluLCBhcyBmb2xsb3dzOg0Kc3RhdGljIHVuc2lnbmVk
IGdzX3N0YXJ0X3J4KHN0cnVjdCBnc19wb3J0ICpwb3J0KQ0Kew0KCQkuLi4NCgkJc3Bpbl91bmxv
Y2soJnBvcnQtPnBvcnRfbG9jayk7DQoJCXN0YXR1cyA9IHVzYl9lcF9xdWV1ZShvdXQsIHJlcSwg
R0ZQX0FUT01JQyk7DQoJCXNwaW5fbG9jaygmcG9ydC0+cG9ydF9sb2NrKTsNCgkJLi4uDQp9DQoN
Cj4gICAgIDU3Mg0KPiAgICAgNTczIAlpZiAoc3RhcnRlZCkgew0KPiAgICAgNTc0IAkJZ3Nfc3Rh
cnRfdHgocG9ydCk7DQo+ICAgICA1NzUgCQkvKiBVbmJsb2NrIGFueSBwZW5kaW5nIHdyaXRlcyBp
bnRvIG91ciBjaXJjdWxhciBidWZmZXIsIGluIGNhc2UNCj4gICAgIDU3NiAJCSAqIHdlIGRpZG4n
dCBpbiBnc19zdGFydF90eCgpICovDQo+ICAgICA1NzcgCQl0dHlfcG9ydF90dHlfd2FrZXVwKCZw
b3J0LT5wb3J0KTsNCj4gICAgIDU3OCAJfSBlbHNlIHsNCj4gICAgIDU3OSAJCS8qIEZyZWUgcmVx
cyBvbmx5IGlmIHdlIGFyZSBzdGlsbCBjb25uZWN0ZWQgKi8NCj4gLS0+IDU4MCAJCWlmIChwb3J0
LT5wb3J0X3VzYikgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5e
Xl4gQ2hlY2tlZCBoZXJlLiAgVGhlIGNvbW1pdCBtZXNzYWdlIHNheXMNCj4gdGhhdCB0aGlzIGlz
IHRvIGZpeCBhIHJhY2UgY29uZGl0aW9uIHdoZXJlIGEgZGlmZmVyZW50IHRocmVhZCBjb3VsZCBz
ZXQgcG9ydC0NCj4gPnBvcnRfdXNiIHRvIE5VTEwgYWZ0ZXIgd2UgY2FsbCBnc19zdGFydF9yeCgp
LiAgSG93ZXZlciwgdGhlIGNvZGUgaXMgc3RpbGwgcmFjeQ0KPiBiZWNhdXNlIHdlJ3JlIG5vdCBo
b2xkaW5nIHRoZSBzcGluX2xvY2soJnBvcnQtPnBvcnRfbG9jaykgc28gcG9ydC0+dXNiDQo+IGNv
dWxkIHN0aWxsIGJlIGZyZWVkIGJldHdlZW4gbGluZXMgNTgwIGFuZCA1ODIuICBUaGUgd2luZG93
IGZvciB0aGUgcmFjZSBpcw0KPiBtdWNoIHNtYWxsZXIgYnV0IGl0J3Mgc3RpbGwgYSBwb3RlbnRp
YWwgaXNzdWUuDQoNCnNvLCBmcm9tIGxpbmUgNTgwIHRvIGxpbmUgNTgyLCB0aGVyZSBpcyBwb3J0
LT5sb2NrIHByb3RlY3Rpb24uDQpBZnRlciB0aGUgZ3Nfc3RhcnRfaW8gZnVuY3Rpb24gY2FsbCBp
cyBjb21wbGV0ZWQsIHRoZSBtYWluIGNhbGwgdG8gZ3Nfb3BlbiBnb2VzIGJhY2sgdG8gcmVsZWFz
ZSBwb3J0LT5sb2NrDQoNCnN0YXRpYyBpbnQgZ3Nfb3BlbihzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5
LCBzdHJ1Y3QgZmlsZSAqZmlsZSkNCnsNCgkuLi4NCglwcl9kZWJ1ZygiZ3Nfb3Blbjogc3RhcnQg
dHR5R1MlZFxuIiwgcG9ydC0+cG9ydF9udW0pOw0KCWdzX3N0YXJ0X2lvKHBvcnQpOw0KDQoJCWlm
IChnc2VyLT5jb25uZWN0KQ0KCQkJZ3Nlci0+Y29ubmVjdChnc2VyKTsNCgkJfSBlbHNlIHsNCgkJ
CXByX2RlYnVnKCJkZWxheSBzdGFydCBvZiB0dHlHUyVkXG4iLCBwb3J0LT5wb3J0X251bSk7DQoJ
CQlwb3J0LT5zdGFydF9kZWxheWVkID0gdHJ1ZTsNCgkJfQ0KCX0NCg0KCXByX2RlYnVnKCJnc19v
cGVuOiB0dHlHUyVkICglcCwlcClcbiIsIHBvcnQtPnBvcnRfbnVtLCB0dHksIGZpbGUpOw0KDQpl
eGl0X3VubG9ja19wb3J0Og0KCXNwaW5fdW5sb2NrX2lycSgmcG9ydC0+cG9ydF9sb2NrKTsgICAg
IC0tLS0tLS0tLS0+IGhlcmUgDQoNCj4gDQo+ICAgICA1ODEgCQkJZ3NfZnJlZV9yZXF1ZXN0cyhl
cCwgaGVhZCwgJnBvcnQtPnJlYWRfYWxsb2NhdGVkKTsNCj4gICAgIDU4MiAJCQlnc19mcmVlX3Jl
cXVlc3RzKHBvcnQtPnBvcnRfdXNiLT5pbiwgJnBvcnQtDQo+ID53cml0ZV9wb29sLA0KPiAgICAg
NTgzIAkJCQkmcG9ydC0+d3JpdGVfYWxsb2NhdGVkKTsNCj4gICAgIDU4NCAJCX0NCj4gICAgIDU4
NSAJCXN0YXR1cyA9IC1FSU87DQo+ICAgICA1ODYgCX0NCj4gICAgIDU4Nw0KPiAgICAgNTg4IAly
ZXR1cm4gc3RhdHVzOw0KPiAgICAgNTg5IH0NCj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50
ZXINCg0KVGhhbmtzDQo=

