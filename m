Return-Path: <linux-usb+bounces-22507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CDDA7A2CD
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 14:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 400DE1891AB8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 12:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A2524C07E;
	Thu,  3 Apr 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="iFuFVAmz"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip8a.ess.barracuda.com (outbound-ip8a.ess.barracuda.com [209.222.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C624A050
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683139; cv=fail; b=gQ1GebE+D2bJEe3T7SU2tCD9G24yXElnH4Jv6LUsWPI7ipXCQqY3clLNroGMqH1KhZk6GNRbNFfrSVa8QpQWZ6f3uCAse0aMkOgTMVtp4rwjMaABI+150F/5LdwFcgCZ7u1he32+/k+PrvH3Ci/F8qPIu7JLSK4gEQZc9/XktRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683139; c=relaxed/simple;
	bh=PJlLQVCfhdpoBuvaZQiV/d3kLTn6zB2Amk/rjUSwlow=;
	h=Message-ID:Date:From:Subject:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c0HSg0ntNer6cv1dIzKjgjsEPydXtzXWBivScBi0dyiCfhYcRHFCjxH9Sgo/B91iFV2zWv7ZSEdkp26toy4rPQT7XXN+MB/ZsuScHv3+oAy5X0/FvfDpLt6nGr+F+7eGQzX8025j1fKVi8TaeAStFoJio+l3Vl5vBBSFWBALtyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=iFuFVAmz; arc=fail smtp.client-ip=209.222.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44]) by mx-outbound42-128.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 03 Apr 2025 12:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcoaMyjEJot84gx74mLLX6Xk1lkrW4wEdYG0oNrd6zDk4mckG0u/tHW53vFDw1wzWS/WuoPrE+8+l0cQiEjA7kTt8PvAWfiAjeHqnr/E7TfsDXXjsB2MvskQJ2+FnGOgfIH3PmaM2xI0b8NOsUs6z4xcbmgQFypq05mQlMESQcwD8nmhOD1pjROu+6zB6RpIbz3PB7IBf1kje7RHjlYJ0YGyfQoE6OtI/IvJE/aUMZvKdbvoG3WJ+0uzEIZNYP0AfnlbxVLztDqtRopx68H5gEA4D0niKzUr05xqfJqXxNOGKAfCnOd8nPXgn2m1uHEK9aU0P+A+ByExIZnEdpQafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXmdr4rnI1TXClRaK3JTN496KiMvhM3bujme4QX5Mp0=;
 b=rCye+7KD4vMkwUUWVmnYoodi7SQcqmhp5aYdR8/5fOB/AOVnBVxIA/L1PnqnhDqxXiNl25q6eysOdEMlBnXPGcwbcuzO4exHsPH+T/cDydxd+eiNfb9qc7lnoAoGfjMTNRVsqZNH6bAx1BZQrOHXJBDvebZYv29onJ4jM76aBkvpDCZQmTgO5vGu24JktBOgjGJqqDLuPDb+uGgzILEnIRYQ/QzbMe6mFVbUv/yPOtohU2Q3dZMXk23fgXi3otX8cuQZFdOuxcIS7jSn5TzjnrRDLp7PoAyZfosRDIqo/bX+vHorTzagmF4sCx5HUNBPyqFOolnqGCLO55hwhPBetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXmdr4rnI1TXClRaK3JTN496KiMvhM3bujme4QX5Mp0=;
 b=iFuFVAmzjwwvZ0iR5t73DWEkfNq+z1/22crlqLrlQcykxsn9xaE6LjIEUxMD7Hpek0pwlg3+U1xaqxnwk5S6VM2IabD1ez6YuzMEjkVKcKHxUtl2+YYLfirfbDpJmCeOFv2yjNL9uG2Kpb3SXhVV44WIkHxj7kXplR/7SRJrco+t8LD0HOZjbAfnu7hTVIhX1hM0ESb1QSXxVFYlg66ffJK9B4WHE2/E+9swlUoEUQ2ZKF1wj6GP18Xi+twKOo2qWWkMKaNfQyHuwvdw7VylkzUQ88ONbY1iM6qQZOO6CJhvv3Csn98VMlmtt5UeJ35+wGygc9daOoo0tYFXXJmyZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by PH0PR10MB7079.namprd10.prod.outlook.com (2603:10b6:510:28a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Thu, 3 Apr
 2025 12:25:23 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 12:25:22 +0000
Message-ID: <a4052845-1903-48b8-8607-5bf0ac8dfbef@digi.com>
Date: Thu, 3 Apr 2025 14:25:19 +0200
User-Agent: Mozilla Thunderbird
From: Robert Hodaszi <robert.hodaszi@digi.com>
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Oliver Neukum <oneukum@suse.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
 <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
 <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
 <e73dd429-55c1-499c-82f1-f9553ce06cda@digi.com>
 <28a5c207-6c2e-42e1-9568-2f949554026e@suse.com>
 <8de930f3-2e87-443d-9e8f-9d6f16f7a399@digi.com>
 <3296aaff-a591-4fcd-b421-9cfcc6291d2b@suse.com>
Content-Language: en-US
In-Reply-To: <3296aaff-a591-4fcd-b421-9cfcc6291d2b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::15) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|PH0PR10MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf8352e-141e-436d-553b-08dd72aa9abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHljSTBaWTZ4MlNBNHhrdDlyQ2poTzk5SG83cW4weC9RSnVoVURyNWRiSUFK?=
 =?utf-8?B?U1ZVMzMyaXRSdFdtQTQ5d3U5VHQyMnNkS0pYd1RMOGlUZXFYQmJ2dnFJQ1ZK?=
 =?utf-8?B?S1BvcmpiQ2E0OUcrcURBSmhUbnZYNVhVWlhrYUQ4SUx3bENGeldHY3VSYjBM?=
 =?utf-8?B?NnFDOXlFeDNTUVBIMTNpWk9tYk9NNUlQdXBiYmswcC9KRkkzY3UxWUVNNFA1?=
 =?utf-8?B?M29vUXN1RUdVYVJBSXBkZ3IzT0RRN29ja05hYXVlbWRDSXcxdmdneTFUVTRP?=
 =?utf-8?B?S0haUTVzU3lNRjFYQmdZNHZvaXNTWWd0MWlrN1JyUHRoQzdtdjFvRnVJd1FG?=
 =?utf-8?B?SHdYaVorZE5CZ2hLdjErVXJJR3ZOeHVCU1g0dk9RT1F0S3d0K2hSTlJScnFN?=
 =?utf-8?B?dUY0dmdCNEU4UWJPNGFNaENtUzBBaDZuTVYxY1FRKzM1aVI1Wk9wTnQ3YkRu?=
 =?utf-8?B?dTJKaC9BNHAxUnRWaHhXMDQrN3NBZHE4NkFVMWtkY3ZDMFhPVFVVbVoxQmlG?=
 =?utf-8?B?Tk9rdkEyU0hVTitLREtxcW9TbThmanF6dzBzTE1WUVh0bW5oemxyby9QKzlU?=
 =?utf-8?B?Mll1SmF5dFZHSTgrTlhBd2VoNnUyZXR2WmZucmQvcVZKVjlpSTJWOXVwTEVY?=
 =?utf-8?B?VmJnQkJTKzBVdG4zdGJVOE5FQXhGYSt2SEl1ZExVb2VuNkVsYnFvUFVhWkJq?=
 =?utf-8?B?ZVdWNVdzSDVVaWtDN1FnRzVFd015NTFtekpYUjBRZHJqZUV6RURYeDF5Z054?=
 =?utf-8?B?cDYrR0V2M1c4Y0JLZXN2cGk0WGZDbEp3a2w2Q29Tck9yREthZnJmS2xubFhz?=
 =?utf-8?B?cGF5dHZ1ZTRhV2NOWmRHMFNKeVFjcmsrNDZrdjdkZWZJS1M0eGZPU1lDL2Yx?=
 =?utf-8?B?NmM1N3FxNEpDNHI3cU02SXBzeUZSZUFEUG1hY2ZOQUdaa0YwYzhjbmRkaVRj?=
 =?utf-8?B?UzYrL0Njd3k1Y3VialU0QkVXNmExczM3T0QxT0xrUnlsaUVGdy9YVFlKZmps?=
 =?utf-8?B?TzZaS21KcEtMQ1oyUTdYdHZ1WXQ1cHk0RnBENEQwcWhBckZNeFpHQ0Jhd3o2?=
 =?utf-8?B?bjZDa0txdjlOT0xGSnhDekRpRmhPdVZMYU5rdzN3TkQ2UEo2TWxKZlF0M3Bs?=
 =?utf-8?B?RHlYMFoxdHovU0RPOW55SHZDSHNubUh1aUQ0MDlkcHd3TDQ2SDBBb2pIK2I0?=
 =?utf-8?B?cjlHdkFnUE4xM24xMGtPVG1vZEhwRE1sTSsrcm9qUllUTVQ4aU5HQVBSUlRG?=
 =?utf-8?B?cFRhUVQxcysvQWh1K2YxeFExUW0waEdPUEI4dTRYOWxWNDJkeEVWLzAyczNJ?=
 =?utf-8?B?SzF3ckhRVys3dlpxbjZZZjBKNVNwNGVoNUNPY205Uis3clVtOUd5Ukk4TE5U?=
 =?utf-8?B?VDVrdm84Zng0Z25WVTlCU3dQYjdZNU16YjZGUWNJdDNRK0xQNUExOVExTjB1?=
 =?utf-8?B?VU1jZU1HckNWUFhSNHUwNU5LTTBrZnFxK0p6WWFkS2QrSyt6dUg1aE9VRnBl?=
 =?utf-8?B?Um04Y3N3bnRldnE4RW9UTm44UlA4dUNxL011QnYyeEovSDZnaWRFUmhBTlBU?=
 =?utf-8?B?Ky9lcnJXaE1ZOXZOU2hHVXZ5NVNZQmRDakpRYWM2b0Z4R0owZGRXOGZvcUs1?=
 =?utf-8?B?aEdiWS9COFZPWE5FaFFPS1NidGVQckJ2TW03NFp5MkFUSVFORVFNMjJZSkJC?=
 =?utf-8?B?dHdzaHpNc0t6MFBkQS8vYmdETHN4LzRrRUdVc3hwU29sZzg5ZWZKY2hKNHB3?=
 =?utf-8?B?QVBtdkc3enlPZTVSZXg4TkZRakFwVnNlb0VlQXZyYjVPaEttSnZVbWhHa051?=
 =?utf-8?B?cXVLYlozL3NqcVpvR3h4dU1FNkJ6RlBZeDluZ040TGVrcTdrSWw1cDEyN2tJ?=
 =?utf-8?Q?q1RREmo9ueRBc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTFkTGhjRHdYVjN3dWVWMXhGYmdWZnMyRjhPbEdFUGNOMTVEWmtwWVIyS1hO?=
 =?utf-8?B?aGNNYWw5SHJtazBjMmxJZVFaa2xibWxIWnZwTE9wSjBab1MrQTNmQWRXeFp0?=
 =?utf-8?B?cFpsU1prbG1rNXZ4TlhVVW9tcXVVN0x4WFVaKytOclM1ajJ3WkFFR3l0M3JI?=
 =?utf-8?B?S1VXTVdxNit2UWMxa1N1aWtaL3JhRDllNjcveFJmNVNzSlNsQ2c1ak5JdkN2?=
 =?utf-8?B?VzhBNE55SFNOZmxIaGZBV05UeVF1TUpIUmxkSnI2eitTU2d0aGRqa3FRMkg5?=
 =?utf-8?B?SkFPTGtpR1pOQXZYOUxwOFFZV201a2lPU0hjdVlENVBZUkxxZ2puaENmOWtG?=
 =?utf-8?B?cXo5LzFQWU9MTEpBNnkwcDJGWUQzckV3bWRqamdaRy9xTm5kWWpUWE1sRG1H?=
 =?utf-8?B?SkU2QndkcmViVTB5RGRwcUtYUFdIeGg2NUxUY01mMTVaM0dZK2x3MnUyZm1m?=
 =?utf-8?B?WEFqdlF5YXc1eTZkcFdWRHVkbnZOdUI2RWpkVkd2WENHVEI5cVBWR3Z2YURH?=
 =?utf-8?B?UHIyM3FwQnFtd0x6RlB4Q0dFK0ZXSFFyd1pYdEJkU2xSQTJ2ZzZrK0ZNUXJT?=
 =?utf-8?B?R0dWYThTckIvbGQ5TzdQYlJOQTR5R2lzUU1waS9aN1N4eGluSVlTK3lXdzVC?=
 =?utf-8?B?NDRYcHNqK096eHNBQjVTNjc0blZhdEJrM09NTGdqVnRQY1V6S3JveGtmWE10?=
 =?utf-8?B?YjFtMGRmYXphRVI4RFUzK0FiaThmRUZpeG1zcmVvMTF5eGtpVmUrZUNIZE1E?=
 =?utf-8?B?TjlIVnZHUXBaY09Lb0Qvb0g5N2pEYXVZb3N6dnRnTDdEb2lxNDNzbXYvSEZ3?=
 =?utf-8?B?VXZHOXdwTSsycExqN2xVOEc0ZUxvZThRUnh5QXJyWHBvclpsTEdDbXlHbW9K?=
 =?utf-8?B?TThDRk9Sc3lqbEQxRjBPOHAyaXliTDZaRnhWRzRMY29LN21HSVIycTdwWEFu?=
 =?utf-8?B?SjY1UFZ5NXhRWFFUUTlNVHlOZ3U3K2t2aStVRXRTYWZBVXgxR0taUkR2VExo?=
 =?utf-8?B?eFNVdFppamh3RFVpRXIrSXZJTXBqVFdCVzZrZ3E4STd3M1QwSHhzVGcvd1dx?=
 =?utf-8?B?cEE4RElXaExITnhjc2tIWGVzVVNpQ1BXVGtFMzhIM21PSWhVa0NRZjFoK0dO?=
 =?utf-8?B?bTBBbkZNT01COEs2M3dFSTQzd2VPQkUvRDdqQ0FHcDZsSDJmRy93YklxU2dw?=
 =?utf-8?B?Tk8zZThiTVIvVExHcWxwVFdXdHZWdHdFM0hUWjQ1ZDM1UTNvT3VrNHZBRHNP?=
 =?utf-8?B?T1FlMGFYY0R4UTA2R29aRmRlVmludmZib0hCamgwa051Z3ZiWUp5SDMyR3c4?=
 =?utf-8?B?Q2V4Yms2Tk5ZeXFlVG5JcHBPQWd4SUE1MmduaHpUZVdkQzhXZmJ3SUFVYjNE?=
 =?utf-8?B?aGVQSTdLUGQ0aWJVa0h6aHRVcGdtQUNwY2VqN0JpcWEzWUtzS0pZN3pFU0Qr?=
 =?utf-8?B?R0kvbW1WZFJYNnpNSmgza1hlam91OXYycXM4UmV5WlBCMS9ROHN0a0JFa3ZV?=
 =?utf-8?B?T1NWczR4WXA4UUxPTWJMNTFlY2kzSnUxbGkvKzZoK0FERStiT3ZtWTBqcmpC?=
 =?utf-8?B?b212dENWekM4UmZDSi9uTjBhY2hvTzUyM0dFL2hZVGZteG1RTGQxWnpzOEpL?=
 =?utf-8?B?dU9YUmlMZi9FQjljRVZNYllzbkFMaFJhRGZZRXZzbms2Q05MSzh6ZnZ3TURF?=
 =?utf-8?B?STVGdWxOYTJlUTdOUFhtSHB4bUtmQmFscGRTdFhzb2FNZCt2ZStHbmY2OEdC?=
 =?utf-8?B?TEcrU09xM2lFTVgrWXJZSE9DTjM4R3FnWlZ0MUt3SnBVdzZRRHNxTHFHL256?=
 =?utf-8?B?bndLRitWdlZVNDF0am94Yk1oTysrLzJNZXpPWXFhUmZLcktGeWxkWDcxSkZC?=
 =?utf-8?B?akpSL1J6RDJSNWt1SjEycFVaM3dSZ3BvVjB3WjdjVWkrZlJQTldBZU42ckQy?=
 =?utf-8?B?dEZUZVI5c0RnZUVMc3NQakZhY09qekFFZ0Z0bUQ2dW5IemY0QkF2bjBOV1NB?=
 =?utf-8?B?QVlhd1MwUFBob0JoTDZBOTVaaGhFZGowN1NKUStISFdGYW5udlNYTVZNY1pR?=
 =?utf-8?B?Z3phaXZiaVZ3TnJSaWY3MFM3a00yM0ZJMTVSbEJISWhRYldVMzNwTkR5VGkv?=
 =?utf-8?Q?WVA+mR3unjpWg/n6uyoVsjgMx?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf8352e-141e-436d-553b-08dd72aa9abe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 12:25:22.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVwVJAvUPgxCFyISKXpKcOlKmAtigRXq/FEc1B9fvDYx3SEqlz0H6aHgNK8jk/5T1XBTU6Fl1K9Yv3olkoKn4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7079
X-BESS-ID: 1743683127-110880-7634-1087-1
X-BESS-VER: 2019.1_20250402.1544
X-BESS-Apparent-Source-IP: 104.47.58.44
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVqaWRmZAVgZQMNXEzNTYItXc0C
	QpxTTRItEyDcS0tDRMNE6yNDJMVqqNBQCYHm5eQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263621 [from 
	cloudscan18-65.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

> Then we have a problem. If we are servicing a read() syscall,
> we have to either return data, or, if we cannot do that
> we either sleep or return -EAGAIN depending on O_NONBLOCK.
>
> There is nothing we can do about that. This makes me think
> that the issue here is poll() rather than in wdm_read()
(Resending the mail, because Thunderbird changed format to HTML...)

Yes, exactly, that's what I'm saying. :) It's not a problem with 
wdm_read(). The problem is that wdm_poll() confuses users with returning 
available data, although there's nothing there to read, and wdm_read() 
returns with EAGAIN (correctly). That's why we don't want to set 
WDM_READ when the buffer is empty, and there's no error neither (so we 
just received a ZLP).

Returning with EAGAIN in wdm_read() is totally OK, except if cdc-wdm 
told the caller through poll that there's available data.

>
>> So what about modifying the service_interrupt_work to no simply set 
>> WDM_READ if resp_count is 0, but instead to check if there's any real 
>> message in the buffer, to not confuse consumers. Something like this:
>
> That specific proposal will not work because the issue
> is in service_interrupt_work() which can already be scheduled.
> We cannot prevent that.
>
>>     diff --git a/drivers/usb/class/cdc-wdm.c 
>> b/drivers/usb/class/cdc-wdm.c
>>     index 37873acd18f4..9037379f3603 100644
>>     --- a/drivers/usb/class/cdc-wdm.c
>>     +++ b/drivers/usb/class/cdc-wdm.c
>>     @@ -1010,7 +1010,7 @@ static void service_interrupt_work(struct
>>     work_struct *work)
>>
>>              spin_lock_irq(&desc->iuspin);
>>              service_outstanding_interrupt(desc);
>>     -       if (!desc->resp_count) {
>>     +       if (!desc->resp_count && (desc->length || desc->rerr)) {
>>                      set_bit(WDM_READ, &desc->flags);
>>                      wake_up(&desc->wait);
>
> And what happens if wdm_read() wakes up because a signal is delivered?
>
OK, I might not see the obvious, but I don't understand this now. Let me 
copy here the complete patch, not just the chunks of it. That might make 
more sense. This can be completely wrong though.

    diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
    index 86ee39db013f..9164e311a3e8 100644
    --- a/drivers/usb/class/cdc-wdm.c
    +++ b/drivers/usb/class/cdc-wdm.c
    @@ -92,7 +92,6 @@ struct wdm_device {
          u16            wMaxCommand;
          u16            wMaxPacketSize;
          __le16            inum;
    -    int            reslength;
          int            length;
          int            read;
          int            count;
    @@ -214,6 +213,11 @@ static void wdm_in_callback(struct urb *urb)
          if (desc->rerr == 0 && status != -EPIPE)
              desc->rerr = status;

    +    if (length == 0) {
    +        dev_dbg(&desc->intf->dev, "received ZLP\n");
    +        goto skip_error;
    +    }
    +
          if (length + desc->length > desc->wMaxCommand) {
              /* The buffer would overflow */
              set_bit(WDM_OVERFLOW, &desc->flags);
    @@ -222,15 +226,14 @@ static void wdm_in_callback(struct urb *urb)
              if (!test_bit(WDM_OVERFLOW, &desc->flags)) {
                  memmove(desc->ubuf + desc->length, desc->inbuf, length);
                  desc->length += length;
    -            desc->reslength = length;
              }
          }
      skip_error:

    -    if (desc->rerr) {
    +    if (desc->rerr || length == 0) {
              /*
    -         * Since there was an error, userspace may decide to not read
    -         * any data after poll'ing.
    +         * If there was a ZLP or an error, userspace may decide to not
    +         * read any data after poll'ing.
               * We should respond to further attempts from the device
    to send
               * data, so that we can get unstuck.
               */
    @@ -585,15 +588,6 @@ static ssize_t wdm_read
                  goto retry;
              }

    -        if (!desc->reslength) { /* zero length read */
    -            dev_dbg(&desc->intf->dev, "zero length - clearing
    WDM_READ\n");
    -            clear_bit(WDM_READ, &desc->flags);
    -            rv = service_outstanding_interrupt(desc);
    -            spin_unlock_irq(&desc->iuspin);
    -            if (rv < 0)
    -                goto err;
    -            goto retry;
    -        }
              cntr = desc->length;
              spin_unlock_irq(&desc->iuspin);
          }
    @@ -1005,7 +999,7 @@ static void service_interrupt_work(struct
    work_struct *work)

          spin_lock_irq(&desc->iuspin);
          service_outstanding_interrupt(desc);
    -    if (!desc->resp_count) {
    +    if (!desc->resp_count && (desc->length || desc->rerr)) {
              set_bit(WDM_READ, &desc->flags);
              wake_up(&desc->wait);
          }


So with this:

    1. not setting WDM_READ on ZLP
    2. on ZLP, we just submitting another URB to receive the remaining
    responses, if resp_count != 0, so keeping the receiving alive
    3. in service_interrupt_work(), just setting the WDM_READ if we
    finished response receiving, and there's data in the buffer for the
    user to read out, or we received and error
    4. reslength is no longer needed, as that checked for ZLP-s, but we
    are handling them wdm_in_callback()


Best regards,
Robert



