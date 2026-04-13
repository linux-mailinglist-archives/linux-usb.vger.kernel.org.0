Return-Path: <linux-usb+bounces-36197-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOrwFDzV3GmcWQkAu9opvQ
	(envelope-from <linux-usb+bounces-36197-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:36:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A30FD3EB5E9
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F0C301D33C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 11:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C2B3BE16C;
	Mon, 13 Apr 2026 11:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o+vF0R++"
X-Original-To: linux-usb@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C541431195B;
	Mon, 13 Apr 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080038; cv=fail; b=ggXvU0zyB+vESSVWoVFK3L6Nl9qBphRlkrcILowvmeSTZneFsFI3kUj5rigNGawxvooPj1axeeLO0TzB9BAsG8fWlBVIMjdp+KvJ0VvI+8hsCz9f+CQhgGQzLHp05kEaoPadIEoFt0+2IM8l18MWaEFPn/XwiyHe5opqHeDwcdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080038; c=relaxed/simple;
	bh=xnY+7Mis+fUeuEEiBhvDo1XpC+fMO4WMbALyEFwZebE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iOonODIQuy6p7NR2qCQX9qcYB0KEN/JUwHq4N9HEoaZPND+vrPxMy3cUSrlPzrSK99Bt6VexGGtHEgWUm8d1gI7mv3CqQ6sP/d5ZkRgOo2bcJtzGtapV31yCagh3oZTfFpJaWbXvdrwS/VWtgQHSU9UoS8l7cVztmGyI8db1qog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o+vF0R++; arc=fail smtp.client-ip=40.93.198.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hialp1d4OyhqPxBfL9Xo1ZUFBhVzva44j7tyxHiP38IXMqAPALiXZuhpVBIT52O0UaJxlsvc4dRl5FWutpMoMbUe4J48g3nuJH6AYemaXexPCIPiXI+uu1Lv0JwcqhxEYGtjc3LV6dEesqqohcdRS5z//T4thVYsjHXqahPpFgBVCqSpN2Ir34Re+ZeUXrQuouwo1W10Unr/yw+eLf9HaLv1VrgZ4mHBtRK02aDPdtpF4o9R1/Rvk2l5waEkOHR91ympa94cncsUGm1yF/VUS1w7JNVoyV3WohxzmAKvlxZTjC/OR6Vt7uKAo69pzyR7S9g2/M4Tdcol0gxTqLOKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Yr8HxxYcUxEnyfid12vu5wt0mrWrndp4uzCHhPxkxc=;
 b=utqyubDQTMjXhqJB1CPWpcPVNbfmEgbrbzVqZiAiCgaphx+nmlfPNk6Qe6O9NBaDI/cWU9QZfbJPWs8UwQlnBIf6HJW8q2eu8tYeseEkJCGxD8zjISVOBgbA8P+/aFzZAOAYs8sfJtDxJt/A1UB4r1SiBHLUnI6nX8wSyylZLXhSwirIURxVwwj+j+A93DzlGMBFhbxNrkCcRb1FR6SRL4u+fETXFyIgIfvvZ57sWqBLHpAVHixTMDNGQ8Io+uLr5rMTrjWGjWEOHqRBcxP5eMa8e2QgIMcQKK9FV7AViJVQj/X47IAvDioZbkpGrR//1y/73Uk6OUgqnbZUBlJdUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Yr8HxxYcUxEnyfid12vu5wt0mrWrndp4uzCHhPxkxc=;
 b=o+vF0R++txplA58d9pvNUky6B4wphDrL1Emm82LnFnI/lRSUeNzdORtdi80SwuCWcKW9i3dU/qZg0jHUaB4mPL0lyunI4i7lyiVrOMAO9N1qcp0DRXOoTFwTobiCgK9jdNDH2GLNcOpf+IVpRMH/QcXaab0o2/lxmi1l7I+v408=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Mon, 13 Apr
 2026 11:33:51 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 11:33:51 +0000
Message-ID: <faf2421e-0d12-424d-abf8-ad490f5421ff@amd.com>
Date: Mon, 13 Apr 2026 17:03:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git@amd.com" <git@amd.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260401230401.w2si3gnqvzlszduh@synopsys.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260401230401.w2si3gnqvzlszduh@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::27) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf2debe-c3d0-4d7f-e55e-08de995088de
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wosb6zZmrZCX5ladm1RJnNpVEQamayzxdioG6frdPY/suLK84UNaRyojI5R4DcKwQ6XX1z/IuiImztBsU2LTGLI1+5+hy57mXbtYCiCrALqZOMwLsJPGT7b5iJbPQBAA5GTnbSublQRGt1kc2ZZvqQ8rbLc0e0JDrf8bBj6DskuEAip6TH/T19UUlFvVfKLFtPKkXcVd9pFkEkYFG022B9MMdtFFceeh50OMQw1U30ua96qCgYGP3wjc0J16soELSoWxwP++3ZR1fC1Eg9Z7vxULvFmdOjSSJV5MCCyLjHWuKavilipfbZ/Jao+P/ZF79nEQ4n5ssjdndFqW7CxEiNk5jRBjMAiz42dZzioRqFFqFc6MK5+OgHJb6BdbIepT2bFDWw710xYklqgwLZ9Aw2Rd0p6aLOogJF57v5uZMxmtpkqMy+kTY8Gsmg7bm0Nkm6w1KfsHPg1/DCX9DZJT00eyh9UpWYrvd/5hJ14ZKaqv2F5g/LobsIVKS1CSm4NYarKkgg7wr03nzzOm4vMfxsYuGYW22LPX7KyGEzEvZws/aIT9UwEcHnQpKoKh9AXojhPRkQgqbT50cEInzyA3xcpjZmfky+dwL6sHzSmpGPGo5CGIrmgpXBFiQnmAMTLeoFjOpP1qxTwBHUUM8eYpTm/Y/zvjngjSqnI3eTESJSjzlWUuPZC2lAWx71CMlvcsckJP7jYFxwqK+wp11x98oiqm7KiMCCkJVYbV/noD/t7XJaJGcTeKen9A55fN1HPn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmZxakMvNGZNYTd3b2wrNE9PMS90U0FZZFVCZFdTR0Q5TXN1WmdpeE1ySFor?=
 =?utf-8?B?OWxCcjRyb0Z5S2MrMlhxWld3Y2Rkczk0d1RmbHpBdmoyUFkwQTgyRVNkL0Vx?=
 =?utf-8?B?VzQ3bmt1Zlp1TEVtbUt6a2FmcGhIMVNUVGU0Z00vbENlNldaMDhaUHdiMTYx?=
 =?utf-8?B?a2lpd0pTRWE0b1JmR09vdGFRZUZmVW1Jc3B3Rytaa0lrSSs1cERjaUV3N2Jt?=
 =?utf-8?B?a1NUSWFUWUQ5ejkwRlhsNWs0bHhGamdBR3BiTjViM0hZTE5RbjRpQmx2K25L?=
 =?utf-8?B?b2ZKbjZCYk0zUEE0Q1h2UW9oYkE3RUlvRjRPWXRrQmFYSHl5OUpvVEk2cHZW?=
 =?utf-8?B?SEJqQ29qVXBnZlpNbXhxd3lCYmNHVTR5Q1pleFNJdjF1cVpqY2dFRHBJK0lk?=
 =?utf-8?B?bkY3WDNUZzgrZVJ0Z1M2Q1lJWWE4QVRlblJxaGEwRUxkVHdpZWlWbVlHS2tL?=
 =?utf-8?B?Y2JsM2pqNXRtMjRGdHZKM0drUU4xek1vRHJsNmlHRUpTWDVpWDJ1Tjd2ZUFh?=
 =?utf-8?B?aFJkd3dHMHNhSXpxcFYrNFhUNHF3dE9Ib3dHOXI5aGNPanBSY0hOQURoOEZO?=
 =?utf-8?B?RUFLaFBuZk1hNWsvKzdDNXdMSnUxTnF6aWxTNEFBZDJDR0xmeG1YSS9haTZD?=
 =?utf-8?B?SW9INlEzbjVUOHo2a0t3eHZZdlg2bW40Nzg0dm9tc1BXQjYvZlUvOFNuaHY2?=
 =?utf-8?B?MFJVMTBtbHpDUzU0WkJjam9BMnh0N2NMNHNaMWJ2SkwwcytGcU5ESU1iT2V6?=
 =?utf-8?B?clVYTlhxbTJGSkc5NzV5Z0dEdGMyU3A0Um1OQmZTYXZuT2hhNkxFakRoeVNQ?=
 =?utf-8?B?R3ZpNldlU0lGeEE1T3NWamhEcDhicVRJRWZ0RDZCQWVLSnQvbUVad2lyNFZz?=
 =?utf-8?B?UmJUSTZ6WUU0YlZaelBpYmlrOWI1Y2x2VndpOENHUG5vbSszZktQQTFlbitN?=
 =?utf-8?B?QkpqYnhQYVNpWXJxbGlnb05welJmdHc0d2hOaXpnY2tGSGFwNE9ZRmhqRjV3?=
 =?utf-8?B?STNWb01YOEIwWFJpUE1UNkhsTGtBWG8zcXRrWFRiOTlFYUlVK0J5bGI4aGxn?=
 =?utf-8?B?MWx2RWlHMmMxS2NFdkE5ZkF2eC9DaWYxQ3Z5WUFSem1UUGNtZjN1dndtdUN4?=
 =?utf-8?B?eXovajhOV0c2aFFjeWNYbVYvaEtZcjZzN1NlaSt4VFJFblh3NVg2MmV2OG1G?=
 =?utf-8?B?dWl4Zmc4RndCYURpOWhCNFFtYjhJblBnZzdidjdkVXcyamRUODJJM0MrcWF4?=
 =?utf-8?B?L2l0UlZaSWpMa1lRc09pWmJ5YVc4eGlTbk0vbDZiN0xEWWdHSVhQODJMUVpH?=
 =?utf-8?B?dDArZHFyNFlLUmpyWEFQZlhhQnhzandKaVNVaGxRZytPN1NvN3dlb1c5dy83?=
 =?utf-8?B?WEZET01YRTV3Z3M5eXdMUzkrcnpBenNBTUlmR2R0TGJXVzNoOFNXODR5MUJT?=
 =?utf-8?B?aVBJcEJoWm1lYmZBWEpBcURGck5iOXlQWklpYStodk5PRFNzQVcvejFhdUt2?=
 =?utf-8?B?NjhwdW95RjR3NVBtUVJkcFpWUzlUUU5TQ0ROV1BrNVNFejcvNFY2VWhWZFAy?=
 =?utf-8?B?dGo4ZlRzaXRsbW5mdlNnY2VYK01aTkNKL2ZFaExLR3Fkd1BvdmdZTUQzOWl2?=
 =?utf-8?B?ZkZqZS9QMkQzZVYybmV2cCtjZjNObnBxZ0h2MVV4cldpekZkT0tVY0ZzMFk2?=
 =?utf-8?B?Q3BWWXdNRUJWTGFYMEdRWGJ0aS9xTWk1S2VHUmZoU1BabTBDN0xKWnkrdmV5?=
 =?utf-8?B?eGJnanRSQ2JXeHg0L2NwRjdRUzN1MkxsNGRHMVZrRWM1enZ2SmJiSXNGeHNU?=
 =?utf-8?B?ckVDYjRXNjRtbGdNK1RpMW93UTFrMTJmR09uKzE2R2JkVFhxZHFrWUZUa01L?=
 =?utf-8?B?cXFKdUdTQXlmY1ZHNWJzMWF6ZVVHb1orN2pBR0UzUEMvV0l6OThld1FUMXZN?=
 =?utf-8?B?MTZSenRiWEdPYi9PVGlnWmxjZVRzYWtEUiswUWl0S09tajZYTzlvclo3MUQ5?=
 =?utf-8?B?Wkl6bzV1TGxWZEpBNmpDaDJPc0VBY2swMWtXWnhrS2huZDBaTGpiU3AxcnQy?=
 =?utf-8?B?a2hOZFpxamFSTFhFRE1peHlhL1E5b0pFeHhyMmMvK1MwcW1YV0pUWFdFUW5y?=
 =?utf-8?B?cHVUSjIrRnhmZWRMa2wveWdkWXZwc2pNRFFsclIvVmd5Ymtod29GUnh2WkxV?=
 =?utf-8?B?UUdtYWRBUTA2WTlHTGM3SXY3U0JvbjNTeXloUkFwbnUvUFdZSGcvQU1WWDRO?=
 =?utf-8?B?WldyL0JqS09Zdi9iRUFJdzQ2aVQrR2pUdDVGUW9hV2ZFQUNONkZod1liOTRS?=
 =?utf-8?B?a3J1L3llT0l1UkxjOUtMNDNQT0EyZWQwYy9tT0ZIeUNodldFQlNFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf2debe-c3d0-4d7f-e55e-08de995088de
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:33:50.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxSBovxoir8jNb4j7Kvjl8tI906a8G7+63pB4yrzvJIokGHW7pQ/nUZQJNBwIC0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36197-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid,urldefense.com:url]
X-Rspamd-Queue-Id: A30FD3EB5E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Tue, Mar 31, 2026, Radhey Shyam Pandey wrote:
>> This series introduces support for the Multi-Media Integrated (MMI) USB
>> 3.2 Dual-Role Device (DRD) controller on Xilinx Versal2 platforms.
>>
>> The controller supports SSP(10-Gbps), SuperSpeed, high-speed, full-speed
>> and low-speed operation modes.
>>
>> USB2 and USB3 PHY support Physical connectivity via the Type-C
>> connectivity. DWC3 wrapper IP IO space is in SLCR so reg is made
>> optional.
>>
>> The driver is required for the clock, reset and platform specific
>> initialization (coherency/TX_DEEMPH etc). In this initial version typec
>> reversibility is not implemented and it is assumed that USB3 PHY TCA mux
>> programming is done by MMI configuration data object (CDOs) and TI PD
>> controller is configured using external tiva programmer on VEK385
>> evaluation board.
>>
>> Changes for v2:
>> - DT binding: fix MHz spacing (SI convention), reorder description
>>    before $ref in xlnx,usb-syscon, restore zynqmp-dwc3 example and add
>>    versal2-mmi-dwc3 example, fix node name for no-reg case, use 1/1
>>    address/size configuration and lowercase hex in syscon offsets.
>> - Split config struct refactoring (device_get_match_data,dwc3_xlnx_config)
>>    into a separate preparatory patch.
>> - Fix error message capitalization to lowercase per kernel convention.
>> - Rename property snps,lcsr_tx_deemph to snps,lcsr-tx-deemph (hyphens).
>> - Fix double space in comment and missing blank line in core.h.
>> - Use platform data instead of of_device_is_compatible() check for
>>    deemphasis support.
>>
>> Link: https://urldefense.com/v3/__https://lore.kernel.org/all/20251119193036.2666877-1-radhey.shyam.pandey@amd.com/__;!!A4F2R9G_pg!YSeyY-bpQrMLqswAc1cWND5CSHvGFygPGMEMpR9amrRMnRFjYrFZktzbLzEzVZcQmOW34IUAfwRKHwy7B8p_ciUorWGJsA$
>>
>> Radhey Shyam Pandey (4):
>>    dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2
>>      platform
>>    usb: dwc3: xilinx: Introduce dwc3_xlnx_config for per-platform data
>>    usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
>>    usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis
>>
>>   .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 70 ++++++++++++++-
>>   drivers/usb/dwc3/core.c                       | 17 ++++
>>   drivers/usb/dwc3/core.h                       |  8 ++
>>   drivers/usb/dwc3/dwc3-xilinx.c                | 89 +++++++++++++++----
>>   4 files changed, 166 insertions(+), 18 deletions(-)
>>
>>
>> base-commit: 46b513250491a7bfc97d98791dbe6a10bcc8129d
>> -- 
>> 2.43.0
>>
> Hi Radhey,
>
> Do you have plans to convert dwc3-xilinx to using the new flatten model?
> The change you have here fits better for the new glue model.
Thanks Thinh for the review.

I have looked into the newly introduced flattened model introduced by
commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library").
Moving to that approach would require switching to the new DT binding
and doing a large refactor.

Given this series is already implemented and under review,
I suggest we get it merged first, then evaluate the flattened models
benefits and limitations and plan a follow‑up migration if it still
makes sense. If there are no objections, I'll send out v3.

Thanks,
Radhey

