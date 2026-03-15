Return-Path: <linux-usb+bounces-34817-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 23HcEPeCtmm4CgEAu9opvQ
	(envelope-from <linux-usb+bounces-34817-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:59:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E442905E4
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCD983018081
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 09:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA0D2750ED;
	Sun, 15 Mar 2026 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="mACW7xxQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023111.outbound.protection.outlook.com [40.107.162.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9D0273D76;
	Sun, 15 Mar 2026 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773568752; cv=fail; b=SRaL1+iMUB5oy1ZSAXZ/WoyB3kazqbYXdNaf8G/8Q3sSarAr8WgaO30pJGe+Dnu+wYPLtYXKY5chqj4z7lMFfcbq2ui0lhUqfPlFnfAfLU26rGLxEXkscTqfITA9bBRUKJ/LezNfZxOn/25zQG18YTWjbHTpcKF0aWg3sg39V88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773568752; c=relaxed/simple;
	bh=EW53OsYdYeXGN7XvhMqxqNFVLEfb9d/s1ukrbES6iYg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ptbA08rhyVGaD7a0v0Om8JnNzBKPnV1FMGvHPnTXdZiRAolBNDMqG43oD2u+VMzGCfrwHo56L9b2a6puP2CZI3g/37IbToYIatAYQ/uzDZ6c++ruIOJliGtmRTvvMEVfQZwjV8fnjYwizbfgzy7a16dDciG/G7FrkWViTmHMzBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=mACW7xxQ; arc=fail smtp.client-ip=40.107.162.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nmgr+DT/Utj/GHHe0dJ6IsyB8w+KkDSYsHXdBpyXMyBRVzG4pgquc5hFyq00lNLvoMl7JQpQUp24jBfaj+nhOX0ks6wd6rcMPeXB/BZO5114+BaI1fQROGZBhI6TMoJ2tBbzUtNXtwmdKlRNa34FqrsWBrata4mQEuv/cH4jAZGj1R5AFhUEZjvDLz0TTIDtDIAIQUDr861mUjO0d3/d5CcJdDdepcJeiax7Jyz1bxxnonv9dfyZsv1WRXuCyCL8cq49YKimgIKVx8SFoKiHFKsqV7xKGeraztMWqA4V0Iw/OCCdpaPdyFO5z/7PHao3GNLevuxG+y22p0jzvnX95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+Xs5c8o9rR2pJHGJ5GQnCrLvpin4+3FkPo9tXmvJDk=;
 b=FkDoSD9wkkDqA8yISoZE04si1n8tlt84NDLYkQsF3o03C5NvphTwIQOBryHbmLNpMNxyb/Kf8ugbwqFSN9vmESxK7G2/UKJnV6C0urA1NRuYo4NaSaAtMiASI+YyOapnGEfm/FkL/ewu9TETW4Ow54DIRXCFEgJQ/ar9PYs52vxIR+5xtW0yklOyl9hOXjoxBqiXqYJavDoj7gbHQFvQBnGi6JPzFpXnYoSXoCrSAnl2arIK5Vb3XOVgBmg9kpItTlcMGCsT1BjRIF1tdFQ/7OyU1/3ch+WWQ9uyuQlNE3Hb+W37tEoZsYiy0KnUQhfgpxKxAknnoWDhWUp9jFGVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+Xs5c8o9rR2pJHGJ5GQnCrLvpin4+3FkPo9tXmvJDk=;
 b=mACW7xxQv3JOneKXXC7tdlwQ8nP0xk9l1FY0hCNj6mieTFkljmXmckgww8V9bN09Os+4JKBNuMtmSkrz2qhCZUB+E1Lpw7G6y9hUEyzUqlSY23jrYEIWL7eZov9IfEHZcueaIolpChGftHAM1TLMIAx51I3HGf4wjg4m4xB0WRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com (2603:10a6:102:8c::15)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sun, 15 Mar
 2026 09:58:44 +0000
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8]) by PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8%5]) with mapi id 15.20.9700.017; Sun, 15 Mar 2026
 09:58:42 +0000
Message-ID: <7785fe26-ecdc-4392-a04d-551c75276abf@sch.bme.hu>
Date: Sun, 15 Mar 2026 10:59:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: core: Use `krealloc()` in `usb_cache_string()`
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>
 <2026031209-shawl-unshackle-f4eb@gregkh>
 <d3da22c8-bef2-49cf-b4fe-0936ef8e42db@sch.bme.hu>
 <2026031500-speak-lying-2626@gregkh>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <2026031500-speak-lying-2626@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To PR3PR04MB7260.eurprd04.prod.outlook.com
 (2603:10a6:102:8c::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7260:EE_|VI0PR04MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f5fda4-3676-456e-805e-08de827970a6
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|41320700013|10070799003|786006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yzpvM3XD/1rZH9mGeTTXI7UQ3T2LBBStcpKLngycY7Xh/aZOmHN32xe5Dtxy/2QGD6c5Unte3V3S3XJJKtJnSfl6TR9pMMPZKNLedqSJsm6POP2iswY7m1Pbtx3pY0fCN3GG2wgfkMpjiNTMumFS+liHzYUuoFCw7lzgMOLRMwjPeICsTL/MMbfIcTAetnw+rT6MX17EJGyyWH+VEI6q9mX3qme1H+UwY3sMPz38xQL2d55E3fl9GCEKG+VvwYfRHEQR4YmkQZA+Nob3JJL0MIdE8C1kdC2ssTj0yQIDCaYFd1jnkZnCcM3FYjGyX8XNbyq05vn6xLs0tPV/lU2gmhzjsw71VLfKCF80jnEocwiZHogAlRq503288jvjGzMpqZkTBM1l62a4JSQb28XIomTLXLVHXN/dJ8hXlUVsf6wPj4rzMh0j9TxstwQhjcFcGi5gHUSLxGNddMWOjxU9n3QjVQt9SSQFFt00XlLztzJpaMqWXAEkD0SI5AkFvHrC+HkZIIUZk4xdiCauKPjMqB2Fj3trUlb7nWQnBv6Y/hSqwHo2VxI9JndPxTPelSbcFEmzxWKkAuXW+AUzxlwb3X/foCFhy8ASB1s2PqHT/eRfJcE3onsXWix7ex6gL9g68O4cfeNBOXD2Piuqk3vOGo1DtLmJA3JLb+cPNiSIrSDNqSWeFCZJ8Y8u6JKBTKg+J8mNs7nCbPZlkX1vX3+EhcByYlAfdezeLxwdoLfUfds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7260.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(41320700013)(10070799003)(786006)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHVtZGJpYS83QjJkeklmVGJXN2twOUlkMUphMFRHaUQ2U1REVmZ5MGVBNi9w?=
 =?utf-8?B?OHpoQ3BSSHVCVWNlUlVhemtndVFxQ2tMMnY4T1d5RXZ1ZEp4YkFmQ1dSbjNp?=
 =?utf-8?B?OFpGTGcwb0FkOE9DYWxwbSsyQ0dLYUsweExRWHVDSHRUWmhGdi9mZnp5dUFm?=
 =?utf-8?B?Z0pseHRhdDk5WGQ1UjlhNVlFT0c4SFFsYTdHN0xncStUa29DM2Z4ckNRaDl0?=
 =?utf-8?B?cGdQdm9ETFVEZnBra0NraVpPclJVZEdFM0lQYXVIZFBQYXVNK3p0T2cyNk1O?=
 =?utf-8?B?WkkzRzZqTkM0WmkrM0h2bmpVVFFTeE03QWhJbFpnREx0UkVhdlJiV3k4NjBu?=
 =?utf-8?B?ZTYzL3ZkZzlmRFFveis0NkJXZGVtcGRza1hJZHJCTjVqbDd3UzAwOW81cSsy?=
 =?utf-8?B?K3N1clNYT25HTUNqdHd0eG12OTJnOGV3Tlp1b0gzYVJpT3c0MjY5bWpEVXhw?=
 =?utf-8?B?QXhlZzNmZVFyd0tyOU1SaUd4THZKaDlNMUgrRVk4ZkkvVUY0Q0ZmUXJTZVNh?=
 =?utf-8?B?THNVNk5yOXFtMzZTd0hOWS9oU3dpWnMrWHFHOHRhV1lNYzRPMVZTMjZyS2tv?=
 =?utf-8?B?SjhPNXlab1JQNzZXdW4yaDRhVmsyKzFaalV0bnNHY2hBZEtYU0kvRHNXa3Ar?=
 =?utf-8?B?a0k3NE1tYTF3R3FxVzc4a1VFSWZaNzdZMWFFQ1ZBcHJQL2ZVZlZ5eHF6WjFx?=
 =?utf-8?B?RCtSSGllZE9qWGF5SFpETzd0SVFrQUZxb2pLQS9rU3pjZGRFWGYzTUxEeDhY?=
 =?utf-8?B?c2R4bklMUzl5UnJCeHc0bVBzNEJ2OTg3MDBwWGlhcTJONEhNN09FcW9iNkpX?=
 =?utf-8?B?UFlXM1dDV3JjNjhRNVdDVDlGZXNzd1RGYlQva0plejRQK0tBbWwzWUN6cHBv?=
 =?utf-8?B?MDNka1BkdDB2d1BVa1RrRVNKN2FMWXBrVGY0SFIrdEMwNUltbzRQSVJOdTdJ?=
 =?utf-8?B?bm5NSzVKRWtFTHJOVDJQcFlkZUVuYW1JZzdNV3p0S2dyVTF1T1FmMTVhczA2?=
 =?utf-8?B?ODg5SVdkTDBVbUlOdEtLZ0ZYaGZieXlVZmhPMTBySHZ6L2orbDc2Y3QxSldG?=
 =?utf-8?B?ckk3M1RkNC92aGRrYjFrbnF5eHFVSnIwNVI4V0V1MGFybDNJMm0xdXFJRnA3?=
 =?utf-8?B?SjNhb2NHQTZldWtrVXVaelpEQnk5M2pWRGpCSFFkSWthaHRpdTdrN0ZrVjd4?=
 =?utf-8?B?MXpyeUhBWGNVZi93d1E5UDloS2pvTDh3QVpKZE96QVBlV2Z1cVREVmw0L2pB?=
 =?utf-8?B?RUliMVVCdFJsVEpHV0hJTGlhUDBSZDVldDV3QXdBZERhTFdYRTQ0SDdHRVBJ?=
 =?utf-8?B?OTVLdCthbW16Y2VTZjFGYSs5Zmg0RzhOSlJteG5JQ01manJSRGUvU29PNHNh?=
 =?utf-8?B?bGpmT2xkZG56V0JFcEpIWW1sMkt6UUtEUERlc2dkMnI5eEZzSmVaaTY4VTN5?=
 =?utf-8?B?Mk9sQ2ZXSUEvaUxMMkVMMVlsdU5Ta2VMRjBKTmhJbWxKQlpxVFluOXdhRU81?=
 =?utf-8?B?Y0owMW9BRW5UQWJjVVVXdzM3eVJVZ2VmMEhtUlNzLy85NmdDTlU0MS9wRlBY?=
 =?utf-8?B?MG5YYjliNGFiejJDcUljVWx3d25zNzhnRzVxMjlxMnVQVE1CenlaYlIrT2Nz?=
 =?utf-8?B?Z2Y5UTlCSjRubmpQTE1pU2JuMXVTbE1lMTUyYWhxQWx4OUQya01xSmdGYUZN?=
 =?utf-8?B?UGFtdnQ0dFFSSDNvY0tBaTY1ZWhoUUVSTmhmZmRYS204QzdxM0ZvUjByRDdw?=
 =?utf-8?B?aTVsRHFzejY1UVhiRlR2cm5FVE9Ca1ZPby85d2tCdG5HQ25sbUYyRGtDdUV6?=
 =?utf-8?B?WHRlYTBML3RKREYxekYxN0l1OTlzZVZVeUVTS3NoZy9VNmxLdXJyeFJ2emht?=
 =?utf-8?B?bk1qT0ovSVo5clZzNnozTE1FaVdRT2w3WG1IQmhLeExHRFBFNXp3cEc5ZnpZ?=
 =?utf-8?B?cGI0ckhrNTlVSFVmeFpLS1BxdVM0S2hBUnBIczdWcHFIMHJSckgxekM5SHBG?=
 =?utf-8?B?aGFXKzNSZ1h0UzdsRlRFcXZPYmNXNE92N3lJc1prM1NJRENVV21wQk9MTHZ1?=
 =?utf-8?B?cUQyaVhxREYwRHIwSHZHazRvM3dSSThqQmVxejR6WEVnNEQ1UlhnTUhPeVVo?=
 =?utf-8?B?V2tRVTNWZWY4blhaL2x6SklDeDRuOWJDR1VOVE5NWkh5YWhCc2dIczNsd1I4?=
 =?utf-8?B?aVlCV0lxeU40dXByRW43b1NydXE5S3R5eGdZckt2VUVyeVd2UTMxRzJXUG44?=
 =?utf-8?B?dkZCTjNHMFdrd29GV3IvcklQR3AzampVOENGVDlSSWlDc05Nd3ZVanMyY1Vi?=
 =?utf-8?B?ZHhZdldGL0tUdUhVZnBwM0hXRXlFejRjRUswbGQ5UFJVQ1dXR1NtdThxQ05z?=
 =?utf-8?Q?VJRK83miE1GFfFkZizEbVXbn/t5pUr2KhwdQVWDxyJ1Yb?=
X-MS-Exchange-AntiSpam-MessageData-1: S3PxC+ZYoR/7YQ==
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f5fda4-3676-456e-805e-08de827970a6
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7260.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 09:58:42.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUnLMddmT4Lz5Za2d/JyDkwRzwCMmqWIfLAgFCkYqWiSceP54Hk3Pa9q4U/buBY1JDMypaFD6Y50FEpAPwoIkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639
X-Spamd-Result: default: False [0.75 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[bme.hu,none];
	R_DKIM_ALLOW(-0.20)[sch.bme.hu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[sch.bme.hu:+];
	TAGGED_FROM(0.00)[bounces-34817-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bence98@sch.bme.hu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sch.bme.hu:dkim,sch.bme.hu:mid]
X-Rspamd-Queue-Id: 88E442905E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/15/26 10:47, Greg Kroah-Hartman wrote:
> On Sun, Mar 15, 2026 at 10:40:48AM +0100, Bence Csókás wrote:
>>> Also, how was this tested?
>>
>> I just compiled and booted it on my Arch box (with the original vendor
>> config), an AthlonII X2 PC. I'm now typing this mail on a USB keyboard and
>> mouse under Plasma, running this kernel :) I also plugged in a pendrive,
>> mounted it, `ls`'d the mount, unmounted, unplugged, and did this 2 more
>> times.
>>
>> I realize I should probably put this info under the dashes. I'll prepare a
>> v2.
> 
> Try looking at the USB strings in the device, as that's the path here
> that is exercised.  Just using the device doesn't actually grab them
> from the descriptor table.

Sure.

   $ sudo lsusb -vvv | grep iProduct
   can't get debug descriptor: Resource temporarily unavailable
     iProduct                2 OHCI PCI host controller
     iProduct                2 HP USB Smart Card Keyboard
   can't get device qualifier: Resource temporarily unavailable
   can't get debug descriptor: Resource temporarily unavailable
     iProduct                2 USB OPTICAL MOUSE
   can't get debug descriptor: Resource temporarily unavailable
   can't get device qualifier: Resource temporarily unavailable
   can't get debug descriptor: Resource temporarily unavailable
     iProduct                2 EHCI Host Controller
     iProduct                2 EHCI Host Controller
   can't get device qualifier: Resource temporarily unavailable
   can't get debug descriptor: Resource temporarily unavailable
   can't get debug descriptor: Resource temporarily unavailable
     iProduct                2 Disk 2.0
     iProduct                2 EHCI Host Controller
   can't get device qualifier: Resource temporarily unavailable
   can't get debug descriptor: Resource temporarily unavailable
   can't get debug descriptor: Resource temporarily unavailable
     iProduct                2 OHCI PCI host controller
     iProduct                2 OHCI PCI host controller
   can't get debug descriptor: Resource temporarily unavailable
   can't get debug descriptor: Resource temporarily unavailable
     iProduct                2 OHCI PCI host controller

Are these -EAGAINs cause for concern?

> And sorry for the extra review, I'm a bit picky about this function, it
> was my first contribution to Linux way back in 1999 or so, and happen to
> know too much about USB descriptor strings :)

A good review is a thorough review.

> thanks,
> 
> greg k-h
> 

Bence

