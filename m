Return-Path: <linux-usb+bounces-9575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F08ACF91
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 16:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27871C218E6
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 14:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63581514F9;
	Mon, 22 Apr 2024 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NqRJaby8"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024331A60
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713796591; cv=fail; b=Eby0MK7sDFDiIITgZ9pi6L+ENxiAUiY07fA2gRU2O3pCCCEAz3iu00uFeM9AIPlADQM+aeFWVlHQX0DgCE07m+wI0RhemVqoPxeFFIrS54/XQqXVylu0M0OBEd7UlNIbFuZrvNk/jtAmFMTMmVbD0rUXvFHjzmFpPJqUfRJ4R6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713796591; c=relaxed/simple;
	bh=pbitmJkZQj+jePBTcDNOIW4IumHAdP4s5Q1nFwdZuDE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CBDkk1JA152jyqZbadNdOlxe1UvOYkrvNR/FT5/VtDDmAj92MyiG9wHs6obooppuadUM0UKFKR9HYAvkxug4aYSaBGOnm5uWAi2dlmr39E5czROLwxHbbmhYt5R77e6VA4UYtXMZwqMxjcfbvb4c+nzxpF/x+2AlnQFTIhuOIVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NqRJaby8; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLR7AyvsrnYrDkKDQDsO2THcSQVKiXRgB6me8HSteHaaPBMvy89qcNA+/ku0Bep88++9BsnJu0hVdeesgJeVjJIsNhhlc3qzWTtHldApo5iWeUzuPQ0MCcfjadPpbt6S0Wx02vQiW9XznHvKhaA0Ccd8xHY127FCzXHs+2hd0LJxFXiHLkA48u8fEIxonfmgcAzf6s+M3ZaBV5H4N/Pg6ZgSvgqz/jvrTGC/ia3Muyxc6ev0d5Dcwf1bLXOSlg1TbLvCZCA6jtEP2XkcHrmRthyzw0MpyKs7ghJh55bse4oqRf5em23yYeaBevZg3N55zqnMUxT+PrpIsUlNkaEXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWBkuqxqzB8mG+aatz1gaERh1nP26LrVd6Ko0ydWpGw=;
 b=hOkZJohdgft5uI5LYwT7fXyO782DpjUjU9duhZQnHGHWHJNFUPToyioA2on9irX2bCnELKH2hK3dT/7jq2YKR5krdxcCgTrlTax33FYplNHLMqmnPT3BihUcjqGYGY00V9vx2aFkBImE6iu3blTKbHrx3n4HrR69SFCW2agQIqCshVzgEDTrP3jWnsXJ2Rl9zcG0lzaf+VP5tXxgaS/B1w75kuMP0UBrBbkqur8vx396y4iJ2a0jlUJWJv4Px2jAAqZSm8R5l03MIu3yqajdeJZ3EciFcM5hN6/HLWbb9tvwMBqrPbyUXkIjkyKxY8Vzi87pPZlLz+OrmM5s7TNudQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWBkuqxqzB8mG+aatz1gaERh1nP26LrVd6Ko0ydWpGw=;
 b=NqRJaby8unoPPAbaVErtfo0xlFw2vxT78uYVska35r1TrcvlmSCJzcAnku51x+KnEw3bZwlEqpuFQpIE/j2IyRyMOAv1qmLyWsaSYUorjxxg5Yd5b7EsW6+EOC7sJ5ZcsHD21kMEQY9SKK/FS96FTfEwZcUTJyqKZFAGdSId5JE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 14:36:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b%4]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 14:36:27 +0000
Message-ID: <af511b0a-f87c-4168-8f46-8d471a5c36ec@amd.com>
Date: Mon, 22 Apr 2024 09:36:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCE] Thunderbolt/USB4 debugging tools
To: Greg KH <gregkh@linuxfoundation.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>, Sanath S <Sanath.S@amd.com>
References: <20240402101020.GP112498@black.fi.intel.com>
 <2024042110-oat-juicy-e599@gregkh>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2024042110-oat-juicy-e599@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:806:f3::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 036b4865-813c-4193-3fd4-08dc62d99792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFkxeHFXQW14UXhzVUU4TkxTc0xSNnpNejlFa01mRFJER2JQMDRNYzhHbzRU?=
 =?utf-8?B?SGtSVTVOdHY5OTk1OGVidzRKVmNnY2RBU2JNVTB5b0xjdDczUk9zTDhEWU9U?=
 =?utf-8?B?UTlBL1hVRVZiUjFiVkhubGtZelJmakNKQmhWVEJLa1ZZTTVMVHlRVE41M1VE?=
 =?utf-8?B?WWE5U09lTjdZQ21hQTFVNlZwOTZSMEJka0NpMGMrUWNpTGtSRTd0bUtFTG5O?=
 =?utf-8?B?Tjc4MEx4WGpNUzhVNU1JUVVnMHVhVlpaUG5RNmlNL1VyeDJRSTE1QTJTY3Av?=
 =?utf-8?B?YURIejVNeFV5VWlTeWFEajJWOTBIMGVsclU5dnNIUEZGc0xiOHQyMThCMmU0?=
 =?utf-8?B?MmtsYWRFQ2ZadkdpZmRyK3BsYlZzTjRxSkdlSnNiTjV3RlU5TzhkOFR3bmF6?=
 =?utf-8?B?cnVrVkc4Umo5U2szajNyZ242d3BpWjZLL3poeTJSQ0dldjZZNkYwN0hUSDJt?=
 =?utf-8?B?T2hsc2djaGt1dGF0dzVPaDJBaEZic2JpcmVid1A3dVEzV0dGWjVCOGFiOEEw?=
 =?utf-8?B?dW9objJVcFFnUlRsWWszR1ZIcWNYd1JOMHZhNjl3dFNIVWhRZlRER0JnUkJV?=
 =?utf-8?B?Q09kNEdYbEw2bW1FOENkVURIK0NkU0U5WHpKbG4wNnFDem82TVBtV1RSc0xz?=
 =?utf-8?B?TW8yamhsUC9VZlh2ZWxuSWtDdm1QRjVETnh1SEw0Qm9nZTJNaGhQdlpOdDVS?=
 =?utf-8?B?QW1FbEhsS0hiQjZLTjRXU3JHZk1tWDQwSXV6ckovWUpDR1cvOG1aU3RxTG5D?=
 =?utf-8?B?c1JBMmRTazluYk1QMTdhOGdVRU5PWmg4MU5CTmNhYklBdmpVNnBRZURmaElE?=
 =?utf-8?B?YUJhWVpmZ0UvbmlPaGZDNSsyQldnV0tQQW1DQUpJcWFGb3k5UXhLRWZqdXFF?=
 =?utf-8?B?d1NMc2dycUNEN0gyaUt4OFVXZXdGZVRQcTNOVDBaenlvQUkyY1ZYN0h4bitY?=
 =?utf-8?B?c1BtMDk0WUtjcytNNjFlWnMydTBiZkZqcmlDdy9icU1PS29ubmtpUDhYekR3?=
 =?utf-8?B?NVpaL3BBZ3oybkV0bjI0cnlyL3lpOVdZSGlnRGU5ZWhXL0VHaSs3TGcrd2NX?=
 =?utf-8?B?cjdNV2J6YWdvbGdEN1laNGI3aHE3VDFjaHJlWkVXSzhtb05POUJmc3FWQzhO?=
 =?utf-8?B?QyswWlhNQlY4Q1N3Tyt5WHh6Y1FsWXVta01lWjdGQ3Bxayt3TmZTamJ6Q3Jl?=
 =?utf-8?B?QWRzMVMrMHBJMXYrVDY1Sk8rTDErZGJ2SGI5R2RRN3FHUmJGQnhWa3lYMkhH?=
 =?utf-8?B?REVNTG5vYW9QQ0tUT2k3TmZLbldLM0Y3QS9KRHdBOHcxOVV1YlEvcXNuQXY3?=
 =?utf-8?B?bmdWMzA1MzBwcmZPTC9RLzNDaFo4Sm51M0JTRi95Q1NubmVCbWdtL1ovUnhp?=
 =?utf-8?B?eUFxdnJNQzVaazVzRTFOY2RIM3dIb01zOC8rSVFyZnlkSkVMZnU5MEpqZWZt?=
 =?utf-8?B?cllxQWVyVGpZbXVvV29abkxpU3ZxZ09wSEY1QVIrRFVPdkJqbmJWUGpjWCtl?=
 =?utf-8?B?cUZQNU4wb1ZmbHpPcDRjODJ2dVlsUjQxTW0yVm1kRWozMDF5Zzl0U0cyNW82?=
 =?utf-8?B?VW1xSnRJUTdpUXVnZjVqTTFVamRESHFaWmNkQWR1TWNHSU1JYm5IMHhpOW1Y?=
 =?utf-8?B?N0QzR3poTUNxMk9ub01OMWR1QlBLa3c0T1hqdHg2aThnMU1jT0RpWWpNRGx1?=
 =?utf-8?B?aEw0T1lKaFAxR2VaaUQyZjhTeURwazVRa2NXR0RvR1JrNEkzelg5U2VnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RHdFpJd1BROGpQczFZN3JwQzdKTFh5aTJrU3BiUUhUZWpLdERPQndqR0lW?=
 =?utf-8?B?blRHWEZpUlB3SjA4dGp3VUoxM204VE4yNk8zMnFObmtrZFplbWFia1dBckNF?=
 =?utf-8?B?d2swbTVPbUhrUlJ5Y2RrSS9jNzFzM3hEYzVPTmt0UjM5MnllZG9raDRRYlZC?=
 =?utf-8?B?WGlRaVoxK1pJTnZIUStUQ3FlZ3kvRnkrQUIyWUVKenkzd2s5NVU3dnRiYUp0?=
 =?utf-8?B?aUgvVmtyZW5hejVKSldnN3FBdmJGNmUvM3VCemFSTzlmVzFrcHFIRWw1VFdk?=
 =?utf-8?B?K2lhOGpGWkV5aG5SY0VGZFNkUTBvVWlFcmQvKy9Mc1VORVNtZkhZazBpUG5E?=
 =?utf-8?B?N1Y3MGw2RDM1VGpKdFRaUGtwMG5halpNbkNZN2VEQkZ3cEZWUmRBSTVYczMr?=
 =?utf-8?B?eWVUTndIdkVtc3pvMCtqYW1hVGZZRjBMZHM5WGc4Vmp3SWE5ZmFoTlhEally?=
 =?utf-8?B?RVFtZjZaazlUNXVwTzdoRmsxTndydmw2TUg5ZEQ1RmlUaEVZWWlqaDhVMjll?=
 =?utf-8?B?emdhYkd2QnQ5WE5XWjM4dnhjZXEvSHNLdmRUU1hqQ0c4L2x3UzA2UE05WFBm?=
 =?utf-8?B?aUhSU3Bya1VHajhUVGw3cnNFbXBIVStUZHJLc3h6bDQwRkI1dEpZSGRyN1JX?=
 =?utf-8?B?SWJYWkprWWpCNFRSczI3b09hUXpSU3Y3UW5uaWI2T1k2RnN4WUYxMlUzczNT?=
 =?utf-8?B?VllRZ0FjRXRpajRhaDlDeUhlRzlPcHlLWXdxRFdQM0tLamFoVlErWGp0dHlV?=
 =?utf-8?B?Mkl6eXRYV0NnZ0Uxb1B4czZWVC8rNEtwN085c3lpMWxvdlhuWDAxc05FQmYx?=
 =?utf-8?B?d1RsOTB1Z1NLV0F2R0l0T1cxN2cyTnIzZXdtcis2OGZwMk1FUXFyc28vZWl0?=
 =?utf-8?B?MHZzUlN6KzdScmN1MW1GL2JnUThPWHlGUGU4UE82V0p3ZW4wNWdWdUxRQ3c5?=
 =?utf-8?B?elljOTVua3d1OURTT2xWVlBFZUhVL1JzM2gwUUFiRDllYmpiV294R3Z3UzNV?=
 =?utf-8?B?ZXV6TWhacEZnV1BWSDJwdW1RemVaN05YS1N1VTZHbE9aeFE2VVdMbTdGd2ow?=
 =?utf-8?B?Q1JaUCs2YTNhL1lJa25iQUp3akRHOHpRb3pvanYwM29SSGhUb3lzNnNweGdm?=
 =?utf-8?B?WTF4OE83K2hNbzJ6TE1GQW00NndQbHBUUi9ITTZEdHBkWThQcWcwcXlmdGNB?=
 =?utf-8?B?L2R0U0EvT2Y2dVMrLzJ6eEdFMERxRjRjK1N0QmZMZk9yckZhOVJGc0RiaXVa?=
 =?utf-8?B?TDVVQzNOYWs5YllTYzBrQXVRbHllZDB4YzV5TnZjOERVamttenh0ZmE0VWVo?=
 =?utf-8?B?UFZuWnpzM2RmTVJSUFNaMlBra1lrckZDNmN5K3pkSkJTandwS241WTcvOVBo?=
 =?utf-8?B?ZnQwTDFJK3Z0MDJudTcreE8yTXRRenpqWm4ydU0zY3BMYmFHK0xWa05Ua0Rr?=
 =?utf-8?B?cmF1VVVHS2ZlRGFwVlFkMVcwVDhoSTN6SGcxVGtXN05sSnJwdGFXZzdjV3dN?=
 =?utf-8?B?UGR2N1QwcUx5V3UvMXI3a1lVMkNTZ0dmeGY5N1ZUTTR3VVVDWmdLbC9Ebnly?=
 =?utf-8?B?MXpuTGVWNTU4elBYWmJFbGw4SitVRTdYMUcxUEd3QUd6ZExaelRYc1dycFBm?=
 =?utf-8?B?Q0RETSs3MUs5VHd3V254TkZKdldreUkzdzlRMDJhbHJINlNNVjVsWWZsajJ6?=
 =?utf-8?B?UFBOWEwwUEttanBBYjlZeGdVS3p0U2x5N2tydjZHYU9wVitUeGJkbzNDeXB1?=
 =?utf-8?B?ME9odWY5Smg3bDBTamVtUkVubVU5RGlZZjBtMHNEL0Y2dU10TjJ1M2NReS9S?=
 =?utf-8?B?eDJOV2t1RlRPNlUvanNqMkZYSHBmUXVpRUMvWlRza2RwRkdiTDdBNzFCbjRn?=
 =?utf-8?B?VHVWRDVHRDFHTGlidFBSOUFPQXk2WEJGSkdEZWNKQ2REWlNTekMvVFE4L0g5?=
 =?utf-8?B?WGVBdUVsT3Zma0FIckZtQlVJMVZPemVTTjN3eGxZUmgzVjFiRVVtYXd6VUFh?=
 =?utf-8?B?aWhTVFkxSkcybUlLWHByL2ZkeHZEaW85eE93RHZwWDk1enVuZDFkS3ZxOGZU?=
 =?utf-8?B?VzMzbWZySC9JQjBDK2RvSWU4UnBjVkdMYkl3a2lSTTAzUDJudTZSRHdJR1NG?=
 =?utf-8?Q?TY8NTJQlg+zsBCnieRf1iq5MT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036b4865-813c-4193-3fd4-08dc62d99792
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 14:36:27.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIM0l2IifYt6or/pEc57KFM3vkVQB5tK6EUIuhvt8SP76QLQXEuY1Rh0vk/WCo5DNJKH6olbUl9K6xcWG4ChAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092

On 4/21/2024 05:27, Greg KH wrote:
> On Tue, Apr 02, 2024 at 01:10:20PM +0300, Mika Westerberg wrote:
>> Hi all,
>>
>> This is mostly for the folks developing and testing Thunderbolt/USB4
>> driver side of things but may be useful for others too. Not intented to
>> replace anything we already have for the regular user stack.
>>
>> In summary this is a collection of small tools that provide bit more
>> user friendly access to the sysfs/debugfs/tracefs interfaces made
>> available by the driver. Mainly useful for debugging issues around the
>> software connection manager parts of the driver (although some of these
>> work with the firmware connection manager too). We have been using this
>> internally for a while.
>>
>> The repository can be found here:
>>
>>    https://github.com/intel/tbtools
>>
> 
> 
> Very cool, thanks for the link!
> 
> greg k-h

Yes, thanks for sharing!  Is it worth adding a link somewhere in kernel 
documentation to make it more discoverable?

