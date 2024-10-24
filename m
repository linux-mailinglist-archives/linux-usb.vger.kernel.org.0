Return-Path: <linux-usb+bounces-16636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD39AE641
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 15:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC22D289CB6
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 13:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B97F1E3DD1;
	Thu, 24 Oct 2024 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="44+4BBTY"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912381D9A48
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776293; cv=fail; b=MXPw0FstmFfaoDqO4F/xYEbNoegsZDCeDtBJvtr+Y2HmN5BjkKplgcdfHeWqwzJT9GuK45mCJr21P36Wpgz0en5qU3xMh0BJghiKKbfGEEArpsBUwpynhElJge7GW3sr6YQ8ZMmtP3DnlUiVTWbok9bSNddZCNW9qB/QEuXOMCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776293; c=relaxed/simple;
	bh=ytHyTK9xL1evKNIGinO9rZLyFAx5ubVA2qKsLF9FtLc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=emYduolsVLozRUvRbgS//TDsvYyA19hZwFp2DMexMJoG02KQL9qrmQM2s2Bdk/rJrTetl9Y505jnxMNapGdxcjEwHNhpsS0qMUibTW2n0GEN5Jexpm/+cg53wSROjBnERhyX6EN22QT6GeyjFzxXkixh6V6oasBGuD7zxOXciv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=44+4BBTY; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFZeo3mAX3X/09zUoQqMC0f9ham+xYrCmwqN3GrJlWbPPDL6MpJgGAydw9gEZjUMm73+eK0peZdqojHgSdHShuYWEX2pSrNgUwurqDTA1PyK4f1RGHHoEYbl6bxhkIZicSIbLju5qQdXl4QYfFAyBclErlXvBCoohxtaJCPK4AS8SjBm04VIche2GD9jo6V64ulg3mMFzqhSPO1G7rPh9dy/+FXb4OTLIzWm9wDKfGItAUKV6zf9goz8Dr+/eb043WZdHV4BXpxH3CfZflJhM7jKhvdvEu58JvS6YkG04rJFEBKK+YkLVga6vbsSQE/zH17tQEu7f68eJsU2EwIuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D03mZRcHLOnp6qZdvEVK/sU4x+/iOvi8EtrFfu7twzk=;
 b=mEYo/rHOipTCTU+DgZZfSzD6K3J2dQqbWaH3eIL3BPcIiw87J21lz2zavs1nLEqhxPUv89Jzh9I4CaK+50be3hV+BCgG5IagiO3oZ4yKsEqE5xEn0jZUhDGIuqhT0GSvA0fzynH/nhvr7Vjn/oZUeVobZ49cE/hrTrJG8EFo/4Q0cFET0hfndJCy9iXE0tj9AxA8L/K58BDa/+ryFdYCWAnovUZOelyIkFNDX9sELnrn/+phnRGg1YaoJEf+KCGVcqLm5ziFU0iaYYKDJtrn4NsvWSFJoEHqzEHaUgtZjCtoUqRGWTFa5CajBX4UkcpC3C0ugxEeq94P388+zK9U1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D03mZRcHLOnp6qZdvEVK/sU4x+/iOvi8EtrFfu7twzk=;
 b=44+4BBTY5a6vRBlwyS/P2J5apP7jiKD3q/YbM61haUjlU4iulo3+s4735oYPZ+ZKoPVedPFDtTapTH+HTdaiYNUBXRa52b8LpuU5llhJOCoi0nU/kTRJoTvpzq5IxsXDAnM0EN90mRE80I+vHo7b7Pa3xAzgxhygLoEo6lvhunE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Thu, 24 Oct
 2024 13:24:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:24:46 +0000
Message-ID: <00a0b176-3bab-4bed-a05b-8e2bcfd23fad@amd.com>
Date: Thu, 24 Oct 2024 08:24:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com,
 Harry Wentland <harry.wentland@amd.com>
References: <20241024131355.3836538-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241024131355.3836538-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:806:d3::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f7a6d6-c381-41c5-f426-08dcf42f3aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDVISkZTWDVhYnpjVjV2aFVHT3NDd0Z5MlFHVEVmZGtFQVUxSTRmQ3FnODJn?=
 =?utf-8?B?dktITllLVkpYMFA5b0FRVE1wM3JQZmIwbEhoMkdScCtZZXV6YnZXTnE4OTZ0?=
 =?utf-8?B?YWM1azJNMXo4RkNjTlQ3bDhSRXBucGRtSXBORUJxOFhJQkMzMEZucVpnUWRF?=
 =?utf-8?B?TUNhYXZyVmEwcG5Fd1IycURQOERzSkZxc0szQis2RHpicHVGQnlFQTJ3ZmVD?=
 =?utf-8?B?RkZLRGxyTCs2OVF1b2RzbHA2Q0MvUVloc2lvNkxHTUFoVStCNm9KdXdxOXdX?=
 =?utf-8?B?NldtbnFrc21vMTIvaHlhbnFqWkJoRjVEV2dsNk1rK1A0TEJoMHIwR2J5STYx?=
 =?utf-8?B?SURMd2R5cy9sSHNsQ1V1SnJGYjM3ZWYrMzN6QWFkRUZUSTNpa3NZSVpLVFFx?=
 =?utf-8?B?RXZubHZxYlFwalNTQVlpSWRrSXhSZEtyamFoOUlJSlhoalAwa05UZFo1bkhF?=
 =?utf-8?B?cTcvL29mNmpBaEt0Wlh3blFZL3FxRklUZW52Mnd5ZVdxcjlwWGdvcmpzakIr?=
 =?utf-8?B?dzVxOGdYMjFRVk9SenZhcFRWSzBtRjhISnBrRStmN2Q1Wnl5ZTBwem9KNFY1?=
 =?utf-8?B?VWR5dm5qelZoQVk5V3JIVkR2NFZuMTZ2czgvWlB4TWU5QUN1QXEvVnA2bEph?=
 =?utf-8?B?a2o2ejNhTEhEc0FHMUw5cytLZko3SHdpc3ByUHhSaEU0c29sV09TSllLS1Ni?=
 =?utf-8?B?V3plYStNRmFsVUs3aGtEbUgyMVYxclZrM1NTOHh3SjhidFF1UFZRaThLNGI3?=
 =?utf-8?B?Tno2cndUY1UwZjNhZkRZUGpheGFscEtTcFZjeW52Z3NobkxQZ1N6NWdjMU5S?=
 =?utf-8?B?ZjBYMjFJSHAyUWY2UHpJZzM1cGdtcExtdU1ad1ozVWdhR281cVhTcjl1MjZU?=
 =?utf-8?B?bjFueWxwQTJYRWxva3VqZFFoczZOL1YvMFo0MlJxODY0MU5IdE1xQldiSXdv?=
 =?utf-8?B?YnBtTnlLNEpxelBzR3g5alV0Yk1qakt3QU4xS3VWZUFTMlh3TzdEQmNjNHVG?=
 =?utf-8?B?QkVRSXBLNEhLN1VFSVdHRnFZU08raFI0M01STFBaTGZZc2drRThFbjd5MWZq?=
 =?utf-8?B?Tnl3bDlqTkx3b0R1NXl4Y1FpYmFGZ3A2MjM5KzBRSEpvWjV0SjlQWWRRTjlk?=
 =?utf-8?B?RXUzQUtReDlnVGRXU1F1c1hxU0ZhY3FKRFVmbUNrTXBIZHFmVExVbkFJUlZs?=
 =?utf-8?B?MmhLT2xCZXd5N2JoNmlnMW5hU2oxNGRlMSsxd0I5M3FLc2wvK3NRMk1tWHQv?=
 =?utf-8?B?Mk5BWWdma01IRU1PVW9ZUHNVdFZhcmVUbVRINGw1ekpYSlhCQ29MSXQwN2RP?=
 =?utf-8?B?ejBHQVNCWmVnMFI1emxhQXl2bEJFenlwb2NhbjVHTjFYWVJvZzgvNnpwcVdj?=
 =?utf-8?B?VkQrazVjNVJmb0JIRjk0cmR1QXY4TVdsQ01GTytZMWJ1V2hvYTZBMmpGeEhu?=
 =?utf-8?B?Tmw3SEluckxQRVBUTXByZk14eTltUWlDYWJSZkgwMnJENXNkTUM5TUgvUFpt?=
 =?utf-8?B?SEhKcEVLa09pWHBpb1B0ZDV0WmZpa0VrTURzQjBlUmhkSjRKckFnNTdxNXZl?=
 =?utf-8?B?MjRjM1E3UHJhUzFWMkNFcDhCckwveGNMa21zYVdyMVVYc1A0dXMvb2JLem5u?=
 =?utf-8?B?R1ViZmY0S1BqNEwybG1PaDAyRENvck9SVlBqUEgxbmJucStVenR3Y0MrMHJH?=
 =?utf-8?B?VklWbTZVbGo1b3ZzdWJ1aG5MSnBkbmVIMURpTGNzdGE1Y3BtNnRRT2Z0Z0tu?=
 =?utf-8?Q?BdFmO3avbufgLAl3fVfYkOND62CKyJRxxGw+7Dy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ni9zUUVHVW1PQXZ2cW8xZ29nQS93WFprRHFMU04vRkxqdWVnUkdWQVhWZllQ?=
 =?utf-8?B?cUJNZ01SR2FINjNqZjBvTE1sUjVQVnAwY2IzVndmMEN2WWNCR3dEWVhvZS82?=
 =?utf-8?B?em1TQTFaY0lucEVaR21nQWNhWUpDTUFyMlROdWcyMEYxQzR0YVVDUXpHY0Jo?=
 =?utf-8?B?czlRZ0JPVWNyOXRrTXBnQmV2TVVUc3dQWVFKeE5KRmdBaU45c0dwd0VVNmQ0?=
 =?utf-8?B?UmFYVFN5OUUzQXpYNklSdWpTV2xwR2JacnhHT0lTaXNtVVlmVGhDZWhJVFJT?=
 =?utf-8?B?NGFvcGM0TTJKdzUyNEIyY2Nqa0pXSFRPUjJYWEZoUE1NRXVZdXRSaEV2T2h5?=
 =?utf-8?B?aFVFdHdvK21PNDFXVGp5dkRiaFZSMVlmOG1yUUdBUXl6UldnUTFFbTV6Rkhz?=
 =?utf-8?B?eXcreXBlUkRaM085V05uS0Y5eFF6eEFzeVpGd0FKL09XRCt5OUZqRXAzMmxx?=
 =?utf-8?B?cTRHdFJBYXpXdnR2cHVYUmYweHdTWDZFSlFIZ0cvVFlHb2pRSHhwOGxEV3M5?=
 =?utf-8?B?TVYrVUVaa0V4QkpNVGJJUGxDYU9Za2xjUWhYcEl4dDdFVjlYMXBuMjhHTHlp?=
 =?utf-8?B?Qm9SRUF0VlhrV2EzWW5nZUo4bWk1Y3BmazJvS1lHS3FJRWtTTFJKQ2c5YWMw?=
 =?utf-8?B?WWN6RXdac3M4a0x2M0dMOHlwWTgrenBCZDhYVUJUTVFrdU1ibHRjVnRMcysz?=
 =?utf-8?B?cGRlRzc2eEFWMFNYTi9STzBmTlN3am5zQUp2bzFhQzREY3pxejBtUG1jZ0M5?=
 =?utf-8?B?MGRMMWlhYzAyS1QrYzhiL0RuaUdObGl5SzN1VjdSeGVhMHg5cGhob0RtUXYv?=
 =?utf-8?B?UjlKcWgrTlRKQi9IdU1SbzdoSUZmbjQ0Nk8xU2VteWZSclNseitjbllKVzdX?=
 =?utf-8?B?c1lzWlBqYW9YODVXbERuKzdYYnhmN2VXa0paWVU4Z0NsbmhrMWh3YVZLRUlr?=
 =?utf-8?B?a2tUWWIzc1VYUnMzTE5JaittdFlVWDRESHBPVGZYUTFIT0xBM2VtdjYweHF3?=
 =?utf-8?B?aE9lcXJRRlF0VEFiSmN6MnF6MlNWdjh5anBmMk0xY0dzZDN1VUhqL0VoYWVH?=
 =?utf-8?B?bjBpQnUycDBPcTN0azR2VWRZbHdVL1VkV0gxbEVTd3RsRkhWMDNRWXZlNS9y?=
 =?utf-8?B?MWdPaUs5R0xsWmQ2dnlwL1RveXBtcC9MNWQzcUFmQnJUYzBoRE1QZ0pRdGpw?=
 =?utf-8?B?R0ZrY1c5K3ZtMS84TTBUZXMvYmYwMloxYUdGNys2TzE0WVhsL0VSNXI3dHZP?=
 =?utf-8?B?TG85VzczRTlmTWhsc2VzdG5yM0duTGdZaEgyK2prSWZiQlpxWE80YThRRHNk?=
 =?utf-8?B?VUpqZE5QcU80eTJHZE1TMFVrdDVoZFJPZzdEOEFzSmUwVmdwcEVhbm1ZQUhh?=
 =?utf-8?B?U0YzQ3hOMkJVWE9sMkd2UWhSZzNnOFl3RGhXdW9aZ3RXdUQ2a25yc3NOM0Nl?=
 =?utf-8?B?VHYyNkowUGU4RFdEdnNFOXAzQ1pkUWdBK3RFYkczRTJaRlFGUldacW40eXgy?=
 =?utf-8?B?a2RnL1lnSnI0L1l4S1M5QUdxc0JJSjdUN1RTQzJPSDVjRkhCcWY5a1duRE1w?=
 =?utf-8?B?MDZpZi9pZWtRSkRnRENNWVFKOFE2UHJud053Tlh4WEhaRmwydkNodkJWR0Q0?=
 =?utf-8?B?a3gvRC93OWx4N3JXTVovcEpXSkxOdkFSeHl1WVVMT3lRYU1QWkFOZ0lwanVa?=
 =?utf-8?B?Q1NaRDRNWnM1QVcxb0tvTE8wSlkxY0ZiWVE1c1JJdGpIcldQQmFkSS9xL1po?=
 =?utf-8?B?c01BM2pSWHc4bFdHZDd5NGt5Szg3cWZzcUhpb2ZMZElYZjdEZExpalVkMDNz?=
 =?utf-8?B?UkNJdDF3dU83dWNlaG9zTWJNMmxlOTVKeHlGNzVBa1IxVFcxOFF5ZWNrNXcy?=
 =?utf-8?B?T1lNOWN2SWZyOElpbi9MbkR4MGhnZFh0OTl6aDZWd3p5VVJuY0hBNFpBOXBM?=
 =?utf-8?B?bDlHQlVwMmpOTVBIdis0WWlrYWdwMUE4Q1lKb1V5YTkyazFKSlNLTnVNbjdm?=
 =?utf-8?B?SDhTeWdreXh4TFVrREFydWhoY29ta3pVNFJRNDl6OEIxcTg1NnFzMW8rTS92?=
 =?utf-8?B?dlg2VnhlaWNCaE1nL2ZQRGlnSnovRHBDMEpjRWFBL2pxWkU0T2I3c2pKeUh2?=
 =?utf-8?Q?wr12Hpqbr66XG4wPiMdo/FQRM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f7a6d6-c381-41c5-f426-08dcf42f3aa6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:24:46.5991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD6BdsIhWAV2c0TqSVEo4VSIul0AW6NK5I5IkIwjLiElwf4ri6/Bk86/3oT7YU+JrdKdT+Rf7vNodk1J+lDLDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216

On 10/24/2024 08:13, Mathias Nyman wrote:
> Fix a boot hang issue triggered when a USB3 device is incorrectly assumed
> to be tunneled over USB4, thus attempting to create a device link between
> the USB3 "consumer" device and the USB4 "supplier" Host Interface before
> the USB4 side is properly bound to a driver.
> 
> This could happen if xhci isn't capable of detecting tunneled devices,
> but ACPI tables contain all info needed to assume device is tunneled.
> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
> 
> It turns out that even for actual tunneled USB3 devices it can't be
> assumed that the thunderbolt driver providing the tunnel is loaded
> before the tunneled USB3 device is created.
> The tunnel can be created by BIOS and remain in use by thunderbolt/USB4
> host driver once it loads.
> 
> Solve this by making the device link "stateless", which doesn't create
> a driver presence order dependency between the supplier and consumer
> drivers.
> It still guarantees correct suspend/resume and shutdown ordering.
> 
> cc: Mario Limonciello <mario.limonciello@amd.com>
> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
> Tested-by: Harry Wentland <harry.wentland@amd.com>
Tested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>   v2: Use stateless device link instead of checking if driver is bound
> 
>   drivers/usb/core/usb-acpi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 21585ed89ef8..03c22114214b 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -170,11 +170,11 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>   	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
>   		fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>   
> -	if (IS_ERR(nhi_fwnode))
> +	if (IS_ERR(nhi_fwnode) || !nhi_fwnode->dev)
>   		return 0;
>   
>   	link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
> -			       DL_FLAG_AUTOREMOVE_CONSUMER |
> +			       DL_FLAG_STATELESS |
>   			       DL_FLAG_RPM_ACTIVE |
>   			       DL_FLAG_PM_RUNTIME);
>   	if (!link) {


