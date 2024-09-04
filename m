Return-Path: <linux-usb+bounces-14660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A77AE96C58C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 19:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB45C1C21F5A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 17:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2DF1E1328;
	Wed,  4 Sep 2024 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4TAssbGo"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D576E619
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725471503; cv=fail; b=suvlD616JqXFRwS8/GM+o/nwHAc1LoYpjEixwt5QyctLkf33NDSLhQUMcDR0AiVrRpiOIrpx+rL4ZRbotyRov5rHi3SriTD4wRl0zD85Och0oLbdvlODtEKZ7TDx+4qtRjOZoPeUGcPsyXOEmdSOpsMplCDQ3Wow6+eCKrck1qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725471503; c=relaxed/simple;
	bh=OecEHo4jeJIyLAIO3zx4/zSSphuxiBuF207sJ7o+63s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b4CezF27ji8o7HSaEbQXghWbiIYmLwkRfLHK1u8T//+2Z0RGXTZRD+/5dUj1pajgT4Ng+AVZZOkrpaaqAL59z7tr5JsoXwYXUvL9ZS/nwTL+K1F7pJtqUHSwuGEvYLXSBlPNDgwjQMBg0GMKqEr10vjt264XQdJdxK8n7ApDDc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4TAssbGo; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrDstxVY8eyn4dMWJYLIB/v0al3n/SBqe0j33/XMAHQ3vh09HwWgHEQnJGMNzODsLCH8XwHh0AmFEIde77Papc5IOMLViaNJ7E2IU6atrg4PI9hR1oaEpiWpt/iQiNiWc37BG+iucc46dUA/1w+9oLtzc1l6NDG5rT4GP6biMJwUZ+5VAMAMJ4UAT2auYbb5X1TwGBm8cZpExXk63EGb/1ZJJ0P24dq3Mj6rKjnuhw6K0HJ0gw8JR5VCTCGt0FcpFjrDZYQ/cw9l/lWTXfFw16BCIt/XEyvJEiOlugF5EApFwrIMUCgdLcIruhWMtfkd8XZgd0wEI8ATI+OzrR9YvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0buLN57+ryy8I4tlZ6nCNXqe0csG4hUAwc864zrGzE=;
 b=WSNsMXfr0gd27MPD5GGjLl6AO1KRJHNYogaqGPSjvHp1o5yEgizkArBtZto5gHemM+64hXcgafrgGMGg+J8O7nSZ+tOOVGLebabY0dv+4N1txisu490O2KLJWKIcPJLU6Q23yLPJTGUmhqS6iJ93eQKM6oZxy5cAjytaj/QiCK2p8OChBOybWP20X+cVg9TzopeAs/g9IiTIZuFvHAhTU2qPkYfydd131XF2Yir91bJNsRJe/oLdMfO7VBrutLSKPe5VtqsyjSxLzbWtlvcxieC6/ZGKX670sZcaDoiNcirDkuoRULcSGg6cc4n9F92iG7FSPGpYeJzHJAkq4nJemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0buLN57+ryy8I4tlZ6nCNXqe0csG4hUAwc864zrGzE=;
 b=4TAssbGousTEWlU5IsoVuY5LvlMnSZQRQU2zSggwb4QXF0wfaC4HhYKYcq1GAC7R/Cg8Vw99lHSRsFVMcAfnyZ3GYyqSuE0xIsO0NURda7SRxU6FKYprmr+UR9cRdfQz+DYIV8ASl8vn+4UMihtPB/4s59bujLsrUsWkJx9iDwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8933.namprd12.prod.outlook.com (2603:10b6:610:17a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 4 Sep
 2024 17:38:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:38:18 +0000
Message-ID: <7a3fc5cd-1705-40ab-8d93-d9f286009aa7@amd.com>
Date: Wed, 4 Sep 2024 12:38:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 "Rangoju, Raju" <Raju.Rangoju@amd.com>, Sanath S <Sanath.S@amd.com>,
 gregkh@linuxfoundation.org
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
 <321cf204-cf74-4f51-8ed3-8c5738444359@amd.com>
 <20240904050013.GZ1532424@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240904050013.GZ1532424@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 57be9f53-0fef-47c8-b79f-08dccd085cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnUrWndXaTJqZm8ycnZOUEtHbjkxOVlmaGluTTk2WkZSVFEyUWFHNTNrTmoz?=
 =?utf-8?B?U1dqL2R4MDZmZmhLdU5nS1dxMGNZek05M01wWms4NENFKy9LekFhM0dqdllB?=
 =?utf-8?B?RjR5aGtFU05lNVJxeUZoak5NdytOT3lQbHVkMGZGNVZWcU1DWTQvUktKb1JG?=
 =?utf-8?B?VVV2QWMvNWZlUFdNZUl2WTRkTWRSejVjcDJJYjZ3TmpRZVl4WjFsMHFKOXNv?=
 =?utf-8?B?ejNqNkc2MWcxSzV1RzNTaVNaNVNMSmV3YmZRRTJwbUczRmZMcEkvT0xnaEJF?=
 =?utf-8?B?MlJ2djlaa0pCVTg1c1RwVGhqOEt6ZzlRdmEyeGVFc3lXWVgzOVpjMlFZd2lY?=
 =?utf-8?B?ZytLbHRGa3VaZEcva2ozTzl2NDYrbWZiU213Kzl6bzJPS2YvUnJqeHNtZ0x1?=
 =?utf-8?B?YTd2M0xONklXS0lZU3hIc1hvWStWdkwxQjBNWmZIa0ZZUFFqL01UUFlBMTA5?=
 =?utf-8?B?dHNuQXRscWthTC81OE12K1ZXblNUSjVCR1NrV1VleWxldEUrK1dVcURGZUp5?=
 =?utf-8?B?Q1Nmc0NuQVluVFpYSHNXREtBTXNEQ1EreUE4a09LbHN2aDZhUitWTzNtTGpP?=
 =?utf-8?B?UHpIYzczb3dIbXJLVTcrS0RNMCtaZXJCZUZHd1lpZ3J0aE5XYWNrd1d4MS9V?=
 =?utf-8?B?SzA3Kyt0M0QwTWtnNHhXMCt4WXhWQ2dEUVE1L0ZLMnd4ZVU2M3R3SWZveDVm?=
 =?utf-8?B?amtlb2ZzVFQvQWcxc0pkS3NBcGhwczJ4UExsU2ZISTU0eVVkbmNYVFVpWVk2?=
 =?utf-8?B?aGcwdzBQWC9iVFJKcDJGVDBUSnZYRXJQbXRQbFdUQjAzUUxXYndVcWNlaDE5?=
 =?utf-8?B?eHByOGI1aFAzNEFXeEZUbkNiUFFKY1Z5bjFoVUxkUGtzNHZaNUswbnR0QlhF?=
 =?utf-8?B?Sm9sT2drNE1IWHFqN1ZuditzVU51WUlOVnQyT1ExNnA1MnNWODZ5K2ppYndT?=
 =?utf-8?B?OGFhZGgrQTFtYUxpa25DQjM3UFZEVkRPWVhpMmFsRDhZVU1yQm1Mamp2cGor?=
 =?utf-8?B?ZFVGcUlSTDgvVFM3M3YrRDRKS3FKNFVhZU9pN0gwVG5hQkdKUlVCVXNRVWpv?=
 =?utf-8?B?TEdoQzlPZkkvQ0hiVENZOVRWYlVBOCtoWERuZEFSY2lUVmZaU3daTEdUaUpW?=
 =?utf-8?B?OEU5MFhsRWQ4bnVCWjBpTXFNTUQzSzdmMXhreER1Wms4amx2NGhlak4zd2lt?=
 =?utf-8?B?L3hEU0ZaZ3NVTStLZEhYV042RmJ0SjhlLzUwSis2bUM4ek5WTys3eis0eVBv?=
 =?utf-8?B?TkhyOTN6MXVBMG1DOGdaYkpTaGljL3FRWnJNeW1jemhpK1JPR1dEc2oza0hC?=
 =?utf-8?B?U3c3dGh4WGRBeWgrUW00RUlRaFo5WkViMjU0R0kzOFBuTksvNTUxemdnUlJI?=
 =?utf-8?B?U2xnZTV5V05FZVJFQ1pqQ0M1bWNzM2V2M2VicWpuVVI5VFFGVGtTSHhIQ0tL?=
 =?utf-8?B?ZHpTOVRWTjJVd0dzVDlscGlYOWErdmRNMTdKNG8ra1pRZCsxUldLNXJXdmJl?=
 =?utf-8?B?Y3JmMlZPYnZ4UWhDMS9WTlIzdEYySWYyTGxjYWZpYmJ0RVFNNnI3RFBRTklQ?=
 =?utf-8?B?RDFMNnRFaHBKNVdoRWVtUm13MFVzVlVVUmFtME00UE5oMVp2RlZtbnZUeFZC?=
 =?utf-8?B?WXhzanRYMnY3N0h5OGg0ZVRzaEk0eXFBN1VLTGJMb1U4aW8yUDhick9DYm5t?=
 =?utf-8?B?NjEvQUdUZnhTR2t6RnhNS1Qrc2phUkVMTkp1MXBVaTRrWGczN1NraGpGSk1B?=
 =?utf-8?B?NGJlTHdWNWVEOWtQS3ZBVG5FbkZ1cmVyVVRNTjFlU2FtVlpzVzFmakc5Mm5k?=
 =?utf-8?B?d1BhVGp5ZVJ6aXduMEVndz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk4wdzhwRng2RmZ2RStpQk5KNXV4WE1UcFRuMXgwekE2QjRXamxickZWdnlt?=
 =?utf-8?B?bWVhV2JrZEpoelhZYkpMczFoWW1XcEdMYThCZnp1TUVIUlZNczRodFFhMDJu?=
 =?utf-8?B?S2VpYVFKRDlkeTZHRlRBeVlLc3N2TDhoTUtHdmxkc1dUT1hXdW5OQVU4VCs1?=
 =?utf-8?B?bW9ZK2tRQXZ2ZzVOd0lkYkdJa04vQjh2MGdyNW5wcEl5K3pkRHMvcXdmRkJl?=
 =?utf-8?B?ZEV2OE9nTGlDSlJSN1YrbUZRSzkvaVVOay9IWmV1alg4SjVrdklELzBpZ0pG?=
 =?utf-8?B?OUs2cVZpMDRnR1c2TDVnaXFJZ215QnhGczFBSnJsUUdpeU9GY0xKOWdPbkRa?=
 =?utf-8?B?Q0N6Uy92OUZhN3BoaW9VaXBPa1RRdCtlYVVsZFgrQTExMnFhVk1EdWRtbFpP?=
 =?utf-8?B?N0tyc0pzbzN0eWVYM2pvV2VKY3FkWFhNUm9lV0cvQmdidmVSNkRoRC9jZzVE?=
 =?utf-8?B?RHlEZklKMW9rdGVEU3RCSzhnemNSY0VOT0R0VWxqVS9MQ042aWpxUUs3b3hM?=
 =?utf-8?B?emdRbDhUYTJJRktJWVlHSWpoTHh5VTIxd3o3UXdjMDUxSUZiZ1pVWFMyYy9H?=
 =?utf-8?B?Wkg2UkViK0UwdlplS1dCT3FTZUZnMi9aTWFldklHTFZSNCt1Yk82b2FtWjFG?=
 =?utf-8?B?UjNWakRqUm9Hb0lYVXZoeVVoay9xOStRZVZIeW0wV0ZXcmtwRVdETFQzd0Fn?=
 =?utf-8?B?VGUzS2w3Qm1yUVRxbCtiZ29pUXRkMTROVnp6NVZaeU50NWk5NHRKdjROVnM5?=
 =?utf-8?B?cStVaDlXcjl0TStCcTZTeWxTQ0lMM2JIS2ErNWFialBYN3JzQmhkYUh5U3BS?=
 =?utf-8?B?VDEyZlRsWERnUHdSTWd0QSt3MFJYb01NWFZibVhwYis5U0R0OVhlZFBYdkJz?=
 =?utf-8?B?Qi9ta1hSZDRlbGZDZlRmMWR1dVpDb0ZvdDUycXo4TS9xa1ZwZ2I4LzhRclJv?=
 =?utf-8?B?bGx5a3BoUmpCbzc3NDlyb2FNblVIbUduZXBRRkVFUGttRW55VnRTeTBSc3Av?=
 =?utf-8?B?NnduaHVSZU1BQ0ZKdi9YSEFyS0p1UmNSb3NJckxSanIyTmhrY04wenJvbWNZ?=
 =?utf-8?B?QXA3QjRMVTRIWmpkVGxUK2VlOEplNi9sUDBBamVvcnN5SFR3a3A1WFBybUtv?=
 =?utf-8?B?aHBRZ1g2M0JINVhkTXRCcmtrclVMYUV4S2VVajhIQi9WZlhacTJlMEdUdGsw?=
 =?utf-8?B?c3dHbTJ1K3A3RC83UVNIRnUydGt1MXowb0ltc2RzL3JpdnNNRjJzU1Z6aVAr?=
 =?utf-8?B?SjhCeHNWb1BvTjJvcDNwRDR6UDF5UkJ2alNOQ2dFNkNHYVh6S2RTbjBGb0g3?=
 =?utf-8?B?Ym5CU1RyZ0lGeEdHN0pwcWFvVDhQSGtGTFk2YXNNeEVkaDBBa3NpQjYydjI2?=
 =?utf-8?B?REszQ09XbWNOS1FLNVR6RlhNT0JpS2E1MTR4bUw2aDE4LzNGQVVYMzVwWDhw?=
 =?utf-8?B?b1h6NHIxSm8xTUFZMWFrb3NmUmxPUmVOYngzU2VxajR5c1YvNS8vdllIa2dv?=
 =?utf-8?B?NVJ3cXZCZkxGUHAxdXpkR3ZZcnhBSTNrZ09UQkdsNnNYdUFlZldYZXlkZjll?=
 =?utf-8?B?ckZYS0g0QnV2WDNPWEdHSnlJa3BSRnhxNlBwRUY5TEhYeXlSQTdXT2FqLzNB?=
 =?utf-8?B?UXpzQ0JaNmZOWFRTZ29uMEcwcVhyL2pXaWlyeDZrK2J0WGIzeDMzNlRHVHFC?=
 =?utf-8?B?dThPVmNjYSswR2Q5dE9TSThtL1BZcTdlL2l5Mk1JeGJLaFFGdG5jRFdyWmlu?=
 =?utf-8?B?Z29qRUxLd3lTWkZZd0VIOUNIbjNwbmUzQUdHVzFxckVVU1p6Uk9WTEd6UjVp?=
 =?utf-8?B?aUlibEN6dXp1cmxSVXBuL2s4NHc1Qmd6bXZWaDB1VFVQbktOWlpWRWlJMG02?=
 =?utf-8?B?eUtwNDNobVJ6NlZRY1J5aVRTNVB3ZlJQNTVIKytka0ZZZC9Wdmk0bjdBYVpo?=
 =?utf-8?B?NjdDRWxLUnowRTVuQXpMRm9JbUpNejBZdjJzTVB4YTZacThmQkNuRldlNDYr?=
 =?utf-8?B?K2p0UG42VHlML21SV2FWYkw5TTl2bDR4bGd1Ni9pdmtKVUZkVXlHZFFrRmtt?=
 =?utf-8?B?bUs4ZWltektLQnZkYXJPaVIwQmYzRk9QQmhBbnl1NWFjNlR3OVVBaEhvTWFs?=
 =?utf-8?Q?exRdzDz9Gekw3R1/JH6Wy0d9H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57be9f53-0fef-47c8-b79f-08dccd085cf6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 17:38:18.4922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gZPNijRo60S0Tx8UUXinPHM/wXoi8op2izuu0xQoZQP/ohTZcL53a9kjwx+8LxWM8OyugPBVlrpN20hir82/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8933

On 9/4/2024 00:00, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Sep 03, 2024 at 10:35:00AM -0500, Mario Limonciello wrote:
>> On 8/30/2024 10:26, Mathias Nyman wrote:
>>> The relationship between a USB4 Host Interface providing USB3 tunnels,
>>> and tunneled USB3 devices is not represented in device hierarchy.
>>>
>>> This caused issues with power managment as devices may suspend and
>>> resume in incorrect order.
>>> A device link between the USB4 Host Interface and the USB3 xHCI was
>>> originally added to solve this, preventing the USB4 Host Interface from
>>> suspending if the USB3 xHCI Host was still active.
>>> This unfortunately also prevents USB4 Host Interface from suspending even
>>> if the USB3 xHCI Host is only serving native non-tunneled USB devices.
>>>
>>> Improve the current powermanagement situation by creating device links
>>> directly from tunneled USB3 devices to the USB4 Host Interface they depend
>>> on instead of a device link between the hosts.
>>> This way USB4 host may suspend when the last tunneled device is
>>> disconnected.
>>>
>>> Intel xHCI hosts are capable of reporting if connected USB3 devices are
>>> tunneled via vendor specific capabilities.
>>> Use this until a standard way is available.
>>>
>>> v2:
>>>    Create device link by default if xHC host is not capable of tunnel
>>>    detection but the USB3 ports have tunnel capability reported in ACPI
>>>    _DSD object
>>>
>>> Mathias Nyman (4):
>>>     xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
>>>     usb: Add tunnel_mode parameter to usb device structure
>>>     usb: acpi: add device link between tunneled USB3 device and USB4 Host
>>>       Interface
>>>     thunderbolt: Don't create device link from USB4 Host Interface to USB3
>>>       xHC host
>>>
>>>    drivers/thunderbolt/acpi.c       | 40 ++++++------------------
>>>    drivers/usb/core/usb-acpi.c      | 53 ++++++++++++++++++++++++++++++++
>>>    drivers/usb/host/xhci-ext-caps.h |  5 +++
>>>    drivers/usb/host/xhci-hub.c      | 36 ++++++++++++++++++++++
>>>    drivers/usb/host/xhci.c          | 14 +++++++++
>>>    drivers/usb/host/xhci.h          |  3 +-
>>>    include/linux/usb.h              |  8 +++++
>>>    7 files changed, 128 insertions(+), 31 deletions(-)
>>>
>>
>> Hello,
>>
>> I had a try with this version of the series but I'm missing a device link
>> from XHCI controller after applying it.
>>
>> Before series these are the two links (6.11-rc6):
>> consumer:pci:0000:00:03.1 ->
>> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1
>> consumer:pci:0000:c4:00.3 ->
>> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:c4:00.3
>>
>> After 6.11-rc6 + v2 series only this link:
>> consumer:pci:0000:00:03.1 ->
>> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1
> 
> Do you have device connected? The link will now be created only when
> there is a device router with USB 3.x hub/device connected.

Ah thanks for clarifying.
I connected a TBT4-UDZ and I see another link show up now.

0000:c4:00.6/consumer:usb:8-1 -> 
../../../virtual/devlink/pci:0000:c4:00.6--usb:8-1

However, something seems wrong with runtime PM when the device is 
disconnected.  Let me show you:

❯ ls -l /sys/bus/pci/drivers/thunderbolt/*/consumer*
lrwxrwxrwx 1 root root 0 Sep  4 12:33 
/sys/bus/pci/drivers/thunderbolt/0000:c4:00.5/consumer:pci:0000:00:03.1 
-> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1/
lrwxrwxrwx 1 root root 0 Sep  4 12:33 
/sys/bus/pci/drivers/thunderbolt/0000:c4:00.6/consumer:pci:0000:00:04.1 
-> ../../../virtual/devlink/pci:0000:c4:00.6--pci:0000:00:04.1/
❯ cat /sys/bus/pci/drivers/thunderbolt/*/power/runtime_status
suspended
suspended

(connect dock)

❯ ls -l /sys/bus/pci/drivers/thunderbolt/*/consumer*
lrwxrwxrwx 1 root root 0 Sep  4 12:33 
/sys/bus/pci/drivers/thunderbolt/0000:c4:00.5/consumer:pci:0000:00:03.1 
-> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1/
lrwxrwxrwx 1 root root 0 Sep  4 12:33 
/sys/bus/pci/drivers/thunderbolt/0000:c4:00.6/consumer:pci:0000:00:04.1 
-> ../../../virtual/devlink/pci:0000:c4:00.6--pci:0000:00:04.1/
lrwxrwxrwx 1 root root 0 Sep  4 12:34 
/sys/bus/pci/drivers/thunderbolt/0000:c4:00.6/consumer:usb:8-1 -> 
../../../virtual/devlink/pci:0000:c4:00.6--usb:8-1/
❯ cat /sys/bus/pci/drivers/thunderbolt/*/power/runtime_status
suspended
active

(unconnect dock and wait at least autosuspend_delay)

❯ ls -l /sys/bus/pci/drivers/thunderbolt/*/consumer*
lrwxrwxrwx 1 root root 0 Sep  4 12:33 
/sys/bus/pci/drivers/thunderbolt/0000:c4:00.5/consumer:pci:0000:00:03.1 
-> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1/
lrwxrwxrwx 1 root root 0 Sep  4 12:33 
/sys/bus/pci/drivers/thunderbolt/0000:c4:00.6/consumer:pci:0000:00:04.1 
-> ../../../virtual/devlink/pci:0000:c4:00.6--pci:0000:00:04.1/
❯ cat /sys/bus/pci/drivers/thunderbolt/*/power/runtime_status
suspended
active

I would have expected the USB4 host router to go back into runtime PM, 
but it doesn't anymore until I reboot the system.

