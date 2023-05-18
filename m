Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6137C7079D9
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 07:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjERFvC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 01:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjERFvB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 01:51:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7621721
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 22:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKGkTDWkJtS1H+3SasEAnNjYNwFm79QkLDLJBM7hcPEM/ZjZxV7MFlEIR7MazeLhjEnhQrheq7fsg+jloemA14ixrFP/mAeGWNbXAkis2Dh7bbZybwCbn8sRjk4eCsXO+4dRx+rkTFLqz979Ea4AOx9oVSJgMTA8A8LHIWcOVXSblfJP62Pj1YNSkojv45jK5G8aU2k6n7O9BVT5JpqIp9DXMsHyiV5XQT7BPyZIuwLqbC8y8/GDj8w5pOR6WZleL6hCYq3kKnCf0CEFH267G7lKOK0Df2mgtiCxDQnDbr7sXcAtSOtZk1rd0XvRxlFISjl89JsthdT9Wnj6WQ06QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4SwGAm36ZDmvh2vvh0BjJEU1hTQXn0IaM74kzAVvQQ=;
 b=btT1dsQFl7x9e8XhuVdRwxNXvLYn+ZM5dj/3aQCxvDkpP6ai6uNIyBR0Vy6rvBcqSh70LtFAtLbt9pUqwkmiDqnx0AlJhZTkCqbRnB8uh+3QdeONRzY+SsF8VJ8TwLpYo+RZMY6OEocZtI3pGfYcIsMrA18sPRuFGXyYT86MWt3Ckx/WwSDHbBfVNfnVa1HZeOf29RGpogOQXNKeCrwVxWg8riOKV5nQV7RIWk/sxHVa71+nHKqGmZgJTDiN2QTVC+du5L41XdynDrrc/H/TYspeI4xy1mc/Rtru4Zimo+KYBJ+iWRh0fjmmC56eU+HdHrC0iowTYRG5s6yanQxtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4SwGAm36ZDmvh2vvh0BjJEU1hTQXn0IaM74kzAVvQQ=;
 b=al2H1/82koZj+ATrl2T0PFI8l0IwU0m1WI5ufDFFdqam4xPpNpEJqbXoJqsw03qQTwQSPV/JsB7KlbL6EMr+zjSLZvvQJaSxLepwCDcqcBKkSXO1vHbU8j8eQSNiFFNyqxo69wl4iGZiX56i3JAF6jxDpWnxDlUNR+px4x468So=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9733.jpnprd01.prod.outlook.com (2603:1096:400:20b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 05:50:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 05:50:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 41/97] usb: gadget/rzv2m_usb3drd: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 41/97] usb: gadget/rzv2m_usb3drd: Convert to platform
 remove callback returning void
Thread-Index: AQHZiRO7mrXsQL+lJkS03oE3m1FcwK9fhudw
Date:   Thu, 18 May 2023 05:50:53 +0000
Message-ID: <OS0PR01MB59223C91CBA6891CE757BCF8867F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-42-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-42-u.kleine-koenig@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9733:EE_
x-ms-office365-filtering-correlation-id: eae5ec7f-c808-44d7-2bb4-08db5763d7b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /W0UR3bkMgZ/UXnVkS0kcNY3PqxDOGWmXU5T5nma4Dy3afWrty5dc2L07bJC9GPtR+4TnD+KfYLaixXCGcgFmIjfZRP/bCsEsn/NxVzzlm/DFdggiFm7iN2c+Pg8P38+GfniRkLW1WV5qFwL0Mhc1MAOnfzTC7kruR6Nzu1F2nhWQTgAKudd2o4//HXgRuL5y3NYB+eczgw/JCXZ5qMfhb/aUh6miqrk4c1eBCZbPM91sZmbgD9iZxT66GgjwWz+RiNBtM75Qw/d3Up9Y72GowKOZxh8gDJUoG0/+ZSupbHF4K/JqHN1yGOAn5+z49CqaG8+QwcrVec8zlfrHMdOVTyXjws7XKAZE6aaqgD9+uZaMn7D6jaDZXB3vuNZrqRUBXE0LcAFSPp0COVvcfXu7o/U2NB+xlG0UYD+MtIQjqN92/CNMj6frVUBH8ZurXxwbX8E5cLv8IhfKdcc8OOoEHBaHL0WrcCV5GZFjRpHYH+gw4oRksuA69WJ8NFy+flnzTnEZZdkzWzpwCaGKaAFXukOBUqMvsamUL1Lwk5PPiRg8BMEqHuPm/pFiaOeDodwpNCfQ83fesJ4b3slO+y82C586FNLFrd3C6U41OZIgMUGU83jtZmxi5bLpaqctUxV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(478600001)(4326008)(316002)(2906002)(52536014)(8936002)(64756008)(41300700001)(66476007)(66556008)(66946007)(76116006)(8676002)(54906003)(110136005)(5660300002)(71200400001)(66446008)(7696005)(53546011)(9686003)(6506007)(26005)(186003)(122000001)(55016003)(66574015)(83380400001)(38070700005)(86362001)(38100700002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2Z2VjJNY0t0dE1oRTJtcjUvNzJWRnQxcS9TTDkzVXBJeEhtTVpncWxKcVA2?=
 =?utf-8?B?MmZVV2l2SlhRS0dleVB4WGRzMWk0TlM5VEF3eXVZazRsK1hjbC83QjY1L01B?=
 =?utf-8?B?YUE2RXkwa0ZHYnJGdnUxZjBEUTFGem5pcjJZOTRRMldEbFMyYW1YbGhYQk9p?=
 =?utf-8?B?RlN1U2RNTkFJYXVCbHFxOFhyZVpLK2g1b0xHaURDMXlSUFB3SURCMVhWTENw?=
 =?utf-8?B?RU01YTN5Mnd0alJmVVRybUV4dmxYWkNOS1o4cGE2QlBWcDVlNDNTYzc0Z0hW?=
 =?utf-8?B?VHdUS2g5UmRzNkVQQTBzL0x0WWJUOS91ZSs2ZGM0V3V4dzkvK281WGJ0ODlw?=
 =?utf-8?B?YWpOS1NFeks4SUswVjRQTUpCVEI0Rnh0MmdjSzI4dWhPOFZxcDhaUUdiTmdH?=
 =?utf-8?B?dDUzR293WlBhNTkzcGd4Q09EeWxwWVlyUmpod3JRWkluNm9hSXhkWWVwMUhJ?=
 =?utf-8?B?U3lrZUNKc1FxM3UzamlYVVVJTm9BbTJWUStmWXN1RjVMK1RiczRFMVVJb0RU?=
 =?utf-8?B?Q0RDZTZhKzVxWEh4T0p0b0xGeTNwcU5jSmhXY0lBa2lSdHB4THkvN3pHcmt2?=
 =?utf-8?B?TDh3eXZ0VXRNK01HT0FGdmFjYTluVGo4M2FNMzlZR09kT3RzcndPU1RDd0hM?=
 =?utf-8?B?RnFNODVsVTEvNkorejhtWHBlZWFIRk1TZ0V2QVB5YkhqNTJVVVdYc3VLc2Fr?=
 =?utf-8?B?OTZidVJwc1lUNDlFeVVocjRSWlIxWGRQdUMvREZkSFdrb2MrMjNpSlpoSjJn?=
 =?utf-8?B?RTM2a2VXcklVaFNZemVYY1ZPVWlpRUk5ZlRhM3dDajlNZndlUzFTaVEzRGdx?=
 =?utf-8?B?NzN3ZUlxRytEUGpWeU1xYW5tRlA0bXVSYW5uRjQvRTBRM3pUVkM2L0RVdktz?=
 =?utf-8?B?MHZ6NDVDeTA3YWJuUEhHbDl5eWdtSnBIMjFLL1lGeVpYakZucWpLeCtHQ2Nl?=
 =?utf-8?B?VVJ3Sjd0Z1VDUHN3QmlTSVZEdGlJNXljZzNjS0tqa1dkdmdYTWxzSzVFNTRO?=
 =?utf-8?B?UFpEeXF6SXo3YmpoU1cvUEZSYzRzRm1xZnlsa0lNZDM2YXN6Zk5hdytZcjhv?=
 =?utf-8?B?TlBmdnNTSm5QMDA3YWZxZkl3OW05SDdnejZiZzBmL21QTm5qczN0NmtFekNI?=
 =?utf-8?B?bTIzTGZzUFRvbTFXeGs2Qm1sQjI1NERpR0ptVlJFVkZjN2doS0h3ZWVCRUFp?=
 =?utf-8?B?VVZHSHZrMmVOSjlkcW9ja2xxdE5od3p3SjI0WjFSUFlFa3ZVeldObHg4K0l5?=
 =?utf-8?B?QmxvQVpoUWZPYkVYL0VYeDg2WWI0VWxwdXhoelVwcTNoQmVNMDN4Lzd5Z1Jp?=
 =?utf-8?B?VHVOMjNVL25QYzZ1TFBUdm1oZXZNUjNyTFl0M25ta2t0SVJOaFFSNm1ZbG9W?=
 =?utf-8?B?cTA1VlFiaDUzTStXdWkyMHozTVEzcit3ajRUOEI1VGh1WXFUeExnbnE3ZHJN?=
 =?utf-8?B?em8zeFd4cU5RejNhMzBqK2lFKzNVWEpoZlowTGkwL0RKQ3VhWmlaVWZpYWNJ?=
 =?utf-8?B?NWozWWtJR3FUcVFWSjdHdmJGZXV0MjRQVzBHK3l5OGVOdHhIOGhSRUcyWFVu?=
 =?utf-8?B?UlJhTjZaTnNpYXlFU2s1Um9MVWEzdkl2dUd1NWJadFhkODYxREtycVVrZHJr?=
 =?utf-8?B?d3dIdGFjbDhoZmtPMms1QURHUm9mbFhrMjF0WGFMTzBLMDRwVXBESlFYZVpn?=
 =?utf-8?B?Z0RTUjZvWVhFQ1hBL0VvV3l1QWxEWi9GNVdhVHk5Y3B5MVZKMXVmNFFWNmtL?=
 =?utf-8?B?U29SRlREbXZFcHJMekhCdWFMTUw3UnVteXhWaEdicGZmY2ErSnJwY0traHEz?=
 =?utf-8?B?dTJOS25OQkljYVNURVYvV21TSWdSbmdyeHQzZDJFcExQV2ZFSUMrN09TMG4v?=
 =?utf-8?B?ay9pOUJBNDNLbThsclVqaGxIRGE0QzNsd0RIbTJDSVh0UVM4L3NoOXpzd2Ro?=
 =?utf-8?B?NXJQdUxmVVpYMkk0MWppWlhkSEdzQ1M5d3FQNlZGVjY3V0psbWxKQlg5a2FP?=
 =?utf-8?B?VkNsUzRXbEg5QUR2VEFQZTdHdFFPSFE2L2Y3d1dyMk8zRXJhU0ptaEhQYURz?=
 =?utf-8?B?YVovSzVaQjlwdWNoM0xPYU9TeGZIbmZ6YXFHbVNzYmx6d3BUM1NyajQ1RzJN?=
 =?utf-8?Q?9ML2b+4z+4KiwRl3G8f4djwy0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae5ec7f-c808-44d7-2bb4-08db5763d7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 05:50:53.4610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/TlJ2igylWPNXsltaTVNwOlHlPMRcm4Y7OvlPJajQJVQ+uTXxm+8k3LgJvQMyuNLagMrcJdT//UMkIT1F1a/YXSR4YPRS3ivLQquntB8R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9733
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgVXdlLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE4LCAyMDIzIDEyOjAyIEFNDQo+IFRv
OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgVGhpbmgg
Tmd1eWVuDQo+IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPjsgQ2h1bmZlbmcgWXVuIDxjaHVu
ZmVuZy55dW5AbWVkaWF0ZWsuY29tPjsNCj4gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4LXVzYkB2
Z2VyLmtlcm5lbC5vcmc7IGtlcm5lbEBwZW5ndXRyb25peC5kZQ0KPiBTdWJqZWN0OiBbUEFUQ0gg
NDEvOTddIHVzYjogZ2FkZ2V0L3J6djJtX3VzYjNkcmQ6IENvbnZlcnQgdG8gcGxhdGZvcm0NCj4g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkDQo+IA0KPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcw0KPiBt
YW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJy
b3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZh
bHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0DQo+IGZyb20gZW1pdHRpbmcgYSB3YXJuaW5n
KSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4NCj4gVG8gaW1w
cm92ZSBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybg0KPiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0IGFsbCBkcml2ZXJz
IGFyZSBjb252ZXJ0ZWQgdG8NCj4gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMg
dm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycw0KPiBhcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIGlzIHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0K
PiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQoN
CkNoZWVycywNCkJpanUNCg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvcnp2Mm1f
dXNiM2RyZC5jIHwgNiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3Vk
Yy9yenYybV91c2IzZHJkLmMNCj4gYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3J6djJtX3VzYjNk
cmQuYw0KPiBpbmRleCA1ODljNzI1MmUwMTQuLjM2ZjRmZjAwZDIyZiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yenYybV91c2IzZHJkLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L3VkYy9yenYybV91c2IzZHJkLmMNCj4gQEAgLTU4LDcgKzU4LDcgQEAgdm9pZCBy
enYybV91c2IzZHJkX3Jlc2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbA0KPiBob3N0KSAgfSAg
RVhQT1JUX1NZTUJPTF9HUEwocnp2Mm1fdXNiM2RyZF9yZXNldCk7DQo+IA0KPiAtc3RhdGljIGlu
dCByenYybV91c2IzZHJkX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAr
c3RhdGljIHZvaWQgcnp2Mm1fdXNiM2RyZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIHsNCj4gIAlzdHJ1Y3Qgcnp2Mm1fdXNiM2RyZCAqdXNiMyA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOw0KPiANCj4gQEAgLTY2LDggKzY2LDYgQEAgc3RhdGljIGludCByenYy
bV91c2IzZHJkX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgCXBt
X3J1bnRpbWVfcHV0KHVzYjMtPmRldik7DQo+ICAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5k
ZXYpOw0KPiAgCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHVzYjMtPmRyZF9yc3RjKTsNCj4gLQ0KPiAt
CXJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgcnp2Mm1fdXNiM2RyZF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSBAQCAtMTI5LDcNCj4gKzEyNyw3IEBAIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ6djJtX3VzYjNkcmRfZHJpdmVyID0gew0KPiAgCQku
b2ZfbWF0Y2hfdGFibGUgPSByenYybV91c2IzZHJkX29mX21hdGNoLA0KPiAgCX0sDQo+ICAJLnBy
b2JlID0gcnp2Mm1fdXNiM2RyZF9wcm9iZSwNCj4gLQkucmVtb3ZlID0gcnp2Mm1fdXNiM2RyZF9y
ZW1vdmUsDQo+ICsJLnJlbW92ZV9uZXcgPSByenYybV91c2IzZHJkX3JlbW92ZSwNCj4gIH07DQo+
ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHJ6djJtX3VzYjNkcmRfZHJpdmVyKTsNCj4gDQo+IC0t
DQo+IDIuMzkuMg0KDQo=
