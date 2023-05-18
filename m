Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC50D707813
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 04:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjERC2w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 22:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjERC2u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 22:28:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9953C03
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 19:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqjytu/NMW+I7G1AEgm792mlJo30CHzgql8ATIWUDOJ6Bke3lXE9T7tah2+FaXgkIjPZEoXnKl83wGEjfBmAIUt7SLRh+tuIiKzyRXVwUYbeaUaqHLuwc8S7Kw+E0miEonVmtc6eDSR8onOyIfcDz6WvaP1riDZ0qJd/wUaVbUTeQTthKhQXzjomPX2atIq8CLxmWg6bVOCY1bA6SIjh3puc1VCvYm8WK0PMxqe9+tyg5KfztFDlFelfZBcW/L8cMuX6s0JNpRAKHvdKpxIj507oqjmaz/JYhwTb9yv46YDv/CkT8rfcxK+NZn4KSbGj7cHfES4mBsMtt4vSEsSu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5J/jGuHPJjusiHNvR8Cz5ahAFvYZmYNd7/FsKOhoqo=;
 b=BOln8w3BzHCJlKl4gTbz+pTaEH947ItF2ohTT5iOvY0Zy61UdGnHnbBQcGkfKuCjVern1uY8CWgZu0VANv14NDiU1u+6+mtiU1bHxijc9Z+sk82hwCdAwtv/IbqQxoUmm8rcaV60/W+k1SLOVvSw1S6ozHprtv9UH/EPNwZZgDBYyVCXm6LXYe3TfUUJf6dGUAomHRg0DVaOjdhnRgFRtkcIkxktvVALmMc07xVg+AUHG/J7Q1PIDqCGnmd9v1dT9X36WJCoJUVCrSDMZSG57ajRZ5zfwE+rFqHvy2hoI5v1IlK7LOY1ACVCqxYA0trMMB6AC2sfAgQRWGJe+uuL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5J/jGuHPJjusiHNvR8Cz5ahAFvYZmYNd7/FsKOhoqo=;
 b=Zhdl05NV8+S/PIxW1t8SdlpBWwdQULCKDwV45G242Nf1c9MIoVqeo17jkeTL8WBvMmPKZhQjc77Nx9Ft39YwQlmJeevLMEOHswWlxdtYxtL8dw+lk9rryfVH4Lii74gtC5RjYjSMVYHybM1mlCwX4nkN7Kyojzi+Jj1F/BKfBR0=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9421.jpnprd01.prod.outlook.com
 (2603:1096:400:1a3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 02:28:45 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%3]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 02:28:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 88/97] usb: renesas_usbhs: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 88/97] usb: renesas_usbhs: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRPgxG9o63Bjf0GC+4QiVtj3B69fS+gw
Date:   Thu, 18 May 2023 02:28:45 +0000
Message-ID: <TYBPR01MB53416050288DB05C8E948913D87F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-89-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-89-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB9421:EE_
x-ms-office365-filtering-correlation-id: 09d9e156-7627-4250-30b7-08db57479b05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nz+mLrp9JC2CmtT9iuzcfJBt7d2ZmFTo82pYfrN80V2iRKz8EL9yoAhYWdIdaTu6VxswhbWyjcv4CLwA4k8jNAkhlHUYOLfmwE3xg+veiaD8H8m4V+WZJqHNwV/DrclE6/+HL4MwEgyEw6Qw3nkwGjr2/i6n0BKEsBMWMwqk2DfDVJbzl6yi+osisTHrMDfn34VhGPNm33RIsUnhdHc/Pw5eTbnNwDOq56PTYh54V4+jb8cxys2+r2MVAlxbx4uoOR5df1OsO+SYi81x1nBEBSJtYZhFdw7i19xoLFwIg8Ivg2A4jD6168sV/Q9b1g5Gp5L7A0yrfKK7lhvXzvqF5QQ9otXvj7uLjsBeP+VyFOnuL8F9paz6jx0jsW8ASW+711N0YkcpNSWwoJhnkzEvyzwQvtRwIHwpTbYNa5ZCcI5hjbjvez2D3i2P+bGJVs2XI8AKuaeueM/cMW6Y9bLJ77AL1IiEjqjvwYSVJGrDBo8YWEsRzeZitG4nGJpGyOJkQXbLaZYWsJpmsjqxlGqMqW3Okw2zhPZRSrWwz2P5Cfrqp6v0777rNMpKaNg2hqEPXOooJmUdMJ4+4GxPDMbdPtFAL7KbReX3ud4vauoGGMSVDorGw3asiMbc6D5ZRR6w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(8936002)(8676002)(66574015)(5660300002)(52536014)(83380400001)(316002)(9686003)(6506007)(122000001)(186003)(86362001)(38100700002)(38070700005)(41300700001)(76116006)(71200400001)(7696005)(55016003)(33656002)(66556008)(66446008)(66476007)(66946007)(64756008)(4326008)(478600001)(110136005)(2906002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmY2QmhyWk9rNGxYZG80bVFySEZiZllRbk5naHB2T2ZBZ1owSjZGYjd3TStB?=
 =?utf-8?B?RVlrNDBkdHNDOGh1aEpORzA1eGdlYldzVkY0OE1ycEtUbDRQQUNIbGl6dlJl?=
 =?utf-8?B?cDRMUTNRQ3ZldUF6dVJRTnBqWnZ5a1p1YzdJdmIwRlU1NDBIWmNGSDlDdVRQ?=
 =?utf-8?B?aUFodkI5N1lQYkJCNTNsbCtQa1o4bjRvWnJtbUV0SG9mcXN1Q1plalVZN09C?=
 =?utf-8?B?eERzU3RHVnRsd0U1ZGFkdWJwc1MzRGkrQndBQlRpQjhzZ1NicHkyeTJMYzRU?=
 =?utf-8?B?S3lNS04wR3g0OEIxRFJHQkVTWVdTZFhmWnFhMkRtcHArRmVqaHMvZHNEZEF3?=
 =?utf-8?B?d1llUHM1dEd6bXFTVmZxT1IyYm9jUFRJemhWWHQ5SHFDa2xvcktXSnVkTE8x?=
 =?utf-8?B?M3doMENmUDhtM0EwZDRvQlI3MGlYcXZSdEVIcjJNaStCZ1A1bEdxNE1lM1Bn?=
 =?utf-8?B?cklqMzlPRHRGVEt2MzJJYjRKQjU5cnFhQXpzUGdoc1IzR050b045bWMvYWJa?=
 =?utf-8?B?dndJQ3lQT09YOFBFT08zamRFVVNKQlNLRGlTelB1ZVhPSWd6MVJNVWxnYXVH?=
 =?utf-8?B?NHltRXl3cXJaTFM5VjhYOEZGcno2Z0pLU2J2MDVoNi9KZHhvb2Q4T2R5M3VP?=
 =?utf-8?B?NmxzbWhhSVNZMy93UmI0WWt5QkhSd0ZVamZSRjhEbUVyNHYrSDVZRDNEOWda?=
 =?utf-8?B?UU9WcVJ4SGVKdTZ2RVhmekhtajd2VnQ3bUo1NnZ3a0pDVHdMOEk5TnJPRllC?=
 =?utf-8?B?Z24xM3BvN1NwWldEQSttdWk2UGdaTjNtUDA3enRyOHBBRWVuOTMwVWZwdkRk?=
 =?utf-8?B?eHFnVWxScnRGcENoakcyekJpVElXT2JQZzhhcWVTek1KKzZ3a2pEWFYySzZX?=
 =?utf-8?B?WVQwY0pBUmx2Rkl5WkhuM3N2QXgvSm44a1c5d0F5Q2JVNnZxdGdoQVQ3eldH?=
 =?utf-8?B?UkloYzY0aFQzd1NUTWg5a3NaNHNiS3NyNVc5djQ0Z2MvVElNVUNRM1QvZWNP?=
 =?utf-8?B?cC9qTzZTUHZ6cWJoSlBzWnU3MFByUEM1bG9pRE1rQXlFSmdWVTFPRkRRd1pU?=
 =?utf-8?B?RWI4Vm53TE9tR1hxYXRzQkIrOEkxcURKaXprRFlHa1hQdTY0N05Mdkwyc2pt?=
 =?utf-8?B?MGl0ekxFcmtKNDZzYVRqMnBJUjRNblNqaEY1bHBJWElwY3JUVDVWTW1QOWxZ?=
 =?utf-8?B?d1JacHJVSDZDaFFWWnM5VkE2STljMXFjNDJoOUhWSFpyTW5xN0lMazdENDFl?=
 =?utf-8?B?OTVyS2x4SytFSE0rc1FCZGd5cHowU0RMZTdIUVBBNlh5ZEhDK1B5MXFNOTNh?=
 =?utf-8?B?dDJGaERtcGUyQndqcjZMd0RTVDViaHlmU1FCbjR3UFczRWdxUnJqNlBsT0hY?=
 =?utf-8?B?dDI2VGRWLzNUUmxzUktCT0RUV3QzK1hSZitsa3RyMFkrTWhOVUN3SnhTUzNv?=
 =?utf-8?B?TnpSU2d2cVczdytZcDlJdUNvdTVaUmY2RTBvcnhuNkxEWDRNeXlRNGhtaUtF?=
 =?utf-8?B?dkRlT3k2SmFDNWE1ZG44T3BaTTJvV2NvNDRMTFRpakMwREtTdDV5L3IxZjg4?=
 =?utf-8?B?V2pLbnhXaFZpZVJ0SUhaZzhiTEhsZ0k5MHB4TzFoSVJML21TcnNkQ1Z3VXZV?=
 =?utf-8?B?NUxDMkJiSHFaZXp5dWMvemhkTENDV0E0WStXdjJWKzRsNFFERXRKNkJKcFJE?=
 =?utf-8?B?ZFlZU2NqZFNIU1lmVlJUT0paYzVpMFVpbm9hSXFPTFR4L0xXdithWUxNNldm?=
 =?utf-8?B?UGFJSDJIY3FSYWdTRGc3QTZSR09oMnY5VExZaGVXMHdWSjBYV3prSGp5UFI5?=
 =?utf-8?B?M1MwNkZ3WERZOGlRN2FUQ1NjRmZrVWkyd1Z1bE5nanBDaktmQ0FaYWJwY1FT?=
 =?utf-8?B?dzUxVThoYXBCZ1Jyc1ZjSGwxRW5SWDQwUGRObVZDRFJWNURzMUl2SVVlRVpv?=
 =?utf-8?B?WEZyZ1c1bkRNVVc5ODFJMVl3OUZmZjdUMDBLSWhSZDZqL3VyUlcxSnJwY3lK?=
 =?utf-8?B?VUdEcGx1dmZWaFgwK3FwanJhOU80UGVpQWJiMlE3SnN1OTRWZnZnOHBqbXpW?=
 =?utf-8?B?ZkRPcTdrbXhjZWY4dGtTcnFWNmozVVFBR2d1UmNiMUZPWWdaYlowN2RFMHFX?=
 =?utf-8?B?NG1WTkszZUFEMDJ3M2VSNVVKZUFLMWdsMTZJTVFxU3BQSmlPWGlVZDRieGFS?=
 =?utf-8?B?OWVXZndJaXFTYjl1b0xRZlNQa202UHNVcktZT2x6eEFTOFZVdHlJSzNjK2xl?=
 =?utf-8?B?Vm5DZTlKenJiL0E1RnJ6d3RLN1BBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d9e156-7627-4250-30b7-08db57479b05
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 02:28:45.7560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMbBGlwtuS6GeDrQ8YSvMvweJ6WwYgbdnWuUwt+rtijM1mBNBOMK5EL9+Yxh7x8vuVi9AM48MZRoyWVpq5xzB10dKTuGc5agu5GiHVTPkiC6UsnxL8EI0HT1tawXjuqq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9421
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgVXdlLA0KDQo+IEZyb206IFV3ZSBLbGVpbmUtS8O2bmlnLCBTZW50OiBUaHVyc2RheSwgTWF5
IDE4LCAyMDIzIDg6MDMgQU0NCj4gDQo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxh
dGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzDQo+IG1hbnkgZHJpdmVyIGF1
dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJvciBoYW5kbGluZyBi
eQ0KPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUgcmV0dXJuZWQg
aXMgaWdub3JlZCAoYXBhcnQgZnJvbQ0KPiBlbWl0dGluZyBhIHdhcm5pbmcpIGFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlDQo+IGhlcmUgdGhl
cmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIElu
IHRoZSBmaXJzdA0KPiBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRl
ZCB0byAucmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkNCj4gcmV0dXJucyB2b2lkLiBFdmVudHVh
bGx5IGFmdGVyIGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQsIC5yZW1vdmVfbmV3KCkgaXMNCj4g
cmVuYW1lZCB0byAucmVtb3ZlKCkuDQo+IA0KPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZl
ciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlDQo+IGNhbGxiYWNrIHRv
IHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2ghDQoNClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5jIHwg
NiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24u
YyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMNCj4gaW5kZXggZmEzNGVmYWJj
Y2NmLi4xMTFiN2VlMTUyYzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNi
aHMvY29tbW9uLmMNCj4gKysrIGIvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0K
PiBAQCAtNzYyLDcgKzc2Miw3IEBAIHN0YXRpYyBpbnQgdXNiaHNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gLXN0YXRpYyBp
bnQgdXNiaHNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMg
dm9pZCB1c2Joc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4g
IAlzdHJ1Y3QgdXNiaHNfcHJpdiAqcHJpdiA9IHVzYmhzX3BkZXZfdG9fcHJpdihwZGV2KTsNCj4g
DQo+IEBAIC03ODAsOCArNzgwLDYgQEAgc3RhdGljIGludCB1c2Joc19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gIAl1c2Joc19tb2RfcmVtb3ZlKHByaXYpOw0KPiAgCXVz
YmhzX2ZpZm9fcmVtb3ZlKHByaXYpOw0KPiAgCXVzYmhzX3BpcGVfcmVtb3ZlKHByaXYpOw0KPiAt
DQo+IC0JcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCB1
c2Joc2Nfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IEBAIC04MjYsNyArODI0LDcgQEAg
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcmVuZXNhc191c2Joc19kcml2ZXIgPSB7DQo+
ICAJCS5vZl9tYXRjaF90YWJsZSA9IHVzYmhzX29mX21hdGNoLA0KPiAgCX0sDQo+ICAJLnByb2Jl
CQk9IHVzYmhzX3Byb2JlLA0KPiAtCS5yZW1vdmUJCT0gdXNiaHNfcmVtb3ZlLA0KPiArCS5yZW1v
dmVfbmV3CT0gdXNiaHNfcmVtb3ZlLA0KPiAgfTsNCj4gDQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJp
dmVyKHJlbmVzYXNfdXNiaHNfZHJpdmVyKTsNCj4gLS0NCj4gMi4zOS4yDQoNCg==
