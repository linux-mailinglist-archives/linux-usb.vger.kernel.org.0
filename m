Return-Path: <linux-usb+bounces-16606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47959AD1CE
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 18:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5E72B24D10
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 16:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5512038D4;
	Wed, 23 Oct 2024 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AfooeTKp"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1502E1FF058
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702248; cv=fail; b=RR8E1Whq7EGgSMuyKzDH4UUplGkeShFW5X+SJZUUapLUUbfcjPysLs1mAmt7ZG1c3cnqvkkbGHbaRhjy9cbLOBpNecUSK7GWOg4S3wdFsZsnsJHMVjVJ6cXZsQsiKAuwUI+U3dUy0yYPaiaB5JNxREr9EvjF0wDGNyfXIlPydcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702248; c=relaxed/simple;
	bh=z0jVxGVk5ugnlNQFV7gFcw38+sjIFlH8usvUQHnbwwQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N2VcGzsu2kZ4LL4hU4oCmqKECJdxlakUmK1zklzx5mPGfWjIlDlX01QjIwVZdLmwtfM+mZWNG+t633qNm8nhKmhEaDk6iStmB+NofJiaTNnz1hE4VaRGXUEHLIDa0xa+VzfDGS24A9zhzrf/uaaT6FY/IknwdNJriqy8YuO0cXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AfooeTKp; arc=fail smtp.client-ip=40.107.244.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H44RBzOmKjjuILr2eqORLWCMaPOQpU7eUbMwQLJT86o6JkB8bRN3TYA37wrZ6ukE1SKOyjrilkxYo2gy28m1Ywx00p1yPLuUBhzrIDXG1dV1GJAirDG94sxuHjS6ZP7ehJcckDmTE/JJj0AO/y8kLs8S+aN/GrNC11MtvaDOQVClTS03LLyWniikqfspJ1ekZq1gARqwhGtBRWqd20XnidWGmg3z4tmF93wYfaBoGyagKLelQX6vvObG4JFZ1CrEuhMOkV7PyJOIFw251ja2CupGTBM5KOcgbtEeNqnZO1eJfbnPfBQcVixEWmmQZuh85PS4VryV5SfQ8fPh+nU7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH0HlFOaHhS99FtV7VwhvzjrSN1DHYnvGlU/POV3R1M=;
 b=uz+2+p4uhMTo8UwQ9BRhwUMtLUwTFXN8iQp/N9er0sojtORV7oJxUBIDHdZ4LNwWXLlumH8lORhaobhpsrQ2YLoybgPHoCOKTy06BeLsku8BfAfQC5JT0H+VwULM9AzwbGhIdhgkyOOhcniKyjVFZRhf/s8mXoLUJcsb8606Pp0XLr2FAijizDkji6kHT/aTmxcyLFQs3qG/T5FfXEkQWors2HRxl1XF71ICbqWxrY8HYf+hOnY+oDLOkroM/N2Az6LPpgNDeW09DKLQvnSp38r35Hziejq/7vry8fMKCsG3nHRId8lyK2aTSrNovW44dMW5vYqjG8IkfHiwf1zOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH0HlFOaHhS99FtV7VwhvzjrSN1DHYnvGlU/POV3R1M=;
 b=AfooeTKpxeFcK4/zASX8Bf7WAtsNnGdSagmxTM+Kbw55ryx2lKdl/Saz3fDOFqGkwcKpT+eCgvi3bA7SmXVmoTdUKBegYiDEzRSQQ0I/EAW6AoXm5e6tFSk01A7mVDLbmGr0FkXpjPCfTazAclpIK2YJNjpfBCX9LezmS+2CC3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 16:50:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 16:50:43 +0000
Message-ID: <f40888a4-e9ef-423e-8ac3-e6bf4ecc242c@amd.com>
Date: Wed, 23 Oct 2024 11:50:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Harry Wentland <harry.wentland@amd.com>
References: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
 <20241022132232.GD275077@black.fi.intel.com>
 <2b4708a0-d8b0-4e8b-9cf8-11552527eb14@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2b4708a0-d8b0-4e8b-9cf8-11552527eb14@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0171.namprd04.prod.outlook.com
 (2603:10b6:806:125::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 273ce284-cc75-4e00-04bb-08dcf382d543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3cvSTdlOFN1TXp4dnZhbkdOOVk1SWo2UytUSDN3a2g1ZzlNNzM0d3VuejRL?=
 =?utf-8?B?akJ4V3ZhYUpDYmNRbmUvMkJSeHdqLzRWWkt5cmZDVEVHYnhDa0NKbHI1RmpH?=
 =?utf-8?B?Myt3QytsWldYaFpsQjJQRml6REwxaUJUaHdZUzZycThlVVN2enM0dFJvSnow?=
 =?utf-8?B?Q2JxQ0ZRL1VzYjU0U3dQaUJlOFFYWVFOL2YyNkdPRGY2K28vcWprMWpjTFZX?=
 =?utf-8?B?dFExKzFFR1FZWnk2bHNKUno3dG95YWxUVDBOU2NhWFB6akM2eWJObzc3TUg4?=
 =?utf-8?B?ZDdhZWN3dk02M2NMRWtYREpvZ2pyQ3BTaThJNWRpMUd1bUNaTjhVaC93anh6?=
 =?utf-8?B?dWVlMUpmZitpZDV0RnVRaFI5SmJGOGdoSDNGRXhNOS9CQllDMDMrek9kSnJW?=
 =?utf-8?B?cjlvbjNUdnNZWWtiek9WVGRrMDFaRUlESE5FWmpHRzN1c3o1WmorcG9JTm1l?=
 =?utf-8?B?ckU4OENRSzBHS0FaQnlTV1dZcGhDdWVYc1NSRFh5NGowekhrZXdzTHlEdTRN?=
 =?utf-8?B?TDBvQkI2TUJhSmhDQUhCL1l1ZG9PaDZYRUxHUGlKb2NxRjYxMjh0QkovMzhm?=
 =?utf-8?B?OVdpUCtpR3Iza0VoYUgvSFpVc0Zjdk5ta2ZVSTAxdWcxMTNDQ2dsR2lwZ1BQ?=
 =?utf-8?B?WXN1b1UzOVdOU2tHa21ONGRrcjNISFowQ05HTXBselNoNU4rMDhiTzVrdmo1?=
 =?utf-8?B?V0lXNW0rdWZUWWRQM0lPQ0dkeVlYS0grN0ZCUlVTYzlYRjB6R0JTR1hvUVI2?=
 =?utf-8?B?M1FBbUdQK2NReFdjTzRsTGJtdXFJSng2ekZUOXk5eXRFTjVEUGtwYmM0UWNG?=
 =?utf-8?B?a3N1SElZbXhOa2NlcGdIbjZ0UWgzNmQwR1JDb2RISkI0cEdoMTVjaENjbkh3?=
 =?utf-8?B?aXV0VFNxc1pxdDRSNnZyYjl1aWlEUzE0WjhKcVJxNnk4N1pjMlFQc0ZVdWp3?=
 =?utf-8?B?S0wrNmcrTUNmajdyOW5WcjE4SHNjdk9icFNEbDNTeU1vY2Uyc0NJY2ZRS0JV?=
 =?utf-8?B?Q2Y3MDFzbTdCbE1FZ1JxZThZSlp2eHUzcHBjem1idkVRdUxiZlB4T1V3SENX?=
 =?utf-8?B?RE1MUzRWRGNibzBLV1o1YVFJVElrOFZOVTRvY3h3bFQrQVA4bTdsc2JTaTJw?=
 =?utf-8?B?SHF4ZWJpZnBWVGp3MHAyL3BLMUNyYmRqREVsNEk1Wnc1SHh0eEoydFhDUVFR?=
 =?utf-8?B?VzBqOUxKS0ExQjA2ak1KYS9jOUZQWHAreXdtTER4WTYvNGR2WFdPN3RYNS9y?=
 =?utf-8?B?ajR1ZmlqVHM5MmdCVXQxNUxvbkozN0U5R1UwSjV1WVFvZFE1U0xxWmtsaGlI?=
 =?utf-8?B?N1NkYkVobk5pVE1sL1pwbjdNaFhmeTl2R0hOZWxSSFErcUNaenphbUEvSTRI?=
 =?utf-8?B?RFFsM2xSNG43ZVMxeDJtc3pGd3ZzcFJrY3BSeTJhV3ZudStYY3NZT2M1MnZn?=
 =?utf-8?B?b3lyZ2p6U3B4bTd6NGJRWXBjRFlTRCtPRzJNTXNvV1V1M1FRRmpsTEU2Vy9t?=
 =?utf-8?B?N3J1MWs5dFg1Rm9qeGsreGRoRnpST05RcjhHaUE0YldQaHdaRGJjYVZERWdB?=
 =?utf-8?B?a2JFSUpmQXNHNmJuUWk3MFI5YnFCU3BteVBpQkVsUUhtNVpsNEovT1duSTlX?=
 =?utf-8?B?Z3B1T20yM283NnNMdGFiNGFSOERFRUF1M09jTXlpRGJ2cGdrL2dFYVNmcG9K?=
 =?utf-8?B?b21aS2hveTcxQXFwK1ZiNk9WOVlTL0EyZGtrTVQrM0ZsZU0yQjhvendVTnJL?=
 =?utf-8?Q?Ca3nnyVthVfsGr6uRDO+D7vz7phol/cCtoWnNiY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGg3TlFpKzZwWHVwNm9MaDhxaHhjTjRIa0NTM1dMbDFqQzhFM3JibU9vNkZB?=
 =?utf-8?B?Vk9YRXJTM1k3UGVROGR3RXVnWlRNYzBlR3BTbVgzdGpVOWE0SCtKVDFFQm5B?=
 =?utf-8?B?eVg1aWRkYmtXTHFLUE1WLzl4amhLVGkra2NLWU5rb1QzRmZtN1VGSElkQlZt?=
 =?utf-8?B?ZXNwZ0RNUTc0bTVXemQrcGtjbHcwRkt3ZmNIai9od28zUFdlVWE3V21sb2VZ?=
 =?utf-8?B?KzdSdkwydXliZFNaOHBsd0lTa3BLcXBSamdOREJ0NzZ2OWp0dTBNWTdISTIz?=
 =?utf-8?B?dDVJSEhqbEJGWm5RQnZaYVNpMC80NjROTVBGZitFSkFrVm5BWnhxR2M2d1Qw?=
 =?utf-8?B?UzFBd1BrWTVidVZBVi9FUHpPUEFhWmJvZFIvL2ZNUUt3TlhhUHQxdmhsdkQ1?=
 =?utf-8?B?bjBocDNtZ0JGVjFSN2ZidktEUnhPa2RmU2UrdWJseHpBTy9LaHlMQ1NvNDJH?=
 =?utf-8?B?VjB4bkRlbU95cGV1a0syS203WDB6WUdndlo4cVQyTE51eW93M2wxYjE0dUI2?=
 =?utf-8?B?OXFKSHFzaTJIQ2JMRVIvWWRnTHpMWHJyYnF2cHM4SkxoOHVtZElVekVOZ1RE?=
 =?utf-8?B?N2cxNk9YbStmSkt4c0tPSzZIWVRlRzIrd3RLK0VtUlFJMnVSaG5uNDBPdVBV?=
 =?utf-8?B?SFp6VUU1R2RxQVZPTndGVEtLb1FQbUJxRmhyM2hMR2JRMmtwNGZWUzVPNjhD?=
 =?utf-8?B?N1pvWk5WMU8vVExUNG4yMU91aVdwaUhXb1hraDhnOFAwN1VVckI3RjA5S0Zr?=
 =?utf-8?B?NDBucVM2Skdzd2pxQi9wYk5hOG1NR3NPczBjNHFGdTdMVzFaTjZBM1dnK2lB?=
 =?utf-8?B?a3RHTmh6eWN0OXVnWFZ0UFdrbUNWRmU0MFNENklSQmx1Syt3U092ZDZaN2R0?=
 =?utf-8?B?dFBwaHVwMlMzamtBM1JEZ2w0QVFDUnNHWlpSV1BnNGxlVHFqc2h1QXJjNGlJ?=
 =?utf-8?B?aHdiaFNsdm5hckR3YWJWU3hsaW0vYzd5ZmtQT21pUXF0WjVleDgydjVEdFJJ?=
 =?utf-8?B?OHVwSTI5MXN5bFBEam1QQTYyTzVJZitUWEdLejRKOWhJVFhqU0lLWWx4ZnlC?=
 =?utf-8?B?azBOS3JZcUdyeVg3Y2ZwaUFMYm1hWW1zV08zaDNSWXp3VktNaXpIRk5MVy9o?=
 =?utf-8?B?M0JWckdpMDZwTFNFOVdQQTVMcjdyMDhsUWExMnM4cUVvZ0V2cTBlNlZUOVE5?=
 =?utf-8?B?SFoxQXUwbHJvNitlYXY1cTBpNXZBRUduWWlkamU2azRRbVpRNXJUd3BhTGVi?=
 =?utf-8?B?MU91a0w1RUVyeFF5V21jMGpwN2c3SWRZbzlYdGVCdHJZRDhMRVU2THNEcUc1?=
 =?utf-8?B?dGpjaVB4R211MDVRNXduOU85QVRrVEtqb2V6SkZlWjZxUHZibmlwbHAvUlND?=
 =?utf-8?B?T0xuRHhvZTNQV3h5Q2E4Y09wQWdhRzhwRVVxbTV6SUVyYXIzVkh3OVpYc1ZS?=
 =?utf-8?B?NkJ1ZkNSTjZrU01TUTRmUjBLR3AzeHZaSk95eUx2YXpNS1d5NXNCTHBDTWFJ?=
 =?utf-8?B?bXYyQ1c1MkxtdEhxU0d3VW5nODQwcUpTeWVUTFJQd29zUk1scGh6ZlZsSWtF?=
 =?utf-8?B?RUhTVGxrcjdVays2TU5jNE1ROFBYdGI4dmhhTnFpS25hOC9YM0FqTk96ajQy?=
 =?utf-8?B?TGpZQS9aTndqT0F3TEVKVWwxSU82V3FNdS92TTRTWU11dENUdlRleDRkcE5C?=
 =?utf-8?B?Zzd2QzJFUkM5U1M1UElRd3ZaemxENkF5Z2xqNEtwc2VFdWFqdjBTczFsOFpE?=
 =?utf-8?B?a2RwRXA4TSswTVlNeXQxMEtZVlNQYndqV2xCanEzbFhvZlJpWHVnV0tyOE8z?=
 =?utf-8?B?RTJiWDFkTEV3dks3bi9pRktjZlhkdHJ3enJKSHovU3dSazFROTFqS2JnVmV2?=
 =?utf-8?B?M09yNFlDaVRLaTVWWGxrdHhjamVJN3lhZDZVOHpJZG9qeWZmS2JSUWpLM1p5?=
 =?utf-8?B?VmpUWDhRTkxQRkJJSUU3Y1FmMGxTcTZwZ3U0NktRQ3h0cVEwUXlnVjM3Q2pk?=
 =?utf-8?B?VTgxb2lWcVZmZE9SU2lmWHdvNTVTTnNiVjhWREprV204RVVrNklRTFErRzBo?=
 =?utf-8?B?TDU5NUJ1cW5jY3BaUlhDMW5ZcTlJOHRnS2NCbnNqK3d6UWs3ZjNGdm1SU1lZ?=
 =?utf-8?Q?gX/qg6uMQtTqcY6LdNKULpvyi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273ce284-cc75-4e00-04bb-08dcf382d543
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 16:50:43.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eicjfYngq9Jm9jzUihVr7e671/A6TmpcC7QEtkL1dRyRI3hvVnjDB1K2PCLhTH67fFiEbH2NNF/a+B54Zf8gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799

On 10/23/2024 07:12, Mathias Nyman wrote:
> On 22.10.2024 16.22, Mika Westerberg wrote:
>> Hi,
>>
>> On Tue, Oct 22, 2024 at 03:37:42PM +0300, Mathias Nyman wrote:
>>> Fix a boot hang issue triggered when a USB3 device is incorrectly 
>>> assumed
>>> to be tunneled over USB4, thus attempting to create a device link 
>>> between
>>> the USB3 "consumer" device and the USB4 "supplier" Host Interface before
>>> the USB4 side is properly bound to a driver.
>>>
>>> This could happen if xhci isn't capable of detecting tunneled devices,
>>> but ACPI tables contain all info needed to assume device is tunneled.
>>> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
>>>
>>> If the USB4 host interface hasn't probed yet, then we know the USB3
>>> device is not in a tunnel created by the USB4 Host Interface driver, so
>>> don't try to create a device link in this case.
>>>
>>> cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled 
>>> USB3 device and USB4 Host Interface")
>>> Tested-by: Harry Wentland <harry.wentland@amd.com>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> ---
>>>   drivers/usb/core/usb-acpi.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>>> index 21585ed89ef8..9e1ec71881db 100644
>>> --- a/drivers/usb/core/usb-acpi.c
>>> +++ b/drivers/usb/core/usb-acpi.c
>>> @@ -173,6 +173,17 @@ static int usb_acpi_add_usb4_devlink(struct 
>>> usb_device *udev)
>>>       if (IS_ERR(nhi_fwnode))
>>>           return 0;
>>> +    /*
>>> +     * If USB4 Host interface driver isn't set up yet we can't be in 
>>> a USB3
>>> +     * tunnel created by it.
>>> +     */
>>> +    if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
>>> +        dev_info(&port_dev->dev, "%s probed before USB4 host 
>>> interface\n",
>>> +             dev_name(&port_dev->child->dev));
>>> +        udev->tunnel_mode = USB_LINK_NATIVE;
>>> +        return 0;
>>> +    }
>>
>> I think this will not work if you boot with "thunderbolt.host_reset=0"
>> and the BIOS CM created the tunnels, and that Thunderbolt/USB4 driver is
>> bound after xHCI. Then it will mark this as USB_LINK_NATIVE and does not
>> setup the link so after Thunderbolt/USB4 is runtime suspended it might
>> not be there to re-create the tunnel before xHCI.
>>
>> The test case would be something like this:
>>
>> 1. Add "thunderbolt.host_reset=0" in the kernel command line.
>> 2. Boot with USB4 device connected (and so that it has USB 3.x device
>>     connected such as USB 3 memory stick).
>> 3. Since there is no device link Thunderbolt/USB4 can runtime suspend
>> freely.
>> 4. Once that happens the tunnels are gone, including the USB 3.x tunnel
>>     so the xHCI might see disconnect here.
>>
>> Also on resume path it will not be recreating the tunnel before xHCI
>> because there is no device link. I can try this on my side too if you
>> like.
>>
> 
> You are right, I was able to reproduce it.
> 
> Device link won't be created if BIOS created the tunnel, thunderbolt driver
> probes after this usb device is created, and "thunderbolt.host_reset=0" 
> is set.
> 
> Turning the device link "stateless" could possible help.
> It removes driver presence dependency but keeps correct suspend/resume and
> shutdown ordering.
> It should also help with boot hang/probe issues seen on the AMD platforms.
> 
> Mario, Harry, does the following work for you?

I didn't repro Harry's problem, but I did try on two OEM systems 
(Rembrandt and Phoenix based) with this change in place on a 6.12-rc4 
base and didn't notice anything worse happening.

> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 21585ed89ef8..03c22114214b 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -170,11 +170,11 @@ static int usb_acpi_add_usb4_devlink(struct 
> usb_device *udev)
>          struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
>                  fwnode_find_reference(dev_fwnode(&port_dev->dev), 
> "usb4-host-interface", 0);
> 
> -       if (IS_ERR(nhi_fwnode))
> +       if (IS_ERR(nhi_fwnode) || !nhi_fwnode->dev)
>                  return 0;
> 
>          link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
> -                              DL_FLAG_AUTOREMOVE_CONSUMER |
> +                              DL_FLAG_STATELESS |
>                                 DL_FLAG_RPM_ACTIVE |
>                                 DL_FLAG_PM_RUNTIME);
>          if (!link) {
> 
> Thanks
> Mathias
> 
> 


