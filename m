Return-Path: <linux-usb+bounces-37103-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E0sHr/h/Gk2VAAAu9opvQ
	(envelope-from <linux-usb+bounces-37103-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 21:02:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421E4EDB48
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 21:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35B2D303428B
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 19:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8558E44103D;
	Thu,  7 May 2026 19:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IOM/rK2h"
X-Original-To: linux-usb@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA1346AC5;
	Thu,  7 May 2026 19:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180488; cv=fail; b=uFGQh8vXA12fAngI4aQwRkU2c5AxB839SIvJkIu4y8gnbBZjLXOMyQSRA4MD60oRyaXQaI8rZpym0v11jtNAHawmlsRd/f9Zmppmxo0/Vd0wwBO41Vhod8URTxyXsbGpRz6OB7pVuWj06Vxlg04UqV8pIhptDb1liWBYtY2S6cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180488; c=relaxed/simple;
	bh=CjxhqtJOdOLlliAkrfYtXyNmNGcRKau6BkLQIJ0Riko=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iNtdrEy8ujwV5bnaEH9p7UU55ZxgLSnIGReWU1wXp7AJkyQ4GRGwkHIrAZT0ewEU5g57KRSLA3Ho20wADjA26qqp1Q7K24HjGg4uTDbJb9gXvUP0G6zrVByUARbLOX6ofer9ahoaU7KJbfJafaJZcRtdyY9JjVoQ7kNKR2LsP9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IOM/rK2h; arc=fail smtp.client-ip=40.93.194.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/kPGmeUWyXQScnefcQgRAPNHNNq8Ab3HzWu1GcjJa9QDZu9akP3q8/dOib5gFkEAJ4QhsL0TUYgeqosZQ/nsTW2yX2XTzEgeIj7nRtfMGN3eKCho+u2/h5gJ3+a4L+8hKlo86brv3sKr/3gKRuIXTB/dyKH5wRbNjNzjr5IxOr5shxX+rsiqTKBOkmYLpS1Gkb4lxJD1X0g0hibcFUQ9jXFZFjPS9xAUVSVX+FWhczIWmfG4Bt6F5AGJzVi7ZLzOfQsW7W/ggwUC0rFcaB1/UC/4ZW9ta5ThEqr3LOhwE38yeQBMD/0hvow0/7L5VljCEv9vckaDi0AnldcivkPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvarcGLkN4IyAZEHWxyYeHO7ugWBdWcOPf6K+48odOY=;
 b=Ld98HbI2MOheghdTBiefwJxkdrQqZQlNpZDAQqguVYXSmcLaEref+/VB4ak1WicFfPPOuQ+tAadhO3k9cBDZkC+3F0e0V+C0NdVw4D/hQxFw3ZdgsmkJClbQK7JPw2ZaMgzaHFDhhwNjul9jH39ILnNZkzZoKXBkxmzxkW/Y1DHNdgwwXwTBHNza772jiBy1NauVZYmZAXPimb6BwFLKoyXllc3YEvsDy56Yd2CKZ77/jFdgKw8d0WNYw8CGaTJufyq41OEjHJ23ot+9TlUxmx3mJ7vnUBmq7lAjk5FvNJm9B4HqGAU4UGBw76Roj1J7dYKpo5FDsfj60pImf9TTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvarcGLkN4IyAZEHWxyYeHO7ugWBdWcOPf6K+48odOY=;
 b=IOM/rK2hRj7qOk2jDl97r32NkWl+BIYK+B56ku11wkrGq/Jn7G6DtzgOZVqyhVZbL8rQrYRJW44OK+tLp1XBd6fzlT9qJ/GCO5L+Ajgf1YLOOWuNr9rmTQ0B3nagXgga/cglTRt/V57AO7mHomrWuVhqpxQNwpavw7OLkEHxOxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 19:01:20 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 19:01:20 +0000
Message-ID: <f9f25ef4-a541-45a2-b98c-4a411239993b@amd.com>
Date: Fri, 8 May 2026 00:31:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB support
 on Versal Gen2 platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com,
 p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
 <20260429173050.1772377-2-radhey.shyam.pandey@amd.com>
 <20260503-enchanted-galago-of-relaxation-dcda7f@quoll>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260503-enchanted-galago-of-relaxation-dcda7f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::34) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|CH3PR12MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: d314fab7-1af3-414e-c4f8-08deac6b0615
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	PLXSlsextw3G3Egf8hYd2M8VEZfM4T+z4xtYYXBpCVmU/X49OKODx1cfx4qpaCblf170FoDtfNHdF5vfQPccPOhOzPFilmKfsVdQAwmkQN9JRmxgfkYxOLYdn3Rdyimw5x152CYTq+FOhR9i8JKP8mGyFDybkIAPA7fLo+sT1MYkS2xQ7e33Z6WAKsx2dhr3z0s/gfeA1ecAyU+CLyLMgwjVpv8Ek+detvrHBDs+gweCiT5aUD/7ONs43gksKlcwYNfsHd9qpc4B4+25VdxtOqKd1zstSLLXKHroFW6m7W7pvPZlAJYg+gHSF0ZgkG/FuTgIMiRUbzoN2D+qLfNVdY7AT0tQjv45or7jhmiQxf1RWqdKucS8Zp4kL6XBf9106T2OlL9syB7F6WojompPIZf1uCRBLUx4j2a+o3x2RjbvfkR8LzRwZSyWJFnXYBFADvIVXbcL7OzKxwqiDW78ZIBliuSI3gGbksMibYFdA/m0ZvsYbs6lfCDq//uo1YKzeHrEXwWSDHUZQelEcN1s0ozBzHI0Lr1gxXi7LgJJkMWnf50+tt8bnS+dSwmQhlsvu9aJ+/eXweWvAztPejoPMU309yF6iB5m9sTv1lDGQlGeqomOMllUjR1B0NeKpte6rDeuiKe4pRwmIBKUT6c1trcZfg0BaUViGtS8tEvcEFRxpA5IzntVBV7uma0oyAIP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3dhRDYxYlA0c3VJQmdicnRUL3pIb1VReEZqU2k4c1FsUkJwa0krZ0paV2g5?=
 =?utf-8?B?YmJrcG1jdUtVeXprSW9MSGRSdy9ta1AzRDBRcW01YllxbVlmMzF0ekJsVEUw?=
 =?utf-8?B?cTRmR2h1V0N2OWYzakVjLzlHMENSZ3FsWEVNb3BhTVVBWkExdEc1eWk2RHpR?=
 =?utf-8?B?cGlxTUwyTTRJYm4wWmRFUlhha3RtM3FzVzROOWNjZXM0aEp6QWFKdXpaVTNv?=
 =?utf-8?B?RFdKMitTYWV6Umk4N084cmc4NUZ3UExYcWJvM0I4UjYvLzRIaUVqNE80Qjhx?=
 =?utf-8?B?L3kzSTYyNEM4WCtLQzBVaGNWYkk0b3F5NE5hRGkyekREOG5oS0poOFRtR3o4?=
 =?utf-8?B?MlVsbVV0ZmNwTDZPU0tGcklKYU5zL0Y2QlkvUURrUm9OZmlHTi9lQjFuaVhp?=
 =?utf-8?B?VWxTOHJ6Wjl4Q21JM0haRXV6d091MGtnekxzcklzOFQ5VlhrbGx3blE1VnRS?=
 =?utf-8?B?Y1BRRGFBd2h2TkZqSTYxenhzQ0RPdXpGbVE1MzQ2eWRYdURBUDQ0UjNDVTJ1?=
 =?utf-8?B?ZGNieForNnlaZkF1WlRlb3pLWTRic2wzOUJkWTUvQm8wY3M4VFlKQVlBSEM4?=
 =?utf-8?B?S2RtYjZiSENBQXJqMVBEd1BEOEVOaGNFOENiMWkwNEhodG5tOTlJWEkvVmVH?=
 =?utf-8?B?cHZ3aWFScVp4TkR4MzdBZUNxN05VeUJGT2x3em1UN0NkbFl6ZXRTRWdSL2dP?=
 =?utf-8?B?RTFoNnlnQkJFbHlueElCa0N0a3cyMXZrQlBDdGNwVHQzMmRGVVdMaHIrT20x?=
 =?utf-8?B?Y0lxbVVaSWJaWkhCM1p6Kys2OE90Z1NjdTczMFRxbHFGT0lmTk1pOTdLa3BV?=
 =?utf-8?B?ZkdaNGlyWEVZaGhxQ20xR3c3V1ZNMlJSRlZtZFZiMG1wR3hscHlLeU13VjhZ?=
 =?utf-8?B?TkN0M2tZMW0zV0NnYXdDLytkcVVSV3hZK3puUVhudzkxVDRyRTBXNytoTzRv?=
 =?utf-8?B?UE4vTVo3Q1RQb3BGTVcyTWtoZkFpUnRFUHJTVy80VStJQ3NWUHhPVUVaZU1R?=
 =?utf-8?B?eERzMHlPVnlrbHlUWGVNQm9QRU5GYWQ4cytDRlNoSXpuZkZLZ3dOenRhcWhv?=
 =?utf-8?B?TjZEOU80b052cFFSTmdsaFpkNUdMNnM5MXhGd3o2SWpVR1gxMVBjYlArM3Fw?=
 =?utf-8?B?Y3FUbXpSc2phVFlPNC82VDJwV3FnTGFTelBoSDQrUVdqeU8xQ3VQcVJVL1lk?=
 =?utf-8?B?RUJzamZlKzdLZmJEQ2dvL1FJZktOYzhjNEgzZFFSVFJXVzVPQWJNN2NNL0ds?=
 =?utf-8?B?K3lpbXh0UnppSERtTXJZamp1TTNJcThlbXNrRGxNTEJLMHliZmZhaUIzRGhw?=
 =?utf-8?B?T3MwMkZ0YU1RWFRUcDR5SGdDYVJCUTRRZU53Ykd5NkNEZklNZ3lkSFZVdjRx?=
 =?utf-8?B?YUpRRW8wMWkxcnhVeFdNOW1FRzNNR3c2cUVHVi9xOTVYWWFMMHM1Q0hlYmcz?=
 =?utf-8?B?cUN1L0Y3L3dGb1cxK3hzV1haTytMdjg2am51YTRvZUZ5RUNuY09yK3AxSHU5?=
 =?utf-8?B?RHNteVFZK2I3cjV1MmFOWmsrQ0Y4ejk0TDRxd3Rrc3pSSlVqM1k4akthK0dR?=
 =?utf-8?B?YkVpRUU2cVgwcUcvUEg4RHhqdXN6Nng4ekczYkpNWTZHcmJrMDJIelZzaEJW?=
 =?utf-8?B?a1V4cHY4ZEFuSUN6Ny8xMjVHdElnNFNqcHprUnhJZk9xcHN0MVRGRVNJZCs0?=
 =?utf-8?B?N3NpdXA0bXh5UE5qak42a2U1cTd2eHdxSGJnd0VOWFZpZlI0WUJuUFJHcWpE?=
 =?utf-8?B?NElFQUFKZ3N4TnBwdWhOWExPcGlUQ25sZU43TGRaam5JdUl4a0czdFFSL0pi?=
 =?utf-8?B?dXBna2JlcmhWd21KN3p2VXRIYTRMN1FoMzlYQTdTL1hMckMyS3VxUlh6VzNB?=
 =?utf-8?B?Z0lTanMwTVBtSndWc3c2ZDU5UVlkOGhLd3NlRThTdE5YNkkvb010QjFBZDRK?=
 =?utf-8?B?TU9TSGlLMzZMRVNVQXY2ZWhGTHk1LzVPTWxuK2NYc0ROV205eXNSNG9RQUhS?=
 =?utf-8?B?c3hlRWZ4cmZsanIxU21LR3g2bk1RcnRIT3FRbStMbFgzYnl6SmZtMktSZ2JR?=
 =?utf-8?B?RG5VeU9VK3RZQ0VtZ0k2YUE4NXc2M2FDcXNwUjFWYWQ5ZlNha2UvZXBoeDRK?=
 =?utf-8?B?QW1IK1JNU0lFRGdKdHRKam5UaE5WbjBhVTRwTXRVVDBJYU5WeTNCYmpremU0?=
 =?utf-8?B?K3BpNXcyN1NlRXJnN1BMUDhJTTNldXpWK1JqUVhVQ3pKMzdvajdFN0gvVytN?=
 =?utf-8?B?bVNsQWhZcFp5bTVhL3F4elFNeVNkdElSOGdhTzlaUExhMGhPaEpkelIyVkY1?=
 =?utf-8?B?U3dEbjNHU0VtRmVkOFVCbE4vTlFpWXBPTm1QUHJEOWllYmw0T0liZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d314fab7-1af3-414e-c4f8-08deac6b0615
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 19:01:20.0274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPr/6N8SciSbuipd6YSWGek2TSyRJvsM6T+a3zgNDVqocHy7OlgabDocny45ti6A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583
X-Rspamd-Queue-Id: 5421E4EDB48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-37103-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> On Wed, Apr 29, 2026 at 11:00:47PM +0530, Radhey Shyam Pandey wrote:
>>   additionalProperties: false
>>   
>>   examples:
>> @@ -156,3 +193,30 @@ examples:
>>               };
>>           };
>>       };
>> +  - |
>> +    #include <dt-bindings/power/xlnx-zynqmp-power.h>
>> +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
>> +    #include <dt-bindings/phy/phy.h>
>> +    usb {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
> Please follow DTS coding style.
Thanks for the review. will fix it in next version.
>> +        compatible = "xlnx,versal2-mmi-dwc3";
> I really doubt that DWC3 block comes without addressing space
> (registers), so either you just misrepresented things, like created a
> fake block and syscon, or forgot to combine DWC3 with the wrapper.
>
> And if you built with W=1 your DTS you would see errors. How do you see
> it now? Where do you place it? Wrapper must be outside of soc, but DWC3
> child must be inside. Did you read submitting patches and writing
> bindings documents?
Apologies for missing the DTS sanity check earlier. I am summarizing the
problem statement and possible solution. Please review.

For MMI USB in current implementation it need a parent/child
representation. However, the parent IP is shared across DP, USB,
and HDCP, so it cannot have a USB-dedicated parent reg space.

1. Versal platform
   - Parent: USB wrapper IP → has its own I/O space
   - Child: USB DWC3

2. Versal Gen2 platform - MMI USB
   - Parent subsystem combines DP, USB, and HDCP in a single I/O space
   - Children:
     - USB DWC3
     - DP
     - HDCP

To model the Versal Gen2 MMI USB parent register space, I introduced
xlnx,usb-syscon, allowing the DWC3 driver to access parent registers
via a syscon handle, addressing the v1 review comment.

However, making reg optional satisfies schema validation but fails
DTB checks.

versal2.dtsi:1: Warning (simple_bus_reg):
/axi/mmi-usb: missing or empty reg/ranges property

To fix it i think we can switch from parent/child representation to
flat DT representation for the Versal Gen2 platform, similar to
existing implementations in qcom,snps-dwc3 and Google Tensor G5 DWC3
bindings[1].

The Google Tensor DWC3 binding uses a syscon phandle to access USB
configuration registers, which aligns well with the Versal Gen2 MMI
USB IP, where wrapper subsystem shares a common register space for
USB along with other IPs.

If this approach looks fine , will create binding for MMI USB using
this flat representation and send out next version.

usb@fe200000 {
compatible = "xlnx,versal2-mmi-dwc3";
reg = <0xfe200000 0x40000>;
xlnx,usb-syscon = <&udh_slcr 0x005c 0x0070 0x00c4 0x00f8>;
<snip>
};

[1]: 32bc790a8e49 dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
>> +        clocks = <&zynqmp_clk 32>, <&zynqmp_clk 34>;
>> +        clock-names = "bus_clk", "ref_clk";
>> +        power-domains = <&zynqmp_firmware PD_USB_0>;
>> +        resets = <&zynqmp_reset ZYNQMP_RESET_USB1_CORERESET>;
>> +        reset-names = "usb_crst";
>> +        phys = <&psgtr 2 PHY_TYPE_USB3 0 2>;
>> +        phy-names = "usb3-phy";
>> +        xlnx,usb-syscon = <&udh_slcr 0x005c 0x0070 0x00c4 0x00f8>;
>> +        ranges;
>> +
>> +        usb@fe200000 {
>> +            compatible = "snps,dwc3";
>> +            reg = <0xfe200000 0x40000>;
>> +            interrupt-names = "host", "otg";
>> +            interrupts = <0 65 4>, <0 69 4>;
> Why these are not proper defines?

will fix it in next version.

>> +            dr_mode = "host";
>> +            dma-coherent;
>> +        };
>> +    };
>> -- 
>> 2.43.0
>>

