Return-Path: <linux-usb+bounces-31341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2ECB0A1F
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 17:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DBE93014A10
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 16:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A50329C67;
	Tue,  9 Dec 2025 16:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ehYRAIDS"
X-Original-To: linux-usb@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F871E5205;
	Tue,  9 Dec 2025 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765298996; cv=fail; b=k5Ca2hVpwhV+sKcHhEAJWuDKp2VuUZPX3eW/pSokZVDXLJHEpbPXiMJwgTL0PEebP/5iO7cySrncDK/GILKRbgOB4AwDmogGFKhspez5+mATGJis9Fv0lkxnPV/KmO9Uhe7q0cGlzxDWhkP5YY+3GJ9E7Dy3EgvLTOPNxOciJjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765298996; c=relaxed/simple;
	bh=DDarMgMYOK3OzsO5UOfI1Hu+8zMQwpThzhpizm1lj/E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QJPYRcmlVuESvGWrW8ZagmkHwlDmPHNOi4+KQe5ZmCJFQolugNJWgMZ+1Puk2RaesbhOwFAh7mwaHBoQ21QgJBLKyQ7Y1gPDvtlj9oZA8YqIgKxc5RhgDSU2/WSEX1uZfVJ0lzc/s7WprGLFQwS7UgZRaM8SP48CMf7bFpiyFnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ehYRAIDS; arc=fail smtp.client-ip=52.101.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7HOFMOYqRMb4uy3sc/rIja15ECT5akXljB0+kpt8EKGiQd/AC3OmrTWMPe7b/XzxzE36VZsov3ceMbBZO5zxScoaRmYFTArwquWmqD5Eevu/SYTYNg3J/Vd/EeFHCIdP8s6WigJPnAvAfeMHd3Va0W65qVRa6HZbR4gq968eJTUCaL6h3jp5fMms7SbY/aN/Bu51wgLM1ZH3Nhqn1oy+PalOzwm4AhpVJHQLYtNHcCh+zLzyDRUxyzV7IpK1jw4IuJgALz+8dq/mfWpQL8ieBSQe3yOJ8Id6a1plkBKZghfbOlsLcePIXqzxNTUPFaK9jfifmsviVRabzKYbbWo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaYolYIJ+TsSekhETt/+IEOblifNGMCBMkeVOtJooFE=;
 b=mA7i1ghtfuoU6QIakcd529uy7ILQTQRXaGzZCmaDsJwZNDvHMKnsh75yvHRwptPzkD+gESG14Y3ZgfO7p1O/PWxTSKxlySIYaG3pzVEYjsqx5N+IpNm6j4YC5X/eBkhbEg34Fqw5OYbinlRvJlln9FRc32nP88R+8yNfuo/GA/oIncy6rA9nLvVptrnR5Sjjr+gFBFAgkt7MZOvr6m0JqZBJ2cxzRKCX6tzNH6YFbiAHprtVgCJ7twNuxAAEc/wvmUK2IUmG11APeUQ8nZ+i1OUoPSzHt/mjzAadXUR9DBNMs4w6PdGY/9KnrTzMQQktxGeejkh/VO7xjnJQWzRwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaYolYIJ+TsSekhETt/+IEOblifNGMCBMkeVOtJooFE=;
 b=ehYRAIDSf5KgPehP0p1wy2Vme9+Pz3D3j4GVs/io+6hDK6iYyzoxyM4w39ECaoIx/a/+2z9XREW9kLtAlRV62F1JofP4/hfFiiMlTFBK30deImrUeafzCKxxEjlgdjSHnYnHIXQpylXl/32jhn3zarRpmHhLQes0vzWHpUf4bTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 16:49:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:49:48 +0000
Message-ID: <cc9cfa46-ff93-4fff-9333-23f959e14fa8@amd.com>
Date: Tue, 9 Dec 2025 10:49:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, Sanath.S@amd.com
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251209070633.GA2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:5:174::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df4bdab-870e-4a53-dc1e-08de3742f71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjhZUzFTUFdRTVAzMS81M0prQXFOU2pHdThKWFMvWVZaOEVzbjZRcjNsbWU1?=
 =?utf-8?B?ZzQ4NTgyQkpTSE12bjFSdXQya2loZE83VVhkV1drRVNVK1VlNWNBVWJtK1U5?=
 =?utf-8?B?TThOcjlsQUthSTVSckRHSTQ3c3FyWTNYdVV1bktzOCtsMjAyVzE3NUxxcjVU?=
 =?utf-8?B?eTU2Ykh2SVNWODZGSjhWNDRweEdWT2xKSlU5SUNBcEgxUk9wQlpJREFiem4v?=
 =?utf-8?B?aytEYXFRU3VEakh0anVNVGFNTFlWMmpwZW02d28rVyt4ell6aFpSdWNWakF4?=
 =?utf-8?B?dE1Jc3NLT3dzWVRITXhHUUdaQmlZRjZ0OVl0UGVJSmgvWXYzSUw0RTVXL1Jn?=
 =?utf-8?B?R3JIbWp2cFlNUU84cU5ud2NUUnZXVzJGQ1l1SGlibURUV0xsZkFCTEVBUURN?=
 =?utf-8?B?TVNBU3JGTkNMU2JHRXl6YmVoMEFwZVN3TUdaTnlEMTZXN1dpYW9KR21xaW95?=
 =?utf-8?B?blVZUVU4Um9mQTJOdlduTWV1V1dvMndMMXJTc2hkWUN1S1RhM0FiUEp0N2xO?=
 =?utf-8?B?Q1g0ZDZiS0N4YmxUWGdMSnNmcW44cXhRMFhMM2htWi8wN1RremRGdEw0b3Za?=
 =?utf-8?B?cVBqQmhJc2VuMEcwdnFENjhmZjhzOXIzQVhZVnBBcWFYcmpwNzBOME5Xd0dU?=
 =?utf-8?B?RnovV1RuY24rbUk3L1E5M21pSFhCV0dqcDFhVnFUMWlHK0h3UGRnOHJxZUpK?=
 =?utf-8?B?a05OV3cxcm14eU8yYkpxeEVRdVoxOGN5bi9oKzVBcFB3aGpsd0x0cTZRKzc4?=
 =?utf-8?B?byt1dnhwL0FqN2ZTcFowWXRVMGRiRHhkK0N1MitNTjIyWEdZUWpVV2pHZmNI?=
 =?utf-8?B?STh4NVZYcHBqaXhiNVduTjRuT1JERWdIME9kcDZWNUdOTUFtaHNha2l3THFJ?=
 =?utf-8?B?RkZROHU0ZzcvT1lDcndIZ1QyMUFLaGJBa2xxb3VhdUt5bFdNY2Joc0FRa0xN?=
 =?utf-8?B?WjZUcXQvZEhNVGhHT2dIUHpIOS9keWdaMHpLWE9KOGRScVVNSjExb3g0NTk3?=
 =?utf-8?B?emltbUxscGg3eFU4TEhWdXNsQmtScFNSR1JGaVJub0lGOElPVzJvZ3l3UVcv?=
 =?utf-8?B?NU4wdjRONStPM3c4Z2pkYTZ5L3J1NCtUcEJ6TUNudG5aQis2blh6Qy9JSDJT?=
 =?utf-8?B?MUNNeHZhdjJ5c09tMUZZS0w2L3R4K0FGd2g0STNFT0dJUStFdVNSMkhHd01h?=
 =?utf-8?B?SHVjWDc5dXhDT3A3WWhhS2NtcFpBaXBKcmZLRkdmYXJtcC93QXZkTTg4LzQr?=
 =?utf-8?B?NUYxc2FaQUJWNlR4ZlBIc1dtTWU4bk9MRUJzdlNqbnFFczJjQUlJVzlRZDB1?=
 =?utf-8?B?ZS9VQm1oS3ZTNDV6VVJ4Yk44d2RDbjRHSHdYdHUzYzE2MTNONFdVZG42ZG94?=
 =?utf-8?B?RFNRbGlrMGtxNUJGWnIxMjI2cjhRNjZib2lrTDVzaWhwaXdxL0ZCTWtRUitP?=
 =?utf-8?B?YVRYR0V1NjFBK2ErcFVnVWFhZ2RrM2FJM0tON3hGVDhiMnZsQnVranZudG9F?=
 =?utf-8?B?RXB3UjdYMkd6ZFNTT0lPMW9oWnh2djU5N05pK2FLWWRQZnh1Tm1OczVoL3Bv?=
 =?utf-8?B?ZlAzT1RLVng0THFKMEVZcnUvdUNDR1FRcGFrdHBMQSs1YUFDZS9qcTMwcEQx?=
 =?utf-8?B?TTJmdlM1bG1MOVltYTUraEZpRDgxL2J0REFaa0V5TW9wZzNKMVBMTVJQSUhE?=
 =?utf-8?B?OWdHSXlaYWN3dXlrb2ZOTW52bjRCSFJ5Zk42eEdhV2hvdkQ0Q0tYZlVHbE5v?=
 =?utf-8?B?Q1NWelhOK2N4Zm9zampvc1JFR3MyZ0pPNXp1WGZGN3A1cUQrZTJWeGh5bFph?=
 =?utf-8?B?RVpWaGsrdFNId1JhZWg2YXZhUWdyTnAyd3ZJSTFqZG9uOHRyaGxMT3dyb1JQ?=
 =?utf-8?B?MDVSeHNqYnV2MWxId1oxTmMzb3ZwNHM5cWxEM1ZqTjZVMXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjRZTXdGZ2xmUVQwR2xpZUUrMXhtU2ZhQ2FGNHZnVVRuSnk5YmJsOUdJZzc0?=
 =?utf-8?B?cXJ6QmpHaXlhMlV2blpPVmJPODNjNWlpa2JZT0d2YVlLUnkzUnZKR3RIWkln?=
 =?utf-8?B?VmNpT2VBRC94d2NyUVI4aXB5d3FEK0FScFhDMXJZRHdiNnNLL3c4QWNxZXZw?=
 =?utf-8?B?T05xdlRHbi9nZm96ZGZxWnd0RnZZRlhBV25NY2FUNHhubmI3L1RvZCtvdlE5?=
 =?utf-8?B?YklCTW5DMVBCcEhTRlZZZndSOHBBRVBKSmFucVdEelFyZndmWmNucjlCd1lL?=
 =?utf-8?B?T1NyaGI1U3dUd2lLa2l3VTZBVG1KSnFYU0NqazZxcE5hYU1USDVIUHhxRWlX?=
 =?utf-8?B?QkM2Y2t1S1ZKWC9aT3VQTmVRcTU0RHlWU25qUHNHS0UrbW9tUDE0c2l2WmVS?=
 =?utf-8?B?OHJCekNyRTBIM0QxWGNaQVcyUG1QSkFxK0l3Y2FOdVA3clMremhXQzdaNXZq?=
 =?utf-8?B?UzJjY0hneEp0ZVVWY3dUVVFsRzE5MnNBb3owWk5SanRSK1Nyczc0SGJSOGRV?=
 =?utf-8?B?U0FHNDlWVlAxSmtPVHRjeHJvbU9EMnBUb1RzWGtrbnhqSjlUSnNVNXFVTjQ2?=
 =?utf-8?B?d0N5eStRVFRkMmFFelI2S3NPVkpzVjhuajZYdFpUd2NVVE0xdkNaMDVXZVU0?=
 =?utf-8?B?RlhpRFNURyt6L0ozelAvK0h2V0Y5VERGOFlQdENMdDdxY2JTT0lIR3pRSnNN?=
 =?utf-8?B?Q0tRdVdEZStlZVNmZXNkWlc2cmhaKzBRS28xWGk1NFpBSGVsWEc0Uk9ISDE1?=
 =?utf-8?B?M2tRK3lHc0c4TUxZTnByaE1tWnFjRndtNFZWUW55aUNVd1NOTE1mNGpDK1c0?=
 =?utf-8?B?UDVNMW4wdGxYWHJBSks4SUdBQTF4L3hWN2hVaW5tTFhnK1FlWlZldWFkbTlX?=
 =?utf-8?B?WmZIbmdsN0xwcVBvcjZiYkRWWVhyTXJFQXNSU3pvWFNYMVdBZGkyaFNOcHRG?=
 =?utf-8?B?c1IwRzg2SVFkRG1qTTZzMlRlT05RZXR4TmJqRnVGMHRvMEdjQlZpTit3MG1n?=
 =?utf-8?B?T3RqakxyVmdTMlk5ZWY1ZThBQSt6Vmx0U0hPQjl2MWtObEtJR1ZCNmt4Znpx?=
 =?utf-8?B?VktOSkRnQUFydkg2NXZSaVl4NWNsZWgyTkU5Q1RiNWNxTElIRGtOaytqUTFn?=
 =?utf-8?B?ZjlvNTZPTnVEWkhydW5BbmYzRVlCN2h3NUdreDBqdWlDRGNsR2lUOTFrelpu?=
 =?utf-8?B?SmxPVzk1d2t1VlZQTFFCS2dDNHF5K3V0SDQ2UGwwTzY4eUR1citDVHpOMEpa?=
 =?utf-8?B?NXc3OHVEeW9TSGFFZEErTWEyditvaG1uUk4rMW9HdnNsWmptR0dlRkcySW0v?=
 =?utf-8?B?K0JNSmsxUTdReXhuQ0Q4cmoxNVBFdVBxZlN0bTZKYXZjL3lTemVqbThrMkIw?=
 =?utf-8?B?M0s5dUtyMHdRWGl3NmFKZHBDTVVCOW5oWGdCdzJzOVZlUTNObWdoWVorbm9P?=
 =?utf-8?B?SnI5YlVyUjY4STRLdVU1UGh4cWFjUmcvWGt4NzdxbkJ2N2lZaTVrZ091bmhZ?=
 =?utf-8?B?YWl6UHVIZE5SSlZ6cW1sZHJwc0xZd0dBRjFJVUZ5akZuZklYT3hiSk91VjIv?=
 =?utf-8?B?SXdjUWRYSVZ1RVQ2dzJBS0p5aEE5VXUzRXFDdmJ6d29QYWYyNWduTzRhUTBr?=
 =?utf-8?B?cSsxUVd2N2VwVDNvUFNhMDdZbGFPY3gvVlQxU2Y0WStFcXhwbFJ4NXZWYjU2?=
 =?utf-8?B?Z1hzTDZSS3BTejBRQVRRVndDZzYrTi8xempPajZidnUvckZMYllzU0wzaDZX?=
 =?utf-8?B?NmFFaWNsWXc2cFkrYW05NVZyanlqQmNCN0FOUGxicnVLeVRrYk1kQW9Ib1Bw?=
 =?utf-8?B?VDhXNFppME5DVG54YUNZajAyMFlDRVgzZU5UVjdIaTlFaXRSTUZqVXB0bDJt?=
 =?utf-8?B?NUVNZDhsVm44TXF1QmVNWmNOcG1zSVBXY1hLdVBkUExtODhlOGw1N2ZLMXZK?=
 =?utf-8?B?YkZ0NUVYRzF1OUFGSmZtd0xMdG1ZYlNIdzBqeHZkd281dkdpcmNTekYxQzlV?=
 =?utf-8?B?ZlZzdjZYUHNNVy9rd1NYeTlmNjZYOS9ja2tVMGgxcUZiTmdCWDJoS2ZMVWxp?=
 =?utf-8?B?djlQVUZkdG5HT3hHQTFsbjJTN0Q5cTd5T0Z4T1FvNU9FdmYyakJGSG9hQjFW?=
 =?utf-8?Q?fcMIWPCzp4ypVkzd41VCIUyX6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df4bdab-870e-4a53-dc1e-08de3742f71a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:49:48.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HU50I0/L0iTTTd6lS3V9YVQtyHFyGVhcjiHa4LFqbqxxZ5WbxGdjA3IrQDW2H3R4QeejMb1nzPBrMsrDE793qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932

+Sanath too

On 12/9/2025 1:06 AM, Mika Westerberg wrote:
> +Mario since this is AMD related.
> 
> [Also keeping all the context].
> 

Thanks for adding me.  A few other thoughts I have:

1) Is it possible that the USB4 controller in the monitor is powering up 
or exiting a low power state during the first hotplug?

2) Are you sure this only happens on AMD host?  What if you cold boot 
the monitor with Intel host?


> On Tue, Dec 09, 2025 at 01:41:41PM +0800, Chia-Lin Kao (AceLan) wrote:
>> When plugging in a Dell U2725QE Thunderbolt monitor, the kernel produces
>> a call trace during initial enumeration. The device automatically
>> disconnects and reconnects ~3 seconds later, and works correctly on the
>> second attempt.
>>
>> Issue Description:
>> ==================
>> The Dell U2725QE (USB4 device 8087:b26) requires additional time during
>> link width negotiation from single lane to dual lane. On first plug, the
>> following sequence occurs:
>>
>> 1. Port state reaches TB_PORT_UP (link established, single lane)
>> 2. Path activation begins immediately
>> 3. tb_path_activate() - > tb_port_write() returns -ENOTCONN (error -107)
>> 4. Call trace is generated at tb_path_activate()
>> 5. Device disconnects/reconnects automatically after ~3 seconds
>> 6. Second attempt succeeds with full dual-lane bandwidth
>>
>> First attempt dmesg (failure):
>> -------------------------------
>> [   36.030347] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 9000/9000 Mb/s
>> [   36.030613] thunderbolt 0000:c7:00.6: 2: USB3 tunnel creation failed
>> [   36.031530] thunderbolt 0000:c7:00.6: PCIe Down path activation failed
>> [   36.031531] WARNING: drivers/thunderbolt/path.c:589 at 0x0, CPU#12: pool-/usr/libex/3145
>>
>> Second attempt dmesg (success):
>> --------------------------------
>> [   40.440012] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 36000/36000 Mb/s
>> [   40.440261] thunderbolt 0000:c7:00.6: 2:16: maximum required bandwidth for USB3 tunnel 9000 Mb/s
>> [   40.440269] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): activating
>> [   40.440271] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s
>>
>> The bandwidth difference (9000 vs 36000 Mb/s) indicates the first attempt
>> occurs while the link is still in single-lane mode.
>>
>> Root Cause Analysis:
>> ====================
>> The error originates from the Thunderbolt/USB4 device hardware itself:
>>
>> 1. Port config space read/write returns TB_CFG_ERROR_PORT_NOT_CONNECTED
>> 2. This gets translated to -ENOTCONN in tb_cfg_get_error()
>> 3. The port's control channel is temporarily unavailable during state
>>     transition from single lane to dual lane (lane bonding)
>>
>> The comment in drivers/thunderbolt/ctl.c explains this is expected:
>>    "Port is not connected. This can happen during surprise removal.
>>     Do not warn."
>>
>> Attempted Solutions:
>> ====================
>> 1. Retry logic on -ENOTCONN in tb_path_activate():
>>     Result: Caused host port (0:0) lockup with hundreds of "downstream
>>     port is locked" errors. Rejected by user.
>>
>> 2. Increased tb_port_wait_for_link_width() timeout from 100ms to 3000ms:
>>     Result: Did not resolve the issue. The timeout increase alone is
>>     insufficient because the port state hasn't reached TB_PORT_UP when
>>     lane bonding is attempted.
>>
>> 3. Added msleep(2000) at various points in enumeration flow:
>>     Locations tested:
>>     - Before tb_switch_configure(): Works ✓
>>     - Before tb_switch_add(): Works ✓
>>     - Before usb4_port_hotplug_enable(): Works ✓
>>     - After tb_switch_add(): Doesn't work ✗
>>     - In tb_configure_link(): Doesn't work ✗
>>     - In tb_switch_lane_bonding_enable(): Doesn't work ✗
>>     - In tb_port_wait_for_link_width(): Doesn't work ✗
>>
>>     The pattern shows the delay must occur BEFORE hotplug enable, which
>>     happens early in tb_switch_port_hotplug_enable() -> usb4_port_hotplug_enable().
>>
>> Current Workaround:
>> ===================
>> Add a 2-second delay in tb_wait_for_port() when the port state reaches
>> TB_PORT_UP. This is the earliest point where we know:
>> - The link is physically established
>> - The device is responsive
>> - But lane width negotiation may still be in progress
>>
>> This location is chosen because:
>> 1. It's called during port enumeration before any tunnel creation
>> 2. The port has just transitioned to TB_PORT_UP state
>> 3. Allows sufficient time for lane bonding to complete
>> 4. Avoids affecting other code paths
>>
>> Testing Results:
>> ================
>> With this patch:
>> - No call trace on first plug
>> - Device enumerates correctly on first attempt
>> - Full bandwidth (36000 Mb/s) available immediately
>> - No disconnect/reconnect cycle
>> - USB and PCIe tunnels create successfully
>>
>> Without this patch:
>> - Call trace on every first plug
>> - Only 9000 Mb/s bandwidth (single lane) on first attempt
>> - Automatic disconnect/reconnect after ~3 seconds
>> - Second attempt works with 36000 Mb/s
>>
>> Discussion Points for RFC:
>> ===========================
>> 1. Is a fixed 2-second delay acceptable, or should we poll for a
>>     specific hardware state?
>>
>> 2. Should we check PORT_CS_18_TIP (Transition In Progress) bit instead
>>     of using a fixed delay?
>>
>> 3. Is there a better location for this delay in the enumeration flow?
>>
>> 4. Should this be device-specific (based on vendor/device ID) or apply
>>     to all USB4 devices?
>>
>> 5. The 100ms timeout in tb_switch_lane_bonding_enable() may be too
>>     short for other devices as well. Should we increase it universally?
> 
> We should understand the issue better. This is Intel Goshen Ridge based
> monitor which I'm pretty sure does not require additional quirks, at least
> I have not heard any issues like this. I suspect this is combination of the
> AMD and Intel hardware that is causing the issue.
> 
> Looking at your dmesg, even before your issue there is suspicious log
> entry:
> 
> [    5.852476] localhost kernel: [31] thunderbolt 0000:c7:00.5: acking hot unplug event on 0:6
> [    5.852492] localhost kernel: [12] thunderbolt 0000:c7:00.5: 0:6: DP IN resource unavailable: adapter unplug
> 
> This causes tearing down the DP tunnel. It is unexpected for the host
> router to send this unless you plugged monitor directly to some of the
> Type-C ports at this time?
> 
> I wonder if you could take trace logs too from the issue? Instructions:
> 
> https://github.com/intel/tbtools?tab=readme-ov-file#tracing
> https://github.com/intel/tbtools/wiki/Useful-Commands#tracing
> 
> Please provide both full dmesg and the trace.out or the merged one. That
> would allow us to look what is going on (hopefully).

We need to be careful trusting the LLM conclusions.

Hopefully the traces requested by Mika show what's going on.

If they don't, then I think the next step will be a USB4 analyzer.

> 
>> Hardware Details:
>> =================
>> Device: Dell U2725QE Thunderbolt Monitor
>> USB4 Router: 8087:b26 (Intel USB4 controller)
>> Host: AMD Thunderbolt 4 controller (0000:c7:00.6)

What sort of hardware is the AMD host?  PCI BDF is meaningless.

>>
>> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
>> ---
>> Full dmesg log available at: https://paste.ubuntu.com/p/CXs2T4XzZ3/
>> ---
>>   drivers/thunderbolt/switch.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
>> index b3948aad0b955..e0c65e5fb0dca 100644
>> --- a/drivers/thunderbolt/switch.c
>> +++ b/drivers/thunderbolt/switch.c
>> @@ -530,6 +530,8 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>>   			return 0;
>>   
>>   		case TB_PORT_UP:
>> +			msleep(2000);
>> +			fallthrough;
>>   		case TB_PORT_TX_CL0S:
>>   		case TB_PORT_RX_CL0S:
>>   		case TB_PORT_CL1:
>> -- 
>> 2.43.0


