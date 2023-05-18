Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EC5707811
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 04:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjERC2i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 22:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjERC2h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 22:28:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187DF3C01
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 19:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIckATmE7WgUxuqK2yLw7Sa6j086fmpU2hPTVVZqbJYKzdPvkm5hcYRO+4jOvM7sIM5gvp4GWZ/E2EEc5DNdcBkaNAEqRekWjSUD0nkDFYdARm4OhT2J3E2BioGA55TeoS4eXG6UnLRjupbFJ7kFGLJWocEjNMxa0UrGrIOHvsjzP8XccSE9IVPb1KLd+Ol7dYg89yXB62AKP5JNvs/wvRUIkD5YhVhdcC9sfSXY8NEbAnruvGJI1B6sK2TltbjR7jz7moWODJn+5/g5knWqIB7Ed3DqTTmNsrsKZtzL0bdAv+mO0D+/2LZCA66gYkDUtSUV7ipvEz2PjZQAH28i2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNPunBxtVosTSElAzToOAKa+bOyFDQk8AmLjS4/u8ZM=;
 b=bG3wA8ZYkk5oJXf6L9AvfPhO6/TJOL0xgot+ww5GieeYq73CoVTVGIkIKc77NAZlBCq5P50LLWf3vk5Wcnm91CobpXm1JfYrJ/8c70iGHQ0vtLMvOBUYXfnRsdte9Xn4fkFmbc9XMlrTlGWGq6g5Ai9YUFcYrIMvmX7PNMso+AywUwe3KfMj9bHfWF0L4DEJ26qO80dwkC7uaqhagTfbC06W0J8xKf//udB4l5b5UTN3zD08Nl/82Vb8BfeFFf/1cko+UJ7cZMTkPHw++MQ/hA6G/NkXD5pdCnNEGOlAyCwIrzp5/e/VH3k5BtIL3aAek7S3nc88R7N7cMZnbWxMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNPunBxtVosTSElAzToOAKa+bOyFDQk8AmLjS4/u8ZM=;
 b=KwuxwqUYh7z1EkHY2HFTIB/qElZNT5AeBQZ+YopR0XY6AplXP4XXflLXrZfcrK9FxXl5C6bEEQ/xV+X35XoATLv1x1L/TyeDucbkbrZH6jJPshA4T5QfbhlX+DrYTpOz39np6BAdBqPlRk1NuYNDc8LxUt0wa5iQxAseITXvuXU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB8493.jpnprd01.prod.outlook.com
 (2603:1096:400:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 02:28:32 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%3]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 02:28:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Zheng Wang <zyytlz.wz@163.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 39/97] usb: gadget/renesas_usb3: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 39/97] usb: gadget/renesas_usb3: Convert to platform
 remove callback returning void
Thread-Index: AQHZiRPhuQHLWKfeGEOaDFoPmopxma9fTDUw
Date:   Thu, 18 May 2023 02:28:32 +0000
Message-ID: <TYBPR01MB5341C29AB14D9EA9D9634951D87F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-40-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-40-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB8493:EE_
x-ms-office365-filtering-correlation-id: ee3e259c-d280-4475-70fc-08db57479311
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3yR2xrjHkiPbVRLmD//IDEOVuOtA+2+HD4utLed8APsFGBLgAoCriFLBD2XteNDfaK0A5W2Ro3tLBk1v5UYiCcgIsUPURa4DBlez23lbJaPpdSeW2EhDMwhH25sQehx61cBYQDqBttB9dMC6SD2YHPSaKfcEUpV+momUvCTSppnLb2j8SEzEhoLmHvVH+xb/KgJFkhW1I/ye5DpPUvbebUg7sjwBQ23aZQDkydmUpyFRuoNhnI92KSFuLms/aqnHbuqc+W+ekC2DQqKTLf8xrOoqTYrJnpCcL+jyuV5eNp5C39lr/DsS7CcA/pWDoBrpgFTEYXSuajkYPu32sule9ZaOchp9RXAuRUZwfL1Ury6J5902KPazdUVth80CUDbVX1hZrMp/cVWJ+J3uYBKrAM0qu0Fr+Ea1DZGT0Cb2JmY/V05EgTR48QE07aN/NBcZuaqwwM/CN3O22raKYj1TIqmfuh3C+kBh/pcy9LEthiv48NkJiKwprG3TOZpnAv9G3ugl+W47ZnDxuJLT2nqUDprMdtSLgKT7ON+dzm9WLSSxBiylC+7O4Q3w0JhLKIl0fDVsg/06tFZwqmXhpR/KHxYfFjWFkX3TcC1g2eZd48/Yl6oLvr8irUo2fG6L0gsF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(66946007)(66556008)(66476007)(64756008)(76116006)(66446008)(478600001)(4326008)(54906003)(110136005)(316002)(33656002)(38070700005)(86362001)(83380400001)(66574015)(9686003)(186003)(6506007)(5660300002)(8676002)(8936002)(7696005)(52536014)(2906002)(55016003)(71200400001)(41300700001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dENNMndnOTh2VTBVOE9LK000YUJRRm5mRDMvaHI3ejIyQ3hYbzZadlNCc3Fv?=
 =?utf-8?B?ZUFTM1hJTUNDVnVhbVZWY0s3TnBoTFo1Q1NuU2Q3VWZpR0JPRjFQTGxDMHZj?=
 =?utf-8?B?VDN4Zmx4K3BTZVdLRHhrcVROeVR6VUtqZXBqbHdpL3N0SkN5Y2habnFSL2Nw?=
 =?utf-8?B?ZC9WVDR4NmJwTFBtN0lLdnNYSkJOK2xXT0JoNHkxUVZvRmJqdVRkdmU5YkFJ?=
 =?utf-8?B?ell5NDBQVFV1U09QSW8wb1ZmeFR4Z0NiR2Urc2dKVUpRY29ycXExQVVqVzhP?=
 =?utf-8?B?SWFhZEo1bnZoR3B5MGlYaCs4eVJpU2syaVhQWVBjZll6c2ZyVHNRWmdiQWk5?=
 =?utf-8?B?MGl0UWhtR2ZZTVZydm1KSlg2YW1vdHllUXF4MUpvaWJ6bGZ6dFRNUmg0UVVh?=
 =?utf-8?B?OWRLVmU0ZXY5amJqRzROd3J0QTlzZTRWai9mSkNrM1lTRHZwT250Ui9xS3Q1?=
 =?utf-8?B?T2ZQL2w2S2djTVdyY1pVazJpazY1MjBnY2ZtLzA2TWxZMm5oUDhTZVVXc2lV?=
 =?utf-8?B?a1pIUHpLeWltZ2h2OW5UTTUyb3EyTDYydHhuTFg0cmsvcm9oald4UkNOYzVj?=
 =?utf-8?B?blFHY0dPOC9CU0szdk5vazBqUXZRSjRNcHlOM0gxZ2c1S3RQeWJMY0ZXODVs?=
 =?utf-8?B?ME5mMEI5cCtqUFZSUys1Wk1jN1BvZy9rb2U5bW9VWnRjZDM0VmRNZ053SUUx?=
 =?utf-8?B?YVlLNXB0T1oyWjZ5bTIrUjZNdWFLU2sxbGkxVTd1K0F6cmVZZzhmb3Y1NDB4?=
 =?utf-8?B?cTFoWkwvRFU1Z3BSTkpoQWdHTkhEa0ZmYXRIeVVsVjZpV1k2M0FrNCtQL1RC?=
 =?utf-8?B?cVIwMG9SSnc3VFQvSmRtSlQ1M3UvdlR5VmhFS2NQdE54RFJRWUt2elIrRXdU?=
 =?utf-8?B?NDBydWo1RUtkWWFQUE9DNFA5VjEycmpCOW5NQmt2eHBMSlVYZW1vV3FZNlpH?=
 =?utf-8?B?TTFlV2FIYjJrNjdvRzZ1RXp2UkhWZ2ovdm5Vb1IxdytKTjhJbTRKRElrS1Ra?=
 =?utf-8?B?U3Z4bDVBZ3lkRDhlYWpDMDZyNEJVS1JHaHQ5M09KZkxaQjNTQnljVmc1M3pa?=
 =?utf-8?B?ZUUrU051WklBU3pXbTltOU5ieFVxdSttUDFpWDNJUVFaVExVemJCYWE5WWxH?=
 =?utf-8?B?Z1hvUHNkZHNndnFtT2NZSmo2U0VtTTM4WW5JeVlDOFhKdVZWUnE0QlpNQ3No?=
 =?utf-8?B?TjVxS2x0YXVvZXo2VWV3aERJaVdYODVJSTBmVW5zc3VnTWQ3cGVzVUY4Y1pz?=
 =?utf-8?B?UzRwZjJZV3V5TzV3TWdqc05DRHV0T21sc1F6T0NOcnZtU2dqT01xMUlBY1Z2?=
 =?utf-8?B?YWVFM1JCREE1WXQxN1JYZmtIQjVSUW03dEdhelBaYlkzckJZaFQxZjVaNE5y?=
 =?utf-8?B?bDhUZ240SzROVmx1L2J5ZW1MZVN2TzNCK2ltZGE3K3gxNW54V3Y5aTI3U0tr?=
 =?utf-8?B?SUp5UlNnMm9EVVhGaUlzb1hBVXp2TDdTTkovbkU1WDZsd09jRUlLdmNyZTFl?=
 =?utf-8?B?R2tjQWdJNkNCUjIxQlVXVVBuUzZGckhobG1Nekw5TytwWEUvMnpCU0tlaHcv?=
 =?utf-8?B?a0FOd1FxUEZGaENCYmRjWEozbi95NGo3dmlIZ1BGeFVPRTNBWUxsK3BhOEgv?=
 =?utf-8?B?eklQMWVPUXJselFId1VzUU1PU0JySWxrb2V1bllhOG8wZXRLRFB3RnJpcFhS?=
 =?utf-8?B?SzhwajFoZW5hbkRpMDJEL1g0a0ZuUlR0MVMxQ1JzVWsvbDJwVDhZOG41bmNW?=
 =?utf-8?B?bjRESHl6NnRwNVVpMnl3aFVXMlljTFpKMUNWQ0Z4eitybXpzWG9Yd2lNWDNo?=
 =?utf-8?B?S1VHUjZEUTlWSEZhY0piaytyYWdBSmRUcU8wWU56cHRQdlhGZVdkZXBqVlB1?=
 =?utf-8?B?Rm5tT0JDazBRQjFPVVltVHRLY1IvUG9mQjVKcVpQMmtnd2RXVVkzd3A1UHRy?=
 =?utf-8?B?YmhQZzdXTUtEa3ptRTdjRGsvb1puSEJONzRVNE8rYVM4WDErdHk2MnZXTEZX?=
 =?utf-8?B?TTdFMUlYWnR5REVUU0ZYTTZSc0VEWGFORUF0NkZuankvRUJtL2IzU1pyRUxP?=
 =?utf-8?B?OEdxb2U5aDgxWkNta2pidDAwZkJSeDJhNU50dnhDR0N1aktNanl6Q2hHTUJ6?=
 =?utf-8?B?RlM2MmQ4bllmZEVwekx0cVlieFJKUU0vUHFiVU4vMm4xOXpDT0FQRUUxeE5m?=
 =?utf-8?B?Y0djakFCSms3dWt5eERJcVRMVmZRdy9iRHdCd0E5Q2dmZFhORG5SVCtFU0R1?=
 =?utf-8?B?MytvQjYwOVRyK0d4T2Jiay9BR0xBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3e259c-d280-4475-70fc-08db57479311
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 02:28:32.4357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j6+lCpaSLNyGI6SiP2bScnqoYdJcEWee0/W2EzbVLat0KuKHdCyxmUmP6x0m9Cjt2ngA8ehqhZWdiwPRnt02phhWtR9XBtLQDb5jzdhalS7c9Pwh7oyoIMolFYiausEi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8493
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
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2ghDQoNClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3JlbmVzYXNfdXNiMy5j
IHwgNiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2Fz
X3VzYjMuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmMNCj4gaW5kZXgg
YWFjOGJjMTg1YWZhLi43NDQzYjYwZGE1ZDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2dh
ZGdldC91ZGMvcmVuZXNhc191c2IzLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9y
ZW5lc2FzX3VzYjMuYw0KPiBAQCAtMjY1Myw3ICsyNjUzLDcgQEAgc3RhdGljIHZvaWQgcmVuZXNh
c191c2IzX2RlYnVnZnNfaW5pdChzdHJ1Y3QgcmVuZXNhc191c2IzICp1c2IzLA0KPiAgfQ0KPiAN
Cj4gIC8qLS0tLS0tLSBwbGF0Zm9ybV9kcml2ZXIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8NCj4gLXN0YXRpYyBpbnQgcmVuZXNhc191c2IzX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGljIHZvaWQgcmVuZXNhc191
c2IzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVj
dCByZW5lc2FzX3VzYjMgKnVzYjMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gDQo+
IEBAIC0yNjY5LDggKzI2NjksNiBAQCBzdGF0aWMgaW50IHJlbmVzYXNfdXNiM19yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gDQo+ICAJX19yZW5lc2FzX3VzYjNfZXBfZnJl
ZV9yZXF1ZXN0KHVzYjMtPmVwMF9yZXEpOw0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+
ZGV2KTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgcmVuZXNh
c191c2IzX2luaXRfZXAoc3RydWN0IHJlbmVzYXNfdXNiMyAqdXNiMywgc3RydWN0IGRldmljZSAq
ZGV2LA0KPiBAQCAtMzAxNSw3ICszMDEzLDcgQEAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHJl
bmVzYXNfdXNiM19wbV9vcHMsIHJlbmVzYXNfdXNiM19zdXNwZW5kLA0KPiANCj4gIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJlbmVzYXNfdXNiM19kcml2ZXIgPSB7DQo+ICAJLnByb2Jl
CQk9IHJlbmVzYXNfdXNiM19wcm9iZSwNCj4gLQkucmVtb3ZlCQk9IHJlbmVzYXNfdXNiM19yZW1v
dmUsDQo+ICsJLnJlbW92ZV9uZXcJPSByZW5lc2FzX3VzYjNfcmVtb3ZlLA0KPiAgCS5kcml2ZXIJ
CT0gew0KPiAgCQkubmFtZSA9CXVkY19uYW1lLA0KPiAgCQkucG0JCT0gJnJlbmVzYXNfdXNiM19w
bV9vcHMsDQo+IC0tDQo+IDIuMzkuMg0KDQo=
