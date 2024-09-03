Return-Path: <linux-usb+bounces-14577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467296A2E2
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 17:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 494DA1C21F90
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 15:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B80518453F;
	Tue,  3 Sep 2024 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i826gd4z"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851D326AEC
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377708; cv=fail; b=pbGOfj0H9YYzl3l2RLLdAbCp3AUcY8XJjKznRC5kQCvo96FCX2UgwgHBCVXQipBLL+rqvHpUnLNi8/zDvX/aS1EKTy//uSJwGunR9/XTpnhP8KNEkrp9kP4vksvLG0e84OMals1dsy7hlIXcAobwyfHj1vwDYLsZeutKwAABMHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377708; c=relaxed/simple;
	bh=9YCNZ9rlWWuVy21f2BlYpPmWHtVt65EJ5qzuqNA7nwg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GGEZYEvmOaE5CPB/l4Cr8mKgR0JHN7b1PZvCyd8Fk5NZHoDhf7OMFRvTCmrhTbiiWCDtw94AikArT2ojeeFMe1TCD3lUQ8XwGjYhcLBdmRMEUKyPLtrcqsZgScnkjRAHB4wGib3bngHv4bPeNXSb9u1zoSKN54PbTplpDP+iTbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i826gd4z; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0XvUCv5ToWrIKkJ1JP9++JlHL1mCfCN/fUeZT10vcjIQyQcPOGVyIUMnk2JRcGqXeNIWbOz277/TfpkOgym2+T5o4TQVXsf0GzsZprf/w4nEY9XooH8oyUteX0St5noowfsRrBkEXTjHpOX5NgCvpqFzcyBwJbrvg81q9TXMnov3iY+IwXp7TIBYKXcwrRtikOLQfuCwNoUA/fDpw4U9jv88aLQSK5mi4T2/LX0ZR9Uky98L/slbchJS4TqaO9BU0x14KxHI4g7VHqCFFCshm11LWa0zEC6jZAGbdw8ss1IeIjVq61pMqmjv4w6unaCdSvUTGQ5hWwpEZPK96Eeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3njIqhHBSHKfbkZaENVsgevOAw1nxwke8lV+en6p9mc=;
 b=qZtFWJCrVx1aqhM/+sOK3JB1VYFD3fzcOnN5IYuDU2OIAVpudkHD/nTZl0h57bhy/LwGN85P+Qdr2n6zkxAxaiqyKFOSR3bbhs8oItyeZgRrg7T66KEaj/RlN+ydAxOHiWnWoXr9amoFgqYIbDRZa/cbN0FD/sMuWk2cGUjyGThRid3ZgrfnamUuGRujJxvvEaKVWtWtrnFCsLm0uCaYez2zMtm5PL6LenpZ8CZd7nctGI5VIooqrhg3G8yFs37D/RXKXbR35EL2skvSctgCDyFxMBuOKYYGzbqut8opHAFIAyOmNBAc+pkLckqO3NcvFeu+VZiGAjyIY0P013DwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3njIqhHBSHKfbkZaENVsgevOAw1nxwke8lV+en6p9mc=;
 b=i826gd4zFlJ93J0GZ6zyn2OO9GXGW+Tkh5LFr1RfsP5EQazpLqP5Szdr1+k4v6/D/5nCVTIiJjnz+mi3DOa8lIKRyoyF2ge7rHmubb2010Y5spvxjw5MFgyZb/ZdUdAa5e8ufi8eIXfq+wt+D0NizBDEsRoTnMM0hy085pxo+9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7438.namprd12.prod.outlook.com (2603:10b6:303:219::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 15:35:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 15:35:02 +0000
Message-ID: <321cf204-cf74-4f51-8ed3-8c5738444359@amd.com>
Date: Tue, 3 Sep 2024 10:35:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 "Rangoju, Raju" <Raju.Rangoju@amd.com>, Sanath S <Sanath.S@amd.com>
Cc: gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0128.namprd11.prod.outlook.com
 (2603:10b6:806:131::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da9a919-30ce-4ce5-0d72-08dccc2dfa4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elUvbTVvb054MGgvak13V3FJRnRjUFJUNHJid2lnZGNUOTJvWXg3aWZOZWNq?=
 =?utf-8?B?eEdxb1ZHbXVzdHZIbU5OMmRVb1BlWHBXY1J3OVdlMGFIVmhHRmVoNTB2Qm1P?=
 =?utf-8?B?SWxEaXgxa01QK2t2bmxwUXVRSGtjUXA3ZEphL2V1RkR6cFlIYXRnSmlSSDIr?=
 =?utf-8?B?NFM2QnZjVjFtSkRyUDdXcUNRcU1hb045S0x1dVkxejdIYlRJQisvTHdBMDBN?=
 =?utf-8?B?bU5xWnBKTjRQeGpWWnE0QUY3bmtYU0RkUG5ybW1Ec2pNa3NPYWRBYmg5dVFQ?=
 =?utf-8?B?OWhFS20xa0VNVUJtMVB4L1ZpL0ZCSU1KL0txQzFTMWlQN3lWMmYxZWFFcWVH?=
 =?utf-8?B?QWpTV3pFUkVGQ1R4ck5Uck53TUpueHptTTdEM3RUUWtjWWk0R1d2Z2FLZWw5?=
 =?utf-8?B?YlExS1Y3YmNsUi9SR1p0QW9IMnB2MkdkMG5CRGR3MHVMMkg0Z0xWdUcxczJF?=
 =?utf-8?B?aTVvUDJlWG8zVnQ0elk0UWZnelllSnJRKzZ1WXl6YlhhNURRY1craWx5eEpq?=
 =?utf-8?B?Qy9jV09Ub2tvWGFmYldnbThxZk5CVW5PVldST2M0WklZQXN2YXB0YXpHUzRl?=
 =?utf-8?B?THVOMVFGVWdiWGprMStseFFxWDZmY2R0d0NwS0Q3Tzlia0RYZ2xvMG1Pbjd5?=
 =?utf-8?B?a0ptNU4rYjQvODkwR3ZwQlhGT0Z2cWhCN0cvL2tnaWFBMkRYaHUwcStGeWwr?=
 =?utf-8?B?Z3pqYy9FcThkN0VLT1JjOWZkOGhyQ25JZTdVdnpQSncvSXlJdHR6RDJ4WnZh?=
 =?utf-8?B?S09oK3dzbDh4NHVDcVliL3UzTVVsajluU215a0VhSFNna0RlaEdVUURtQmIv?=
 =?utf-8?B?QlU5QjFXTUpIS2pTYTU4N3ZvYjR5dnBCZWhScjViRkVvV2dsc00vZ0RaTFla?=
 =?utf-8?B?RitPYjg1dUlPQmdFdC81OEFiWVA3QjBVYVUxTEpnWkt6T3NQU3RXeG9XeW1l?=
 =?utf-8?B?UXEwZnBTWlpBejJRSGRNdVZaQ091QmY3Q3dXMVl5YXVyc1ZTK0dhWE1Yc3R3?=
 =?utf-8?B?c2tYUWhmREtnY0F3NHJBYXVPay9PZ2JjZFhvZ1JQbzdqZFlhTDltOFB0bUxz?=
 =?utf-8?B?QzhwL1JqQy9ESDczangzTm1COVU3Zk5UVGNUYmZXTU1ncVBNS2NnRzFxNE5a?=
 =?utf-8?B?T0lONzlwTEFBTENCUTRwUHpjdmh1TzdvZTFIeWlhZmpPVElScDdhc0xTa3M1?=
 =?utf-8?B?bVBMUE5PY2NPZmNsc2dUSFNJRU9aeEduNDQ2TCtYNXpocUp6dDJVYnE5QmIr?=
 =?utf-8?B?UFd4S1psZlRleElsdnRINlNRbTFrUGg3QnhyTTJSYTd6cE10UXVHZ1BndmdE?=
 =?utf-8?B?ODUzYzI2bTNBV2J2SWVTdEVXT21NQ2x1QURrRnFnbzVJYWpRVXY3R2NtcVFs?=
 =?utf-8?B?d1BLdXNUajYvTHNiTldwN25jb2pKQ3ZNSlgyYUpMa1dhcHplcTgxYXlaWTRO?=
 =?utf-8?B?MXN6VWxXRkJhVTZhNkpaY0dJUTlSSVVCb0tXMWs2dzNtR210ZVhjclBBbWlX?=
 =?utf-8?B?Wk91bXIyQ1JHRmF3cVlUQkVQL25YbksxUUlQQWNPOTdLdThGQThkTm9Lb1hi?=
 =?utf-8?B?Sm1EWlZvVDQ2dG00K2F0YTd0R0JHZ0NXZTVBVWRkS1dQelEwcTdaVHo2V2E1?=
 =?utf-8?B?YkNxS05vbFU4UEZtYjM4YnRLT3J1Z2hJTTF5VTZiRkhYOHBIRmhaZGVxOTBU?=
 =?utf-8?B?NmlOYnJTTitraE16WDdMRFlzVjhsVGV2Z2l2S0t5RmRFS2Zxd0VoNmtKVUpF?=
 =?utf-8?B?YkdDWFRMZmJyOGNqVWxYcHJ3MUE5MHViWVNieWtyQStaSWNUTE1Bcmh0ZE9H?=
 =?utf-8?B?Y1dCTER2NDUwU2dPbFVDZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlFobXNwSXJKVURJbm5YSFVIL0Z5TllUR0Q5aThPWms0S3d6YWFTWTJGbHlM?=
 =?utf-8?B?Q21yeldCR1JRSHBMNnhBckcxSXgyU3NSLzJITjJMbGVCWkd5ajNENVFKNGRl?=
 =?utf-8?B?dXUvZGdWT3pvZWR2RDBsRUhwSTgrTXJUeEFjSDJxTkE2N2k1MHRIa0NPc3NG?=
 =?utf-8?B?WXFVYUt2QkRBVi9aRGsvTktsQTM3UWdNd1pBTGQ4RUhJV0crZDN2QkpTejhY?=
 =?utf-8?B?N0RTKzJnTFhPdkNQUzZBUUhaNjVQQlpwM2hFWWVhZHRmZjRlNXpodHlMdVdk?=
 =?utf-8?B?ai84T2dWY2I4L1h2UXVlcVY5THZXQzhGeXVmdjhXemdGdjlIc1ovekxXOXI0?=
 =?utf-8?B?TkQwY3RBTFVGYVo0NDNNd1pQU3FWSGllL205N05OS0hHajZBZzErOUFYZ09K?=
 =?utf-8?B?clBqUHdPNmh6MUcrVnVEZ2gyOWJYNkdrZExWcllUc3k5R2hvUnNwODMremhO?=
 =?utf-8?B?eGdGU3BLMytmcGNLQlRMbThXWE9CUjducWl6RStOalNiZE0vc3RoSWpxVWt5?=
 =?utf-8?B?eTI3dFA2RkNDVGM1cUNjVFB6UEtQOUlBaWpyQzhmcVRFbGZyVXA1Z1lOVGRG?=
 =?utf-8?B?Z2JFZGRJVW5XblI5YzRZOWlZNkJGUlZFazZkVytOWDNHQ1IwcjRkOHIxMWI3?=
 =?utf-8?B?bG82MnRHZG5tZ0l4Q1oraFAwZGMrM2dSVXpKeGdkRUVBZ1BtazhDeExra2Ey?=
 =?utf-8?B?bHlxb05mYkJNY2N5NGp5ZWhLdXVLbFU3T2Z0Y2VHbWhwTVF3SEwrV2dKM0gz?=
 =?utf-8?B?dmJ5T2RNc3pnRDdpODRYUzBPSHdtVVRSOWVlVFJqNXpTOVFOQ2hmMWRtTldZ?=
 =?utf-8?B?emNyQkIrUFNFWVJSaHpHQU92dGtHazJtaDNZR3R0NkF3eDZOOThFOXIwYU5h?=
 =?utf-8?B?bTJNSElRME4zNlZlREpWWXdDak95TTdVNjVZWkZ5UTZPQjMzSm9sWlpwSVpk?=
 =?utf-8?B?TklHNUdLL1paSWl2ME9CUmR5NWZRckRYSFNFVmtFZlY1WlFsZGdEY01UeDhs?=
 =?utf-8?B?cjBvc2l4L2VQaEZpU0dBRE1Pc1lCeXBQTlNOQXk5LzVzQlg3Rkl1SFRHNERl?=
 =?utf-8?B?Zi8waTErZnR1VElQK2FGb0QzMGFRWmtIbmp3ZlpCb2VheTQxdW1VUE5od2Jk?=
 =?utf-8?B?Zk4xYUU3NlhKMS9mMmxrNkwramJOdm10cUpTT1E3dXUvaXlRdFlmcGNjRGJH?=
 =?utf-8?B?VStPdGN6QWtRc05qTmJpTFZCVUtscU1iRml3Q3ZJZTZ1OFdZbFM2NThZR1g3?=
 =?utf-8?B?c1Zpa2RRUEF0V01IS2hMVHRFUU9OS0JRSCtBVEY2WlhIc3JyMGhIcWtTSUQr?=
 =?utf-8?B?NXQweit1ejAxYlJLVTFIblVPbGdVUEFyOWlBSGpCK0lVbHFDLzJVWEczVE5G?=
 =?utf-8?B?UTZ6b2g2R0Zxb1ZPems1Rkg4UERFcVVnQzluNkJ3NW9RNWd1WEFqU3N4b0h2?=
 =?utf-8?B?aFJlWDNKcm9TdFdBRjFLZ1hYQTlMUTVXQXFJSEMyakptdWtpSDAvZEQvNXVM?=
 =?utf-8?B?NklkUmplQWY1aEN4aGxneVZxeDZJRmFDL1RZcWVkNERMeTVYM0tJOUllYUpj?=
 =?utf-8?B?M0FCK09QbklNTGorMmF4Z1c4UjVCekVSRmVaRFJERXdvYzc5cGNON29tZFFF?=
 =?utf-8?B?U0dMNE1kTWZ1am1FVmtmRmhFMDJLcDE2L0NocndOdjJTOERTWE9GaFdwNE0x?=
 =?utf-8?B?eEpoNW5kcVNrR1JyQ2dxU1ZTOVQzNGdObTJZN3BxektMNmtCRTBtY3BLK25l?=
 =?utf-8?B?eWtlcUFxczlHQnB4K1Y3TE1BMXZKTTJPQ3oyVHROT3NPQlRPUzF2c2ZLWnVo?=
 =?utf-8?B?bGdsSmxPT0htN0pGYjgrVnhyVUNmN1FDRmZUc2g5aG9IVlZGNHlSL3M4bXlv?=
 =?utf-8?B?MlFLLzB6QjBXbElqL3RpUGRmSlpodmxPbm0zUk9EdUN2NVdXb0hFNm1vdys0?=
 =?utf-8?B?eFFiMmx0Q3Q5UzhLZjU1NW5BTkN4ZXAzNHBMYm1YajlkdUJ2VDluUWRXRUR3?=
 =?utf-8?B?WHZTalJVWGt0aHZzWTBIRWdqMk94R3E4Mk1mMXhSd01BRDB3ZzJlMlpHSGwr?=
 =?utf-8?B?VWc0SkJLT1VCUk4zbEtZS2RxRWxPbEtSWmtpa012elJ0T3RBS21nL1NoMTNE?=
 =?utf-8?Q?TTtsgNZicpk0Eu+fGZ0H6j/0B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da9a919-30ce-4ce5-0d72-08dccc2dfa4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 15:35:02.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Uk8h+drhbXe3ecjKFwph/oz/lfQdkRLald2NCEOSBYREVqo5MSP12qDRdkIQoLhP6dGJGjWPta1vGGN9aVSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7438

On 8/30/2024 10:26, Mathias Nyman wrote:
> The relationship between a USB4 Host Interface providing USB3 tunnels,
> and tunneled USB3 devices is not represented in device hierarchy.
> 
> This caused issues with power managment as devices may suspend and
> resume in incorrect order.
> A device link between the USB4 Host Interface and the USB3 xHCI was
> originally added to solve this, preventing the USB4 Host Interface from
> suspending if the USB3 xHCI Host was still active.
> This unfortunately also prevents USB4 Host Interface from suspending even
> if the USB3 xHCI Host is only serving native non-tunneled USB devices.
> 
> Improve the current powermanagement situation by creating device links
> directly from tunneled USB3 devices to the USB4 Host Interface they depend
> on instead of a device link between the hosts.
> This way USB4 host may suspend when the last tunneled device is
> disconnected.
> 
> Intel xHCI hosts are capable of reporting if connected USB3 devices are
> tunneled via vendor specific capabilities.
> Use this until a standard way is available.
> 
> v2:
>   Create device link by default if xHC host is not capable of tunnel
>   detection but the USB3 ports have tunnel capability reported in ACPI
>   _DSD object
> 
> Mathias Nyman (4):
>    xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts
>    usb: Add tunnel_mode parameter to usb device structure
>    usb: acpi: add device link between tunneled USB3 device and USB4 Host
>      Interface
>    thunderbolt: Don't create device link from USB4 Host Interface to USB3
>      xHC host
> 
>   drivers/thunderbolt/acpi.c       | 40 ++++++------------------
>   drivers/usb/core/usb-acpi.c      | 53 ++++++++++++++++++++++++++++++++
>   drivers/usb/host/xhci-ext-caps.h |  5 +++
>   drivers/usb/host/xhci-hub.c      | 36 ++++++++++++++++++++++
>   drivers/usb/host/xhci.c          | 14 +++++++++
>   drivers/usb/host/xhci.h          |  3 +-
>   include/linux/usb.h              |  8 +++++
>   7 files changed, 128 insertions(+), 31 deletions(-)
> 

Hello,

I had a try with this version of the series but I'm missing a device 
link from XHCI controller after applying it.

Before series these are the two links (6.11-rc6):
consumer:pci:0000:00:03.1 -> 
../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1
consumer:pci:0000:c4:00.3 -> 
../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:c4:00.3

After 6.11-rc6 + v2 series only this link:
consumer:pci:0000:00:03.1 -> 
../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1

Here is the whole topology on my system:
00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14e8]
00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Device [1022:14e9]
00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ea]
00:01.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ee]
00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ea]
00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ee]
00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ee]
00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ea]
00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h 
USB4/Thunderbolt PCIe tunnel [1022:14ef]
00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ea]
00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h 
USB4/Thunderbolt PCIe tunnel [1022:14ef]
00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14ea]
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14eb]
00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14eb]
00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14eb]
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus 
Controller [1022:790b] (rev 71)
00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC 
Bridge [1022:790e] (rev 51)
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f0]
00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f1]
00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f2]
00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f3]
00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f4]
00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f5]
00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f6]
00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:14f7]
01:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. 
RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller 
[10ec:8168] (rev 1c)
02:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5261 
PCI Express Card Reader [10ec:5261] (rev 01)
03:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co 
Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO [144d:a80a]
c2:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. 
[AMD/ATI] Phoenix1 [1002:15bf] (rev 03)
c2:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] 
Rembrandt Radeon High Definition Audio Controller [1002:1640]
c2:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] 
Family 19h (Model 74h) CCP/PSP 3.0 Device [1022:15c7]
c2:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:15b9]
c2:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:15ba]
c2:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] 
ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 63)
c2:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 
17h/19h HD Audio Controller [1022:15e3]
c2:00.7 Signal processing controller [1180]: Advanced Micro Devices, 
Inc. [AMD] Device [1022:164a]
c3:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, 
Inc. [AMD] Device [1022:14ec]
c3:00.1 Signal processing controller [1180]: Advanced Micro Devices, 
Inc. [AMD] AMD IPU Device [1022:1502]
c4:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, 
Inc. [AMD] Device [1022:14ec]
c4:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:15c0]
c4:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device 
[1022:15c1]
c4:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Pink 
Sardine USB4/Thunderbolt NHI controller #1 [1022:1668]
c4:00.6 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Pink 
Sardine USB4/Thunderbolt NHI controller #2 [1022:1669]

