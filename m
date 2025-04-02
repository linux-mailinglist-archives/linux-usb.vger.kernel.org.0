Return-Path: <linux-usb+bounces-22480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E033A791C6
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 17:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09EE6172A87
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 15:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B11923BD05;
	Wed,  2 Apr 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="BTs1y7wc"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BFE23C8A2
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606096; cv=fail; b=OW11vAMGZ+HomVwz8JXKbeJ8VrvKMNga8hTeLeD9LIfKkg2VmX1QwUYf2oKBMT5kCV7khuljHLs3vBmLXy3z6OZ4Kt6jyWBgl49PHIg9xH/OQetvN3e22VjsatbZhRbugah1OIY2bBWWRavskkq6QRZiN4LdOhzhHVOE/5ZPwGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606096; c=relaxed/simple;
	bh=Xa6/CYQXyJC3OpNxP2JSWx7po20bM11KTOM44zJ+gp8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KSMEijLV1tHcUHaGn7YUTtgQSUDMKkq8bqJ+ShEXymsxKqY5RAADHv++Kx3TlH4plk9u5sk741LXOfEAviJM+jk4zBKsHst8cWSkt5TddiAvxz9t39AFlLbU9ykwnT47wg/6Bz99a6kTQ7R8ReIn2rHGug07PWuxnxOMmI2O0sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=BTs1y7wc; arc=fail smtp.client-ip=209.222.82.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171]) by mx-outbound19-105.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 02 Apr 2025 15:01:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzZNLvQ1pY+hOPPNWdOSujydi45/M5Yj9QHwJOUyGzS82uY4+aH5RD0LENb/3P0crNt9Td4grguy+k4EF8gHje/miIzzGlfic9wmnJMgAzX5WhkpeWPaqG6wJBByy23mKacjfnMeZFZyiWPJZccaiyZ2cJ/ASwU75HHYav+o0RMm1fknfM2nrbIRKFLFMW0jR53Y5mACkRvsMKhBq5988mYSxzo/Ma5BctiKElhgiVBgag3+krhf1RUJ9VZzKio3AtPp7e2fgYp4xf9/eF7YVfQRoS28p8JKTH1euBrRcC4JCDfDALU2uGVbWSu7z7MCEIU+WD2A6N7QdIvMWLuLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gw2UpvcvKFa7+NZmg5vkBzSzKAmWOpcEMzpmLl430g=;
 b=AmQXKJcfsxkI7Wq6c4NEuNkf1jHt4utHKGvTkOT69iM+AVfO82Zyyo3OKSoIoqKD2MJ3izystXt9b1hnkvMztf8tK1PoN3KC0k5Mh/83WXjPEaG4zABjhefD0ahd7gkRgCwoIo/wlX3EnwDqDpOycB8SJMo9N8WC8/nzIGhV1b9LdNVr0pB7IUButUVhKNSsD27nTNaHLgV6/0dJMj8/BLLeFEUe3Zs3o8blFAbg8fplSKRE5KO9xUxNvhkciEnfJHQS1P19wrH1sIqG4r4feHq2l7Rc8sINpyJc1ZGgbX8zaY4OzpmLYHiSuBGc4gyNER7XBFu7Cx3gHDGqeeU1kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gw2UpvcvKFa7+NZmg5vkBzSzKAmWOpcEMzpmLl430g=;
 b=BTs1y7wcpQEU0o4XaRqyRVPs5wDQ9j+Gb+YDReRrQLqRIrcXm6FA6XI18XGVRN3YeIdJgp7MR70V5iP7O7Mrq+uwAMmzuFH0haqYUWtdzXCXC+y5ciV1vAK24wJmH6AvOgy9mqqgFDTjVxhWF/CXYMfFgjLsKG3pSVMQ0nTxOGuvQEa5xot4CqO4JLgVvXerS/TXGPi/0K1YYp3e1T7hvTvCK53y9uK9ngLObbOqsGqic6vO+rYrHUIGysOPtfB7NXkistfBVy8rrwHygzJ741NfStPfnB37DQCjYVGKyBxXM+97QAG0tj7VXUL2omoXOrOKKxV3Oeu1arjTsZHPqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Wed, 2 Apr
 2025 15:01:16 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 15:01:16 +0000
Message-ID: <8de930f3-2e87-443d-9e8f-9d6f16f7a399@digi.com>
Date: Wed, 2 Apr 2025 17:01:12 +0200
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: Robert Hodaszi <robert.hodaszi@digi.com>
In-Reply-To: <28a5c207-6c2e-42e1-9568-2f949554026e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::11) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a5a7d4-1e10-4874-7c34-08dd71f73771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2VvTzBJeUZRZW1SM29YeS9GL2tUaE5RS2xESXE0QTRBUFpPY1FyOW9rM2w0?=
 =?utf-8?B?VkRCdFF4dm90b2tyS3U2YW40RzVOWjZ3LzhnaUIvL0huU05LdzhEOXY2eHhF?=
 =?utf-8?B?bDBtS2d1REVZNVR1eDVGMFdxazkwOWpsbWo1WVM0clV0WTJPR3ZxQmdYdjRV?=
 =?utf-8?B?dDhKNEc2K21Tem56SFhwcGtHWnM5SENrdkF2Ui9WMWRDZU9PZUxKZndISFhz?=
 =?utf-8?B?aWErZm8wR0VjbFpuaUZXZmZFK0gvMXNsNisyTXgxclBydStYV2F6ZnlsaG1O?=
 =?utf-8?B?U2xDL3NpeWpPRERhNHZlNFFrNFNPR2IxM3FOMUxiU1RHbElrTVdBMSt4azhX?=
 =?utf-8?B?T09jb3V3Ymhzd080VjR6RHY0SWJuQ2xhUmlxRWhxNG5wbWVMS3ptTGFIcVBN?=
 =?utf-8?B?TllPYUZEUkJVZVpqc3hxSklFYm5LS1VNQ0VIaUFJNElKTHVRdE1DWXNrcjFu?=
 =?utf-8?B?cXBMV0taQ2xobUVZM0lYMTFZZitUOCswYThETHdyMFlUU1kxd3BsNWswV2k3?=
 =?utf-8?B?bzJNV3lscTZ4cDZmNU9qNlRRNFlNNWJMS2FQbDNRSmFjS09MYXo4VVRpTDVJ?=
 =?utf-8?B?S05pbDlFcmJhKzJKRVk5VlBaRjZ0c1Vibkk2VzI2WXl1aUovRXd5V0RmZHEr?=
 =?utf-8?B?TUgzMVpNZUlzNG95VFBXRWZiMjl3d2J6RzBKaWxwckdXL25rZXlHbStGelNk?=
 =?utf-8?B?c0hWMXlRTjNFUTIxV2RTVWZRK2Y2VXhkaEJ2MXpqQzhJVlBsNTZxbmFPcmg4?=
 =?utf-8?B?cStTQ1pvdFZXKyt4VmZZSTNrSVErN1AyN3N2OWl4bXRzdERSQVpCdSt2RzMy?=
 =?utf-8?B?MEhYKzNsbVZRMG55Ty9qdWhCbnNpSjZUZUVFR21La1l0M09WMCtHU2ZBbWRi?=
 =?utf-8?B?TnNVVldjRXZaSUsrU0oxeXliUHU4dkk4TGlQOVZsSFg0TXM3bXRVTEVDbkxx?=
 =?utf-8?B?UjRVRU5BalMzeU5xNWJQMHBUVkFWdTJOdFJkTkttdHNBdmFBaG9DUzVVYUpl?=
 =?utf-8?B?OHh3MXpFdmEyYjlEem9rZW9KaEh2MHVGY1JjR3VTdTJJaG8wNjZwaUhNbURk?=
 =?utf-8?B?V0k2bnkxT2I3WG1rMmlZQTI1aWxHZWN5enRiK2N4ZVRNeGRFQUNISnpIRW1D?=
 =?utf-8?B?RDFLdEp5emRPdFZGc0UrTkE1aWx4dlV4Y0RaQzR3RW9VQWRzVUVoNmhIeE9X?=
 =?utf-8?B?bXpRWTNtUnlKd2ZDSjc5U1ZKWjFPSXMyQWJ3UDlGRU9hYlQ0U0o1b0lhUVJM?=
 =?utf-8?B?ZHpmSUpKeUduWkRleFNyRnNWZU51Y3A4TCtmbWRRSkJ3QldJQ21WVzFmS0dn?=
 =?utf-8?B?dytTazhLRW5ncFpOTTV5alBVQXJRZG9vMkNENjVON2s0NjRVTHlWZ3Fld0lz?=
 =?utf-8?B?WkdrdE1FUFVoWVAxMjVaTnFVNjJpa2x1WkxTQ29tTWtsL3FEZVZPZFJCZjFU?=
 =?utf-8?B?ZUFBRENySFVza0pvNzU4ckwrdFdTYURkV2pqZ1FCYmlXcCtOczZDUmpmdzQ1?=
 =?utf-8?B?ajNxTHBjYjJiQSs5V2NMcDRpbGtIei9oelVyT2ZQTnVrdktwV3VKeUxXSUZS?=
 =?utf-8?B?a0ZaZnJ2ZllEaE1kRzVza0pjZzRMZ1JScTM1Y3hsZXJWd2k5b3JtMlJoRmVy?=
 =?utf-8?B?c2xpZ3pSbFJWWU4zTWRwVlJpblFPQktBNnhYZ3ZybS9QOFBqOHVKNnYweENY?=
 =?utf-8?B?NGZ3Q3k2VW5BQjZtRmQ1U3ZuR1p0TXNsNGJJeHhMUDBteTJGTitrSXdhUlJN?=
 =?utf-8?B?Ly9JREF4NWg3MzZ3dHowa0NzMkgxaWhNV0p1YTdHQ29CbjJQZ1hpSFIvR0Jh?=
 =?utf-8?B?a0k3RGtvdVFiYTc1MFV1REFudkRoa3N3Z3Z3Y3A2bWZHMFdLUG80K3pHT2JC?=
 =?utf-8?Q?nUXyOGXQjysgt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckVVbUptWlJQZlBEOUNjSlNGeWpKVndXTEdmc1B3NjNIaHBqSzVGSG5YWFRD?=
 =?utf-8?B?bnh3ZktkanpUemtORlZMV0lHWGRXMk9tS0RYbU1WM2tZTnZwMGpxckVDTk9j?=
 =?utf-8?B?Y2RSbXp1bTNEUStzbmpNV2c0MVNvUGtCOGZNQnNoTGpheE5QQUZXZTlYdys4?=
 =?utf-8?B?OGZZaXhrdEVHQ2FwdDY2M2xyZ05sNGVsNGppRUFFZ2NMVi9KSnJQVjJNWTlL?=
 =?utf-8?B?K1VFbGxDWXgwcE5jQ1JpSDhpU09SRkk5WlZzcEJ2dXd5T1FLb3Q2STVSUHY0?=
 =?utf-8?B?OTJ5UnZhdXpGdE95UGhIV2VFUmo3dldycVJEMUZDYTdIL2J2clZqdFdXRU41?=
 =?utf-8?B?dmFBZlJISVJzM1hRRHQxTWNSbWFGWFNXdElrMHRwMkJHSmVVMmFUdGp6QTN0?=
 =?utf-8?B?elpxZXBPMmRZa1RycWxhVFBPY2ZRRXlyNzBENjZkdHVXaEVyaTRsY2FZR2d3?=
 =?utf-8?B?RURqZWZhUjlsWHJndjFHZzB5VkdBSmppRW56aFExc0d5em5wK0dydk5IOWR6?=
 =?utf-8?B?dXF1OUQ5UEJLUzZIcThPNW5EVWFBeW8xUW1YS0daVnBIWXpkZmdFdnowN0o1?=
 =?utf-8?B?NWhHM25FNFdqY2NySWcydFVHdzBkNnZ4bGJUMkVITFE1QU5XWWlDWHZvV2Jw?=
 =?utf-8?B?SEJQSVNwQjA1MFBuUkFWR0FiL25MWFNTWFQrb09Kc3IvbS9HL1FLdEJjcndZ?=
 =?utf-8?B?QzU1S2hZNkdqUmdjR2h3MlRmODVkaU1TSm9tcXNmOUtSTitBWTJ3UDB0YS8x?=
 =?utf-8?B?UHhrQWRqNFdiZ2cwcm9RY1pzb0I0ZzQ5U3BiOExLdS9OVnRnUjFEM0NtNVZr?=
 =?utf-8?B?dFFRZzdiYm16TUdyQzZWTll3TUpPdEZYSkVhVGttN2NFTU8rM09hcSsxdlRB?=
 =?utf-8?B?VEZmV1IxTEVOaThNTVV4Y1c2bmRsVVVuV3BBTWpQY2M0UXJGekg2bGVzaHNQ?=
 =?utf-8?B?WFZBNjhkZUJ4S0NRTGI4LzNCSlBNNlppNitWczBZOWcxMHI4b3dxMXQzbVhO?=
 =?utf-8?B?KzU0dXFDQVU3bDVHZkF3VTFXeXoxNlpTbWpqOG5wQTBZcCtlRmUrUEhGTEd2?=
 =?utf-8?B?L0VTaTdxeC9UU3orQ0FoRHAwSnVIRFFjeEgrMG9mYnpGUnR6bjluVlpLT0NT?=
 =?utf-8?B?VStIdUx4TTViYzdOaXJGMU9BbktxbDdnK3FPeStRcmgxRmZQWU5kd09SVVJV?=
 =?utf-8?B?RUhVZWk2MlFtY01nc0hXeW9tTE84MU53cmpTdXlrSzVVS2pZNVJXYys4MW5S?=
 =?utf-8?B?UVBiQ2M4WWIwQ3h1VmlqbHFTWW0xK0xwcG5zeVBaU2xLYXdnT21zT0NhaEt6?=
 =?utf-8?B?V3NlUUw1VDdOREdmemE1T283Ry9vZmswSkhtNy9CZDV5aDVJYWYxcmxCZ09P?=
 =?utf-8?B?d2RxdjFacWEzMWRQbFdNMU1mTlVUR25qUXFEa1B6YzIwMFY0aG0wRnhOVms0?=
 =?utf-8?B?ME1IYmRiRndyUXlURG1SWHcvbUV4OXFqTmVLTjJWOE5oTWJrdmIzaGd2RU5C?=
 =?utf-8?B?Y1Z3T1d3WkRhSy9Gc1cwOXB6Y1Y2ajJTdk1abXpXS1hhSU5uT0ZiaGQ3SDFj?=
 =?utf-8?B?QXBSUnBkM1FQc1lkNzNFYWRURHh4bFJxSCtVTU1LUkhWLzhZajIyT3Q3cDB2?=
 =?utf-8?B?U1E4WlJnWWw3M2pnWUdMdmtmYlRlc1JMNVNKSEtiZk5UMHFhQkdFeVlGZkVn?=
 =?utf-8?B?cFBuOWdxd1hWR05jUktWMTR4aUl2NmZLWnhmd0dXdXV0UFBHSDFhSmlIVXBI?=
 =?utf-8?B?V0o2R3FaWWEvSWpLZlJhS1IwUG9idWlZb0ozR2IzMTRiNVVZcWNPVzgwbzBR?=
 =?utf-8?B?VklYeFZDTSs4VWdVTWdsaXZxS3JLTUNNRWYySHk3NHJ4ZjRoTzlBUXUrMjli?=
 =?utf-8?B?NnU4akhTMTNmKzJPb1VXRTNWVDYwOE5FRnpxbC9NdkhTNm1sRGwvVzhGNGlR?=
 =?utf-8?B?VWtnb3E5TzgzVmZha0xGdVZMUWJzWGg5c3NnU1F0M2QvcTlydHFySUtkdEhr?=
 =?utf-8?B?ZDBhN1VRUllZczdGQ0lwck1VQ2c2SmNhRHAyUG92dGFDY0l4Qkt6TG9FV1Ew?=
 =?utf-8?B?MjJ0V3hEbnNoMFg0NTV3ZUNKRGlJQjVrWjU3b3M1aFBBbzFHRmpITTM1U2xY?=
 =?utf-8?Q?Adc3D1gBXi+wox3ek0R3ss2k+?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a5a7d4-1e10-4874-7c34-08dd71f73771
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 15:01:15.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNcDEQJLxJA5AKrSwbfSu8VVNDQ8Bhhz/ChLr57IY3egdqippPX6UtJgC5mz4R8//ghDdWoclOlBy+g414LpLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-BESS-ID: 1743606077-104969-8482-9807-1
X-BESS-VER: 2019.1_20250401.1649
X-BESS-Apparent-Source-IP: 104.47.59.171
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoaWBkZAVgZQ0DTV0tLc0tgiKS
	XZPNUszSQpKQlIppqlppmZmJikmSjVxgIAizVU7UEAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263600 [from 
	cloudscan20-73.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

>
> Hi,
>
> I see what you mean, but I am afraid this introduces an error case.
>
> Suppose we have the following scenario with your patch applied:
>
> wdm_in_callback() gets a ZLP -> we schedule service_interrupt_work()
> service_interrupt_work() calls service_outstanding_interrupt()
> service_outstanding_interrupt() decrements resp_count to zero
> service_interrupt_work() sets WDM_READ and wakes the waiting task
>
> wdm_read() is woken up and finds an empty buffer
> If reslength == 0 all is well and it returns -EAGAIN to user space
> If reslength != 0 it will return EOF
>
> We must not return EOF.
> Hence the longer I think about it it seems to me that
>
> 1. reslength is necessary
> 2. You must set reslength to 0 whenever you get a ZLP
>
>        Regards
>                Oliver
>
That's a good point! So that's the case, when we receive only a single 
ZLP, and nothing else.

But we cannot return with -EAGAIN. If we do that, we're back to sqrt(1), 
and get stuck again.

So what about modifying the service_interrupt_work to no simply set 
WDM_READ if resp_count is 0, but instead to check if there's any real 
message in the buffer, to not confuse consumers. Something like this:

    diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
    index 37873acd18f4..9037379f3603 100644
    --- a/drivers/usb/class/cdc-wdm.c
    +++ b/drivers/usb/class/cdc-wdm.c
    @@ -1010,7 +1010,7 @@ static void service_interrupt_work(struct
    work_struct *work)

             spin_lock_irq(&desc->iuspin);
             service_outstanding_interrupt(desc);
    -       if (!desc->resp_count) {
    +       if (!desc->resp_count && (desc->length || desc->rerr)) {
                     set_bit(WDM_READ, &desc->flags);
                     wake_up(&desc->wait);
             }


Best regards,
Robert


