Return-Path: <linux-usb+bounces-33451-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE4dJMAwlmlmcAIAu9opvQ
	(envelope-from <linux-usb+bounces-33451-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:36:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 061D315A2F7
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 017333017061
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80AA2E8B8A;
	Wed, 18 Feb 2026 21:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="izRfMWps"
X-Original-To: linux-usb@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FF728C87C;
	Wed, 18 Feb 2026 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771450557; cv=fail; b=OaJ+QIOXgSPReYKA147GmgJNTs91jgw1wDG1qZMtiNpHRJHccveGQ6qFjGxPH5yqfizEeMLc2AKTgQRdOaDJ/GAu14wiXgO2cxVdi2ZSS1qixRvHGmnj7i57xrU8tLtALZZyqOhMJacR6jful4OfP+e6ZTYKczQiu2k3Es2Cy4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771450557; c=relaxed/simple;
	bh=qudgMnVp3gYMkmGF9xKYLfI64Wz/ifZBOcdtbKRm7A0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X88ts2AkA+vfEwlctF+rHqfSCCWRHXWWDODa3siHm2jg3bEY78H+NXczVaWq1zSwNVzDwYa1AGm8A/Wf6TRSLskJToQd6AuxclRG28KB+WZDixZ6jG32EJgsVbHDzGqf2Uz+lcPrRCZUNbCOTyMau45lE9MH+V9xi1jVADhiuaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=izRfMWps; arc=fail smtp.client-ip=52.101.85.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h227IErgWZuZNefvMixNu7iF31uJB7u8IzEn9vCvY6eeDmRoy2UWKNAjpqXcxDZ76k1Fm7NAsseuT4rSJ8OCEVlPwd0FvIV5CJmZJoI5qbE6WGXPXggYvkF21/LWpVm4zsMycflqNTpD5NFsjJFz678r+BPMIfTHb7yv9jAahmiNO2/8FyoKNS7xZup9AyESk3JcNDjsXIaQhTVdXsk7pu97PVBA6wd0BX+rsT3iNfrlz7d29WLXNhy/EzfYX0kxq+8jjWYFnmeg6KyUAv/FhwMkGqXyeTRJT8tqEnp84/NSyENHp4ZYH+sg5iEmICJzD1qW2x9VyEd1/JQCWrv0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPBJhLV8ewKMs4tJud5iEMVCr8sJFY/+Bl+dy+iiUq4=;
 b=SC63KJLSDKxLuP6eumia+6h1tUybGRrKbQ0epxGEAP5qFZTgAuM56tkc/ESY3nxBFNumzhNSIPjbb856OxBButomG215RhCwNNycNUneX+Cb50/oFm8a5izICBeCJzEBWkp+XQDgVpMAPyCRic0FzWbV+p3KnrOKbPOUP+vz6TXm5ffxK/fYyPMF/ZF7Gv52SRFNlzEcSDR2HQkWk25F3c9+ezy/N9QQoYTo6diFXhlZEVMyuf28ZVsTWzRQHvkrXyHcn4DIK8X0XZSgG7yTo2cPNCEitjosFQNWf6WzL2Vw047MQQ7cteHwj3xKSgSCe5JDvTi85I2+g7UXW1kcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPBJhLV8ewKMs4tJud5iEMVCr8sJFY/+Bl+dy+iiUq4=;
 b=izRfMWpsQUQW/GMKmR9dnlIHZ2C6WGMLdz3EBc1U4koq/SJO327rdCJD0PWNWSJ+MEn0RkJQHmdakEaONHaauAm7+DKLYlfWZA1ZQW7bYQ2AGdgTRVAXjkChSSzJn90cYwdnt2m8bGs31pSxx45HBSDZRatD/M8jimSXOcdgOss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com (2603:10b6:61f:fc00::615) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Wed, 18 Feb
 2026 21:35:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:35:51 +0000
Message-ID: <62c64b3b-2582-4c00-b122-3a448057a495@amd.com>
Date: Wed, 18 Feb 2026 15:35:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 AceLan Kao <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>,
 Sanath.S@amd.com, "Kovacs, Alexander" <Alexander.Kovacs@amd.com>
References: <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <CAFv23QkN1ypnMq0VwmUbfrxcyqihM1G8Ga3sgiTOWT5rtRnSmA@mail.gmail.com>
 <20260212070754.GF2275908@black.igk.intel.com>
 <20260212073419.GG2275908@black.igk.intel.com>
 <651677b6-bdc7-42a0-a568-6a81761ceb65@amd.com>
 <49393a7d-5b7d-4a80-af62-11856196fed0@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <49393a7d-5b7d-4a80-af62-11856196fed0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS2PEPF0000455E.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50b) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: 04054589-6e2e-4b01-a548-08de6f35afde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHN1ODZxeWhBSTZOL2g5ZmNYQnRoSzl1ejd6aVFDendTSjVEenZsWEVabDRL?=
 =?utf-8?B?RW50U2Y0WGdBeVRWUkYwSTdCeWg2Y3RnQkxqOTkySE45ZkRCeDJWRE5rRENN?=
 =?utf-8?B?cU1YVnZlQ1Q1YUpzSytKOWRJUTBFdW02blBwUEUvcjZaTXZKS0pkTzBndEph?=
 =?utf-8?B?SGNCRVF1cVFBQUV2bHNtQzU4Z3ZQRHBUNWxiMFhVbjdvWmxUTGdZZ3E0MXRW?=
 =?utf-8?B?ZWNqWnFQZ2hsVHVYdmVBQWdId05wV2Uzc1N0MFVlSHBtR1ZjZ0tpamRiRUQy?=
 =?utf-8?B?NDBtZ0pMcktKNVh4eENTV2pzU1pEcW0wVmZvUFlERWFyY1d5TkV1VXpxSmVy?=
 =?utf-8?B?RmNPM2IxeGp1Nmx0L0dsZHRMcHlxeG5EbWZnZzA2ZWVmclhnaC9manRGb2Vv?=
 =?utf-8?B?Wm1LSzNrMDhtWHh4ODltMmIzRE16ZHlObDhvTFVYdFptTWhHNktoL3U0Z3Jp?=
 =?utf-8?B?M2Y4T2ZDZFhPa0FmMkExd0dLdW9aQ3c5endhczZUZmQ3cmpmS2J5akpQM2t1?=
 =?utf-8?B?d3E1SldtdTIzbVdFYkFtTHllaWp2N2d0Y2Q1V0MxdkxPS2RTeHpzTWo3U1RG?=
 =?utf-8?B?TUtWWjJkb1RNUHZxYmRQRjhxV1BVWjNDSlVMaDFCMG5YTitJTmNZd0pnQTJG?=
 =?utf-8?B?d2NkSGFCZnVRQ1VwRnlXeHdCcGswckN6a3hGRElETnFGWWhUVFM5WTcraVpa?=
 =?utf-8?B?UkVjU2lZZXdjU3psQWdzZUU2OFh3UlB2ckxUc1FkWDY1SGVmMXpLM1hmeWpG?=
 =?utf-8?B?ZVJ6TjRDb2Z4Z2lJUnpRR0l5MzBwYmxEeTdIdGVWalo0Y0hGNUVZaElMdmtp?=
 =?utf-8?B?SE01eDJ3M1ZkZnFRMnVDUUU3M3A1ZG0vdC85SWR6WG00ZXhwbjdEL3JBSGl2?=
 =?utf-8?B?a1pXVTZnTTNjSzYwSUkvQjQwUzB6OVk2N2hSNTNMaEZTd01PM2NqU3RpbExX?=
 =?utf-8?B?a2tKQktWMnlVdDZvQmpvWWFUUldnRjU1cExNWENmRGFOWEI2Y3dwOEtDUGo4?=
 =?utf-8?B?ZUpxZHNUcW1HQjZ6ejdyY3ZVTmdDeTE2bWtqZEpJTkVEeGlucGR6WXhjdG9z?=
 =?utf-8?B?bTlZclcyQmNnRnVaTWNYc1gxazRvOExRWjBoZTR4M0REejZoOTdJYlAvbHRE?=
 =?utf-8?B?MENhbSs0U1NjVXhvbjcrNFVNRTM0N2FvdEFYV0U5eGtuSUM1SWRNOHU1bmZr?=
 =?utf-8?B?MHhVbm5DOFhITWd4aTRCZHFXbCtBbWZvanlSN1FUMlo3RkZtOEhEeWJhUFZE?=
 =?utf-8?B?cmRGQjlsS085VUdjeHZ3aUl5OEorOFhkK1FMSkgzcCtUbm9manRFM3JqbG0w?=
 =?utf-8?B?ci9zVlZWN0U0NWxZMmxrcHhjRUo4UlRzVXM5L0RuWUE5Z01ncTZvVjZBcm5H?=
 =?utf-8?B?UTFDN1ZnQzZERTdQeXkweEoyaWdkaFJyNTIyQVkwQVFOcHhnaXd4VTllZ0xX?=
 =?utf-8?B?VmlYRHQxM0JOMnZ0LzlTaXNpamt1UmdNNjI3OGVLWGFHV01pMW0xVlVkbENG?=
 =?utf-8?B?M0xPQlhiTUdFTy92TVhyMVVZUnVoZWVKUXlMdFMyaGhucjZrVitoRWMxY2o1?=
 =?utf-8?B?WGtETmV6MEdCd2Qvdlkyd2lGWnRCekJ2YlNaR2w1N2tjcTc0K200Mml4YUZ3?=
 =?utf-8?B?VnJJRDltZ2FBczloRkNOZ1FmeTJnbVlrVG5Rd3VMM0w1eHpYT0pweSsxMXhp?=
 =?utf-8?B?MW1wc1JlOXNrSE1JRFFiaktPL01qUW5pbWxZYkZzUkVjK2VvMVBaajF2MHRp?=
 =?utf-8?B?bk9CR09qSG1iaHhxeGNUOFZFaUdFRDdLRWtPS080NWVLNnNkU1BmVXczeGt2?=
 =?utf-8?B?d3IyNGJJY2c0Tk9aem9ONWRXeXI1Um8remRpYlVNMVE0ZUJtS0NrbFdNcm12?=
 =?utf-8?B?WmpzN1RVbGNoY1laTFJHbWZYbDFOSEppSTBzT3lNSk5hSUxDWlpaUEhQRHhx?=
 =?utf-8?B?ZWVzV1JMTGNWQ0FyMmlvWUhzaEpsY0ROTHdoQTBFSkRLSHhTdWNNNGFUVnNV?=
 =?utf-8?B?a1AyZGhMVDFmZjE2TE8vdk1hV2Q3d1Vpc0ZiZEZFK3FmVStjUHdXR3J5cm1T?=
 =?utf-8?B?ZDJoSUpuandNN1pNTk11UEZjcFlHdytXcXl2eUZOZHBmK1pEWVJsN3hrN0hQ?=
 =?utf-8?Q?ON/M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVQ4MWtIdXBwS0pYWU1aZUVCRi8yNFlKank4NFZEMG9UTmxVU2cxZDc3QTQx?=
 =?utf-8?B?dkVVRG45czlyYzNyQWRNM3B5SC8yVUVkS1VTZ3lkYzk5TGc1SnpvdE5yZ01I?=
 =?utf-8?B?SWxaMVE1WC9RR05NZTZQdytpeU1uWkNNREhxV2tTVGR2MitIaTQ5RmlYSFdI?=
 =?utf-8?B?enBZZC9ET2ZtL1FXTU05S200azNzaExDZVhrTWNMbXdlRG5pRmpzR1JPQUFW?=
 =?utf-8?B?ZWZXRHhJN3F3N01NWDJ3ZUIxc29vcmxzUzVRdTBrLzZ5ZHdibEVWVlNxbkd0?=
 =?utf-8?B?blR4cTl2cWZxbml6Zyt5ODUzWlFnaEp6dkxYa3JPZUJ3ektwNWljZFhSZlZC?=
 =?utf-8?B?MDBEaWc3S1Rjb0J0Vko4SlI0U3VjUXIrQ3ExMnZ4TFh6TzRCYW1EMEt3Lzdx?=
 =?utf-8?B?cUdMbnQ0NXU1Q1c4aVZ6MU4xN1JLR2JJbUsvQVJHYitLRTQyeVRxSGZDWFVp?=
 =?utf-8?B?ZVQzUldKbUJ2U0xualQxeFBIenovR2g5N1BnbEs2cnN4Rm9tYzNQRCtCbG40?=
 =?utf-8?B?Z2VhQ0t3a05BbUNDeTZUNWZneU1NMHo4V3dJVnpOK1V5T2plcS9EdjdVK0pq?=
 =?utf-8?B?eFprWHZveUloQU5yRWJhVGxFQXoyZHVZRTdNZlZpeFBDbkErTDRIc0tkbGxM?=
 =?utf-8?B?OE83TUhjaXNocWRleWVDbGVrdVpVZWZNakVwZlVvaUpyc1dlSi83K0k1eVlu?=
 =?utf-8?B?MHIrbzJpM0E0aSsrVnZPT1dCL1pFUFlodlZadUZyRWZLc0F5bFZkN2R6cXlN?=
 =?utf-8?B?c2ttNVh1TGRaaVpGOUdvNGlwZWp3SVZBd3NJOG9rRDM1QXNuNVI1VjQ3d3lz?=
 =?utf-8?B?NkpldHJ3WjRzWGVXV05XY2F6R29ONkp1K0RPR3ljL0R5T0xWWGpkbHFNT2Qz?=
 =?utf-8?B?UTJWVlpySTRvSS9NRlozR2tTZklQUTBvU3NpSERyeGh4ZUdBelZydm1aU1F0?=
 =?utf-8?B?WitEU3ZBd09uTi9ncWJsenAzWm1wYVJib1NiN2paWEFsMStnRTdrYzZJbG81?=
 =?utf-8?B?SWdueFIvbFduZnNtbXdpR0pGYU5VSUc4YzYxQ2NsenppTFl2UWM4NFhZRHRB?=
 =?utf-8?B?ekFvNHFPQWhCSml1YlRDZkliNDBFaXI4Z1gzQjRVbWVKVDVMOXI2VHJ2NVlP?=
 =?utf-8?B?SDBEeU1NR2JuMSs2NkVQOE1kY0xWSThNWEJOL2tzL0tJbjNQc2ZGNkZHUEhL?=
 =?utf-8?B?ZGVQYVJjK0w2ZkIveUhpZWZQQmtJNHk4eVQxbnlnOEhuYnNqblk5UGRIOEJs?=
 =?utf-8?B?T2doWVByUlNoNEZ5VEl0WTl0SFdKNWFid2RWTmlWQVo0bFp3SUU2U0JXU2Vt?=
 =?utf-8?B?WGUzblh1ZkhzNkxDaSs3Y29zeXNGMW5VcWNyWlh1Qjc0ZGNaVUlSUCtnQzJl?=
 =?utf-8?B?QzFWZHltTXlIMXZpbXd6OUNobVpZQlF1b2N3ZEpCZW94RG9sbWFFajFTUFhl?=
 =?utf-8?B?WVp6VUxkZDFqd01qdGxSNlk3cDZSTmtkSlpod25uaE5NYm5RaXFXb0RFakNk?=
 =?utf-8?B?ZzNJNld4MXd4anhERDlWRHBIQUkzcm9DaGhJQW5xNkdJaEdIbThwa0xHR3o0?=
 =?utf-8?B?eld0RWgvUUZJdTExc3ViNlVGQ0xodjZMemRRc1o3LzlMSzBsNWJ5OCtpQjgx?=
 =?utf-8?B?WkJ5NklJSmxXb2t0L3UrWVFKRUJHTzZWT1BKLzl1bmZKQTQrWmVkSWdETDAx?=
 =?utf-8?B?WEFjaHhLOGV2SzNPV3BGS1d0UWxHS2FWdS9FSExEOVpTaTh4T0FtbFBvSk0v?=
 =?utf-8?B?QWpidldzUVpCRkJva1hUY09oNE13RCtYYVVkcXVpRVFsVXZ0ejZFUDdXblYv?=
 =?utf-8?B?b2pCL21udWZYUVMxcHViMEdoK0h2cXo4dlN1Wm5CM3hGTVBNTnhhekdIMFNC?=
 =?utf-8?B?M0lhdS81bThtRlVmUmkzc0FWUXJ1a3VSUWVsTVk1QXdIUjNFSW54Z0NuU21y?=
 =?utf-8?B?SFUvNHFtY3g5T0lCandCNTZ1dE0rVTBtKzF5eTlySHhwMlZuTTlEZmpoWGZD?=
 =?utf-8?B?WGRhWnh3Mm16cVFQbkYyOGJIZTNuVHBPVVNycEhxbW5meU52TGN6SG85ZEF5?=
 =?utf-8?B?eU54Q2ovbkUxQWpablpiOGtkU216dFI1L2hBZ3R5cUFEdmdIUUhSQjhKc2Fk?=
 =?utf-8?B?cHdpRmpkWTl1NXZ3empnR2pmc0xaUEUwUUtzdDFwZ2FOVVNhK3pMTWlsR0Vv?=
 =?utf-8?B?bU50Wldpa1loZnVqU2RmMEtnREppWUFhRC8ydXFBemdGay9BbUMzUWZGb3M4?=
 =?utf-8?B?MHRhZC95WXJIaExrTjFMN0hEMzJ4d0cyRW9XczdYYStaTFUzOXk4ckZHNHRy?=
 =?utf-8?Q?evDzU9OpUj4t2skugV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04054589-6e2e-4b01-a548-08de6f35afde
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:35:51.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz2wCLEqeByJbqJQ2EmmJwuWa86dTH8CTCmTTorAeeqVRtFj5gYOytZhOdIN7/YiVjJ5nnkvn4TBWE6A1e9BmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,linux.intel.com,amd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33451-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 061D315A2F7
X-Rspamd-Action: no action

On 2/18/26 1:21 PM, Mario Limonciello wrote:
> On 2/12/26 6:34 PM, Mario Limonciello wrote:
>> ++
>>
>> On 2/12/2026 1:34 AM, Mika Westerberg wrote:
>>> [+Cc AMD folks]
>>>
>>> On Thu, Feb 12, 2026 at 08:07:54AM +0100, Mika Westerberg wrote:
>>>> On Thu, Feb 12, 2026 at 12:16:03PM +0800, AceLan Kao wrote:
>>>>>>> Disable runpm on 62:02.0, then we have 83:00.0 and its downstream 
>>>>>>> port
>>>>>>> 84:01.0 and 85:00.0, and then the tbt storage is recognized.
>>>>> Got troubles with mutt, my reply got rejected :(
>>>>>
>>>>> Using gmail and copy/paste the content below again.
>>>>
>>>> Okay.
>>>>
>>>>>> Okay that means there is nothing wrong with the PCIe tunnel itself 
>>>>>> it's
>>>>>> just that the PCIe side either does not get the PME or does not 
>>>>>> see that
>>>>>> the PCIe link becomes active (e.g the PCIe Downstream Port runtime 
>>>>>> suspends
>>>>>> itself before the link status changes).
>>>>>>
>>>>>> PME work so that there is wake first on Intel it's GPE that wakes 
>>>>>> up the
>>>>>> root port and then PCIe stack wakes up devices and then the PME 
>>>>>> message is
>>>>>> sent to the root complex.
>>>>>>
>>>>>> If you do this on Intel host do you see the same?
>>>>> Intel host exhibits another symptom, I think the root cause is 
>>>>> different.
>>>>>
>>>>> Plug in the dock, and then plug in the tbt storage to the dock one by
>>>>> one, both storage can be detected.
>>>>>
>>>>> Plug both tbt storage to the dock, and then plug in the dock to the
>>>>> machine, only one tbt storage appears. In rare chance, both tbt
>>>>> storages show up, but most of the time, only one tbt storage is 
>>>>> detected.
>>>>> In this case, none of disable runpm, rescan, or lspci work. So, it's
>>>>> most likely another issue.
>>>>
>>>> By "detected" you mean the TB device is not detected on TB bus? Or 
>>>> it is
>>>> detected on TB bus but creating PCIe tunnel does not make the content
>>>> visible on PCIe bus?
>>>>
>>>> You can check this from dmesg, the driver logs if it sees the plug 
>>>> event.
>>>> Or run tblist (from tbtools) and see if the device is listed.
>>>>
>>>> I suspect former and in that case it is likely a PD/retimer related 
>>>> issue
>>>> rather than software. I see these once in a while especially with new
>>>> hardware where the PD firmare is not yet stabilized. If there is TB/ 
>>>> USB4
>>>> link then all is working from TB/USB4 perspective.
>>>>
>>>>>> Right at that point the PCIe Downstream Port probably is already back
>>>>>> runtime suspended.
>>>>>>
>>>>>> Here you could try this:
>>>>>>
>>>>>> # echo 250 > /sys/bus/pci/devices/0000:62:02.0/power/ 
>>>>>> autosuspend_delay
>>>>> No luck, I enlarged the number to 1000, but still can't recognize the
>>>>> second tbt storage.
>>>>
>>>> What about -1?
>>>>
>>>> That's effectively same as blocking runtime PM completely so should 
>>>> work.
>>>>
>>>>> I tried to wake up the PCIe ports in the beginning of 
>>>>> tb_tunnel_pci() and
>>>>> it works.
>>>>>
>>>>> +       pdev = pci_get_domain_bus_and_slot(0, 0x62, PCI_DEVFN(0x02, 
>>>>> 0));
>>>>> +       if (pdev) {
>>>>> +               if (pdev->dev.power.runtime_status == RPM_SUSPENDED)
>>>>> +                       pm_runtime_get_sync(&pdev->dev);
>>>>> +               pci_dev_put(pdev);
>>>>> +       }
>>>>>
>>>>> But I can't find a generic way to get the bus and slot number, and
>>>>> would you consider this a feasible approach?
>>>>
>>>> No I don't want any (more) PCI related hacks in the driver.
>>>>
>>>> This is not a TB issue, it's a PCIe issue. I suspect it has 
>>>> something to do
>>>> with handling PME/GPE on AMD side. Essentially when runtime PM is 
>>>> blocked
>>>> the PCIe hotplug driver notices the tunnel just fine. When it is 
>>>> runtime
>>>> suspended (e.g D3) it should send PME to the root complex that the 
>>>> brings
>>>> the topology up so that the hotplug driver can detect the presence 
>>>> but this
>>>> does not seem to happen.
>>>>
>>>> If you enable dynamic debugging of pciehp, do you see anything 
>>>> happening
>>>> when you create the second PCIe tunnel? I suspect not.
>>
>>  From what I see above I agree this does seem like a PME delivery 
>> issue of some sort.  Any chance you can put this on a PCIe analyzer 
>> and confirm whether the PME was ever sent?
> 
> We could reproduce the behavior on our side using a USB4 hub and two 
> NVME disks.  Keeping the root port for tunneling at D0 (turning off 
> runtime PM) avoided it.
> 
> In cross referencing an Intel system (Intel Core Ultra 200V) we saw that 
> it couldn't reproduce.  But looking at differences we noticed the root 
> port for tunneling on this system stayed at D0 the entire time.  Is that 
> expected?
> 
> 

Actually in further re-testing that was an incorrect observation.  Our 
internal team will keep digging into what's going on with the PME in the 
AMD case.

