Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3D976A6DF
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 04:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbjHACSJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 22:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjHACR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 22:17:58 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7B1125
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 19:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5js/yhetT7B+BBBYRwvVoJHga5FYzsOXsBvsjx9CRpKnfLbMFqqsoW+BpEswN+anS5np35Ur8RxFWufFMOko3nAqErFzcMFIzsglxinLfWyt8fYyFcSQ0thVSroNX12XbsoYmm2zm9k2cAtb6UF1qy4TbwwRXusOVR59iWhzUmO3ATdffTK4H9f1NzY6oeR+sDcDvUk9cpquASPU4op5i/uuUTsuQuubTXoR4UcsquogaXeUv2BBJDRYLjCQuHJBzJGFPBeRGUT1zEYs7I9ckXKO4SYw2FCiqeBheq/b7wKk2y5n/d5YwQbipq7LZ90lvXKMhrDErmuY4zdqxGLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZKJJHLqCFBCHi3afIja4+JwfVV4c1GKbI4p4W7R0sE=;
 b=hv8JdCHk5cSWoZlHOz3RspwGnZCdOsDRj2ykASxxZiWqyMBf9IF2eryy38p4MZCbP1I40Z05/rViFREK7jkE07O18G4xYT+KxbBXtjzeJnezKSUwVozL6sO8rEFiVJ6THxjVMQ25xchYv7J/aUUezdKh3WKkQmqQyfMBRLDDrNdvaQeixxo3mMKQdP873Hx0nJEjKbG7z5QvFFlnHLEM8aarLdWjTR/h8ishrUQDRezMSDK9F4oOM50trpuZ0QkYoE2O8Fxnlzl3FSq545f28K21nutpI0Q1nMhjnMAvsP9rLDlQWCM8wXE9gUNZ6D2MioRGYDiZSRGSZRbjq1ez1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZKJJHLqCFBCHi3afIja4+JwfVV4c1GKbI4p4W7R0sE=;
 b=mPvul31b9ktyMFueTFRW7ieACJlLHCxNoe3BJjYd6+kE5+QmcJAX9W0KMN0D7+QBlfqukl+ZkgUJw7+J0RNakSqjMc7qL42Wx7gOSZJw8uXX+vww7XLU0d7O2+SXtP/ysCaRpP3dWMUxmr8tw2E4s9dwxOqOP7TLd4BIj8NSCvM=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8896.eurprd04.prod.outlook.com (2603:10a6:102:20f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.43; Tue, 1 Aug 2023 02:17:52 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::1640:f76f:1d74:82fa]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::1640:f76f:1d74:82fa%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 02:17:52 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: not sink vbus if operational
 current is 0mA
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: not sink vbus if operational
 current is 0mA
Thread-Index: AQHZq0EWrRme1GvW7UiXk1aB0o5uBq/UEJgAgAACjwCAANCGgA==
Date:   Tue, 1 Aug 2023 02:17:52 +0000
Message-ID: <DB7PR04MB45053C37DCF56B1469D536658C0AA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230630105656.2828595-1-xu.yang_2@nxp.com>
 <ZMe4GOfAT3a1YueY@kuha.fi.intel.com>
 <5759a57b-3bb8-5a1b-a7a8-8c512fc50012@roeck-us.net>
In-Reply-To: <5759a57b-3bb8-5a1b-a7a8-8c512fc50012@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|PAXPR04MB8896:EE_
x-ms-office365-filtering-correlation-id: 0ba4d300-c85f-4a8b-30ce-08db923582af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y9HSP6KLmdDcp6ERf4Q+KMijk+IIO3oHeDZ71zxVKAMoR5Gyi2syeyAvYxxTVZaToQtMpSvLhIJ/8p6SqThTWVa+EpDnuQvv/fPxtPKCNM8D787r8KjHty9IqWEpwo8GRW35LgzsWqLOOGcTmKEQRrJ7JI0BEVANbpWcKnM8Sb8YWR/I/YlHyxUhEaI0IgZleZmMRe4vN8UWfwH1Q0mGx2XXMyatyW+wt3H2Ge08HctxyMdUeYh85+ISX7avOB5rCF55IQIinOz91ptPLCXYWBucdOGhZ4xugGz1e/0dKUQ4Lbp3D4pgvreDHDwbZ0OJN9WnFNnkQWMs42rFQenI9tm/4FJCcXIkRmkOiHoNDfPH5dycoNucttasWBVG3ELn2FwKeOS6XF7wte3NEl2HK899w7q7XkCJ9im0RoVsR4R6AmKzBcXpATeYoIr8mR3pzzrSwTX5bCCjrp7APeiROZEMJlh6OyVOUNsy89mQJgsIg6h1+TaL0UFFcud4J40wFB1pYY2SM3TneCZBmFfF8Fr/AWJko5I3dJaI59KId8UpOOzUjSIO+iuwxhTZ5508yDGO4yVLcGhuJuEVnVjPWQn8J65YkCDRrchvETY8jpCSP6j9ajE/zJjWUpcEOOWunYLKYirJPAK2hVqX5pZFYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(38070700005)(478600001)(38100700002)(122000001)(55016003)(86362001)(33656002)(9686003)(71200400001)(7696005)(53546011)(186003)(26005)(6506007)(8936002)(8676002)(76116006)(52536014)(5660300002)(4326008)(66556008)(66476007)(64756008)(66446008)(66946007)(2906002)(54906003)(41300700001)(110136005)(316002)(83380400001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SThuWVRFZkVTTzAxN1p1dEE0STBjTExqemhjOFcwMk9KTFBYd1VsdWdndEJW?=
 =?utf-8?B?a3FNcG53Qm85K3RRalNMNWpZTHZReFUwOHBLMkRVVEg2S0dvUFA0R3FETEJK?=
 =?utf-8?B?NlZjR3NmdkJ0VWppc0V3dlg4RHJUbW5pR3kwQlhOWUZPTVVxWXZENjZocFNz?=
 =?utf-8?B?dll2bCt2dXM4aEtYSG5qa0cxU3Z4MXIvZ0Zhak1ibnRoTW5CeWI2UG9jR1JC?=
 =?utf-8?B?OWFLUUxzTTZRaTN3b2VPMUpwMVRwRzNzRWp5WkhyZUpKS2RnUFo4a0VuU2FD?=
 =?utf-8?B?R28yMFVLVVBTT2Z2QVVVSU1jRzRQRUlnR1ZveVV1MU5aUm9EZVNUTW1oM3hh?=
 =?utf-8?B?ZDdaa1ExMWhzU3Y0TmZkVFk4TkVQb1FqWkVhNjJhQzRRakVlb3lpOEl4T2Vo?=
 =?utf-8?B?VlE3VUZmN1JlRlRxdndsNFlIbXgxTEhXMVR6RHRMWkhVMFV1c2RzVEdJOWlx?=
 =?utf-8?B?andMWHA3dW5NYmJiUzZuM2Urc2tuZnd6dExsTHdyOXZ1Y1ZqQjNTUStmVXB2?=
 =?utf-8?B?MkNhSnZhR3JqRnJxc29pZTdHTDdMaHkrMVY4UUw5R3B6MGpZSXNpS2ZKNXMy?=
 =?utf-8?B?WGpNQXFFQ0cwSnZXcm14VHY3OFVJc3hBdjJwRkpvdnEwZzFldzc2RVlmWVhj?=
 =?utf-8?B?TUZsT2xDUU84VEtaOUVYaHZmcjZmZGhXc3pocVFSZG9xVFlrZldjMGtWUVY0?=
 =?utf-8?B?eDczQVJCQ3MrekhYVzVuZU44U0toLzFnazhSM1E3U1QrMFViMTN5Z0hVMnE1?=
 =?utf-8?B?dFQrcHZxa2dON0FjSGM4d2VGRCtkai9wYWRmOHk2UVJERW04cUEzemRGL0Rs?=
 =?utf-8?B?UGtnN0huVU1rVjR2WllTZEFkWTZWL1NZbGhKUzczdVEvN1NLNzdKTzE0TVJh?=
 =?utf-8?B?OHZxdzFyZFpjRWdtZXR1ZDBqdTh2YmNvMFlJaUpWNGJOTUU5SzJRMFJNRzNB?=
 =?utf-8?B?cVNIUHhrSWtpcHJtL05zODFBYnQyWUwxK2U5dzNDcVI5dWIwWEU2cEtzTHAz?=
 =?utf-8?B?SXFTYkY1bitLRzhPSTFYUWZmWnliOGUrQ2h3WFVaY2RQdHkvazNWZ2YxWExw?=
 =?utf-8?B?ZXI5eTQweGF0azkzc2VrMGFyYmJPcEFEbnQzSDczRzM1VGdIWjlIbkY1SUU2?=
 =?utf-8?B?VEhuTjNYV0VHOVJ0T1JuUEp0aTZ5VzFqd1pmbVVQSmVHZURScmFGL2RvM2Vx?=
 =?utf-8?B?U0MwODM2akdFZ1BjaUxUYitTbWw3U3FkSzBiOHpPL1FCMkxXU3hheXk5TTU1?=
 =?utf-8?B?MTErZXQrZUtIZ0lsdW9YWWVGaFJ6dUhDb1JUZDdqbFphQVpEdWc3UHRlbCtI?=
 =?utf-8?B?L0tFZGROV3JneHgwOUNUbmt6SW9tTGEwT2RkdG95MXlhb21SYkIvTVBaSWQy?=
 =?utf-8?B?OG1PeFBFMHh0bnB3REo4c1ZYRkJETnRZNExDQmNSdnkweGhDNlIyeGxDZDBo?=
 =?utf-8?B?TVArMnNxd1pCNEhjcmZCcjJmcjc3VFdtVnYyRnQ1SkdSS0pMYW9SWXlreSsz?=
 =?utf-8?B?ZDl0b2dmQzJxSnN6Tng4NlhZa0VXR2FYRldQNlk2cmtoMlFCc3B5UkdIVlp6?=
 =?utf-8?B?NktuSFV4WkJxbzRwbDBiTytDUWJaQW9VRmsyVXgrWW4xMk9hMFgrb0cya1lO?=
 =?utf-8?B?Z1E5ZkgwVjhIenh4WkZ4aTM4SExOM3pvSXZZWnJDRGtob2o5dmFqY1FpUHgz?=
 =?utf-8?B?N21LZUtPSzNCTnNITlBmZTNjOTV4QWFpSlAxL3kzYUtONXVkR0JBUitwYmNl?=
 =?utf-8?B?SHAxVVdhNzhDbk02L1dCRkY4THcvd2R2RWJyMWVoa0lJWE00aXBvTFVFYm9Z?=
 =?utf-8?B?U1U0cm5LbFdJQ1JLMWQ0dDJ3RXQ3M0pUWnN0SjFvZWpmWWN6ZjJxTWRCRWlZ?=
 =?utf-8?B?dDVJS28wZEpKNTJSQXlzY0ZTamVVaDN3OHJucncyZ1IzVXdVMktRbUZGM2dK?=
 =?utf-8?B?UkNOMzZualdyN2FzN2lyV0RIRERXZ1J4VVEwNTU0T2g1S3dScVRpMXhCNUF5?=
 =?utf-8?B?Wk9pZ3RmL2pJN3lxK3Faa2FrZFpuQzljM0JYbGxPVTBuTnpSd0RHYkJhVkdY?=
 =?utf-8?B?MEpHd2VYRGdWT1hKQnVLQWpuTlJ2YUtmWjJMRWlHb2tkMDN0aVZDVGlSK3hi?=
 =?utf-8?Q?tEyU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba4d300-c85f-4a8b-30ce-08db923582af
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 02:17:52.6061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Sn3F7IVsH6qdcJaFpRwK1YkKhQ6GclEmOPqGLJvVMb35I9hVp31J/bZagkj7wVUU61eQjs0ryHjVhDvhqEtjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8896
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSGVpa2tpIGFuZCBHdWVudGVyLA0KDQo+IE9uIDcvMzEvMjMgMDY6MzMsIEhlaWtraSBLcm9n
ZXJ1cyB3cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+IEknbSBzb3JyeSB0byBrZWVwIHlvdSB3YWl0
aW5nLg0KPiA+DQo+ID4gT24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMDY6NTY6NTZQTSArMDgwMCwg
WHUgWWFuZyB3cm90ZToNCj4gPj4gUEQzLjAgU3BlYyA2LjQuMS4zLjEgc2FpZDoNCj4gPj4gRm9y
IGEgU2luayByZXF1aXJpbmcgbm8gcG93ZXIgZnJvbSB0aGUgU291cmNlLCB0aGUgVm9sdGFnZSAo
QjE54oCmMTApDQo+ID4+IFNoYWxsIGJlIHNldCB0byA1ViBhbmQgdGhlIE9wZXJhdGlvbmFsIEN1
cnJlbnQgU2hhbGwgYmUgc2V0IHRvIDBtQS4NCj4gPj4NCj4gPj4gVGhlcmVmb3JlLCB3ZSBjYW4g
a2VlcCBzaW5rIHBhdGggY2xvc2VkIGlmIHRoZSBvcGVyYXRpb25hbCBjdXJyZW50IG9mDQo+ID4+
IHRoZSBmaXJzdCBmaXhlZCBQRE8gaXMgMG1BLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBY
dSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy91c2Iv
dHlwZWMvdGNwbS90Y3BtLmMgfCAxMiArKysrKysrKysrLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jIGIvZHJpdmVycy91c2IvdHlwZWMvdGNw
bS90Y3BtLmMNCj4gPj4gaW5kZXggODI5ZDc1ZWJhYjQyLi40ZjdlNGM1MGU4NDcgMTAwNjQ0DQo+
ID4+IC0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jDQo+ID4+ICsrKyBiL2RyaXZl
cnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jDQo+ID4+IEBAIC00MzAxLDcgKzQzMDEsMTIgQEAgc3Rh
dGljIHZvaWQgcnVuX3N0YXRlX21hY2hpbmUoc3RydWN0IHRjcG1fcG9ydCAqcG9ydCkNCj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgaWYgKHBvcnQtPnNsb3dfY2hhcmdlcl9sb29wICYmIChjdXJy
ZW50X2xpbSA+IFBEX1BfU05LX1NUREJZX01XIC8gNSkpDQo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3VycmVudF9saW0gPSBQRF9QX1NOS19TVERCWV9NVyAvIDU7DQo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgIHRjcG1fc2V0X2N1cnJlbnRfbGltaXQocG9ydCwgY3VycmVudF9s
aW0sIDUwMDApOw0KPiA+PiAtICAgICAgICAgICAgICAgICAgICB0Y3BtX3NldF9jaGFyZ2UocG9y
dCwgdHJ1ZSk7DQo+ID4+ICsNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgaWYgKHBkb19tYXhf
Y3VycmVudChwb3J0LT5zbmtfcGRvWzBdKSkNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB0Y3BtX3NldF9jaGFyZ2UocG9ydCwgdHJ1ZSk7DQo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgIGVsc2UNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB0Y3BtX2xvZyhwb3J0
LCAiTm90IHJlcXVpcmUgcG93ZXIgZnJvbSBTb3VyY2UiKTsNCj4gPj4gKw0KPiA+PiAgICAgICAg
ICAgICAgICAgICAgICBpZiAoIXBvcnQtPnBkX3N1cHBvcnRlZCkNCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB0Y3BtX3NldF9zdGF0ZShwb3J0LCBTTktfUkVBRFksIDApOw0KPiA+
PiAgICAgICAgICAgICAgICAgICAgICBlbHNlDQo+ID4+IEBAIC00NTgyLDcgKzQ1ODcsMTAgQEAg
c3RhdGljIHZvaWQgcnVuX3N0YXRlX21hY2hpbmUoc3RydWN0IHRjcG1fcG9ydCAqcG9ydCkNCj4g
Pj4gICAgICAgICAgICAgICAgICAgICAgdGNwbV9zZXRfY3VycmVudF9saW1pdChwb3J0LA0KPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRjcG1fZ2V0X2N1
cnJlbnRfbGltaXQocG9ydCksDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgNTAwMCk7DQo+ID4+IC0gICAgICAgICAgICAgICAgICAgIHRjcG1fc2V0X2No
YXJnZShwb3J0LCB0cnVlKTsNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgaWYgKHBkb19tYXhf
Y3VycmVudChwb3J0LT5zbmtfcGRvWzBdKSkNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB0Y3BtX3NldF9jaGFyZ2UocG9ydCwgdHJ1ZSk7DQo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgIGVsc2UNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB0Y3BtX2xvZyhwb3J0
LCAiTm90IHJlcXVpcmUgcG93ZXIgZnJvbSBTb3VyY2UiKTsNCj4gPg0KPiA+IFNob3VsZG4ndCB5
b3Ugc3RpbGwgYWx3YXlzIGNhbGwgdGNwbV9zZXRfY2hhcmdlKCk/DQo+ID4NCj4gPiAgICAgICAg
ICB0Y3BtX3NldF9jaGFyZ2UocG9ydCwgcGRvX21heF9jdXJyZW50KHBvcnQtPnNua19wZG9bMF0p
KTsNCj4gPg0KPiANCj4gSSB0aGluayBzbywgc29tZXRoaW5nIGxpa2UNCj4gICAgICAgICB0Y3Bt
X3NldF9jaGFyZ2UocG9ydCwgISFwZG9fbWF4X2N1cnJlbnQocG9ydC0+c25rX3Bkb1swXSkpOw0K
DQpJIGFzc3VtZSB0aGUgc2luayBwYXRoIGlzIGFscmVhZHkgY2xvc2VkIGJlZm9yZSB0Y3BtX3Nl
dF9jaGFyZ2UoKS4gQnV0DQp0aGlzIHdheSBvZiBoYW5kbGluZyBpcyBhbHNvIG9rYXkgZm9yIG1l
LiBXaWxsIHNlbmQgb3V0IHYyIGxhdGVyLg0KDQpUaGFua3MsDQpYdSBZYW5nDQoNCj4gDQo+IEd1
ZW50ZXINCj4gDQo+ID4gSSB0aGluayB3ZSBuZWVkIHRvIHdhaXQgZm9yIGNvbW1lbnRzIGZyb20g
R3VlbnRlci4gSSBkb24ndCBrbm93IHRoaXMNCj4gPiBkcml2ZXIgd2VsbCBlbm91Z2guDQo+ID4N
Cj4gPiB0aGFua3MsDQo+ID4NCg0K
