Return-Path: <linux-usb+bounces-31375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F5CB413B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 22:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EEFE3003FB2
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 21:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239D8329E72;
	Wed, 10 Dec 2025 21:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vcEOXlx/"
X-Original-To: linux-usb@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC3324B30;
	Wed, 10 Dec 2025 21:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765402955; cv=fail; b=FSSAmdo5Cxcd+gxT+T0Rb9dffb8eSHqQ63N/4iAap8e0jDOqPpqJH8/q+xSvmDSW/FAXo4yqNTmNo4S31NuJl6mLK83q2vRPT7PsiFLg4VwECdGTILWFEy94HoI38WSkBYce3cvqCj831bSLRPVhKgXRajBim5wPUZTeXQvK/+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765402955; c=relaxed/simple;
	bh=Zum3M8mDonGFKl0BZuUEMxuAJAd7zrlxNkQf0vNz+3Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LjOT/6XkpkX2AbxqYLoGWVMkx/i8T7oP+w8h4K48uw7ykmJnWJtE2O4e8NCxKAy+pl+Sxzr2TujTJVblitfARQ71GVJ8oFhGOSkT2MjgtNm1Coi0wrgQXNg4jmKydxM/1kOCUDZArutzDdcd6wTEJLC/xHxhwda1ijZ7TwYdsLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vcEOXlx/; arc=fail smtp.client-ip=52.101.56.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1ViF45oMbgAabquXG4ZCfVlSHnhHIxIEieqWEYahGdXPsH8kGZffVG/7SS68CnbDkqPvPOlRj8lzNnCkbrHdFxhjVYPFMFpb7hf7Doss6gAagXQ6SRu9n3r6g3Lc7FFKT9EsAe/Tm0Dc2J78XjfTob7nwSBrx8PQVgtqABjoVVF7DUDwQADqaqq488JuqC5UDWhVjmi5OB2LvOvNgS23Hr/O7/2tA0tQXKZKyEnDz7UYPPGPeLrjtqdEsDjsVQ4ysUkUYqpiDr7eK7iAbXAaDFI99L4kqF32g6FR2JUf8495zfnfRo6biKZGYM1Z5k76O2dKToFUsLNATIVzj9O6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn31Zfj3BOVNSucUasidR/z9KI+zKwaaCJxnR6kSOy0=;
 b=A5dDi5TGSHSmZmWFBFN9/wwBDtHsvTQ4+k7zygAT87waXhbXUNEyQLmyJPVx+rGVXXXjQc5KOqf7csywzNSY3xCwC0eAZsUtUbYhc1ecYvPhQcO11u/VPfZYjzl4c6e2Sbhryf6MbFx4vyU9U0SojAg3Cuq4x2ylBfjx9Fru9WNwRw1zBV5aant73nQgegnhYUTaoobnTbfp4ToB5r/n7v8DaD6pjfKBNOer571F0utbZhX8cvlvJuXn7T33l9arriUekwbkfT8ySAFjJsKb09p3ZcYQuZLFOeichyWggSEUnGr0yLKdtWLQIQ2SehVWYJD0tZVVU/xY+254fmSeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cn31Zfj3BOVNSucUasidR/z9KI+zKwaaCJxnR6kSOy0=;
 b=vcEOXlx/1b7il0RLb8VrbL4F62eEBrRlyxJV37kzHv4zIg8Psu6fUdoB4rw+CfXZMSICR0cCNcAnC4/nVTm0xywiyOU1wDE4NW8QeUFBBJVMxJYFsU8PTucEq4j2ZSCELz1qa21S2OaMq9kjgghxNgiAj1v5gHqfujKR6qxnNM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 21:42:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 21:42:31 +0000
Message-ID: <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
Date: Wed, 10 Dec 2025 15:42:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sanath.S@amd.com,
 "Lin, Wayne" <Wayne.Lin@amd.com>
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
 <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
 <20251210074133.GE2275908@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251210074133.GE2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:930:48::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6790cc12-b7ac-43f7-a4ec-08de38350597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlduNlZvcFBtbWg2c0x4RkdGUGRTVW1xYjZOU2V4dWtISDRYV21RZ0RpVEZV?=
 =?utf-8?B?WG1hSUErYWZmSzdURCtnZWxQM1ltWkFURU5KOWNLVzZiekhQbERiUU5yOGhp?=
 =?utf-8?B?ZGZ1QnBqKzQrOGZzZTh1OE14UkM3dUsrMkhaMVcyNlBuemtDaldqOVFuaHdO?=
 =?utf-8?B?VTh3OGJqM2FQTkplOXc4cTJrREJseHJ2MUl6TzA0QVVtSms0L2UxdFN0L3F5?=
 =?utf-8?B?blhndy9uMlk2VDlkQnZTTXlDQjEvUFlENDBmckhzNHBDaUlSdy9iU0szaGtC?=
 =?utf-8?B?N1Z0QVpDVThWOFBscjVZZ1Jta2VFSGthZGVOUHZLTmhRZ25oRFE2VnVRcU9M?=
 =?utf-8?B?dEd6YUErZ2luNGRFajNaMG9takNkSkJVUmpZNHNDSXM0bmZJSFNhalZjaXF2?=
 =?utf-8?B?YmIzWHJlc25MZmdpcGlnQk83UC9Jazcya3YyRmhtZHFITklwMXNuY09VSHgw?=
 =?utf-8?B?VXptS3hwL1RoNTRzdHlta05UQjgvTzVGYm1Fa1hNZmdpbVJtRmRmRU16c2Nz?=
 =?utf-8?B?OW9VakZjT0VUbGFXZ2NSQ1pqWExQMTB0bUFsTW55ZHBsYWpJWTFuRmNtWE56?=
 =?utf-8?B?eHcrL2xoZkpBOE1HSFlZUzZGcFlQUVg1T3g4Nys2SFQ2RVI1YmRZbXlhYWlj?=
 =?utf-8?B?V2xiTXoyRkFoaVlackZ1RTg2WERBZjhqR2dmMVpUZVo0K3p6SEVtMVFnaTNI?=
 =?utf-8?B?cllOMjJ3R0hMNnp1cTRXTy9kRGVtdFNNaGpyc2RQMXc3a0RJUmZFbWlCUHVR?=
 =?utf-8?B?aDdCanhja2ZEWnBhVmRQWXYwUEZHRE0yQmlPUlpnSkJ3L2FuR3dmYTk4SGFQ?=
 =?utf-8?B?aWp2d3RiYXZmV285clNpM0VTWFBvR0Ztd01QYUN5Tk9seDEreWp0dmV2a0Zq?=
 =?utf-8?B?U2NCdDY1VXErcGZxQ0tHN3FDQlpqUUJyYU9YWVI5VUFrWUlhaHNmTkp6ZmpH?=
 =?utf-8?B?RGF6Y1RZR0NwWXRkMTBndHFrS2cvck9McUtFL0tmOEtKMTBaeVRheFlsTXBR?=
 =?utf-8?B?VDdBNS9ZWTVud0U4bkdXWUFmQ0hrcC9UNEo2YWpRNVlPN3VxZWtSTmp6S3hY?=
 =?utf-8?B?RituNERsMm42d3BGR09EUW5tK3F1RGNlYnNCZHovVk1HSk1PSUp4WUNIanJW?=
 =?utf-8?B?MXdqSGpzSDBHV3UxTjQ5eEpNSE5ZYVduQ0tOQTl1QVVtcUJnMWZPQnN1Wk9o?=
 =?utf-8?B?djVkR3c2Qk5wYkFVaWpFOSs4NzByM09YUUh3ZjA0SUZpbVV6ZlNlOHIzMFh4?=
 =?utf-8?B?aUxGemNrMnVWUjBnYkgzZ1FWdTg5a0lSY3dqL1FxMjJqV1NBK0NDb0t0S2ts?=
 =?utf-8?B?ZmVFK0VpaUhLdkxrMVJMT2kyNlVpcXpzOWlKU0g0VkdpZVl3T3pKMVh3L3I0?=
 =?utf-8?B?d3FTQWhVV2JnQjlIdlM5enZ6TWxqeHYxcVEyRldvOUdubUNUa0lIZkpacURj?=
 =?utf-8?B?SkVwQnRQdFV1RjJmL0YxbnUxbm1HTUNCQkErSDJuK0x4bXNyM0d6c1ZjR1FW?=
 =?utf-8?B?SWtHdVFxNENKK0JPcDAwK3JDU3VhQXRZckZtQ25LSGxybGlKd3pLK1A0eExo?=
 =?utf-8?B?Q0JHdDVrYVMzbVJoWjhJc29TNTZoMmE2bWVMeTJEK1VZaWR3dUhnNk8rUUwv?=
 =?utf-8?B?SEZzamF6NDZyYmJNQ2xYV0F0K1RhUmF3Tzg2SjdlRHl4djNVZXZhTmJicWFJ?=
 =?utf-8?B?WFNabkFCZVJYQzZ2REh0Q0h6OHUreDJsR0VOYjhPYWt0MFFBZ29CNHJqWjAv?=
 =?utf-8?B?VkJ4SVRWdkR4U3lqS3AzTXZ5Mys0ZHF5OVpFVWxoamJ3VTQ2UWxITjMram5Y?=
 =?utf-8?B?VFZVSC9PZTZVdmRsYmR2NDVyaHpTOHZpVVlHQ2U4elovK0xNcDY2TlNpcTg1?=
 =?utf-8?B?aEsvWCtIemx1UXY3UlZ3OFlIK2N0akNUOHZFUEFhRFBHeUgrUkFobHRhKzV4?=
 =?utf-8?B?UzF4TEhvZ2gzWmozQlBZVm9kTTlFM2ZDNkdBdHN4bXlqdTd5WjdUL0Z3YWlR?=
 =?utf-8?B?b2RaRGxvbjRhSlJZU3ZaMjZRYjlhUlUzaHJxc1lPSWZmWG9Cb2FuRFdlaXUy?=
 =?utf-8?Q?E9iMXJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjhmemU2WkQ5THF5cEphVFNkeXlTYnBPZHJQaDRhd2VKeEVnam1mZWtKeEUz?=
 =?utf-8?B?VmxNdUo1UTVjM0RvTEVMaFhKNEFmSkQwMnZUM3RXSExRZ2N6WWxTeFMrckZF?=
 =?utf-8?B?K25UYUNXZG9YMGlISkxTbGlSMFUvTGVabEJtMDY0L1hZTXpDN1RiY0QyNVMr?=
 =?utf-8?B?NldZTU1tNzFSalZjSmJjbUVwKzU1NnhwRXdsSERnRzlzbGpyTnFiRWxFeFNH?=
 =?utf-8?B?SkE5Unl6WVpuYjZpdTdrVHRxa0dnU2F2V2paVWJFd3Nkc0h0dENlTXk4cmJV?=
 =?utf-8?B?T1ljTmFhODl0Rjk5RmxuREZ0cjFEMWlPMFJSa3EzWWk0dklidFZoZXExSW9o?=
 =?utf-8?B?dUcyMDlQbmJxR2paUU9qZGkyUDYvVngxbWF1ZDNtTmhDZEh1cFhCSVdPNEZa?=
 =?utf-8?B?eEtUVjhJQWFxK0NCK2JvZDNzNC9xUytzR2VCbnJkL20xUnVKa2hudCtVSTkw?=
 =?utf-8?B?VFBnakJXSG93Vk9YQnM1NGI2K1JpMW5ITnRLWCtzcmJKR21NM2dPNEFFY3pK?=
 =?utf-8?B?dkZoOEVwdnYzZUJKcjF6aGo4bXdQVExoWkZWbHhTWWIvcXFaMWtHZitudkR3?=
 =?utf-8?B?T1Y0WFgvd2Vkbm4vOHRpU0tHSlMwOTFsd0V0NytnTCswNmtmNzhNREV0R0xw?=
 =?utf-8?B?R01RV1EycXV5MXhKZ3R6WEgyaDFrNnhPVWVNWndEU2Yxb0JIL3VsMHRDYkw3?=
 =?utf-8?B?VSt6TGhBZXQyZVNZR21GOURRMmY1MWs4dW9FOGpqc0MwYXR2VVVmSDRBcmtl?=
 =?utf-8?B?NHg5WFZwVk50VEhoUHBkcVloYWU1MUJ0cHJRWWRuMzBtWVZCTnZmTXNNYVNi?=
 =?utf-8?B?WTUvRytBaWphWXFBVlVTc0g2R3BTSlZrYUNmemcvdDNyQlJVdHdSdXU5WHlG?=
 =?utf-8?B?OE1ZVThyMUNScFVFNDk0ZUROazNGaEJJei9UNTlSb1lXNTQvWHNJanh6UTlR?=
 =?utf-8?B?UDhlSUgwVzdSM251WnJ3SUZ1aVE4TThndU5aRlgrbVJHVzJ5R2dWaWdIb0Ry?=
 =?utf-8?B?cUUzcEp3V0s1T1lORWdQWFQ2LzA4Z0VCdWhqdmw0NlRwMGRCUlk4dnE1aDYx?=
 =?utf-8?B?S2RRUStiMnRmTXNKZnV1cFgwdzBEN0tva29FL1hnSi9lNU1vd0pvVXd6UGcy?=
 =?utf-8?B?cU9YTS9WbWIvcmRjKzJsYXFJVjBVaUFoeEJOZXRqbk1CS1ZNeElydTB2MFNJ?=
 =?utf-8?B?bFNqakdFeGMyZzZObXNkRzJ4eWFwSGRDVm5SajhjczFnMXVyYnNuOFBRYjFQ?=
 =?utf-8?B?UlBEYmQ5QW4xbHJVWExTeGJxeGZFUklkRFBLdVVVZDViYlJqN0g5dVhUbjlS?=
 =?utf-8?B?cDBkRXlsSG1qc0RzQ1J4eE82VGJWZWVMcTh0RkV6aHlRRjV4S2tGOTczRjRn?=
 =?utf-8?B?Q2NjaVBtQXREbFV2UmlQSVpMZ1R4REdRdmdsQ3hJTG1CRHJtUDhxTTRoMTFY?=
 =?utf-8?B?MXY5WURRRTNyR3lpYmhmOENUVVhHZ0pDeDRqb093b1RuNTlQZUFxVzRlQ0pa?=
 =?utf-8?B?NW9DQksrcEpJTlpxd09JandPZWR6NDZoVEd2cHJES3ZLZzMycUM0MFk1Nkht?=
 =?utf-8?B?RUhYa2N5WGZQTXltaFZWdUhQakhKZjRJa1pLWVJBSFZGa3pzU3owcGZpNlJB?=
 =?utf-8?B?RXlESTlHL3pERHB2NVZLb1BlV08ydzBMdlFacmx3djdjSHo2dmN5MENneDl2?=
 =?utf-8?B?UnRaZFJmampCVXpFYTdpeFJhSzlUVWMxOVZWM2Q4TlpyUkRFYXkvRHByREF1?=
 =?utf-8?B?UG5lVzdIUlgxMHR1VjVmTGV3bzJITEwxTXA2WnBZNkNNNlU4eE83bkdiempV?=
 =?utf-8?B?aXRaSDRsaVBYTGxGQUJ1ZUV3M0dlQ0I4SXJLeU12bUgrdi9BRURIUFVxZHgy?=
 =?utf-8?B?ODVGWllFSXZlRUhWMWFOUlhJTWRxUjUyUGpNVnpjZnc3a0pod1NlWk9VbzRq?=
 =?utf-8?B?cnh5OXd2TGlCQU9xclllUXRUYWdBVHhQU1NGQ0tLeWJBdUdidURTQmR1MUhj?=
 =?utf-8?B?VFRQU0x3MlN1ZXV6VFhtNTNubEVURmJBdDA4dCtXNlp5eDNZUFp1c3dzSWZI?=
 =?utf-8?B?RFVBRGZDNWdUcDZJMWhnN3FmMlpDWXRhajhpRFd3NVRyMFYrdEFocWQ4VTkv?=
 =?utf-8?Q?YxqvnPSBM6JMrB3S4/izzk7LC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6790cc12-b7ac-43f7-a4ec-08de38350597
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 21:42:31.3092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uggVwQyVHvmFYma7KTr46n2yUwLrgokOqB9eQDs04xIfCXvxeJ2fqBgMQRwox+YbyST/QVWLW/pos8wvxOJDMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655

+Wayne

Here is the full thread since you're being added in late.

https://lore.kernel.org/linux-usb/20251209054141.1975982-1-acelan.kao@canonical.com/

On 12/10/25 1:41 AM, Mika Westerberg wrote:
> Hi,
> 
> On Wed, Dec 10, 2025 at 11:15:25AM +0800, Chia-Lin Kao (AceLan) wrote:
>>> We should understand the issue better. This is Intel Goshen Ridge based
>>> monitor which I'm pretty sure does not require additional quirks, at least
>>> I have not heard any issues like this. I suspect this is combination of the
>>> AMD and Intel hardware that is causing the issue.
>> Actually, we encountered the same issue on Intel machine, too.
>> Here is the log captured by my ex-colleague, and at that time he used
>> 6.16-rc4 drmtip kernel and should have reported this issue somewhere.
>> https://paste.ubuntu.com/p/bJkBTdYMp6/
>>
>> The log combines with drm debug log, and becomes too large to be
>> pasted on the pastebin, so I removed some unrelated lines between 44s
>> ~ 335s.
> 
> Okay I see similar unplug there:
> 
> [  337.429646] [374] thunderbolt:tb_handle_dp_bandwidth_request:2752: thunderbolt 0000:00:0d.2: 0:5: handling bandwidth allocation request, retry 0
> ...
> [  337.430291] [165] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1
> 
> We had an issue with MST monitors but that resulted unplug of the DP OUT
> not link going down. That was fixed with:
> 
>    9cb15478916e ("drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read")
> 
> If you have Intel hardware still there it would be good if you could try
> and provide trace from that as well.

If that does help; we could experiment with doing something similar in 
amdgpu too.

It would mean it's not really an iTBT DP-in adapter's firmware issue in 
that case.

Acelan,

If you want to try to port 9cb15478916e over the interrupt handler in 
amdgpu that needs the change I expect to be dp_read_hpd_rx_irq_data().

