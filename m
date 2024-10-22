Return-Path: <linux-usb+bounces-16527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D99AA27E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 14:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A176D1C21EFC
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2024 12:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4705019DF81;
	Tue, 22 Oct 2024 12:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1vfRb+ru"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D419DF8B
	for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601471; cv=fail; b=j+ImrZyPkZLXQkHrI03/yNT2rTVtkLXBt5QW8rOiLm0Raiw+OSSBzTbIEULLWtLsmbpjEenIwwfmAdSawed9QXF3wgbCjuNb+MDKGYXMxYP1RuJh6cU99Sq9+KZ1j0jNzp55XAnq+W9YbOp5hRLtAha17f+vz5HYsx89uhztVbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601471; c=relaxed/simple;
	bh=DFqykVEclFNWRViGfAgekJ39qsly1VV4u3iZM432f50=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bCjmxUb8qbvOLaxUdxykolPBRmt5DFfT8JfboRqEmGAP27zEurd4zWl/WoAYXZAIUFyF185Lq6Tz64+c8tTVCmYHlVZMO9mnCrY3ZylsTtbYMvSspb6gWYgorEaNOidoeWUYq7OichO5NYpNyndlJgEtC4bfN8556mpt02Nb6g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1vfRb+ru; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnFVqqw5R3cQnw7sxwwusvNo6UtSk+lQFBcjUNe52BnQuksOih20uipHRXpTfXFPwPALq7yFn/Rw4/1hUb4mIY/1Nq8rzlk+87ipnrMnxipL01pXIb86eGQUu/4j8F4GKDDeTokwpfcfentxjZ4E0d6AxEYTMd2BmPmjyA1C+lXfztBDNsw2U7xUpkkN83G6B6h/6UHfxsbmLj0VeM53VxS/6Iov39BwV+OLJENzTYVD+TNuYPGubZODxb/jp80GXapkmJuZuzjqFvGFLlhgoS44x9zO0enC2WftqjoeFQeOHpAsuExL0jCI7Kn/1//GJPzWHtLhMu4ZMyfrCUw5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHlBlnMexTB/YYjDlaiKNR4IcG0UzAYr2gWYYPj+Bvk=;
 b=qEIuvDM4OR0qUfkr9y5+RvKgpJdlNBRHdKyU5zAZLvvl4EEC+tEoi5jpDcPM3jzIILNSZdPNpPbqggOd5GY7KYzY/pWHQxwQU2b28+AC2TxHzRDQCxCYIJiMdOF+QxVAr8AlCpyqxP6l/iLezRC0o8xHuolzEEE2l0V+MrXSGDEBkPvpMUEjTLBVNmJOp4ytlwmZ5nxJAvkgTlPr1kt8f8gp4s6LHglsh5jCSAhgy5zAFKwmpdmJ8wT5cWc4KBtZNlpXErlfLA6JtfVD0d1/JY5C0zrSZO+XG7vZceGp0rTHtKz2neVKPUCNA6AyJW15eOYuAfFhgommS9N937yHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHlBlnMexTB/YYjDlaiKNR4IcG0UzAYr2gWYYPj+Bvk=;
 b=1vfRb+rusmEOWTe5ESEwhHoVSvE7dBJwh+9SWiZ0Si+esu5yxi62ys5/3AKHWhyA/LsC6zjdP/ZQaMtt1mPEVpgOblrCROv+Lm5DF73402DSq/YFleRz10I8+2lfcpBghZeV3UoNtlnuzBlxRbVjvIXoPQzm/PXpUtg5QTMOTN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 12:51:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 12:51:07 +0000
Message-ID: <047d1d6b-d163-4882-b288-59498a456d77@amd.com>
Date: Tue, 22 Oct 2024 07:51:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: acpi: fix boot hang due to early incorrect
 'tunneled' USB3 device links
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com,
 Harry Wentland <harry.wentland@amd.com>
References: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241022123742.3045707-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0008.namprd12.prod.outlook.com
 (2603:10b6:806:6f::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 992feea2-4572-4732-e9db-08dcf29831df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzUvd1BBUWIzUEczaGRDVjloMSsyaW5xRXR6NUl0SUZYMGRiYndIaG5XeitW?=
 =?utf-8?B?MCtYV3M3TEhWQzRaV01JRjFJZ3ZMRjBya1AxdGlXYU9zd2VTOHRLcVlCK0dj?=
 =?utf-8?B?ait1SkxyMzVadDBJTFRtZ2N2WktMUzdseWRQRHVpZ09XS2xRbFlJV0lZWG9a?=
 =?utf-8?B?a2FDMlFPa1VveE1kUmNDeUhiMisxUWVRemlYeFI1dGFNTkNER3MxT1BxWDc5?=
 =?utf-8?B?bmN1WTNJVkRkNHpQMkZ5dCtqazlhd0NMdys3b3JOakg0TDJmVWFkU2xFSVJP?=
 =?utf-8?B?T2RvVE9veWczSi9ibGNheWY0aDE4NkkwbkpqUVVwNjJwQVZSR2RpR1VGTUhG?=
 =?utf-8?B?ZE9JZGRYbzg5VHk3dy9seXZTVXBMOHY4SDNhZVJSR24xM2FhdkJqL0pYVURu?=
 =?utf-8?B?SkV0SnZhSWpueGVhcHQzSytPOExOU1lDb0ZYNXdOOFp6UUc0TDY1SVYwSkE4?=
 =?utf-8?B?eE9TUG5DOU1qUHlyTVRjRDgvTkJ5QkZDR0JtTitOU2lBTWFPS3h3WFpnZXYy?=
 =?utf-8?B?OUFmQ2Z4a3dWb1ZJdHBmTDI1Wjd0RDZwZVB1UHpMRmJRTUVFSFpCMk9aTHRL?=
 =?utf-8?B?Rk1NVjdVN24yUjd5c2x5aVhBeG1vMzgrZDJTMXU3T0ZjOER2NDNHQ0Z1bzRr?=
 =?utf-8?B?SWNLdDkzdmJkclgwVlJRR01FMGtKcVMzTVZob3FnanNJSFViNUNhUWpNUHdy?=
 =?utf-8?B?TlljcVdxQ09KWEg1ODBnUHI1Uk5xdnlVU2libkYyV2VQUXFRd1dLcW11d1Rk?=
 =?utf-8?B?TDUwMUMwTEhpMHBpbHpKeFJzd0ZTWlJIZUcyV1RLK01mRENaN2Z3S0tRUlNk?=
 =?utf-8?B?TDIxSURWbWtrTmwzZWQ4eFhyVEI1ZnVoTk43ZmhIOFUzMi85bXFxa3l3dTlL?=
 =?utf-8?B?TklGaVBZWEYxQVFZTkdjMVZjK0FrZm9DMDRnRE42aEVzWHo0M2V5NVBpMDF6?=
 =?utf-8?B?U2pzNnpubUFYZWlOOHE5NUpvNFRGS0VWZEpMTW9ST0IzcWtnRURyUHRUMU5B?=
 =?utf-8?B?V0Qzc2taL2s5MXpCZUJObk9OLzFCU2x2bCtyejZIT1J3YlJnYnZnb2JPeThj?=
 =?utf-8?B?ZXRaWUZJOTlxbVhtZWI2NzVSV0FMWm93OFhtcGdLSDNzNEs3b2Z5VVh3TVJo?=
 =?utf-8?B?T3QybnlwOWFlaUNRVDRTcnVtM2JxamRuN0s3MG16alE3NVQ4SzN6dWt3bFp3?=
 =?utf-8?B?QjNMbHMwTHZaR0cyaGZPMTc3ZlM4M2M0K2IvUkZKWkhqMVJZKzFYOURNL2xr?=
 =?utf-8?B?Zk5odzdENnlSc2kvV3IxOFNub2gzUm1ndG1OcWpxbDFDWGhjU1UxdlJ2UXdT?=
 =?utf-8?B?NU90ajZDNnVSQzU5RTM1L2pMNG50azlabjcrQXBudHJpbTYvSk5OUTM0TXlu?=
 =?utf-8?B?WjM3ZExRd1ZOWWZLV2QwdlE1amV5RG9lS3hMd0FmWTQ2YzErRHFPT2NSeUFE?=
 =?utf-8?B?elJNS1lveG8xZ1l5K2ZqdnJzOTJSdWlYaVdOTlJNR1lQMmRXOGFQNExIWGY1?=
 =?utf-8?B?Qi9aMExQYXpCd0RqSVJoWURHYjVTejZoQWVjZ1RUU2FzY0owNGVRd3JnN0w1?=
 =?utf-8?B?RkVqTklTeU1IeHVuTDZqV1pXUi9ReEhIc0hWQ0p2cXdtamlUN3pmMEFLdnhU?=
 =?utf-8?B?WkVFTzl2UHBFbmJ6U29UOE9kYnRvQXNGWDFoZlB5N2pkRGI1Q21JazRrWGhF?=
 =?utf-8?B?UDltc2RRNFVkL2FXT21PQ0VzeDlVRC9Jcy9VVkFCeXoyZW10SUtsVndhZi9D?=
 =?utf-8?Q?PQs/QSQcRPEJFKjHObe00OxrdbaSheYUF4lqiLc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym5CaDEwUGFkWWk0ZVZWSHpSK09HOVYzKytubWVqTHZPMkN0bTFZODk4S3Vt?=
 =?utf-8?B?b2NZbmsxMmlGbE1WalVaS2MzUXJnb0Y1ZFg5TEV6T2tYNmlIMXVGNW5EcnRa?=
 =?utf-8?B?TU1aSWJyQitkbEUwVGFTVGVqWEc2RWt2cXpsSVM2d3RGc3hYVG1rTTBXaC9r?=
 =?utf-8?B?dEc1cktIYUc1WHZmNXllUTZyMkIzRURWdDhjR3UwcXVHUWM4dVlZdVlhUEd4?=
 =?utf-8?B?b1E2V2g1SGhQYnlCTnphSlRPdGtCdjE1K2hTKy9yeTF4azJBM05aV1JJU0hl?=
 =?utf-8?B?Vi9ZMHJzU2NJNG1vZVoyUEh4R29Iek9OVnk5cEdTMmprNjRzcER1RDlWZHhU?=
 =?utf-8?B?RENLQUpReS9kNkFqOVNYaGhuMmhjSlhCNG9LWHRzSUloWE5mTUJuTkl0ZGJs?=
 =?utf-8?B?RmEzYTA0UWlpMFlZR2xsN2FtVzQwNkxkZEREWmZhR1NJUE15ODRmVjdHSXhj?=
 =?utf-8?B?bTd2OXFTSnpOeC92UVdXV3F6R3VhZ1ZpOFpoQWkyOVBITmFVNy9nbWhIZGZY?=
 =?utf-8?B?UGN2a0FXZWtqNEY1Wk50RytJMDl4bzI1bHNxOEVONzVwdzdWSysrT3VHTjVJ?=
 =?utf-8?B?cDFBczFyVEtPZFdUYStEeTN3ai85U3pzOWNMd08xZlgxVnZKL0FlcjlCWWJa?=
 =?utf-8?B?eXZXdHd6bXd5Z3F0V0xmeWs2ek9KU2NtZXZWUVV2cERDRU9VYWljbmlQK0xk?=
 =?utf-8?B?WnkwZlZpZGZLRHBSWHhHbnU3SnFtTldpdHBBSERiOEV6d013YnJaOWdRNWdj?=
 =?utf-8?B?ZFA4MWd5QlBGK2wwZWRJQUs3ZVp4eXJHMXRscWdGcERzbktNOGd6ZFJUSGU1?=
 =?utf-8?B?VmI2TEJNWGNDZWZoTEtqT29SdndLdUJsaU8xVUpRL0ZWcGRxaWMrR3Jmdk9P?=
 =?utf-8?B?OUtPNVZtWnhqK1NZcHlxMm5kQzZIK01xRUgzYW4wVS9ZdE5Xc0poUVZpTEht?=
 =?utf-8?B?d0Y1T25HZEJmbVF4MHBtaGZDTXRIK3MrSVdXQWc1SzZEUXJ5SXZFeGxMOS91?=
 =?utf-8?B?Ky93dEtpR3VBUmY1WUhQaGoxSHU2VDdKK0V6WDdoUmZYeTI1N2NXT20ySVFq?=
 =?utf-8?B?OXNMdHJvV2tMUkhWYTZqNExZNVk2Ti85dTc3ZkR3THpIeU05SmNlUXptSmVV?=
 =?utf-8?B?NHJZVStnYTkrZk4xUzJXNnNhYXpPZWVRSGF6a0kvcHgzUHc3bnFXSE54NXlP?=
 =?utf-8?B?ZEhzL2pDQVlYcklSeVdQM1BjeWZVUUdwcDhrM3hIeThJblN4aXE4VXNodFZr?=
 =?utf-8?B?WU91VkhmZjhadENGZVFZdFp3WjVqOUQ0eHVyc1paWDJYVjJCRXVwMUFDR0pE?=
 =?utf-8?B?R0E2bmNKSG92QXQvZ0pnK2hYb1N4cTdsNzByaWpDWmhxRW9mTXNobGdPOWpC?=
 =?utf-8?B?K1VKdnpIaUtFZ0dUUHFKRXJLTDNqc2dmZWVlTVJhbkw3SlZSNmlVU0hCWHFj?=
 =?utf-8?B?WXd3azNMZEVIaERnandYZ1cxZVlqUzJSb0JJTkpxZjFCZHp2SzNVUndkTXJk?=
 =?utf-8?B?OHQ2NlJhVE5CV1ViRlFHVHVuQXpjNkNzeDN4d2RJNmtqV3NJNVZDRVRYQlJR?=
 =?utf-8?B?ZUtjRTVwVEVhK0Y1TUp4alYwOEliY1ExamY3eDhqYjV1RTZERzhjdXhPUy9Y?=
 =?utf-8?B?eVJyYXY3a3RQOE9tbE8rdzhhdFd3QWNqSnZhS0J1QkkyU3dVb0JPVGxQWk9t?=
 =?utf-8?B?YS9QNTdDT2daUmtWb3BTWW41anQ3Zi9MelgrU2g3NEhENm9YSitEYnBIaVlh?=
 =?utf-8?B?UVRWRCtlQ1NZVDJpTGZlZ0ZzRmFwczYxR1oxZ2xrWFh3aGpPdW5aTDFvM25T?=
 =?utf-8?B?ajhCbi84eVZ2a1R3Z0Yyd045OU1yVjFVeDM5S2V0T2RIQUJWZXE3cnFzdW00?=
 =?utf-8?B?SnlTbTJyRE4yYmEyd0NCd3NNaUpXRTZRTjNBUHlkeEJEa3BYL1prWWNYVmM4?=
 =?utf-8?B?TjA0c1AyajUrR1Q1bTliYjdWV2JUb2lYVjRMVHAwRU42MDllRlBnOUFOT0pl?=
 =?utf-8?B?QUY5VmlUU1UydC9LQ093NnpleU1OMUpLZTlkMzBVRVQ3WTl4VGtLYTF0ZCtr?=
 =?utf-8?B?ZXZzaGk0bm1FTjZrd2NFWldGYVJ5ajc3SjZveFFCYzJXYko3aEo4aDhtUmJs?=
 =?utf-8?Q?by/0gp9aEbgmqmnHD7pjhj5yc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992feea2-4572-4732-e9db-08dcf29831df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 12:51:07.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIVStPStFBxmjaCFtm6Vd2h4HEhtL1H9MIvDlD6fDBKvL6aJO1tvdMib8Qh8cik041oQ5c4bDpBHvUGgJ8SkeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806

On 10/22/2024 07:37, Mathias Nyman wrote:
> Fix a boot hang issue triggered when a USB3 device is incorrectly assumed
> to be tunneled over USB4, thus attempting to create a device link between
> the USB3 "consumer" device and the USB4 "supplier" Host Interface before
> the USB4 side is properly bound to a driver.
> 
> This could happen if xhci isn't capable of detecting tunneled devices,
> but ACPI tables contain all info needed to assume device is tunneled.
> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
> 
> If the USB4 host interface hasn't probed yet, then we know the USB3
> device is not in a tunnel created by the USB4 Host Interface driver, so
> don't try to create a device link in this case.
> 
> cc: Mario Limonciello <mario.limonciello@amd.com>
> Fixes: f1bfb4a6fed6 ("usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface")
> Tested-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/usb/core/usb-acpi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
> index 21585ed89ef8..9e1ec71881db 100644
> --- a/drivers/usb/core/usb-acpi.c
> +++ b/drivers/usb/core/usb-acpi.c
> @@ -173,6 +173,17 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>   	if (IS_ERR(nhi_fwnode))
>   		return 0;
>   
> +	/*
> +	 * If USB4 Host interface driver isn't set up yet we can't be in a USB3
> +	 * tunnel created by it.
> +	 */
> +	if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
> +		dev_info(&port_dev->dev, "%s probed before USB4 host interface\n",
> +			 dev_name(&port_dev->child->dev));
> +		udev->tunnel_mode = USB_LINK_NATIVE;
> +		return 0;
> +	}
> +
>   	link = device_link_add(&port_dev->child->dev, nhi_fwnode->dev,
>   			       DL_FLAG_AUTOREMOVE_CONSUMER |
>   			       DL_FLAG_RPM_ACTIVE |


