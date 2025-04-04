Return-Path: <linux-usb+bounces-22589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB93A7C021
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 17:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D954A3B92A1
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 15:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3EC1F1523;
	Fri,  4 Apr 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qEL0oASk"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BC31DF994
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779005; cv=fail; b=Wyu9g2Oe0T8f1E5/lelX1pOWiNdz3WmGEldsx8LiNtYMois0nl5ITqwN+Zov0ZlVbfQmbwc9bGkIfc8MDUrhQpP5fkcG7gtDVt/TK+seOrOWR9W9amKPq/Kb0sS4tM56SH8ZxC0AnPqKVXNKH0l3JnNIZRGY6xd1FIQcFLscpak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779005; c=relaxed/simple;
	bh=FZ7XkjIIV/tk/7qI/G4Or9SAJe8lXkm2XBEqDNkh3Ys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BB2lmgLIQ1SEhJ82HWDszoXiXdEtdCUarxH1jAnUX988ZG2Xxzp5/Osn4KUloKgmYG692PrZ4MEK5RsgZLUbIly3wKq9DN1Mo72zERXrAmA8U33V+36ZfqVtyR2YlArjOSUbpMODkWmr0/5g90CahBj3wCu2xd4VNl9+Ib3fzWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qEL0oASk; arc=fail smtp.client-ip=40.107.94.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJX5MdrooYHg0svERB1GLiznmtWfgnzX2qVYz7sAq4BtRlQ8w0P3AB6tw2K17mAqJloeBcW3t/QlT7rTPxdSdxrJrn+Y3xXlAliIIU4FeAuJuSmQS5LNCSJY9dHRKCj5vWczgpJKpqhZorGXYu1V6YHRZ4f4Be3+u7sLoypIrhM4QB1jWsVevP1RBeqP0NDK/ps4jrRQEefBUcoDZ406pJUHxcMGeQW78qxuB13ge6ucFvffLIxeJvrudHntgAA4/0fNfUoFYmxNERUXdZ4t+QxtZqbaXaJd4lLwb0dAIFdA0dJXM1PUDOcBUX4GPYG8J4XzwiR7yYARTi2K8LKStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=790kHVRrPNQKroIc8Dt+2S/3TahAaGhRChpmELD7P4A=;
 b=txiMG6P1b+/myp2h6tjj3EgaWsU/NGVgEA2ohwy2T+AHgdTBTzOET+XTX/Ad/Mioklus9sNttqR9oVJnzcU9MV1qAhba9Aq4qxFkqw90c3yV9Jj5Wb4essZK/wFe3oOASPTqCCgxLq5Dd+6uip+Lll/Y9DjCALkmp1hZ2OORL3wnN2iYb0jfSxwaq+5PFfDlyw6m5a+w5weBacFd8cRSWgj+nEs5C8Q1E+GtJ/W1Z8yW8W6uSGuL9dNtd4ZZsIPcq8yhvMpEoHfRGF0T567BAAqWsCcwoUZuDBGbpK1YsZ8uV5h20oLDWixbWrI5lPPYJZpBXKkAeuTdi33YSEG84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=790kHVRrPNQKroIc8Dt+2S/3TahAaGhRChpmELD7P4A=;
 b=qEL0oASkXmpeur1ZBGIclO7s2PuK/VWb7/Li/5pNbuVhIEFj58FrHJphQbcjQneEVuqB1qQORnqPICOdqgyMCx/8hMebMW10TsNiUENYH3U/MamciQmikXEiPiac3ZSoD1AW7/5gKNEHU0U5jUJu5gQfSvhQsih6IbTmTfLL1NI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 4 Apr
 2025 15:03:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 15:03:21 +0000
Message-ID: <98539971-3b43-4d64-a105-6790198c46d1@amd.com>
Date: Fri, 4 Apr 2025 10:03:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Wake on connect / wake on disconnect
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mario Limonciello <superm1@gmail.com>
Cc: "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
 "Gong, Richard" <Richard.Gong@amd.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
 <20250404115346.GN3152277@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250404115346.GN3152277@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:806:6f::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 31978e7a-8378-4e1a-0ac1-08dd7389d6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDBmd2liQ1pNOUYySGtONlZ4U2ROaWJLN3VIUjBrZ1B0dWI3SHc1OGxuUzRx?=
 =?utf-8?B?S3NYSVpuK2xqTG1tUmRwYlVqalk1RzFqcXRVS1JrbnQ4dWN1WGNPRlBPL3Za?=
 =?utf-8?B?cWU0d1JQTnBjQ3BWSFFyd2R3YnpySmtPSmk3UjFkUVN5Y2dEckk5NG42ZG9h?=
 =?utf-8?B?TTBQa0FLWjZ3WjY3RUpaZ3orY0Z0RW9DYTU4cnY3ZmVLcXR6bFNkV2RBMTNF?=
 =?utf-8?B?YnBLeXFVT1dkVjl4NFkySTg3cXd1eHdZM044VzZGc21QYjRRNlpIZWxUUlBr?=
 =?utf-8?B?ejVidkhQZUR5VTVXaVRjMnNCbFoyOW9DRVp6UDQwNVNuaitiSnU4cVFjNnMy?=
 =?utf-8?B?dng4Q3RVL0xJb3hjcnJ2TTZzUFd2Y091VFI3NzlzanJKb2s1QUZSd1hKZ05H?=
 =?utf-8?B?SCtzK3Yvejk2M1I4OGtSSVcyQU9nNjF5L1luaHRWOW5uS3NNTFROOFBkbjBI?=
 =?utf-8?B?Q1h2c1RyaE9RSjQ5QzRUVW45elZEc00ybk9ETkVjUDlYOTBhSXowZFhlK2sx?=
 =?utf-8?B?N2wxZ045Zk1YN1NBR0ZTcWZDV0xTelptRVYwb2ZSN09RMFFLTHhoWmsveG1i?=
 =?utf-8?B?NnZ2cytVU1g4RHcvVmxjZStma0oyVWJOK21KQzZWSFl1bUwwaDVFSEpUdFZR?=
 =?utf-8?B?cm9aNlNoUnBFNFBxdWROOVhnaHhlMmRRSUNIMVlyeHRQR1lnNE8yNmlXdWxP?=
 =?utf-8?B?K0EweE9JOUlyeThrWWJ2M0xXUUVvYXRmcFlERm42bGIxUlRiWGVWek9jYlp1?=
 =?utf-8?B?aDgvaXA3b05YcERZam9BVzRBTXVzOEFLaGdqMGJ3Zkxva05nS1d1cDNLTmFo?=
 =?utf-8?B?Wmw4eFEvWDRpOGd2UkdZWnUvZUh6Tkt0YTZiR2hOSnRrNVZ4MHZxSk5vYzZD?=
 =?utf-8?B?YkpwMEtrbjB6b0doZG5KNXdtR3JEeVhNNDBkVlM4SGEyWDFvZisyR2xOaXNw?=
 =?utf-8?B?VkM1YVdvT1ExWG40cWZTbDlCRzRESExiZmlWZzcyWlY0YTVnSXBlK0M1QTkr?=
 =?utf-8?B?T2pyZTlpVzk2V0tQc1VOODVIZXlYcTRuYk1DS3NIdEJrUkRYTWI0QWdOOE5r?=
 =?utf-8?B?dkhzc1hlV1hOejN6cFczNHZmZFNVZkNQL0ptUWd4SlA4OWM3ckZsdDhWMDlm?=
 =?utf-8?B?MHllZGRxRTY4SDZtNlluM1NndGVHVU8rc3o1QjI5bWdRb1dPaDM1eXU0ZVJu?=
 =?utf-8?B?Y00yTlBPa0hhRUtlNEJIT050b25ORWhkYlZiNmhISmZRNldua2t5WEhDeUxn?=
 =?utf-8?B?cjh3cUFNME9WeFcxNWpGUjgxTytvNHRaOStlREs0QnVHcU9tUlZ5aFZPbWts?=
 =?utf-8?B?WHkrU24rSGlSWlBjOEk0VldIVmNyeU1nRllsb3RNS0plVWtlYXdSQ0VJMExW?=
 =?utf-8?B?YzZYazc3bFd3NVlhK0hLVVNJMVJFMmd0VExKQ0x2cytmOXdVbzlHSy9wZk1D?=
 =?utf-8?B?TUNsN1pOQnVNSFEzbUV2TndoUTQ2TUdBZXkvaW45ejVtM0ljN3ExY05JcEFy?=
 =?utf-8?B?eXMzQm1LRmN5MHZ3SDZmVG5Ec2pDSXdvRmhvNGh0SHNiY0pLTlk4Z2poODdl?=
 =?utf-8?B?TWhoRXdXU2lDNi9yK2hRZnR5VFowbXhwNUNpQ1lTU0lubysvWUNIMGxSVUxr?=
 =?utf-8?B?cnNMaTFNZEZBVnhEUFd2d01uVXBVMDhkdDBaRWorZEJhUjBGajdlc0ZaSVBj?=
 =?utf-8?B?d3BEeFBYcGMvVTVLY2Vsb1YvcSszNXpMd2Jtc3doL2VzTHlaTlorYzJMY0la?=
 =?utf-8?B?ZHB4QUhkTTdLa1JzZlZxMnZsR213cWZwUm9hWTF5M3hQRmZLY1F0U1Jsdk50?=
 =?utf-8?B?VG5xRmpsWEpYTWE2L1hiaTQyQkUrQ0g2U2hQTzUva3BlTFZRUEhtOUQ0WXI1?=
 =?utf-8?Q?HbS/tAXfUaM6b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2RPZXA4cm5iN2NtOU9MRyt1OENxNkRKeEtBakVCbXlmVkkvSmpxUXRndC84?=
 =?utf-8?B?Ujh2VElwRWM5Mm1yMlpLejJhU1VWVDc3N29aTG1rQWxxNjREWEZycExML0NK?=
 =?utf-8?B?ZTRIRjcrZXViMzJmM09wMDkrNjdEU1loOUUwRlE1MTdEdnhUUTYzM0dCc21j?=
 =?utf-8?B?L0EvR0s5aDdlOEtwOVgwRG1nS1RBczJGbHJVcUpuc251L2hIRUZqSFN6Wkhw?=
 =?utf-8?B?MWNidG5CZ2dHdXM5LzUwQ3RnenNpaWE5SnBsR3dEZi81bnVzRmgyVTRBZGFU?=
 =?utf-8?B?UUFzNWlUbnljcHMrYWRoOURyc1VaakFrVnFreVAvSzlwck5Ra2JhVHI1UExk?=
 =?utf-8?B?eHk1RWlMbjVOQjhLMG9ndjhmUnRFbFM2VXA4NWJYU1R2a3FSV1B4R25PN1lx?=
 =?utf-8?B?VWNLQlI1L2dzd1ZmTjFvOWNmU0VzSzFRM3dza3FFMGVoVXoveERMa3Bhc3VS?=
 =?utf-8?B?LzFmYk1UVU1RRmlyZHhVOSttZ0psR2NxTk9Tdyt4c3FqcXQ4RDZXNEZSU2RF?=
 =?utf-8?B?SXJ1TzZhMmpnekJkKzNEbGt1blBMMnZ2bitzaXRQbHJLeG5kL3hrVzFiZWNt?=
 =?utf-8?B?UHdrQzVZS1JIaE8yZ1F4ZjFjcTBIOUNxekxDL202QTkwaStiK2xob1VrS3Zk?=
 =?utf-8?B?M0xFYlFUUjZWTnRDMUVCblYxWDF2dlZua1FLNll0cVNRUGVJdXpIR0dZTW41?=
 =?utf-8?B?N3FLUGNOMjNxcVNyanF1YXZvMW01NjdKU0lvZDBtVS9SUFRTU05zdDVnZWRU?=
 =?utf-8?B?OHBneDdZeWJlUFlMcEJRMHdaSlY5aHFqeU0vSitUREJtNzV1MCs4L0FDdjgv?=
 =?utf-8?B?dE9GS1pJblpjck1hOWhhalplYnpuL2haTytOc25hM0tCd0trY0VMTUhwOFdR?=
 =?utf-8?B?eTJYaE5oS0dyRldDcWF0YWVYQnlaRFBHL3J5R3ZJNnBoeGQ2aDVjSnZWTlp6?=
 =?utf-8?B?YWVZRW5zZGZ6L1FBMVF2a2lCMXNaeStOTEx6dVY3dXRBK3Rqc25wQ3k1RDRG?=
 =?utf-8?B?OUZmekQxMHVYTmp1a3p4bTJwa0V1ektQU211UytTR2VSbXB4RVZIeFlIUnA0?=
 =?utf-8?B?YW12bXc3UlJUbVhKdWd6R01xazV0cm80U2hybkc0MGhQTnNCT3RuN1Zhdmk1?=
 =?utf-8?B?RWxWNVJzOE5OT3hwdmtNbW1PMFg5d1phNnRjaDl0eUp4aG9rUXpDMVhwRlA2?=
 =?utf-8?B?NnVTcFFoaEpMb2pMUjFpZXRuRmV1U2l1Vjg2V1Nnem9rc1ArQVlsWUVPdlV4?=
 =?utf-8?B?NVcwTHRKTFpPdWpCb2NhdmdqTHBIQzVqQVJiaWpJbkhQSmxQVkV4VUZ6VUxl?=
 =?utf-8?B?QVg2UU5IeS9hc3lrN0FHU2hpRkdIQVRYcGIvTkZEUUc3blc1cDYzcGx1S2cy?=
 =?utf-8?B?UHhVVm5WQUcrTDUxR3BYOExZcVZCQlVsOFA2K2hMM1BwMzBzUldoaUNQOHp6?=
 =?utf-8?B?Vy9KSmVJTVhOQ0dKRjRBSFFFV05URFZyUTdXVnZ4ak9iclRsUDJMZTAzMDFn?=
 =?utf-8?B?VGt3cVdJRmNHdnVxdkRueVQvSzZFVXRDbXNKQVlYSWtpS1FqNHJZWkp0aU50?=
 =?utf-8?B?MmJ6YlRRWmF0K2l0Q3pUcDJpdi90RTUydVkySTFqVzNDL3JDWlBudUt2N3lD?=
 =?utf-8?B?ZjdyaGtUMm5Jc09MSm5LL0tpcFMrS1J2Y014TGM1YnFqaW9oeVh1YjN2cWd4?=
 =?utf-8?B?RFAwZHdZZHJCR2M2WjIwTFJCdWtzL1dJZFdPSHd3WE94K3RTZytZREd5V2V1?=
 =?utf-8?B?TXRyUk41d2YwUER5R0h0ckZOU2hGaVlDNlk4eTB2TWlmRG9UZnpLeFd5YzhS?=
 =?utf-8?B?VmhLSEpGb0dFcTdXNko0aWhrcVB5T1JsQTRVVFQ1OE8vOXp4Uk9RZlByVU9M?=
 =?utf-8?B?bGk0TE5hRVhhd2c2OTViQjJoeWVZRXNOOXAwYzJGWUdUK2xMM05PRmtQUUk4?=
 =?utf-8?B?Q2YzRExEVm5nOUVNbXBJQmk3RUhHNXlOREMzMXZwMElDZ0JUSFZJcTZkSEJh?=
 =?utf-8?B?S1RCMm13SVhHY0RjZk5qVlA1dVdpbzFGWklMcFM4R0VhK1AvMDdvc05OblJZ?=
 =?utf-8?B?RUs3STc1V1NOcmFxRzVnWTl3WTd0Vk8xc1RuUlJnWGl2QkgxZ2tPNGN1cjV6?=
 =?utf-8?Q?4rBi2yvOa8NiFTOeKn9Jg9Xmf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31978e7a-8378-4e1a-0ac1-08dd7389d6e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 15:03:21.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTHcJEt7K2dEc+BpgcMtaJSPoGGoMPZ22zjVRnMU5QGzxmYdmlFosklXJTW4ygvjA7S1oXEMzK2uxMiBZ5ye9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282

On 4/4/2025 6:53 AM, Mika Westerberg wrote:
> On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
>> On 4/4/25 01:02, Mika Westerberg wrote:
>>> Hi Mario,
>>>
>>> On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
>>>> Mika,
>>>>
>>>> Recently there are some conversations about wake-up from connect/disconnect
>>>> happening and I wanted to get some background from you about the current
>>>> policy set in tb_switch_suspend().
>>>>
>>>> Wake on connect and disconnect are only used for runtime, not for system
>>>> suspend.  Would you be open to adding wake on connect as well for system
>>>> suspend?  This should help enable use cases like plugging in a closed laptop
>>>> to a dock (which works on Windows).
>>>
>>> Don't we already have a similar for all usb4_portX devices? That does not
>>> work for you?
>>>
>>
>> I think that will functionally work - but I'll double check.
>>
>> However usb_portX power/wakeup defaults are 'disabled' so this would need a
>> udev rule.  Could we set the kernel default for those to 'enabled' instead?
> 
> No because that would trigger wakeup each time you unplug/plug and this is
> certainly not good if you close the lid, unplug from dock and throw the
> laptop to your backpack. Chrome uses this with "dark resume" so if this is
> supported by the userspace then it can also enable these.

Ahhh.  I was thinking specifically with wake on connect that's not a 
problem, but the sysfs knob for the port changes both wake on connect 
and wake on disconnect.

Is there actually a use case for chrome with wake on disconnect?  IE if 
we didn't turn on wake on disconnect but defaulted to wake on connect 
would things be OK?  Or made the sysfs knob control only wake on disconnect?

