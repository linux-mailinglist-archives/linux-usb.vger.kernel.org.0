Return-Path: <linux-usb+bounces-34818-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN9BLl6LtmnDDAEAu9opvQ
	(envelope-from <linux-usb+bounces-34818-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 11:35:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECEC2906A5
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 11:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F3A1302D084
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEDA3368AE;
	Sun, 15 Mar 2026 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="l++mT7IT"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021079.outbound.protection.outlook.com [52.101.70.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1531B4224;
	Sun, 15 Mar 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773570902; cv=fail; b=H6kLQWTVhtTluEBQkR5P9iqKuMQ328m6WgUDX6Fodbpgq7hdqHCyGcs67dUK4wFppHjoqiIkNZ3jYnAP7CwZChY05l+cbbV7wglCl4abjUC9Hxcb3xoliaXuZKJF5lSjEjHKLwHRELPwUku7aGT5OgpDFz448Oo2LYeUqRV7qnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773570902; c=relaxed/simple;
	bh=iRWWAgicJax1ggyElswlWEoixVHTn0cXqZwuGCw1Xbs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jp/XWv+FHfwlZsddONYMirh/vkw+3ZbyNN/jcq5sZ8oWfEbwDAXikeZj0KkLIQca/e+tSstY+a7Pz3cp3cbq6Nyfe6YtMUh26Zn8NM+ZlvmzeyICgp/FPOLr8wcGr8VAMcoC7gtSN6efWN7aPAIFinrESMBkEy1wL/10EUHTLOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=l++mT7IT; arc=fail smtp.client-ip=52.101.70.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kp7bbYCazeR+hwGasdl9g3htrI9xrLJk7qDkz0vL9dZyyY5CJePHE5rf6BwP03biziDuL/o6q1bajsCrzUyNLsS90BSuk6qwhjkEs8QuoRk4VGvc2XGk2SWk41U+v8T4GbKQH89PlFQr/QVRNLWSjgL4NwV3faSYd5/TPv+UVTFEVz2LUcHI6VtBM0qZeQBwRlw0nM8kvU+i7ikble5TSYjRlb1vkscB8SVcmNRL0tNrbCJTJwmQ6jqENFHcaD211QbRW/M2cPzY79X9zR0jmd9bQoSpkjPqJSyEYjyCGyX3bT0lGKjm+rcWLJLtQ8rguQBKBSMmHylZd/ZAr2wTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u7tSIBJyV0I7Bxc+TjYq01gLJbfN3lowV0KVGn6DRI=;
 b=wkmnvNkhvOmU9UxgE/8WjePGt88q3wnzsSzQ18iQgNROKcQ1MOJ3rUvdn2YcRWH83iCCMyQRqaa1uwDZs+XF28PDmNV61I90r/9dlD+s9oyqAGNYTJAmslmeXFevgPs9clvyN+0PRJdWoJUZY3gmDQ/Uf8fNqUTTNOeb9VmPs+/ffEHiBG4LWvQtQdW3YZGdz8Z0mYPwU0mnpHtXP+M9ovnCaNBzMvk7bIuke2d3G9DCF+I3gRXO0gfsiZhxrp/N0D+WNDGgSov8do3q5E/qh0J8H6hKA91ClnGFviUHX+UOH7vbYXk4+a4QjOOwVYwo04srYgteGZVxUTB21wPvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u7tSIBJyV0I7Bxc+TjYq01gLJbfN3lowV0KVGn6DRI=;
 b=l++mT7IT/JIENjQ3BC3TxjQqzOA7UBgdEYedAKzHbBpEaYuLMvP1p+vo1eMMtXgfRzysGZK6BAJ5kWNpzeI0LSYgfxmOznI/rUObVCw58vM4zE6GzT0+TgaL+4v0O/mv1YnyjgMF6z7hv1025KPNOCuQ8/2Ew4vOxBMqbYRpYs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com (2603:10a6:102:8c::15)
 by GV1PR04MB10823.eurprd04.prod.outlook.com (2603:10a6:150:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Sun, 15 Mar
 2026 10:34:34 +0000
Received: from PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8]) by PR3PR04MB7260.eurprd04.prod.outlook.com
 ([fe80::bc60:c1f6:2fb5:8cf8%5]) with mapi id 15.20.9700.017; Sun, 15 Mar 2026
 10:34:32 +0000
Message-ID: <45afec49-3fe7-43c7-b92b-e6c3e4aca3d3@sch.bme.hu>
Date: Sun, 15 Mar 2026 11:34:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: core: Use `krealloc()` in `usb_cache_string()`
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>
 <2026031209-shawl-unshackle-f4eb@gregkh>
 <d3da22c8-bef2-49cf-b4fe-0936ef8e42db@sch.bme.hu>
 <2026031500-speak-lying-2626@gregkh>
 <7785fe26-ecdc-4392-a04d-551c75276abf@sch.bme.hu>
Content-Language: en-US
In-Reply-To: <7785fe26-ecdc-4392-a04d-551c75276abf@sch.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0143.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::10) To PR3PR04MB7260.eurprd04.prod.outlook.com
 (2603:10a6:102:8c::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR04MB7260:EE_|GV1PR04MB10823:EE_
X-MS-Office365-Filtering-Correlation-Id: 679b0ca1-243f-4880-66f4-08de827e721b
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|41320700013|366016|19092799006|786006|1800799024|10070799003|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MTzwax05BoHldoTTHo5vVof+SssluhlkkSMbUvUbucDlw4o45FL1lc9cM9IukbEw4bTKGOkpufZWMx+PNL+E5l7PCuYGgYUBabusjEnth6q3xIGGZKKH56aI7DSngwuyXnN3EZhk9DZpA5povNQXXD9XD7eDhxBCffrzMAjdIA8p5s4DM2SveoiAmrY8KlKfo7lx97jyj5+uD4CfZ42/oj+LBWSk3WEtvFVeIA/42wiC2MaRPhVspC7/pyiPmdFaP+hv18/L8JBMEsd+HEgqKSAC09FJO5ofWr+daTNHCFvJNE6drdD5+669FxCVzekp5TbNBL8TRglT4acuu747RmuW+ne2ri6aPuZ5fM1+v4YCWXpr/5DzFblCAwcmvO26vvstsFq6vuYAJfrOV37vbMVH3avIh00CQ6S1a2t/Qisw8HA+TM60NaGRjXKEX11gyXbXSx8smHwjUpZTdtPpCyfVpOxn+hV72ukNkFEDPR0NhbGu/BuYxP3rGWchfz2+kdaTBov0L4aUeXM+baoGSxTyVByfb/WSiZgfB2Uq4sFnEAHKVRjVYbn3vqNaRHurZJ/UjMqKuFd5nDC5geu4iZnPB+c2euqK9I9FjLSO/5Wma/BfNakmQ2lxRsEwm9VTXzv2VvEEBHWWX5rBspXMV4Eh7mVvCNM9E++UiAly1JMx3+BDeoOHp+4trBvI3xt7aADUq8gFG1BdoKgYv0HD7yjwQAiBzrLUQPRbJmNuLjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7260.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(19092799006)(786006)(1800799024)(10070799003)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHJ5bkd3NmREaEUxeTRvZXhMU1BoTXZFQWFzR2RodENSOEQwWHg5ZlF4WU9O?=
 =?utf-8?B?VGFRVUU1ZzZqWUsvamNqbGhXM3dZYS92TnBZTElDSDdjMnRYSWxFLzJSdFZO?=
 =?utf-8?B?UEdGYlVKTnpUNmp1REhTNTZWVkFhRFdHU1hnSWU2QnlLQVBSWWM3SFo4WmdZ?=
 =?utf-8?B?aGZ5SUxkbU9QK1dZNjRuS0hYa3p0L1VmWGFKbW4xa09SUTg3Rmd6YmVTWVk2?=
 =?utf-8?B?R3djdisyWERNbXg3LzdIU1FBUGdPcVorcEtMWTBsYUtKRWVYSksvK3hmYTdV?=
 =?utf-8?B?RGhpZW1TOXF5eHhUK0ZGT2dTdmVzMHNyQ0JERCtBRUVRdDBrYkZRbnU1MS9E?=
 =?utf-8?B?QXNYbnNsYkdySUJ0WTUxWWpuWUJMRUJlcGpCdUtFZjhmMUM2OGtkcy9ZT2tk?=
 =?utf-8?B?MkIyVzZnZWVISE9PRi9ZK0ZYL1kwaHFabFZlQlJPQ2pIajJNMlo5MVE5emox?=
 =?utf-8?B?VGt4RFdJYldtMk0zSjUzalRPbjVkVjQrK2trRmFDZkhBYndBbEx0OTk1Wmdo?=
 =?utf-8?B?ampodllMMFQzcEFtdFlvTE9uM0hMTGlzZzhCSUxrQmx3SzBSbUd2NGxEL0g4?=
 =?utf-8?B?Y1B3RDl1VTZNeHh0aTRnaDVLSEp3SnlEbk80d29YRkxPTVZwS1RDMUMrZDlk?=
 =?utf-8?B?TCtZZkZ0MDdvLzVSUjg4a0hDN25qb3UrY0dJdVRTUldTOEhpZW5zcWdSQ0hv?=
 =?utf-8?B?QzJPcG9EbGJZcUJPWkt1TkF4SDhFSGJ1eldqUE43YWtYMGJTUEVlaGZQa3Bh?=
 =?utf-8?B?MTNBQ0NKc0IzOUwrbVdHWXhwZGRFcHZsSTZvaEVlVTRuQ0ZwZ2dIL0JwUG5J?=
 =?utf-8?B?c0FQajJHTWEvYTEyajhFWkZMTFJUSmRvUFRHZW9yMmhkenRuSWNlN01pdXhJ?=
 =?utf-8?B?R21sQzVYNS84a1YrYVBWODlmMms2bFIwWVE1OENSajYyZ1hWVE5Xc3h3YjFv?=
 =?utf-8?B?QytnWnlrTUxRSUtWYmxRNXlTRElOODRmQ3NiK0ZnRjJHd21WT3owQmMwWEVV?=
 =?utf-8?B?bFNRMFYva3d2V08xS09uTU9tTGV2MzBHdGMvc3JhYjJwdTV1UnBlSk5DaFhN?=
 =?utf-8?B?QkpHUStEdzZzSTZjeEJVdW9UQTNadE5MMjUzM2dTUzVLSWN0UVE0ZWI4VTJw?=
 =?utf-8?B?R1F3Tkc2K05IWXRVdUZiNVBJU2xhYVl2T2NPNHI5YmVEYXB3RHErYkhwMEFG?=
 =?utf-8?B?WVNRWXlhU0dpSGRlUzRXZ1o5aC8zSENKc0VTZEhJS3lueUIreXJIcDZvVHJS?=
 =?utf-8?B?cHkyVGFGakNYSkxpakQ4akFPUXZtTklWakhLSVhTdm8wOUk4MUxzai9STDUw?=
 =?utf-8?B?MWtqbEVuMVVBaHpZaUZqbkM3MlJWWndPQzU0MEpOenMza0F3R2V0eGw0YTRN?=
 =?utf-8?B?UEJvWDg1UjVRNWhtRTVFSzdPZFRaRXhwSkpqQkptcytEVlhCQkFoTDlRdksx?=
 =?utf-8?B?MXhQbGNFc3lzMjdjQ09NK3dpSlQxUURPQ1Q3ODFOUG1iZlJzb0ppL2xyU2lW?=
 =?utf-8?B?djdzSytyeUJXeTArZTlTcjdzVit4K1Y3Q3Z4R2ZMVXYySkQ3QndYWUxHZ0xt?=
 =?utf-8?B?SC9Wb3JGbWkrRmtCVWVGeHZadFkxeXNvL25VZGdQbE9pekZGc0ZuNDAyeXpq?=
 =?utf-8?B?VDQxNDg4L0FFL01Sek5WU1c5RG1EM2tCZmt0SUs0S0NTTXNPMGdsRWs0V3Nt?=
 =?utf-8?B?ckg2bnkrRzhCTzBPS011aUl2RGJldHlYbGgxcVpuL2d3TmhDQ1d1ZE9KdHJk?=
 =?utf-8?B?ZGQrcGh5Z1J4OXdnZldkaU1QaHU0azlYcjIwejg5c2RaVDZRUlFIQVBQMlZD?=
 =?utf-8?B?TXh3SWNkR1YvaGhFUGsyQi9scFJnS1lVUXFyWU81NFp5YVB4Z0g1RGJndmF6?=
 =?utf-8?B?ZUMwMXpzb0FuTW9Bak9TSFI3T3EzcEhSekpLdXhFbnZZYjBRK25ocEtMVjQ4?=
 =?utf-8?B?aktLc0ZuL2E3eWJkeUhEa1czRzFDenp4QVAwQUdsbGpreURieHc5WFpzZTE5?=
 =?utf-8?B?WGp5MVV6YTErakExRk0vUUxVaFlya2IxNG5FYWlXckpyeXJUbUVGNFRweWpK?=
 =?utf-8?B?QmtHd3ZnN3JaYVhjVHl1V002UUpGandSWTRvM1A1eDFiSjJXK1NkT2RPQVlJ?=
 =?utf-8?B?cEdXM2IvNFZWZUdvWGxuMTR4QmNvZVpnWDJQeE9BM1VSeWlGOXNIT0Y4VTJJ?=
 =?utf-8?B?cEVoczJSV29VWEhrMVBpZkFlQWFLeTB1V2phc0UvVkxWbWM1bDdHRENPRHFR?=
 =?utf-8?B?MUR1Wm5JY1hMTFlQblMzOENsbFlpZWZYWWZFNVFERGxwd1JRb0JIaFFxWU91?=
 =?utf-8?B?ek9XeWY4eGhQbE44bnliYUxCZGkrNS9EZVRObHQzREhWVjJDVnkrLzhrZUl0?=
 =?utf-8?Q?P/ayRGz1ewpP1lbMUA1XCq/v4cPSklW6eMWtCmVPTvd87?=
X-MS-Exchange-AntiSpam-MessageData-1: 6LWBHqrR7RnenQ==
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 679b0ca1-243f-4880-66f4-08de827e721b
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7260.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 10:34:32.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeTp66IMNNkLyAhBNVG0m0mgJUsZY360dsm8/aWnAuLIwPbldrrqfMBPmLN6+UkZWMHyoxL3HfPTQak7hUoEOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10823
X-Spamd-Result: default: False [0.75 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[bme.hu,none];
	R_DKIM_ALLOW(-0.20)[sch.bme.hu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[sch.bme.hu:+];
	TAGGED_FROM(0.00)[bounces-34818-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bence98@sch.bme.hu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4ECEC2906A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/15/26 10:59, Bence Csókás wrote:
> Hi,
> 
> On 3/15/26 10:47, Greg Kroah-Hartman wrote:
>> On Sun, Mar 15, 2026 at 10:40:48AM +0100, Bence Csókás wrote:
>>>> Also, how was this tested?
>>>
>>> I just compiled and booted it on my Arch box (with the original vendor
>>> config), an AthlonII X2 PC. I'm now typing this mail on a USB 
>>> keyboard and
>>> mouse under Plasma, running this kernel :) I also plugged in a pendrive,
>>> mounted it, `ls`'d the mount, unmounted, unplugged, and did this 2 more
>>> times.
>>>
>>> I realize I should probably put this info under the dashes. I'll 
>>> prepare a
>>> v2.
>>
>> Try looking at the USB strings in the device, as that's the path here
>> that is exercised.  Just using the device doesn't actually grab them
>> from the descriptor table.
> 
> Sure.
> 
>    $ sudo lsusb -vvv | grep iProduct
>    can't get debug descriptor: Resource temporarily unavailable
>      iProduct                2 OHCI PCI host controller
>      iProduct                2 HP USB Smart Card Keyboard
>    can't get device qualifier: Resource temporarily unavailable
>    can't get debug descriptor: Resource temporarily unavailable
>      iProduct                2 USB OPTICAL MOUSE
>    can't get debug descriptor: Resource temporarily unavailable
>    can't get device qualifier: Resource temporarily unavailable
>    can't get debug descriptor: Resource temporarily unavailable
>      iProduct                2 EHCI Host Controller
>      iProduct                2 EHCI Host Controller
>    can't get device qualifier: Resource temporarily unavailable
>    can't get debug descriptor: Resource temporarily unavailable
>    can't get debug descriptor: Resource temporarily unavailable
>      iProduct                2 Disk 2.0
>      iProduct                2 EHCI Host Controller
>    can't get device qualifier: Resource temporarily unavailable
>    can't get debug descriptor: Resource temporarily unavailable
>    can't get debug descriptor: Resource temporarily unavailable
>      iProduct                2 OHCI PCI host controller
>      iProduct                2 OHCI PCI host controller
>    can't get debug descriptor: Resource temporarily unavailable
>    can't get debug descriptor: Resource temporarily unavailable
>      iProduct                2 OHCI PCI host controller
> 
> Are these -EAGAINs cause for concern?

It happens with the vendor kernel (6.19.8-arch1-1) too, so it's probably 
just some weirdness in my HW...

>> And sorry for the extra review, I'm a bit picky about this function, it
>> was my first contribution to Linux way back in 1999 or so, and happen to
>> know too much about USB descriptor strings :)
> 
> A good review is a thorough review.
> 
>> thanks,
>>
>> greg k-h
>>
> 
> Bence


