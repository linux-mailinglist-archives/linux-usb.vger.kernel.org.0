Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38AEE59E3E6
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 14:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243433AbiHWMlP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 08:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348476AbiHWMkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 08:40:51 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140137.outbound.protection.outlook.com [40.107.14.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EF69DFA2
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 02:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtJBivsYlqTPDUv/5wrd159dUMa0H8tup5GcteD4kMhhzFQVpnHtH0Yo6wJF+6ESHd/80uU6v2+R2KG72mQOfJub52NpdPPOsyAK7pJNhClGVDlWTnEU0udGcOvaGCGju4asmpHHJziXdIa3Ri6GVy5GyKhNgDoaY5RRsx+vCzdim9Rw24FLgR1q0QNyigUQWYEjS3IBkzooGPTCVHrzWXH9HhgB3ShB5FyQ+NnUPOz0PUVgnuK4+6+bwrPSdTWzz7iQjLoqupTLmtOrD44ei+wqy6OeO5NKqlTyzrKkn3ydAzONzcGHUT1qdA6tBqm1u6KV0FbtFE3N1qE2oOCKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2sR8c6S1qH4x+vpKEK3DOcC4y1I/En65AkRI7HZCIY=;
 b=SatEskobayganX3wba/0Fpg1o8KZdRTTl8Xa++3mb91G4rhdlor6A8zJVsZ7H8gbofjgMZSK7OAFGJZeeLLkPXOH7D0csR2BV1unbekvnIAw6FKUqhh8mbHHOA7v414HHuSwCdlKynI+RRKuxHrlLG3fuOiW32qIKqmPa27L7Vfea3Pc+zW3WWo4aOFKFy+YdLnUMh6kSvCmQ/IZEstDomdrxsc9doKRMmuS1T1WQ4qyBQQ5RNTPrWK66q8JC0ET6VZr5dLW6PmIF51xc6XwwtNS5l/Df7PspSG5441iFgclUTRC4AAE0qJpjbWG830BnnYko3/sX+Vc1pwz54HJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2sR8c6S1qH4x+vpKEK3DOcC4y1I/En65AkRI7HZCIY=;
 b=WuvyqAFf89jmfD5cCxmyB4NQNIIFksNSa3t/mROq0wVoprMp4rnIlGgGroXCXQSdtR+NWmHRYWQg9D8mDBv3wH7MnNdqvzTiYL4CKegTQmIZsj+rA5gqT3GCQ1nyedozif/C6fEevwoU34JJYw7RNbDKFCgBpKL4uXLLXyVjfsk=
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com (2603:10a6:803:75::30)
 by VE1PR03MB5920.eurprd03.prod.outlook.com (2603:10a6:803:116::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 09:49:35 +0000
Received: from VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::3965:8efc:7af6:756e]) by VI1PR03MB3950.eurprd03.prod.outlook.com
 ([fe80::3965:8efc:7af6:756e%7]) with mapi id 15.20.5482.016; Tue, 23 Aug 2022
 09:49:35 +0000
From:   =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To:     Marek Vasut <marex@denx.de>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Thread-Topic: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Thread-Index: AQHYttWmyehv8/f4MUWjXc+kyDNMBA==
Date:   Tue, 23 Aug 2022 09:49:35 +0000
Message-ID: <20220823094934.so377vfpe4vipxuw@bang-olufsen.dk>
References: <20220730180500.152004-1-marex@denx.de>
 <20220730180500.152004-2-marex@denx.de>
In-Reply-To: <20220730180500.152004-2-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d8dc3c0-e52f-415b-442e-08da84ecc993
x-ms-traffictypediagnostic: VE1PR03MB5920:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y9eLdDqP+UZ1bG7F4u+Cx/wKq8P94MgVJK7h7qG3B7nOwfIW4SR3bxpdiMLomBFOBOKQfVnKTfPURXkN5DvUujMKz7M+VLxD42Ao34tOzn3njE64uvw5UlFG91p7TMcMvnpAwYcysRTV3pBVeuAeHGmo4AQBr9ZPg9x7DV19GgjGSfu3ZL8Ov7VrUW1XpkGz9228xg8wirJOjmIvSTOh+F+iBb7Wj4O7HGhcspEqjPXtmfXYnkCsSX+NSWTqcBrOgp22A8ZBibWxR0EuYk4R6dUu4QssOP0CJA9fa8ljiIhoBWaH35GlXZ5d1kbQqtD91btTJVjaD0e7yyGQG7isCPuSfNargDMDh7v9F506mpga2UICnvTHym1CY+zOd4YcAw4gd2YDfFzHVfKULP/WQMdViOZJtnHU48N7XyCWaVqW0dzgDa3RiY20GIW6zVKs3DAip/NGiJpZ+wcJSq3Ec70EgyZRG4MmDT77QfHMyb91gAdm16KmfGeQKVp3xmzmxYxebL7++FWuWggf9O0bVJIhyXitm3GZV6esPsgCMyZnRMyEItd4xC5aBTHr1fMtQ1RSm3CLh47IGBNzGNPhE8M6tRAXrDHr/2LO5RCgvYpUEadt1D2KmKFtJdM7yMtIMyv4APTbQfYUav1BqozQaz9fYksBDpt8pRpLdL+bCF7/CaW7uBlqlOKvLTnGVMQajKE+qreq+fIPPOs7AbZGLjJ2304Cco/BBHwbM/2SRJa8SEfULxGtM/mSB5VwB69umaV6NLpppB+MAf0QhdPAG5Ooq1bvVXEeWLRfZkrFEsw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3950.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39850400004)(346002)(2616005)(4326008)(86362001)(66476007)(66556008)(66946007)(64756008)(76116006)(66446008)(8676002)(122000001)(6916009)(54906003)(91956017)(85182001)(85202003)(38070700005)(8976002)(36756003)(1076003)(38100700002)(26005)(8936002)(6512007)(41300700001)(186003)(6486002)(478600001)(966005)(71200400001)(6506007)(316002)(83380400001)(2906002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVk0TXpoaXJrcUhzazIrblMvTVBRU3RaMEtuUGRTbVVRNWdBeHNwN1VuSUVG?=
 =?utf-8?B?UXRlcXk0YmpPeEI5c1h4Rm05SHNPNFpSaU9JQnBXRFFDQkxud1dGbmJ5VENY?=
 =?utf-8?B?bFJSRnJwVFJNaHd2TlpWWU1iWDE1SWMxYjQ1Ym5KeWpaUDZFNkdmdWtucWla?=
 =?utf-8?B?Yk0vcU1xb2tNaE1sQVhNSXphazAzRFk0akUvY0xXN1dsbVhGSWN1Q0JkejRi?=
 =?utf-8?B?Zi9HUUZnalFlR2l2UGYzblVTMTZ6ejA0Q1lnakhFQzZ6elZKd3BYVHUydFps?=
 =?utf-8?B?TWZDV3RRa2NGK0c2Y3hTQjNoZmppNmdlbDk2dllRbG1HZit1NWhmdmpvNC9C?=
 =?utf-8?B?Q0x1bGNnNWFmYzBmQW05S3RzYlJZdnNUWmowUURFQU1qdHROY3VJUFFhRjVR?=
 =?utf-8?B?MVUvajFsY3VMYllvR05PS1JYeXJZT3QrRVliSTdmYnZNU2YveUZlWitET0Rm?=
 =?utf-8?B?UW5Ta0pVMy94aDQ1OHJUVG1pbXhqWUxVK3orMGdoeUsxWjQrT2RiZUozRGh6?=
 =?utf-8?B?Y3N6QlRiVFBURmFSTE05V3l5WTg0UGNaV09hSWFoVHR2V2o5ZnJzcTVCUEh1?=
 =?utf-8?B?Y3JsMEJjMDlWWVZZd25RMlZGMGdLUWpOQzZpRjFiNDZoeDlZWkNuVWZvc1Ey?=
 =?utf-8?B?MWtJeUVRcDhVbTF3bFVnTzU0VmxQbkVFVW9OSUJ4T0d4dTRCZDhzSGRoZjZx?=
 =?utf-8?B?WW9BYVJWaTZlbU1pbHdVcC9ndDgvT2dFZGJYRXpwcTJyY1BBcFVYR3lHTWlK?=
 =?utf-8?B?dmsyTGo1QWpHNjF2QTFGeGhYRjZXdjA0bVI1eHlqb1V3VkJIK29yaFBpYU9U?=
 =?utf-8?B?WlJ1N3UvSGdTRmxtMVdJWHhjNllIVW9QWjhpV1BMdXkxbFdJRi9vRnU4VllU?=
 =?utf-8?B?VUFHVng0UHd5Y0FGSUtTZFkyVnRWZTJLaGxNVFo1UE5iem5ZeEhXL05kLzk0?=
 =?utf-8?B?eEpmd3Qwb3Y5azVOeHFQblFvUldMelRuT2dmdSt0ei9ZaTRybWR2aXlhN3F4?=
 =?utf-8?B?K2FvYmJaV3diV3I2aU15WW5iQUY4SDZzeXRqYXRIbFZFdjJSVytLdU9QcmFG?=
 =?utf-8?B?bXpjWDhjL2x6OWtYNkJVdm1KclZiV0JHSmFUMytwUi9ZYzB3aVpSN0NIL3d2?=
 =?utf-8?B?N3dQWlI1NGxibFhXc21yaDBrWWFHeGUySEpVb2E3WnFUUE5OTzVhNzB0YU93?=
 =?utf-8?B?WDVYOFkrZktzQ3ZXeUFUYS9UWGtUdGgvb0FBUHR0TWQvYzVYWExtZWRnWWpN?=
 =?utf-8?B?bkdwTEhqZXpLVW9IekpzZVJNV3FIcnkzZkVYaURWR2s1M3VKSzNxMWd6NU40?=
 =?utf-8?B?RzJVME5xOGdiVjZUV0x3djR6R0FqVDlpTDRDSkZmWE9QUE1wSm5zOHlBZXo5?=
 =?utf-8?B?SmMzd3hQcm5JUUF6VnZONTNSMnFyVG1waDJrSElRRVRBUWhVeHFKV0JmRjgv?=
 =?utf-8?B?Qi9QRE9rRjVtRFZCOGpCU0Jmb3o1dWV4R3hqZjl4Tkl1RS81bzUrZUpNMStY?=
 =?utf-8?B?RWt6M2UvWGhmYXVWYkMvc09rcFh6ZFRuNGRVd2VRemFRZkJ0cnZtV1ZNYXF1?=
 =?utf-8?B?SlZCQVpCdlhKdlpJQVAwRHpwbkhSTDVEdnZjUllxeVhTNVFCalpYVHh4OGEr?=
 =?utf-8?B?eTVON2ErYWt0eDRSeWFtakJWZ09Va3loWXJ6bFJlWXhLcUo0QmgxQnpodFlC?=
 =?utf-8?B?QUU0dTlka2FpOEZzN3EyZGdhVmNrT2l1SWFGSVoxSktaMW9adWV2L09sZGcz?=
 =?utf-8?B?bnlvb0lQVlA0ZUNHc3NiU0RyUmJJTDRnYU55aENuR0c2eXRSMlZycE4xc1BU?=
 =?utf-8?B?NS9oY3ZnY1V4eklPZ1ArU3Z6cUsyeFhYZTFybmdFUXNFY2s4VGJDVTB4OG5N?=
 =?utf-8?B?VXJXMnlLOU5DVDhCM2NmSUV6M1owY2IvLy9MRmhBNXJHajJCUlZ2Q2ZXSkdl?=
 =?utf-8?B?MHo5ZHJMYnMxUFdlbHZqOWx5RlNvUnlJaTZFclN2bXE0NG1sY3Bjb3d1aFJS?=
 =?utf-8?B?TGpXS2h3NFdhNjBMb1NqeEZSQVNHWXJBbVJ2SG5LZnY3cmtIdU1yT3dIYkpT?=
 =?utf-8?B?WmhnNDViOGpiL2RkditLVTRZeUNCRnZXZU1uaUpibHpKZG9xRVFHcnRQVEsy?=
 =?utf-8?B?N2xZZ0JNaE5RTUVCRlIwaWlNNkNZUXhKQzFjd1NXWDgwT0tzdTE5SUtEK1ZW?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0E13C7DF6DB4A4A9E340D748BEC0A48@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3950.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8dc3c0-e52f-415b-442e-08da84ecc993
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 09:49:35.4897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/FF8Kd4KEbpwZ7q0Fc/uTWwZrpzUozJKwHscvi2ghYHSIIJsCm1+KxBk5yc/XGZpP4tDCxgS0ecyb3yXOOC/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5920
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFyZWssDQoNCk9uIFNhdCwgSnVsIDMwLCAyMDIyIGF0IDA4OjA1OjAwUE0gKzAyMDAsIE1h
cmVrIFZhc3V0IHdyb3RlOg0KPiBUaGUgVEkgVFVTQjMyMCBzZWVtcyBsaWtlIGEgYmV0dGVyIGZp
dCBmb3IgVVNCIFRZUEUtQyBzdWJzeXN0ZW0sDQo+IHdoaWNoIGNhbiBleHBvc2UgZGV0YWlscyBj
b2xsZWN0ZWQgYnkgdGhlIFRVU0IzMjAgaW4gYSBmYXIgbW9yZQ0KPiBwcmVjaXNlIHdheSB0aGFu
IGV4dGNvbi4gU2luY2UgdGhlcmUgYXJlIGV4aXN0aW5nIHVzZXJzIGluIHRoZQ0KPiBrZXJuZWwg
YW5kIGluIERUIHdoaWNoIGRlcGVuZCBvbiB0aGUgZXh0Y29uIGludGVyZmFjZSwga2VlcCBpdA0K
PiBmb3Igbm93Lg0KPiANCj4gQWRkIFRZUEUtQyBpbnRlcmZhY2UgYW5kIGV4cG9zZSB0aGUgc3Vw
cG9ydGVkIHN1cHBseSBjdXJyZW50LA0KPiBkaXJlY3Rpb24gYW5kIGNvbm5lY3RvciBwb2xhcml0
eSB2aWEgdGhlIFRZUEUtQyBpbnRlcmZhY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBW
YXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gLS0tDQo+IENjOiBDaGFud29vIENob2kgPGN3MDAuY2hv
aUBzYW1zdW5nLmNvbT4NCj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+DQo+IENjOiBIZWlra2kgS3JvZ2VydXMgPGhlaWtraS5rcm9nZXJ1c0BsaW51
eC5pbnRlbC5jb20+DQo+IENjOiBZYXNzaW5lIE91ZGphbmEgPHkub3VkamFuYUBwcm90b25tYWls
LmNvbT4NCj4gVG86IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj4gLS0tDQo+ICBkcml2ZXJz
L2V4dGNvbi9LY29uZmlnICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIGRyaXZlcnMvZXh0Y29u
L2V4dGNvbi11c2JjLXR1c2IzMjAuYyB8IDE1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0K
SGFwcHkgdG8gc2VlIEknbSBub3QgdGhlIG9ubHkgb25lIHRoYXQgb2JzZXJ2ZWQgdGhpcy4gSSB3
b25kZXIgaWYgeW91DQpzYXcgYWxzbyBteSBwcmV2aW91cyBzdGFiIGF0IHRoaXM6DQoNCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIyMDMwMTEzMjAxMC4xMTUyNTgtMS1hbHZp
bkBwcXJzLmRrLw0KDQpJIGhhZCBzb21lIGlzc3VlcyB3aXRoIHRoZSBkdC1iaW5kaW5ncyB3aGlj
aCBJIGNvdWxkIG5vdCByZWNvbmNpbGUsIGJ1dA0KdGhlIGJhc2ljIHByb2JsZW0gd2FzIGhvdyB0
byBkZXNjcmliZSBhIHR5cGVjIGFjY2Vzc29yeSBtb2RlIG11eA0KY29ubmVjdGVkIHRvIHRoZSBU
VVNCMzIwLiBQZXJoYXBzIHlvdSBoYXZlIGEgYmV0dGVyIGludHVpdGlvbiBmb3IgaG93DQp0aGlz
IHNob3VsZCBsb29rPw0KDQpPbmUgdGhpbmcgdGhhdCBpcyBtaXNzaW5nIGZyb20geW91ciBpbXBs
ZW1lbnRhdGlvbiB0aGF0IHdlIGFyZSB1c2luZyBvbg0Kb3VyIGVuZCBpcyB0aGUgVVNCIHJvbGUg
c3dpdGNoLiBJIHNldCB0aGlzIGZyb20gdGhlIHR5cGVjIGRyaXZlciB2aWENCnVzYl9yb2xlX3N3
aXRjaF9zZXRfcm9sZSgpLg0KDQpLaW5kIHJlZ2FyZHMsDQpBbHZpbg==
