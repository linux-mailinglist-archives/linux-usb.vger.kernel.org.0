Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB2459E478
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240823AbiHWNLK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 09:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241246AbiHWNKX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 09:10:23 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe07::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1447F086;
        Tue, 23 Aug 2022 03:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqLZjht1bqo353iMYR6m1xB5US6bSbKDzjjaDpyi7EDggILb3XkKC71inmRm77PFtn50unp6YcSiHu9FLEGQyG+S9+YYaIrFSv+1JXT6JQTPXI+rAzlKa6sSlul/adU7DepQwZryOwKRpblWrD8bDaWb2Rz7PNSzrJUPtRv2wUN0D+iU1wHhdXTQtmkFf/tKZLbQ0WrUrUkLQg3jaKl0MgXmPAnD05XuNou1ApOW8i1QmS/46q+B54r1SsVYZ7r5hiV/xHJziQdN8XdpCUNZ2/4LuhQOfYUFmJjbXbh4y1BX0mUozTd7mkiaxTb8u44tbk38qycRmoqZXIASTXYerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xm9TadqP+hV7ia/vwQda8JVHWoH7Q+IKcmSUuorkm6M=;
 b=Sb9B9leoqhAg6DQZnRQSKEdcyfF33bWNEM5tkhJLDB4VHzz69PHvE+E2nvfoGa42Pssuq58UEN3aSqHf4rvVwtVWZWsiNx2+5QOpWpQOSMMUk9GX2Cb/n6eDc6ziX4NGghzL4CRG3hm8GsicNtBZXWGXiSjkbaMCft4EzUbBVMUuT4Drb6KzMcuz6myAjXNo0EnGzfoxFKbPu0aqG+hHaYdTUVSlIUMCAnFr/66y/4n7Zj/XxTCMWcKTfrdTPJMqBMpZ87hhEkxuF9XQ7/THTUb70U51AMl6UC5icsX7P4+8LxgnrHUfkUHzQPfCMh4KDNYc6Y+R30Wx/em5cKKYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm9TadqP+hV7ia/vwQda8JVHWoH7Q+IKcmSUuorkm6M=;
 b=Qf253P5J5U38P6/HIunr/dtqas2r1taXmcVKdvUfvnC11LiMvNvwzWsWi8HbSm8pGWZ6QoouACEWa5Honv2hnWB0mu7SZIn2u2adskeLD9+XQrTCblb5JF0UScWvpL+7eK1rk2pXMzHhL09XDxs4CaBiHMj75s2uJ2FOBKSabqA=
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9304.eurprd04.prod.outlook.com (2603:10a6:102:2b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 10:10:50 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 10:10:50 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Peter Rosin <peda@axentia.se>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH 2/4] mux: allow get mux_control from fwnode if
 of_node is NULL
Thread-Topic: [EXT] Re: [PATCH 2/4] mux: allow get mux_control from fwnode if
 of_node is NULL
Thread-Index: AQHYtfmQofyaU+wbwUiHXkJAjJESmq28BaqAgAA7kZA=
Date:   Tue, 23 Aug 2022 10:10:50 +0000
Message-ID: <PAXPR04MB8784B67B9191470ED2995B138C709@PAXPR04MB8784.eurprd04.prod.outlook.com>
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
 <20220822153517.3747679-3-xu.yang_2@nxp.com>
 <6a3838dc-e979-2ef6-b332-92d5007fd41c@axentia.se>
In-Reply-To: <6a3838dc-e979-2ef6-b332-92d5007fd41c@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57a0e84b-69d0-4243-73e6-08da84efc19b
x-ms-traffictypediagnostic: PAXPR04MB9304:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6E2q5kg8aIKoYYllHxPN06R1YEUJUJUUbj37Ww2fB1NwWYRSDwwuJ34wMZfUvM1aviJi3kjIecEpaa8Mu1iqEy4ngbheTbnfU4zryZ66IYLtiQlepB5OTSKFNX/3MCpCHrCzCiM0wygP7ycfzn1Jhho2OkEz2YCTBRK+qVADLTLNMNJuS791jjQGztt/2rxsunJQWDczorIqHKYSpMNAvtfVlQPicnA6ZjHNBT6yHkQDO26viOGRRNF9Akol0n0OJKTNq8X4smPj0U8GNXw83msT0Oed8wC9EBM29aS+h9Hz0xB/NDiPeGtJnrmjgOA7rUbz7AqjCUKqmjFnRLtYDzB1Z3qLz6xsCcYx7vIsWDlN8Zp01FhVcmVqrWlWcnoJCbq369iHzuWdAUbUQX3Out713/mIN1AGS71HzNaC9a/NLXGykFaHmAECD1XL83fbf2e4D9gY+C11j9BSi52d7cm5zbHz0VeO1tgdYci681MWFk8IQx1TCzj0DYkIwJ4eVXNZrfcG8Cxwr9+LRZ7kVo6sJT3PWJWysIOjiC9w3N7Toqj/9xznPmpbJWWNDKd7tM4MbXbjJOuuMuH1TvLTOxnfB/zjlg8HbRhXRJhMKmiRtHbz2XwJo0A3Jkgm0+ZjpNpr/+H+z1FpsABSrd8e5lmwl581K7/HWk1JY8gcmHRi+QGRRkQ7aklXlL7tnq0HS1C7Q41N5pqQIZbpbh3kXzsyyvTLUKdfDWjToVlYZDdZUAfnOpWjsZTfELW/M0/ufD6kQjWcbrrlm1uAoDqzUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(38100700002)(55016003)(83380400001)(38070700005)(110136005)(66446008)(76116006)(64756008)(66476007)(66556008)(71200400001)(54906003)(316002)(66946007)(8676002)(4326008)(2906002)(7696005)(26005)(9686003)(33656002)(6506007)(53546011)(86362001)(186003)(478600001)(41300700001)(52536014)(5660300002)(122000001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTNKMDFJSW5OZ3ptRHBmTjZna1U0Q1NSUE02ZHoxSXVqQ3NQS3UwSktaRGdV?=
 =?utf-8?B?bUFYd1VkQWpobTJxdVFGK1VWTTJnRjFnMldscGVtU1FsYXFrV053emNINFRk?=
 =?utf-8?B?azc2Q2xTdDhMd3hQQ0tuNkdCYzFtK0JpSGtnbjNBR3VINkt3bzQrSGxnamsx?=
 =?utf-8?B?V3NGSWJhMDc1WHp1bjV2L1QrM1R6QWhnNldwVElqSU1OVkRmaDllRUhZSGZT?=
 =?utf-8?B?YkZCQU1NNGZ2d1ZvU2tTcUsrN1NSdThSME1ndjNMdnFsYTAwR25MUUZQZ1c0?=
 =?utf-8?B?eFRVa05TOVpRM0M3WWhKOUIzam10M0w5ckZUWno2M3ZvbExYL2Q5VE50UnBj?=
 =?utf-8?B?WTBIVFVJaUNJZGlBUE4vN0hZNnlqUEg0VGgwdG1wNHZOcWtCMGhWdzlhenZK?=
 =?utf-8?B?YzFwWEUrR05MOFBEYUxKa0VVRTJyZkFKWDVvZm55blA5L0pZQUVQZFErcDJi?=
 =?utf-8?B?WEVXcnVXencyRzVYVjViWC9vY0p0R0lGOGZ1TUsrVDBtQmpBUEZ6cW1iVDV4?=
 =?utf-8?B?ZW9zZXhOTmw4WjZzenJTMGEyQXZaRXFUR3FaN1BNckRPcWdONXVsZVBnRXJw?=
 =?utf-8?B?em9pODFOZERNNlNuaTdJSDUwTGprV0RSeDgzd2VaMWMvR2I5eHBvc09qZHNR?=
 =?utf-8?B?b0pKYlFDVTl1K25Iem1scGRTTDBZVVlvc2F4K0tqVHFMa1ExSndqcG9qdE0z?=
 =?utf-8?B?T1BXaVh1ZTRuekNrclIyVXhkTlRPVWYyeTRIdWhIZFZnRmpDRHJEWjRHeXpZ?=
 =?utf-8?B?dk5OQmhadVlKcEllVHpNVFN3TEJFMHNiQUw1ZEJaNk5UaFhWdVFvYnBqWmtE?=
 =?utf-8?B?cEtmSTV1YXM2TWd0eGRFalFjYWRpNWJLZzM1R2lmb0JaUWhUQWg4MmUwN2Zk?=
 =?utf-8?B?UWx1NTg1MzZEQ1MwakltWGxBeGZIbWE5dUgwR2dQTVJCWkxJYnREcE9NaWtZ?=
 =?utf-8?B?QVF1TXVaVVU1ZldRT2xUbkx2NWgrdzQ2bjF6TU5kYWFvTENiT3hGdEo1ditX?=
 =?utf-8?B?LzFYZUpmRmxJR0lrcW44U1hkVEVLNmZKNFd0YW5MWk9hL3FhMjI5MVFFZlpr?=
 =?utf-8?B?RnBGdmxJcnltL2l5V3NDM1ljVXFGK0dvSVRlT2Q5dzYzWUpsWnZ0aEphYTR0?=
 =?utf-8?B?bXZoTlo0ZUh5RGlmb2hwcmZpKzRyTlBqNEkxSnB0L096YVBhb3V5L3NMcmdY?=
 =?utf-8?B?Y1Q5NnhBQUQyMFN3RE5qdThYNXlnL2tvSW05VjdZKzV4UzhRUlRZVVdOMTlu?=
 =?utf-8?B?SzRMaFpxdWpHaS9jTmRBTW4yc1FpcG5iRmV1VkhOUmpUMTc5VzVDejFQQnVU?=
 =?utf-8?B?QXRrMFZMem5PTFVpLzZLdDhPZDNjeGZMc0tPa3lSTWNRM2plYXl3TkZ2YkxK?=
 =?utf-8?B?M2tYcWxISG4zWCsvZUVTWnM4NjQzZDZBV1BQRVZMT1pPU09OUXdNL3BNR3ll?=
 =?utf-8?B?NFo0eTNQbi9iTEk5bklIeDRVTlhGTFdpc2pQK0VSUzBjenBNNkZkL1F0N1dD?=
 =?utf-8?B?eGtMWmFzSE02dUdYVzhFMFNmZTIyRkZpRXZGL0l6d21Wb05Ra2pkcDFnTEZj?=
 =?utf-8?B?aUpudkpWVkN0ZHNYUlJGcGllWkJGMG85Uk1GQzI3OTdoVjRla0JPbVFuVVpF?=
 =?utf-8?B?SmNnMC9jdWI4S1JmbWpVVVhLYUlwZHV2QUwwYlFibjR2MXNEQXdaemRNRzNO?=
 =?utf-8?B?YndQSTdwb3NmbC8rdXM5YldJcGZyc1JSbXFqWXRtVnc2N1A0emdkS0oxSnhF?=
 =?utf-8?B?WVErREtKT2tlWFFTWDFtRldMd1BmVmJtUEdvdksxYkdUZkRoU3FBRzVCYlgx?=
 =?utf-8?B?TEFtc3BSSTMveVM0aWMwd1AyMUs1aDhyaGx0d082MGZvRjVFeWdQOGY2VGVk?=
 =?utf-8?B?ZlE0SlBoSlFlaDdrY1J1VVhDV2s0N3BaL1JmSGZTcWgyOEJnQmVRcU90WlpB?=
 =?utf-8?B?NVpqYXZTNzgzV1FSQlJGZFJrVG5DSjMzVG44Wi9BNzFLcEtMVVk0MGhKZ1pi?=
 =?utf-8?B?M25ZdTc5dGxZLzZPOE0zUy9EYitOSTMyOC9ibUlVY1pvSDR0UTU0TlJmaHZL?=
 =?utf-8?B?aTdTZEo4d0dWRXBtMUpzeVl0SDdYMU5qTmpQK2pEcWtYKzZBUHhKWkVhNVB0?=
 =?utf-8?Q?ECGA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a0e84b-69d0-4243-73e6-08da84efc19b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 10:10:50.5962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsrN0DXAA1mZ/VxKT0ky4QrG3k6ZUY3FjioFIDjdyLSczFmLaPj850TRcPI2ieqep7DJIKUZb0mKLZdb+a+qnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9304
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIg
Um9zaW4gPHBlZGFAYXhlbnRpYS5zZT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDIzLCAyMDIy
IDI6MjMgUE0NCj4gVG86IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPjsgaGVpa2tpLmtyb2dl
cnVzQGxpbnV4LmludGVsLmNvbTsNCj4gcm9iaCtkdEBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJu
ZWwub3JnDQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbGludXhAcm9lY2stdXMu
bmV0OyBKdW4gTGkNCj4gPGp1bi5saUBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9y
ZzsgZGwtbGludXgtaW14IDxsaW51eC0NCj4gaW14QG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBT
dWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIDIvNF0gbXV4OiBhbGxvdyBnZXQgbXV4X2NvbnRyb2wg
ZnJvbSBmd25vZGUgaWYNCj4gb2Zfbm9kZSBpcyBOVUxMDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1h
aWwNCj4gDQo+IEhpIQ0KPiANCj4gMjAyMi0wOC0yMiBhdCAxNzozNSwgWHUgWWFuZyB3cm90ZToN
Cj4gPiBTaW5jZSBzb21lIGRldmljZXMgbWF5IGxpbmsgZndub2RlIHRvIGRldiBidXQgZG9lc24n
dCBsaW5rIG9mX25vZGUsIHNvDQo+ID4gaGVyZSB3ZSBjb3VsZCBnZXQgbXV4X2NvbnRyb2wgZnJv
bSBmd25vZGUgYWdhaW4uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5n
XzJAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tdXgvY29yZS5jIHwgMyArKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXV4L2NvcmUuYyBiL2RyaXZlcnMvbXV4L2NvcmUuYyBpbmRleA0KPiA+IDQ5YmVk
YmU2MzE2Yy4uMDZkNGUyMzJlMDU2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbXV4L2NvcmUu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvbXV4L2NvcmUuYw0KPiA+IEBAIC01MzgsNiArNTM4LDkgQEAg
c3RhdGljIHN0cnVjdCBtdXhfY29udHJvbCAqbXV4X2dldChzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYs
IGNvbnN0IGNoYXIgKm11eF9uYW1lLA0KPiA+ICAgICAgIGludCBpbmRleCA9IDA7DQo+ID4gICAg
ICAgaW50IHJldDsNCj4gPg0KPiA+ICsgICAgIGlmICghbnApDQo+ID4gKyAgICAgICAgICAgICBu
cCA9IHRvX29mX25vZGUoZGV2X2Z3bm9kZShkZXYpKTsNCj4gPiArDQo+ID4gICAgICAgaWYgKG11
eF9uYW1lKSB7DQo+ID4gICAgICAgICAgICAgICBpZiAoc3RhdGUpDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIGluZGV4ID0gb2ZfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKG5wLA0KPiA+ICJtdXgt
c3RhdGUtbmFtZXMiLA0KPiANCj4gVGhpcyBmZWVscyBsaWtlIGEgYmFuZCBhaWQuIElzIGl0IG5v
dCBwb3NzaWJsZSB0byBjb252ZXJ0IHRoZSB3aG9sZSB0aGluZyB0byB0aGUNCj4gZndub2RlIGlu
dGVyZmFjZT8NCj4gDQoNCkFncmVlZC4gQWN0dWFsbHksIEknbSBoZXNpdGF0ZSB0byBjb252ZXJ0
IHRvIGZ3bm9kZSBpbnRlcmZhY2UgZHVlIHRvIG5vdCBoYXZlIGENCndob2xlIHBpY3R1cmUgb2Yg
YWxsIHRoZSBtdXggY29udHJvbGxlciB1c2VycyBiZWZvcmUuIEJ1dCBub3cgaXQgc2hvdWxkIGJl
IG9rYXkgdG8NCmRvIHNvIHNpbmNlIGFsbCB0aGUgZXhpc3RpbmcgZHJpdmVycyBnZXQgbXV4IGNv
bnRyb2xsZXIgYmFzZWQgb24gcGxhdGZvcm0gZGV2aWNlIGFmdGVyDQpteSBjaGVjay4gU28sIEkg
d2lsbCB0cnkgdG8gY29udmVydCB0aGUgd2hvbGUgdGhpbmcgdG8gdGhlIGZ3bm9kZSBpbnRlcmZh
Y2UgaW4gdjIuDQoNClRoYW5rcywNClh1IFlhbmcNCg0KPiBDaGVlcnMsDQo+IFBldGVyDQo=
