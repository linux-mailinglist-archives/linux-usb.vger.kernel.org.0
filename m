Return-Path: <linux-usb+bounces-16638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0289AE6DB
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 15:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E293B2320F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 13:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34B11DE88A;
	Thu, 24 Oct 2024 13:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nmfCyYEF"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968A1AF0D0
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729777124; cv=fail; b=bgaD0txTbUMgCzfkSfXgF3vyYe9aU4og/7U44xzafJpGmKrXkJDmCdbkQwV4Nr6lKXUaPmZ7ZRJbXB2X49iNj1ZQTPtpPJfJn+MCdYS0XrQEbJDRPooXBQHpU4Mt+0wzoQ2WGww7ZUmqMpsIaNDYpFgeEuhyHlzJyfKtn3ptXcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729777124; c=relaxed/simple;
	bh=05mdV8iXnjWqvy4Cz37UBBpGK0PN96vmSRP6fzjbutk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uvH0kKoqI0/eeJtv09MLsQrBu2s2UaURPupI2nQymggjT/+9R4VJpS0MAyl85PHq+67CGM0HwPDtMbESHB7B2EPoFlaDFsW6ltPx0cDJvmVNxuvIPTTs4nK0DcKruqH5lQLAygYR98jENHago4Cxr2hQDPdn9zOBe2qzrLX8T+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nmfCyYEF; arc=fail smtp.client-ip=40.107.93.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMTdCl1nNJJqdVupEgxs1Hhi0rERz3ubJ5zfD+legL5yYx1rEkqITVQcbIHE+Eheyx0V2/wuzfutKdpNn89JlA+KQUD/KrfTTZj2XTks1XxJphMD23wmSeHR91+kV5eHIxA2x4qBRGf5ZF/F5srMV9sojhaH8/usZ8YnTOx0c+5DVWoYnEkWaX2vvWWNrCP0LQ3AieWqjmoRpO8GPG8B+QApPg+nEBXmM0JaHM90wxPRMGruMAKIlyYt/BvRbUJHekqO8+tZZlZYDPjvRs5LTApFdhhhxolVGfxH9ztjmJOpdoXFstohta6EGqVuBUAMUUqlaCWQh+ZUowCraXaAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjRn90l0R+dSU+Xoz1JlhbsRqt0o6c2rhqYk4pTbB8Q=;
 b=bgLjnM7MKD+F4cw0HcJo9TKk1QpR1Ddz2T/2O7+VV4p0AXECIfHbzLjtFaw2Mp8zQdd9tWL8UUjQjkbWPA0MYdItjX9dQrHRegLH6GPLp9IKC1889oxx8kf1Hp0pD0tyzOiRCsX8lGQfaCv2xTEK02dWDpV+h1BIzfLwbbPiAZx0wXN2NqFXl58nQegb/W++wiNQ+xi2lIW4txMi1laiemtvQSBI5ricVaqE2SA8VeX1aOquDGr31Z5CLzUOkwQtTwDaaXcObMV5CAZD6TxaaT+1Z2iDT1wyhaI1j46J7XviXbqP+9zViRkB028BH2p7W2gp1Vapl6fITHliO4H4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjRn90l0R+dSU+Xoz1JlhbsRqt0o6c2rhqYk4pTbB8Q=;
 b=nmfCyYEFMYgA+OZkeq1lmeo9ZhI2B6VqQZDeZdYXd2N0MZes1Dco5d2ivSPTowh/6FBdqBFeGramuW9TWcBoDEV5iw6BW6Ig+6uts8LfRG0I7hSbdbzo0v/P9Y5jhmmxFIpShD2XTahhuvk9R1SpV4bDMAHASWdcmcADd4N5CDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 13:38:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:38:38 +0000
Message-ID: <5718b41e-09f7-42d3-a6fd-68bccac50e42@amd.com>
Date: Thu, 24 Oct 2024 08:38:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xhci: Use pm_runtime_get to prevent RPM on unsupported
 systems
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: johan@kernel.org
References: <20241024133718.723846-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241024133718.723846-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0040.namprd05.prod.outlook.com
 (2603:10b6:803:41::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fe5866-2314-4948-f693-08dcf4312a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVdwaFZDY3pwM3V5ejNRWGdXQXUzcXFQU3pDZDd3ZlZSRUs5dzJaMlRnSmR6?=
 =?utf-8?B?bDhDN0RUR3dNN0dzSFhILzQwMFUxNFpRaVJIckJWRWFKY2FONmxuN0s4YjJZ?=
 =?utf-8?B?cHFWN3NhOCsyTURIRG5JWmpEWlpZSXArM3ByUnVNWVoxWnZoQmtSNnN0SWR4?=
 =?utf-8?B?Q3FvQ2t2ZFZGeGpSeEYvWUl2L0h1YVh0WWhtMHlFWm9IUVNhRXRyMlBRelZi?=
 =?utf-8?B?R2RLVjZpZlRCWXBiNGJYSG5YSlhhdTE0U09QVWM3MjIwb1BBbks2OW93Ukg3?=
 =?utf-8?B?YkhHSFBRMW1qY3hKbGlQaFJnRXNUaUdGcnIwWVFzVnJMVGU4MGUyWEZaV21x?=
 =?utf-8?B?bTNnYW56VEQ4R05RZE5VTm5ndTZ3Z2MvRk9iZmEvcWdjSlJQQ2xNQzl5cVI2?=
 =?utf-8?B?WldCWmZTZjgyRy83VjJxcmk1TCtZZkxiRkJjaGZISThCY2NpL2Z2b0RZUFVV?=
 =?utf-8?B?Q0c1eU9JcXFXSGNaaWx3Ui9qeURCQ1l1RlMyWmlqT041K3lSZjdsV0pYdjVu?=
 =?utf-8?B?WDVPNDdlQ3E0WUxBTlQ2Z1lNRENWb2orK3dtR09BcUl6WVJlOVpEMDVzVE4x?=
 =?utf-8?B?aXVwTGM1bm9qMVRjNGthV0JyQUdMQjJsUmlZbGp1bEdjMFlkTW1CRy9Ma3Zv?=
 =?utf-8?B?Vng2eEhNcDZYcHk1SVp3TmhCOGFVakNjMTQ4Z1JWVmdEWWg4dVlvbmxaOGZk?=
 =?utf-8?B?dE1UY29BQTU3Mk1DNGp1MDB0RXcxY09pS3g0M1Fld2hLV2lFMjhZcVQ0Ui9F?=
 =?utf-8?B?eFJoeU5jd3VWcWd3NmZKWFJERUZNYWhjRTZoOVppUFI3UXVPTEVtVjVhdkNH?=
 =?utf-8?B?WDJZUzNTdTJNK0N2TExwZllNYzE0MTRmUE5sRnk1RFdwbXB4aU1xcmtzV3BX?=
 =?utf-8?B?SUpNUC9lcEdvUlN6VWxWcjcrVnBPZHo4Qk5YUXdmeklxb2J4UUxPNEdYam1u?=
 =?utf-8?B?d2NCVEp3eFZVeEVRY1NiMTNBZjBwcUNONEY4TnUvMGl6bU1XUFNMZGwwdjVS?=
 =?utf-8?B?OHJGbnkrdXBjRnlHOEhsWC9yQW92aksrYzVlcXVJQ3FUTmM1cWpNVndoQmRR?=
 =?utf-8?B?WGJmamYzS3M2MjdQRldJV3Q2Y0hUNzBkSGNKV09JM2Ixek9SVHprdW1ucUhB?=
 =?utf-8?B?NThlZUgrU1dmZlZ3V1NTSG5ZVFpqU29yQnBjZ3oxUUw4UGx5T2h4Z1pCV3V2?=
 =?utf-8?B?Q0RDYkFxbE9NYitqQ01OT016ZnhISTZiRHZROXo4cjhFVDJ6TVlnMld4ckln?=
 =?utf-8?B?TVh0VlJPQ3FlM1g1YitSMFRlRXVXQ0pETHp2a1YxRThBbGhneVhDZTUyNXNH?=
 =?utf-8?B?Yy9iUGZzdFZTWkNwNndrWW9nVHZzUmU3YXh6Um0rRkFhOVRIejVKTUlEVVJ6?=
 =?utf-8?B?VG1ibHBtOHM4NzUrWWdkTXIxV0F0ak5BUldFWVRGd2RZOTFvdVprQXBOQXhx?=
 =?utf-8?B?elFnWitDQitabyt5RWhUQSsxZ1g4K1p3TVM4b3BXa0wvbXNxbWg0QkNmRVVC?=
 =?utf-8?B?bFlEbktnZ3Z6eTRXclJKaEdHVERxeWRpNzZPN2huUkoxR2JyQjdVWGNPcUFx?=
 =?utf-8?B?WkpsRks2TGxWajQvekRqeENjV3BiMGtOZFMwTE9oRyt4NGtseDFKZUI1RzMz?=
 =?utf-8?B?Vk5IM1A1Z0h0bGFWSFVqNEtSMHJLQ1BjQjh6Z3YzNngvTGxrUmpoTlkwa3k4?=
 =?utf-8?B?V2JYUVZobC9ITmlPeHdwKzFESkZjYm1OVkZQMjBHUlpkU1IzamhVTi82Nno4?=
 =?utf-8?Q?pCPhXFeTMXgZYL89adgfydKJsnXMPVrUsp/Hmlw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXhzMVgrMkkwcXJMUTg2VVF1OHhnUlZGcCtzN1E2OWcvbzdxNHlvY0lRWng4?=
 =?utf-8?B?UkdSYi8rUHVRSkpQUkdBanU2YTVkVHZ0NVRUREd2UVNhaElJLzFJWUEyTGZK?=
 =?utf-8?B?UUFDRDZ5eG5uTGJIUDVGVUF2Y2tDWkVYRlJQNFl4ZmU4Wkljc2tLVXRzZlR0?=
 =?utf-8?B?V2FjVVN4UkxSUzBlaUdlV1Z4NVdRS0V3NUJlLzVmMjA2TVl5bWt4aWFISlBS?=
 =?utf-8?B?SjlnNDdzL3F5RkNXZ0IyRGVmZTZrV3FFYTI5YnZyOGlaMTlML0NSQWhHaXN5?=
 =?utf-8?B?M0tZWWJoMDkyVGE5cy9XbldodnZjc1AzbnBjTXJVTk8rTEZERzhoSVlreGdC?=
 =?utf-8?B?Z0FNbUtXYXJYMVdiZS9mYUNCbHBRa3J2WGtPdnFnZEVnRGFvYjhIYm5sU09u?=
 =?utf-8?B?N0U2dHZyOXJtNVdNS05HaTc1c01jZHNJU1hycWJZZE1OaWJVVlBZaXNEbC9G?=
 =?utf-8?B?Vi9CY3NSTTl1dnUzUkh2UWhqMEFid0NXS1pwVUR3emdSSHhzK1J4MVVZMXF4?=
 =?utf-8?B?TFdFWnk0aDhvZlhVZjJaVHRVMnlLRFp4SjZpcUVQbG44MkF2TThFZEUxbXlj?=
 =?utf-8?B?OU5QVlh1U1dEU1lIQ2VnU1c2cWJxdTl2dEMvc0l5aTBUc1ZacWN0VnB5eDZR?=
 =?utf-8?B?aHVWaEtyNEhDem90Q2p0T1NZQkJqWXMwVlJySmNoTThXZVRXaThFTEgyZGJy?=
 =?utf-8?B?TmdPK2tOenEranZNSmJ3ZzcxYW1leG9sa1J5Z1NIdXhFeGt0RzI2NFVjZ2dC?=
 =?utf-8?B?Y1lNNnZXR3dwYXduUHNSZTlmN3l5ZkY5UWdLbzhuWDRVMG45YlRySzlYalJD?=
 =?utf-8?B?Y0ovVEdQSDdIYnhyNVZsNjVTR1FON3BIek9GNW90VzVSeksrN3o2bjBYMlAx?=
 =?utf-8?B?N095UHZmVHJpbHFWQVllcHpjcE1sSHNWUXpTYmlETFJNdDI3UG12OHJYNStR?=
 =?utf-8?B?NzY5NXRNS2ZKRHRMSzRqMTFTL1lCRFFLb3N3RDFMc3JuT2N0ZmlNZ0RKU2VB?=
 =?utf-8?B?dUEySlZPWk04dmRMa1ZnRHduUEgyMTE3TWVCR1hQRUl3RERTZnpKak53SWQw?=
 =?utf-8?B?RmJOemhoQ3ZmSmFJcDBwcU5XNzQxdGFDWHZLdDdWWjNXNFBGcC9kQnlaRjhJ?=
 =?utf-8?B?Q0gwdW8yNm0zdFNWNmJpdGJYZ1M1cDZHOW1aY2I0M01qcGdmS0Mzd0VoTG1k?=
 =?utf-8?B?UGIzTUZLcUE1RUFMK1U4TFJNZ1JtVG5QSXczRXZRbEVrMWR3c2RIL3Bxb0V0?=
 =?utf-8?B?SGtqbGFENEtmMFh2OUR0WkY3bDV4QjRiNzdENzNuWHRLN1Q4MndkQzM3ejJn?=
 =?utf-8?B?RUlQZUlXekZIaDZ5dVdDcklUZ3RoMS9Xd2JSTmJMOHlEbzVEN3ovSzZUN2po?=
 =?utf-8?B?Z2YrNi9qdC94L3h3cUxlSVVHSVNvY0xkdzBGemd0cC9RTFNxMlhMdy93QU5L?=
 =?utf-8?B?VFpXUjM4bjk5bFdSa1k2eFkrMm5MNEJicXpLNG9ibGVBMU84eTNiMk9hWTBz?=
 =?utf-8?B?S0s4ZXhKUWk0M1dtRDhMaUw1QUVpQWkvblR5ZVU1ckcyQVJYMU9sK1FDWWZp?=
 =?utf-8?B?UUFna1F6R0hFRkNjUXJ2M3EyanFHbC9iVG5qN2tDbGJuNlAxL3ZXbUNmcGc1?=
 =?utf-8?B?ZHgvc2Q1eUo5b2hzS1VEWGZrWEF1emt0bVRHeHdzVzlFU1BkSmtUdGZCYW1s?=
 =?utf-8?B?YThleVZZY2lpR3V2b291U3V2SE1WQStzbzZ5WXBYU3lNRy9DU1RlTmpvR01I?=
 =?utf-8?B?eUVWczRsMXE1ZXBXREtyanpOSEJrcUU1U3Vna3BrWmpBekxCdnVlL3I4bTFV?=
 =?utf-8?B?YUd4M04zME9JbVBjYXc5RlVQUEQvZVJJVkRYRHprNnlkY0VSN0ZvUmxCVjl0?=
 =?utf-8?B?RW9tRSt6bGpaQkk0TFpiazdpRks0WFhINEs0VXFCTmJnRncxTWJnSkMyOWp0?=
 =?utf-8?B?YVhSTm5FdWFBZ0JUajZKYzB4Mjk1T0oxWHRGWXFqOHdmWmdFRVg2TUU0VVZi?=
 =?utf-8?B?emxTOW1aZFR1WU1zaGhZK1REZGJSaGEvUGVVRHRWc0ZpM0xMTENzd3pDYlRV?=
 =?utf-8?B?VzJIWWhPd2Ryem5adDliRUVuNXhzbWdiamt0SlBGbEVWTFNTT0VkYWNDeWFM?=
 =?utf-8?Q?AOER35U28hcZQCwzKan2oi+yd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fe5866-2314-4948-f693-08dcf4312a9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:38:38.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+cwQkBZdfTlEXrvYQ5SgBB2dcC5DMciOsSYUsM7CB9TsLSSTrey3B8bfeaVrltk4o5VEFFpLq6Qh/S0d5CxBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684

On 10/24/2024 08:37, Basavaraj Natikar wrote:
> Use pm_runtime_put in the remove function and pm_runtime_get to disable
> RPM on platforms that don't support runtime D3, as re-enabling it through
> sysfs auto power control may cause the controller to malfunction. This
> can lead to issues such as hotplug devices not being detected due to
> failed interrupt generation.
> 
> Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Cc: stable@vger.kernel.org
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> v2->v3:
>   * Respinned v3 with an updated changelog.
> v1->v2:
>   * Used pm_runtime_get and updated the subject line accordingly.
> ---
>   drivers/usb/host/xhci-pci.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 7e538194a0a4..cb07cee9ed0c 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -640,7 +640,7 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	pm_runtime_put_noidle(&dev->dev);
>   
>   	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
> -		pm_runtime_forbid(&dev->dev);
> +		pm_runtime_get(&dev->dev);
>   	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
>   		pm_runtime_allow(&dev->dev);
>   
> @@ -683,7 +683,9 @@ void xhci_pci_remove(struct pci_dev *dev)
>   
>   	xhci->xhc_state |= XHCI_STATE_REMOVING;
>   
> -	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
> +	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
> +		pm_runtime_put(&dev->dev);
> +	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
>   		pm_runtime_forbid(&dev->dev);
>   
>   	if (xhci->shared_hcd) {


