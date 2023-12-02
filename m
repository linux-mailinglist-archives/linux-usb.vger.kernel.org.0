Return-Path: <linux-usb+bounces-3599-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 161AA801DE1
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 17:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAF521F2109D
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 16:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AB01945F;
	Sat,  2 Dec 2023 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ClQn9S8n"
X-Original-To: linux-usb@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2094.outbound.protection.outlook.com [40.92.98.94])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F706FF
	for <linux-usb@vger.kernel.org>; Sat,  2 Dec 2023 08:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fr+ypT6yH7f/OXSCgUpm86q73sbyI9dZTdLyzntUnPWeExchefUDLWjUJ+gd9QbrQzt65gMJfYr5UyaUZoUstWfVPFDXzkD1iM3BIN65EBDGcuCYuUcte9q2JSoqfrj6KvjZA3e9dwiFQbYgtavCBeghEpMOev56ByaTb/0tRuPmlBQ/iRy3VSzD7xs49PxuNO0m/NCLYGWR8bwJw1H1v4DzUfBTmlBTHIJ47b2Xn4ifeFeRrjl831h9R5rWpv/X3Xb1EqdClY70/vuwKTSsiUTsRSh3c0XFghyBQTUkpel08P/PMVYCdDlOUFqk8Q9aA6aAgtE176P0j8ysON6VYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlxl3A53FcoLHJfjDXzvxyFuRBgLcPbBOoyFTiOqHVc=;
 b=SxU3J0EIOE3Y1+zVElyfuAmRDjZruJ7SdWerXPMd6bOcqT65GG6nymHxRV+uVpawBNA8IIl9jh67MTgp5hpsnBcBvEVmmsBFhLrRbuEMq6GcVCq+hdHv7XW0aStfgQATNIKL3Msujh9N+0PozUpEGVHqrvjLE/VhqsnluJXMOIopX30jNcWq8jsMRWbv/sCioPB/ppUVQanE9evxhvefArwwxRYfXrzb7aMG0njxcyyUdoUhlTpBNm6uedDawgHEAHVIFrJFBMqC/ipaO5s6stVLDLs8pnKeRBHJmUdAc96fqN6NFHLorMf+aU9xFDo6DGLT8R8ClVBQ2meZQxtqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlxl3A53FcoLHJfjDXzvxyFuRBgLcPbBOoyFTiOqHVc=;
 b=ClQn9S8nUq8EPVavkhejwR0wtjCKt+6vJ2MtUGvCnixYY9ahhucj+LSCJGEBKb0JD4zhmw6PWBeg/TdLQjMxyhJHn3+eP8dUZukGTm3ADffz5DJ2TWR1MveVvKMqcIeUplcguJ5VeQ7w6RqWuVTom71mNSOXCtKEHmgT0EG5ehK+BVwTqizMT2sF/HaiRz21I6kMVgsbxgcL8zgh9DZhlceT7fj4J76E7iIsB4Xyd4JaS3QraBdmpoSW4KxALDqDRTDy1opVL5BRWays6/wdwxKIQdMnTHlGPlojANHXMHn4GTWeoppVsKPa0oM+17oNIZeKTOy6fW1cTnopu+zcMA==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
 by TY3P286MB2625.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:250::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.30; Sat, 2 Dec
 2023 16:53:35 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6801:95d7:c963:398a]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6801:95d7:c963:398a%4]) with mapi id 15.20.7046.028; Sat, 2 Dec 2023
 16:53:35 +0000
Message-ID:
 <TY3P286MB261125DE4E90CF944802C2A99880A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Sun, 3 Dec 2023 00:53:33 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Revert "xhci: add quirk for host controllers that don't
 update endpoint DCS"
To: Oliver Neukum <oneukum@suse.com>, Jonathan Bell <jonathan@raspberrypi.com>
References: <20230713112830.21773-1-oneukum@suse.com>
 <CADQZjwcF14dme4yT39pkGE8Xg+0i5Tb2vz8apb8M1RoB42CQjg@mail.gmail.com>
 <3386b05b-92b3-0285-9d4f-a21b53716f0d@suse.com>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <3386b05b-92b3-0285-9d4f-a21b53716f0d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [S46QsYsVhq8Ll0/uXLx/x9YeZayz5QDarJko5dYFV8f6CrQfGl1waSrglCZr4zIe]
X-ClientProxiedBy: TYAPR01CA0234.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::30) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:23e::10)
X-Microsoft-Original-Message-ID:
 <a2366715-01d5-4cc3-903c-c70480b990a3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TY3P286MB2625:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d10f5cd-7340-49ff-dc03-08dbf3573927
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hr8pTWfTPFejgJ3ZcSJtnWHPfuLEz5jMNMWMr4vIryYndDkLxDJeq7vvgUVijWLZs64TyiIxuzq45+PIFS7BD7JEANZxmzMSFewdBNJPasL0OkMWn2ad30MZ/TkUquhWYjvlNN8nabXIF8BOdwPZ5VyapmI7upd+lSEg3zhfpo5QztZdcTSM1HoS8gqjKeM773LvIcacBRHJGMndCxSJpY/g1Sy75JyD9ARiH359XEoS326Q43JNiZzziwWgkM1aQAoyEMBZBOvqAt8KPJuSFD92JoGX0LUWU7EQJXnmKDp3OMofQU/tc353EM0GerlFufAT0ghbhkjN1cP2UwrrKdiI5d43/kR1yoNkOWNF7s4QM7rg4PYmTJR2CobsqgL9A+qqiPR1vJnXvHwuA6+pfV3kCj2KlvkVZ08isiKuP6knGAtDzO6ytrL8pbTTXGxQ4JXSrBLkANQvJ2sNy95p9TF5+bvZi17MobqhBcEe+4Xn8LWbqWEr+ZG6/9qA8wjgOreYy4eF4xZj0hAMIG2/nYl4ffsll6auFi++DdJX5ShlGjIHdV1d/NtVZBdTj9kcqDYg5SxTX8tIpXPaIzsTqrNkIJgqciZFfIwRNw5KTmmBRK1hbUPb+NfLgwccDgZ7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUo3ZDJWVWtNeG4rK2ZoOGxhY2NjNGxOUUpiV3R6ZEdXVkpZeGZGYVVnazFW?=
 =?utf-8?B?R25SWlIvZVF3Z3AzSmlCRW53ZVdTNmt6aUR5NmhTb3BvakNlanM1bEQ0eHNZ?=
 =?utf-8?B?d3FGV2hWTGV2bFZBblk5THlEb0tlVW5ONHNPc3p4aERVUFFkSjhxbWlrTDJr?=
 =?utf-8?B?cG5vSE8rN3Y2c3NVUUNBcXFlcWdtcUI5cVF3YXRQSWpUSmJDOURqL1dScEdD?=
 =?utf-8?B?MkJDdWpQNjFwMENTUjFwN3RBTUY1RzFwTXJrWXJqNzhvZ1NCT0V4bnVYd01M?=
 =?utf-8?B?NDNTTWJ2bUY3eEIrZ3ozTkdtMkN4UFBub04yU1U1citPWThxcmlaaTRQVmZh?=
 =?utf-8?B?OVo2V05zTmxCU2xYd1FMY1Z0VGg1ZWhuNnBqaVQ5a0RRMUdycy9aYzRxUkhz?=
 =?utf-8?B?Y1BEb0Jvd1JleFZudHlFcjdUWmhmOFJyMW4wTnRHNWZiVUxXMkRZaVllc1or?=
 =?utf-8?B?aFEyUWRURFlLK25QWEp4REFYYUZMRUI1aVc2NjFmcTI0eE9ON0ppMk9nQ1ls?=
 =?utf-8?B?ZExrdTNnM250UlZBcGRLbEowemplaVpRZ0lkMy9iS21kZXVDVzREdm9lKzZK?=
 =?utf-8?B?Z2ZlRUMrMW1FVjVMdDRPTTNLMSsxTGlqKzhjU2tpL0lZNldDRGVEU3hSVjdJ?=
 =?utf-8?B?a3lYckJmTklTTldBdkE2akJxT1lmdmc3aXFsUkVkemtkT1NSaWFzM0hDUWpi?=
 =?utf-8?B?bWdYMjlRNVhURHh6SjQwcCtWNkZLN0JPZkRHUmJ4UWlGdjVtdk9kL2VETTVF?=
 =?utf-8?B?YVNnMEg4azdsd3dMZ1daU0x4SFUzOEpONEwrK0xSVXdBSy9pdHV2K3pmaXp6?=
 =?utf-8?B?MFJja0VMSWhnQjVOZGVOTEgwbjM5TDlUMjhqU1FlSXhWUldXZS9odjA4TUlW?=
 =?utf-8?B?K1FrRElnNnVNTy83VUViNjFvd3pqemJDZ2FJL3Z0N0J4WUJXWXV1R3RoMi9G?=
 =?utf-8?B?cVkwWUhSMDdVcHU5cS9pVk14ajNYTG9QYVF2QTE1SUovRjdRL3hoU1lrS1RT?=
 =?utf-8?B?cDJKRHJoRDJqcHpsc29JdVA5bDRlSFY2V0w3OEZpNy9TSExLdjFBSUdIOElQ?=
 =?utf-8?B?RXNuZDNSZ3MrbmNkbVcwS29LMVNRd2FGc3d1SzBLZXRnQkhGU3FxOXBlQ0hG?=
 =?utf-8?B?WGkva0xoMDJmalQxSlUyNGZvbDYrWDZuaHNXOTRRcER2cjRXVEZLVUwrbTdK?=
 =?utf-8?B?RkFUanFybFpNdzk3ZmhPclNkbVhqZUJydkd2NEp1cFVCOExwK3hpcDh3RlRV?=
 =?utf-8?B?ZU93MVZYNEw1THhlY2JvaVVwRW1teEQ1ZWtETTFXNERVdXhyb08yZXA0ZXhJ?=
 =?utf-8?B?cGUyVEYxYU1wYnZqVWxkS3VXMGRQRk11UnJYcTJYQXNCV2lnWWNObXc4aUdU?=
 =?utf-8?B?d2tyN0N1R0JVcHB3VDZ6RUxxRDZER1pCcDBUSkw1K0dCRDlMTTNGZXBBZlNY?=
 =?utf-8?B?QVh3UGxscnFiSk5HcmdOaG0rb1dZc1Mzb2RGVHRsTnYrOGVwSUNZM3lDRDRk?=
 =?utf-8?B?dDVNem82N3IwWFVpLzBzZ3EzOWJVZEZ1Tm1SVnozd1d6MFlVNzZ4ZFVEVG91?=
 =?utf-8?B?MHBFMEpvRGJJUHUwNENwU0ROeHViV0t0NVVURE5TaFpGWkg0dnI3MmVnYnZD?=
 =?utf-8?B?NitPeFY5SHNpY1ZOMmVqZWxaQ3ZCWGVEVk5wVCtpQWV6cXdITjhTWVkrVGNJ?=
 =?utf-8?B?ZFNtODRQMEp4YTg3d3hxK283Y25jTVBBb2plUzNvSFdTekZrR0ZkdTJ3PT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d10f5cd-7340-49ff-dc03-08dbf3573927
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2023 16:53:35.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2625

Hello,

Any news about this series?

Best regards,

Shengyu

> On 13.07.23 14:27, Jonathan Bell wrote:
>
>> Odd. There are many third party VLI cards in the field and this is the
>> first I've heard of an incompatibility.
>> Can you please report the output of
>> lspci -s 0b:00.0 -xxx
>
>
> 0b:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0
> Controller (rev 01)
> 00: 06 11 83 34 07 04 10 00 01 30 03 0c 10 00 00 00
> 10: 04 00 40 fb 00 00 00 00 00 00 00 00 00 00 00 00
> 20: 00 00 00 00 00 00 00 00 00 00 00 00 06 11 83 34
> 30: 00 00 00 00 80 00 00 00 00 00 00 00 ff 01 00 00
>
>> and pastebin a dmesg trace with xhci debug printks (and the quirk) 
>> turned on?
>
> dmesg coming up.
>
>     Regards
>         Oliver
>
>

