Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C7764E755
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 07:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiLPGk5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 01:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiLPGk4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 01:40:56 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49D113E84
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 22:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWVmbJPzjawUI3/uI9RuXGR9QXhqOmiZzUyrdbHeQJ9VWJJS9r4YzxMLMnfRsYQUJPJspnwNsIJVhLsYskg8tgL3Upu5zC1pND8fwnw6Igq5z4R+BryshXvGX16jSIg68s9z4NCp23TNwL06lbrPnaYCAyB0ERIAHsLF2AXSVJ95PvrdGVu066SoRSpsihv8X6iKwhgqprTLrVG1DXlOUVVKsQ4RQpnJFVwqn1shg96gMhaASe0wm213nDw2HBpkR0kdXzXSs5hhi38o8eD8a0LJd7YmkaoPuTTt3ZdC4qDtOuU/j/ZjCx/iZ32fMr3Ne/62CK5n1qG2uJ71g9oKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXTQ2gMO58mY8wl1DFsq61FjqgJp8FMA2uyQtyEWe2o=;
 b=GIeoLVwBJEEcCjsOitHHwkuP42I2A/00yrEIq6WJhD96Uc7ejcbMoODVe/VQPuuyVbTdFjduFZK2qbeonjaamNMGX6FnKnPa05+Kr64pqbFV5AicK8iBWV5mr7AqsTHaKQe68xQNY/L/ot2Np5BbYt3vR3DAOkUPpyOf5Xh4RLckWUIqWh5VKYO4tD+3pWtTA2MffFEgwJdAZJ8oXVRCdBT5Lqf8W7gCFjICkjyHRt4DEbSeooTku2ZNdXLJeNbK+dA2IS3fg72LwyQ0Ess2zuWU1ojA7y9fLcWsYuKVOqgOuD4D1zShsT5afYN7KKJ4KPcYxonWwhh60MtqTSp5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXTQ2gMO58mY8wl1DFsq61FjqgJp8FMA2uyQtyEWe2o=;
 b=NwfsBcf1b1tbE3v8xo4IISvrAtgS23ssW/0wtFFvNCS7er3fdZtuxp1LvwGPu6jcgxIvzxaCfV+Da2d5k4YQDbJNiYIn4niQ+R3C7mv9mY3I7zby4L99RqAu4dviJgELTWO8oDRxX1RP+hp0R0EFxTIl8p1qK/A+OTpSIB/yhEQ=
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 06:40:52 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%5]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 06:40:52 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Thread-Index: AQHZEP7hbKNmhhpCvEyFs9PZaT80zK5v+DIAgAAKJQA=
Date:   Fri, 16 Dec 2022 06:40:52 +0000
Message-ID: <PA4PR04MB959190B619279B290630D8018CE69@PA4PR04MB9591.eurprd04.prod.outlook.com>
References: <20221216033150.2683718-1-xu.yang_2@nxp.com>
 <acf0485c-8061-ef12-83d9-c3b22dc235ad@roeck-us.net>
In-Reply-To: <acf0485c-8061-ef12-83d9-c3b22dc235ad@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9591:EE_|PAXPR04MB9351:EE_
x-ms-office365-filtering-correlation-id: 29ae67e7-3059-4b59-e181-08dadf3079da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DMwFg0YWepLyB0MZ+Hh03tKR0K5cjvBvQpBjwps88BbmgUnPhnKryzKBR/VrdKitnbTRgKsc/TEj196ZwuX41gFAyN68BYlr9WdOGEHBikhCpIv0TXOUsHPCSTGLw771p2OwKZZ+1ZlgKEWxT2WKSqaxlFmi0r5PRD8J2H62EYq1RXMhALEqf4UrRtWdj5rNXIcL/qUSIUKmo8XPKbgZyNkVXF0q0aXanVNVueELzBVfha6yPSbHlEIZjhIHGzdVKq6vtKBwEdei+oZMPbPSNzwjLf3L+L1p1IEPx/w5lwJ5B+c3oWmr+xjJG/C+mcC+T4pe5N1lXBRRMgSwGa3O+If2HXprY/K1osZ0YnioEeTo/6i2uPjuLbrWUjio+K4SZ9VbSL0bAGwPIJhW4OAPPURxNspmHMgchDJw5CqXHktZVBIaRmgzzuR3gdl45T5i2sroklVx5TvRgi1aksqtTQLs1Q4stUL9Bke9jWMHpg0O+NIJ0M+BqMhNOZPv3zHlfAh7cLM6TBvAZJsAUKcGPuMkDXzUp+LbuA/7fgmhBwBF1u2zEr3ADl2uo2/gKvcRbi8kRzJhNtZQGqmXRoXpJJo7UOK3jrT0SAYsAyoAgi0GwecqHlh1juq6Olf326li5WIvMjSX4tLput9qBD9apxw5pyot12xuj4N7itRLwj3S2Mv7efifPy+0i9fROtgT7B7F9DZGOQnGi0UBja+Aaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199015)(38070700005)(186003)(38100700002)(5660300002)(9686003)(26005)(33656002)(316002)(55016003)(122000001)(71200400001)(54906003)(478600001)(110136005)(64756008)(41300700001)(66556008)(2906002)(66946007)(52536014)(66476007)(8676002)(83380400001)(4326008)(76116006)(66446008)(8936002)(53546011)(6506007)(86362001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkpWa3BvV2Ridzd0THZQR0g4N29SNUMvY3pZbklXYVQydGhnVUJYRnl0VTJG?=
 =?utf-8?B?b3Jta0dYNFJZUTlHdDZwMmhJZG43dHJQcTdTMGVveVhOLzJIS3k1MjRnRmJF?=
 =?utf-8?B?V2thOUd2cERkR1pKaEtSOEU3K3JjM2NzQ1lVK3k4RFRydEJwVmJRdFZXQkJF?=
 =?utf-8?B?Vzd5ZmdkTWtMN2NwcnBicHlOeXU1Q2tjVFBKbk5RK2R3TWVsMWNRanF6OW9h?=
 =?utf-8?B?ZWpIaGsvd3N5eUUwOEFMMlNtTkVsQi9hblcycmVlVTdzWGZwQ1JQNEFhQ1ls?=
 =?utf-8?B?SGZ6SlN1RTlqai9XbDVmU1V1ZUVtTytuYm1tYzBlWVNGTGcwcWNhelR3Q05S?=
 =?utf-8?B?U1IwazY4NkdHVnQvZVdKQUJLMWs5UWdIN3FJd1NkTmwwbmRGQlQyenA1WTc3?=
 =?utf-8?B?TmR0SmVUZUtLUG1ObXRmMS9ENGFEelR1VjczdjFKZXVScG9acFp2cCtVaWdX?=
 =?utf-8?B?TEtSVHBuaEhyTXAwMHhwSUk3VVBvNHYvdmM2SXd2NE9mS2l4eWUzZUZYZ1BQ?=
 =?utf-8?B?K0F0RUtCWFU3WXhyVE5PbVJSTlNMRkt1dWo1QVFGU1VvaWM5c29DS1dLa0tm?=
 =?utf-8?B?RnV3V0RNL05CUHpRc1JwOTMwM3BkU3haOEZ0RnlobktHL2FJTGROOW8vYzlu?=
 =?utf-8?B?M2pkSTM1MlVLZkVyYVJDZkdCR3Z3Vk80TGFjRHdmUk9zajhxME9vQWkwNGVB?=
 =?utf-8?B?emlQaVVTY0svNkZJdllaSE16YWZ1QStHZVd1Ym9Eb2VnR3lUdnFTSEVza1NO?=
 =?utf-8?B?VmFUV2VNRE16K0xXM2s0NndSL3N2UHJ2bTVNRm96WFU0Q0NoWDMyV0hXZmlT?=
 =?utf-8?B?OVRvTTRyT0tQcXNSVXJEOUxrekhUVTdwVEpvRXI5OVgrTFYzV3lxWEt5eTFD?=
 =?utf-8?B?U1dZbTkzbVkzd2poOTV2dXZkSWJheng0aUFNVzZzSEdBTFdUM29QY3QvRjIr?=
 =?utf-8?B?UDVoTlBtZ2h0UUdxT3p1NytFN3piQ3ZNMG5BeE54cmlDdHNmYWM0T0pnRy9r?=
 =?utf-8?B?ZlJOZUVZcU84WGVjK1lvak45Y1QxY3lMeDV5eGtFK3FWeDFMNW5DazNJTHVU?=
 =?utf-8?B?V3U4aml4eTJxOTBHSHQyQ21IdWtUYld2dXlreG42SHQ4ZjU4cUh4SWxuaDdI?=
 =?utf-8?B?L3VpTnRkU3hmU1ZKd2luNXVIZEJFWTYyZ2szV3ZWb2JSUnBZc1lnMlpFaXov?=
 =?utf-8?B?L0RLRWdBOVFSMURzR2l0MW1ucWZFY0FhNUxqUEFYeVRCanZlWlFYYlZGZU5C?=
 =?utf-8?B?d3pab2xvUmIvd2owTVBiVkVGclJKSEs3dVZQYTJWTVFYRktuUkdiMzZ4VXFZ?=
 =?utf-8?B?VC9XTEpaNjRYMEI1MjdSbWt4Z3N4aVZTdm5WWldEYzN4TlF4YVNJeG1XSHFV?=
 =?utf-8?B?V3c3RzFYTGpFY1YrMVNpTnlQNjFleWI5VmZ0WmpVREcyaTQxV1RodklaMGVr?=
 =?utf-8?B?NnA4SzRRRGduWktOTU83OHR5Rm5NZ0loM3J2TmI2Tld5aEJkemxIOHg4Qi9z?=
 =?utf-8?B?d1VKcWl2djNweWJvdGtVS3hvYW15OXhNK2YvaloxYjNDVG1TbUN4VUdITDE4?=
 =?utf-8?B?SFU5eERBVi9aMytKVFFqUWVPSDNXeVdUd0d4bFArVElxS0pjK0MzdzhHR0p1?=
 =?utf-8?B?OENyd3EwZ1B1d0syVitiT2VHSnJBdklMNHRjU3oyalVMZVpwQWk2SEVKbS92?=
 =?utf-8?B?NWd5ZEdGbithWDNtUW5KYk9WaG05K3AzMUVzM1g3eXVuQ2FOcWNEcGdUbDFl?=
 =?utf-8?B?TU1JNVJVNmRlWXphS0ZRanRCK3dpMHdtdzYwVTQzR0FoNjlZcnRYZnFlc2dX?=
 =?utf-8?B?WEdtWWF5bm0yb2hqSHE0ZzNnaUx2ZURSdTJ3SS9jSjBUZkRBTlNaa1MvN0Y4?=
 =?utf-8?B?TitZUmZscUsxZUU2SEh0ZHc1WmRONXdvSUNkbk5DTmtLeFJrSjFGNk80MmZL?=
 =?utf-8?B?QVBTMlQ0MFltQVBQdDZQSURVb0U4V04vYWgrRnJjZzFqYkZieXZJRkJxK1ZS?=
 =?utf-8?B?cjFLRXJaWmhGTVdTalE1Vmd3NUFYNXJqM0NqK0FMRUhONFcyZnhoWUNtSFU1?=
 =?utf-8?B?bkR3Mk54YXFQRW5CWVo3Y0s1eFFWRGx0SDNSenFySXZSQkZFN0Y0MjRFUmww?=
 =?utf-8?Q?gObg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ae67e7-3059-4b59-e181-08dadf3079da
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 06:40:52.2002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLmBObWhT3ki4FilC0SP3AIJMMq3LPkbjALxy5zAoKJHE03rVWgxkLkd0qNWZDc23j6DFgWI67wodbFJyyuWug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9351
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVu
dGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sN
Cj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxNiwgMjAyMiAxOjEzIFBNDQo+IFRvOiBYdSBZYW5n
IDx4dS55YW5nXzJAbnhwLmNvbT47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20NCj4g
Q2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3Jn
OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgSnVuIExpIDxqdW4ubGlAbnhwLmNv
bT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSF0gdXNiOiB0eXBlYzogdGNwbTogZml4IGNy
ZWF0ZSBkdXBsaWNhdGUgc291cmNlL3NpbmstY2FwYWJpbGl0aWVzIGZpbGUNCj4gDQo+IENhdXRp
b246IEVYVCBFbWFpbA0KPiANCj4gT24gMTIvMTUvMjIgMTk6MzEsIFh1IFlhbmcgd3JvdGU6DQo+
ID4gQWZ0ZXIgc29mdCByZXNldCBoYXMgY29tcGxldGVkLCBhbiBFeHBsaWNpdCBDb250cmFjdCBu
ZWdvdGlhdGlvbiBvY2N1cnMuDQo+ID4gVGhlIHNpbmsgZGV2aWNlIHdpbGwgcmVjZWl2ZSBzb3Vy
Y2UgY2FwYWJpbGl0eXMgYWdhaW4uIFRoaXMgd2lsbCBjYXVzZQ0KPiA+IGEgZHVwbGljYXRlIHNv
dXJjZS1jYXBhYmlsaXRpZXMgZmlsZSBiZSBjcmVhdGVkLg0KPiA+DQo+ID4gQW5kIHRoZSBrZXJu
ZWwgd2lsbCBkdW1wOg0KPiA+IHN5c2ZzOiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFt
ZSAnL2RldmljZXMvdmlydHVhbC91c2JfcG93ZXJfZGVsaXZlcnkvcGQxL3NvdXJjZS1jYXBhYmls
aXRpZXMnDQo+ID4NCj4gPiBUaGlzIHdpbGwgdW5yZWdpc3RlciBleGlzdGluZyBjYXBhYmlsaXRp
ZXMgYmVmb3JlIHJlZ2lzdGVyIG5ldyBvbmUuDQo+ID4NCj4gPiBGaXhlczogODIwM2QyNjkwNWVl
ICgidXNiOiB0eXBlYzogdGNwbTogUmVnaXN0ZXIgVVNCIFBvd2VyIERlbGl2ZXJ5IENhcGFiaWxp
dGllcyIpDQo+ID4gY2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91
c2IvdHlwZWMvdGNwbS90Y3BtLmMgfCA2ICsrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL3Rj
cG0vdGNwbS5jIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BtLmMNCj4gPiBpbmRleCA5MDRj
N2I0Y2UyZjAuLjAyZDhhNzA0ZGI5NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi90eXBl
Yy90Y3BtL3RjcG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jDQo+
ID4gQEAgLTIzNzEsNiArMjM3MSw5IEBAIHN0YXRpYyBpbnQgdGNwbV9yZWdpc3Rlcl9zb3VyY2Vf
Y2FwcyhzdHJ1Y3QgdGNwbV9wb3J0ICpwb3J0KQ0KPiA+ICAgICAgIGlmIChJU19FUlIocG9ydC0+
cGFydG5lcl9wZCkpDQo+ID4gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwb3J0LT5wYXJ0
bmVyX3BkKTsNCj4gPg0KPiA+ICsgICAgIC8qIHJlbW92ZSBleGlzdGluZyBjYXBhYmlsaXRpZXMg
c2luY2UgZ290IG5ldyBvbmUgKi8NCj4gPiArICAgICB1c2JfcG93ZXJfZGVsaXZlcnlfdW5yZWdp
c3Rlcl9jYXBhYmlsaXRpZXMocG9ydC0+cGFydG5lcl9zb3VyY2VfY2Fwcyk7DQo+ID4gKw0KPiA+
ICAgICAgIG1lbWNweShjYXBzLnBkbywgcG9ydC0+c291cmNlX2NhcHMsIHNpemVvZih1MzIpICog
cG9ydC0+bnJfc291cmNlX2NhcHMpOw0KPiA+ICAgICAgIGNhcHMucm9sZSA9IFRZUEVDX1NPVVJD
RTsNCj4gPg0KPiA+IEBAIC0yMzk0LDYgKzIzOTcsOSBAQCBzdGF0aWMgaW50IHRjcG1fcmVnaXN0
ZXJfc2lua19jYXBzKHN0cnVjdCB0Y3BtX3BvcnQgKnBvcnQpDQo+ID4gICAgICAgaWYgKElTX0VS
Uihwb3J0LT5wYXJ0bmVyX3BkKSkNCj4gPiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBv
cnQtPnBhcnRuZXJfcGQpOw0KPiA+DQo+ID4gKyAgICAgLyogcmVtb3ZlIGV4aXN0aW5nIGNhcGFi
aWxpdGllcyBzaW5jZSBnb3QgbmV3IG9uZSAqLw0KPiA+ICsgICAgIHVzYl9wb3dlcl9kZWxpdmVy
eV91bnJlZ2lzdGVyX2NhcGFiaWxpdGllcyhwb3J0LT5wYXJ0bmVyX3NpbmtfY2Fwcyk7DQo+ID4g
Kw0KPiA+ICAgICAgIG1lbWNweShjYXBzLnBkbywgcG9ydC0+c2lua19jYXBzLCBzaXplb2YodTMy
KSAqIHBvcnQtPm5yX3NpbmtfY2Fwcyk7DQo+ID4gICAgICAgY2Fwcy5yb2xlID0gVFlQRUNfU0lO
SzsNCj4gPg0KPiANCj4gU2hvdWxkbid0IHVzYl9wb3dlcl9kZWxpdmVyeV91bnJlZ2lzdGVyX2Nh
cGFiaWxpdGllcygpIGJlIGNhbGxlZCBmcm9tDQo+IHRoZSBTT0ZUX1JFU0VUIHN0YXRlIGhhbmRs
ZXIgPw0KDQpBbHRob3VnaCB0aGlzIGlzc3VlIGlzIHRyaWdnZXJlZCBieSBzb2Z0IHJlc2V0IGV2
ZW50LCB0aGVyZSBpcyBhbHNvDQpvdGhlciBwb3NzaWJpbGl0aWVzIHdoaWNoIG1heSBwcm9kdWNl
IHRoaXMgYmVoYXZpb3IuIFN1Y2ggYXMgcmVjZWl2ZWQNCjJyZCBzb3VyY2UgY2FwYWJpbGl0eSBv
ciB1c2UgR2V0X1NvdXJjZV9DYXAgbWVzc2FnZS4gSXQncyBhIGR5bmFtaWMNCnByb2Nlc3MgZXZl
biBhZnRlciBzb3VyY2Uvc2luayBpcyByZWFkeS4gU28gSSB0aGluayBpdCdzIGJldHRlciB0byBo
YW5kbGUNCml0IGluIHRjcG1fcmVnaXN0ZXJfc291cmNlL3NpbmtfY2FwcygpLiBOb3Qgc3VyZSBp
ZiB0aGlzIGlzIHJlYXNvbmFibGUuDQoNClRoYW5rcywNClh1IFlhbmcNCg0KPiANCj4gR3VlbnRl
cg0KDQo=
