Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB797369A2
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 12:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbjFTKnX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 06:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjFTKnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 06:43:21 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6029D
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 03:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyDfE4iuX1u7iuMUV3xRWSY6vrBfoOgKmnIyJczNbvSZdBqoYHfT2aJWuLWFZCL8XAaFbyWel4N0BVe5UGuahAipQFFjX+UXhpYLung1+IF/54K43SvEUUB9W10SEmUN7WLg3EDXmuvSc2fPYwJuszFO2wHvg+awTPAF8qD27MDd2uakMJsFmoaFEMgdDnEUCinIR/+HHmjbxjzG6FEBXYPfjt1mcUgWaIAQw99H1PGy+qUJkGVutQcVkVWLQRL2l90bofpgjEpcC46QhomndAWTlgC2e2Q5EvjWNDtBy/WA8LowxutWUfs+VpQAsELvGKvVj7nv1E9UmEBmfgq0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvGi++Tobd/ip96fStZ7q6pvhtzGvQi34NCXM8sR5go=;
 b=A/6zJdYjhz+ELM4lOx6m6N1PSwrvozAvxmKrnW1ODnTPfGqMxgbh5ZFTMq6KhJBriAC5fu0kmw3KI4L9XeO71sWJRuETpY8Tq0JWq+/vZHDlAgiaWCGyIF498Ocp7pATPJ8p/0p4NG/ZsqdSD/+br/O7Pxl9oix3EckCIVJzWFWbZ+cTuEZMNGYL01tu2kq9bthXf6ioNlRkkUUMAAHecZ3PQcsVIiUGvtFmHIsQslupNFqzFKi7Wj59PXVnzEiRfqoqU3XnaQBJ5uu5dF3HA8sXHPLEAIuaSWnBaN9bX4fvnTAhtlWl+LTvDTvxVdo3dElnkH11i5M/PsxTpfFOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvGi++Tobd/ip96fStZ7q6pvhtzGvQi34NCXM8sR5go=;
 b=GDbl4kvYy9IEf8CUvEb4gFmPabCIKT5/Dxo66aJXPrmO/0O6/po/38nQqMcvA3F1SmqdGeeBFw1suinznDKW1yelch3dncAPCY+U2j+HztHLSPWifDJXuohqwftjSV+mUQ1UKT0NoMWh6lzL47YgVB9dN0r7UxAo6d1Veb0diT4=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8639.eurprd04.prod.outlook.com (2603:10a6:102:21e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 10:43:15 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 10:43:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Faqiang Zhu <faqiang.zhu@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for
 non-drp port
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for
 non-drp port
Thread-Index: AQHZmfv2XcNX5Iuf6UWaOH7ssz4VQq+A5P+AgADPfnCAEVdJIIAAZJWAgAAD5KCAABGKgIAADPgA
Date:   Tue, 20 Jun 2023 10:43:14 +0000
Message-ID: <DB7PR04MB45053377BDCD36C5D0CC17548C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608112858.4405-1-xu.yang_2@nxp.com>
 <0330ffea-d258-8fb8-ff89-5ebb0388f1ff@roeck-us.net>
 <DB7PR04MB450545D417BC401B92335F7C8C51A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <DB7PR04MB45059A20E2474FDCED4C89128C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <555f01f6-c349-42bb-83da-aead1ef1511d@redhat.com>
 <DB7PR04MB450528B21612C31D1527DAF78C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <1189a9d0-fea5-c725-0c2e-dfe5cf93c7aa@redhat.com>
In-Reply-To: <1189a9d0-fea5-c725-0c2e-dfe5cf93c7aa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|PAXPR04MB8639:EE_
x-ms-office365-filtering-correlation-id: 33df8783-2fa7-4f05-461d-08db717b26e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zOD9V7NDK5KaAbO2U4AY85j3mqBKmT0BDqm+0Jh0PBWXDUcl/uwp0O7Ly9IFk2qNEopG42kWpjXTkeEmXPYtBdEJh61Cmnqx1bXSnkEjCHBb5GQFqFwc9RFivLpPNlZOYT7MlsjeF2zlCr9ps+VMf5IRTwemqinf9aHRs3f+2wGha4NnKFfYCO2QgpKj97Bi6okmQK6I5pYjahJ+EY0N4zFRi581DcDIDwkujXpSZAijfOzQ6+lQwghrZrbSA9u7Jh2NMLNcy+5rS1GJZ85BibpivJ5GRZJo5AsyXfOUysPHsCKdRyEX2m887QP+NToKo/cUfmba6V5OiEzCMqiz3AedGh0Q/qH0XaFK4+bB4Sb7QKyGl3DraaYFDAVIM7x0kdM91WTYvhmMDI5m5vTobAqL/sekamGbAI1p35gTjWqkJXBbS3N6Km/YsFV7/LzqbGMtB5GC9U0ar8nSmgIXpZPDyHhPCBkGKxZgVfjbUZKza9eRPLnrRZKCSD7OE5jbdvqpxmNXLw59S6Q7zCu2yT/WAYU3GJ7tddGf6LFGYuhnOvAXSSLpmX5eEJ6M7uK3qJDp9RRg4tdXa9MFcsqf6Pfy/ur/OXdIBENNDam5wJl6h6xqIJ0B6vM6anlaW62N
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199021)(71200400001)(7696005)(478600001)(122000001)(33656002)(83380400001)(186003)(9686003)(6506007)(53546011)(26005)(38100700002)(38070700005)(86362001)(55016003)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(4326008)(316002)(41300700001)(2906002)(5660300002)(52536014)(8936002)(8676002)(110136005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2NITG9UVEYxK0ZuaU4relp4S3dmajFGWDdPcEhPRUdvUkVaaHFkeTA2d1N3?=
 =?utf-8?B?OGN2Z2g0VWppdElsTy80eXZqT1ZKRit2cENkT05SM0hDQXZ4dG1QNy91TzZS?=
 =?utf-8?B?Z21PT0ltSlJ4QVNGVTh2RkJwQjVYQmFXS3pwQnljOXRiM3E5Z3ZZU21RQXp1?=
 =?utf-8?B?a3o5SS9iTUJRNlVDZXhsdERydnVuTGk3bWcyQ3FKR2FSLzVQNzNpT3UxdUJU?=
 =?utf-8?B?UWV1dlpqWDM2UUJ0QklNeGNZUlhqVzU4RHl4dGVQUzgyQlhiK1pQR2tZUTRu?=
 =?utf-8?B?Uk1YelY4NHE2eTUxc1hKQnV1YjJQb05WZ3RwejYrQnBpN2IrV09KRjhvK2pU?=
 =?utf-8?B?eko0YTdEL3M0ZDhGTThlWEsvNXhIS0JmVjNUYy9ZMmN5TnFyNHN5aCtacWtn?=
 =?utf-8?B?VXpqYVlXNThQVUc2UHNyS3NER0toZHRWUHVwYU81aUVOTEVLdHo0N3RLN3J3?=
 =?utf-8?B?Ty9JR3J6WVlYY3hoSE5pTlVkOEorK3F4SW4rVFhsd0xVdEtRc2NKd1Z5OU44?=
 =?utf-8?B?ajkyWW5nWkozL3ZncHZtVEJuUmJlS3FDWEpLd3JCREdtNW5PUnJnVGRUSzB2?=
 =?utf-8?B?L0hWekJNMnc0VGZtQ3lTUk5SV3MwNzZnVHFkbXRIdEJoZnRHVGpyYXBnMHFo?=
 =?utf-8?B?ZmtYOTFoUThUY2Ntak1wWlJSbG91TWEwenV4bkYwZWpNMmd4WEJxek1ucGRz?=
 =?utf-8?B?U3VLMFBzODBZdFJFR0taUXNhSlN4Z1BVLytmdFdpd1QvajIyRWRrUnVuRjlz?=
 =?utf-8?B?N0tmc0VKZUFHeDY3QjhUQ0QzS3BDb09ZeUNSZHRxeFZNLzI5NnNxaEszdEdK?=
 =?utf-8?B?bmdBV1JncTY1TFRFNHNhMFBGNkY1ZlZhUGtnTEwyVEE1cmRLTmlJZVhPcm1C?=
 =?utf-8?B?SWFLdVpTOE1tbGl6UE02VU84THV2YnovSDJGbFZaSzdHSW5WKzZ3ak5EWSt5?=
 =?utf-8?B?MmlhZDkrd1cyTmpRcWdyMVAwK3dUdE96UmVVQmJYYUtTL2lpYUt3NmpOOUc4?=
 =?utf-8?B?dVBqUnFRRlJuZnNEM1FWMFVZRStieExzeUl1eUVRbnhLM29ZTUdqRmJlMlVr?=
 =?utf-8?B?RjZHWnpKUzd0OGF1VWRic2t5TEIwYkZBaGt2eWE0NE5JNFAvTE9qUGNLV0Jt?=
 =?utf-8?B?TU9BbHhxTWxwZGlKbzk1UVFaQXJ5RVhwRmVjQ2Z6QWZQVmYxOXZ1eFcwNVZs?=
 =?utf-8?B?M0s5VlRlU0paaXgvbk91djhaVW9nY1JZb3RXblZ0aGwwbWJoWUUwOEtQVFMv?=
 =?utf-8?B?REJVeWNtVWNKYm9KRmRaZElTd3l4eG9lOFBXUjhPTVYvUG40WlcyVFFQWGMy?=
 =?utf-8?B?MTR4THBIN3pKaVZJUGFhUWxzR3oxdjVjVnVHaVNEdlI5V2pQLzlPWWJQZ2tK?=
 =?utf-8?B?aGNNVTNOMzRTZnRXQTRNVHJ6UGZJSG1MZlZ4RnNDc0VxWTErdm9kWDV2a3BU?=
 =?utf-8?B?WVF6S0tSb1I1N3NGSHJxZ21WTEVuaE85Vzh3WHBrRnNQOE5naWFxbG9ETVYv?=
 =?utf-8?B?REVzQmRrQ2kyVEErWFBKUEtRNTliQTVhQzlWekxTYUNWL0h4eWpVaHZsSUJN?=
 =?utf-8?B?N2JjNEVicTdERmIyTjNZZHEwTXB0dzltYml1VkRIYVRIbE9RT2NvRzUyaEhi?=
 =?utf-8?B?anlQWVJmTzdPUEtmQzRpVk83Yng1M3R2R2NFdTBZc0xwem9xdU15eG03QmF5?=
 =?utf-8?B?ZGpPWnpDNDArS0FIRHZqeXVLRWZSbndQaVRoS1Fxc0hRMnhFbU5xa0NuRmdJ?=
 =?utf-8?B?RVdvczRYeFhsZUQ1K3hVVlNlQ01jQll6Rml0Y3BPSjliZU5GUUwzeG45ZHQ3?=
 =?utf-8?B?N0tLTFVYL1JqTkRpZ09wSVlWMVRLajc3NDJNMVJkOFdkWWlVSW9UaG1qUDRK?=
 =?utf-8?B?dmRkTFNlK2dnSnMvQzQ1YzdkWlVHcURSUGFnYWt0WE5ScnFxMGxjd2pVV2hB?=
 =?utf-8?B?d1gxaGt0dTdoUVJVUGc1cFBhcTJKNS9DK0pMdXFDbTAxVDJwQk5nc0JMT2Vy?=
 =?utf-8?B?OUl3Z24wTlpXWkhNNUErV1ZZcXQySGU1MVdJMmE5cTRmRDFuWExIbzl5WGdq?=
 =?utf-8?B?YzU1NmtxY1hXd2tYNkVRZiszU1BZNHFBdmFmRlMxWjFrZGdYK2sxNUVMaFp3?=
 =?utf-8?Q?Syos=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33df8783-2fa7-4f05-461d-08db717b26e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 10:43:14.9809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCRJ7Kn3j72lvgipW1lkjDRImIKojN9yY0TbYLlSyJudY27wSXhemVQVGtfYfBEj1M9piDULsQeyF7nZuDYbUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8639
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMjAsIDIwMjMgNTo1MiBQ
TQ0KPiBUbzogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+OyBHdWVudGVyIFJvZWNrIDxsaW51
eEByb2Vjay11cy5uZXQ+OyBoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tDQo+IENjOiBn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNv
bT47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IEp1biBMaSA8anVuLmxpQG54cC5jb20+Ow0K
PiBaaGlwZW5nIFdhbmcgPHpoaXBlbmcud2FuZ18xQG54cC5jb20+OyBGYXFpYW5nIFpodSA8ZmFx
aWFuZy56aHVAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtFWFRdIFJlOiBbUEFUQ0hdIHVzYjog
dHlwZWM6IHRjcGNpOiBhbGxvdyBkcnAgdG9nZ2xpbmcgZm9yIG5vbi1kcnAgcG9ydA0KPiANCj4g
Q2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVu
IGNsaWNraW5nIGxpbmtzIG9yIG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJl
cG9ydCB0aGUNCj4gbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzIGVtYWlsJyBidXR0b24N
Cj4gDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDYvMjAvMjMgMTE6MzgsIFh1IFlhbmcgd3JvdGU6DQo+
ID4gSGkgSGFucywNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBUdWVz
ZGF5LCBKdW5lIDIwLCAyMDIzIDQ6MzUgUE0NCj4gPj4gVG86IFh1IFlhbmcgPHh1LnlhbmdfMkBu
eHAuY29tPjsgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PjsgaGVpa2tpLmtyb2dl
cnVzQGxpbnV4LmludGVsLmNvbQ0KPiA+PiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBsaW51eC11c2JAdmdlci5rZXJuZWwu
b3JnOyBKdW4gTGkNCj4gPGp1bi5saUBueHAuY29tPjsNCj4gPj4gWmhpcGVuZyBXYW5nIDx6aGlw
ZW5nLndhbmdfMUBueHAuY29tPjsgRmFxaWFuZyBaaHUgPGZhcWlhbmcuemh1QG54cC5jb20+DQo+
ID4+IFN1YmplY3Q6IFJlOiBbRVhUXSBSZTogW1BBVENIXSB1c2I6IHR5cGVjOiB0Y3BjaTogYWxs
b3cgZHJwIHRvZ2dsaW5nIGZvciBub24tZHJwIHBvcnQNCj4gPj4NCj4gPj4gQ2F1dGlvbjogVGhp
cyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxp
bmtzIG9yIG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydA0KPiB0aGUN
Cj4gPj4gbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzIGVtYWlsJyBidXR0b24NCj4gPj4N
Cj4gPj4NCj4gPj4gSGkgYWxsLA0KPiA+Pg0KPiA+PiBPbiA2LzIwLzIzIDA1OjEwLCBYdSBZYW5n
IHdyb3RlOg0KPiA+Pj4gKysgSGFucyBkZSBHb2VkZQ0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IFh1IFlhbmcNCj4gPj4+PiBTZW50OiBGcmlk
YXksIEp1bmUgOSwgMjAyMyAxMDoxNSBBTQ0KPiA+Pj4+IFRvOiBHdWVudGVyIFJvZWNrIDxsaW51
eEByb2Vjay11cy5uZXQ+OyBoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tDQo+ID4+Pj4g
Q2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBu
eHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgSnVuIExpDQo+ID4+IDxqdW4ubGlA
bnhwLmNvbT47DQo+ID4+Pj4gWmhpcGVuZyBXYW5nIDx6aGlwZW5nLndhbmdfMUBueHAuY29tPjsg
RmFxaWFuZyBaaHUgPGZhcWlhbmcuemh1QG54cC5jb20+DQo+ID4+Pj4gU3ViamVjdDogUkU6IFtF
WFRdIFJlOiBbUEFUQ0hdIHVzYjogdHlwZWM6IHRjcGNpOiBhbGxvdyBkcnAgdG9nZ2xpbmcgZm9y
IG5vbi1kcnAgcG9ydA0KPiA+Pj4+DQo+ID4+Pj4gSGkgR3VlbnRlciwNCj4gPj4+Pg0KPiA+Pj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+PiBGcm9tOiBHdWVudGVyIFJvZWNr
IDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gPj4+Pj4g
U2VudDogVGh1cnNkYXksIEp1bmUgOCwgMjAyMyA5OjI0IFBNDQo+ID4+Pj4+IFRvOiBYdSBZYW5n
IDx4dS55YW5nXzJAbnhwLmNvbT47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20NCj4g
Pj4+Pj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBkbC1saW51eC1pbXggPGxpbnV4
LWlteEBueHAuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgSnVuIExpDQo+ID4+Pj4g
PGp1bi5saUBueHAuY29tPjsNCj4gPj4+Pj4gWmhpcGVuZyBXYW5nIDx6aGlwZW5nLndhbmdfMUBu
eHAuY29tPjsgRmFxaWFuZyBaaHUgPGZhcWlhbmcuemh1QG54cC5jb20+DQo+ID4+Pj4+IFN1Ympl
Y3Q6IFtFWFRdIFJlOiBbUEFUQ0hdIHVzYjogdHlwZWM6IHRjcGNpOiBhbGxvdyBkcnAgdG9nZ2xp
bmcgZm9yIG5vbi1kcnAgcG9ydA0KPiA+Pj4+Pg0KPiA+Pj4+PiBDYXV0aW9uOiBUaGlzIGlzIGFu
IGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3Ig
b3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwNCj4gcmVwb3J0DQo+ID4+IHRoZQ0K
PiA+Pj4+PiBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwnIGJ1dHRvbg0KPiA+
Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiA2LzgvMjMgMDQ6MjgsIFh1IFlhbmcgd3JvdGU6DQo+
ID4+Pj4+PiBTb21lIHNpbmdsZSBwb3dlciByb2xlIFR5cGUtQyBwb3J0IHdpdGggZHVhbCBkYXRh
IHJvbGUsIHRoaXMga2luZCBvZg0KPiA+Pj4+Pj4gcG9ydCBjb25uZWN0cyBub24gVHlwZS1DIHBv
cnQgZm9yIHVzYiBkYXRhIHdpbGwgbmVlZCB0Y3BtIHRvIHdvcmsgdG8NCj4gPj4+Pj4+IGdldCBw
b2xhcml0eSBmb3Igb3JpZW50YXRpb24gY2hhbmdlIGFuZCBsZXQgVHlwZS1DIHBvcnQga2VlcCBh
dCBmYWtlDQo+ID4+Pj4+PiBwb3dlciByb2xlIHRvIHByb3ZpZGUgYW5vdGhlciBub24tZGVmYXVs
dCBkYXRhIHJvbGUsIHNvIHJlbW92ZSB0aGUgZHJwDQo+ID4+Pj4+PiBwb3J0IGNvbmRpdGlvbiBm
b3Igbm93Lg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEhhcyBhbnlvbmUgZW5jb3VudGVyZWQgdGhpcyB1
c2UgY2FzZT8gSG93IGRvIHlvdSBoYW5kbGUgdGhpcyBsaW1pdGF0aW9uDQo+ID4+Pj4+PiBpbiBj
dXJyZW50IHRjcG0gd2l0aCBhIGJldHRlciB3YXk/IFBsZWFzZSBraW5kbHkgc2hhcmUgeW91ciB0
aG91Z2h0cy4NCj4gPj4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IEhhdmUgeW91ID8gVGhpcyBpcyBh
biBvZGQgY29tbWVudCB0byBtYWtlIGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbi4NCj4gPj4+Pg0K
PiA+Pj4+IFNvcnJ5IGZvciB0aGlzLiBJdCdzIG5vdCBhIGZvcm1hbCBwYXRjaC4NCj4gPj4+Pg0K
PiA+Pj4+Pg0KPiA+Pj4+PiBFaXRoZXIgY2FzZSwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBvbmUg
d291bGQgbmVlZCB0byBlbmFibGUgdG9nZ2xpbmcNCj4gPj4+Pj4gdW5kZXIgYW55IGNpcmN1bXN0
YW5jZXMgaWYgdGhlIHBvcnQgaXMgbm90IERSUC4gVGhlIGRlc2NyaXB0aW9uIGRvZXMNCj4gPj4+
Pj4gbm90IGV4cGxhaW4gaG93ICJuZWVkIHRjcG0gdG8gd29yayIgY29ycmVsYXRlcyB0byBlbmFi
bGluZyB0b2dnbGluZyBvbg0KPiA+Pj4+PiBub24tRFJQIHBvcnRzLg0KPiA+Pj4+DQo+ID4+Pj4g
TXkgY2FzZSBpcyBhIHNvdXJjZS1vbmx5IFBEIGNhcGFibGUgcG9ydCB3aXRoIGR1YWwgZGF0YSBy
b2xlLCBjb25uZWN0IHRvDQo+ID4+Pj4gbGVnYWN5IFBDIGhvc3QgdmlhIEEtdG8tQyB0byB3b3Jr
IGFzIFVTQiBkZXZpY2UgbW9kZS4gVW5kZXIgY3VycmVudCB0Y3BtDQo+ID4+Pj4gbWVjaGFuaXNt
LCB0aGUgUEMgd2lsbCBub3QgcmVjb2duaXplIHRoZSBzb3VyY2Utb25seSBQRCBjYXBhYmxlIHBv
cnQgYW5kDQo+ID4+Pj4gdGhlIHVzYiBjb250cm9sbGVyIGhhcyBubyBjaGFuY2UgdG8gd29yayBh
cyBkZXZpY2UgbW9kZS4NCj4gPj4+Pg0KPiA+Pj4+IEhvd2V2ZXIsIGlmIEkgZW5hYmxlIENDIHRv
Z2dsaW5nLCB0aGUgUEQgcG9ydCBjYW4gcmUtd29yayBhcyBzaW5rIHJvbGUgYW5kDQo+ID4+Pj4g
dGhlIFVTQiBjb250cm9sbGVyIGNhbiBmdW5jdGlvbiBhcyBkZXZpY2UgbW9kZSB0b28uIFNpbmNl
IGl0J3MgVVNCMyBwb3J0LA0KPiA+Pj4+IGl0IGNhbiB3b3JrIG9ubHkgYWZ0ZXIgdGhlIFNTIGxp
bmsgaGFzIGNvcnJlY3RseSBlc3RhYmxpc2hlZC4gVGh1cywgd2UgYWxzbw0KPiA+Pj4+IG5lZWQg
dGNwbSB0byBzZXQgY29ycmVjdCBvcmllbnRhdGlvbi4NCj4gPj4+Pg0KPiA+Pj4+IFNvLCBpdCBz
ZWVtcyBhIGxpbWl0YXRpb24gdG8gbGV0IHNpbmdsZSBwb3dlciByb2xlIFR5cGUtQyBwb3J0IHdp
dGggZHVhbA0KPiA+Pj4+IGRhdGEgcm9sZSB0byB3b3JrIGFzIG5vbi1kZWZhdWx0IGRhdGEgcm9s
ZSB3aGVuIGNvbm5lY3RlZCB0byBub24gVHlwZS1DDQo+ID4+Pj4gcG9ydC4NCj4gPj4+DQo+ID4+
PiBJIGRvIHNlZSBiZWxvdyBwYXRjaGVzIGZyb20gSGFucyB0byBmaXggdGhlIHNhbWUgaXNzdWUg
YXMgb3Vycy4NCj4gPj4+DQo+ID4+PiA0ODI0MmUzMDUzMmIgKCJ1c2I6IHR5cGVjOiBmdXNiMzAy
OiBSZXZlcnQgIlJlc29sdmUgZml4ZWQgcG93ZXIgcm9sZSBjb250cmFjdCBzZXR1cCIiKQ0KPiA+
Pj4gNjI1OGRiMTRkNzhjICgidXNiOiB0eXBlYzogZnVzYjMwMjogSW1wbGVtZW50IHN0YXJ0X3Rv
Z2dsaW5nIGZvciBhbGwgcG9ydC10eXBlcyIpDQo+ID4+PiA3ODkzZjllMWMyNmQgKCJ1c2I6IHR5
cGVjOiB0Y3BtOiBOb3RpZnkgdGhlIHRjcGMgdG8gc3RhcnQgY29ubmVjdGlvbi1kZXRlY3Rpb24g
Zm9yIFNSUHMiKQ0KPiA+Pj4NCj4gPj4+IFNvIEkgdGhpbmtzIGl0J3MgcmVhbGx5IGEgbGltaXRh
dGlvbiBmb3IgU1JQIHRvIHdvcmsgY29ycmVjdGx5IHdpdGggdGNwY2kgZHJpdmVyLg0KPiA+Pj4g
TWF5YmUgYW4gaW1wcm92ZW1lbnQgaXMgbmVlZGVkIGZvciB0Y3BjaSBkcml2ZXIuDQo+ID4+DQo+
ID4+IFRoYW5rIHlvdSBmb3IgQ2MtaW5nIG1lLiBUaGlzIHNpdHVhdGlvbiBpcyBhIGJpdCBkaWZm
ZXJlbnQgZnJvbSB0aGUgb25lIGZpeGVkIGJ5IHRoZSBhYm92ZSBwYXRjaGVzLg0KPiA+Pg0KPiA+
PiBUaGUgYWJvdmUgcGF0Y2hlcyB3aGVyZSBmb3IgcHVyZSBzaW5nbGUtcm9sZSBwb3J0cy4NCj4g
Pj4NCj4gPj4gV2hlcmUgYXMgd2hhdCB3ZSBzZWVtIHRvIGhhdmUgaGVyZSBpcyBhIGR1YWwtZGF0
YS1yb2xlLCBzaW5nbGUtcG93ZXItcm9sZSBwb3J0Lg0KPiA+Pg0KPiA+PiBJIGFzc3VtZSB0aGF0
IGZvciB0aGlzIHBvcnQgYXQgbGVhc3QgdGhlIDV2IGJvb3N0IG91dHB1dCBjYW4gYmUgdHVybmVk
IG9uL29mZi4gQnV0IEkgZ3Vlc3MgdGhhdCBpdCBjYW5ub3QgYmUgdXNlZCB0byBjaGFyZ2UNCj4g
Pj4gdGhlIGRldmljZSA/DQo+ID4+DQo+ID4+IFRvIG1lIGl0IHNvdW5kcyBsaWtlIHRoYXQgdG8g
bWFrZSB0aGlzIHdvcmssIGV2ZW4gd2l0aCBkdW1iIChqdXN0IGEgcmVzaXN0b3Igb24gMSBDYyBs
aW5lKSBVU0ItQyAtIFVTQi1BIGNhYmxlcywgdGhlIHBvcnQNCj4gPj4gc2hvdWxkIHNpbXBseSBi
ZSBkZWNsYXJlZCBhcyBhIGR1YWwtcm9sZSBwb3J0LCBiZWNhdXNlIHRoYXQgaXMgd2F0IGl0IGFj
dHVhbGx5IGlzIChpdCBhY3R1YWxseSBpcyBkdWFsLXJvbGUpLg0KPiA+Pg0KPiA+PiBBbmQgdGhl
biB3aGVuIGNvbmZpZ3VyZWQgYXMgc2luaywgaXQgY2FuIG9wZXJhdGUgaW4gdGhlIGRlZmF1bHQg
ZGV2aWNlLW1vZGUgc2luayBkYXRhIHJvbGUgYW5kIGp1c3Qgbm90IGNvbnN1bWUgdGhlDQo+ID4+
IHByb3ZpZGVkIDVWLg0KPiA+Pg0KPiA+PiBOb3RlIGlmIHRoZSA1ViBib29zdCBvdXRwdXQgY2Fu
IG5vdCBiZSBkaXNhYmxlZCB0aGF0IHRoYXQgd291bGQgYmUgYSBwcm9ibGVtIGJ1dCB0aGF0IHdv
dWxkIHJlYWxseSBiZSBvdXQgb2Ygc3BlYywgeW91DQo+ID4+IGNhbm5vdCBqdXN0IHVuY29uZGl0
aW9uYWxseSBvdXRwdXQgNVYgZnJvbSBhIFR5cGUtQyBwb3J0Lg0KPiA+DQo+ID4gVGhhbmtzIGZv
ciB5b3VyIGNvbW1lbnRzLg0KPiA+DQo+ID4gSSBsb29rZWQgdGhyb3VnaCB5b3VyIHBhdGNoZXMg
aW4gZGV0YWlsLiBJdCBzZWVtcyB0aGF0IHlvdXIgaXNzdWUgaXMgdGhlDQo+ID4gVE9HRE9ORSBp
bnRlcnJ1cHQgY2Fubm90IGJlIGFzc2VydGVkIGV2ZW4gdGhlIGRlZmF1bHQgQ0MgdGVybWluYXRp
b24gaXMNCj4gPiBzZXQgZm9yIFNSUCB3aGVuIFR5cGUtQyBjYWJsZSBhdHRhY2hlZC4gVGhlIHJl
YXNvbiBpcyBhIHN0ZXAgdG8gZW5hYmxlDQo+ID4gU05LIG9yIFNSQyBUb2dnbGUgYXV0b25vbW91
cyBmdW5jdGlvbmFsaXR5IGlzIG1pc3NlZC4gV2hlbiB0aGlzIHN0ZXAgaXMNCj4gPiBhZGRlZCwg
VE9HRE9ORSBpbnRlcnJ1cHQgd2lsbCBjb21lIGFzIGV4cGVjdGVkLiBIb3dldmVyLCBpdCBoYXMg
aXNzdWUgdG8NCj4gPiBwdXQgdGhpcyBzdGVwIHRvIHRjcG1fc2V0X2NjKCkgd2hlbiBkb2luZyBw
b3dlciByb2xlIHN3YXAuIFNvIHlvdXIgY2FzZQ0KPiA+IHNob3VsZCBiZSBhIGRpZmZlcmVudCBp
c3N1ZSBmcm9tIG1pbmUuDQo+ID4NCj4gPiBZZXMsIHRoZSA1ViBvdXRwdXQgZnJvbSBzb3VyY2Ut
b25seSBwb3J0IGNhbiBiZSB0dXJuZWQgb24vb2ZmLiBUaGUgdGNwYw0KPiA+IGRvZXMgc3VwcG9y
dCBkdWFsIHBvd2VyIHJvbGUuIEJ1dCBzdWJqZWN0IHRvIG91ciB1c2VjYXNlLCB3ZSBuZWVkIHRv
DQo+ID4gcmVzdHJpY3QgaXQgdG8gYmUgYSBzb3VyY2Utb25seSBwb3J0IHdpdGggYmVsb3cgcHJv
cGVydGllcyBhbmQgYXZvaWQgc2lua2luZw0KPiA+IHZidXMgdmlhIGh3IGRlc2lnbjoNCj4gPg0K
PiA+IHBvd2VyLXJvbGUgPSAic291cmNlIjsNCj4gPiBkYXRhLXJvbGUgPSAiZHVhbCI7DQo+ID4N
Cj4gPiBTbyBJIHRoaW5rIHRoaXMgaXMgYSBub3JtYWwgdXNlY2FzZS4gVGhlIHNvZnR3YXJlIG1p
Z2h0IG5lZWQgdG8gbWFrZSBhDQo+ID4gbGl0dGxlIGNoYW5nZSB0byBzdXBwb3J0IGl0Lg0KPiAN
Cj4gUmlnaHQsIGJ1dCBpbiBvcmRlciB0byBiZSBhYmxlIHRvIHVzZSBkZXZpY2UtbW9kZSB3aXRo
IGEgcGFzc2l2ZQ0KPiBVU0ItQyA8LT4gVVNCLUEgY2FibGUgeW91ciB0Y3BjIHN0aWxsIG5lZWRz
IHRvIHVzZSBkdWFsLXJvbGUgdG9nZ2xpbmcsDQo+IG90aGVyd2lzZSBpdCB3aWxsIG5vdCBldmVu
IGdlbmVyYXRlIGFuIElSUSB3aGVuIHBsdWdnaW5nIGluIHRoZQ0KPiBwYXNzaXZlIFVTQi1DIDwt
PiBVU0ItQSBjYWJsZSBhbmQgeW91IHRodXMgd2lsbCBub3QgZXZlbiBnZXQNCj4gYW4gaW5zZXJ0
aW9uIGV2ZW50Lg0KPiANCj4gV2hpY2ggSSBzZWUgaXMgbW9yZSBvciBsZXNzIHdoYXQgeW91ciBv
cmlnaW5hbCBwYXRjaCB0cmllcyB0byBkby4NCj4gDQo+IFNvIEkgZ3Vlc3MgeW91ciBvcmlnaW5h
bCBwYXRjaCBkb2VzIHNlZW0gdG8gYmUgc29tZXRoaW5nIGxpa2UNCj4gd2hhdCBpcyBuZWNlc3Nh
cnkgYnV0IGZvciB0aGUgVUNTSSBiaXQgaXQgc2hvdWxkIGJlIGxpbWl0ZWQgdG8NCj4gb25seSBz
dGlsbCBhbGxvdyBkdWFsLXJvbGUgdG9nZ2xpbmcgd2hlbiB0aGUgZGF0YS1yb2xlIGlzICJkdWFs
Ii4NCg0KU2VlbSBhIGdvb2QgaWRlYS4gOiApDQoNCj4gDQo+IEFsc28gaXQgc2hvdWxkIGJlIHNw
bGl0IGludG8gc2VwYXJhdGUgcGF0Y2hlcyBmb3IgdGhlIFVDU0kNCj4gYW5kIFRDUE0gcGFydHMu
DQo+IA0KPiBOb3RlIEkndmUgbm90IGxvb2tlZCBhdCB0aGUgVENQTSBwYXJ0IG9mIHRoZSBwYXRj
aCBpbiBkZXRhaWwsDQo+IEknbSBub3Qgc3VyZSB0aGF0IHBhcnQgaXMgY29ycmVjdC4NCg0KWWVh
aCwgdGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KQmVzdCBSZWdhcmRzLA0KWHUgWWFuZw0KDQo+IA0K
PiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCj4gDQo+IA0KPiANCj4gPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogTGkgSnVuIDxqdW4ubGlAbnhwLmNvbT4NCj4gPj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4gICBkcml2
ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpLmMgfCAzIC0tLQ0KPiA+Pj4+Pj4gICBkcml2ZXJzL3Vz
Yi90eXBlYy90Y3BtL3RjcG0uYyAgfCA2ICsrKysrLQ0KPiA+Pj4+Pj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jIGIvZHJpdmVycy91c2Iv
dHlwZWMvdGNwbS90Y3BjaS5jDQo+ID4+Pj4+PiBpbmRleCBmYzcwOGMyODlhNzMuLjg4NTU5ZTc0
OTEyMCAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2ku
Yw0KPiA+Pj4+Pj4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jDQo+ID4+Pj4+
PiBAQCAtMTc1LDkgKzE3NSw2IEBAIHN0YXRpYyBpbnQgdGNwY2lfc3RhcnRfdG9nZ2xpbmcoc3Ry
dWN0IHRjcGNfZGV2ICp0Y3BjLA0KPiA+Pj4+Pj4gICAgICAgc3RydWN0IHRjcGNpICp0Y3BjaSA9
IHRjcGNfdG9fdGNwY2kodGNwYyk7DQo+ID4+Pj4+PiAgICAgICB1bnNpZ25lZCBpbnQgcmVnID0g
VENQQ19ST0xFX0NUUkxfRFJQOw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IC0gICAgIGlmIChwb3J0X3R5
cGUgIT0gVFlQRUNfUE9SVF9EUlApDQo+ID4+Pj4+PiAtICAgICAgICAgICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsNCj4gPj4+Pj4+IC0NCj4gPj4+Pj4+ICAgICAgIC8qIEhhbmRsZSB2ZW5kb3IgZHJw
IHRvZ2dsaW5nICovDQo+ID4+Pj4+PiAgICAgICBpZiAodGNwY2ktPmRhdGEtPnN0YXJ0X2RycF90
b2dnbGluZykgew0KPiA+Pj4+Pj4gICAgICAgICAgICAgICByZXQgPSB0Y3BjaS0+ZGF0YS0+c3Rh
cnRfZHJwX3RvZ2dsaW5nKHRjcGNpLCB0Y3BjaS0+ZGF0YSwgY2MpOw0KPiA+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jIGIvZHJpdmVycy91c2IvdHlwZWMv
dGNwbS90Y3BtLmMNCj4gPj4+Pj4+IGluZGV4IDNjNmIwYzhlMmQzYS4uNmFhNjIxMzJlNjlhIDEw
MDY0NA0KPiA+Pj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BtLmMNCj4gPj4+
Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jDQo+ID4+Pj4+PiBAQCAtNDI3
NCw3ICs0Mjc0LDExIEBAIHN0YXRpYyB2b2lkIHJ1bl9zdGF0ZV9tYWNoaW5lKHN0cnVjdCB0Y3Bt
X3BvcnQgKnBvcnQpDQo+ID4+Pj4+PiAgICAgICAgICAgICAgIHJldCA9IHRjcG1fc25rX2F0dGFj
aChwb3J0KTsNCj4gPj4+Pj4+ICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+ID4+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgdGNwbV9zZXRfc3RhdGUocG9ydCwgU05LX1VOQVRUQUNIRUQs
IDApOw0KPiA+Pj4+Pj4gLSAgICAgICAgICAgICBlbHNlDQo+ID4+Pj4+PiArICAgICAgICAgICAg
IGVsc2UgaWYgKHBvcnQtPnBvcnRfdHlwZSA9PSBUWVBFQ19QT1JUX1NSQyAmJg0KPiA+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICBwb3J0LT50eXBlY19jYXBzLmRhdGEgPT0gVFlQRUNfUE9S
VF9EUkQpIHsNCj4gPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICB0Y3BtX3R5cGVjX2Nvbm5l
Y3QocG9ydCk7DQo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgdGNwbV9sb2cocG9ydCwg
IktlZXAgYXQgU05LX0FUVEFDSEVEIGZvciBVU0IgZGF0YS4iKTsNCj4gPj4+Pj4+ICsgICAgICAg
ICAgICAgfSBlbHNlDQo+ID4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgdGNwbV9zZXRfc3Rh
dGUocG9ydCwgU05LX1NUQVJUVVAsIDApOw0KPiA+Pj4+Pj4gICAgICAgICAgICAgICBicmVhazsN
Cj4gPj4+Pj4+ICAgICAgIGNhc2UgU05LX1NUQVJUVVA6DQo+ID4+Pg0KPiA+DQoNCg==
