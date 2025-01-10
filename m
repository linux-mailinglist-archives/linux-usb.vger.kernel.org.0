Return-Path: <linux-usb+bounces-19184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7CA0890A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 08:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7776188AEB0
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 07:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9A820766B;
	Fri, 10 Jan 2025 07:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Gyj3/OZm"
X-Original-To: linux-usb@vger.kernel.org
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2103.outbound.protection.outlook.com [40.92.63.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283AB1DFE06;
	Fri, 10 Jan 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.63.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736494678; cv=fail; b=t5BbR8zojmcfiNmHTVYyDrHpyil1PsBPYm5byiB/Xw3SkFvBTN5bO6wSX1IGJsJJhaHZJ6QAoSJG0+FmqLF+iXMXEUkkynRQeA+hKqmKdeGoLkaqRET2D2wT2X93ii/kvmAlqQsjpbHNWgk1NiAljGO3jeVpRsAzA2/YKywin7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736494678; c=relaxed/simple;
	bh=jCya0WTkzJp2X++hTzXi1szu1w7HNfDeWXIUgiTBvJE=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r9R+EV86wC548NkIRYQ+BVziQr/12b3KGkZ/pf6lrbMxQWEgZuoK69WT+wqjMIfYXalECVhd9d1QWiQh+A9zv51kc/Fr5Fz9jqavze1wAi0INKhRT2MXmRShIH7rkhwX6atH9mvVwBD35h9ggl7wj7lO1ldub1YiObpndV0FR7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Gyj3/OZm; arc=fail smtp.client-ip=40.92.63.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaB8L7nbL+CeG5Bmo5jhjQDK+FTwYQbJWlOsjadEeg30SaJsZrOz7XKare5n2CcM3C8YKMkd7gE3rnpEBvG2bJLZp25Hf2gvI7KrNBSf3IHdNATlKc6qOiQZZJpxzaCQFmIV30YuKom9vkNXKJaoMczaZooaXJcY9noA6QAJflqV2sPNCj/d5yi0T2GFu3cqV5qdb4UBgb4OXE2V8SI/hcblWzO+1AVehxrbk+mtlEGAgTAfvqbZobMasPzMOsyRa+aSKfnfAttuEG92S9MRtZ4Zvip5gvKS3cLydhpUWM+kpbl8l4w92bNmFzd2Btt+0d4yah2oLml0v+xPHR8pyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltCZNTzmgGSxXnksU5gwJSdic3c7JKcNwVghqBLJTa8=;
 b=pa9BopHGIO9Q3L9Qv0ko585LKApsmw25xJMCAN/jqz5MEME9cqTMhljcpXMQosiPOFAXG+PpGwgklmVBr3c9PxEZyoQ4XG7D2Eb7PIrR+/IyXwUJnUZFAjJ1LckpYqxcC+sX7RvTePjL3L+fJACtbrxwFEENCpqzny/v7OVFQ9pWS+leuMqeLKlaEPNpQ0b3eWQ9Y95tVYl4004fOycHBChs/lIN0VDjHwS2gPIbsDofDRAV/MK7UnQwmGxMG5/4qEpF6F04FIf7XNel6IY1iuW3CfOkwS62yx+7/98B7ej+AhPzG/0rX8cRPnmrns3j1yqQUjt5UTKSvT3dEgE1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltCZNTzmgGSxXnksU5gwJSdic3c7JKcNwVghqBLJTa8=;
 b=Gyj3/OZm+OFSvrIc5tvm2Avls8U2ffV/9fVAKyRNGyr1vHCvk/F1uN+UY18aZL2534YbGCj+cCMkCDk3h9+aZMJyN9iIXC0v2wL6dn+7g0e+iwp94COtEZkWbNe9Sm3udNWIfuWbMTe41kooYkRkYkF8q7a9e6z1N50HZGmKmxiz0E/7ypeULRdZAeJll8u9VX6ZJgVRLYyzvoMz0Dsb+owqUDHmyffUFleYx6VPvb5JHexQEx4JaOMu4X2d3x0K2UAyzdHvX6ymVJjHDihTGedsF+o1IcFfuUKB4wXM6zaRXCoDyIjauy7p6qHQVefTJVnREje+f/v9T+kELJ+4Cw==
Received: from ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22a::15)
 by SY7P300MB0557.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:28d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 07:37:51 +0000
Received: from ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM
 ([fe80::fee9:23d3:17b0:d2d3]) by ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM
 ([fe80::fee9:23d3:17b0:d2d3%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 07:37:51 +0000
Message-ID:
 <ME0P300MB055308B1FC5F1544F906B72DA61C2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
Date: Fri, 10 Jan 2025 15:37:44 +0800
User-Agent: Mozilla Thunderbird
From: Junzhong Pan <panjunzhong@outlook.com>
Subject: Re: [PATCH 1/3] usb: hub: add infrastructure to pass onboard_dev port
 features
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, gregkh@linuxfoundation.org, kernel@pengutronix.de,
 krzk@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, lkp@intel.com, matthias@kaehlcke.net,
 mka@chromium.org, oe-kbuild-all@lists.linux.dev, robh@kernel.org
References: <20241028214956.gmefpvcvm3zrfout@pengutronix.de>
 <ME0P300MB055370E97AB98D221B2E0782A60A2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
 <20250106065202.d2qdd7zmwk4h645h@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20250106065202.d2qdd7zmwk4h645h@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22a::15)
X-Microsoft-Original-Message-ID:
 <7b38199a-cc8c-4e32-b9dc-5051293a04ed@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME0P300MB0553:EE_|SY7P300MB0557:EE_
X-MS-Office365-Filtering-Correlation-Id: 6087e4d6-1209-437d-b77a-08dd3149afd9
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayFXX0mVJp9wZC4LLIW1QoQ+zY6XumdU1h9rMBzMswlE8qPb4att/L9n4SdMW4SxCI06nVMEktPIOo78y6z+AT/vJBzBUxmxTgOhg93tY1d/S24SFWRcqn174szP4+D4/RW6d5Jcmj+ntx0OoL2ns0yhy/APLhnE7uJUkPBmIgXq4YRYYrp1tPNXlY5/D92FNYmtgldH5RiBFNxfy/MXGWc0C6rrN0mgWg7uzmPCSntwcT04hIYfChbODtIFharPhj9auoGduz0vEcjIFVxRU/T+ceOXcaciU+3wQYCRZvHlpw1rx0wzm4UePbC8VzWeFVlf0ItlKFUh9zig6ldLMIdOMO/yrYCCV/jiXFTsXfDs2K9oGJSslQyDx7MvDG6qo/OVSTM2Q/qPmRwH4nTyIX68VZ0z731Lr49WJsOsXUg6tVsTXLaVs5Lm7YofRvHGNyItqEm3aR4Q9wkRfvEom/SxrkszViOdK9GC0ZRaVrZpsMOTZIQLri2PmYzxlPBCRNnCBUqsbG/US/gswNwAhtcQjN4W9pPYKUP2fY+vqUykjaaY32DzKsic29z3HpOISrZepZljos0CU3aARFxwG8nEjdgBaHb6TWiVfRXvnuX5wFrcSynO7RKU9cCk/RtT0QWvLsxChq8lUT6WrZP5JDopDqfnuz/Fvzsw9X7eEElqaUdV54ljmfoiIfE+lUMrET8L2Urnd9mPF2Q7OWTkUlQU+YBbMWGEo9w=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|8060799006|7092599003|5072599009|19110799003|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmRQL0YzU2hzbmdRWFFIUmpXRVhtV1g4ZWRLUjZMTm44TGVIQjBqa0RUQjNC?=
 =?utf-8?B?dEcxa1VmdUppc3ZJSEtyNVV1ZXpDeE9yTmh3Vm5RMFY0VS9XTzdXeUZOTWo5?=
 =?utf-8?B?aE1HQTRiVHFWd3BKYlNBNUUvbGVjQ1FGdEEvVzltMlExWlFRRmp6TDIzZU95?=
 =?utf-8?B?MmpOQ0VMQXUyd1orUFUyOVYwSUhyNEJJa2ZtT09kRFJpZTlpNy9MQ29IZWow?=
 =?utf-8?B?dU55SjI2VWJVMzJQcGQyeFhaWjd0eFhyRjJRZ2dSNjB4SitlRkk0eHgzWFBK?=
 =?utf-8?B?ZFNZd3g1R2JJS2lnREpPZzNMalZtVEFsTTIyQnJHSE9ubDlXOGw0aXhZVDhT?=
 =?utf-8?B?anc5N0xlSmdDVkViZ2RmcVZrYTNUS0hMRUcrVlFPeCtQOHhiSVcvZkdQelFF?=
 =?utf-8?B?UXpjeGYxR3cxKzJ1R2NUaTMvZVdyWkJtTU0rT1V3SGZnUDZuOXlNL3ZQenRZ?=
 =?utf-8?B?ekdGZWJpTDR2YXVDRHVaMWtuK1A3TTNPcFVkcnY4SGFXSE5QaHBnMUFGUG8z?=
 =?utf-8?B?dWRQenJ5WG8wcDZ4a0Rtc0ZqbUh5aXNGVCtjOU1KQThaekFwakkzUk9qcTRU?=
 =?utf-8?B?cFlvVnJYdThacFZqWjdyRmNOSVR1bE80N3RxUi92eStzc2M2cjdTZzBEWnBn?=
 =?utf-8?B?WVllWEE0U2FBVDVYYzFJL1U3bjY3ay9oVCtsd1EvZktSRk9OT25wZWFodVZn?=
 =?utf-8?B?SHo0dlZPSlNpOFBEMnJpU3pBWEZkaWNSTWllMWNiZ1ZFYlc1MDkwU2lJeURZ?=
 =?utf-8?B?NERWZlppajlMdEJHaG41dWdsbkwyMS80NVk5UDlrTVp4WXpnYjBCcXB6NjhW?=
 =?utf-8?B?RHZGZzNXMHB1RFI3eFJMN29uUzlnNTF2dFFPSEF0RVEzUzlCQkJSR0cwT3BC?=
 =?utf-8?B?eHppd0hVaUtiTFhiQ2xxdm9PeEN3ZWduZ1U5eHFwbkJNaVk2N25SYzdUMDdv?=
 =?utf-8?B?SzMxNWwraGxUQkhneDNQeFc4YzdDbUlSWmdrei82VUM2TXkraUhUQ2k0Q3E0?=
 =?utf-8?B?UDVraWtqckdlblZnWU5Jdk9PYXllR0VwY29KRlVxZXkwSWE4K2FQcDlPWXNy?=
 =?utf-8?B?VjR1bG8xWkFQK3IvUkprQUFSbjdrdE9KMSs0NmNoTG9NQXErNWwvR1ZrTWdM?=
 =?utf-8?B?dzJieHNNSzIxRkpWWHJwbHlQaG03WnVCdjJ6MzhwY2Q3aXNqRm9xaXMwc3pn?=
 =?utf-8?B?aThjbU91dTBZNjJPRnhURmtCVktiaFRzUHdlY3NET1BHQXFTUXJjRUJFaFlK?=
 =?utf-8?B?QUtaMTJJV1ZERzM0VDB0d1FReG03R3MxTG1wV3hpVzNzQnZISHBKd0x5MTl4?=
 =?utf-8?B?Nnh3bWRBTmtBZUQya1VwMy9jL3BLdXFXSlpxYWdvUWhYSnR6QjJRM0NhSTI2?=
 =?utf-8?B?MzFtTGJBME44ZXlUY3J2d2ova2lkMkgzaG1URzdSRTlqdmJsSEdRRGhycXRq?=
 =?utf-8?B?ZkI0eldhbTVtSzlJb2pxMUNmU2FLVjVzTDV2ODZieU9pQVFkMWN4ejhIb1cy?=
 =?utf-8?Q?5ZdkqU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnRIT1ZZSjZ3VUdxL2Z1ZmdRWFFHc2hMMUxidUlDUVRhalp5SjZOSndRRjlo?=
 =?utf-8?B?NHlyOUJWZGRNdFRleUtGRkxsdFpvMFdDTFhNZXJtVnRQc2w2RFRUbks0blZV?=
 =?utf-8?B?YXA1L0RxVU5LcW4yVHd0RVZUSlVRaFgyTzhHZmtMVndYdWc4eXRrL0Frd2Er?=
 =?utf-8?B?TTRlSEp3eGhKeWlWZHBFZis2Zm1JZWo5d1gvbVI0UHkvQlVDRmgzdGdQam5l?=
 =?utf-8?B?b0xFM1BvVTRidWtZQzdnMTdZcW9tVC94SlNUYXovSGRETTA1MHp5ZTl2M3Ry?=
 =?utf-8?B?YTJNRkZrSENiMm9QVmNMZXdBZlByeDgrUkJXUVpFei9BVmZPYUc2RXpOZWR5?=
 =?utf-8?B?cy8yZlZaK3M4Njh6OHlISnUyZFl2ZlFOUUVIbVFhdWlaV2h0b1gxM2E0TjBP?=
 =?utf-8?B?Nmp6bkxNYTVsaUFlZ1ZKSkhaMkJjMlorajVzY2k4dERRL1R5QnJWakpraUNX?=
 =?utf-8?B?bkZpMzdUcTNPU2xCVVpIL3JJK3FnRXVXcXpLQjQvQnA4amRCQzlobFFlNVBP?=
 =?utf-8?B?N3RZYW9Ja2I4YlkrTXdnSHZqSTZXVXozUStReWlBbm1sRkYzTnNRaFdKeU0w?=
 =?utf-8?B?bWwxRVFrWjdQUjFBMmNlTkl1ZkNyNjZ2cFE0dUg0WkNJSXlUVWk0dmFLUnpl?=
 =?utf-8?B?dlFiNGphQStqOGVQRnNicFIwN2k0cWQyRzlNT0ZBbFNuekNLOFNuZGxLWFkz?=
 =?utf-8?B?TW1qcTFxN3NjT2g2WjE1eWhpSjI0WGhvVUtiVW9GUU11NjR2WkhVMThpVVZx?=
 =?utf-8?B?ejRFVmRHV2FHODJLZ1BuUTNXOFVYNHRrTDVGWTZIa2lFOHJqS1lHa2RBVUxJ?=
 =?utf-8?B?YVloZGRBUWF1WnczRTZ3RUpnNndndDkxTm15U2EzM2tiR2RVR01HallWMUxC?=
 =?utf-8?B?MHdIbHFnWldqc01qTENRVWJjNmlEd2szUElMN01vaDk5L29WWEVBajRUWHNz?=
 =?utf-8?B?b0o4VHhVOExTUnVIaHVqcWdIQ1R6NElUYlJRcHdDb3F0cUgvNkN2MGgxNHhE?=
 =?utf-8?B?cFFSQXVxVHE1aEFRZzVlWHVjamFmdUZUOXFiWlZObHZTL0FGYkY5Nm5Wa0hD?=
 =?utf-8?B?Smt4dG8vczBKV3dzT256MkdvYUhBNVpqVkJLMjRmWXc5NHU2WEdXZEZlVjVQ?=
 =?utf-8?B?SHE5ZGY0R0RhTFQzV01LS2ljaUdLbWNLSFRCeDRTN3ROY0NBWVpLUkRzSk5R?=
 =?utf-8?B?RHM5UVRmY0w2ZGJxRk5VdDN6YkJVWnlPUmwrMDd1U0U4VS9uM2d6TTlsSnBL?=
 =?utf-8?B?R3k2NzN5dXhNT2VkTW9pMEV4dWhnTndVRDBIcHU3MDN0OGJnQXRrdDZCUXgv?=
 =?utf-8?B?TmI2Vkl2bHVaWE1uTEMzM2xVS3NwMXE1Rk91WFpNaTVmOEFVU28xNENPT0lQ?=
 =?utf-8?B?NTVDUDNkODUvN29QTkxibHUwTk4rb2dpR3VLbkR5Q0crWmtYdGphaVZJOTBI?=
 =?utf-8?B?UVk2a0NUU3dVakl4dWVQYmFYRFo0anZBaEhFWXd5MGFJTnZzWVdvWkxmM1Iw?=
 =?utf-8?B?M2RjTlBmTVRmalp2dDBWVHRaUlIxMzBFajd6RmNIc0V1b0JPVFROYkhVOEpj?=
 =?utf-8?B?eFQ2WVp5ay96WGtIVVVscXYxaWFvY3BXVXJ3MlM4SVAwWG1kb3RvZGtmK00r?=
 =?utf-8?B?RHNkWXM4eUdsenZpZ21xc3lJWmlQa2RvalM3TEEwQTF0bDZ4T0lPWkMxdVhC?=
 =?utf-8?B?QmRYZm5aOGErMWdtY3RmQ0lYWGx0aEFpWEM0R1lwenpUQlJxN0JMbnI3ajhh?=
 =?utf-8?Q?bZSowf2YXfTD4XiVhivNS6NAGLeES17CXGJGht/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6087e4d6-1209-437d-b77a-08dd3149afd9
X-MS-Exchange-CrossTenant-AuthSource: ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 07:37:51.1003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0557

Hi Marco,

Thank you for your reply!

On 2025/1/6 14:52, Marco Felsch Wrote:
> On 24-12-31, Junzhong Pan wrote:
>>
>> I recently encountered some kind of platforms using an existing onboard
>> hub yet their HW don't utilize the USBPE port power control feature
>> while the hub support it.
>> Instead, we have another GPIO for controlling the vbus of those ports
>> to cut the cost.
> 
> That's exactly our use-case too.
> 
>> Wonder any idea could use this driver considering the limitation of
>> the usb compatible set the properties of onboard_dev_pdata hard coded?
> 
> Sorry but I don't get this.
If the hub have 4 ports, but board only have one gpio to controll all 
those vbus at once, implemented as some kind of gang mode.

In this case, the onboard_dev driver may not respond to the 
USB_PORT_FEAT_POWER, but keep the supply always on except for the 
suspend states.

Do you have any idea how we handle this?

Best Regards,
Pan


