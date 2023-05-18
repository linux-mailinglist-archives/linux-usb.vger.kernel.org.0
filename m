Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D965707C59
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 10:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjERIs7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 04:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjERIsw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 04:48:52 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1EA172D
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 01:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGveLQEQUWEhU1L4SDMBkO4k8O2jJ8myGOl5OnWa2nav/M3M4GVOM8QzyhVRQfQBCgq2wneBEm6/yc07Nj5BtrQxCOpAhWfla7viE8aJ4PqdMaMm4SxDM+C8WLSY7Dtjfc8/x3W81xfmCzz5CJpD0tZ3MCfxEO9VGHJOhZzdBG/gw7Wpt9bMNbRDFzj6EZPb9KO/FK+z/DdUSMS7CBWxYKtBn87EtBfzNmyglw/64l+S2ZSHEz4/8oQ8cTH5rpNlQ6qKehqQYKa2Sfz0QaBneGCNmqUmwFe2j1NwWvdLO1PVqppmCJ/K4qBhMkS1oGqc5MLrBoXwpMfigywm6Jy9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYlYQ/fIlWtbyjIDUCgZ+bRHzQYjE1BPNmAOyqGHR4k=;
 b=QVk3aODZtP4tpoMITQfdCybM+w0+HWbYRHkHSWGh5SY0aPgfu7lwSoSZkJduWEMfBcheGg2d7GGMRSnqrp4cxg2iBy9OpKjwhFFXN91l/rzqLA3K6jCNrNqQdeGzZDOaKClE71ldCyU+rFFMgz23Ikzj3JY+EHa5AO0nME4xAjeoSpZkqBqHFMeyWwizBeglgSNWZKhuKOe1P7eSqyaw8EaMbMXSafeVu4X0JnmODJt/bybbEpQhEb/FwArDW7w7LNkUzdGyeAM7A6wJ7INd4hDsy9ynmTUHXZm1bQk/Rvj5G1pK2oXcMmaYHTq2vko84UoxfF1yIgGAj3HJQJCbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYlYQ/fIlWtbyjIDUCgZ+bRHzQYjE1BPNmAOyqGHR4k=;
 b=fCfgDlPM4jmRaLs2dpNZXj78Z7y8QiwaawQSW4qsDLgu35TCpXR7ryl9JIyXDlcmhPMrHAsZM8VooHCo1RBeDN/54cA87XxBWem7thfuCt/IZQ0CccSPfRdA11GhLY6f03GF+6dU5WPa8Rbfh5GbRUi9O5npa1WU1eOQU/6mvZY=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB11208.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 08:48:48 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%3]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 08:48:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 54/97] usb: ehci-platform: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 54/97] usb: ehci-platform: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRPNkAIrT7JXYkeQ9/q4p/aqxa9fV+oQ
Date:   Thu, 18 May 2023 08:48:48 +0000
Message-ID: <TYBPR01MB5341FB13A638E86DB0733225D87F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-55-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-55-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB11208:EE_
x-ms-office365-filtering-correlation-id: 68de97cb-4263-48fe-f09a-08db577cb287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pnc8ZcYfVvcvII1hJUR/FZdKu/7PmVrquK6tjousAaIhg5uLTHUTYb+g+F1RLsQSxIwpa61/DKtjrc//vm8iO1rCHLWH9SDuI0WL9qjXFnVx/uV7Dl9khHskq02tmyOoGhc8Y306rdiBEsBXLwxaL6C2BYxeAlOw+YFnbpgascdWRm/pwOruZqzOF6R6jJssKPh3PY4WaWO9rVuJt33sw6/p7RzAOYpxEQSC830Hy1x//BQpaZUSzQpPYewutlg30eVgYDKKqSwZs8YHAGoxpcTUdSPEY5fkyhFeTgIysE4I0xR5aGZD34XHxEkdlfk6rhUG8nctRS+/hYqn7Ut+ME8yIC/CSpQoGxzP1vVb4pNSZclUTJsdh23rfPk/xIClObXRHdZO92Hp02x/VVnPrX5TvVLNoQrQwPHKJxQrTizX2ky9kInIX74ZQrDJGBfI+EfxS6KJ93na2ljcpL8cpw5uRYaG2tlkApfJl27SoJG9oOYa3hxbR8CAEt1BkeBah5cn5f3OeLdG2w6NYBr8RJMAXFAT2sUVEbWTXRRgQ0ZQ0NyiW8xjcSSqYYtjQLIWMWncAWuIPdJXVr/6GBFdbJ5JKj6gL8aZsVcPfA+4tO67cUdeWrm1gWRCJl1tiSmJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(38100700002)(38070700005)(54906003)(66574015)(66556008)(83380400001)(66476007)(66446008)(7696005)(316002)(66946007)(64756008)(478600001)(110136005)(76116006)(4326008)(6506007)(41300700001)(9686003)(2906002)(5660300002)(71200400001)(8676002)(52536014)(186003)(8936002)(122000001)(55016003)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OW8xV09sOENUeW1oVG1lQlY3azZ1ak1tMC96dHQyY3ZMSUdkNFNHVGZDMy9j?=
 =?utf-8?B?S2UyTE90dTJ2UHZzVjUyNGNmOTFqY25pakNITnJyQ1M0WVpXNHRQeGJack5T?=
 =?utf-8?B?Kzg4Um5BTlB5bU1FWGg0ZVVlUnoxNDZSZy9FZUVvbkRlME9RYjlRVUc3UGV0?=
 =?utf-8?B?dXBZUkg3QnprM2ZlZVhodHpDaGc1djVvcFN2aWlqUDVkZUh2M0g4NCtxYVI0?=
 =?utf-8?B?RVF3VUtPdGQ3SzdyeFVYWWsvd0szTmZxbDMxRjdKQXFoc3I5S1dGQlVwMXhq?=
 =?utf-8?B?aUx0cW02akFMT2Z4eUNlNlFwOG5STGh2YzM5cWN6RTN5RDB5djZyOFZ4bFZE?=
 =?utf-8?B?aCtIaktQdjJCTlNaeDN3b2FiWTRSUDNxL3czYzNDZUpib29XR2lCNG9mSEsx?=
 =?utf-8?B?ZytxYkJPTEZjRVg4V0trblZ6SFliRVBmMkRwanMyRWtuczcwNXlENUVzM0p2?=
 =?utf-8?B?UFJtRDdXK3Fud0s0blYveEpzQ0IreFZ2T0cyNzdYV0M1Z1doZHNrdC83ejZx?=
 =?utf-8?B?cjFXWnVkMGNCQlhRTTFXZEdaZHU0WHUzOEorTUx0TWhPU0xQVHdMTGIxRkpY?=
 =?utf-8?B?bzVXRUwremxORnA0QnZheFVZNDJhNlVFTkttMU9Id2psSGZhL293QUhuN2gx?=
 =?utf-8?B?YzRCbFRvbXRlRTlnOGpvVmR5U0xxOTYyRnVjZ0FMS3ozeUF0L1BqWlVIeXdU?=
 =?utf-8?B?SFJoWHZzN2JlaUlLTEptNDZham5Ldy9MUFI2dDdPTDdES1gyU08zL3NNMFlh?=
 =?utf-8?B?UkFBOUNqRXRSVDE3MnRNeEJUaHBqNFpwbk1oanZxV0lpYWxHYys3dDN1SUVI?=
 =?utf-8?B?Sm1SMUZTejVrbnhoanFTYjB1M3I1cWVoK2lyaFFNYktTcjNtTmh1VnJ1ZDNn?=
 =?utf-8?B?OW9DM2NlMHc0YlkzWXR4dGYrblN3Rmh4czFsVHFsVm8rVkJEdzYrNi9XRU9J?=
 =?utf-8?B?NExnQUtkNUV3OERBVFA1cnN1bVlsNDdFa3RQenVaYlBhZWF5NmdPTmE5TjZh?=
 =?utf-8?B?L2hub1hndERXaEhHY2hyWWk0K0V6ZkRGV2hFc0RMRXFPcVBwQTNyci9IYlhN?=
 =?utf-8?B?WkcxdStZdENkSDNxK0tHTTE2Tk92VmZROHd1YnV0c1FNOU94QWdHdUNCa0Ji?=
 =?utf-8?B?d2lJZmNGNnhiaTh3RzUyeXpHcWVXcE54T25EV1lXamJkQkR4T0hDbVRidGFx?=
 =?utf-8?B?TWJ1ZzNRRHQ0elVqQks2bytiL00xUGFHdVMzcGE1Z0M4emJicDZXc1NNeXZY?=
 =?utf-8?B?WkgwQk81cVpuckRGYi9ZMHFBTktnTmxNK3VlbHhTQ3F1TkxkTnBSVEl5Z1Ex?=
 =?utf-8?B?TFgvOUlFUDZNQXV0RjNUYktmaGdsSXlHV3RhQ3pwQUJORGVXaDZnS1M4a2Rq?=
 =?utf-8?B?YVZ1QU9CQ2dYUmFycGhURlBCNzFOZUg5V3JhUW5rSnZqMmlySEVJYXpreWJL?=
 =?utf-8?B?ZEJLWXR1MTdwQjN4MHJNV1E2T1F6SVlTUjBkQjI3aSt2R2RGeVo5WWQ1eDRY?=
 =?utf-8?B?ejY4VVhKaWNUNjZaN2Y3VEk3Uy82VFFyY3plOUVSK3djU254SmUxTWhsQ2VL?=
 =?utf-8?B?MUlZZFBEazFDeVI0ci9meEVVZ0pRUUFOY0RCUFEvcHFLb1hqOVA2Z3ZCdlFQ?=
 =?utf-8?B?ODcrQnZTdHl4bFFadGVaYWJvaGdyaDA2Wm4vZ2tTZmcva01rWm1aNjYwRlZj?=
 =?utf-8?B?L2RQbWdyV2xtMFk0RzRqTU1KaGFCTzlYWFV5VDRWU3MvcFlSaFpzanROaC92?=
 =?utf-8?B?VHI1VWZLSGxSa0xoS2owMG9mOW1WQWRtSHAxeTdDUU9zMXZlSmpyUkRPL0pu?=
 =?utf-8?B?SW5PUzJoWEdMb3gvUEw1QTFtTmdnTGk3RHpXZVA3VEM3TVFuS0VDM3E2OVh0?=
 =?utf-8?B?U0Y2R3RwNDFQN1A4SDNWWFJJWjF4eGgwRHpEbVdQaWFxSys4TzNqWUtYcm5j?=
 =?utf-8?B?eG5lQnFjK2hkM1BreUZma0RXK1cxelRtenJiZFp0MkxIYXNzY1ZkaVdzdEZV?=
 =?utf-8?B?bFFkQ1d0cGNETlEwOWtxUWJmb1RUaWR1SU1CUTdPK3ZjWVVmMEwzUXc3K2dq?=
 =?utf-8?B?d3NQT24vMjJVdEdENmhLbU9BejZremRsUzJ1R3B3dVJ1MjI3TEw4dWpESU9y?=
 =?utf-8?B?cGlpeG14OXRWQUQrRC9GYzkyMmNoR0hFcTJ0WUtuSjFWZ0lYNHl3MHJMQlFs?=
 =?utf-8?B?OWtqQUc3a0FVZVBsbitJbE5HbVdkbWpvRjIvSEt6NWJ5Zms1dTZzb0pMMHRq?=
 =?utf-8?B?akR1Q1dESUtIaGpOOXF0Mi9sYWlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68de97cb-4263-48fe-f09a-08db577cb287
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 08:48:48.5627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dYe4dkNpKxD+3LahP2hi1MVqwc8O6Pd7lZVaxwrYw/ge8pfIOLRJzo6b5oA2tV1nI6YFETv0jgc4KmGf8GE7Ic3PzqbEhlMrbP5VFaPUswfsp0nvtK8yYKJnKAXSylqh
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
aGltb2RhDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktcGxhdGZvcm0uYyB8IDYg
KystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1wbGF0Zm9ybS5jIGIv
ZHJpdmVycy91c2IvaG9zdC9laGNpLXBsYXRmb3JtLmMNCj4gaW5kZXggZmU0OTdjODc2ZDc2Li44
M2JmNTZjOTQyNGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1wbGF0Zm9y
bS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1wbGF0Zm9ybS5jDQo+IEBAIC00MDAs
NyArNDAwLDcgQEAgc3RhdGljIGludCBlaGNpX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKmRldikNCj4gIAlyZXR1cm4gZXJyOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQg
ZWhjaV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiArc3Rh
dGljIHZvaWQgZWhjaV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2
KQ0KPiAgew0KPiAgCXN0cnVjdCB1c2JfaGNkICpoY2QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShk
ZXYpOw0KPiAgCXN0cnVjdCB1c2JfZWhjaV9wZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRh
KCZkZXYtPmRldik7DQo+IEBAIC00MjQsOCArNDI0LDYgQEAgc3RhdGljIGludCBlaGNpX3BsYXRm
b3JtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpDQo+IA0KPiAgCWlmIChwZGF0
YSA9PSAmZWhjaV9wbGF0Zm9ybV9kZWZhdWx0cykNCj4gIAkJZGV2LT5kZXYucGxhdGZvcm1fZGF0
YSA9IE5VTEw7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50IF9f
bWF5YmVfdW51c2VkIGVoY2lfcGxhdGZvcm1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+
IEBAIC01MTEsNyArNTA5LDcgQEAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKGVoY2lfcGxhdGZv
cm1fcG1fb3BzLCBlaGNpX3BsYXRmb3JtX3N1c3BlbmQsDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBlaGNpX3BsYXRmb3JtX2RyaXZlciA9IHsNCj4gIAkuaWRfdGFibGUJPSBlaGNp
X3BsYXRmb3JtX3RhYmxlLA0KPiAgCS5wcm9iZQkJPSBlaGNpX3BsYXRmb3JtX3Byb2JlLA0KPiAt
CS5yZW1vdmUJCT0gZWhjaV9wbGF0Zm9ybV9yZW1vdmUsDQo+ICsJLnJlbW92ZV9uZXcJPSBlaGNp
X3BsYXRmb3JtX3JlbW92ZSwNCj4gIAkuc2h1dGRvd24JPSB1c2JfaGNkX3BsYXRmb3JtX3NodXRk
b3duLA0KPiAgCS5kcml2ZXIJCT0gew0KPiAgCQkubmFtZQk9ICJlaGNpLXBsYXRmb3JtIiwNCj4g
LS0NCj4gMi4zOS4yDQoNCg==
