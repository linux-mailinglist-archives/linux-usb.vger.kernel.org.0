Return-Path: <linux-usb+bounces-22241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E1A73623
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 16:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0D217BC16
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 15:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC1B19D086;
	Thu, 27 Mar 2025 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="NwAUXk80"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F917199E9A
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090930; cv=fail; b=U3U2C8BN51VCFWAihI4Or3IPaxNttE00PQLfCpp1mIwbj6/5dMsj3yyCZSc6Fz14YA+0ud77ws1n4kIY+6P9o5thYjtfjqblKc+4EnPlwTiVRDevAuiJMljNmzmlzlTvLyIeuhh9eY7+krLna9P9Xz61Cf2VPz9PB8XC1Nwpre8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090930; c=relaxed/simple;
	bh=hs4clzgBGwjOLXOsUopsRHqlsSnGVeJfG41iT+qISRE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rf6QQ2v8dJ7L5Gp3Ee8RbL0jbXCTf+C2hBV9AY0cMUBhLS07tzRGyiZBRmpvej1XChmSgmqFsZ2c8GrYddT7cX8aaogUH1PoXFNqEaNWC0ppO+06k3vtogWsg6lV6F1wN62nW1i8Bt9+WJVF12XiCIkMDNZDH1k7arYSvJR2Z5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=NwAUXk80; arc=fail smtp.client-ip=209.222.82.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172]) by mx-outbound43-165.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 27 Mar 2025 15:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4lZ4kb4cqMRmppaDjtVU9Wh2try41diW7ACf+pZ5XChP7hY3t7rBAbEyclGsNkhOTHwVYi9FH7oCr1r1o2VGAVg6vXgphVgMEYXnEipKjGT/dK4F0ocG1VMhJ8M5WgRc7Xld0Az1ycTkqTq16JWHD6z34r3XO1gVsj1QPG3SNLLFSukx5V6WqxkLu+OyI5M84HFK8qOuhAWYW+PkUQBHq0LX71fTQrvDgJHk8FuQqca0U+OY1KF9vRWVe/AYKOU2FVYp0s/YvQ0uSPSBZpcW6V7nfi31VhIR1BGPIf8wW8+ZIILo98vCFaNBGRV4WHqBmGCATBvy5fLve6+Gflc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hs4clzgBGwjOLXOsUopsRHqlsSnGVeJfG41iT+qISRE=;
 b=PNNHHCiih9mBI9JtG/EG72OFrswfMkwJx2khaNxYYJBA4GRopJkpuRmmL5AFqC+YLg+Wer/uLpRL2YKFpe9aB2v2ygOSCL3AJJIG0K6ypHp5WEQoc9YpzjG4wM4uztM4DgRuGk7nDVKf9GO5xclJ4vakfD7zlsswIGRmM1RRxlfKL9F2twNs9vA/bAK+n9moZg/DhtuE4ifG9pNOSshW1e1VomPojNNz90O2barUyy6Vu5x4LuVRZSM1sScWVOC08z44AxpIv0hLKt0KH1t7ix9zJI7bOttzdFLcTPQ7KxjjFlXzlQcA1olUTD0hHadRGBGrHZVhKUyXB6h9ebNWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs4clzgBGwjOLXOsUopsRHqlsSnGVeJfG41iT+qISRE=;
 b=NwAUXk80pHzRw44/OzuV4M+1RSNkfgG/0utJF2e59kvOWhjRzoI8+WJn6cGoBg1qSrcWteKzsgetq9GG44HaaisdK5UC8Wm5D1YQJdXDc+HNP7qGV3Wd9shi2ydaPPED3jcozM6ItHikD1eBy04cJ3ViGfaxtyqS+v+0fquYHfhY81W73vC8kYaMXT1Sams8MFUlktEwRRbfxzboFmAlqxtI9s3AbOcDKZC3s+2WQdzW+QHqr1HdLpB4UYjy9kLzFPjW4vxbX4fuzdDv9bKPt75opJ3JDEMb6HHUFzAIiuRkt1Md9dOt0/3Ze4LHGEPz3OxGJhjqc5JTEQ8wZICJvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by IA1PR10MB6217.namprd10.prod.outlook.com (2603:10b6:208:3a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:23:20 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 15:23:19 +0000
Message-ID: <ad9bed5e-4d40-4c32-9ae1-96dcf09cf3af@digi.com>
Date: Thu, 27 Mar 2025 16:23:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <cc40e75d-1a7c-424a-8edb-3ae17bfd1462@digi.com>
 <42118b9b-7aa1-4559-824a-2c2ec70ea7d8@suse.com>
Content-Language: en-US
From: Robert Hodaszi <robert.hodaszi@digi.com>
In-Reply-To: <42118b9b-7aa1-4559-824a-2c2ec70ea7d8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0290.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::20) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|IA1PR10MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7fff5c-f009-4c28-ee5a-08dd6d434de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEdGUEFsS2t4RFNGWUt2SG80eWg2STBQTE1EeU9nbmhGRldHTi9pczlCOThw?=
 =?utf-8?B?YTBTSi9rYkV0UlB4SDNUREFqOFhmNDI2TFg5aTYxb0tXUTNrbWpwZ3JvQnRi?=
 =?utf-8?B?Qm5ET2pOUE5HK25WSHV5ejZRNGpQY29qZGZtVXJ1a2sxZXlPcFc3cVBBaGZJ?=
 =?utf-8?B?SVVSZ1hLVEd6Wm1uK3BKUU9rVFNNZ2REaElsdmVuY3BPd294Rm9sanRmRzdU?=
 =?utf-8?B?V0tNNW10RjNkSDg2d1ArR1M5UWJuVmxrWExZQ29RM2N3R1RQejY3WkpZbVFV?=
 =?utf-8?B?ZEJUaW1MU25tSWxKRFloZ1NtR3FDMXJScUFnSlRqZVNGWVE1b2VPaUhRZm5w?=
 =?utf-8?B?YnRaVFY3U0J1eml0aVEzNjFSRmVwbTljb1lPOXcvL21CbFFmQkIzYVNwUjA1?=
 =?utf-8?B?MUZDWVFYVVBCOG9hZmt3ZlFib1NXVGxIM3ZMK2cyZDlFem1uS1hLRzdyWmx4?=
 =?utf-8?B?amZwVmlTTmFheWhNSllrMkR2ZDFSUWtoaEt3Rzh5UGtKRUhCUWticWE5ejZ4?=
 =?utf-8?B?MUFyRXZrRyt3S2xJcGo2M3dpRTBqY2s0ZDR4dWcySk1LbmtPRjFZZ2h2aS9E?=
 =?utf-8?B?SWhFTFM0MVZBM053bS9kTXExVHBZekdjTUJDdnVwUG5jWWlNcE5MQ1AzcFBC?=
 =?utf-8?B?cnh2R1ZpQzR5U1NUaU8zYkU3NkFPUmxPblZqS1lMWGwvK3JYWUd1c2xhSkd6?=
 =?utf-8?B?NGtJcW4wQ0ZZM3lUMVFSYTVrUHJiTUFrQm5Ob2Y3TEdia016WkcxTzJjN0Z1?=
 =?utf-8?B?eTJLdjJaVW4zN05NZHV3Z0UzU3BwMmJRenNjVXJhTm1zQ0daaUFGejVrNlZE?=
 =?utf-8?B?bVRJcnhhNlBEMVVpOFB3ZHFrSlM1VS9GM1JFVGxYVFErcDQ0QTUzSjQwQzVO?=
 =?utf-8?B?SmViR0RRN1o2KzQ5Q05XOHdDTDkyMXNoTmZBOGE5RUlEcVNuYnZGYXRMYVk4?=
 =?utf-8?B?WDNobVlaRlppVWo5ZUt5czI5dWkyeTFBZGh3aVJDNWxDSFY1N0xuRW5NMi9I?=
 =?utf-8?B?ZWxTbjFnZnRuN1ZESzVqZmtTR0cwNHpFL0cvbG5BcEpuWWZzMHpTZjdYZ3Ju?=
 =?utf-8?B?UTB4dUxMUlpwZ1NJQ0FPYVpCUFF0SjQwYStBQ2lnL21VeGdrMFQ1Z3d4eHNm?=
 =?utf-8?B?djN4YUdJdWRXU0VrS1plM0lZVXI2N2NlMU0xZkRkVkhiTGNvSGFnSEFKVW53?=
 =?utf-8?B?aWxYYjZqMnpEODNndWZzMktBSXpTY1hSa21jRGV2dHg4QkhsWWRDdkp0ZGsr?=
 =?utf-8?B?aTFUNjQyTy9ubWVZcHUwTXFPK1pSR29vUVprQXg2cTBCNTlVMW5MYldybk9O?=
 =?utf-8?B?dUUvelJYRndncklUVWdYNjRIMjZRMnZnTFVEVWpsYnhFbFhFdDZuQ2p0YlFo?=
 =?utf-8?B?K2NSL1o5QTdmM3QwVDlFdU15RC9TNnEyWkZYMWlhNEk0YlBVa0xIV0xLUm4x?=
 =?utf-8?B?OUwza0hHazZqdDBDNG5CeUJRQkM2V2F1bjJaUk15eGx6UGh5U2NEak5Gcm5T?=
 =?utf-8?B?OHNIVVhseTM4bnlSb1VaQWNZejRRSnJWT1haNGgrZVVFdWVQSTlFVy91aTRs?=
 =?utf-8?B?NEI4VlJPKzFkU3JuNTcyVVhqaGJQNmxWem5JbUFiSU85SE03YjhwTDBNVDZG?=
 =?utf-8?B?d2RicTFKMFY5ZXJMWkJ0a1BQOUpGdWVhdUxaVEpEYlhncE9mU3oxRVVnMW9E?=
 =?utf-8?B?TXhuZnY0QUhVVllabm4ybUFIcVRyVHpmUTUvQ3VDOE03SzNONUZENVpTamVB?=
 =?utf-8?B?bWNtakVjUzI1WmJqczd1YmtBTWtobEV6ckNjUHdROEo2TERlUXo4OWs4bmFm?=
 =?utf-8?B?endpQjZxUEFSRzZ4VDBZa3pWVmZHTVcyMUxEODVrZEJXZWpreGh1M3dvcUdw?=
 =?utf-8?Q?T9ss5iNhe2B32?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEQyd2NiVk1mWGMxbG9vTWdycEJQVFJTVkY4NzFzVEk1dGFTME56d1c2ejQy?=
 =?utf-8?B?Z0lpcExoMG9LRDB2d1lraTIxNUJVMDhndnBmT0MwV1NiN2YvWkFTSTR5cGw4?=
 =?utf-8?B?TU82ejN0a3FJZVRJbFNlR3ZGeFp3d3FuM3N2VHVUU2t4ajE0bzFiSFlMUGcz?=
 =?utf-8?B?L3FJUjhMaDJ6eXdmS2JNMHRzczdrbEpBcUVJem1HcmhYUkY4Qno4ZTI2eTZj?=
 =?utf-8?B?eUt6elBUTXZxL3o3YVNvdk9pTzM5Yi9wOVFkOEFDSkx0RStmNUNWSzhZbGcy?=
 =?utf-8?B?a1hJS0FhdnU5TThScDNub3hMbXk0bWo0SUcxdnJGM3RMaFRISXpyYUp4Tlhu?=
 =?utf-8?B?dkhyeXVzaVF6aU9LcVRrN0VRcE9yK2dvMHhiVmVyaGZIUnhOeGZlNDltckVi?=
 =?utf-8?B?S01VbC9aWkxyNlFTTDdza0drT1BrR0V3VVRTVGJyTWFGcnhlSGZBcERYYkRx?=
 =?utf-8?B?MFJNT1MxVkI5SW5pUHJoNVFud1g3NkFEZ2JSVk8zdGZqZyttZDlZNHY3MDQ4?=
 =?utf-8?B?ZzZJd1pjTXIva1ZpR3pQUFhrMHR5L01Gd2Q5ZVRkdyt5ajVlSSsvZGdiZXBR?=
 =?utf-8?B?aWpZWFNOKzlrTldPRmM4SGt1NWhyZmdDdU1ucWNDWU4wYnVhNWYvQ0FwOVZv?=
 =?utf-8?B?VytKaUZId2YyaTV2V1NkM2kwNE9sc3VnR3FDQmZ6UmNpdjZEU21YcCtTby9p?=
 =?utf-8?B?SHJpZ1VFeFVBa2VSVnV3ZzVCZHVtSTZiNjA0ekdyNzhQNTBaNHh4TTFlTG53?=
 =?utf-8?B?Zk0rLzVGMUxLSS93eGN4M2VBNDNlbWxmUXZNV1lNZXVVNUYxcUJMK0lEYVBw?=
 =?utf-8?B?RW93VEdMNGhJdjVPcEwzeE5MSldyeGo0d1BwRjkwYzc3Yk0xaTJQTjBHNHJY?=
 =?utf-8?B?Kzl5WEppTitsUnBPQ2Jrc0dmZ1JnNTFPemxUQjRtUUI2QlVtSFdkRWtUdVRK?=
 =?utf-8?B?WWo5d2Nia09CNzNaTnpVVnRYQU8rOUpxN1pWWnZWbHhCZWdpdjgwSmRkSzFl?=
 =?utf-8?B?cXd1UEY3dXo1Q1Q3RE00RzRXNHlzdUpSLzVrTW02aXFBamxwVWxoWjFOblpw?=
 =?utf-8?B?QjZCVzVaMXpzNnVSeVZLalI5OEZaWUJNOHQxNVR2d2VXbmd1ZTNWN2VOVEVV?=
 =?utf-8?B?V1ZZd0FZWUJnYUROaU9OUG8xWVRhRkJleHVScHRhM1Q5ejhVa2x3ekhwelJD?=
 =?utf-8?B?VXprNjBsdm01bHFjQ01reDgycjVhYk1vYXM2NUxIZHJmL1pUNUw4cHg4RmdW?=
 =?utf-8?B?aGttOHF4ZGw5TUVRNnhFWEZ5bUYvVmdZWXVkRi9zNFpwVkRjT3ZXWTAzMWI2?=
 =?utf-8?B?U2ZnaFJGQzZ5aGFGRTlzR1d2bE9hTnlFdVloZmFjVG92N01Yajc0RThaaHJ6?=
 =?utf-8?B?UkM0WHJPSlNLYmdiYkZZTVJjWlAvUmdETll1eXdCNXpHVjRKelpOVmRjVGhm?=
 =?utf-8?B?TzN1WkZ2V2JYMTdkcDI0Q1hFOXd5YjdZOVBTQ0xtejRqWEVUeXMwcGEzSHFs?=
 =?utf-8?B?Sjc4V1VwUVpiVFc5NzJiOHFCUjJmdTJsUWhicm4vNWNyMVA4MEQ2ZkdwRmF2?=
 =?utf-8?B?ODhMeFcwSzh0YzFLeWxvVkpKYjlmdmJ2SzNwR0pBa2UwUC9PY2xDd1VCbVRl?=
 =?utf-8?B?eSthNWRSRVpkWjdZUG91bkVZRWJtUlRjZVkwUldkbXBLd3ZhQlNLaDhOYVlt?=
 =?utf-8?B?VEh0NC96enVEeFc0TUU0V2daS0s2U2hIOVRTa2U5M2lUai9XaCtoWHF3dkE4?=
 =?utf-8?B?UzFIQ1lhWTQrMXdoU0E0ajk2UW9FMFlWU2JQK3lGcDVUNExxaFRYSEpDeGlv?=
 =?utf-8?B?VXRDb1JKaTRxVEJ6UFVYQVNCbzRXRTdINElxd1NibEgrVTh1aG95UjNXV3Nr?=
 =?utf-8?B?T0JCS1lmUjBsa2pkc1piQkJTVFRrN3dkeFdnUXRRRmRWQXRmeTVzVklIU3Vu?=
 =?utf-8?B?S3FsdTcxUHFpdzE0TVV3dys2a1BLdUw0alloZGM5R0toV3JGdzR0aHM2WnZB?=
 =?utf-8?B?WkdHNlkzd3UrWWhpdmhNVmp3WDZmQXpaTjZWYXlWazV1N3Btd2RrT0xWd0NE?=
 =?utf-8?B?QnE3aStsR1V5NFVad0F1STlmOVNQek5zK2JKbC9XSXZJUjNONFU2bVVJYkxw?=
 =?utf-8?Q?igfZfoiLkHz4hv9lT41epfhNb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7fff5c-f009-4c28-ee5a-08dd6d434de2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:23:19.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0qZnsWeLixEDReTVVQ1M++QE6ab0twxiK1oZwJiO9R6sI6VX+6ajnMJQSU5yy1J0lTc8yl6o+qQ/pNAm04fbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6217
X-OriginatorOrg: digi.com
X-BESS-ID: 1743090927-111173-9737-19055-1
X-BESS-VER: 2019.1_20250319.1753
X-BESS-Apparent-Source-IP: 104.47.57.172
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVmaWZkBGBlAsJcnAKM0yzczUxM
	LcItHQMs3EJM0y2cLQ3NwSJJGqVBsLACb9bd1AAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263457 [from 
	cloudscan19-134.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status:1

 On Thursday, 27.03.2025 at 14:21 +0100, Oliver Neukum <oneukum@suse.com> wrote:

>
> Arguably the interrupt handler should set the flag for a readable result only
> if indeed there is data in the buffer. Could you try the attached patch?
>
>        Regards
>                Oliver

I think, that will not work. With this patch, if a ZLP comes in, WDM_READ is not set, so wdm_read() won't submit another read urb if resp_count is not zero (won't call service_outstanding_interrupt), and we are not doing here, in wdm_in_callback neither. So the receiving just gets stuck.

That's exactly the reason I did what I did in the patch I sent.

Best regards,
Robert Hodaszi


