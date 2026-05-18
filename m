Return-Path: <linux-usb+bounces-37622-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI8gBf84C2qWEwUAu9opvQ
	(envelope-from <linux-usb+bounces-37622-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:06:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F5570956
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 631B730F2EF0
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 15:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5974A3793C1;
	Mon, 18 May 2026 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5RywnuCD"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB8836D50D;
	Mon, 18 May 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119836; cv=fail; b=aSUL54AdQf6tn5gW0uTcZGohTLv7RuY8pGoB72N1bIQKbW2ih9UW+GWVjCq1/C4SAfJ7ElC1oyWwk1yqaOP++C+i6mMcs1/Gu6Yscft76lo4zHslzlRwbRADTA+IP+nRxWe5J5t6S7ICUiosCGwaulRHcWUUUmFIAgY8mK9SMxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119836; c=relaxed/simple;
	bh=O3goJ4kusqIPpCF9Kv+Yh5CUnSVW1/xfHTy1mktsZhc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A2RHVkDdxK7+OBok6Dt63UdS+OLYunAqG0QXb6Ecd3qhV+a+CMOgINWu/R2W3CNHjSZYZczsfWOmpoQvXOxE8EGKjsZLGmq/bu6JtXp4IxiqTPGvJRZzdBu8QXbCzm72oORDuSmGu9fro44GKF9Pby9GYsrNTAjY7Gc97alUrh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5RywnuCD; arc=fail smtp.client-ip=52.101.53.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eww9QCTr5/pJl+bk+43QDW7T1J8J1BQ06YXlQUuuKjdyGPOQS91xE3rZiQl+ACZ3tRluqG54L7L5+K3SPQ9HMLO4Z36AvfabSoSvs/OamHezGkkmyUkhKHxdXp0cmSOPpVU1Pmf+1CEBM8OKdeixWHfp95VVfjyPoYvF9prhNv8GU8qxLZIyTt0d7lyxI96RE4j2RMwAHLZ1N8gl1nipWuyR80Cc8Cg3ZMvx+rYdgV3P0zvvWYkOHYFx4pXoqsICvNTLjSye7PVB/IJAeSBY/vrEwkfD7aenF6L21hZS8jnLLK3ZDRBbUeIGdEJxhu02TOU7T+ndUMAkPuwaxbGDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE5s9xS46Rch+EqrTt2Ok8R9ApQz1oFrfpNP3Gb4ra8=;
 b=M+mtCmbuVwsSQQbpl+m3bQk7dxiKmPaAL4wpJH50JwFWtiStzIG6MixZbwic5H99fgaVXoIjNBUPwksgv06gBde1wWWCjMI70pF4rn2PMu4MdbiH4PlC+hHf+t8YslaumoCSInBI8ghYcLGtAlfa6yMbTbBkui5YC7RuTIyNpWYiVbI0AuYIXZ936QIHbShXa4RYYOekQR+kYBeLLX7+oc4THEhpa8pN5Ewi3QKou9ujrIZoz83+lgRVkVT7XWrQ4ICsvS1nBgoGTWkmaVSPQSihcS0NI+pPPsEw7z7Jew0qUGIzEyLdGj3OtWJ+zPols/fxgOZmfzp6Hlb/MoEWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE5s9xS46Rch+EqrTt2Ok8R9ApQz1oFrfpNP3Gb4ra8=;
 b=5RywnuCDzkRW0khFod5nBZYQrIUPLnrBe/hv9tu5r/MZawBi3h22eC7S6N3XwnATFg2pPLoVP1ELHOdT0nGhrn4jqdhLnoi8Zex9YXq+GiDVKTFCeGv57+uA809ZLag12Zx8GY17xeBIihVSsEPNAuSCnZHE3I1VPCFPsUfXnbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Mon, 18 May
 2026 15:56:49 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 15:56:49 +0000
Message-ID: <371759f2-4a84-43c3-adc6-1daaa452c516@amd.com>
Date: Mon, 18 May 2026 21:26:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: typec: tipd: demote missing IRQ log to info for
 polling mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
 <20260513182850.165349-3-radhey.shyam.pandey@amd.com> <agrpVghBsrkcVKT3@kuha>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <agrpVghBsrkcVKT3@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::19) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 242f1423-d9e4-4238-bb3d-08deb4f61237
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	R05aBe43dS8kJhBloS+S3R9Drb/7heeaAE5Iss5lx0BaomoErAi/L9paa47ReAy9DcLo6upCJV6bpkrqWtmfavIUCBrsNMv0/dUYzS5N0IjyJ5XU59Gmvh9dArnTu546z9tCJcnlbd4Vx6cEcMK3W0BEAvOOr6//XPSYjYOCHnAPbykkkdwu+3220uxfYwcpz7vWkQmiw8HTx4nC6GuWl35e2KvcYw/JhEnpDBoXoJuzFzf/Gjieb6GXC9lygxVcakC2Ub5u9k26Rrdsb2XobjS7XnPH036iDnoSGsDmzH3aVOHvO5OEQn0Bfn5pbpAD/whJrYZ3K5cPkTQYtobWIaShOLhFbKrzOAP4HDNYIwgxAn/Ib01dT2E4J2HnNq4NNdZFsLckp0qkhFdjHgwAKqvPZp44EFtYiJwf5JaX3mFxmI93hlcTqCpH1mJMWFMQcRK8QALt4QkH2XxtrXtJTYRGaUfyvXUXIwkR4rB4KfuE460nJK3RywG1ip6gzTA1Nj7FSfV1C49SBeezt4++IXU+utzQWq0HkjqXbcxNttmvVtd1jTU24/GiTk1MDM+6jgO+VhyEV4vEuwQXL+UlKLF7d4ZoixfiqwMJTO4/6FWdHNRuQWrblt6nRY2B+l+cGAXxWTPBYCO66OGy8xfplVaeY5wWTyJ9r8z8EARxyO18urMkUn6itIErGeVh2TC4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmR3R1djT1J1QlUzSXRaYUtBclBxUjhPUkRLR1oyT1Y2aXd4ZDlkMGdYTkYz?=
 =?utf-8?B?aXpEeUVOY1NDbmtKZmp1eWpEVEtvTUlybEErNEptM3QwdVBuVFU1M3NwVldP?=
 =?utf-8?B?azRZV0dhQ1ZEV3M5dWpSL1hibHhCZnVlMm9tYnpNYitDSmwzZDYwRHU2Ylo2?=
 =?utf-8?B?WC9ERmF2WkdYVmRUQ2NPUjNHWVlxZDhpckNEdE5Ma2FuVjlJeThiMytEblNm?=
 =?utf-8?B?WHIvbHpRTFdUT0JLa2pkcDZrR1E5cVpONXNyeXRXKzZZVHlURjBWSWVBSzZw?=
 =?utf-8?B?ems2MndMbkJ2bVRYUjNzbFJKa3hoWXRXUnNhem8zS1A2bklWc0EvbVkxT2Iy?=
 =?utf-8?B?SktabEhVQS8rSHhidlZ5c0VGQWtIN0FqYnlwSkJyOFhCcmd2NTdaSGpHeTNz?=
 =?utf-8?B?T0pyN1pvYzZoUjFubktuNmpRalV5dEd5dTIvU2Jwb3lyUmxJdUFOOGlHS2JI?=
 =?utf-8?B?OFYwdFpnZ2hQT2drS0RQOGFsUm5JWDN3MzNrbC9IUXlnRkxBQ29oQmYwSXl5?=
 =?utf-8?B?d09BLyt6bWNJSng1ZmovazFhalFwTTBvbmRyYjhROG1kemx5cWc3eTk3MTRZ?=
 =?utf-8?B?aU5Wei9FOEp1U0UwcHJQb3FQTUExUGpDNWplTFBzNlZPQ2RFdkZMMUUycTIw?=
 =?utf-8?B?dmo2aHJqUGhNK0plWkJHVDFxTFN2QXhWYW8xcFdmS1A5NjFrcDBSVjJIUWNX?=
 =?utf-8?B?c21ad1k5clF1OXJWTTdvNGZJNHd3Q3laYVE5aTcvdExlWFVjbU8wc25uc3VC?=
 =?utf-8?B?N2ZkQWdBVStkbHUybWRIeThOU2dYa2RHZUVVSzR5cWdsUFZFSVJ0TW83emZa?=
 =?utf-8?B?WGo2c2R6U1piRU5XdFpkSldBNXU4dUI2RnY5L2h4OUZ6T3JjSGJ1eldvYnUx?=
 =?utf-8?B?cElsbWFYOTZpVmhNSkYwalp1bVhMMTI3OFM4bmVQdmJJT0dpc2Frbk5kWm90?=
 =?utf-8?B?ZnFacU5IRThDT1NOYUNnWi9WSFU5b05sOElsVlpXUEl5R1FUbGNOaFJRNEI3?=
 =?utf-8?B?SEM2S0ZDY09IVE9RTVpsdnFzemdlcUxKR0FwTncyVGZSY0pmS2RwNlVaTEhI?=
 =?utf-8?B?c2ZCQ0NNdU0rWTdBbXJrNlhYcXErYktNRXM2VVorREVrRHZuYkpFSkk2REh4?=
 =?utf-8?B?TVdTdGk4aW5QUlJaaWpYTlRVRVVrY0gyYUg3RlU4cEs1aUpENm42YnE3WHZM?=
 =?utf-8?B?YldMZ2FHRW1uRzhKREcrKzlGWURPZTRnRWdyN1BtNk5Zck9HTmJldkVUTTM2?=
 =?utf-8?B?ckk2SzEvNHNNVWV6TGM4L1V6WklhM3VYaitOZnNhQ0d6ZFN6S0ltRURNeXV4?=
 =?utf-8?B?UnpOekIwbXd4bHF4YUNHL3FtSTR2bzRQTnpicG1XaHk4YTZqYWVhQnhKZnZO?=
 =?utf-8?B?MFlyZkVUUkd4anYxLzlPejFvckF5OS8yRjZxbHZBaUhUUjB0N0hxWTBoODgz?=
 =?utf-8?B?UE9OR0FlVzc4KzJSZm82U1NCTmRpWHM4WTZxTlpuWitaMStVYkV0M2JYcjZG?=
 =?utf-8?B?a21UWmxycXRlL0FoMHpET3ZPaXQzd1FwR2xoVWhWK2crV3ZrWVI2VHR3WWh6?=
 =?utf-8?B?WjNxcU5oRk9YdGdnVDZPWnRYeHAvcTlwLzY0ZGFxWVZpY0RSWlJnaWFURmFQ?=
 =?utf-8?B?NzZoQ0srUWp4TFkyNHB1QkQraEFmcStSTWFYdHdscm9NeU9KakovSmM1VFFn?=
 =?utf-8?B?VUFzU0E2eWV4V0lETG5JdTVuOTBDR1UwbzNXcnhZSWM0disvaVlROW90eUFP?=
 =?utf-8?B?Wlcvbml5bVk3MzVmMUw0VTg1NkFaeXo4SlVFakpKY2lVa1hCNUM3V2d5SGh4?=
 =?utf-8?B?bGhyU2g1c0k2dG5DY3Q3a0l3d1ZCc05OdVQyM3JQcmtQK2dWR2R5SkNHSGgz?=
 =?utf-8?B?dGVRSU01SmNMU3dwcDVYcFkwMnZybnp5bGszU2ZuYmdpV1hyMVZMbkJlQzJL?=
 =?utf-8?B?QU5oanFqekV0MTJOb0IwbHZ0dVJTQmkrMTF3SStMeURQVk9hUEY1OFptbStI?=
 =?utf-8?B?VnZMWlBGcW1MelFmM1JQeGw1NE5ncmRiYkNQL2ZLZS9WTUh0T0FmK0J3VjJl?=
 =?utf-8?B?ZlJVYnNWNzRoQkhHcG1PcDVQSFJQV0F4T2hhSkVjdlFnQW9hSUhhODJJKzJk?=
 =?utf-8?B?UlpEcjBqeTdBU21Gd1doalY2N1hWVGNjeENUK2pOblRibDdJd0VueE5Hc0h3?=
 =?utf-8?B?MWlLYTBvWk9YVzU1U0x1c1owZnpndS9FeCtNOWNrYXBISXo5cVoyL1g2eUI5?=
 =?utf-8?B?QSsrYXZXdXlsL0RoTDlmT1lrMUxxeGhyYkMxaEJvNGU0aWhEdVQ1L3NTZGhu?=
 =?utf-8?B?ZS9LMHhYVFAvMS9NUTR1WHhvaFl4ei96MldsMUltSTBwZWZMTjZNdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242f1423-d9e4-4238-bb3d-08deb4f61237
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 15:56:49.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wzUSy0S9T4pbL87CIm3mrzrOemqK6V3CwPGeWXkEYw/M/GHz7OiuogKVMu1G0vE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[bounces-37622-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-usb@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 6A2F5570956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/2026 3:56 PM, Heikki Krogerus wrote:
> On Wed, May 13, 2026 at 11:58:49PM +0530, Radhey Shyam Pandey wrote:
>> Operating without an interrupt line and using the driver's polling path
>> is valid. Log at info level instead of warning.
>>
>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> ---
>>   drivers/usb/typec/tipd/core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
>> index b282366b5326..fcd56bcffab8 100644
>> --- a/drivers/usb/typec/tipd/core.c
>> +++ b/drivers/usb/typec/tipd/core.c
>> @@ -1853,7 +1853,7 @@ static int tps6598x_probe(struct i2c_client *client)
>>   						IRQF_SHARED | IRQF_ONESHOT,
>>   						dev_name(&client->dev), tps);
>>   	} else {
>> -		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling\n");
>> +		dev_info(tps->dev, "no IRQ specified, using polling mode\n");
> 
> If this is a valid case, then the driver should not make any noise.
> Let's use deb_dbg() instead.

Sure , will make it dev_dbg in v2.
> 
>>   		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
>>   		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
>>   				   msecs_to_jiffies(POLL_INTERVAL));
> 
> thanks,
> 


