Return-Path: <linux-usb+bounces-18907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1789FEE61
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 10:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0407188314A
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 09:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF411925B6;
	Tue, 31 Dec 2024 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oqUlmEkS"
X-Original-To: linux-usb@vger.kernel.org
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2088.outbound.protection.outlook.com [40.92.62.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A618B482;
	Tue, 31 Dec 2024 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.62.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735637661; cv=fail; b=cwX3Uv7WYCJuyrhQtOyASHpNgxkvGLqqxxMOrByjhHKdBu/qNw4O27jZngZfHGHUoSdqk+uKphZpGrenOtZsiPurD1MdKJ/2ZHntN1i8YsiHHFGPyqFU3Yo8cuofjcQfQM8/Jl4e6f97f8igol1JljxyoHwUQFpnjp+gzD5sf5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735637661; c=relaxed/simple;
	bh=0LVhbMByucJjEjpGF3aCtEmB/Fyecv0tJlZpegXAD6w=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uxCdmwgnfDk+At4mZnyDkzwgSKfg9pYOhDvH7AMhx3r1jz7V3Kv9vGN39H7lhtrLPOi3yrViCW3OIqwHq5HuZn8CbxMXK6My3ehZOSEv+p2qjMfbV/N2unJ6hS0yPUquQtSG1tKRpilzhEiqol7Vby3FWaKNDQ10gTG5kg49fok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oqUlmEkS; arc=fail smtp.client-ip=40.92.62.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzCeY2+rnhn9qbcspt2RuuFNk7bGc3mvVtUTdKYC/It+cb5dbPfGXzZ1ViaW/l8H5GyQya+yglHaMCeOozE4JyRVN6NOG2ycarcuCGRHPcPgvkGG6qGc+h34I/lZCsqnMsH2SC0N3DdeK3Y9V+rOGMctZGpTOY7TA45fe4DGvcFTuliyy42KZ9Y6K7HoMgDV02MF3Q5UUpXRbURV5y152iW0+c+9e2d5MZ+25lQL5RD/zrAeBFpDH2leKAE6UhEAxqLoc8CGOh28I/hj88nTLfs76IwDyjNHFH6LY2SbD2dxV4GF1NsxjePbQpjNT2p/Nfb/RE05d6jTuZlM/yTgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LVhbMByucJjEjpGF3aCtEmB/Fyecv0tJlZpegXAD6w=;
 b=bvj3yuD5y0GLVEV0rIE/znJOYCCkq5xmDhdkT1nK5D6uN7//SMvsGWVGhbiaUF932+SZx3BfLcHe/pwawG+Ki+68k4WgGUPWBdYdz1pCO1WY/X9jafyECBdN8UUpT7gruKwfa9zRTMaUmDopURRkDmO7H6HzCZu1dWxBFh3YOpkl4QrMB2ZfyaaVt6AQnpjnsOFPSpipxiBXE4HRAMIWOes6o1E84Mh88qEbg/Dm3B0N6T8EokCwT1G1GaPOmlZQOr8DGaR8vU4XmGrgLkBlljo16RSET9NUgZIaSJuCSNtNqH375oVRhtqww+SBclfGY83Kuh9u1skgR6FKkxsN2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LVhbMByucJjEjpGF3aCtEmB/Fyecv0tJlZpegXAD6w=;
 b=oqUlmEkSJpkw8oE+j/mqF5HfSmurntIpGi+QncMM9te3p5torKllzpECplKXafhBUD5QWWfQc0Z/q1IWSQ14UDrN43OeAR/4b2AYzvq3TqRI7XkfTcx0sgLEFHp1nytL/w8jcohsnJZIi4Rv6INWZAn2JvXhyS+hkpqqjztjqZyUfX1kZVFkmtHO1iLdWS8eB3n31QxxyTOHiOoMVB11gkUJghRDGiZGq1XV4GOLCjdIi0tRf1JTeQw558fjFtuoA7MyJ/npLSTYwPNdzeW/8TMRugP3rrxaROJsMJ+BiQyVplEmmPG0Is6K0RfY4IqgXS6CIlVS1K8cS/xdvccnKA==
Received: from ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22a::15)
 by SY0P300MB0309.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Tue, 31 Dec
 2024 09:34:13 +0000
Received: from ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM
 ([fe80::fee9:23d3:17b0:d2d3]) by ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM
 ([fe80::fee9:23d3:17b0:d2d3%4]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 09:34:13 +0000
Message-ID:
 <ME0P300MB055370E97AB98D221B2E0782A60A2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
Date: Tue, 31 Dec 2024 17:34:02 +0800
User-Agent: Mozilla Thunderbird
From: Junzhong Pan <panjunzhong@outlook.com>
Subject: Re: [PATCH 1/3] usb: hub: add infrastructure to pass onboard_dev port
 features
To: m.felsch@pengutronix.de
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, gregkh@linuxfoundation.org, kernel@pengutronix.de,
 krzk@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, lkp@intel.com, matthias@kaehlcke.net,
 mka@chromium.org, oe-kbuild-all@lists.linux.dev, robh@kernel.org
References: <20241028214956.gmefpvcvm3zrfout@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20241028214956.gmefpvcvm3zrfout@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:22a::15)
X-Microsoft-Original-Message-ID:
 <4faf8cb4-5b6f-4fcd-a2e0-ae32056c5736@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME0P300MB0553:EE_|SY0P300MB0309:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed1b98e-828d-4e8c-7e18-08dd297e4920
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|19110799003|461199028|6090799003|8060799006|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3RVTXkxV3NxbUNTRmhKQ1FRQ0hzRHkrM0g1VWZyZGFoVU8vTXNBOExHTTkx?=
 =?utf-8?B?T1NBVTRQSVFuTWZOMzNpZi83bE5meDhoN2IycEN2T2ZVN1p3cnpxSzkzaFIr?=
 =?utf-8?B?Ynp0ZmVuSXVmWlcyeTZKNVh1cXR0U21pUzVuMjZpbldhVkR4bEgrbEhhS21s?=
 =?utf-8?B?NG5XQUd2UW5paVc4QXlhVDVzUUJjRVZzSzc0b0J5K0pQbTI0NG9iY0xxOEZH?=
 =?utf-8?B?d0ZQUHR0dld5SFBMMDJkQXJFYVFBNk9jMC9CWDl2ak1sKzZ4Y0lEcUFLa0Zq?=
 =?utf-8?B?T2cycVJZQ2ZwL2d2Y0NCZm1XcDBCS3hFalFXN1hwc3JSQ0ZqaXhJTUV0MHdK?=
 =?utf-8?B?bytPZ0oxVWJGL0R0bFZEOFRwM1pzR2FCWjlxOVRVeUhPWGZyMnRMeWE5WVVK?=
 =?utf-8?B?cnlhTUtlQ240ck8rQXh1T21HK2kwc1orMStMZXNlb2ZQZ2J1Q285dyszcHho?=
 =?utf-8?B?ajhHK3RLWGJydU16d0dpc2U5dENEWTB0SUxmbjFYQ1A3QXJvNmJFZkp0VUNx?=
 =?utf-8?B?aDAwQnpwRCtNMFYvdHpmbmhFQUwyeU5kWGppM2U5b0ExdFpXcWpjVmxHQzNs?=
 =?utf-8?B?eDNIZEphRlozazUvSzVnbjJDWTAwY1FKa0RrZHprbVNLWDdtVGpmQ1dQcUF4?=
 =?utf-8?B?M3RBbG82MFlnbWs2Ulp3NERlZllWdk5Dcldnbit0dVNwUlBWWTc3NXpVSnRj?=
 =?utf-8?B?SVFMMy8zUDhWempLNTdYci9tMDc0R2t3d29tcXZFQXV6NXNkSUpRb1RLRm1o?=
 =?utf-8?B?U2tGSDVOOS9wWmpWSzJhcnd0bUxGd21BbVAwTndCQjcwaHhOdXJ2MWJwNDg0?=
 =?utf-8?B?VU1LMkQyS1Q0N0dubzFhTEdxSDRTNklCU2NmNFVmdDE4VjM5SnRiSXVaZHRn?=
 =?utf-8?B?NnVHVTEyWjN6blg0cUlFY3Zic01NalFTVXk4bVhmOXIrWjNINkxFQ0d1Skxr?=
 =?utf-8?B?WTJwSkdEWHpJaUJITGNWeU8xNHBMbng0Rk9lb3diUHkwUDgzYnFQNUVGQTdN?=
 =?utf-8?B?VmE5SjA0ZkVNaGJIWEFjMEgvYWNkeXhRQlhnbFh4MlJsZGtjU1cxNldMVjFM?=
 =?utf-8?B?dHNZWEFCS0FSbUt4eDRIMndHcXBYaDRKcDJaN2VXcGNWT05HWUFkeEYyYW9s?=
 =?utf-8?B?ZVNnbjhYUHMzZlhOY25UZWdOeVZaSEE2SGJlblE0KzFCU2pXaVZycTJ5Znk0?=
 =?utf-8?B?bWRjV2NlSzZuZG9pTXAyanBoYWlKK0dQTlc1T0lzcHFKWGk4aTRkZzVOS0pS?=
 =?utf-8?B?MEdpSWp1dzk4UStvVlVKY3BUTmxnS2lhMk5NdnFSanY0clBEWjZpaWlQcTVJ?=
 =?utf-8?B?MEF1YmZFdjlyMHV2UWRsNlBBcWEzWkV6eDlzQTBwTHFSZ2tHdmFvUk03U3Zv?=
 =?utf-8?B?OG0ydEJBcjMvYngrY0w4VjU4NHJkOVFvWDF0WGwwRjdEb3BwdWFDZk5jNVRC?=
 =?utf-8?B?M1E1SDNhK0FqQkFkRlVKMk9sdWJqb2c5cE9SYnk1bVMvbWN4NkVkZ3AwMlBn?=
 =?utf-8?Q?dnx7I8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnNLME80RnIwSjNkbm9BL3RoN2tNajlORWJDL3paQlY0NGViejN2aEZGUkl4?=
 =?utf-8?B?TXZRL0pCekdJWHRWQ0VpOEY3NWJwYUhsYVJYSTJSRmwzRzV6LzJWeDZwQit1?=
 =?utf-8?B?OUNuWE9Jem55N0RkY1N5MzBiNXhaUUJkdS8xeXQwUWJFUUlGRGx5NDlyYk10?=
 =?utf-8?B?TTlQdkJ1bmZMc2ljNGFNNlAzVXg1STA5bnpYbkFwajMycWtwNm1jUll5KzJM?=
 =?utf-8?B?ZDNQSENHUWJmTVd6YURPSmM0alY0K2F0bWhna0VnaFYzV0V1TUZ0aVVCKzRH?=
 =?utf-8?B?b0x1cG1NS1g3aXBXWFg5Rjh1dFhtNTlRcjVkNk1iNnlRcXZSMHRYUU4vd0cx?=
 =?utf-8?B?OCs0NWJWM1VDcVhDdjhodngvZVFZb2dUSFZlb3lieEZUN0VtbWszTmdRYW5h?=
 =?utf-8?B?YVh1UTFUWCtaRjM0V0J6RFN6VDVoQ25oWG1ZaWlsUHZFNFI4TjJ2M2VHWGFO?=
 =?utf-8?B?U2c2N0lSS2d3NUZOY1lJQlllZ1FoMzBTRWRnbkdJMENXODNldFVIVXRlQ3E2?=
 =?utf-8?B?Wm5GazFjQmFnSzZDOEUybUQ4MDN4Mzl2M0hLV2ErR0xreXlSTWVhc3NBL2xR?=
 =?utf-8?B?QnRMd0RPUEVybk5VRlRrL0FwZjMrRXVDbkRCSWNiQVZIbVlrNGpibnIzYTc1?=
 =?utf-8?B?bXFUZy91WFBLS3k0VDJ0RWpBL0FaUlhGWjl3akxmUG9yT256NXFFclloZm12?=
 =?utf-8?B?aVpSZU1BejNKVDNKam9SZ1V5RkVVUGNZbXFrcDdXa0llajdQZUtwRlUrS3M2?=
 =?utf-8?B?NVEvUFliSHp5Qk9JbmdsTW1sMllLUDZhVlBMdmR0aVdrU1ptYzArcHNnZWY4?=
 =?utf-8?B?bTJwcjZ5aE1EYXdpZHVnSjlyaU9sejdyd1hqamxPVC9LMXRFMVljTERGZXpD?=
 =?utf-8?B?bEdJT285SkhEeGpIOW52WUVnczJLQWVFK3BwNS9WYnphL0loenBXYjZBbzVq?=
 =?utf-8?B?YSs0VVBuUjUvcnBMK1JEVnc5QitWc0ZLbGdsbHNTekVDSWhpRTJUcFdrQlRO?=
 =?utf-8?B?TVY2TnhvTmc1d01pRmlRcDkxb0pPOUhhV3VpT0tzd1BNdUxSaWZJUmJEa2lQ?=
 =?utf-8?B?bmk2YWlQTzI1eFFHQllpSzgvVEwyQjF4b21GK0d3cHJQUUtiMytUajREZm9u?=
 =?utf-8?B?Z1YvcmtkcEZuZUpxQkJCRnpLVWI0RHh6bHpsSWwzSkFLeFhoOWduQW1YRkdh?=
 =?utf-8?B?K05TcmVhMm9qR09yN29YVDB2T01tT1BLNStCWFF5ajN1akVrcTJJZXdhK2VL?=
 =?utf-8?B?NjFaZnBxc21MOFEvcXNiVW1zRlo3THJQa1crYXFoV1diVlkxbmFHSVJpRnVL?=
 =?utf-8?B?cmdabjZlSm9vUklSTm5XK0lXUVVZOG5aSTMwSWc3MEVyQ2l0WXRLQkgvOWlI?=
 =?utf-8?B?ZjV1UTRXOXRmcytqdFRzYndlQ0NjQ3VsWkgyNUNHUzFxMnBxV0FLOTdBVGdy?=
 =?utf-8?B?dDFaK2tSaUNoTjY5cFJOWEZyU3U4Y05PTlJyZWVMNjRrbXZobytPV09SQ0dX?=
 =?utf-8?B?bzJtek9qZ2FTN1FWeTNITUZaUXdTRWNscFdQZ2ZPSkVVUlduVlA1dW90VWUr?=
 =?utf-8?B?RTd0ZzA1ZzhsTGZOTlB2VzhITDlSaSsrMWJWMG5oVTNxS0Zoc1V6OE9Gc0xl?=
 =?utf-8?B?YmNRbHk5UUZJQmkwVVpyMzRWYUc5NUlxSUREemw5dnM3dlhsQkl0blVPTWtm?=
 =?utf-8?Q?OAshgpum0sxzsaPDUlJK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed1b98e-828d-4e8c-7e18-08dd297e4920
X-MS-Exchange-CrossTenant-AuthSource: ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 09:34:12.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0309

Hi Marco,

On Mon, 28 Oct 2024 22:49:56 +0100 Marco Felsch wrote:
> I found two mistakes I made in my v1. I would send a v2 if this series
> is interesting for upstream. The remaining open question is how the
> driver dependencies should be handled (see idea-1,2,3).

How's everything going? I wish you all good!
It's a very useful series for various hubs, gentle ping on it.

On Mon, 28 Oct 2024 22:49:56 +0100 Marco Felsch wrote:
> > > Idea-3:
> > > -------
> > >
> > > Adding a function to the hub.c usbcore which can be used by the
> > > usb-onboard-dev driver to register this function as hook. This removes> > > the dependency from the core and the usb-onboard-dev module is only
> > > pulled if really required. Of course this require that the hub.c usbcore> > > driver allows custom hooks.
> >
> > This seems like the best approach IMO, if USB maintainers are onboard with> > it.
Use the existing onboard_hub.h header to do the hooks looks fine.

I recently encountered some kind of platforms using an existing onboard
hub yet their HW don't utilize the USBPE port power control feature
while the hub support it.
Instead, we have another GPIO for controlling the vbus of those ports
to cut the cost.

Wonder any idea could use this driver considering the limitation of
the usb compatible set the properties of onboard_dev_pdata hard coded?

Best Regards,
Pan

