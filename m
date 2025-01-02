Return-Path: <linux-usb+bounces-18940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968999FF61D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 05:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59ABD1624A1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 04:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B301189F56;
	Thu,  2 Jan 2025 04:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ffSZa6F7"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010000.outbound.protection.outlook.com [52.103.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400442E40B;
	Thu,  2 Jan 2025 04:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735792645; cv=fail; b=cLYwMs4v726tBQGLycdIGZ4lnlEk+xCQDEBEVVqFh65oQUVnyzpQhSkO3DTIRW0OAH0g1Z3BeXzDOOi9XM6F9Gi1OWemQRncoAakm2FkR1bD3DsRaSchhHf8RVwbjRxEHA1kI1OQmgXUDa6p2QB+1opXE/yd9uOb/LHesXj+HCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735792645; c=relaxed/simple;
	bh=8GbPCen0T1e5ptvmcPlDe43J+vULtSCQXC051wGmXCM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IfN5HhyOXM5GNEJ7AFjNm97jtWgIJIemD7RNfxa0Xpq2Hwb5NvcH5bNsZXsOEnAv1+jSKUtOxTXmlKUT8eeayOgMtGh+HMozM++RL0KnMfXMErUskzjO8mNPALehCZsgvHY02K8209hMY2nl80eKrzs8upuy3wy1BZLlEkTjOos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ffSZa6F7; arc=fail smtp.client-ip=52.103.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeYk6YKnOifIGpLZFDCsml4HUh6z8rZpeifmpts/5EXSAaPc6gTVuQMtSP8819/9eBp5llJ1bN89MZLIuArqte3aqngy++kH21Q/aPOwl3G8AsmVK7aDn/pq6W6AOZVbkt3ugNICctvmTMjGqv6Iu0PojtQM47znUA3G8wXkcGMU5fbYsSIi23oyB6xQLUtDOMsP3XF4zhh4lsdwePMYDE1teH5Z6ZbBN05C0HKYdr734GX5t3s8ssVOU9CGo9T/9CuxqzUSL4rqqbbF+Js4cBn951MGe8MhTsU8yCwRDdulye/RVo7k0n854Ch9LJXT9nGyG/cQAHG2tnKRx2J8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOlTaiyIWE7cX71YcO/DyI0BBAqfoHMGWenH/bX0TQM=;
 b=PKd+MGMr0BvSjkEh6mOSS912FnZCFyXRFR/BcuuOEQNAf3AOdp9s0v8/ytq8eBiEPCduod7jgjAZOVO2uph0mwJdjL4K2p2qKOQaP5OocNJqTLKO73+xXiChj7n0kjuXRycC4vWYBlSra6PZjMTCTC/CUyB13qwYpUrXstVQEu+S4drd6MwBlH4z4iGQGP7N0p84uYS51w0mavLiydoKKVM0b9uIXZcZjSTBofW0rCZstYlKlynmPNfSlmIt2Ap3AuDkC4ZpP+ZY7+SDhDyVbkiHIdO2DJb5lFTbM0MVT4LUBefYVpA6bMFbcLQOhMN22uwgOdws+VbP3wycZhWnDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOlTaiyIWE7cX71YcO/DyI0BBAqfoHMGWenH/bX0TQM=;
 b=ffSZa6F7KMvqhmZg4HA+evFdsmr8XqheZSqdhhJf9vt7IrZ/NQ5t46iYEB/8F+VYOruBuLcabNy1CKKFLSghmPh+UhzccrPp+GrVUdrJgRqCh937K2ufKYVkJ67ohbhftQwsmx295qlXp2edYGZCZwgIBQa1veYXAdkeYVBxGNLGsKeZbd7PgGh3nIpBExZQdGsD9TZfLiiioiyYYcjeHf040ZY7ic5dEOPNJF2B0XsFhbP8l8+HQJJIocs+GZypq6/RulfstFnVfiybhfOBt5s/X/l3tdfiiMaP+1KWErqnlUjNHYCgmJ0Sg+9mEZa5n0jNd0t7NODfBVTzS31HDw==
Received: from OSZPR01MB8434.jpnprd01.prod.outlook.com (2603:1096:604:183::12)
 by TYWPR01MB10908.jpnprd01.prod.outlook.com (2603:1096:400:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Thu, 2 Jan
 2025 04:37:21 +0000
Received: from OSZPR01MB8434.jpnprd01.prod.outlook.com
 ([fe80::7c3f:73bc:3c62:fe7]) by OSZPR01MB8434.jpnprd01.prod.outlook.com
 ([fe80::7c3f:73bc:3c62:fe7%5]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 04:37:21 +0000
Message-ID:
 <OSZPR01MB8434C2B2997FBE6B0DD7E53298142@OSZPR01MB8434.jpnprd01.prod.outlook.com>
Date: Thu, 2 Jan 2025 12:37:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] HID: pidff: Convert infinite length from Linux API
 to PID standard
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 oleg@makarenk.ooo, paul@spacefreak18.xyz, f.kardame@manjaro.org,
 jules.noirant@orange.fr
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20241231154731.1719919-2-tomasz.pakula.oficjalny@gmail.com>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20241231154731.1719919-2-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::32) To OSZPR01MB8434.jpnprd01.prod.outlook.com
 (2603:1096:604:183::12)
X-Microsoft-Original-Message-ID:
 <80294cf9-2232-4074-8921-5b30e1f397f1@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZPR01MB8434:EE_|TYWPR01MB10908:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a69daa-8b10-4281-a49a-08dd2ae7248c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|6090799003|5072599009|8060799006|8022599003|19110799003|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3V6VGRNSlNiVVEyNW5WOXB0YVZlRCtKMk1CSEk0N2xsWlNDemlmY2JUeUh0?=
 =?utf-8?B?bUpWcmhxUHp3bzI0cUJzeU9Gd09pTWRsZ3cxeURGYTNDeUFOSXFmZjdsUkxU?=
 =?utf-8?B?cjl1WEpieE1vazJ5dC9oaHRxVHE3NHJFaWROU0FaZUxlVm9tYjlJNXJsMG1s?=
 =?utf-8?B?dmQzV05YSnJSOXY2UTFmenMzUTlQbTUvalNKSXc2UWgvYVdOYlZRcEZxOCtC?=
 =?utf-8?B?dmFVbW5YUjZoR29EUE5CUWtIcmFaVzJGdXg5MWlpbTZMQTZCdGZvMmw5aW5w?=
 =?utf-8?B?b2NLS1pCOWJtVk8zT0ZnZis5c0VkdUppdWlHa0p2a0ZWRXhoYW41ZWVPak5q?=
 =?utf-8?B?UVNrNGpoanNuN2kzL3lCb25LcWJLdXdGd01WOVpKWEhCc0pxOWp6WmVnRzkz?=
 =?utf-8?B?aEQyWi9QbjRFQjhqNzd0YytVZ1NRVEZkMnE4ZURBN2g3MDh4Ynh1TVdNNG54?=
 =?utf-8?B?MXI0YjhCMkZMMFBQV2JDR1RlMm9USy9CbEVvRHdwWXlHWWJrQk9tMy9xSnlU?=
 =?utf-8?B?MXBSZmFaUm5TL0Q3SkVpbnVYRlBDL0tsSDZMeGhjb2VINGJNY3dWR2dQbkhQ?=
 =?utf-8?B?ZmQwS1ljcTlJMWZSRytmNmVUVzcyQTNBQmx2V3p2V3VubXpiTUNqOGNCNU5p?=
 =?utf-8?B?Uk9zeUlhK1d5MkFZVFJ6OVZRems3KzRsemxtK0tCNWtBZm5tVkpsRC9kRzZx?=
 =?utf-8?B?dVRIZWJ1NXNKT0drb05CeHQzSnVsMXpLd3pEQkxUWFYwbzdwaDc4c3Z3aWJZ?=
 =?utf-8?B?Qm41YUllYW5PM2YwbVdKU0xFclZUdjFPVWRCek9sU0dRUDRIWnNNZ2lTZE9I?=
 =?utf-8?B?Ym5SaWhGRVJYWldXckVYOCtvUG1QS2FxKzRFRDVDYnBYVFhGVS9haG5nMjU0?=
 =?utf-8?B?T2N0WjJzTi9hRXYxUHFGbXhMSUhPamlxdFpQenBzSXJQOFJoblBFRFBCOFAy?=
 =?utf-8?B?bS9URVh1VlJHODlOZlhUQ0tWaTRxUG1KWTMvRFhST05RTkJXaHZZRzg3bWp5?=
 =?utf-8?B?dVdiR2Q1OTdqblIrT2pqQ2NITVhDWDJvSTRhVTA0dUNmbENaRU9RU0Q1K3I0?=
 =?utf-8?B?bnhmOXpNR0toVUwwallTY3puT3lPL3ZKWVdiUW9CWTdNK01qQTFzZHREOUhW?=
 =?utf-8?B?anBGbndUS1AxMk1xa3B1eWNkc0VTVVpZRnIrY2dUUWhNdm5jOEtRdE8xMUdD?=
 =?utf-8?B?aHVzWkhKQ2VtZ1hZbjh1L3hlSUhKVHVsVVdqQlR5c0t4U2VWLzd2a2MvdG1P?=
 =?utf-8?B?blVWaHpSRi9oU0FkRHovalM1alNXNHllNmFPREVMaVd6K04zWUdkVHdqTzdO?=
 =?utf-8?B?d1ByWHpuTC9sVXJ5bTF4WGRINi8rOE8rV3FMVHNHbkp3R3R3UDBBZm1tdE9z?=
 =?utf-8?B?SFdBYXV2ZC9lbGhoR1Z0K1hGYUdIRDJsKzJtL0kvN0pHUERZdDVhNkZ3NjJN?=
 =?utf-8?B?OWJUbTl2Z2lMdjdOTTVhUWJ2bnFQanlGMGFSTEZ2c2ovczQxT0lFN1F5TVJy?=
 =?utf-8?B?blVzb2FZMmE0U3ZuemFWZnBzKzh4T0h2aHBWaFZwUEJrNzYxcUoxb3g1YThm?=
 =?utf-8?B?MTExZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUlTckdkVnhMdTQwZjJ0WGhyVW5GTzk4M3dMbmpJT0ZjdkxUSzY3SGdnZmZ5?=
 =?utf-8?B?MGQrSEZQTWxIMktuWkU3VVZOQWFkbWZjeWRlbmkvNlBaVjJORlZxb0FNeVJz?=
 =?utf-8?B?czJOQWZYUS9XRy82ZnpXUks4eDkySzdKUXV5aW53TjlURVowNnNQZ1JFODl3?=
 =?utf-8?B?WEJlSjdlaTFaNWVGcHNDYkpRdlh3UEFNZHArVWJianNBOTdOdzc5andKSWVt?=
 =?utf-8?B?NHNwQ29XU2tYVkhuWTFVZWhLaVp6N1JRM2dpKzNJMktsNzBsQUZBYjduM3lv?=
 =?utf-8?B?bE5qL3Bsd1VoMi83QXN5MERhV1FjUnRLQWozY21ydG52UjVkaDRXdzNaQTll?=
 =?utf-8?B?dHZoWmtCNmJ3a0wyVWI4bFpFUm52OXBObzZqalhwbzdUN0dvMkVERnJ3S3M4?=
 =?utf-8?B?eXcxK1pYL2dOZXhzREgzTGsvQmdLMmNob1RXb25vbVVZcDBrTTV1V21LbTI3?=
 =?utf-8?B?SDdpZDF1OVpySllNcDVYMzE4bGxGSWxGUDNSNXYvS2pFdDRBQy9tdkVvaUpa?=
 =?utf-8?B?cFN3M2lsSkhrZEpLSTBHRnZKVzMxZVhzL25kZTYvK1hWV01LUmdaeGlGa1o5?=
 =?utf-8?B?NmJENyt6djB0dS92ZE9aak1LbmdMTGxXeEEyeFZIeXp5SGZkK2FhK2x6M1dN?=
 =?utf-8?B?cXJFTVdZaW1pb0ZkTkZiSURtOC9KczFOMWZCTXRiOEREOXdXeEcrUEd5YnM0?=
 =?utf-8?B?Z1hLS200ZktqaXc5ZUtxaVM4eGFURDlXcjNGRjA4Z3NrM1N2QUxuZkEzNGJP?=
 =?utf-8?B?aVU4SzluR3o1U1BoY0t0d1R3V0JMZUluRlVHcFBSbHdKaEg5eng0bHRSWG5R?=
 =?utf-8?B?N0pIL2s5K0VsTS9OWVFsZS9VTnhpMzZYQ2pNWUZLNFY2UEVFeVd6bGtkNVNB?=
 =?utf-8?B?VFNNVDRNTHFZYTJMR2NPVHE1b2Q5eDZmaUxoU0MxWDdNUEQxWm45UTBkWHpw?=
 =?utf-8?B?c2F2dFduazdIK1lwVG9Ga1VBb2hNc2tNemw3T0RpUC9LVGxMWjhZY3dOMmFI?=
 =?utf-8?B?MGdlSlRuZEk2U3dTd3VUdGQ4U2hXeDNYL3BhUDNvNDR2aXh5YjZJNzYrbHl0?=
 =?utf-8?B?NitPa1E5WDZoU0FGcC94Ry9zMXA2Q2RPenJzUVo5OFQ3MmZxNzBPNGwvdkZp?=
 =?utf-8?B?WnoyYjhIZWNqZ3FPSndFOVEvZFlUeFlGY0dad0RFb21BQzlWK1MwdWhIQ2xD?=
 =?utf-8?B?ZmludU9IK0MwRllmOW14MGxMVVBpZ1ovV01SOVNpVnkva25DdUNLV3ZFckwz?=
 =?utf-8?B?U2k4SjVNZlpiWkhSZzM0L2VXZENzWmxESmhONi9BaVZqeGVvSUNxQ1B5VTVD?=
 =?utf-8?B?LzU3bVp3VGdEY2lnNHA2Uzl5bmxhWGxreFFkYVBPWEJFTzZLcmtWOWRGeFRR?=
 =?utf-8?B?Y2F0em5BTjlLNkk2OUcyU1dZSmpmK1FhWi94aE1aREV4UkhvVlpOWE1LMExX?=
 =?utf-8?B?U0h5Qk5US2o1NjVFM3pHTFFVRlFodmMxUGVNWG1TM29ibzgvMk5yZDhJNWJX?=
 =?utf-8?B?SGEvRHhoaTNXdGI1ZTk3U3lMREdZNmdEM1FJVDB0LzlBTW1sWWw0bjVRN1Z4?=
 =?utf-8?B?bTJJQ3lYcTgzWGtMU0hvWWkwajdmSTJ6M21DdW5KY2Zab1B1S2Iwdk45bkQx?=
 =?utf-8?B?cXFnQzMrWVpvU3AyK0NIazV0SndoT1Z2cFI0RFNseGszWlM4Vi82RUZWOHBu?=
 =?utf-8?B?WjZlcG5ZNWVTV05hSjJpazFGUUpjNkpvd0g3aVZVZFVuV3phTGU3aGU4R1Bv?=
 =?utf-8?Q?8vSwwhhob2wVqCQQ5Q=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a69daa-8b10-4281-a49a-08dd2ae7248c
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8434.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 04:37:20.9268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10908

Hello,

在 2024/12/31 23:47, Tomasz Pakuła 写道:
> Linux defines 0 length as infinite in its force feedback API
> while USB PID defines NULL (0xffff). Most PID devices do not expect a
> 0-length effect and can't interpret it as infinite. This change fixes
> Force Feedback for most PID compliant devices.
>
> As most games depend on updating the values of already playing infinite
> effects, this is crucial to ensure they will actually work.
>
> Previously, users had to rely on third-party software to do this conversion
> and make their PID devices usable.
>
> Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
> Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>   drivers/hid/usbhid/hid-pidff.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
> index 3b4ee21cd811..1b5d3db62c09 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -301,7 +301,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
>   		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
>   	pidff->set_effect_type->value[0] =
>   		pidff->create_new_effect_type->value[0];
> -	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
> +
> +	// Convert infinite lenght from Linux API (0)

Typo, lenght -> length


Best regards,

Shengyu

> +	// to PID standard (NULL) if needed
> +	pidff->set_effect[PID_DURATION].value[0] =
> +		effect->replay.length == 0 ? 0xffff : effect->replay.length;
> +
>   	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
>   	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
>   		effect->trigger.interval;

