Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507147079F5
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 07:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjERF5Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 01:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjERF5W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 01:57:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C401719
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684389441; x=1715925441;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DVcADwLm4/Bfs2h1zzN9aq4rptd5Ju9wxuGMqOeWGts=;
  b=N+hLWM87cica9XngPPxuNFuW6LR/1FXmXMB37OKjr9l9jXRbljUtYfEn
   +0V5JpEa0ZmVDGdz2FU6mtoz03iijGU9Xl2hFN54jma/ouM1bcb6+VmRx
   CAYrFoBPxceaHgtZQ/QyvnNwadoa+i4oF0hmqk+j0tw/h2UWuOVctTwrS
   OBDahd7NyvuLH561ezM7pcScn9E0GLU7llIV8y9U4qoGYP8tLWjOXOOrU
   MJiWikRtAZEFFTu19TVl+4Y31hsMKPhUT49O+6Cjxq/3H5kF5X9mQiTef
   qKMDonW3VxBEnTZ6gvONZFqb18NLVj/Of4F6XReJ1LSNE5zzFnNGlUrHF
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,284,1677567600"; 
   d="scan'208";a="152686381"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 22:57:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 22:57:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 17 May 2023 22:57:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxWDrHY6w/JW/pSIjWxjp631Mh1J3Plr0AZ78LfDvUO5VVPFZruWq3xhSNCFraUj1Tsrlm/z4vGZjS9ly9/qudZwpanfRoOMsYTn3jKcBoZQzGoqIrITaraNNfygPUdpR5mwmClp/LK4KpCym+9wq/vjolcgjXPW2g6bUezLWcmkszlaNapmCAChIrkiu5se9ZzkilxSZhGdr9KQe5OyOfcRkYaoqof3xAQWr485YjW1NrkifqAKYA5LnzPirj5CckbrY5jMUuQ+n0ZM7I8NAvJSq9Aw29wJ2PNIrruTyhYPta1T8TONw+FvPSI8679F5vlpd+tEXDdORH4GOamJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVcADwLm4/Bfs2h1zzN9aq4rptd5Ju9wxuGMqOeWGts=;
 b=hKs3SyWPTf1HV1C/a8YkY6kDE7F6Jn9JKczkas0riTOfvmoXKxXDjiMPY8TCMotwbmf/2Lcnka/S2v4Hh4PscWHlepl2bJornDT73mhsEBJ7/t0fQG8ZmmS9KAdrVCXq59mu5qa+6gQGahNU48qM6wGINQ2zohWBqzlD+JpJ43GB2t388RtgfjjifRwbvruXUbaqBZ1Kl6NuBfCGh4Qozb0H6gAy4XsMMNxp6wctEitjvSNkpXaWV6STiQKMsy1OUqWDWBUf6W3AoZG/qWhhK+/n519iJBtrytscigDzXEdayGqv4QCpsEV1me8izG3SWPy2FpqwLGCDZaXfHrHtFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVcADwLm4/Bfs2h1zzN9aq4rptd5Ju9wxuGMqOeWGts=;
 b=ef/kIO11KryR08GMKkL1SC2c+0w/KI0DXNiplcuEpBF1AIc5Glc7IqMgaM3eNWoUWNU9tQ8k9apgc0Y9AnKpyjhmEi51SlSnmEm1djU/gtmjxaA6dOCukPlmCUnYbV+emvfY6wXMdSRSw3iu0eeFlZTIc1McMQ9D4CK7hdLAz8g=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 05:57:17 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 05:57:17 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>, <Cristian.Birsan@microchip.com>,
        <gregkh@linuxfoundation.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 26/97] usb: gadget/atmel_usba_udc: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 26/97] usb: gadget/atmel_usba_udc: Convert to platform
 remove callback returning void
Thread-Index: AQHZiU2Zi7k987+mcECO06yTd22OxA==
Date:   Thu, 18 May 2023 05:57:17 +0000
Message-ID: <7ab08b85-e0f6-a7f1-33cf-71783ed5d9de@microchip.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-27-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-27-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|MW4PR11MB7029:EE_
x-ms-office365-filtering-correlation-id: 14a819ef-b424-45e1-cfcc-08db5764bc4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sO5G/QCN96lED11EacnQu1hmA3aKBxwwmJWhO3CwWnXPhLZJTASp1AtAXyQ2BuR0cCgzo51W45ER1UfKMyY4LmeuwxOEs0cfyY8d0LsyZoPQ/30o72ELvEJYQjDDPnAr1o9znJzu7IVV50pnJs6YGgX/TzpL1AdeBY6EUDE54yLQm2VIF2m1o08efNJcqNZv2sPyiCHxDYa1gD/ieVFqvyShHKdvOqK9Q46yryfPlb/mTem93IdEt/UTLpSIe8v+hzPryDGYkAjlPAy8Oef+BoIy5F/m3HL4xGkQNx0AaJeFDIrWai4KiM0YtEGnCZJSjrIN8/+0z1S0jSA6U+aOY4AKhtBUOwvy+dDGGyx5WrJ0eFY32KqjZKDQCxhq9DqApZxkN9xr8ZVUUFxxbVz3SGUPSKC8gEisgRXvnfYiqqZN6NeaBUxKMrdhUpadlqenB0k1cv2WeXTRVdE0K1aNBetbhEG7fuT8FeXpn7bUH7oiUYUV7DrvoWuoaDxgHjtXUh2AIZTBEaUxTHtnzaSvCEphQIVxpC9+1Mrvz+QAdHmmd8IN4MT+WLx+qrmTYti5CdIncku/mDCaOlF9Nj6a4xhnsx4mxWy3PrWCUkDK8TdWjiVBAcXL5uX5P9eYw5ssXDDGvoWUxyj+TDj3GGu8MMzfM4uRXCfk1vZLa8J17LDARQ5DhY7J/QFPvzdO/CxA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(2906002)(91956017)(41300700001)(54906003)(31696002)(86362001)(110136005)(71200400001)(478600001)(76116006)(4326008)(8676002)(64756008)(66946007)(66476007)(66446008)(31686004)(316002)(8936002)(5660300002)(66556008)(186003)(38070700005)(6486002)(6512007)(38100700002)(26005)(6506007)(122000001)(53546011)(83380400001)(66574015)(2616005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHU2YTZ1NEhyOFc0dGw5V1d4aFdBd1orRGYzZjFraEw1VkRLdzZRb0Q5dmtL?=
 =?utf-8?B?cUFYdXZtUXFDcTAvVzJYaGUrQnBFNXdRN05mWHpLcG5QejJPNVhlczk1UjNk?=
 =?utf-8?B?Nnp4YUovOXk2V3VtUDdxWTl2eFY3UHJpc3ZaQ1k3TXNQWnFvQVp6UFg3dnk2?=
 =?utf-8?B?TzdzV25zMDR5eXl6Ti9EL1RITWxPNDZoU1hLREJjVnZlSFJBbXdudm9Zd2Zh?=
 =?utf-8?B?VElFY3NWNTgzb3F5cXFmbTByQjdiRDZNNTBoUFg3Yld5YWZIN21wQ0NSa0lx?=
 =?utf-8?B?SVh4WExyWSt4TG0zQWl2OG1YbE41aFZWb2dJTEFIeUxieGRNaGUrQU1jRHIr?=
 =?utf-8?B?cWxlbXhHVDZ0Tlpjc0RGUkdaTjhYVkJSbldzV21YVTJIN1RqVW1FS05vUDda?=
 =?utf-8?B?N09lcHFnNXlHMVBZYk45ZzBMZkVrb1pPUGI3Zm0wUGJRNlV0Rko4NDFjOHUz?=
 =?utf-8?B?TllKc3l5WCtJcXM3ci9waXZscGFrOTJZN2pTNTJmRHBHYitXcGcxN21WSE0v?=
 =?utf-8?B?VVFvUW43WU5OY1FJRHVBUGRqaGxNVG5nLys3eFRHcEdLbHMzdVZJbVVGNjJQ?=
 =?utf-8?B?N2FsK3JqTHZza2t0YXhWSit3eXZ5cEJPWGNPNnIySk5aNzFCM2puM0ZkelMw?=
 =?utf-8?B?SEZ3OWFmS3N4Q3dNeXZOSVA5c1QzV0xKZ3hENWZYbGtLRmM3by9QR1Z2cnBN?=
 =?utf-8?B?REx1UlErV3F0clR6RXVHQWlJblgyeUFoQUlvb0N2VXJGYUdHdm5PMUQ5V1Zz?=
 =?utf-8?B?Y1Q0VXpNZWdYOWZWMVpxNzkrREJoai9OeTBxMG1pdXB3SG5IUkNzcHFzNHNz?=
 =?utf-8?B?WkFuOVFOWExweFBNTUYyV0gwQVJ1ejhlbkoyUnpVNU1lb09ES28rZVRwMFFB?=
 =?utf-8?B?SURDRjA2TzVYSTVMbEppQjY1aThtRTVpQlBLT2prVTNRSG9LZ2NGdGkxb01S?=
 =?utf-8?B?VlAwNXEwUU1Ua2YvekJvbzJuR3JEUy9CQ0V5Tzl3dnJ5YXFsVXBWRktVMzBP?=
 =?utf-8?B?Sk5zbmxSeVVPZkpjekp4UFFKWE1OQnd5WlNsazFpbU5ma0pEUnZVdCtwV20v?=
 =?utf-8?B?cmJLTWNYSUxBRDltS1dud2kwNEpvLzdEVjFLdEVEdE51L0JWbC9NVXRnQk1O?=
 =?utf-8?B?bXJVTG5iVURZMldCSzEwUWh6MDFCTWQva0JhNEhrZFhGSFhDUzJSOEpUZ0p5?=
 =?utf-8?B?S2k3MjhCWlNIeUgvVWNpa1hYejYvS1d4aVdnd1VKRHRsckhocUtMdVlWLzlz?=
 =?utf-8?B?UXlVamhjTHB3RXdVeXNSTWJGQ05IcCtpVlpJbXNYenBQUzA1RXYzbTlNNlpi?=
 =?utf-8?B?eDA2Mk9yVkVXaFM1czNEd1JXcGNJeGtCTXN3VHlRMHlXbWw0QVdZM3h3K1Y2?=
 =?utf-8?B?L2JTTzJnQnNHSG8xTnkwcHFNdnc2SDB2UWRLWFlNZkl6OTh5TDY2MWdGM1Mv?=
 =?utf-8?B?amx4S3AyOExqS09jV2ErUlczM3hrODk1bDJQbUxERnpTd1piVVc4ODhxbmFE?=
 =?utf-8?B?L09MaUphRGNWaG1jYUxDc2FZV3E0eHRJaXV5YmtZV3hTR1VoRk51NXJwQ1Nu?=
 =?utf-8?B?N21kT1pBbE1vQi9CemFBOHlGZi9zVEdDZHhqdEhlYVFqUlRaWCtydXFUNnhx?=
 =?utf-8?B?RTVLREVtSDVUMGp6NUxHc0VLRXhCeE0vTEZqTFpjQkhlMmM3TjBGVU9EOFFv?=
 =?utf-8?B?TlViaDZCR0VGTlE1VGlwS2IvSUpoTUpVRGlNU24rTUYxL3hOT2dXYjdGU0lu?=
 =?utf-8?B?b254ZjBVTis4alJYOS82bXRGdER2NHBaQnk0SEM2bG1sRXpHS3JRSGk5RmFx?=
 =?utf-8?B?b1FLby8rWElKV0lRQzR3VDBhS3VuL3VYaFM5MHdwM2hsL0pQRHExYWdGRncy?=
 =?utf-8?B?d3BRNlBqNldqTkJTZVhXQWxMSVFxYi9tNi9LN3ordXJyQ3J3aENER1ptSWNC?=
 =?utf-8?B?c2huOG5FRVN2c1ZHWmdPb2RjUENYZ3NuOGM3YmtjSmRER0ZpcURORUdEbS90?=
 =?utf-8?B?ZGMvZDRrcEVkQW9hRnI1M0FqbmNJQlpCRGxhV2R3eGxWVmp4T2dyaTNQblhP?=
 =?utf-8?B?TjFzNVJaN0kxL3V6RGNOZnUxTm9iZDl0WHRlQ1RwV05wTkt3bDd5WERtQ3Mv?=
 =?utf-8?Q?Ro5r/yYL+ftxxIPF/lCHOKpBn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93D3624900E945419CABB24A23C9DC8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a819ef-b424-45e1-cfcc-08db5764bc4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 05:57:17.0146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mn/l5QHJLasqREE8gtKgWsQ7hWHogro8uYwQP1F9XsnV2roZkipsLYGJ4AhZdlRrRske4cRTxLOkBgI6n1HYNjUMZE4UlXBJdZOLai3hkPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTguMDUuMjAyMyAwMjowMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IA0KPiBUaGUg
LnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3
aGljaCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9z
c2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUu
IEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1p
dHRpbmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBs
ZWFrcy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVt
b3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1
ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJl
YWR5DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29u
dmVydGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4g
VHJpdmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8g
aW4gdGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+DQpSZXZpZXdlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhQG1pY3JvY2hpcC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2F0
bWVsX3VzYmFfdWRjLmMgfCA2ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRn
ZXQvdWRjL2F0bWVsX3VzYmFfdWRjLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2F0bWVsX3Vz
YmFfdWRjLmMNCj4gaW5kZXggNTNjYTM4YzRiM2VjLi42YzBlZDNmYTVlYjEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYXRtZWxfdXNiYV91ZGMuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9nYWRnZXQvdWRjL2F0bWVsX3VzYmFfdWRjLmMNCj4gQEAgLTIzNjksNyArMjM2OSw3
IEBAIHN0YXRpYyBpbnQgdXNiYV91ZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gICAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IHVzYmFfdWRj
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgdXNi
YV91ZGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAgICAg
ICAgc3RydWN0IHVzYmFfdWRjICp1ZGM7DQo+ICAgICAgICAgaW50IGk7DQo+IEBAIC0yMzgyLDgg
KzIzODIsNiBAQCBzdGF0aWMgaW50IHVzYmFfdWRjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgICAgICAgIGZvciAoaSA9IDE7IGkgPCB1ZGMtPm51bV9lcDsgaSsrKQ0K
PiAgICAgICAgICAgICAgICAgdXNiYV9lcF9jbGVhbnVwX2RlYnVnZnMoJnVkYy0+dXNiYV9lcFtp
XSk7DQo+ICAgICAgICAgdXNiYV9jbGVhbnVwX2RlYnVnZnModWRjKTsNCj4gLQ0KPiAtICAgICAg
IHJldHVybiAwOw0KPiAgfQ0KPiANCj4gICNpZmRlZiBDT05GSUdfUE1fU0xFRVANCj4gQEAgLTI0
NTAsNyArMjQ0OCw3IEBAIHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyh1c2JhX3VkY19wbV9vcHMs
IHVzYmFfdWRjX3N1c3BlbmQsIHVzYmFfdWRjX3Jlc3VtZSk7DQo+IA0KPiAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgdWRjX2RyaXZlciA9IHsNCj4gICAgICAgICAucHJvYmUgICAgICAg
ICAgPSB1c2JhX3VkY19wcm9iZSwNCj4gLSAgICAgICAucmVtb3ZlICAgICAgICAgPSB1c2JhX3Vk
Y19yZW1vdmUsDQo+ICsgICAgICAgLnJlbW92ZV9uZXcgICAgID0gdXNiYV91ZGNfcmVtb3ZlLA0K
PiAgICAgICAgIC5kcml2ZXIgICAgICAgICA9IHsNCj4gICAgICAgICAgICAgICAgIC5uYW1lICAg
ICAgICAgICA9ICJhdG1lbF91c2JhX3VkYyIsDQo+ICAgICAgICAgICAgICAgICAucG0gICAgICAg
ICAgICAgPSAmdXNiYV91ZGNfcG1fb3BzLA0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==
