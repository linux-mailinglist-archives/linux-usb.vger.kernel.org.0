Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4E0631771
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 00:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiKTXwZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 18:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKTXwX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 18:52:23 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60134.outbound.protection.outlook.com [40.107.6.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF8B22510
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 15:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2I7+swYikoWCtoABW7v2RFc9qzjo7ida885uXOfw+rvtAf0rmBu4HEFJBbNEWKEniKIZ/a58OQJKGcvjNGAkgAMIFT+jzfqGApkdAt/iK9nZc3hC5rXxD/xFHEldux9g4VE+dPx5CqNKuGgBBVondsWNFoR6E1TLMbTNesb4X37ac6geVl9Y5XrzaUmwQQG5LPurDvk/SAztRJUg9CD03FB2PXgnS97uynAaJh2h4Lr273aBaMtFAbMY4mPgo2Ilh5LVZdkCdOhlt6yu7Pv0xj4DXOJ8jzp1kqj8iQpL7v/DTQ4cwk5DYriTSnJK/zGtozRBSaf2ibyWm7Nt5PNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18cYsewAUzRV6ceDwxjlTL7AJKzgp+skPh6AjTdLCNk=;
 b=SaMHS4i+rOgG8RzDVlLbE4PIrkB6PUqPiNtNgb2/WoXg+opaeQSFTgmTp212ENWI8c2E9OmY9pXGHb3zFIqHCZvb5bFtXwj7MaQAI0BrMYfK3PzrzWwsBkU3//DUI/JsK8RxdcuUJfwd7yjFqdSrJU3DipjbMal/Ix40t/hgBow1i2GByy1IdQYw7Rrr+G230aP5hl3rLkCR+HgXCOoJEZcpdk9vLrHo8jYrUhblol3YJFTz/KwOoPyoI/UNL/wyR8JaUgE8McTBHuTBBF5qu+TjWA/7xt6bNjHswTSognkLlR5OFz5n/P9CDKtU3mkB7G1x8reHws5wsoIyg3BX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18cYsewAUzRV6ceDwxjlTL7AJKzgp+skPh6AjTdLCNk=;
 b=VfbS+qDSqd3dgZx6Bj6VLAc1CjA/Yyr6BzkEQthb7cUb4tI/0SaPPbU0a7UjIypZmRoNyXcChzpgGlOHKB47JoVaSbYPZcisuGVVs2yAvZhvsKyPR0gfHGoI8OIX1BYQs/xDiZt1G0Hf3etawY9xqTAOM/WJHLfipme/DVupZt4=
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com (2603:10a6:20b:26::24)
 by DU0PR03MB9756.eurprd03.prod.outlook.com (2603:10a6:10:44b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sun, 20 Nov
 2022 23:52:19 +0000
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::5c3c:8e4f:b41a:bcb9]) by AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::5c3c:8e4f:b41a:bcb9%4]) with mapi id 15.20.5813.020; Sun, 20 Nov 2022
 23:52:19 +0000
From:   =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To:     Marek Vasut <marex@denx.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] extcon: usbc-tusb320: Update state on probe even if no
 IRQ pending
Thread-Topic: [PATCH] extcon: usbc-tusb320: Update state on probe even if no
 IRQ pending
Thread-Index: AQHY/OqDCXlvSF57ikKRibenTDlE3q5IfGkA
Date:   Sun, 20 Nov 2022 23:52:19 +0000
Message-ID: <20221120235218.zrpbdxldzexzudks@bang-olufsen.dk>
References: <20221120141509.81012-1-marex@denx.de>
In-Reply-To: <20221120141509.81012-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB3943:EE_|DU0PR03MB9756:EE_
x-ms-office365-filtering-correlation-id: 4f07d225-7a5d-448e-9d66-08dacb52429a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2b75fYf4ChPX/yIqBKkAOdGFM6CdMeiFc/On0LjJfGxDOcC/mnGOupSpqLjuUzN6ogcdd/WCs9AaNeEOOR1oaGkzZrGuLq+Uo4qjx6YX1KzPshAENNzgFB8R5RflG5BURHyytrWd6JqyJE3IcB6Of6LXb7LeDPzO49uUbnMy9xi496L0evHwQBqQlm94CmGaDD2Orig2vtaexMo49SJCGDC7epmIjDRmvSFdaiomY1lDNTjugBdRz9jk+SPGRTcN8oBSXnpE5SGUTwvXve2j7oo6lfDWcp0rj939a7RsGWGzSYMz/7VspyxK1XmlRiXijyeGELV4cFu6+WjRPfW7fCYmpC/1ZDyR3pmsEc/vlKpbff/ySyXsOOGoDIOiyHYgV7MfTVJw3wI5Ln1RVQ4s/eJdazgSE0GEOMgkgnyqbiBPhutG1dccLBSy0ja9ysSpaJ8tm0NYhshslmEn4O4HY7bZ/jnAwAkfY3TWe2tzdLSXcBb6MbK9DGgts1wT/tnmWXT0HH9GfrVKwTVhbSOJOcmDiuZiiNFYd9zuXCBgrk1KfCaeok9n+gABVVHmb72hn+6xmRpInuPxgDndqUW9B5lz/UZUOlRdusmI9VAvlVI8BbGTR00Z7a7rDfVyIOSnL1BEu3eX5YzMt7+INkHUsc09adPaeULMlbsouVUXzRD8X1NJ8YjkkAi7in6251TJYjo3AYdJYTBQyrGNsCG1lQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB3943.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(346002)(366004)(376002)(136003)(451199015)(26005)(66574015)(36756003)(38100700002)(85202003)(1076003)(38070700005)(91956017)(2616005)(186003)(478600001)(8976002)(8936002)(6486002)(6506007)(6512007)(71200400001)(8676002)(66446008)(122000001)(6916009)(316002)(54906003)(83380400001)(5660300002)(41300700001)(4326008)(76116006)(66946007)(66556008)(66476007)(64756008)(86362001)(3716004)(2906002)(15650500001)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzNxUEZXaGVmYTRzQ2lKb2hnbXREaklyenlDS1hlYTlWdVZXcWtBUGdmTEdP?=
 =?utf-8?B?V3hXUk9vUW1PZXdEZEtvM1JGZ3JRQzZqUVBYRm05MUZlUFF5cVN1ZEtlRGgy?=
 =?utf-8?B?NmpOUXdkQStLaWlDdm5kbFdIcCs3RXU0K2hvM1JOVi93YzFyZmVmQUlDNlFW?=
 =?utf-8?B?VEp5WlowSFRkczBFYTJRanpUVldIZjNqVWFTWTBaaU1YNHBGZytiUitkYURu?=
 =?utf-8?B?azZwd0VTUEViZ3padDlSZzE3ZHhoaUYwNU1UYjc1MlpxV1lSTW9BMXZFdTRq?=
 =?utf-8?B?eWN5bDcrL1lOU240eVE1dmJxRGsvcmVCK3E5Q1FNZTNxK0NXeXFhTjVKYk1Z?=
 =?utf-8?B?QTN5Y0dZZ1hUekIramZES3k5SmlSMU9aY2hDeGZDNkNyYUFvdFBtMmRxU0NZ?=
 =?utf-8?B?MWFDSUdJT0RGUFZ2TmNVUDNZSEVYNG9PZzN5M3MzWkxiQWRBYkhvSStNVStG?=
 =?utf-8?B?MHhTbWVQL3dtUEhJVFMrdFI0WlNvcVRONG5sNFZObjhPMitDNC8velNwc2dG?=
 =?utf-8?B?b3BXM1NzMnB1YTQ3UXN4c2FtbHBqV29tcUxvV0RJTnQ5dFNuQ240aStNd29E?=
 =?utf-8?B?RGpGcTV0MkdYRVZpeUlmNWd1TmJOeDJPQytUeTllOEF2SERnVUlETmlRalNL?=
 =?utf-8?B?Z3RPQW41QmIxS21BMXVqWi9BVjRVNlRwZUkzaHBrRitva1FFTlNhZTN6ZTdF?=
 =?utf-8?B?aTJ1OExiSHFUdWR2YkZQeGlyK1kzNlVJNi9STHJWclF0bGg4MDc1YmFEUXh6?=
 =?utf-8?B?bTBRb0tSd3ozRFkwM2ZOUFhwbFlzWjl6bEtBNTZROHBmS1ZDdFVHZGcyc0V6?=
 =?utf-8?B?anNpVzJlcmJyQkovaStnc1NaL1pPNmtzemw5c3lUenVPb09hY2QySE1VZkk3?=
 =?utf-8?B?ZmttRXFmYzFYZml1cGM5V05VaFhHbmRrNktkY1I4SkxVcUhQMVd6NnRUbDVT?=
 =?utf-8?B?aXh4NVVSTktnTWM1c2xJaEdmeDVlaEMwRmNMaDc3ZGtLS3ZKRmRIVFgzb0hS?=
 =?utf-8?B?amp1d1JnTzdaMlF3REZEdWZhM0hlZmZhckl5SU16bHRrZkxPcGU4RUI3SDBJ?=
 =?utf-8?B?ck5iemhNT2ZEeTNsaU1CZ0U4S015U08xQnhUQit4YS9UcWNsc3lIUCswSGdl?=
 =?utf-8?B?MzRLeWtZYVFhSGRJT09rcmZJc21pZkZLQU1BSENReERHc3NKSmZKZVZYUTBK?=
 =?utf-8?B?OVVpYmwvbkgzREhpUXpTNXYyS1IrTnRlV3JHN0t6NUhOZCtuUVpIdmJSVVhp?=
 =?utf-8?B?ZTU5RXJPbTltNUpJSjlReDZCQ0FqdHdJS0t0ay9Oc29qVVFoQW5ETk92RjVG?=
 =?utf-8?B?K2crMGNnUE8vbm5Dck5NTGc4ZmFzZTJlMDN6VUdraGlJUUR3WlFhV1gvNXBP?=
 =?utf-8?B?dW9qRnlqclI1anBpalRwSHlMbmJlZzRHSU4vemZ3eFoxVkdxZ0dqTjBpR2Iw?=
 =?utf-8?B?QXhHOU53YVVYb2dXVSt5Q2Q4RG5yb0hXeHBMMlNINDdueHp0aFdSVHhFQjMr?=
 =?utf-8?B?R0N0dTZPZVk3d1crd1kwaEl0SEYzNjB4bGUwWkFZSGFBWkFjNGJSWHhqaXhn?=
 =?utf-8?B?MFRGYXBYckNMbFRZbGt2SnZzeDZMOW9JdWZ3OXJ0Rm8xaGg0QmNCVnVvemR5?=
 =?utf-8?B?Q3FMN1VHQ0RzdE5ES2RHemJDa0RRRlp0NjdwcDkrYmE0N0hpZTlONWlMQ2k1?=
 =?utf-8?B?TG9lYlVuWFpBYm5aOE1oOGdaWlA3WXNTdXhmL1JTbmtiNWZ0US85QlZXbTBO?=
 =?utf-8?B?UWl4RkdFVlBxOTBTTU9taktnaW92R212MEZ0Q21kcEVjY1FpOUJxRTNqQnRY?=
 =?utf-8?B?TElGRjU1VDd1Q29heURPbkxraDlsZzlQeG5pRWlwRXE2OFRUQzBJdlRQZysr?=
 =?utf-8?B?NlRWRENHM3pyMEhldWx5Y2RjUmtqZkMyeE50cGhaSDNPNmh6MW5nZmlid2c3?=
 =?utf-8?B?S3pENEs1dnBheFptdjJad2lWRXRoZjl4akdBSGNyN1pGdm5NSmRUWVRzdzBB?=
 =?utf-8?B?eExObk4xbTlYYUdxVVJ2WFJiMExKZVdpcFdIVHFCNUJFTGZBZitjQWtObTR5?=
 =?utf-8?B?eU9hWG96NnBuamN4clZrcDFmemVoTURRUTdVOFBONGJqTXpkSEpVT01rV1JW?=
 =?utf-8?B?MGV5NDJUbXA0bkZDVVlqUjhlNjFJcVI4Z0kzb1BVTStXdWkzOXdRT29SM3Yz?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C4104851581394AB6104B55798678EE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3943.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f07d225-7a5d-448e-9d66-08dacb52429a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2022 23:52:19.1219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAAAteAZl62PdlasCWKXCFhYWUzBgCiw0orusraQWUDCAoAar61Zj7p2N8NWgaLeC/UNcUh2sgnFCRRbRPOelw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9756
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFyZWssDQoNCk9uIFN1biwgTm92IDIwLCAyMDIyIGF0IDAzOjE1OjA5UE0gKzAxMDAsIE1h
cmVrIFZhc3V0IHdyb3RlOg0KPiBDdXJyZW50bHkgdGhpcyBkcml2ZXIgdHJpZ2dlcnMgZXh0Y29u
IGFuZCB0eXBlYyBzdGF0ZSB1cGRhdGUgaW4gaXRzDQo+IHByb2JlIGZ1bmN0aW9uLCB0byByZWFk
IG91dCBjdXJyZW50IHN0YXRlIHJlcG9ydGVkIGJ5IHRoZSBjaGlwIGFuZA0KPiByZXBvcnQgdGhl
IGNvcnJlY3Qgc3RhdGUgdG8gdXBwZXIgbGF5ZXJzLiBUaGlzIHN5bmNocm9uaXphdGlvbiBpcw0K
PiBwZXJmb3JtZWQgY29ycmVjdGx5LCBidXQgb25seSBpbiBjYXNlIHRoZSBjaGlwIGluZGljYXRl
cyBhIHBlbmRpbmcNCj4gaW50ZXJydXB0IGluIHJlZzA5IHJlZ2lzdGVyLg0KPiANCj4gVGhpcyBm
YWlscyB0byBjb3ZlciB0aGUgc2l0dWF0aW9uIHdoZXJlIGFsbCBpbnRlcnJ1cHRzIHJlcG9ydGVk
IGJ5DQo+IHRoZSBjaGlwIHdlcmUgYWxyZWFkeSBoYW5kbGVkIGJ5IExpbnV4IGJlZm9yZSByZWJv
b3QsIHRoZW4gdGhlIHN5c3RlbQ0KPiByZWJvb3RlZCwgYW5kIHRoZW4gTGludXggc3RhcnRzIGFn
YWluLiBJbiB0aGlzIGNhc2UsIHRoZSBUVVNCMzIwIG5vDQo+IGxvbmdlciByZXBvcnRzIGFueSBp
bnRlcnJ1cHRzIGluIHJlZzA5LCBhbmQgdGhlIHN0YXRlIHVwZGF0ZSBkb2VzIG5vdA0KPiBwZXJm
b3JtIGFueSB1cGRhdGUgYXMgaXQgZGVwZW5kcyBvbiB0aGF0IGludGVycnVwdCBpbmRpY2F0aW9u
Lg0KPiANCj4gRml4IHRoaXMgYnkgdHVybmluZyB0dXNiMzIwX2lycV9oYW5kbGVyKCkgaW50byBh
IHRoaW4gd3JhcHBlciBhcm91bmQNCj4gdHVzYjMyMF9zdGF0ZV91cGRhdGVfaGFuZGxlcigpLCB3
aGVyZSB0aGUgbGF0ZXIgbm93IGNvbnRhaW5zIHRoZSBidWxrDQo+IG9mIHRoZSBjb2RlIG9mIHR1
c2IzMjBfaXJxX2hhbmRsZXIoKSwgYnV0IGFkZHMgbmV3IGZ1bmN0aW9uIHBhcmFtZXRlcg0KPiAi
Zm9yY2VfdXBkYXRlIi4gVGhlICJmb3JjZV91cGRhdGUiIHBhcmFtZXRlciBjYW4gYmUgdXNlZCBi
eSB0aGUgcHJvYmUNCj4gZnVuY3Rpb24gdG8gYXNzdXJlIHRoYXQgdGhlIHN0YXRlIHN5bmNocm9u
aXphdGlvbiBpcyBhbHdheXMgcGVyZm9ybWVkLA0KPiBpbmRlcGVuZGVudCBvZiB0aGUgaW50ZXJy
dXB0IGluZGljYXRlZCBpbiByZWcwOS4gVGhlIGludGVycnVwdCBoYW5kbGVyDQo+IHR1c2IzMjBf
aXJxX2hhbmRsZXIoKSBjYWxsYmFjayB1c2VzIGZvcmNlX3VwZGF0ZT1mYWxzZSB0byBhdm9pZCBz
dGF0ZQ0KPiB1cGRhdGVzIG9uIHBvdGVudGlhbCBzcHVyaW91cyBpbnRlcnJ1cHRzIGFuZCByZXRh
aW4gY3VycmVudCBiZWhhdmlvci4NCj4gDQo+IEZpeGVzOiAwNmJjNGNhMTE1Y2RkICgiZXh0Y29u
OiBBZGQgZHJpdmVyIGZvciBUSSBUVVNCMzIwIikNCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFz
dXQgPG1hcmV4QGRlbnguZGU+DQoNClJldmlld2VkLWJ5OiBBbHZpbiDFoGlwcmFnYSA8YWxzaUBi
YW5nLW9sdWZzZW4uZGs+DQoNCnNuaXANCg0KPiBAQCAtNDY2LDcgKzQ3Myw3IEBAIHN0YXRpYyBp
bnQgdHVzYjMyMF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiAgCQlyZXR1cm4g
cmV0Ow0KPiAgDQo+ICAJLyogdXBkYXRlIGluaXRpYWwgc3RhdGUgKi8NCj4gLQl0dXNiMzIwX2ly
cV9oYW5kbGVyKGNsaWVudC0+aXJxLCBwcml2KTsNCj4gKwl0dXNiMzIwX3N0YXRlX3VwZGF0ZV9o
YW5kbGVyKHByaXYsIHRydWUpOw0KDQpJIHdvbmRlciwgaXMgdGhpcyBmdW5jdGlvbiBjYWxsIGV2
ZW4gbmVjZXNzYXJ5Pw0KDQo+ICANCj4gIAkvKiBSZXNldCBjaGlwIHRvIGl0cyBkZWZhdWx0IHN0
YXRlICovDQo+ICAJcmV0ID0gdHVzYjMyMF9yZXNldChwcml2KTsNCj4gQEAgLTQ3Nyw3ICs0ODQs
NyBAQCBzdGF0aWMgaW50IHR1c2IzMjBfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwN
Cj4gIAkJICogU3RhdGUgYW5kIHBvbGFyaXR5IG1pZ2h0IGNoYW5nZSBhZnRlciBhIHJlc2V0LCBz
byB1cGRhdGUNCj4gIAkJICogdGhlbSBhZ2FpbiBhbmQgbWFrZSBzdXJlIHRoZSBpbnRlcnJ1cHQg
c3RhdHVzIGJpdCBpcyBjbGVhcmVkLg0KPiAgCQkgKi8NCj4gLQkJdHVzYjMyMF9pcnFfaGFuZGxl
cihjbGllbnQtPmlycSwgcHJpdik7DQo+ICsJCXR1c2IzMjBfc3RhdGVfdXBkYXRlX2hhbmRsZXIo
cHJpdiwgdHJ1ZSk7DQo+ICANCj4gIAlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKHBy
aXYtPmRldiwgY2xpZW50LT5pcnEsIE5VTEwsDQo+ICAJCQkJCXR1c2IzMjBfaXJxX2hhbmRsZXIs
DQo+IC0tIA0KPiAyLjM1LjENCj4=
