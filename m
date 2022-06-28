Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B76855C240
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242410AbiF1HSV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jun 2022 03:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242427AbiF1HSI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 03:18:08 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2106.outbound.protection.outlook.com [40.107.215.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C224D2CDE8;
        Tue, 28 Jun 2022 00:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwSZtOQHCZh8uco/5EgKqVagEIaLqV9F1keJ4CV25IURNNjDbLpxwn08pvDzKUYnR12fk1redvJVRm6yAWY2DNuC1rUm514+KwPe5jiitnOywWljsxuiDFePuincdz/1Tnn6/qRw1mWlH1oI59agxcqd44ssMPKyXgoi/hUTewgAyazPzgYhMTLcpFpXGYaJP1GlfFP+YSJy4cZkKjxpfijOZISyYDTnY5AgspXMfaqbUFla0nmk8IPzDL6abuVXmgJyux2kjfP8blOXcLIHrsDgNutd+MZn6FKXG3jzGHi9Zt3DDp02snWBboGf2HFbEeer0tYDn2GCw+u04TIhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDEGrWimdKM/tELF5eHDz/Rk9KV/1qu64pkFob87Qnw=;
 b=kWAY3ATGyyVb6VXcPt2fku5UGa0uJdMWV+jYdkQiINaSS6wZV/bcvJuunXsxHsNX8oJ6PmSZeUPVRYp2V/i7Zgx80LTHxHhE/CHEgYLpbJlza4tTluYnP3uFFB5fpb/CcJetWIhfPmMDRIViwLq5DQ4c43rMLgJM8kYDLLW6/ZaCTndPbaZ4BExRgyDbQQg7RVU7tCKIbUdrIUoxGBAgsE64V9akcw2DyknKBXJfZyGxTCz6Kz1NQDwMVaAkeh0RomXZnS5N17YpLMCoNvZtzQOkPKAkZhIGcGrv7dv9SnGP/uCHlYqfcRYIn9sGQQC/lBPPsvvLFcbCLQGzgzZ+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDEGrWimdKM/tELF5eHDz/Rk9KV/1qu64pkFob87Qnw=;
 b=jd7qvSLoZXAh9omHiOVemZXiBifAmCVNI5pcrty4JjPEr5hgCf1S3gO+y/Wqz8ijKVT9d4RWT1XniptwFDnPEHpowebv9s4DU8qs5PuYSAg5VUyKHFtfnWFLzGtKrUkTeKrGhfLLDX78we+wXwkBSSNhiz1VmjF6/i3CQ4ypcRU0BBMhdYCSKHiEijOK1l6SkMp6FM1j+/CFEf9RoyLm0Q+IprMzccy5ifFdYowidCBBKMOOVKShYHNg0WHmS5+Xg5Ya7NRBJdUyypEv1VnwOSzdvRHtFB8RTrpJLgVxgXzcyyWEUlgSZWGaghK6DuXIXAW2wRcjM7zcq/ZfVQ7wvg==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by HK0PR06MB3105.apcprd06.prod.outlook.com (2603:1096:203:82::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 07:17:41 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:17:41 +0000
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: RE: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Topic: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Index: AQHYhkeMr7IZN0wRcEahtwSU6oJwdq1cN3kAgABVBQCAAYsegIAABN+AgAABXQCAABEX0IAET2mAgAHyHrA=
Date:   Tue, 28 Jun 2022 07:17:41 +0000
Message-ID: <HK0PR06MB3202F5E3C643A4943BB521A480B89@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrMsU9HvdBm5YrRH@kili>
         <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
         <20220623064320.GN16517@kadam>
         <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
         <20220624063457.GG11460@kadam>
         <46f88070d8f6f47f55310e964a4576cadbc810f4.camel@kernel.crashing.org>
         <HK0PR06MB32024B6C49E2C958185E005280B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <c960c2e02ddeacd527442e0b3b0db532c9017e1b.camel@kernel.crashing.org>
In-Reply-To: <c960c2e02ddeacd527442e0b3b0db532c9017e1b.camel@kernel.crashing.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de3a9c3f-c62b-4da6-e591-08da58d64a48
x-ms-traffictypediagnostic: HK0PR06MB3105:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xcmcQK4voZ5Iv2tLBUo1h1XQxqisAcZyRjkWPDAwEEZVc1vu90WwgD6oZf6/cuNSXexv8m1MpJ2EWifplvyx3OL8oSraFcV+F3yZ3x9loUkqZdKNCaaUNmqmXFjpMSpieH7P4ie5CeRD25S2DSUaYFTyrRRLhyepj5+f/q1p6UD5IqzowH7wRTL5vvDPvOp9lWD5vDJWVebuLjephLnFAmAezypVVMpyp/bknxdMfSIAlXIBsMExN9lh1ie8ozbxTevhVmlW4RU1lHDPbqLg4sYuFZcQ2JaJhNnXwXiuMj7cEw+Tbrn7PCUAt57OfYw1Ss8QV4xhkPT4VHhvpyU3swLhP333bPb94VdUsqcSWsYvnZkueDupuJvwf1viJaUjgAroELw5tPtCaBUe0g+hdxPhMw3fGJ5jEg8Gs4Ek6kjn1FoVqsGNCLmUj7x31ck2mqRiIuCOoBpBaqdgjOMmN80GvC+Pvv9X/ww6eBDWnWSVgAmshjlhT9qNs+mUEz5DJ0K/EMnCMC4bCjxlbQIk0tt/3Of2fSrGK4JvjG4sHWFQykfF+tN44ghr1jjp5nAafJwgyQ9CSqRTpyA4Lm2N/TUbtnHa9Ee1wwxAMVsqKSB3B5jWTIimUSOlJMT8pkX3Htm7Zh6cd3TjpjPY8nf+kgbxH9qZyj4mue4hHvAlrWJw8aInmRTWM7iExmGonNPxO3gmjwaoGgk+YGnRw0na0YlseE6K6aWmEqSXwdrwp2XJ7s4O4nNgJn7bt0kuJwXDbtf50r6wztUqtyMB3pl2jq8ri8mEfxXvFGXo3thBI2A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(39850400004)(366004)(346002)(186003)(8676002)(64756008)(38070700005)(52536014)(8936002)(6506007)(4326008)(55016003)(33656002)(54906003)(2906002)(110136005)(316002)(66556008)(66476007)(66946007)(7696005)(76116006)(478600001)(66446008)(38100700002)(9686003)(5660300002)(41300700001)(4744005)(83380400001)(71200400001)(86362001)(122000001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUFxdTE5ZE1UK1Fkd2FsMGM5Qi8rSzY0RHdseU9Pb3JrU3hpM1JXTjI0NENK?=
 =?utf-8?B?Y3ozdjhzdVdMZ2tVcEhscG1FQWtodFU3RjJONUMxTkltWGVWazdUbSs2T2JC?=
 =?utf-8?B?eTFTWVdBOHIyOURnTG1QbzJvWmVBNzF6ejRYYkVWNDVub2UvMGhjbkNMN0I1?=
 =?utf-8?B?QVo4bFJSa2N4Q096UnY0V0E2eXBEcVJuL3NVNFhFeTdCcWRQRS8yYXZvZnN3?=
 =?utf-8?B?cHh0R1dIWkZRUXNPbGlmRzk3ZnErZ1haMzlPMUR4dS9BQVREc0pJViszOTQ5?=
 =?utf-8?B?NXRieUFpa3hmc1FTMGZkTHBvNmlKajRhMW04NnBBdEFndld1MlFNcUxUUlc5?=
 =?utf-8?B?Q1VSNXJxanJReUxHNzh5Q3ozRktxTlJUbEFFZHNBancxYm1mdUJlaGN4ODZW?=
 =?utf-8?B?UmFTdmV0T0FrVTZHcEE4TVBXL0JpRU1xdkpvZnVPNlduSnFmRktFQjFxUGJO?=
 =?utf-8?B?Y3pRZWdxRDcwaExpeDVLU0JHeXhtdVhXVm1DdCtrNVRicmlMU1pNSXBjWEpB?=
 =?utf-8?B?UlNlakc2T1lrVUVOUDJsT2hFSURJdFJ3UUUxMk9MdmdIcndxaUZmRUg0T0Yw?=
 =?utf-8?B?U2tsYlpZdFI1N2ZRZnBVRFNQbFU2K01pZGIzZFNEZW8rNDRadVJvQkZDZHA3?=
 =?utf-8?B?VDUyOUgxU2IvVERLTmZtdWlLeDVtQ1NHSDM0cGFWR2VBa2U2blhldS9GL2d5?=
 =?utf-8?B?cHYvbWczK1dyQlV1VjBGcUJlZC9oNFlrL0VyMGlCK0xHdC9PcFJRbktXOW1O?=
 =?utf-8?B?YkMwRXBGdFUxbXNVRzF1b0t4N1hqbEg2YkpLZ3lwSEwvbTVzRStCMEx4UkY3?=
 =?utf-8?B?aW1VYmhlWm96dHlYc2JLenB4SXZCOXZENmE3OWlxby8ydnpnNFhkclhkazhk?=
 =?utf-8?B?VlhqLzdYOWxhTUpxUS84ZUxzeWVxWkk1ZG4yYkJMR3J2NCthNjhxTWIxTGlv?=
 =?utf-8?B?VW13Rk1ydEUyMHIwM01keWZuOC8xalYyenY5aTFLZWc1aHR5UFR5a0tsWXQ2?=
 =?utf-8?B?OGkvZmVRdnlUSmorYW9MQzNWTmlYWUgwOEE0RDNkUnJySjZ5YnBhdXBmb2c4?=
 =?utf-8?B?SCsrK1RoeTYzMTJlSncxQlhjditXNTNIZ3JLZHQ4Nk1Vd045cUwyM1E1OWZ1?=
 =?utf-8?B?T1Nvb243OTBNOURKN3dybi9pSEZtNlBtV3BuWHVrRnl0cmlNS0VFODNoQVVo?=
 =?utf-8?B?RXNuRUFOVk1KK09RQUZDNTYxOVhpeTZsamE3WWNoREwxQW52VnFyY3RCWkdz?=
 =?utf-8?B?dERTVm1uUDNZNS9DbWRBZVRiQXlsQmhGRFJDS09JUFVSeFk3b0pWSHBwUmg3?=
 =?utf-8?B?K0pPYkwrUmVNZGpla3dRSk5lSCtaOUpwYTJkSWRxTDZzaXl6V1paVkxLc0NR?=
 =?utf-8?B?NksxRzN6M2R3RjNnVGhWcUhpb00zNXZ1ZVNDT2J5R2tpSTVscDNEOWxZeit1?=
 =?utf-8?B?R3l1NjREbmRxbER2WmFXT2tvVEw4MHpVc3ZIL2RoSFpUTzdVQkNZaWRad2xL?=
 =?utf-8?B?QlQ2bU1pZUN3TEtsdlVKQStXcGk1VitjZmM5V01CVHN3MFJiNXdFOFBidGpF?=
 =?utf-8?B?czVSV1FFRW5keU9CSWZqVngwTlFxbW5vYUJPeUt0ZUV4dU5scGpkTDFJOC9T?=
 =?utf-8?B?UWxqTEhuQ2ExbW5nUXlzUlJMYTNkMng2bjFiZGRGdU04bkM4Sk9KT2I3VG8x?=
 =?utf-8?B?WWNmM1Z2bkN6Q1dyekFESk1uTmJaNGlCQmNOb0FzUHhKRVNKa2VzNWRTeUI4?=
 =?utf-8?B?NXVoV0FWTkw4Vjc3RnhDamFaWG9KT0Nkc0N0SmZnQ25zc3BUNEhaU1BRNm5L?=
 =?utf-8?B?THgrZ1ExbGwzc2hxajA0TnpFbFFtcERYbHFwZ1U0UDZuNllvaGFrYUE4QnlC?=
 =?utf-8?B?T0VIUzhINzNsTVNtb0RENkhleXI0OEhUYmF0N3Z5aVBLY0xRZ1gvR0hvU0hQ?=
 =?utf-8?B?WkExYnE1czA0YjZyeTlHaWp5eFBkQXN3Z0psdEs5ckI5bTU1Q1JrcHdQNGRz?=
 =?utf-8?B?NHpsaTI1eEg2OFA5Q1pmMEg5OGdob3VadjM3NXFsUW5IRXNnQXMyZVRuOW9i?=
 =?utf-8?B?UXp5VkdwSzBLN1VUZjFlOUQzK3piRjlQaXNHZUtjazdOY1l0MURVbXlKWFV6?=
 =?utf-8?Q?ObgupMYodFmJdv3TnjHwFmbcK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3a9c3f-c62b-4da6-e591-08da58d64a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:17:41.8414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95zi82ami5jw/ISZzTqWxcSvydIYmbrE2EgyO6AecU10Q2N3hL/FUMJK+PLn9yld4lTS6Q3Iq35ucnFpFDQPaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3105
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBPbiBGcmksIDIwMjItMDYtMjQgYXQgMDc6NDYgKzAwMDAsIE5lYWwgTGl1IHdyb3RlOg0KPiA+
ID4NCj4gPiBIaSBCZW4sIFRoaXMgVURDIGlzIHRoZSBpbmRlcGVuZGVudCBJUC4gVGhlIGFzdDI2
MDAgYm9hcmQgY2FuIHJ1bg0KPiA+IGFzcGVlZC12aHViICYgYXNwZWVkX3VkYyBzaW11bHRhbmVv
dXNseSB3aXRoIGRpZmZlcmVudCBVU0IgcG9ydC4NCj4gPiBJIHRoaW5rIGl0J3Mgbm8gbmVlZCB0
byByZXN0cnVjdCB0aGUgY29kZSBpbiB2aHViLg0KPiANCj4gQnV0IGlzIGl0IGEgY29weSBvZiB0
aGUgc2FtZSBiYXNlIElQIGJsb2NrID8gSUUsIGlzIHRoZSBmdW5kYW1lbnRhbCBIVyBpbnRlcmZh
Y2UNCj4gb2YgdGhlIGluZGVwZW5kZW50IFVEQyBvcGVyYXRpbmcgdGhlIHNhbWUgd2F5IHdpdGgg
dGhlIHNhbWUgcmVnaXN0ZXIgbGF5b3V0DQo+IGFzIG9uZSBvZiB0aGUgcG9ydHMgb2YgdGhlIHZI
VUIgPw0KPiANCj4gSSBkb24ndCBsaWtlIGhhdmluZyBtdWx0aXBsZSBkcml2ZXJzIGZvciB0aGUg
c2FtZSBoYXJkd2FyZS4uLiBpZiBpdCdzIGRpZmZlcmVudA0KPiBlbm91Z2gsIHRoZW4gbGV0J3Mg
a2VlcCBpdCBzZXBhcmF0ZSwgYnV0IGlmIG5vdCwgd2Ugc2hvdWxkIGRlZmluaXRlbHkgc3BsaXQg
dGhlIHVkYw0KPiBmcm9tIHRoZSBleGlzdGluZyB2aHViIGNvZGUgc28gdGhhdCB0aGUgc2FtZSBk
cml2ZXIgY2FuIG9wZXJhdGUgc3RhbmRhbG9uZSBvcg0KPiBiZW5lYXRoIGEgdmh1Yi4NCj4gDQoN
CkJhc2VkIG9uIGFzdDI2MDAgaGFyZHdhcmUgZGVzaWduLCBpdCdzIHNpbWlsYXIsIGJ1dCBub3Qg
ZXhhY3RseSB0aGUgc2FtZS4NCkkgbmVlZCBtb3JlIHRpbWUgdG8gZXh0cmFjdCB0aGUgZGlmZmVy
ZW5jZXMgYW5kIGV2YWx1YXRlIGl0IGlmIGl0IGNvdWxkIHV0aWxpemUgdmh1Yi4NCg0KPiBDaGVl
cnMsDQo+IEJlbi4NCg0K
