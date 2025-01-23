Return-Path: <linux-usb+bounces-19666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF88A1A39B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 12:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B68A188D05F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 11:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF6520DD64;
	Thu, 23 Jan 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="KWC2aYKj"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87929B0;
	Thu, 23 Jan 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633128; cv=fail; b=LHL2E4nRAT7/iKCGPk6Y/hlaJsesG6IOLHD9ipcq87qTygbUWv5IN+wrK2HNv/oKybqhTx+QCBCBY0nHO1xXoJi8UAf7/VxLm6BoZdztIHnvYwat70dTps9AFZ/6fm5SNH8rukNCmMnfOabKqgDb6hs/GqvK2NowbaGWluJ1xyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633128; c=relaxed/simple;
	bh=DzWu11vaVnMDt+6RDFpsXiC5L8mFEdOxgSu37k9K8/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QwVM37EWIk+i29SM64JxXRIDRLnVHtBriR2mSPAu1PQ+4L2h5eIqYil9RGOQh6ihj9wDldxT+dyPX0jHUCrGi/PFgbQB/RmgSI2gaO9KpMA3xlwc8cq9+qcbPLLa/xJ0Bg1SfFM/88xZevUxup9GemqKKQKw7sc1ETWWavNuDmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=KWC2aYKj; arc=fail smtp.client-ip=40.107.21.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQeh9tPf37DMp0ugoZtOf049F/mPA/V/XICZtxhYOfKXITNOVURS7YUUB1cLThJfxSb6/ElJtay6LZLxq6loghn8e9hFrleKtaPk4Jenp4iW1TO14p/gJ3got5ulVKzn3yO2PkgoG2TvifL3+TW+mG4GU5cl7tQSi1NieAfK3YJy8WbrPVcAdqaib7QmNBMvplsZcopLOCtQv5AJLbKTvzZxgEL6lQBqcX4kfE9bejcG0Eg8cXkfsD9Fbrn0zlrC+WeWmJ+4VQB3YWEDPPuYCqJkeeCpJfJZDSgw/mxRywHPJ+ZayQCNNfm8nP1Jg9nSsyFaGA14+VIMNO1ykQ9d8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzWu11vaVnMDt+6RDFpsXiC5L8mFEdOxgSu37k9K8/E=;
 b=XeyYoCpH3J67tgoHNJka/JYrU5DUIl5g4CEPQUQI2UyT75Ob3KLgxm84uba1uCPiSvY2GVKLuU/QMTeli63CFSulGUA94r/rHfwt5KTMgKkj9OxHrgTKhLslbH4h8WKQkMq6ylm25iSbMc1GFCjYzrxOLmZb0M0foeqJ18IecpLQD2K1+v/2SCzhOWEwVcc4qv/7aN7DoxtO0IFd06JgWFplKQLuqzHeNSCPn4XPkse5hLoeQWbccwJB6SvRcufzSuDagp/m0kyWZwude9CwZKa3vwBYeLd8pvES1j3134EMIqkZpMP+KcHeNeFsdHl8LSwlqsOT76QqZuFhcBlXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzWu11vaVnMDt+6RDFpsXiC5L8mFEdOxgSu37k9K8/E=;
 b=KWC2aYKjak0TQFmF24kUz0obbiT7e5DaECC3tnQZwAJjeYOJDsNC2RES2rN0+sDDQIS6Tkfp8FEQ9oGqpPeNjwA1I3NVP422RU9xQBKNyqcvaV0rwfk06gFsW1HkoABSgh0QZDhHwEZsbsr+6pb828E1CBFLczyVOTkjqyFjBss=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by VI1PR06MB6445.eurprd06.prod.outlook.com (2603:10a6:800:125::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 11:52:03 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%7]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 11:52:03 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Johan Hovold <johan@kernel.org>
CC: Greg KH <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de"
	<m.felsch@pengutronix.de>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Thread-Topic: [PATCH] usb: core: support interface node for simple USB devices
Thread-Index: AQHbbNQz5nuTuJgNwkO47mkrPRQBtLMi0G8AgAA494CAAS4agIAACUUA
Date: Thu, 23 Jan 2025 11:52:03 +0000
Message-ID: <fb9225a0-0684-42d1-923e-61212ac3d3c9@leica-geosystems.com>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
 <2025012200-activist-disprove-808a@gregkh>
 <312dc0e4-a024-40e4-9aba-ae9074b58086@leica-geosystems.com>
 <Z5Ilm06wcuNsqtod@hovoldconsulting.com>
In-Reply-To: <Z5Ilm06wcuNsqtod@hovoldconsulting.com>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|VI1PR06MB6445:EE_
x-ms-office365-filtering-correlation-id: 5ccd6f1f-e7da-4552-a9de-08dd3ba45a55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWMrNnBVU1hXYTBmdGYraHpoMlp5ZitjNGpmZDJxUWsxNUFIeHdQWk13TFFn?=
 =?utf-8?B?bEJUbFFwQmd0ejZSSGUvZEJDUUM0NXBNQXNkKzBwOENXNVVLN2V0MHZFdHZM?=
 =?utf-8?B?RUhLbmFGVzVzaGxKZmc5MklWK0lpWGpxR1RJZ3BFL09xWFNtbGY0dHJmUGZ4?=
 =?utf-8?B?RHZ0V3pNVDFTU2tFRkdXbWZtaVQyU2VDUlhOMlhEQlNEWm9IN1ZYcWw4T1Ni?=
 =?utf-8?B?WjAvWTBWWURlSTVkdS9xb1QzUlFsZHVpWEZWb2d2elJkTk03VWx6SG53eVQv?=
 =?utf-8?B?ZldYLzNIcGdzMGxXZEhsTzFmVkg0ekZTQzJpYnNhNXhBZ0htRmVBeCs1VHBp?=
 =?utf-8?B?QTQ3d3JBb0ZWNE1kS0RvR1NVelJJZzNuc1ljMXF6ci9aVUpJWWdQV3pCVVNG?=
 =?utf-8?B?NmdGcFd1akV3WU1hR3lTMlhmT2t6MHdkcmQ1UWdkQ080ZElBcUNOdHVGU2Rr?=
 =?utf-8?B?bFdaTlgxaHZsdEtOMUdJYVpRM3RyZElJNDdhb0VablFIRTBTSitKcTZzVzN0?=
 =?utf-8?B?RXliZERNa0hubmhFLzk3UGt6T3dyL3prekljV3pHQ1EybDF0bXFQcHZBZEJy?=
 =?utf-8?B?SnZEQzZKelZmSlNoUUFrYnBNU2lTWjZMclVxbVlyNENOSVNIbWpXL0VWajZ2?=
 =?utf-8?B?STJGQzNwRDV2R3lwVllnM0NxUyszbjJyVDFpekhsYVhVeXZCVzhoSVkxME1Z?=
 =?utf-8?B?U2cySkZDb2N2STBpa2QxUk9BcmVGeWJ5QjFjRXoveVQrYStocitRYWNxRytj?=
 =?utf-8?B?YlUwVFNaRWFGWWVGVzkzRWFJOHBKZERBSXkwemI0cHp3VUFROEpqS0RicC8x?=
 =?utf-8?B?NjdobVNUcjFHZjd1akkxcVYzUXM2ZmhnRkpVTEdQeEFUTkhHdDJhVWNYdjd4?=
 =?utf-8?B?UmVXemZIMWZPc1ljeGNIOWxiUkV4RXBmcktsd215OGhDa2w0TE9nTTMvZmFs?=
 =?utf-8?B?YzFZT3FFUkJWSUc0RWZKU0xTeGJORmxhN0g1ZndiMVhGcW82ak4xWC9JQXdS?=
 =?utf-8?B?bUNWMmFKMXBzYzhoclJ3YWhlOXg3YlM0OTNKc3RJYXFENkZ3MlF1RStCTENO?=
 =?utf-8?B?elhOZzdJMHg1Q2ZRb24xRExOcGRuWVQwVnFaZmluVU1PbUJRM3BURXU0RzdB?=
 =?utf-8?B?eCtCWUZObEpsNDJ5MWhuTVYySSt0NjA3M1lOSFc2RjVoVnNHTjRCKzl2RFcx?=
 =?utf-8?B?cE1jdk9uRDBROEhyUDdFZHV2L3U5QmZCL21RSEpIMVpEMStVRHdXMGZzYjcx?=
 =?utf-8?B?cjFhMnRlY1lhcyt0cXA1eXpiTUtpWG9JU1N2V1g4ME1mVHNoeG5FWUlvTi9h?=
 =?utf-8?B?bis3NExqbWw5aE1heHoxN2RBREE3U2FHV3hlaXdWSHplVFZzeVVxK3liNXJh?=
 =?utf-8?B?bmZWN0dXZEtMbktOMk5QZlZKM3ZLOGxFbHBDYVBaZFhjNTdEL29EYTR1OUU1?=
 =?utf-8?B?dnRjeGJLNDV6ekhUWmpZTkVWQkFTVTMyMGNaMGlGVk1oMXlqa2tleWRvQkYz?=
 =?utf-8?B?MmZPUFlZWjdPN0VrVDN2a0FVM0YyWjdRVlFXdHNqZDdzSVNIa3ZIRGU5UWFD?=
 =?utf-8?B?Z0JReGJlT0R5alZMelBjUTZwRkdMODJQZkdNOEI5SWgzN2tUbFF1YVNSWXBw?=
 =?utf-8?B?VnNPVysybUhjQ1BnbTRFSFRWSWpacnNQYWtQTDhMdEtoNHBXbGdKVUZMbFRD?=
 =?utf-8?B?WGZIRWhrVDU5NXFycUVsY1hhOHNYQ0NqWDh5WFlnTTYyYmdJSks1b1JuU1pQ?=
 =?utf-8?B?MGhad1lPWW5GZHArd3RpWGNEcmZlcnJPT2ZMMUZGVkUwSjJnbndpSmxrcmdR?=
 =?utf-8?B?OWZCcjZaMkhzd3B3LzJUaG5LRE1PRkdDWDVGaVlmQU0wWDZIN1lZb3VjMFlr?=
 =?utf-8?B?eDNYb0cxZFgwR3pGd0w5ekFCVm1ZV0hpeG54Uko1bUJDQkpWaHBRSTFOck9M?=
 =?utf-8?Q?PkT1iHolLM2FoO1jBpj8gOnHfL/PE8fJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGhZOXRrVVRhN0JlMnlHeUxXelBQY09yeUovaFp2ckI2MnNNRHhXVE9wQVgv?=
 =?utf-8?B?ZFRWb1l3czNQaXFBUzhhU2pvZVpaczNsQXFJYlNLRzNGSHhjV2RsY0pPZlE5?=
 =?utf-8?B?Zk10dzlsc2RUSE5ZVGpENndqOWc2aHplYlVJZDJ6MXpUaTljTzFoMjcyaEx0?=
 =?utf-8?B?ZzNvNmZuQUxSSXJzUTV3RFVIVkhzV3RnWmYvc1pQUzExRkhYUGRUYy9hR2Rp?=
 =?utf-8?B?Um1tREQzWlhUZlUzdlNRekxJT1NKcWh4MVlMbWw4NkZob2RQa0hqUmEwUGNi?=
 =?utf-8?B?TldqWTNpcXViTmhSY2tlUlNreCtPUUFuM2M4WkZQRTVzZHc4QnllQ3NsWENr?=
 =?utf-8?B?WkV5N2FYUDB6T1plNGN4clRBM1hMRW11ZGFXRG1pOUJ6bnFyZ043WEFtUXZw?=
 =?utf-8?B?eWxwUkR6UHF6akx3MXFiR3BoRHZRWUp4dUdWM3QzQncrbVhSMDVCOTZNWHAr?=
 =?utf-8?B?Zm9HcU4xQXlZZ09yaUlUY29qQzgxTWkzdHVGUnVXaGR5V2ZEV2hzTFExMm5O?=
 =?utf-8?B?Q2swMHk3VDJyUHd6M0NnL2lZWmdmcVJBWTJELyswT3BLVkJPQWROamZwZ2s4?=
 =?utf-8?B?cDZqZk1zN1Z4V2x2TUtzTitPTGNZQ3ZlMTBzdjJvdE0zbHZsK1oxUGRML0tQ?=
 =?utf-8?B?eHk4Nm1NWnZvcW45S0Z6S2NSeGF2UDBCSFpVZXJCUWdNdVVrcjMwRDI4dWRD?=
 =?utf-8?B?K0xEdEJUQnlFUWtQUHdEQW43NWlFVytReGxSbDRBamlXcXlWd2Q1cXVIZ1JM?=
 =?utf-8?B?bC9uNXQ1amgzdTVJRGJpQ1NzdldDYmNoMDBQRE5FTml0UnFYUFdxa0l5eVdr?=
 =?utf-8?B?VE9oYnRFT0lNUWdQRms1dUgzWithcWFJMy9XMEMvcmtkUWd2YzBLdmdZNE9K?=
 =?utf-8?B?QlVyLzhjSUF4cjRkTVFoUUU3SkFKc3hIeW42SFlNSXQrWHZ3QXBLSmdGWVFj?=
 =?utf-8?B?dUJUYWVENXZoSjBmMkIwNWZTaFhOSCs4cVM0Vi9rVW1CWkxxZ284U1NNTDZh?=
 =?utf-8?B?TnRZZWZSV1E2MTl3NCtZVU1zSzUxTHhoNW80TFhzN0EvNnlqNzBEQ2RZVWl2?=
 =?utf-8?B?akswNkhVWTJsYmJNU3FoQ0JSTDNMTTRJOEVUMHhkckJzTFljN2kyWW94aENu?=
 =?utf-8?B?d01FZmVXd3VMMVJPTlA2L3ZiTlp2TzlDb0ZGeTYwZ0FxT2kwZW05T2I5UUU5?=
 =?utf-8?B?QktzVnBTY1EvT3dNR2pGOXFlOXg4bDZRMVk0cHJoYmtWOGpURVBDMWNTZitK?=
 =?utf-8?B?dFRZZXRWalA0dFhSb3pJbFFGZzBEUXlqMkZRK1pWM3JJUWZjS0Mwd2lVbWxh?=
 =?utf-8?B?bDdlOGdLbzViSE1ZdnVtQW9lY1R1MjIrVHNJZFh6NTRCbFBmeGRNMTdNUVBj?=
 =?utf-8?B?OSszL0l2VTVma2dlNFVGamhYeEJ0TjhRVUFjc3Y1dDJjOUYxKzhZN0E1anlD?=
 =?utf-8?B?SENKZG5XYTZWeXJObEdnYkJXN2laQnF6UkdQcnR0dGFEV29FVDFHN3NSazZU?=
 =?utf-8?B?UU9mTjRtS202Z1NEYUdkTFZDeEJObmpxN3BVQjNxUWJqcUUwOHVzdG8vR1V3?=
 =?utf-8?B?L3pQOWFMWjhrNStiNTU3ajRiZWlRSE1TV0lmSG9GcXF2OGlMY05zQVU3RkZw?=
 =?utf-8?B?V1hkSHNzTkxMaVgyVnErMkQzRUlZUDc4ZnlmZFRxVTl6cmlXMDdSMVBLMi9Z?=
 =?utf-8?B?U0ZxbnNMQVRsUVN4MHlFbGFkS09ZaDJYdEJEKy9LZFNsZmc0QkQ2cnNBYWth?=
 =?utf-8?B?WllQZEVFbXlMbjd2THdNcEV3UXhyb1Rwb2tXdWttS2JScXpqZE1XRzE4aFlr?=
 =?utf-8?B?ZVFLSnVVK29DSkRheG52ZlZ1S0FQQUZYWXRuNC9QUlBUNTZJYkZJUVhoM2tx?=
 =?utf-8?B?TUdMaUZsb21KdXFuTkVsbFk0b3A5ZXhVamNJMEpmZTZPeEIxSmFwWmE2eGhM?=
 =?utf-8?B?VUZyeHMwcU1TU2pPdUF6WU40bHYrMzRqMDY3ZFRIbVVOVnNDdXhWMDBFalpV?=
 =?utf-8?B?MkFJN0FDemMvNURqNjZGOU10THQweXE1d3VZOXNPK1hZZGlkekRqcXBNWFRH?=
 =?utf-8?B?czREWXNhazNjS05KRWJGMTluSmFWaDZyR2kxMmdkREVEaDkwaEYybDQrRlJN?=
 =?utf-8?B?NXZXaktlWFlhU2tqMDFNbHhCaVFzNGRveTl1aU1zd3hvL0pRemZnR09taGtK?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DBB0AC86EFA9E40BD144A9B8988ED72@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccd6f1f-e7da-4552-a9de-08dd3ba45a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 11:52:03.2404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTla0CEYvovD8zIaxd4IqEyJSPoV9TNBrdmrgtR075bdykXhGL/N8EXB0WZYd9RDtvLHBJlfiY5Hfm17XITt5ya2kG3nVsnkz1+OLBvITQrHwDKS9Ygh1bRDSkm69/yl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6445

T24gMjMvMDEvMjAyNSAxMjoxOCwgSm9oYW4gSG92b2xkIHdyb3RlOg0KPiBbU29tZSBwZW9wbGUg
d2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBqb2hh
bkBrZXJuZWwub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2Eu
bXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gVGhpcyBlbWFpbCBpcyBu
b3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUgY2FyZWZ1
bCB3aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcg
dG8gdGhpcyBlbWFpbC4NCj4NCj4NCj4gT24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgMDU6MTc6MzZQ
TSArMDAwMCwgUE9QRVNDVSBDYXRhbGluIHdyb3RlOg0KPj4gT24gMjIvMDEvMjAyNSAxNDo1Mywg
R3JlZyBLSCB3cm90ZToNCj4+PiBzZXJkZXYgY2FuIG5vdCB1c2UgdXNiLXNlcmlhbCBkZXZpY2Vz
IGR1ZSB0byB0aGUgbGFjayBvZiBob3RwbHVnZ2luZywgc28NCj4+PiB3aHkgaXMgdGhpcyBhbiBp
c3N1ZT8gIEkgdGhvdWdodCB0aGF0IGp1c3Qgd291bGQgbm90IHdvcmsuDQo+PiBXZWxsLCBJIGNh
biBzYXkgdGhhdCBvbiA2LjEyLjAgaXQncyB3b3JraW5nIDoNCj4+DQo+PiBbwqDCoMKgIDAuOTI5
NDkzXSB1c2IgMS0xOiBuZXcgZnVsbC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHho
Y2ktaGNkDQo+PiBbwqDCoMKgIDUuOTA2NTc0XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRl
cmZhY2UgZHJpdmVyIGZ0ZGlfc2lvDQo+PiBbwqDCoMKgIDUuOTA2NjMyXSB1c2JzZXJpYWw6IFVT
QiBTZXJpYWwgc3VwcG9ydCByZWdpc3RlcmVkIGZvciBGVERJIFVTQg0KPj4gU2VyaWFsIERldmlj
ZQ0KPj4gW8KgwqDCoCA1LjkwNjcyN10gZnRkaV9zaW8gMS0xOjEuMDogRlRESSBVU0IgU2VyaWFs
IERldmljZSBjb252ZXJ0ZXIgZGV0ZWN0ZWQNCj4+IFvCoMKgwqAgNS45MDY4NDJdIHVzYiAxLTE6
IERldGVjdGVkIEZULVgNCj4+IFvCoMKgwqAgNS45MDc4MDldIHNlcmlhbCBzZXJpYWwwOiB0dHkg
cG9ydCB0dHlVU0IwIHJlZ2lzdGVyZWQNCj4gWW91J2QgbmVlZCB0byBwYXRjaCBVU0Igc2VyaWFs
IHRvbyBmb3IgdGhpcyB0byBoYXBwZW4gc28gdGhpcyBpbiBub3QNCj4gbWFpbmxpbmUgNi4xMi4N
Cj4NCj4gQW5kIGlmIHRoZSBwb3J0IGlzIG9wZW4gZHVyaW5nIGRpc2Nvbm5lY3QgeW91J2Qgc2Vl
IGEgYnVuY2ggb2Ygd2FybmluZ3MNCj4gYmVjYXVzZSB0aGUgc2VyZGV2IHR0eSBwb3J0IGltcGxl
bWVudGF0aW9uIGRvZXMgbm90IGhhbmRsZSBoYW5ndXBzLg0KPg0KPiBKb2hhbg0KDQpNeSBiYWQs
IEkgZ290IGEgcmVtaW5kZXIgdGhhdCB3ZSdyZSB1c2luZyBhIHNldCBvZiBwYXRjaGVzIHRoYXQg
YWRkIA0Kc3VwcG9ydCBmb3IgdGhlIG1pc3NpbmcgcGllY2VzIDoNCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI0MDgwNy12Ni0xMC10b3BpYy11c2Itc2VyaWFsLXNlcmRldi12MS0wLWVk
MmNjNWRhNTkxZkBwZW5ndXRyb25peC5kZS8NCg0KU29ycnkgZm9yIHRoZSBjb25mdXNpb24uDQoN
CkJSLA0KQ2F0YWxpbg0KDQo=

