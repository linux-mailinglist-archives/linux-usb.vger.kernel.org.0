Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823A8707812
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 04:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjERC2u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 22:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjERC2t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 22:28:49 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1F32133
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 19:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWZilQ0u74+Sfoq76fFyJe39OwvwBMBxRwyDLVL+wwoFRca8U2fn87C98By0PJ8jwETi41B42jY+pn+u/pG1C6eacgq/qOZc4iw7jyThbeAj2v60vzrSneBZ0vEA77Bsrl/xNm697Xcv63EqckeJskCk7+eRYs2tNztk2AO31zSxzsyuPeXzy93h8CiK62SEdmyHSkC2q3dilYKNt8UH449qRetwLw0ghshy1G92HhKaWhbVGZxyjjGZbbkqEA/LIfCo1oYUHoUTIUzXfRFO9GPp1+jtFzmsDXYSiBUuRezDa0gGkQ5bl4GwnnpQxwB8V24FT0dRZoSQK0f3KMGZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED0mfXL6nhVDjJFWcQw31idrirW5yHf6yfhZUxjrDrk=;
 b=VIWoDE44G1ccUYqOvLTcip9oW+o/7+x17GYIbDUeyUn3yPmmF+WkVnbXUhMRb6hWbqIc+RYRAxfTw4zIQGfiaeyo0EHiTcsx79Akx2l0I3lhVQ4uBGVYz61uKCz48Q2Ppkr1tqER3cQ8PijAcCnnnN/sAgEa1td27zOfEuNakyCRX+ArqbjELdis/6PiS4RrEp2gJKIy5oB4/3acKGZaDpZHbk5fHwixK25bVlxWB6/j+9h2aSS/McwZrvTMn+xPwu+0uA272tFCaT4Uz6ksGPdZKmoYAcZUxYt9Xd607zu1WjwjkvUbt/i72z3jxoINxb+VlknG/J+IS4QkH6pJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED0mfXL6nhVDjJFWcQw31idrirW5yHf6yfhZUxjrDrk=;
 b=WtYul33Mj1k8kVQx7vdjkutiwWkes8vl5klZsjxRYxOZUKRsh2g582Ra3t3/FYvTH9Ewhoomfo5I/fiTOPON/OcT6sEITyFhA5wlr56TTghknEy+g+LNoKavr7J2x+6rVY9/XQUOK9RAS8q8E1n0U1vY4gb+noC44S+L+f1MDfs=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9421.jpnprd01.prod.outlook.com
 (2603:1096:400:1a3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 02:28:44 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%3]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 02:28:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 83/97] usb: xhci-plat: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 83/97] usb: xhci-plat: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRPfiudEitqhvUWKMsDKSPSaL69fTIQA
Date:   Thu, 18 May 2023 02:28:44 +0000
Message-ID: <TYBPR01MB5341DBF2AD2729EA2A40786BD87F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-84-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-84-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB9421:EE_
x-ms-office365-filtering-correlation-id: 6c559926-8052-41c6-9187-08db57479a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: grzK2HcJcKKp5NhcRWTpRzY7AGQJBypIuz21d7AJy1rRkpiEn8RKi6ZnQLEIwDAVj7B/i7kWj/t93l/Wjz5GpFXF9osQVt7CfrfiHOJh+8pgWXbyfA5AS9XMRrNOmky+j2tMLM50uuPknpwixBIIJioCVsEU3cdCI5olwwtymQMhOQQV4NG3yw7T7uunn90LJPds1y0NxbbT1tPolUCc2Lv1hEjMwsIGl+hRbeUWdd7rNkA+qNJHGAzFUlytwILG3pfOgDrB+JnuLDJbitxELfvbyWwkXuu1jABGmfvBWdVNjAIGZH6UpeznBU+jAqmG+Y7sqKNvi0sXgE9I6usdZ5S3LRp1PhWpUi4bcCshkppfEIsZVADpBogYqHbL9nZHUFcu/Xny3QMietIiG3kCrPdQG+suUEoYxzppQo+jZxI/41WOm3GPyEk938uouGpTiFjop9cgjzOGQF8CQwFAW1qlhX5L+zw2Vtaqf0BLJGeAzO/s2YYfj6inN7B0Za3F5mpRIPuwIwBJji/Qnt4GzzGF8Xvc9gRaTf2kojgbvWq+COzo+NSqR0i1QdZoI0Jls4sJMaoFKZUxKI2JVAR1t4mr5gpgKR8mS7HJ/ToGicxfXuRFAZZnQJnAybwly2P2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(8936002)(8676002)(66574015)(5660300002)(52536014)(83380400001)(316002)(9686003)(6506007)(122000001)(186003)(86362001)(38100700002)(38070700005)(41300700001)(76116006)(71200400001)(7696005)(55016003)(33656002)(66556008)(66446008)(66476007)(66946007)(64756008)(4326008)(478600001)(110136005)(2906002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFQzODhDTlJ1ZVVwU1VYN2Q0RHdCQlk0VUZkSHdML2RLNmRvazFoRmNKZUJn?=
 =?utf-8?B?ZDAvYTc4aGtvdnJkOWhJK3lVVTN2cGRnektTMk02enREMmxja0pNUStMZk9G?=
 =?utf-8?B?VjAvV1lFa2hrKy8wbTltL3BkK2EvTkpkQTdVc2hmanpYanEvUmxMZWk5MTdv?=
 =?utf-8?B?THc5K0xoMnBHbjlOUERWdFkxblB3Y1puVWhPQUIvdStES0JRKzFzUEdRSzdz?=
 =?utf-8?B?SVZsUlp6cDZyVWtMOWVGcnVxT2xXS3RNcnJMZW5XRmdwcDJwc2FrNXBKd1M0?=
 =?utf-8?B?YUI4Vk81T1RBdVFtUlhoZGhHQ1czSU1DNWJnL2c2VjdUcjliZ1pNbDhxUmkx?=
 =?utf-8?B?ZllQOXNjejBDS0p0R1ZrVzNaRjBRd24yYiswazZIQ3RYR296ZzVNNy9BT3ND?=
 =?utf-8?B?MTFBMHhHcmxjdkZscnVyS1ZJQys2VzVRdWFqTEtyeFdRSjBiM2RMakhCRUw5?=
 =?utf-8?B?dWFzMzd5OUJKNkVnRnkzOUVEMTRnUmxSS0kzeU5iVXJyaS9jRmwwSWhlMGs5?=
 =?utf-8?B?elBSUytzSjFZdHV3NDBRKzdwVGt3YWRwa3Fka3M4dnc5TW5mZkpuY0xNSFpM?=
 =?utf-8?B?YTNrM2dRNTFLb2FUNlRLdFgybTlSVU8wMFV5T1dPSXI1Y2VEOUtFMXdVd2Jy?=
 =?utf-8?B?TmQ5T2pPSkJCdkNVK0xlNEtaVHVpRFV3ZDhoRUxzWFFYQ0oyWEVIWFRVek9H?=
 =?utf-8?B?WHhYQS9zdllEL0RlV0pNNHhYZVRFL01WK0NZWTJ1UndNQ0pmbnBjNDA1Ukh0?=
 =?utf-8?B?ZUQ4ZzlVcTR3R3pGT1k5MWZNQkJ3bG1SdVdzZGEwczdQUXlWVGgrM2JWWkNQ?=
 =?utf-8?B?NzVNdkwyUmJucHlTVDFaSmkwamNLNDBXQmdRWkdDR3Bmd1JJdEVpVUR4cmFZ?=
 =?utf-8?B?bzcwenFOdnhhUVcxTWEzTzBHNFhnY2lmWXErblROZ2FtRGd1ekt3V1ovZlg4?=
 =?utf-8?B?aUpGM3E3S2RsNlZIZ0NGSk9aZDB0U240aS9zWG1kR1pCTTJZa0NjcTlLb3F0?=
 =?utf-8?B?ZDZHTmNlZnZ5bURFbVNsSjZ0N29jc1ZmU3ZDemR1dk5JU2FESEdybEVBMml4?=
 =?utf-8?B?dlM1ZWdUQ3UzekhNeHlRMTBQYzFuMzRkZGNZSXExUm0xNStRS1RtMHg1b0dl?=
 =?utf-8?B?dnV2VlRhM0V4cEJINkRIS2FwaE95QUZBMjRoUS82bGczVWY0cFN0V0JkZjFZ?=
 =?utf-8?B?ck9IeHNITUxrQU94Y2c5U0d1ZFpvRnhQV1haZEhCM1VSdlEvWTF6N1c2bjR4?=
 =?utf-8?B?RElMRGRvYmlWeGFPV3R4a0V0ajV0TTcxRDBnNnovaU5tNE5zM05Kb1lSYWgw?=
 =?utf-8?B?MDVFdFl0SEpTblNYVmVSY2owRVAralBkY2pKSDRUVHpmTDVkWGtlTG5EM0hv?=
 =?utf-8?B?TkNLbkpaOTBGLy9OUERNbHpncXBQTmR0Qm5yRUFic3VPUnlXU1BsQ1NTL3dU?=
 =?utf-8?B?KytlcXpVWWhFbFBhWlV3SkFMMmFiOVI3enBBZUwrdjBPMEdlOHV6UmM0WEpV?=
 =?utf-8?B?TGN6d2lXVDRrZHVDSzhXMktjOEFVL1ZJZ1JIZWo4U1dYcmxxN1B5K2EzbTkz?=
 =?utf-8?B?OUI4WnZQRmFGK204dk5hcTNtTUZqN2NSRVE4ZmgwaDl5T3ZBWUkwaEpXVWRR?=
 =?utf-8?B?MEwyeXZBMzFyZVhsS3ZXL01WUmxNUlV3dkhKRGxoQkR2ZjZzRXNIcEFaWXdT?=
 =?utf-8?B?QnBoNWZkOGxMNHRhbmppY0NERFViUW1rUVEzdGJ0bWhBdlJualllWncwSm4y?=
 =?utf-8?B?dGJvM3lOZnlhY01tWVpDNzduK001UXVyMWJ6dWRyRExIYmxleERjcWlnS1dN?=
 =?utf-8?B?ZlEraVpac3JYZWVEZWxrdG9oWGxNbStiVzIwMlU5TGRvYUovQU5naEhycXpX?=
 =?utf-8?B?ZnhxM3EyWTRxQXd2RDFQUVltY0VHemhuQjlQZW4xV2lEZnVyK1JJcEpXNk9O?=
 =?utf-8?B?RjhYNnRVMllNNnpLSTVJYzl4WDVBM3EyVVFKa3lNY24wOCtzN0EwVndQdlJ6?=
 =?utf-8?B?alBCUm9lWm41R0NuWHQxMkYzN3JoSlZpUGlUQ0VndE1tQ0ZuTmhQZmxlaVdr?=
 =?utf-8?B?a1FHbjZxZTFVVC81TGNCNXQvK2VxMTlKK01ZQUVUelhCS1NOcWVsSlBjTm4x?=
 =?utf-8?B?NGpkZVZrcWhJS0JOQTBsNFJia1pJS1BCL0RHbkhVakc2MkxwTHVNTzk0MWw0?=
 =?utf-8?B?UkMvY05zeUtJTGo0NkF3R1d6aVkwUUxSclpPUzhKN1hhMVNtVDkvWll4MVVX?=
 =?utf-8?B?bno5M0U5VExXcDFHcXBZaUM4OVJBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c559926-8052-41c6-9187-08db57479a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 02:28:44.4384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4u1ZtlzokLmo7HHhMrg2WQkZPMI3ShxzgbMQU1zI7NP+yLo9YZGnjzeCohV7N/Ir9BoKz7D/XREpqpJjQzOSTqfFNagQSS37lNBMm7WSwt9q3Sfiq3N3kTdAroLY27pP
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
IDE4LCAyMDIzIDg6MDIgQU0NCj4gDQo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxh
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
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+ICBk
cml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jIHwgNiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMN
Cj4gaW5kZXggYjBjOGU4ZWZjNDNiLi41MjNlMzg0M2RiNWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBs
YXQuYw0KPiBAQCAtMzk5LDcgKzM5OSw3IEBAIHN0YXRpYyBpbnQgeGhjaV9nZW5lcmljX3BsYXRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXR1cm4geGhjaV9wbGF0
X3Byb2JlKHBkZXYsIHN5c2RldiwgcHJpdl9tYXRjaCk7DQo+ICB9DQo+IA0KPiAtaW50IHhoY2lf
cGxhdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiArdm9pZCB4aGNpX3Bs
YXRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikNCg0KV2Ugc2hvdWxkIGNoYW5n
ZSB0aGUgcHJvdG90eXBlIGluIHRoZSB4aGNpLXBsYXQuaC4gT3RoZXJ3aXNlDQp0aGUgZm9sbG93
aW5nIGJ1aWxkIGVycm9yIGhhcHBlbnM6DQotLS0NCmRyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0
LmM6Mzk4OjY6IGVycm9yOiBjb25mbGljdGluZyB0eXBlcyBmb3IgJ3hoY2lfcGxhdF9yZW1vdmUn
OyBoYXZlICd2b2lkKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKiknDQogIDM5OCB8IHZvaWQgeGhj
aV9wbGF0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQogICAgICB8ICAgICAg
Xn5+fn5+fn5+fn5+fn5+fg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvdXNiL2hvc3Qv
eGhjaS1wbGF0LmM6MjU6DQpkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5oOjI4OjU6IG5vdGU6
IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mICd4aGNpX3BsYXRfcmVtb3ZlJyB3aXRoIHR5cGUgJ2lu
dChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICopJw0KICAgMjggfCBpbnQgeGhjaV9wbGF0X3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpOw0KICAgICAgfCAgICAgXn5+fn5+fn5+fn5+
fn5+fg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9saW5rYWdlLmg6NywN
CiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgva2VybmVsLmg6MTcsDQogICAg
ICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2Nsay5oOjEzLA0KICAgICAgICAgICAg
ICAgICBmcm9tIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmM6MTE6DQpkcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcGxhdC5jOjQzMDoxOTogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciAneGhj
aV9wbGF0X3JlbW92ZSc7IGhhdmUgJ3ZvaWQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqKScNCi0t
LQ0KDQpTaW5jZSB0aGUgeGhjaS1yY2FyLmMgdXNlcyB4aGNpX3BsYXRfcmVtb3ZlKCksIHdlIHNo
b3VsZCBjaGFuZ2UNCnRoZSB4aGNpLXJjYXIuYyBpbiB0aGlzIHBhdGNoIHRvbywgSSB0aGluay4N
Cg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiAgew0KPiAgCXN0cnVjdCB1
c2JfaGNkCSpoY2QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAgCXN0cnVjdCB4aGNp
X2hjZAkqeGhjaSA9IGhjZF90b194aGNpKGhjZCk7DQo+IEBAIC00MzAsOCArNDMwLDYgQEAgaW50
IHhoY2lfcGxhdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiAgCXBtX3J1
bnRpbWVfZGlzYWJsZSgmZGV2LT5kZXYpOw0KPiAgCXBtX3J1bnRpbWVfcHV0X25vaWRsZSgmZGV2
LT5kZXYpOw0KPiAgCXBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgmZGV2LT5kZXYpOw0KPiAtDQo+
IC0JcmV0dXJuIDA7DQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0dQTCh4aGNpX3BsYXRfcmVtb3Zl
KTsNCj4gDQo+IEBAIC01MzAsNyArNTI4LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCB1
c2JfeGhjaV9hY3BpX21hdGNoKTsNCj4gDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciB1c2JfZ2VuZXJpY194aGNpX2RyaXZlciA9IHsNCj4gIAkucHJvYmUJPSB4aGNpX2dlbmVyaWNf
cGxhdF9wcm9iZSwNCj4gLQkucmVtb3ZlCT0geGhjaV9wbGF0X3JlbW92ZSwNCj4gKwkucmVtb3Zl
X25ldyA9IHhoY2lfcGxhdF9yZW1vdmUsDQo+ICAJLnNodXRkb3duID0gdXNiX2hjZF9wbGF0Zm9y
bV9zaHV0ZG93biwNCj4gIAkuZHJpdmVyCT0gew0KPiAgCQkubmFtZSA9ICJ4aGNpLWhjZCIsDQo+
IC0tDQo+IDIuMzkuMg0KDQo=
