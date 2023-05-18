Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C321F707C53
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 10:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjERIsi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 04:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjERIsg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 04:48:36 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E02172D
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 01:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lry32qccyZKpywdycYtdnqbRj+V4Np1t5+T7BGZj9Qykn5p9J4obekV8bmLqGvs/1P68ExkSDYseBnjT7Pv7+dto4OLAnlaE/xAID92Ugs9WMZGqUVC6u0jvzkuBrmWWEgaaKJNrO9VE0Swmazd/IR43AyrWlvDgHy0xFyaN+xy+Gk8yRaL3kTZkj2JFRSMULX4N5ATpMmlOSXwz4dG69P1O9otWQ5/vO+mFQuR3WOFaMrSJEwauAyK/TuuzrMDvV1vNVxYUt6mNgkLCl9qHtIR5tXDeENYRCJshce6eUjdXY2Su/KJSyWmC2aiAcvxNbaE44fwMZp73fjruLrJp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZwkghL/mmeJhgh/UV78rgg7+VDyf95zOMii/gr/Bew=;
 b=d/JkK+eMoDxCSw+B/siqi3Ay173VTb37G1alOK3rLTTM4hGEZWFNfpAG30e/lLl+urbBH7Ce+RXzE3ujx5QrrOYq9AqyyPOOVS6pki/1gzenrxriH2dFo6tPV+8f0WcZsMHEKzLH+7QUxWuwsqOpnSx37Cw+MV4tWYrrqUKl3l8hgfO2PovtaAvNZux56V2jnsUrF4KuuCwwJHltJzSI3kh0cWM8cPq9Chf455+fqVhmS/Fw3oRK23bxDUaxo3UYUPwf2GMNdZCIePaP+3RS3YLa1p5MRbvdwHOo3+nv+t3ooWmBDlB3jmfMaDOLi8dyelpOMDVjC+i565VUeZlZmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZwkghL/mmeJhgh/UV78rgg7+VDyf95zOMii/gr/Bew=;
 b=UMx+ifY5hshMTePzSdWwaQowrbCkocuod1aGnCBdZjFhw5gsn1u5pXsDMzhkYQhETaFDgI25mvqI1T0rHf41WhcWwVvsa/ObqOFk/bp8y+/ZrN9Xa0zMaioxD76/GpNL4vb4PDp37A03KklL4e1ZsBSs3gU2u+toaqjTPeXHst8=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB11208.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 08:48:32 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%3]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 08:48:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Kalle Valo <kvalo@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 32/97] usb: gadget/m66592-udc: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 32/97] usb: gadget/m66592-udc: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRPM1R9wkhKaf0OYofh5DWv2g69fV49w
Date:   Thu, 18 May 2023 08:48:31 +0000
Message-ID: <TYBPR01MB5341BC814059715F2AAF971FD87F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-33-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-33-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB11208:EE_
x-ms-office365-filtering-correlation-id: 15a2ece8-8e50-48f6-eeb8-08db577ca8ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gh84HSlXBGWR8IT08b9PAIGhcNlZTL327kDGg8DSHbHuiAmGt2UFiWXnivZqmv9QtNwZiflSEex54H4ljD+yFkC7n/yo0CeDrT1cgg850k+V0grgQj7Q9bH7xs0NEA+bX9CN0KNIuHypT3ujXMOZpYCVI6xUW9R2vGHbvwPvXcOhP6zba3Phu9MPDjyUSdiz4bf7JogOfPSvvh1N2INyRD+5i6GSXP+Ay4o6K5kpGi6GNF39YZNOQ6kQBB6ZcdmQHQGVQSRTGKv7fFofKgAKFnfgBsGvrcXXr+1NXb+8GkaObtEK8YxoYevFfNICz1lA8JcQE/wXj/Ut/qpW8xLUPlrpNXGRyngtz8pYeO86X31iXGWMSSkDbUjinocoPKWiclUjxyCxzoC/LWU6iw+d+GjVidBBdVDJbHauIYN9O6d5YBaFbG528L7AmOZ/Wo9k1ggAHXFrFZ1w5xZLlGknSDOLxWAESf5R9mFuiFDsfttdr+Mvvi8cPtwQ5D6ve6IqzQjxxNA08pb34prCPWcYna+bZMrzw7M1A4/OSAFALuZ+aWHEtCHRRZJhPdBniX0vWG0At6pIKxW/HQQgMhf3ZqRsvvnWJpKJXWwFID1fhnEkRCVbbCwFzkXXk+06L1ah
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(38100700002)(38070700005)(54906003)(66574015)(66556008)(83380400001)(66476007)(66446008)(7696005)(316002)(66946007)(64756008)(478600001)(110136005)(76116006)(4326008)(6506007)(41300700001)(9686003)(2906002)(5660300002)(71200400001)(8676002)(52536014)(186003)(8936002)(122000001)(55016003)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2RJbEErQW14ME9oZk1mTU1vdVlXdzByMW83djYyRkNJOTVIK1IrUHRhOWdl?=
 =?utf-8?B?L2xKeEo4c1NtdC9EODRlV1JqMHF3b2RIQko2Q0w1aVRuT0hCd0V5UmQzTVBG?=
 =?utf-8?B?Vmx3OGZCSTZKQ2ZyblAzeExsN0lzL1EyQTU5V04zVzYrc0lncVJBZ21ZUkhJ?=
 =?utf-8?B?ZUQ3czIrWm1Jd0Fqd3dTQWRCdXRtNEJENFdHTmxFZ2lUY29rdzEwdjlkd2Jp?=
 =?utf-8?B?dGJtdkJvbmF3ZDhHOURsdWJxelpPSDdNejRXdTl5cFRoem5ZdlZ4RmN5WkV3?=
 =?utf-8?B?QjNuQXlDRHFlOWJCZmlORjNJeitpOW01UXZJZHZnVEhab2czanE1Mmp0UEVj?=
 =?utf-8?B?MS85ZWQzWlRWSGxOQ3ZnNzFEekgzZXV0RC9lMnFrTHU4b3Yyc0pBRjE1TDRS?=
 =?utf-8?B?d0lVdzdUNVRTdldNOWIzaHZEWmZMR0RLeWFxWTYwcms0U3JpZ2lodzYyVk1P?=
 =?utf-8?B?SWR5azVtMG9oU3gxVzNIMW0yVkc4RjRiRjI5NFpDOUwxYjFMbkVWMlhZNTJu?=
 =?utf-8?B?VXRpZitHRjFQaEs0Q21pcHF3MHI5RzlOeERlNVhGNURWL2srMWM3cExqdi9T?=
 =?utf-8?B?OEZzNjlOOWUyeC8yVDIrcHdIUGl0QWxnVHY0Z0ROd1A0THU3WE9JSEpwMk0r?=
 =?utf-8?B?WmdEeHFOTVY5NzI0N3dJUFRBYUJjMkZoV0xkNW9obXNta0Q3Rm8ydkoyQUlT?=
 =?utf-8?B?Q0VBa1gweTZEYzlxRHFFdzJGTERCMWNIWUVrODNYcHFnRk04NTk5TkpJYzdm?=
 =?utf-8?B?R0tsU1RDNDFCTFZVV0xSQURhaWJ5SHNlRmRUUkxVMGd3ODdwUFFYN1ZnMmxM?=
 =?utf-8?B?T3dCUlVORGJaR2VJOFE4YWVmMFhYTit3UGRxajZUK1lLWk9GSzdXQmppbFJP?=
 =?utf-8?B?VCtacXlwRXZTTGJ2V0hKczNqTHlCRDMvaXZJUytSUUNmZWhoYU00TmtUenhH?=
 =?utf-8?B?RWEzdlR0V2VrMkdDNXFSUzlLOW9kcHdaQ3lwOXZrdjgxU0dCc205UitkcFlW?=
 =?utf-8?B?ZzN6RjZDcG1sNFZKdHJpa05NampkdDN5S0RYZVNLdURBNC9uZ1g2MnpwR3Zt?=
 =?utf-8?B?blBVMHZQNXBUa1MzZzBXSFppWDE1bUpNZUUwd2tzQkZSakNyTWFTZjF1emhm?=
 =?utf-8?B?cFlNYWNVTzJTK25NUFVqUXYrVzNaZ21mNlkzc1BSSG5xMEF3aVBEUzNFQzhm?=
 =?utf-8?B?VVZTTUpMaWJIaEwwaSthalFjcVNsZGN1bW95Y0tPR1VPTUgvNmF4RXIveTRp?=
 =?utf-8?B?bFErZzhnaU80TUdHSGZjVThpN21GYkZZUklkM1hjUVA1ZXdZRXNnRDY0K2dR?=
 =?utf-8?B?dzhSYTV6QkptZllyTEhCK213NzJsa2VJb0RvbGhlOURSOHZwb0xaZUVFRUZh?=
 =?utf-8?B?dmMwY0tTT0ZrSWw5amdaa3FiSDY2Sm1KYUZNeGR2VHRHN1J0NjB4c1lNNFE2?=
 =?utf-8?B?VHNZR3F4cU5CdEoyZC90bzVZNG1YZ01YT3JzeW80QVdxQmV4Z1ZWellWc3Br?=
 =?utf-8?B?WjVtT0dFNExWdW9xTzVSYWN4cEYyMkpWSVQ1NDFIOXNlWG8rTzJoT2JvVkJu?=
 =?utf-8?B?Y05WRHlNdGd0RFY1d0UzQlkyaU03MkVSbkJuQUcxTHNDZHl2NkY0NmRKUXZE?=
 =?utf-8?B?SndqR3VGenFYRlhLRmRnN20vQ1lhOUdFVGRsbm5Gd0w3cnlzbWJhYytkTzI0?=
 =?utf-8?B?WmtuVXlVbnpXaWxWWG9MWEVzRFVINW1nRGdYYzdyWWZyWDNsUGxaWEhzeExl?=
 =?utf-8?B?OE9URkM1K1JoNFpWLzBSVFE4OVNHTmVYZ1NRdlUyYkUxK1FaT1JPRjU3RHkw?=
 =?utf-8?B?eE1TdVMvbDZoL1JHT3hzeDB2NEQyc0ZpVm5aOUZ2bUdVSE90M0VFOWl6Qmpx?=
 =?utf-8?B?Q2NsdW9iV1R6RXMycktaQkJ1SWQ5NjRoaWlwVnRuQTkyNEtXRUhjV0tLd0dU?=
 =?utf-8?B?Z3BXZzFTL0t6YXhybyt6WEQwVm85WldwQjI5b0ozUlMvZTlDUUN6QlpiV2JH?=
 =?utf-8?B?RzhpUVU3dXMzYlYwM1ZoQ3VVYkl3M2I4RjNyWDRuL0xlSlNHQTU4Y2pOdm5V?=
 =?utf-8?B?TVBaZnYxdHdodUtoOGFHcjhMQVI5L3ZsV1VrOVNiU1IxMTgvSXMxTlVNS3RP?=
 =?utf-8?B?MjZpdFJFUmhWazJIZCs3T1dTMlA3di9XaFViai9DSEVhTVpCZ1Y5eU1IblUv?=
 =?utf-8?B?cFpWNjBhMk8zMGhSTEkvdE11VXJpcW8zUXJQTHh3bU5jdEtTMHl1cWJScjRX?=
 =?utf-8?B?TkxaWjUwcTYwR3BNaVRSeGtpc0x3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a2ece8-8e50-48f6-eeb8-08db577ca8ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 08:48:32.0429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w42fQ7LqSIjSH4BN7j1MdB14Upo5mZmDEOBwNStXvzN/SrA1g9rndO3X7NJkeeU3JzcKUoLPEWb4LV04Fyro06+oayHKPoiJ5ExyJ20Hc9VA3O7Pi0b/1XUKLLplMN9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11208
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
aGltb2RhDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL202NjU5Mi11ZGMuYyB8
IDUgKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9tNjY1OTItdWRj
LmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL202NjU5Mi11ZGMuYw0KPiBpbmRleCAwNmUyMWNl
ZTQzMWIuLmUwNWY0NWE0YjU2YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3Vk
Yy9tNjY1OTItdWRjLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9tNjY1OTItdWRj
LmMNCj4gQEAgLTE1MTIsNyArMTUxMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2dhZGdl
dF9vcHMgbTY2NTkyX2dhZGdldF9vcHMgPSB7DQo+ICAJLnB1bGx1cAkJCT0gbTY2NTkyX3B1bGx1
cCwNCj4gIH07DQo+IA0KPiAtc3RhdGljIGludCBtNjY1OTJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBtNjY1OTJfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IG02NjU5MgkJKm02NjU5MiA9IHBs
YXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiANCj4gQEAgLTE1MjcsNyArMTUyNyw2IEBAIHN0
YXRpYyBpbnQgbTY2NTkyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CQljbGtfcHV0KG02NjU5Mi0+Y2xrKTsNCj4gIAl9DQo+ICAJa2ZyZWUobTY2NTkyKTsNCj4gLQly
ZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBub3BfY29tcGxldGlvbihzdHJ1Y3Qg
dXNiX2VwICplcCwgc3RydWN0IHVzYl9yZXF1ZXN0ICpyKQ0KPiBAQCAtMTY4OCw3ICsxNjg3LDcg
QEAgc3RhdGljIGludCBtNjY1OTJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gDQo+ICAvKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLw0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgbTY2NTkyX2RyaXZlciA9IHsNCj4gLQkucmVtb3ZlID0JbTY2NTkyX3JlbW92ZSwNCj4g
KwkucmVtb3ZlX25ldyA9CW02NjU5Ml9yZW1vdmUsDQo+ICAJLmRyaXZlcgkJPSB7DQo+ICAJCS5u
YW1lID0JdWRjX25hbWUsDQo+ICAJfSwNCj4gLS0NCj4gMi4zOS4yDQoNCg==
