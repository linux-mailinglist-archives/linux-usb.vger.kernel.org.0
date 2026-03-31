Return-Path: <linux-usb+bounces-35720-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFCBInGTy2nMJAYAu9opvQ
	(envelope-from <linux-usb+bounces-35720-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 11:27:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 799A63670CB
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 11:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5815B301153D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 09:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBE63ED11C;
	Tue, 31 Mar 2026 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XkfH2f/M"
X-Original-To: linux-usb@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF0720B810;
	Tue, 31 Mar 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948754; cv=fail; b=pPQH1BDm48hC8v0qlh8RsyY9kTPpNoWaM9dhp8Z/2ekQldP4RHomU0rc3M0Og8/8sCX3qYHb666ajb6uMArbLQtxmrp54KseEx6PPCqb8gtGq7fa9rGF2eEHhEleC+Xdp+tAN0Uzsqy4RRkLvuKGjdprZ61wvxZN5fwzjzVdTYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948754; c=relaxed/simple;
	bh=6RFKBrvqNb1euX7CadqXpM7/afYxei/nMKKpQMDxz7M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KgfvVPRUS8qsdAVJAddEmga6PHN9sP0+C8JMKzrzIjeAIWO/p2uFLANMA2FYDwLXmZi6qXkzPM/iLEsE2rTQNWnjosLUYyHIPZRIReH1EXVzgomh0IL7snYsrU6BdOIwdMSx4r1J/BeNg/tM8DI47gkzA8TEmD2PfURES8nbD/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XkfH2f/M; arc=fail smtp.client-ip=52.101.61.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhU+zPCEMlqWrm1yV0eFYK9E3nGX2nL1hyIRxt/D+eH0rCATzX9nMuCHBsQp+Q4soVHsgMUDwXYkfgDuZosTnPChsgA+QdmjbV2BHTz7Mbmkv0Vi9iu+35s9SR3MBRQa+6PES1mhZfEuf0jg9yfBZX8mJpmBm66tbKfe+tmijzSANSZ61tvRLKXGAIGku5STeHr28kYGRt5/j2oNs1QIqDEVSSQzbAwH+TAiNRPLo12aJLevLawKHnafK2mDYbbT+N/oKyBJQSpA3L5+tgaO3BH7OODOfepK8GDg5scDGNk8596J4lUj5NDwG2Xe3Y6kxJEtZ4GE6ctEuhcT+SuPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXHPwOOxOQLypk2rkSCJ13XhreMHR7GuNVxvkx4FgKg=;
 b=as+BTjCX96b6qWQsuCWRxCQPYyP1uCuSF07BBNLhWyQ1BJQvqFbHxk0ZxFr3rItgjtoAAKhSCKzt2Q/nHhRKL80PEeeYr4QMbJfFMO6KIzw8AfzSiW7iNsNETNl3UxWvVGeFSZDn0PeAmX4RC1vc3kclGsxMzWQ30gURMihro3UaAyaU/JNeQ7lNEm/Nc+/KePKkZLKSKkK20x3yhmkG05HuWOuwMqEVbisHQ3Vr1s2ZbQImNC1SruOPdal2+7Hr8VkpaeChROpFsXsmdd+cRY2AIpqTVaafABpG0w4shgT+sGf5ie9GdISj4NBXHBM6llIj/SPawYTKEJu1GME2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXHPwOOxOQLypk2rkSCJ13XhreMHR7GuNVxvkx4FgKg=;
 b=XkfH2f/MfktynBsQ2IPH+fBAnnH6OmLqTqxBkRrbq3S77x/wbHu5bgE1zXxKN2u6IPktoAw0kJ1DO61a/9vOOOdINIiZSzhWiHXk7tkboKgw2jDUM0kxrQh7xBcPxb8JjEgXvQrQ00VVDE4ZWlWA4Hz67iKtMFQat/GRDEED8Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 09:19:05 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 09:19:05 +0000
Message-ID: <3d64cd29-d981-4e84-8106-8085250fc502@amd.com>
Date: Tue, 31 Mar 2026 14:48:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB support
 on Versal Gen2 platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com,
 p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260330190304.1841593-2-radhey.shyam.pandey@amd.com>
 <20260331-jellyfish-of-pragmatic-prowess-a230fc@quoll>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260331-jellyfish-of-pragmatic-prowess-a230fc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0140.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::10) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d58cd0b-b38b-4253-a569-08de8f068de7
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rKCSLT+v8NB74TthA/NYYTWsvbkUB3gosirQG03/1Hy1RBIrb6zC0HvFrwq1i5HLt21Jc47zvc0cYziu90RpU/SmlNOgUPglbXL3UWqvYoCKPWXodt+MYG8L4tkLDyg8sT6ZNFSOpWtV7IFxAqkvWXPThBBaHAxPYdsR6xUNnCdU0RmodL6VtiD52ErYyVEa78s3iJOumyG1J4oPklOzuBwvafoq/5CJs1MpDWRC1EHFfSsFtCZ2zKpddy2dv93KFzLJniJQOdmy6EBil9PmVE57iUwQsraSN+QeOO3Eq77wXcVUbykaF1EcV2WI+3Jr8p9V32yBI1P9TMjQA+1ChCXIn4EHzyC1PHBjhj6q9blc+YDpvIEup28Mcu7/MEHZskzyb4mPMFM8pwo8u+FPZe0h4NZ4mj0ZbHgZ2FSt2NB2X5DziFX+LDNAqwdDHkIunEptXsbXsKiB1uites2eO+VobE7xULrhsdHfzq8sRVzY1LbXz4h/NFEoi0BAX2fYqLvGFPoD8gDfrKBUom+fIoGh3YFUZDJWHFbg5KrZ4TorcyfJ6kCp2ld/AKlA6v8Ldu/rB3ttfosqfA6FVpD+n+FyjKttZKVXmpxTVMnBdsp6RXwb82pl64lIzNOzSxSdP8P5B91/NCjMvu15rn8gBP2hs7kgURwY4vWr9P46ZZoEnF7E/5iZYN4bAJpJormhNKGUNtiTXuFyRIw44h0j3LSGUFXT0dkms1+D7KK/8qY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUR6bmZLMG5yZnZUbFdTQzRXRk5EdG5rRDhjcWxaeEtLVkUxYmJPMXNRaHVG?=
 =?utf-8?B?REoraVZiOHpIRmRRK0oraHU5TUluOHI2VTh2NTE3REtSekZ1M3NkOStJalor?=
 =?utf-8?B?UDFMVW1zVTFLOEJjZTllWDdiTTMzSTVmZG9Sd2FPclMyTVVhSHZMbkdFdkZZ?=
 =?utf-8?B?QU5pZGVvb0dMWmZMWGdaTWorWmJzOXozSTBiWUt4ZHB5NTVROU13eUx1b1c1?=
 =?utf-8?B?MTUxQWxTYWZMK21TNlYxRjVPMy9OSkxYTFA0akpJeVNuR0VpZEdHdWZHUW1N?=
 =?utf-8?B?NFlxQUQzekNwNGMrRm81c1BUK05weW1OYjc2eUJxdjVkLzQ5eUl0NG43Rzgy?=
 =?utf-8?B?RGlSZUgreS92SUxBZTdiY2pMbEdZS1AvWlhtZFhsd01uKzFmWDRNa0x4dUNt?=
 =?utf-8?B?NUNpamZJNm9Ea1Erc2p2U24vcTc2V2FZbldXNW5HazZjbFNPektDc2dlYnZB?=
 =?utf-8?B?TThNZE1aMm4rZ0lVdVdtVFd0ZEVsQitJdzl2N0RCVXNZWDFiRHlDZ0RLS3FI?=
 =?utf-8?B?QlJZNHZDdkM2K1QwYmFiVmNjMEUvZXVTZi8ySVQ0b1ZtWTJYUVovUmRJdVp2?=
 =?utf-8?B?R0NQb21ZSFE4MFJreU9iL3E2RGhQY0dvdGhNNHB5K08zdHk1NUhrNnFPVjlr?=
 =?utf-8?B?N2NVSHZia2NMUjJCblNCMllzcVBOU0FZcDlBdU8zRkZGb3ZGNHhSdENjOW1l?=
 =?utf-8?B?dmRQQWNhYVppbytnWTI1OUNtVk5kV2V1WXBZSlBQSGFub2ZFRWtrVEMzVWg0?=
 =?utf-8?B?Ym5aZk1hNUk4N0JONDRPRkZSV042MG1wTEFVcWR2ZzVXeldEZGdVaWEwejlp?=
 =?utf-8?B?b1RhK0lUOG9HZmljK2FXamIvbjZIbnB0T0V1akl4S1ZrSXdDWHhnc3MwT3Bx?=
 =?utf-8?B?NzZKZktDbERRbU4wWHlWcHUzT3RPeDdBNDNHSk0zWDlSd3hweUhZZGUrMGxt?=
 =?utf-8?B?bjAyK0paTXBvb3NTckM1N1ROUXJqYmdDQzB4V1JqcmFaK3UrbXpCYVdteExS?=
 =?utf-8?B?enBUT2VnelkyTmhGMlMwM21RWUFoNzZTVmpROW5OQ3A5d3ptWU1BQ0M0MEFR?=
 =?utf-8?B?TmhzdStvcFJPUXgybXJZVHhDOGN1K0NVc1J0ZWNCNlVkeXY5NktIK3J4U2Zk?=
 =?utf-8?B?TllaN0pmRDIzM3l4Zy8wank5bnFsVkxTRWdpNGdFYndhSEF0NkZtaFpFeWVm?=
 =?utf-8?B?MDRDL2Rnbm1qcWNXT1hOVW5NTytSNGpoQzVFQTBiNW5tVHJwV01jU0JmTFRl?=
 =?utf-8?B?N1JvZmlKU0FNdmp4ZUhySU0vUnhPbVN5ZUhqWThvbEowN3RuRjMzNGRzWFFQ?=
 =?utf-8?B?QXR2TDJBWDJNQ25Nbzd1aEVyaUJ4YWJwRXV0VEh2enFKcXVkNCtlMDNveURW?=
 =?utf-8?B?cC81ZEtDNk9ocHVud05uL2ZiZE5YRUU5OXdPVHk3NTNpZkxjYm1ScGFWWmNh?=
 =?utf-8?B?ZHZ2ZnVYQ0Nlb0JyaElZd1VkclE0Nzc1T1hTV1BGWmd2eXJmVlp1cTB3Z0FW?=
 =?utf-8?B?Umt0anBsbFE5TFU3RkpMWGZVWW1yZGF1TFlxdjhTalM2SUJYRjFuZEFmQ1Ev?=
 =?utf-8?B?cEFSVFRpbXVOdnU2aEdadnQ0WURIZDNRMTZ6NUdYZmJNSkd4UXRma0NDL3hJ?=
 =?utf-8?B?eDF1VnY5bFRlYU5PSU52alovZ2FjTkVrUHFBUHhZaHplN0pVOFVEYlFKZ1V4?=
 =?utf-8?B?cERIM2RqVHZzVkdydlo4UHVJL3lNSnREeTN6R3U3MldTQXRnZHBqR3lQcks4?=
 =?utf-8?B?SHRiT3A3Vmd6ZkNGWDhJeUlhNzN6MlliVkswdlpMY3dUMzhVVE5tVGtVZnUw?=
 =?utf-8?B?VXh0a0FGMVByR3lJTDQvaUxua0w5SzFWNnBET01VWW1kSE9mN3dNNUZCMDV1?=
 =?utf-8?B?L0E4YWxUbnBoYjRxaFNJTXlYaVAzbkFuc3hJNld0NndKWUFJZEZpcmFEeTlX?=
 =?utf-8?B?YVZPclh4RHVJRHh0SjZoby9nT05ZQlg1WFRJNzQ4dmJENEswVUZveXFNVzgv?=
 =?utf-8?B?TFF0bzVtUUxlT3grSFZtN0JnOHl5bmdWK05tQkVOTnkzK3hsL01pZjBJZnpY?=
 =?utf-8?B?VXAvNVMyRGdwamtBQjlNYjJIem5lZkhMWUxPM2xjMU8wcXczaFZUQ3hJN05x?=
 =?utf-8?B?bG1idTgxb2VMNk9tSG8yOEo4akFuVWYySXM3ZloyeTdOTTZYWmlMUFhyaUp6?=
 =?utf-8?B?Rkd0VEp2MHlXc2dUdDVFcjlmZDdBTkZRcTFsc0FNM1RSYTBscWZNMHB0TytC?=
 =?utf-8?B?NkRTa2pkRHNjQnh2RWkyQ2xkYUNqUDhxQ3g3Z0d3dHZ0Q1dmOFZ4OFNoWUs4?=
 =?utf-8?B?aGVlWmUranZhaG84UnBYN09IMUlKQ3BKTm1pT0RlbWFLcTFHWUpvdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d58cd0b-b38b-4253-a569-08de8f068de7
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 09:19:04.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1swvMXsE0CU0Gh3S42uCGbprplv7Th5vW+fE+dz/E8jQiodBcJEGYfScoFvOmg1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-35720-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radheys@amd.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 799A63670CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Tue, Mar 31, 2026 at 12:33:01AM +0530, Radhey Shyam Pandey wrote:
>> Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
>> 2x1 Dual Role Device IP. Introduce a new compatibility string to support
>> it. The USB wrapper registers reside in the MMI UDH system-level control
>> registers (SLCR) block, so instead of a dedicated reg property, add
>> xlnx,usb-syscon phandle with four cells specifying register offsets for
>> USB2 PHY, USB3 PHY, USB DRD, and USB power configuration within the SLCR.
>>
>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> ---
>> Changes for v2:
>> - Add blank line after compatible as suggested by Krzysztof.
>> - Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
>>    IP from Synopsys is part of the dedicated Multimedia Interface. The
>>    Versal Gen2 platform also includes a separate USB 2.0 controller,
>>    and the mmi suffix uniquely distinguishes between the two USB
>>    controllers. MMI is an independent subsystem particularly targeted for
>>    deployment in Multi-Media related applications. The MMI block include
>>    following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
>>    Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
>>    Controllers, DP AUX-I2C PHY.
>> - For MMI USB define parent address space i.e UDH block.
>> - Fix inconsistent MHz spacing to use SI convention with spaces.
>> - Move description before $ref and items in xlnx,usb-syscon property.
>> - Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
>> - Use 'usb' node name (without unit address) for versal2 example since
>>    it has no reg property.
>> - Use 1/1 address/size configuration in versal2 example, use lowercase
>>    hex in syscon offsets.
>> ---
>>   .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 70 ++++++++++++++++++-
>>   1 file changed, 67 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> index d6823ef5f9a7..5e31b961aff7 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>> @@ -15,6 +15,8 @@ properties:
>>         - enum:
>>             - xlnx,zynqmp-dwc3
>>             - xlnx,versal-dwc3
>> +          - xlnx,versal2-mmi-dwc3
> I am not going to ask the same questions.

I have provided the explanation in v2 changelog.
Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
IP from Synopsys is part of the dedicated Multimedia Interface. The
Versal Gen2 platform also includes a separate USB 2.0 controller,
and the mmi suffix uniquely distinguishes between the two USB
controllers.

Let me know if you still have reservation in this approach (using
<vendor>,<soc>-<subsystem>-<ip>). Or any other alternative
based on IP version etc please suggest.

Thanks,
Radhey


