Return-Path: <linux-usb+bounces-16607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E79AD39C
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 20:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C05DB1F23018
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 18:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BB51D0420;
	Wed, 23 Oct 2024 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DkBiGevy"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336CE1CF29A
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729706879; cv=fail; b=DR+fJG94KD5+4UxGtbuZ6dndZ5yj2Cm8kmnqOWL/5uI7dHkuzoiHrAE7PxRg/s8P7OBrllEgtjWHxo2yOPFYy9qV+vBzlS9izKxu2CgNEdsRkEL6v1n4C0W1XyqdU1EOuTthSO2b6frXVmkPfPM9Q6pS1ORwAHS8k3WT4hqMjL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729706879; c=relaxed/simple;
	bh=HCQCTnt7bLdjioRz5RJCK9q8HZ+t7T0IEw9JYUMAbos=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p0An1H/hBtcq2CMKQ6/jsnmFn2+TyZ5Q9kvz1HE/jQBq3nUP+ibtd5/y3UzmZoqxhHqrtBbB0PTh+kyafHjSVqRtPmddHnrZ1KbN7gH4n2sm5VCHTXDuc2uY32B2VY4ek6KSnS3fn3RuWdDfuVFtHtLCdjQk6Zx1aQrqvkL58K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DkBiGevy; arc=fail smtp.client-ip=40.107.93.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofLvBRKMeBO3sAPFcAgVnW5fcBu1G1Vufb0gDGjeobv/CkuHoVSuq3JpaU0KCkQGLtvurq6AU31C7boAo9g1nhzgLZUK4lJLNt+P+bruXzs4RxnhZ9eGocQBHLdvQnO+vr0Twg1zyyibvRsyT0W6B9fvkWqhvRFMGyws7NvDLFz+B1bS38riZsSK0WCI6tkYStN0aqGZHaM9qLWv1mAAlEGCjJ4DFAK5LQrC702fXIrel4St7fXcH1bozhsXeyEpOLgZIjkYUy5Id5m3N8G0ppCgE//gelqBHLYJqkXQZM+NYFnr2Vg9kXGv/VgPira23yS8pGXuB9XuyeVBfkuJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoeST9t2LhZZl/WPnof4ntzeK/+b0tMLHfjSfHmvCRQ=;
 b=aiRYNl7boTPK8qNVbwWC64F0BBrd20xrkL7lVsPWK4sJFp64FrZjfON4TsLAtLBpW80z/YZUjDODtRmh8MbsuG2F+voHL/PQI38NNRAIEP2Dj1/GxD8v2p8JWw+u8xPCOmwshjduIuna3tt5U+P5j1b77/EfpijflvtcSbAmvgTSyW7PVzP1ZV3V9AQKNEggH3DnD00TNYhhlKTw5LvIgBNLMLWl73grU7RgLDKbe4z7noohU9Xs24z1RM5d+DvL0FEM5GdPZNwiIbQVnyr8lE5ysamw91DFeQfvV7DpZEft3OOGkZY4t7wD3xYpG5Q4fmPrVrHnbmXz59JfgVOPEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoeST9t2LhZZl/WPnof4ntzeK/+b0tMLHfjSfHmvCRQ=;
 b=DkBiGevynydkRYBatwIufz6vkfW8Z3dZSaDe656BhpxGrll3gr+3dW65VaHxDMdieSrmCmSxefldOx/TdANmC1QtsJYV/qA7iNOTLYwO1WSWIuKKbirXxSjQk9sP2nRxG0y43XFv3MN47yT1LvRaAWEk7CnPhEVv08azRXsoz4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 18:07:52 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 18:07:52 +0000
Message-ID: <126c429f-7c55-4d7e-9d3a-1fa5c5ab1369@amd.com>
Date: Wed, 23 Oct 2024 14:07:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
 <20241022132232.GD275077@black.fi.intel.com>
 <2b4708a0-d8b0-4e8b-9cf8-11552527eb14@linux.intel.com>
 <f40888a4-e9ef-423e-8ac3-e6bf4ecc242c@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f40888a4-e9ef-423e-8ac3-e6bf4ecc242c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0163.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb31929-5a68-412a-930d-08dcf38d9c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDRHNXRhZE1Fbm8xYW5Xa0U1anJwVnYxQ0RDYkdhcTJvNWkyQks3VXlnenFo?=
 =?utf-8?B?NUtlOHhvbFRCY29vYUtDY1UrelFLdURta1RoNW1Gby9lamRwaHZpVmZJNzh0?=
 =?utf-8?B?bVBOTjczMUtTbVA3WXFteDR5ZzN4S1VMSDVkeUNSNkJnWVZGTWRlQlp4NXNX?=
 =?utf-8?B?cUF6Z1BjRncvWEczMkhPVThuUVJaT1RiZUpJdTlrN3FhZ0JmM3NyQzQ4eURY?=
 =?utf-8?B?eTY5SU5YeEVWZkFxVVV4SFBkRmVEU25KVWRhUmhjeUQySXZqOVVxcnpPVWk1?=
 =?utf-8?B?K0N4RHRJNlBvRktqNC9rLzdYWWlXQmpSTWRSSzNtVW1ETUtTTFRHenB0R3Fj?=
 =?utf-8?B?VGlzV2VvUFpaTUsrcW5BcSt3cFRJZDRFUWQ3WExyWEhIVXc1RHFlQzVHWEFx?=
 =?utf-8?B?YXM1NGtKSGdaY01yZFZBYVpqU3BoanNPMmZIOVdpRnBENTdHUm4vekVhTFpq?=
 =?utf-8?B?UjM4a0NmRE1KOTV6TzZpRGsycXhTa1ZDZVBJaWNlWWhGd2NIOWZJUVVId2Fa?=
 =?utf-8?B?aHUvamoxZTROazhnN2kwWHk1WkdrbnJyVjNTT2F6cmJ6SUtyV1JiR0VvMkNM?=
 =?utf-8?B?Q3U2WFVOZ1dqZFpROWFESGZYOTVHZFdEdy8xb2J4cExhcVVONE5INFpXenZP?=
 =?utf-8?B?RlNnNkV2OGJsYWIxbXEzZ3EwSHY1eTJVcTZ2dVFxMEUvR1pMeVlkQnRXMHpu?=
 =?utf-8?B?K2YxeXU5NFE2SjlodUtzU0NOQ0JLbFR3SE9MUm5iWVMxUE4xS2RBeU5FRTlU?=
 =?utf-8?B?Z3hZTVN6ZzBVWjh2alVEUit2NWVoMDJ6TnRXQ0IxaWxneG5UUEdGWTRZQWQw?=
 =?utf-8?B?ak5GWEJOOEE4OHMzN2xtNG03dEE4N3ZMb0d4TnhiU01KZ1pBMU9YK2dWQWd1?=
 =?utf-8?B?TmRMR1RFOGluN3JNOTg3c2J5MzFDSW02UUNqZEd5UCtLSGNENzJCWXZEcFdh?=
 =?utf-8?B?TTdZOGxZUmJHNS9zempzSHF3cVZ1OWNwc2tVVzJHVVJrN3lvOHNDc0xpN1FU?=
 =?utf-8?B?VXVHVXZGSXp4Rm5CQWkxTmFZM3B0SDg3Ty9ZV0JPR0grSHc2b21LenN4U2pj?=
 =?utf-8?B?UzlFZDBpRitlU0dYazdxempPS0tZUkszRG82VExxSjY1bDF2dHRadVE3R3NQ?=
 =?utf-8?B?SWk2Y0hBMERTWFFlK3QyQXYzNHlwcDFiSFNxd0ZuSnpEU3pFSGlzdDJvSkpG?=
 =?utf-8?B?eDdpMVZscWdvZm9UVktCWjBvUGgyUkFWN2x4eHkrVmRsOGo3UUpudWRyaEFn?=
 =?utf-8?B?bkkrMDhBYi9wS3BQUHlSc2NUK2M5NnQyaXlYUkxSa2ZKNVhCaVgwb2xXU0dR?=
 =?utf-8?B?QnFBRlNOcE5pdy8yaFlXa3ZMN1l5MGNrVUlUNWJJNG1Yem9QclBmOWc0V2dv?=
 =?utf-8?B?REFjYzNSMHhrcXNKRys3UG9CMnQvQkdjM0MxU0xNNGo3UytKbGh6WUd5emhn?=
 =?utf-8?B?OEd5SE9kVjNMWFp6NllaUmE3UzBsQ1dsNXhvOTFnRDd0NnVGWVIvSDhXWURs?=
 =?utf-8?B?c050TXhQOHRzWm1leklSbTYrSUVUendVbVdTd2E4dDBNUjlmNjZqcll6bmhr?=
 =?utf-8?B?TGNkSW1TUk5pNkVyamhkNzFDRWpFVU1kTXJZNmt2QmVGUjI1a254RDNTM3BD?=
 =?utf-8?B?WTJOcHBzU0cxRU45ZVJXanovaGJRZDdCdUVJYlJ0amhzRUcvTEVXendUT0Q4?=
 =?utf-8?B?V050Nk00bWUrbHFJQ3o2ak9HL011SVdKRkFQbUxpRFVnM3QxbTd1d2FLb2NF?=
 =?utf-8?Q?MmbfEfIOx8DdznauMF2Jvc3s1i15F/XOqXq0SL8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5427.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHpTMHhKMFIvVnhSK0tRalorY0ozbUVhdkx1Z0h3VDRiZFZwcDZlNWZwbFRx?=
 =?utf-8?B?SkxoME9sYlVFekZhNElpVmU5U0w3WmFUUTl2dGsxZ01uM25DdUEwTHRYV0pH?=
 =?utf-8?B?Q29xZWYydTUyVE4rUTNGaGU3SWhadEJHOG0vU28xZnFVOC85YWJ1eXUzNEZX?=
 =?utf-8?B?V3hVb2o5S1hOd3RnWVdVbjhyaHZ5b2hBYi9EdjkyRHFhVk5KalNSdko3NWFM?=
 =?utf-8?B?ZG5iTlB0T1B5Sy9HQkhmTUc2UXBNUkZrWmlvNXFLQ2xCRUZwWVJxSk9NaXZN?=
 =?utf-8?B?alE0N2FpOGRBeFlmVlJpdTVGNExMMk8xUFIvcW9Rb2JUOFdVa084emtCeVRD?=
 =?utf-8?B?L0NaU1FBRU1reklBWVEzNE5RUlg4SEVYMlJxUithODNhNEUwdHBtRkRaZmQ2?=
 =?utf-8?B?ZmM3TVNHNnR1c29FM2xYL2FBVFJtczhqaTJBUWorZ1NTcU5DNU1GZS9rSjBj?=
 =?utf-8?B?bHVFUDEzcFZDeXZXbjlBRnVHUGtNcXhhMnZ4RjVwb0JLWEo5NUtaT3VCaFRi?=
 =?utf-8?B?cDdjaHRKRFhpam9SSzNuMDYrdk9US0MyY0E5dThQSXREZ2EvNm95clNUNEVi?=
 =?utf-8?B?ZDA4citaaFdaVFlPVWdYL2RqQkZyVk4rQmtmV3J6NXV2SFNPMDVMNHVkbGFT?=
 =?utf-8?B?cGlQeVpMSXU1cjRScDRtVTB1VUtzWm1LMEpTUHQ5bUFNSHRONVlzZEFaa2M2?=
 =?utf-8?B?MEV2NkFVMkg1U0FPMmF1ZlNmRko4L24yQzZUTCtkWDRPY2p3Zkc1bFBiR0tw?=
 =?utf-8?B?RUtWa0RoN2h0WExWVElHU1VEVVREcGhxOW5IdHo0Ym13WHRUVU5Iek1WUUFQ?=
 =?utf-8?B?M3VVU1ZlSHZ0TU5TS1ZEZ3dFQXF1VDJqM3prQStPNGZNdWcrd2E5VG4wUzJs?=
 =?utf-8?B?MkFjc3EzRW5QMnBheGZKOEZPVWg1SnhzTCtUMmMwWmpzSjRDaVljYnhPR3FL?=
 =?utf-8?B?SDJUR1VqRjhtRlFHNmFWdE9YdHBLVWlkTVNXMUhUbkh4NFp6TEtBa1NGNjBa?=
 =?utf-8?B?ZnJhTStmQUg1ZUxNTGlvUHpQOFVZOWIyZ1ozMitrbGVtZ2VVUE56aUh1TWZG?=
 =?utf-8?B?ZTV4aDlRcmVDYW9rZ0N4NnpLOTBlczRMbG5RR1ZPYnN1bWtKRkR6Ym5vbWg1?=
 =?utf-8?B?cGhJVGY2aWNXYThjNHU1NTRmVjlRYjZzM2Vkd1hJclcyOUUvVG90TThRekgv?=
 =?utf-8?B?WUNrdTBlU1VXTWJRSVhVSzR3TkRSdERSK2o1OTlLZlUveTJaWnRlV0o1K05n?=
 =?utf-8?B?NDlQZlZkV1ZRV3k5dnZhVTVFYlI5bG1tK2M0a3RuZDNNRFRmV2ZwZGFQNzlv?=
 =?utf-8?B?WEI2aG1MaGpBK1JLMENEbTZrQnMvdi9kOUNqNk9temtaQ2FiTkorMUxldisz?=
 =?utf-8?B?LzUzM0RGbFUrVUhOckd3blNja05UT1E0aHREaEV4UXJrbTU3a25oNGlxV2VM?=
 =?utf-8?B?OEU0aTVSdGZoWUxFanI4NWEydGxhN1dnOGp4R2FKZTJUdkFsNTQzYWdlQkdz?=
 =?utf-8?B?dGlyV0lNWlJ6c0o2ZE9GbllPaWFLZnIwRTBpR0FHTVVyNk9VQmVLaTZWZXZ1?=
 =?utf-8?B?M3hyWHlPUnBHaEtFQlVMREQzdUoxdjBTUm5uSXdUVDY0dS9WQTFxaG9aZjFT?=
 =?utf-8?B?dnBUM0ttNzZJQ0ZMYm9tR0o4RzZ6SzhjY0VRSWhMNTNTUTRmNzhyZjRzTFUy?=
 =?utf-8?B?aGVrNHlQMmxmdkRqczJMZFAxY2xnSkpkMDEyUndpalh1OEpxQ1BBV3JDTDJR?=
 =?utf-8?B?S3NaUW1qNGpEUUhjVWQ1UVBTQm02dEIwa1lCQ2JsY2ZHa09tK0Ivd2lDbHR2?=
 =?utf-8?B?WkdsZE94MUdlYzZKdm41ODFRZVZwTWxDbFp5LzJxdm9KZ05WVS8zeUZCaVcv?=
 =?utf-8?B?Z3R4L1ZWWm1iNTZYTkErSWVyNjc0NnlyR2RQMUJNWXlWb01LVjk4cTBXUmw0?=
 =?utf-8?B?MVJIanliZzFkWXRobkRDdU42Mi93RGRoaDJlTUo1UUFJRHlRLzlaL0s4d29V?=
 =?utf-8?B?dlZldGtYOGp0c05zTi9VY2V5NW1xYTRVZ09Pa2ZRYmRTQ0NYWWMwQlk4dFdH?=
 =?utf-8?B?b01mOFI4WG5QTzY4Qkx2MkVnd3ErVitqcld0UkkwcFE5bWdDM2pSMitXbHZp?=
 =?utf-8?Q?kA9JVsepgTyHul0aOzTlIlg+g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb31929-5a68-412a-930d-08dcf38d9c77
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 18:07:52.3326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 106UxyHetUmts9P3W0zJRVedByGArUhHrnLu+wXKD/UzqmgwgDdOSFYxqZ9I1Wup8QN5vdQ+hWzsStwB4E5xEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343



On 2024-10-23 12:50, Mario Limonciello wrote:
> On 10/23/2024 07:12, Mathias Nyman wrote:
>> On 22.10.2024 16.22, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Tue, Oct 22, 2024 at 03:37:42PM +0300, Mathias Nyman wrote:
>>>> Fix a boot hang issue triggered when a USB3 device is incorrectly assumed
>>>> to be tunneled over USB4, thus attempting to create a device link between
>>>> the USB3 "consumer" device and the USB4 "supplier" Host Interface before
>>>> the USB4 side is properly bound to a driver.
>>>>
>>>> This could happen if xhci isn't capable of detecting tunneled devices,
>>>> but ACPI tables contain all info needed to assume device is tunneled.
>>>> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
>>>>
>>>> If the USB4 host interface hasn't probed yet, then we know the USB3
>>>> device is not in a tunnel created by the USB4 Host Interface driver, so
>>>> don't try to create a device link in this case.
>>>>
>>>> cc: Mario Limonciello <mario.limonciello@amd.com>
>>>> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
>>>> Tested-by: Harry Wentland <harry.wentland@amd.com>
>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>> ---
>>>>   drivers/usb/core/usb-acpi.c | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>>>> index 21585ed89ef8..9e1ec71881db 100644
>>>> --- a/drivers/usb/core/usb-acpi.c
>>>> +++ b/drivers/usb/core/usb-acpi.c
>>>> @@ -173,6 +173,17 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>>       if (IS_ERR(nhi_fwnode))
>>>>           return 0;
>>>> +    /*
>>>> +     * If USB4 Host interface driver isn't set up yet we can't be in a USB3
>>>> +     * tunnel created by it.
>>>> +     */
>>>> +    if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
>>>> +        dev_info(&port_dev->dev, "%s probed before USB4 host interface\n",
>>>> +             dev_name(&port_dev->child->dev));
>>>> +        udev->tunnel_mode = USB_LINK_NATIVE;
>>>> +        return 0;
>>>> +    }
>>>
>>> I think this will not work if you boot with "thunderbolt.host_reset=0"
>>> and the BIOS CM created the tunnels, and that Thunderbolt/USB4 driver is
>>> bound after xHCI. Then it will mark this as USB_LINK_NATIVE and does not
>>> setup the link so after Thunderbolt/USB4 is runtime suspended it might
>>> not be there to re-create the tunnel before xHCI.
>>>
>>> The test case would be something like this:
>>>
>>> 1. Add "thunderbolt.host_reset=0" in the kernel command line.
>>> 2. Boot with USB4 device connected (and so that it has USB 3.x device
>>>     connected such as USB 3 memory stick).
>>> 3. Since there is no device link Thunderbolt/USB4 can runtime suspend
>>> freely.
>>> 4. Once that happens the tunnels are gone, including the USB 3.x tunnel
>>>     so the xHCI might see disconnect here.
>>>
>>> Also on resume path it will not be recreating the tunnel before xHCI
>>> because there is no device link. I can try this on my side too if you
>>> like.
>>>
>>
>> You are right, I was able to reproduce it.
>>
>> Device link won't be created if BIOS created the tunnel, thunderbolt driver
>> probes after this usb device is created, and "thunderbolt.host_reset=0" is set.
>>
>> Turning the device link "stateless" could possible help.
>> It removes driver presence dependency but keeps correct suspend/resume and
>> shutdown ordering.
>> It should also help with boot hang/probe issues seen on the AMD platforms.
>>
>> Mario, Harry, does the following work for you?
> 
> I didn't repro Harry's problem, but I did try on two OEM systems (Rembrandt and Phoenix based) with this change in place on a 6.12-rc4 base and didn't notice anything worse happening.

Yeah, the following diff works for me.

If you create a patch feel free to add my
Tested-by: Harry Wentland <harry.wentland@amd.com>

Harry

> 
>>
>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>> index 21585ed89ef8..03c22114214b 100644
>> --- a/drivers/usb/core/usb-acpi.c
>> +++ b/drivers/usb/core/usb-acpi.c
>> @@ -170,11 +170,11 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>          struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
>>                  fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>>
>> -       if (IS_ERR(nhi_fwnode))
>> +       if (IS_ERR(nhi_fwnode) || !nhi_fwnode->dev)
>>                  return 0;
>>
>>          link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
>> -                              DL_FLAG_AUTOREMOVE_CONSUMER |
>> +                              DL_FLAG_STATELESS |
>>                                 DL_FLAG_RPM_ACTIVE |
>>                                 DL_FLAG_PM_RUNTIME);
>>          if (!link) {
>>
>> Thanks
>> Mathias
>>
>>
> 


