Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360D360CA3F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Oct 2022 12:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbiJYKnI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 06:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbiJYKnF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 06:43:05 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028F4FF20E;
        Tue, 25 Oct 2022 03:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7SQ2eBzwrWV56adTIg7H4+i6p5hBZ0eSKMbueSp4vWjhZcTCsBbHy5hwAc1QqqdJHhkk2Ypnltb3QejVdh/PQJA4TD6tMvHP95vJuNIKPjvw27Ua+YTvdEkbdbXQ03hzl2z75ZeFji6MBgRlMgoBpym1QwBBJw9HQUt42KGNGl48xcIIXj2Xjgwapj0VTcTu8xVKZ0jWqqhIxtfGUfnT4iLniTrArUcx4doXrzVoMeqP5EkkCzEBSQI92AXM9Csa9BUyJ8dDsFgeNY8tjbTC13QuQqlPbp6iI9WAu+F14kzk8h9WRHNBwe04IQLi5K4RU9s8Fg/7kfqs8qVy6YI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxT1mzeYBDeiyEUti+WKa3v5KXn5N5hb5/CfT9+Jivs=;
 b=hGi7ZynZj7H91wxcfJAhq8ZHBT3/6JBKV8rJ/P5DCVrmX2Q7DbPEqu78HmNmRR3PUwbfm1GwFRgVMbpf4N75lU07E1LV2o1fjILbsWWT926eQWnbWgtWRzfyGbG9XfZB3ZevltooQyHypL4r7UOLOaE8oybgh0zX5gwYUvVwXJNvhSS68NJRXAhFJBtoTWIP+S/z6iRUQWww2A74u85IKzYNfCL1f+WGAZCGxpiq6tFcwW6pkKPo/x/3xdxfuTHV93fbbFf+YYANZuTAALAZqdn3L5lb4QhJEEJAML1KCm6SLLB5WMNJBM+L+rQNi0hsnA8i03yfoa+/nbywjwAxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxT1mzeYBDeiyEUti+WKa3v5KXn5N5hb5/CfT9+Jivs=;
 b=QEWufevRsiT+PbXNTA8jpumbMQadK8UB6YyiYt6iEMEC3SikDzTfuiJNqblUo3qsztgRErCpCRkusNw3I+jpuIHNzd/JMEpVNT51M2YtQOGMvvANDDEXFXd4isuFCny2P4jio4CA33ZvSPx7VroSVz5sfB4tXHT/DX9fsftCDmc=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by PR3PR04MB7289.eurprd04.prod.outlook.com (2603:10a6:102:8a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 10:43:02 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 10:43:02 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>
Subject: RE: [PATCH 1/2] dt-bindings: usb: usb-nop-xceiv: add wakeup-source
 property
Thread-Topic: [PATCH 1/2] dt-bindings: usb: usb-nop-xceiv: add wakeup-source
 property
Thread-Index: AQHY52rF7JmfCQ9gvUu/JJrHN0RbAq4eQQoAgAB/FyA=
Date:   Tue, 25 Oct 2022 10:43:02 +0000
Message-ID: <PA4PR04MB96406F52F9DE40F363B9E39B89319@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1666588648-1047-1-git-send-email-jun.li@nxp.com>
 <1995a21d-1458-8c80-4a24-641f4b5dcf81@linaro.org>
In-Reply-To: <1995a21d-1458-8c80-4a24-641f4b5dcf81@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|PR3PR04MB7289:EE_
x-ms-office365-filtering-correlation-id: 96f7051b-e567-48ca-a29a-08dab675b122
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kdK5O5aenqZ3+uSZ9t6QOhRZnyxAvSZjYx0eZmVsqE7vv/+SNH2dHSbextvWnU1dIlyxE4D/Y0v52D/wlcoUK1k3mUIwtnlIn/QBNgfF2KRj//0AXZguEF53fBvHRVN5mvnwjUsJCU/TDYXhmD/MqBDAW/9k2L4tIxT2C66MBgmw2iJQPICOktb2qfUEKY1uQ0aZVJwYd0mEA70df3ErhCJQEivULJo6hRJlu4bDnqkoB2Fr+GO9e4oqn/VhLGo8vBQ73il+ENrSpQpprGBceil/JPbd6SxSAH2F0YPNayj4ltIvRQwGq4jhiP5lxG0omCEFvcAXMxyy2vS7Fgg9C3M6mbVRrtTAffzlnqtSSg5aqW+Yair9MlFS646zhOEVAwPO17ZqHxSiYQmnnXbeflaUSCegS6NF8RUsC6cn0vRRy2Pa08hOZ48Dns6JrWxqmaSE5CaDpeK8speZAC46zGlAGvjHS/n2i7cFY/7Si4tnvbNm63VK3HKyoRaRfS6rNWaEHIcgcxw4evfpI79U8YpulWvcF3QK8UrCc6E6v+AyeTa4doX7uBQF38MKWvia7L7vMoMaBlMilo/UpxAI5MJydQffTRlBJALaO74GdoU+DsCr73tAkGLJUk9n0NiXE11HhlKEvkEFwZ5tNa8DQRyt8lMAHpYkSfphySs6tJ+OyXtu4vb1safHK8Ok5vETnP6W5BsFiGw2eE79snXR06l9njBUQfpuvZ9/sjTGRvnN/wrvtBaQVhp4VBEC9zkY+aAQnmYHKvDOcxq7umcjSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(33656002)(86362001)(122000001)(38100700002)(76116006)(66446008)(66946007)(66476007)(64756008)(54906003)(38070700005)(110136005)(8676002)(316002)(4326008)(8936002)(66556008)(2906002)(5660300002)(41300700001)(44832011)(186003)(478600001)(55016003)(52536014)(71200400001)(26005)(53546011)(83380400001)(9686003)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDlVQ2pOcU1MeXFLdURDS1NWN1VJSXJkMFArR3VKc0JtSXZoWTF0ejFiRG05?=
 =?utf-8?B?ZEJyZnpEcDJKRDgzWjNEbjJJN2NuZHFLSEE4RzBqeUI0akJzNk1KZ2l4bkdM?=
 =?utf-8?B?NDl2TE5YcnAvZm5UWlJKMUFOcDFzL3NHRFNHYzRBUDF0K0NmYldBRWplQUNC?=
 =?utf-8?B?VVM3N1RGYm9kbE12amlCb0lNUWZIdVdDZ3FZZnN2c0VEZ3k1R1EvYzU1ZzZP?=
 =?utf-8?B?eGhXbHpEczJFZE5BSmRVdElyQ0Z4amlVWUU4RFM3N25nV2phSEQyMXkxRGc5?=
 =?utf-8?B?SXZKejNUSkdDWnU0ZG52U1RIQmVheUNISU90bkNzYjBLRWlpa0RNTXZWeUpl?=
 =?utf-8?B?ZmFQSEZUbEQ3SVp1QWM0UU1vWkI3UkhZNHBmcGxPZEk3cTNqeXMvWnd1SjF2?=
 =?utf-8?B?U0hsZEtra3dUZ1QrTTdkY3YrU1dvbGo5eVBnSERpaUdZOGw3MFVER09IajN6?=
 =?utf-8?B?S0NjeWI2eGc2eXVMV2pjWlhtYkhoMDFVbDdLMU5rUWNOTkYyZGJjZGtXdmtY?=
 =?utf-8?B?TC84WTRFbk81UFk4dHpaU2dZU1NrWVc4V0pTRTE3OXZKc05BcTYxTlpSems2?=
 =?utf-8?B?cFR4Tk1ZbUllNUVjcVhlV2FTcXFMa0tWcEhGZ2NrSjhtZnlMWkJ1YzBVSVh2?=
 =?utf-8?B?U0R6R1lxTWswWE9URGkrOWVIVE5IZ2RSWHdXdk8zTHJsTXVXV2Nic1JRVHh3?=
 =?utf-8?B?Tnl3Q1RUVGRNeTJsZ09iSW8zb1JlU0o5WFViOTM1QXQ4bStzek5LdE5aaEIz?=
 =?utf-8?B?VUFZTTBETTR6MkI1Y1NGM013Z3k1aDlGUTh0S0Ruek1VbzNxcW5aUWVmR2Z6?=
 =?utf-8?B?SFRKTFFxUEU5OFJKOXNWUnZyTmUxZTIyeWZSemthdFBUcERNS2s2NXdMMVNW?=
 =?utf-8?B?T1NXNmh1ZjQzV2VSSVFiR1EwMGtRQURPWVV1Unp3M2s4aDF2YkU2L0s1VnhQ?=
 =?utf-8?B?OFR6Rk1oTzltVW1jczZHRXlNZXpyVW9JTmlqcXVzbDk0TFM3ZllyV3NtZ2o3?=
 =?utf-8?B?SzFrbERwY2EzRWMwVGlORGxtZjRCYXhacGdCQ2NCcXZhTlIyR1VhbkNOalBw?=
 =?utf-8?B?SlJ0RmpPcWFsb3JSWTdRME1wZVZ1WENUMmUwWEFXY2pUUVM2ck53WEFYYWhT?=
 =?utf-8?B?c21ZMlk2dVVRVkhOTjExK0YzQlNGdkJlMDdYL09ZWThRSkc3dURROElURUhj?=
 =?utf-8?B?NjU5dTM3TThVU1lDUVpyeDRJZk1Fc3VXL2NrTEVhMUVnSlpneUNyZ3E5aTlm?=
 =?utf-8?B?OFJ0YmU1dmtHVDRQUEg3SDFyd29nd2d6Q3FUdFN5b2JDSmJCMVJGTmtRV1BQ?=
 =?utf-8?B?YXE3V1p5NktmZ0VyRFV4bXVaZkxEUG1jTmZYQkdtOGp1UzJGbkl0L21rUmda?=
 =?utf-8?B?aThud0gvaURqR2VkRWlUMUFEUllIMHcwRjdTZjhLamZqOGZIN2t0eER0NGpE?=
 =?utf-8?B?Y29HdXJ0Z001d3RKcGNnSzhDWlFqeWsxa0M1Y09LSUtFTU1Ta0d5RG5MNEY0?=
 =?utf-8?B?UmFBdmFCbUV5UWZuR2VRSzFQWFEwYU9IQkFCc21JTnFkS2pNR0tCY1R6THhr?=
 =?utf-8?B?T2NVY0t2VDBkRGRmaEFzbEt2dml3QTBicnJFTnhwa0dhYndacmJ1RzZWYkE0?=
 =?utf-8?B?cVk0ZTg0R2Q0K3VkOW9uRmVhMVpoamxZQTJkb2s0STBCZ1dWWWViY1BHVE9k?=
 =?utf-8?B?dHh6eTRNckdmeUJCb0hOazJGdkh0bFBQczVGaU1qd2RDbWhRV2lRcUUvS3RL?=
 =?utf-8?B?WXd2dDZpTXB3SWxCdE10c2ZKOUxyRHlaVmZEbkZnSndpdnZGZEVyUHVYd0VZ?=
 =?utf-8?B?TFpnMUl1bVNyZnFXbHRKL0ZjLzFVQ3hxRXBVY0ZXY1JyWkJQZStrYjVJYXdn?=
 =?utf-8?B?RE9yRWhXdFk4RFlSRlREYzdQU3d4NHNRVjlmTzJJRytoZDJwSnJKMzRXdkhC?=
 =?utf-8?B?M2Z1ZzIya25zN3hCN1h6aWNZT1RiMnZtcVVLaEgxR09LYlhMN1VtZGE1Ynpu?=
 =?utf-8?B?TFZtaklBcnpIeXRXMUptaEhpZWhXTmFJWXl1TEw2TWUvcVB0UVZHWnBOeElT?=
 =?utf-8?B?SjNHa2dteGRWYzRqV2RMNThVMFRmOEQ1WWU5K3ZvcWJoZEFjWGExQzY3d1Zn?=
 =?utf-8?Q?mSfs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f7051b-e567-48ca-a29a-08dab675b122
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 10:43:02.5143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4w/3s24/vsNkuUhrK7p+vwsHUC5HrvYbtZw4oU5mrMOMoMP6kurf56f6BcLHVOu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7289
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgT2N0
b2JlciAyNSwgMjAyMiA4OjIzIEFNDQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsgZ3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9m
Lmtvemxvd3NraStkdEBsaW5hcm8ub3JnDQo+IENjOiBiYWxiaUBrZXJuZWwub3JnOyBsaW51eC11
c2JAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgWHUgWWFu
ZyA8eHUueWFuZ18yQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBkdC1iaW5k
aW5nczogdXNiOiB1c2Itbm9wLXhjZWl2OiBhZGQgd2FrZXVwLXNvdXJjZQ0KPiBwcm9wZXJ0eQ0K
PiANCj4gT24gMjQvMTAvMjAyMiAwMToxNywgTGkgSnVuIHdyb3RlOg0KPiA+IHVzYiBwaHkgbWF5
IGJlIHBhcnQgb2Ygd2FrZXVwIHNvdXJjZSwgc28gYWRkIHdha2V1cCBzb3VyY2UgcHJvcGVydHkN
Cj4gDQo+IHMvdXNiL1VTQi8NCj4gDQo+ICJwYXJ0IG9mIHdha2V1cCBzb3VyY2UiIGlzIGFjdHVh
bGx5IG5vdCBkZXNjcmlwdGl2ZS4gV2hhdCBkbyB5b3Ugd2FudCB0bw0KPiBzYXkgaGVyZT8NCg0K
V2lsbCBjaGFuZ2UgdG8gYmUgIlVTQiBwaHkgbWF5IGJlIGEgc3lzdGVtIHdha2V1cCBzb3VyY2Ui
Lg0KDQo+IA0KPiA+IHRvIGtlZXAgaXRzIHJlc291cmNlKGUuZyBwb3dlciBkb21haW4pIGFjdGl2
ZSB0byBtYWtlIHVzYiByZW1vdGUNCj4gDQo+IHNwYWNlIGJlZm9yZSAoDQo+IHMvZS5nL2UuZy4v
DQo+IHMvdXNiL1VTQi8NCg0KT2theS4NCg0KPiANCj4gPiB3YWtldXAgd29yay4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8anVuLmxpQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvdXNiLW5vcC14Y2Vpdi55YW1sIHwg
NSArKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2Itbm9w
LXhjZWl2LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
dXNiLW5vcC14Y2Vpdi55YW1sDQo+ID4gaW5kZXggMjgyNGMxNzI4NWVlLi43YjcxZTMyZDFkZjAg
MTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91
c2Itbm9wLXhjZWl2LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL3VzYi1ub3AteGNlaXYueWFtbA0KPiA+IEBAIC0zOSw2ICszOSwxMSBAQCBwcm9w
ZXJ0aWVzOg0KPiA+ICAgICAgICB0aGUgVkJ1cyBsaW5lLg0KPiA+ICAgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+DQo+ID4gKyAgd2FrZXVwLXNv
dXJjZToNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2Zs
YWcNCj4gDQo+IFRoaXMgc2hvdWxkbid0IGJlIG5lZWRlZCwgYXMgaXQgaXMgYSBzdGFuZGFyZCBw
cm9wZXJ0eS4NCg0KV2lsbCByZW1vdmUuDQoNCj4gDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4g
PiArICAgICAgU3BlY2lmeSBpZiBpdCdzIFVTQiByZW1vdGUgd2FrZXVwIGNhcGFibGUuDQo+IA0K
PiBOb3cgeW91IGhhdmUgdG8gZXhwbGFpbiBpbiB0aGUgYmluZGluZ3Mgd2hhdCBpcyAiVVNCIHJl
bW90ZSB3YWtldXAiLg0KDQoiVVNCIHJlbW90ZSB3YWtldXAiIGlzIGEgc3RhbmRhcmQgY29uY2Vw
dCBpbiBVU0Igd29ybGQvc3BlYywgY2hhbmdlDQp0aGUgZGVzY3JpcHRpb24gbGlrZSAiaWYgdGhl
IFVTQiBwaHkgY2FuIGRldGVjdCB0aGUgcmVtb3RlIHdha2V1cA0Kc2lnbmFsIHdoaWxlIHRoZSBz
eXN0ZW0gc2xlZXAiIG1ha2Ugc2Vuc2UgdG8geW91Pw0KDQpUaGFua3MNCkxpIEp1bg0KDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
