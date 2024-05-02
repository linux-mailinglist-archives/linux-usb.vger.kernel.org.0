Return-Path: <linux-usb+bounces-9986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FB8BA1A2
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 22:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6658C1F2252A
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 20:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49050155392;
	Thu,  2 May 2024 20:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="egXslU2e"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BB02208E
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 20:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714682394; cv=fail; b=Se/Y9/IwpaFcV7BQvSF7xWrUTHEb3zgSJ88/Ge+TPsJUNqHgDSNGMyhB8FCQlc5N4Y9GvRXPl6JiYR76FQjZ4GJ5es6GDrHUIx4FxCDPJ+e9MOsWy3r55kLBDc7Xd+BOxe3lX9Y6fnXlR35YIEP7uJ1v+pzBYeGQ9t1BQ6e0+u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714682394; c=relaxed/simple;
	bh=utevBbpPYqgu0qhPhYUKo2mYUAUQLP9tdFtG6j5qmZQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BfXEEGhDMPp8IJUY2XLXbDOFCby7s8nbFDXrmgmljnM7AafVeeZuOU0RauRYaG/WPayffnbuTXm3vFmCwfHbFX+HuFS6BNYa8ApDjW56U3F/quuSURYSE+Ou2uYe97xGp80dH06Sqjz+dYG3XXGNDMHrlbbDBgd22zLsp9NkDdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=egXslU2e; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns1GdstVrQwExoE7Zfsc18WupZtH/Yq8FwTIOLEhFsJQUqxRRjJg5bZUM85MzY6YUz/5xrMS/Bx+s1knYpwwDA8XGdlKHCz6Bgl2ER1v2h9zrl18l0c5cgNMms4nUSSrvK/AHYGFIcmIaWBGa14rnD86/0IYIKV/Rvp7+WlAAScvtImGX6G8FV10l8wNx7/K+jENT6pVp3eY+lrfralwC4WOZjDKnVTjmGboxRpDMQxnBNiWGT8bWAJnBpERy4ToV4YkCeOJw2Mxvk+ygK0Ebo6T1gPdtSuTEZf8UKiEa6X8+liblwqs40AtiESC7xxWBq3L++NX5BV1oWPcsxeutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfwCIYPVzXyM6b6uTfcHLGIH+gHEiS/gArk1Jv+byVI=;
 b=kPa1bxK1f8yXMxQTJjz2UpObfnTLwRV2KjtQDge1WQMJxegjPqBOKX+QpmCTLz/N5GOlI//7VyFDUEJcWZOeWg7IkQCzyAMeCTeye+8L9ZiRM5SxYtNZ83EFBSGglEDvOKKSl6YwImpgEm8YU7JXp0+8wP65TnYt6IFCGpR1Ja52/GrAYYNxnE3kqS1amKgHuQ2HFtRctLbpCl6Aa8hQWsXLm4Oe/ficgrregSoaKjG+Chif+yPCNbEoshRcL1TZuFRvcm+iO2Dz+6crrhJVS6q3Du8dtdJs5p8dxY8qlP65rzlgoJ8UVGSWqoLgMdiI40oBTtwvgJVZJJeeuQovIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfwCIYPVzXyM6b6uTfcHLGIH+gHEiS/gArk1Jv+byVI=;
 b=egXslU2eTu5f5mJ7kePNeX2hrrOAK4hIgevlrV0fE+fDQ7mOXuFalUOFJ4fejP4lWoaDQqV1uGAhlIhynNKuNQdE6b0NgGCdge58pCTA1zK2KlBXBXnSaUURVhCi0gFCCta8iOTfmiB12eE9N56QaxoJ3Auzgpk5sD9VYpztPJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 20:39:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7544.023; Thu, 2 May 2024
 20:39:49 +0000
Message-ID: <019c7fb1-92ec-4574-83b8-ef8da299e121@amd.com>
Date: Thu, 2 May 2024 15:39:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] Thunderbolt/USB4 debugging tools
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>, Sanath S <Sanath.S@amd.com>
References: <20240402101020.GP112498@black.fi.intel.com>
 <2024042110-oat-juicy-e599@gregkh>
 <af511b0a-f87c-4168-8f46-8d471a5c36ec@amd.com>
 <20240423053636.GZ112498@black.fi.intel.com>
 <20240423071445.GA112498@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240423071445.GA112498@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:806:121::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf70773-cb1f-46ed-3f7e-08dc6ae8031e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0ZjbVdmZk5qY1FLS2x1dDBCbjY4angyUUcrbzI3RTRwVGhrUU54VklwUC9J?=
 =?utf-8?B?ZmdBbkVHd2lGNjRBK3g3UkJrdVZCbUFQbXlUVFhMU2F6ZGYvbitlN20yV25Y?=
 =?utf-8?B?L1BxN1pzNW1MVzNMTjZxOVVXQk83Ky9ubmFJejU0ZDBDR3NpVU41MUduNkcw?=
 =?utf-8?B?cEVHdzVJd2IyY2ZKYndpQStaMnJQQkpQZU80WFpwcCsxcm9vK1NsVUthblA3?=
 =?utf-8?B?Zzd4bDZaczloWUI0cHc1emZKR0pPVnA3WUJaNFgzTC93Qm0rOHl6RG1FUUhs?=
 =?utf-8?B?aGVQRjRZMlpmOXdkSUU4S3hmallKeTUwd0FSN0tjaXVsQThtY3VTbHpGR0ov?=
 =?utf-8?B?VnFTR0FXenp5b2g0MTVDSXdaQnJkZTZvYWxmMzExeGlndXB5bS9VWjVmbC92?=
 =?utf-8?B?b05jeFVpcWJ1bWRXM1ErVkNwZE9xYUpHaFpYdHF6d052ZnpSNXZMWldCUnBK?=
 =?utf-8?B?SzlRYkhMdkQ5UUVwYXcyMUpBelRnWWFQQlRabmlDaWRFUGdKMGZ3SGdFT1U1?=
 =?utf-8?B?YVBsTEh3RW9DNDNhOTh4cytZNUdVcCtlUmU1enF2b1VIMHoycUttZk9HV01z?=
 =?utf-8?B?bFJCKy9lTGJIVXFxME5JaTFiWDkrN2NzN1RQcWl6U0J4OGhrTklaOERZMXNs?=
 =?utf-8?B?azhpaWdsR3g2VXpObGg1SGdVK1NCUTNEMlJqVHFaNXVab0tmUWJiRW9zNmhI?=
 =?utf-8?B?NDQvN3VCSjRMTTVWMEpmVTBOVDNPUitOVjF4bTE2aXl6MVdac3k0SCtEbVBk?=
 =?utf-8?B?cE1GU2JtNE1YNU04cjRlcEhkT0ROeFJjaGVROU92cmRXVmpvNWx1K0FHRFg3?=
 =?utf-8?B?UlErMVUwNW05dzFUM3Y5Szk4K2NTNDd1NXZIejhpdkZETGVNNEcrWHpCSC84?=
 =?utf-8?B?QjN5SnJHaEdtVVRuZUUzZW52VlNWOG9nNHlVUkxPQmlqdTl3Q3NYQzJMeVBq?=
 =?utf-8?B?aktHUGNUYXdoZmVpdlI0VitFVHhvVEJLQkVYMEpJbmMxOTdKL3R0Q3dmZWFB?=
 =?utf-8?B?MkJ5SVJGOVFSS3VqUkM4N2lSVk1wQ0w5VzRnREUyMXBNZDhzcU9UcHpSUGdU?=
 =?utf-8?B?ZDhsbGw3VTFzTlYwblVoZW5MUzE5R28zT3VmaWR6eitNUkI3bG1DSWRNcU9T?=
 =?utf-8?B?Zk04bXN0S1kvTFJhdm53cTdXQWpaNmc4WmZvVk8ydG1rRnl6QndoT2NWTW9j?=
 =?utf-8?B?WTVHNjRzWVgrM0Y4WndNTStsOFRxS2UrSUd0QldadUxzbHZMOU4vbjNOSFBX?=
 =?utf-8?B?UkUwMWpnbzBvWDNsazJOWU5hT0hQYmpYM2F5NHJJK1RPV29PWVRLVGNMSkoz?=
 =?utf-8?B?bTV3SVFqNGVBcE0ySkJBWktHZVdMZW1nN2F5WHQzM2wrZlZxdlRWYlN2bXNo?=
 =?utf-8?B?S2l3aG0vUWxVbkR2cUx3OUJLUmRmSFNHcmxScUJDUkc2RFY0TEpCanQ4Mk8x?=
 =?utf-8?B?R0QwZVRmVTQvbm9ibXpBRnFURUFhT2Fzd3dSeUMrdkZyY2pENUlXUjJzdnpP?=
 =?utf-8?B?b0MzNi83Yk1KZi9qT3BLNXo2a05BQnF5Mkhra3ZoWVcwVkthMUlqYVNMRFpI?=
 =?utf-8?B?UjJ2a0F2Sjl0Yi9OS2p6MUFYVGVzcDAxQnlxaHlGZTRDOGlBdnY5SzhML2Jv?=
 =?utf-8?B?VVVZaFdNVzl5SXE4amJtSTAxdnE3eWhYTjVHbll4Z2hYQWJzRzNxaVc3Q05o?=
 =?utf-8?B?dVJWRDV6SUFIRG5rUFB3Zi8zRE5hTXQvYStSQ0RSZ2V6VEM3SXlUSm13PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW03R2tEM3l5T2lmTFFkV09EajEwNkJFQnROMGFpaXphOUlIeUhIRXNlSlJ3?=
 =?utf-8?B?b1dHcUhmZG9sNnRwbkU2U3kzSitVY0MwK01jY3hzbjZ0Q2JnYW1NUGNDY0Fp?=
 =?utf-8?B?UFc3am9ZVDhRbEdpMTdkSWliODhBaVlJT3JreUY1eGx3ZU8yNHBtNXB1RXlt?=
 =?utf-8?B?VWlyVkhWTHpBbnRXRmFZL0I5OWVtSFoyeDVhSGhOOHl2d0x0TUtsa2ZiaE4y?=
 =?utf-8?B?TjFBYmdsVG5tZ2hRdHVscTlwbUVDbi9TNEwvblc2NElqL1AyUTdteVlkeHNr?=
 =?utf-8?B?WGVjek42WlNqQ281Q1BJRGRoSmtMU09JeEhLclZ3Rm5LcytlQmgxWjQwYmFs?=
 =?utf-8?B?L1V2UFJQcjk5aDJrUzdyako3dUhxbmRhQ0FnMVNvMjdLRnZ0RUVkS0x4emdU?=
 =?utf-8?B?V291a29nYmt1ZmhOUmFkV0gxSnZZMzYvVE5BazZqS2tRQS9mOUtzMFltdTZ2?=
 =?utf-8?B?bnFDU1B6RXZKSFJrdWNUN2lUZ3duME9rWFJjS0x6UXJ4QmtCQ0hNa0pQeWwx?=
 =?utf-8?B?Tk03TWFxWmR3bFFXRnRFdVNpM2dML0Y2QmZyNVQwMjVCcE9DT3VFeUUzZ3M0?=
 =?utf-8?B?Z0hNYTh6K1JTalAxOGV5UGJZQ3Mvam0xS2R3S3dqL0E1Q0k3YUNyMUk2ZURs?=
 =?utf-8?B?QnN0ZGFxMjZGRnNvUElLNGdOUkxVWi90OXloUzJ4ZU5JdElUMmp5TUI0dFg2?=
 =?utf-8?B?Zld0RVg1dFhDbU1FN0dTMWNBeTdqSUpkcXlzdEFxaENhSEJ5V2xhU3VaTDdn?=
 =?utf-8?B?aThMWEdSYmdDaTB4VXFzUTgrR1BIQ3cvZDcxMEQ5dU8ycXJQNmFDQStBMkcv?=
 =?utf-8?B?RjhWWDZXOHZ2OVdHTTFjZjduZm1WTkhySmtoR1U2dmFCREZ6NCtUY1E2S0FP?=
 =?utf-8?B?VllUb1NQdnc0MUlTUXlrV2xqS0lqQVpiMnBtcjRPUGdDVXUrR0ViY01mVTJi?=
 =?utf-8?B?ampuNHJNT2Y0czR6aW5IaC9XSnUxUm9RZ1VFc0tqRkN4MWR6dG1vVzNqei9X?=
 =?utf-8?B?TUk1dlRCaWNQRFV3RnRQWDZpYW5yOFNadU8rSzFIWmZYZWg1M2o2Z2tpV2Mv?=
 =?utf-8?B?bzJkNW1xbEo3am9zSVE1TlZPM251dU5kRC93bFduMDkreGtGdXM3Vm1FaFQ2?=
 =?utf-8?B?anptQVY1aVpEaDFRVUZLWVJ4Q240bmpwQVZvdkdlZ1pPcUhtNHgvZ0xDd29s?=
 =?utf-8?B?djJETHZpWHo2RFQ2c3MwenVsTkpSZmV6T0xIL1BMd3FubzVQdVF3QzBsZ3dj?=
 =?utf-8?B?bUFRKzRZNXAzbUZMVkV5cENSMXoxWmFUNytpRFVzQmZTUGJkU0Y1N1VVODhE?=
 =?utf-8?B?OEJnakNmQ2JRcWYxd3ZoMUIyYTU5RDZiNTU3OHRRRVdVS2YvWDdpbXg0b3Fj?=
 =?utf-8?B?T0RzRXhWT0NHK2VLVE1sWWtkVXkvci85OG84UVhxWk80eU10RnZiWUdGb2tL?=
 =?utf-8?B?RW0vL2l0SFVqazJ6R3I3VkZ1T2U0L2VqbzJaRExXTnRxcDJsS3I3dzRlclZJ?=
 =?utf-8?B?ZWZCT0FvZzFTdEJ3aXVXalBFZ2o1YkUxRGswRGQ3c0lXVHRqTFY5ZUpXOTVM?=
 =?utf-8?B?bGRLcmRucG1oN1gxMC9KeW10Y3NZc2RjUlZSK0JONWNtV0J0d25vbmN6SkZU?=
 =?utf-8?B?Z3lSaGNTbTNrWDJRSWFIZUZPKzIvZ2xQWVF4Y3dVTm5JRmhhQ1ZHNzQzUzJm?=
 =?utf-8?B?c3Z4VGdYZjZKcmNzVzVYN3FjWUVxNlVYN3ZFL2I4eTEremhkMXFreGZrTFNK?=
 =?utf-8?B?ekF2K3hHV3o3SXZOQlVZSVA3WitHall2WDhlWlBEMEthTERGQTZ1N2U5aklr?=
 =?utf-8?B?RHhkSVU3ckE2SWhQMWdvUUNnM042WUk4MDBXcTluUGxZVGlJRXVJSDRDalZm?=
 =?utf-8?B?RVZxZXhpZHpYRVQ2Ylh2eThwVWlJQnJxeklvdFhPeUJGR0VoWDVRQ2t5UW1L?=
 =?utf-8?B?U2tHV1JmeHk4NWQrcFpuYjNLdEdQQlppdTMraXhVMmZxeHJSN0ZqWEtPc0tQ?=
 =?utf-8?B?RHl6aCtvQ2ZIcGIxMFdUQkxJZTRBRktRWjJ4US95N1FYby8yNTl2TjVqSDQ1?=
 =?utf-8?B?TVZlRzFKZDQ0d2hMSC91U3NOMmtLOXBIeXJCR2N6YVJQemp5WlY0bm16aldv?=
 =?utf-8?Q?KFWvcO6rnIVYPW5O0iOsr3ngv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf70773-cb1f-46ed-3f7e-08dc6ae8031e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 20:39:49.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OT78yoVQpZzUmrsxmYGyDAqR+24aVKnB5+K/iBrfibQzuUiPby/43KxV1z5L4EfFZ9sRiwG3SsPAAu4hqzijnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897

On 4/23/2024 02:14, Mika Westerberg wrote:
> On Tue, Apr 23, 2024 at 08:36:36AM +0300, Mika Westerberg wrote:
>> On Mon, Apr 22, 2024 at 09:36:24AM -0500, Mario Limonciello wrote:
>>> On 4/21/2024 05:27, Greg KH wrote:
>>>> On Tue, Apr 02, 2024 at 01:10:20PM +0300, Mika Westerberg wrote:
>>>>> Hi all,
>>>>>
>>>>> This is mostly for the folks developing and testing Thunderbolt/USB4
>>>>> driver side of things but may be useful for others too. Not intented to
>>>>> replace anything we already have for the regular user stack.
>>>>>
>>>>> In summary this is a collection of small tools that provide bit more
>>>>> user friendly access to the sysfs/debugfs/tracefs interfaces made
>>>>> available by the driver. Mainly useful for debugging issues around the
>>>>> software connection manager parts of the driver (although some of these
>>>>> work with the firmware connection manager too). We have been using this
>>>>> internally for a while.
>>>>>
>>>>> The repository can be found here:
>>>>>
>>>>>     https://github.com/intel/tbtools
>>>>>
>>>>
>>>>
>>>> Very cool, thanks for the link!
>>>>
>>>> greg k-h
>>>
>>> Yes, thanks for sharing!  Is it worth adding a link somewhere in kernel
>>> documentation to make it more discoverable?
>>
>> I can't think of any place where this could belong though since this is
>> not meant for ordinary users (so I guess admin-guide is not good place
>> for it either).
> 
> Well maybe as part of the Kconfig, something like below? Does that make
> sense?
> 
> diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
> index 279de1ba4487..0abdb69ee9f4 100644
> --- a/drivers/thunderbolt/Kconfig
> +++ b/drivers/thunderbolt/Kconfig
> @@ -22,7 +22,11 @@ config USB4_DEBUGFS_WRITE
>   	bool "Enable write by debugfs to configuration spaces (DANGEROUS)"
>   	help
>   	  Enables writing to device configuration registers through
> -	  debugfs interface.
> +	  debugfs interface. You can use tools such as Thunderbolt/USB4
> +	  debugging tools to access these registers. For more
> +	  information see:
> +
> +	    https://github.com/intel/tbtools
>   
>   	  Only enable this if you know what you are doing! Never enable
>   	  this for production systems or distro kernels.

WFM.

Feel free to tag this into the proper patch when you do it.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

