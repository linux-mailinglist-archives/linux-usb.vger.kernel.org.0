Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F53C600DA8
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 13:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiJQLX1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 07:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiJQLXY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 07:23:24 -0400
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2144.outbound.protection.outlook.com [40.92.62.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AE860C87
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 04:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjO2MKLj+C0pEQaB+E1XBhGbUKGDwcuXAz50ozAGS7oXRuPlq0kAZ7xH+3Id9nLE6LpgbjoHu+1tvdAeNJQzIaX6AxUWrX/tvluMDgZJF8D65mo9mz0WqwDvIsNWKkKU9xmlY96UPnyBGsMm+m4rf9e3+9lUHZRPUdy4J/kEum6ECq//pljKAYiPYMkIOcxOf+XiYM6sD4aFq3Kq4c2rxIHxcy8Urr7fqhZt6GxgZgy1ZkDp5JOqJJtLubtAjtkvBd4X1zYlOHCxwwjhm2iXRG14IF3tRL1rCmtn+HQum3wzbtPEKv/ASDuUPDOsbBdgrILsLydekqnU+J/r5++ZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX67SpAy34uPX9aGgm3gNbCdwIqiV4eP5HjDDLqy5Ek=;
 b=CniY7jSwgU1ApRDtxaBBwSUfgGFvwEkwCIAT85gj7FKse7USqf8OnIpAtg59G8tOQ8viWp4TsxOc5oPP0Zh3mQh2HaDBxJu15mtQ/RZuidvP7w/+AKO8teoWvo7LWXDTFUtBDp81obJq+zvABTbggYjDD4UewQd9Ah4Ej0n55mcZ7NQOCiVs+2wt+6h9OHc1LfrM9J9MViCI9rPuPXc5IiUGqa3ds1XEtzk86U/K02hxHdgOFIJbAtvQBNaB3zbHkmX7z+ORMp7xsafE3/xC5apRku5Uc/k1xymnrU9oWwfomBsCCYWKkQjraRD5EsvQVNM2drOKssIRBld+0DRcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jX67SpAy34uPX9aGgm3gNbCdwIqiV4eP5HjDDLqy5Ek=;
 b=KtNBxvCD3uyOMey8S3sNJOyCX12kvFEQXVA+RZDKFH7w5w/+UjQcxvS8exktBQXp9G9cZWTh0WZed3qKoCJfIp/WZ0F7qYKisCun1f6Oi40WUjZJkFGZJPxx4xKYCQEf6qHl2vNXIAiWUBJZtmfX9HbnjSr9bMvL418MAwCkOWkCLuglhvLkB7LsQuKW4N1LZFIS+egFDhRrvoU/LZF6eDntnvByK0D6jV/MmoArpg0RzTlq84749zmQVUJ/Q+T/v22PZxOiQm4mPQ4yDeeAL3W2y98wuZVHj5MSkYFB8Df/1TXgmifeY7BMaTYm0P+zrbXVhHw/lw0NZn0XLedLKQ==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by SYBP282MB4181.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 11:23:19 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06%8]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 11:23:19 +0000
From:   Yen ChunChao <nothingstopsme@hotmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "pabeni@redhat.com" <pabeni@redhat.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Re: [PATCH 1/3 (RESENT)] net: usb: ax88179_178a: Enable
 FLAG_MULTI_PACKET to improve tx stability
Thread-Topic: Re: [PATCH 1/3 (RESENT)] net: usb: ax88179_178a: Enable
 FLAG_MULTI_PACKET to improve tx stability
Thread-Index: AQHY4VOOeYR6tYJHLkeHnlSdaGnVDq4Q56aAgAF3NQE=
Date:   Mon, 17 Oct 2022 11:23:18 +0000
Message-ID: <ME3P282MB28274AA53D00B3E2AD32FB3FD1299@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB28276594FEE8942909123B30D1269@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
 <Y0vvddh+uCONluRH@kroah.com>
In-Reply-To: <Y0vvddh+uCONluRH@kroah.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [FRmU2rINt8tsm2eLDkAJckkvRMhsgduq]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB2827:EE_|SYBP282MB4181:EE_
x-ms-office365-filtering-correlation-id: 161b114b-4807-46e8-c87c-08dab031fe2b
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GKjuqJUT6a2YQNakoypTje6scEJcxITHZpGC5Hf9nPxoKet7Dxr/AIImwmoZDytut+VSRUWUAZB2z7mHYh7Dm8MedHyXmj0BjiHCK0rsN4CdkgOd8DAEhGLw72VB/dU8W24pKr0VLHbWm84eatxBFtSakSAN4UD0dtapyFk6lTboM3v2wB2yz+TxoH7cdtEijFSt3bnRkCXQutp6zMQUjntmf2uqJxecvSyHyNBFpw6mIovyOs+hwKxKLwZ5uL/zr2OtNk/hLhOd9U5PEoQV8qSBQxupAHL9pEn1X/VtLlPPxIg3pQ4smEoEFwWfwxf9JWb60V8fCq5mdUyPRq+tFTejQTd9+kVHkrA3Wv8vWho/h6UerYKWrmbJw+wuNjTk6Z8noVoqWYXkJt5U0/qLUkeFULyuCInwl39oDhqDz3dON6RKnbdvYhBBqKSuRVfp7af4YQEoySqhywJp2+qRTNTqiBBIIs9ktDShgR5LbKzTUEc/1prJ1ErcNcJqqq2kY/LR9WwRTyA3mTwHigPOTvL0E1XR3KiWJEIVpt26HWOPEPyaohqJmjx+J32bQUJIdUgXoIyMka7MMr+JPtH5dTPYgF4YA1D7Cwd75Qj2nevTH0W0aZV4DvT6QZ3NICYfDObtevS3cicFZm5Sd7MZbzzps8C/fP8bwDi86qtiTKF43zAQXXjgmOaBHPzPMVju
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?MlN1ZS84cld1WjBzQm5wSWlFWktIUkR0SjcvYUVKdDFWbmx6T2M0Y1RCWnJBaG13?=
 =?big5?B?ZTRuSFUyd2JGYitaVEhrYXhQRHZseHhpVU13a3laSWNqRlgyUFdvT2xac1hLU2hR?=
 =?big5?B?dHh6M3QvQ0ZvNTB0UUxWZkhNYURxSWxlRTRyUVIrTkdqMy9ERys4TVFJVUhXQ09T?=
 =?big5?B?M3AvQk43YjZHR0JyZzcybU5KSlVpZVl5YW92TlZwUmlqVTRZNGp1REhUL0tBMkN6?=
 =?big5?B?eGYvWGcxV1hYY1ljdVQxVTloZXR0NnRLbDZhUkJ1cThlTjRZRzJ6ZUVPbnkrSmRh?=
 =?big5?B?N0JhNTllTEU1d2JGU1pMQythWCtkOEVmR3pkOHN3dEoxWkczeFErdTVsTHErdHRy?=
 =?big5?B?RnlOUk9vNW1ZdjVRVW9qZGJoQm05SWFpckZlaXFqTnZvaW9WL0tFaGN4OWdjY0Zs?=
 =?big5?B?SVJkRk9pOXNlWFpwWkpZYXVLamFxZ0JoOHRSakJ5RGU4cnFMbkt5Yk1PZHhBVDBu?=
 =?big5?B?K1IwNmNUQkEwc3dXa1pkSm0yRG1rckpyTldXMFVYTEN5VlRZTmYrVk9mMXNKOUVK?=
 =?big5?B?M2MzcUpjdlJKTUQ3L2NJc1FBdmZoNll6WVlGNVByYUova09pR1FnWnc0d25DSjJi?=
 =?big5?B?QloxbnkxQmNuZGVscXU0WEUzSXlGcUpZWWx1aUZJalA0VXlsenYzcUdDTytyaytp?=
 =?big5?B?RVhJOC9MdUFPejNBVXVkdFlRVGgvYnJUQzZmSmI5OTJOeHlkbmJOdWF2VitzcUZm?=
 =?big5?B?eVU1Q2VpdzFTYlprVktvSkY1dTlNajRneVhheU5vOGwwYkFiQUxYOHBjWm5UUDVE?=
 =?big5?B?M0IrdGhEdVp3M3IyVnd4TGp3QnlMamZkUDJtdFFuWWlITzZjYW9lek5CenBCbXJw?=
 =?big5?B?cFJaMDFOTjZuYjNIQzFKcEYzQXQ1dEVSZmV0L1lMSEhqM1lsbnhuUlRYaC9hYjR3?=
 =?big5?B?aFlEeldhU2p2QnZDTk92SUcxejRWL0pwNlZzVThYa3I1UFZqaWtoQTZKcW55Yms2?=
 =?big5?B?MUM0UnRMUk1XR0RlMXBwc0x0alFTM29hMkFnelZBeGNKRVlxb0U0THU0Y2RCVG44?=
 =?big5?B?NG9IUjZaMGYrNk9BNTU1d1kyN0Ryc0lpNzFGQnRqSVJzT1U5QlBLQWZJVlZYWnZV?=
 =?big5?B?S2wxUit4V0JXd2FzbWR4YWNLbU0vK081Mk1nOEZlSW1BUkpObzBqNUNsMVFHcldz?=
 =?big5?B?aHZ6Vlk3ZS9HL0loZjlkY0VES1doMHRmZXpySzdWUnFoRWtRUXE4b0Vha1JJTG5M?=
 =?big5?B?NFVmZmZsQTVaS2RkSkhzK3lIY1E2dnhEbldMQWR2dGp3SGl5MnRMc2pPTWRyVk1P?=
 =?big5?B?a2lhOEl4b203aUYwWkg0cHZkdCtDaXhjcXU1RVI3eURrOFpHTWNhc0g0cGxUVlZJ?=
 =?big5?B?OUZLMVdvNDMwS0xxa0xNYXpsRHlGUTVyZW92YWowMm9qOGZleDBmbmhwSjB4dmhk?=
 =?big5?B?Z1ZYZE43N3dKR0VCVE9FQ3dtcEtVTVBsbEFlQTNSWEpVNzd5QVZPVHdYWlNwdXow?=
 =?big5?B?KzRsYzJZOVBvTHdheDNEakdLWHcramZNTERTTmgrZndRSlR0TTkra3EyejlCdEho?=
 =?big5?B?NjFhb3VmUGp3VGF4V243VlQxdk1KWkpvYm5zUWNmRUlsUUNrTmFtbVgxUGxadnpM?=
 =?big5?B?d3lVa3EyOGRxRWY3bzRtN2pXQ2xLYlAvakI2MHVsZVF6SUFBK1N5Z0NleU45d0J1?=
 =?big5?B?elJOckhnPT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 161b114b-4807-46e8-c87c-08dab031fe2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 11:23:18.9890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4181
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pk9uIFN1biwgT2N0IDE2LCAyMDIyIGF0IDA3OjM2OjI1UE0gKzA4MDAsIENodW4tQ2hhbyBZZW4g
d3JvdGU6Cj4+IFByb2JsZW0gRGVzY3JpcHRpb246Cj4+IFRoZSBjdXJyZW50IHdheSBvZiBoYW5k
bGluZyB0aGUgYm91bmRhcnkgY2FzZSBpbiB0eCwgaS5lLiBhZGRpbmcgb25lLWJ5dGUKPj4gcGFk
ZGluZyB3aGVuIHRoZSBzaXplIG9mIGFuIG91dGJvdW5kIHBhY2tldCBpcyBhIG11bHRpcGxlIG9m
IHRoZSBtYXhpbXVtCj4+IGZyYW1lIHNpemUgdXNlZCBmb3IgVVNCIGJ1bGsgdHJhbnNmZXIsIGRv
ZXMgbm90IHdvcmsgd2l0aCB0aGUgaGFyZHdhcmUuCj4+IFRoaXMgY2FuIGJlIHNob3duIGJ5IHJ1
bm5pbmcgYSBsb2FkaW5nIHRlc3QgdmlhIGlwZXJmIHdpdGggdGhpcyBoYXJkd2FyZSBhcwo+PiB0
aGUgc2VuZGVyOyBvbmUgY2FuIHRoZW4gdHVuZSB0aGUgaXBlcmYgcGFyYW1ldGVycyBvbiB0aGUg
c2VuZGVyIHNpZGUgKGUuZy4KPj4gIi1NIDUxMCIgaW4gbXkgdGVzdGluZyBlbnZpcm9ubWVudCkg
c28gdGhhdCBzZW50IHBhY2tldHMgZnJlcXVlbnRseSBoaXQgdGhlCj4+IGJvdW5kYXJ5IGNvbmRp
dGlvbiwgYW5kIG9ic2VydmUgYSBzaWduaWZpY2FudCBkcm9wIGluIHRoZSB0cmFuc21pc3Npb24K
Pj4gcmF0ZS4gSW4gdGhlIHdvcnN0IGNhc2UgKG9mdGVuIGFmdGVyIGEgbG9uZyBydW4pLCB0aGUg
aGFyZHdhcmUgY2FuIHN0b3AKPj4gZnVuY3Rpb25pbmcgKGNhbiBub3Qgc2VuZCBvciByZWNlaXZl
IHBhY2tldHMgYW55bW9yZSwgYWxiZWl0IHRoZQo+PiBjb3JyZXNwb25kaW5nIG5ldHdvcmsgaW50
ZXJmYWNlIGlzIHN0aWxsIHJlcG9ydGVkIHByZXNlbnQgYnkgaWZjb25maWcpLgo+Pgo+PiBJdCBp
cyBhbHNvIGJlbGlldmVkIHRoYXQgdGhpcyBwcm9ibGVtIGlzIGhpZ2hseSByZWxldmFudCB0byB0
aGlzIGJ1ZyBbMV0uCj4+Cj4+IFNvbHV0aW9uOgo+PiBFbmFibGUgRkxBR19NVUxUSV9QQUNLRVQg
YW5kIG1vZGlmeSBib3RoIGF4ODgxNzlfcnhfZml4dXAoKSBhbmQKPj4gYXg4ODE3OV90eF9maXh1
cCgpIGFjY29yZGluZ2x5Lgo+Pgo+PiBSYXRpb25hbGU6Cj4+IFdoZW4gRkxBR19NVUxUSV9QQUNL
RVQgaXMgZW5hYmxlZCAoYW5kIEZMQUdfU0VORF9aTFAgaXMgb2ZmLCB3aGljaCBpcyB0aGUKPj4g
Y2FzZSBmb3IgdGhpcyBkcml2ZXIpLCB1c2JuZXQgd2lsbCBza2lwIHBhZGRpbmcsIGFuZCB0cnVz
dCB0aGF0IGVhY2gKPj4gc2tfYnVmZiByZXR1cm5lZCBmcm9tIHRoZSBtaW5pLWRyaXZlcidzIHR4
X2ZpeHVwIGZ1bmN0aW9uIGhhcyBiZWVuIHRha2VuCj4+IGNhcmUgb2YgdG8gY2F0ZXIgZm9yIHRo
ZSByZXF1aXJlbWVudCBvZiBpdHMgdGFyZ2V0IGhhcmR3YXJlLiBUaGF0Cj4+IG1lY2hhbmlzbSBh
bGxvd3MgdGhpcyBtaW5pLWRyaXZlciB0byBzZW5kLCBldmVuIHdoZW4gdGhlIGJvdW5kYXJ5IGNv
bmRpdGlvbgo+PiBpcyBkZXRlY3RlZCwgInVudGFtcGVyZWQiIHBhY2tldHMgKG5vIHBhZGRpbmcs
IG5vIGV4dHJhIGZsYWdzLCBhcyBpZiBpbiB0aGUKPj4gbm9ybWFsIGNhc2UpIHRoYXQgdGhlIGhh
cmR3YXJlIGFjY2VwdHMsIGFuZCB0aGVyZWZvcmUgcmVzb2x2ZXMgdGhpcwo+PiBwcm9ibGVtLgo+
Pgo+PiBOb3RlIHRoYXQgcmF0aGVyIHRoYW4gYmVpbmcgdmlld2VkIGFzIGEgd29ya2Fyb3VuZCwg
ZW5hYmxpbmcKPj4gRkxBR19NVUxUSV9QQUNLRVQgaXMgaW50ZW5kZWQgdG8gYmV0dGVyIG1hdGNo
IHRoZSBvdmVyYWxsIGJlaGF2aW91ciBvZiB0aGUKPj4gaGFyZHdhcmUsIGFzIGl0IGFsc28gZWNo
b3Mgd2VsbCB0aGUgcnggcHJvY2VkdXJlIGNvbmR1Y3RpbmcgbXVsdGlwbGUtcGFja2V0Cj4+IGV4
dHJhY3Rpb24gZnJvbSBhIHNpbmdsZSBza19idWZmIGluIGF4ODgxNzlfcnhfZml4dXAoKS4KPj4K
Pj4gVmVyaWZpY2F0aW9uOgo+PiBPbmx5IHRlc3RlZCB3aXRoIHRoaXMgZGV2aWNlOgo+PiAwYjk1
OjE3OTAgQVNJWCBFbGVjdHJvbmljcyBDb3JwLiBBWDg4MTc5IEdpZ2FiaXQgRXRoZXJuZXQKPj4K
Pj4gUmVmZXJlbmNlczoKPj4gWzFdIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MjEyNzMxCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENodW4tQ2hhbyBZZW4gPG5vdGhp
bmdzdG9wc21lQGhvdG1haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbmV0L3VzYi9heDg4MTc5
XzE3OGEuYyB8IDYyICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKPgo+V2h5IGlzIHRo
aXMgYSBSRVNFTkQ/CgpIaSwgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uICJSRVNFTkQiIChieSB0
aGUgd2F5LCB0aGUgYWN0dWFsIHRhZwoiUkVTRU5UIiBpcyB1c2VkIGFzICJyZS1zZW50Iiwgd2l0
aCBubyBpbnRlbnRpb24gdG8gaW1wbHkgYW5nZXIpIHNpbXBseSAKbWVhbnMsIHRoZSBleGFjdCBz
YW1lIHBhdGNoZXMgYXJlIHNlbnQgb3V0IGFnYWluLiAKClNpbmNlIEkgaGF2ZSBub3QgcmVjZWl2
ZWQgYW55IGFja25vd2xlZGdlbWVudHMgb3IgZmVlZGJhY2sgeWV0IGZvciB0aGUgCmZpcnN0IDMg
cGF0Y2hlcyBzZW50IG9uIE9jdCA3LCBhbmQgdGhlIGd1aWRlbGluZSBzYXlzIHNvbWV0aW1lcyBt
YWlscyAKY291bGQgYmUgbG9zdCBhbmQgd2UgbWlnaHQgcmVzdWJtaXQgdGhlbSBhZnRlciBhIG1p
bmltdW0gb2Ygb25lIHdlZWs7CnNvIGZvciB0aGF0IHJlYXNvbiBJIHRhZ2dlZCB0aGUgc2FtZSBt
YWlscyB3aXRoICJSRVNFTlQiIChhIGJhZCBjaG9pY2UgCm9mIHRhZyBpbiBoaW5kc2lnaHQpIGFu
ZCBzZW50IHRoZW0gb3V0IGFnYWluIChhbHNvIHN3aXRjaGVkIHRvIGEgZGlmZmVyZW50IAptYWlu
dGFpbmVyJ3MgYWRkcmVzcyB0byBtYWlsIHRvKS4KCj4KPkFsd2F5cyBwdXQgYmVsb3cgdGhlIC0t
LSB3aGF0IGlzIGhhcHBlbmluZywgd2hhdCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUKPmZpcnN0IHZl
cnNpb24geW91IHNlbnQ/CgpTdXJlLCBJIHdpbGwgcHV0IG15ICJyZS1zZW50IiBtZXNzYWdlIHRo
ZXJlIGZvciBzaW1pbGFyIGNhc2VzIGluIGZ1dHVyZS4KCj4KPkFuZCB3aHkgaXMgdGhpcyBub3Qg
dGhyZWFkZWQgd2l0aCB0aGUgMi8zIGFuZCAzLzMgcGF0Y2hlcz8KCkFsbCAzIHBhdGNoZXMgdGFn
Z2VkIHdpdGggIlJFU0VOVCIgd2VyZSBzZW50IGF0IHRoZSBzYW1lIHRpbWUsIHNvIEkgCmd1ZXNz
IHRoZSBvdGhlciB0d28gYXJlIHByb2JhYmx5IGxvc3QuIFNvcnJ5IGFnYWluIGZvciB0aGUgY29u
ZnVzaW9uL21lc3MgCkkgaGF2ZSBtYWRlLgoKPgo+dGhhbmtzLAo+Cj5ncmVnIGstaAoKSSB0aGlu
ayB5b3VyIHJlcGx5IHNob3dzIHRoYXQgbXkgZmlyc3QgMyBwYXRjaGVzIChzZW50IG9uIE9jdCA3
KSBoYXZlIApzdWNjZXNzZnVsbHkgcmVhY2hlZCB0aGUga2VybmVsIHRlYW0gYW5kIGVudGVyZWQg
eW91ciBwcm9jZXNzaW5nIHF1ZXVlOyAKdGhlcmVmb3JlIHBsZWFzZSBpZ25vcmUgdGhlIGxhdGVy
IG9uZXMgdGFnZ2VkIHdpdGggIlJFU0VOVCIgKHNlbnQgb24gCk9jdCAxNiksIGFuZCBpbmZvcm0g
bWUgb2YgYW55dGhpbmcgSSBuZWVkIHRvIGtub3cgZm9yIHRoaXMgcmV2aWV3LgoKTWFueSB0aGFu
a3MgYW5kIGFwb2xvZ2llcywKCkNoYW8K
