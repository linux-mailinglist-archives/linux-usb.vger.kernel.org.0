Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2DD665516
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 08:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjAKHV7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Jan 2023 02:21:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjAKHV5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Jan 2023 02:21:57 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2083.outbound.protection.outlook.com [40.107.8.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E86763C4
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 23:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnSpj4DFNf1gWUpdjisChPhwqlLhikQstIs4DR4CqF008rHnRQgsQr1l9eYTeIHOlcgGdomIYh3a/4D8litZkXEz94B0C9i6UpXVAwuLSgevItrH+DlaPxO6aB31xPqdG/317/r7NvVAbOiLyfMd0ucWSDUNoyASvrZoUF5P3P3Vmpbf2FzvU9uhCKlN9E+SljYCAuOECJEo+gssmQZFWuiERXMcH3C6tfSWb662lNd0J8vfQ04m1QFmNTiU5VGZUY9CP09WJFin9qzc9lyFDNmXxnl6Xy0XoHd/M8qGm6oBqbUqX6cheAPqxSWNZBAAcDVIs1d9ZMvXifuRsQoP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSCd54WOVifNJ4M9VgGwyCXXQGyEQgxuSwq8kfFyqig=;
 b=HVX6u7X74I/8vJhbbECoAI1NnQsNSY5pmKoPZFd0wRp03LLfsQRaJFAQo0JkUGZi6kjvqA79eOkvpgLNTY6eexwwvQ+oKOtUGeU9Mc79YUjW2n7yaBP66DB7OJI3RmdOjE4kGmsNfaTQhX+spHTncHUkO6dyJGOOnCTtaudyv5k9s2wG7KrlZFnGIVPtMKdq1oNXDE1A6zs8aNFyzQKUUOA7hLkmfiRIueqVsk7NfaEiYRL82mN/+4pW+3tGhbr4QgWU4owylP75W4mzSYIXCThIqcm28u5GLzKYUlAaEN3EZEIhbfnG/Nrfmu/tlwyeJ4DzYecgO2/nz7urwar8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSCd54WOVifNJ4M9VgGwyCXXQGyEQgxuSwq8kfFyqig=;
 b=B+OaBiahSfS8HpJAnRjeydSlQCg3LMYBml30VP7v+oSR/5i2HNGlo+7cDHCOUbkf+IXGDZeyUkGQXdURIySQO52H78CNv4tBcQGM4GUDHCXsE2lXNq4byl923ADISDHeMy9JQW1Qp1m4eneGMmfNAMPQZAVZF/ywvPyZo86DUhg=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AS8PR04MB9173.eurprd04.prod.outlook.com (2603:10a6:20b:448::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 07:21:52 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::2b62:f63c:797a:b7b9%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 07:21:51 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: RE: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Topic: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Index: AQHZIbEr2/jvbCt1nECnl7W1DJIpla6VavjQgAAKK4CAAxQDkA==
Date:   Wed, 11 Jan 2023 07:21:51 +0000
Message-ID: <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
 <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
In-Reply-To: <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|AS8PR04MB9173:EE_
x-ms-office365-filtering-correlation-id: 0dd5c993-f51e-4137-6f0e-08daf3a482af
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H75mNZA94BJOjRlVSHGW6uDi2MvuJkmy8ucRIpPFi3NQwBqQydCa24OVo6xnzIGwA/4nVpwvGN2bPFtoKZNbKqkJH2CDhXCXBwo7JXIHbLqun43AVUKDrmHFU4e3D8gfsKXz1ikEVVD1y/kX/v/LNpiowu2A2lEs0pD129/DTcaXMGy/vNE1UkxcL2wR5ZBDflOjSrzGLtG8PqdBOWrTTOg+EZ8h0JvKx6Smm2o33sz7lc0Tn+moNMN67DvMFH7U/msbTztQzJjbDYOyKokBagwoVnXtsyIUXM8X6oYcG+jW8j96J6Ef4Mqc+A7zpLl8Kae679eZVQG2DL94zNn6odmZ2b1tEcJTmJlwRealcU5ocVzus0AkQZlSBlwnjwmwauFU+R6EigZN60M8OZXqM496yFeTjEndB4y5Ge2MyXDRmLQRl1FJyPMt4iyRFjKedpDh7RjXfVFFB9mySgXVpGfrYPp1njCtA2m+766cvS36wm+kWFwcbf4KC8DCG912POFNEqQUrDWfkXTk8MxoPCb/Z0PWrzp6xdfEJ9+N+KtFxflEMw5BYhiRFttTLMUKdvnGae/tGpaL1xkjmHQvZWNbeyqaR1mPzU7y3EWbFMxS7xbc5OK6cHpSAbIfQO9v4L2qV+Lq950mbSFgQhM5CMX4Axs4vp/m/wA93yeKeWiSTRV10lR2aa1exuNdFyN+G9kW1h+dz2lIcYAKhbE5hA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(52536014)(66946007)(41300700001)(2906002)(8936002)(5660300002)(8676002)(76116006)(66446008)(66476007)(64756008)(66556008)(316002)(7696005)(71200400001)(54906003)(110136005)(478600001)(6506007)(53546011)(33656002)(4326008)(55016003)(9686003)(186003)(26005)(83380400001)(86362001)(38100700002)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0ROKzdFOTAxZWNMUkxxelJHM0VXbzJWRmN2UVkrcVlSNThvdXk4TXc0S1F0?=
 =?utf-8?B?R3BqY0Q1T29oUEJwQ3UzU3dReWlNdWJCMkJYU0dTOWVxeElrSXpHZXdpZlZr?=
 =?utf-8?B?S0ZzbGdGbkptU0FLcm9hR2wwMnpRaytjeUVQWWVvL2RENHhpaTNMQWR0TzBY?=
 =?utf-8?B?Q0NxUzJSU2tXZ251d0VydjJXZGJjbGlMK012T3d4WXRDbUg5RDFteEx2cHBY?=
 =?utf-8?B?VnQ3MTV4ZTJEQ25KZStUcFViZWVlSEI0N1R3Zko5aHBRT3A2MnowNURtNTBu?=
 =?utf-8?B?T091ZHptdGY3aEtUUVZYdk5keFBLWjY3Tmk5L29TMmd2dzJuckhLa2xxSTRp?=
 =?utf-8?B?a3B3UmxkMU1HZmxwc3lQaWpNemo4SncyenhLWUYxT3VMSzdZQVRDNUhNS3I5?=
 =?utf-8?B?TnQ5NWE0T3NkTEZLWVYyUW5FNjJmQkltS0NKNmU2SExteWlLSWhXcEVnNWNI?=
 =?utf-8?B?ekRvY3Z4enBZL1NwRERSVU5OS2hQbDUyRy8xOTlnMFFCaEVSc0Z5SGpLeW1L?=
 =?utf-8?B?ZER5RU0yM2ptTGl6QUg5WnFMbnJiMDRwYVE0SnI5VGZQNWtKcVE1eXNzWlds?=
 =?utf-8?B?U2VkekpkWnFVMmxNUmNlSEZjZ1dLNVN6MXluTmZBWXhTN0t6c0tqT0dtZnVl?=
 =?utf-8?B?NmJ3WklyNHA1bkc0MUx0WTM3clZ6aU0vQ2d0WWNWZXBoVDZKeWR3UW1NSEk0?=
 =?utf-8?B?cndMeHB6ZjYrRnlvQTdiSDJCSlBDMlNKeEI4TWpIejNWdXp1TnVKblNaYmpV?=
 =?utf-8?B?alFrQzdQVFMzU2dDRlh2TUdUc09MbHRYZWFxNUdEMW1JcjJmMmtjNjZFWjZh?=
 =?utf-8?B?ZTkrblIxMlJWVU45OGJCWXEzNzNMZitKUjgzRVdvNHRKKy9PbW1tNis3NDNL?=
 =?utf-8?B?VWRTaVIyU2xmSUNjMTdyWng5Ujk4bHlLS1lxbXl3TVNiRWc0S2ViNWRCNE9x?=
 =?utf-8?B?ZzlKdE9NSitmamVYRjdJc0pZU29jNURrUnhJNDZpQnN5c1pRWkwrSzlhWk5X?=
 =?utf-8?B?eE5MbGhzVmhNLzNBZGxrLzhXMUZ4M2FmazRXRDYxb2ZGYjhlQ3JPbHFySnlx?=
 =?utf-8?B?M3FUNm1leUQxYjJJVzJSUVJMaisyUTQxY1BSVjZMYWRlaVREdjl0YVBsTG5s?=
 =?utf-8?B?MjhSRURhZ3RwdFFzeFhVUHJFUFFzdWdiMXl6dzJCdXd5REFJNHpRRUJKekNG?=
 =?utf-8?B?K3JlQllsM0RqRVpGWWNuMlExVjRHeDU4QTRndU91ZDRiQmthaWxKbEVlbEtL?=
 =?utf-8?B?RnUrWW02R3k5WUZwUXZSbS90aFc5ck9KWm5JTHBjSFh0Wlo2U2JDdzZVUjhZ?=
 =?utf-8?B?cWU4OG1KYTNvL1luci8xdDkvK2syMEdVZ1haaDdFakJ6YUhHTks2bTNiSmR3?=
 =?utf-8?B?aXlaVWE3b0c1eEplcGtyeXlnNWh4ckR3WnMzVVpaeENydmsvcGY4cHRXTS83?=
 =?utf-8?B?KzRqVlZKNUd6RXB6SG8zWlJYUXdweG43Y1pCM1pUYlBKY2tpVVVFMUF1eUor?=
 =?utf-8?B?cmtRakVTU1lQd0Y2YVR0WmQ0N0ltempoK1hNRktiLzhjMG9FNC80WVNkQWpl?=
 =?utf-8?B?Ym5lZkNRRURkSGk2ai9QSEJrMEtQTzRRNmFNK0FKN3FtcDMxbmpEZmZUc3BB?=
 =?utf-8?B?VTZaOHNWS21rUUF1ZDhBMEw2K2I1R21KK3UzZFVCelhIYWtvZXJWQ3EvbXcy?=
 =?utf-8?B?cS9DTy9MR3lDbklmQ0VKOXQyQmdGT0crWGdZVGd6MHk4c2hxbTM1NGcycndp?=
 =?utf-8?B?YUtmZWQvUWV5YWJBVGxYd012NHoxSXdveW1FN3hQdVFxbHBkYzlaWlFmV0s0?=
 =?utf-8?B?N1J2c25WN0JFYUJLenJXSGRhakovYUZISEg1WTdFUHE0Nm02MTlhZkNNRm1t?=
 =?utf-8?B?Q1ZHUW5uOVc1d244YmowNzVBcDF4cEp2WmJOVFpTM3JBeFlPQzlzOFBFUXBr?=
 =?utf-8?B?dWpuLzJaY0cxSFh0a1J2aXZrNzg4TDZ6ZXhoUWZHN3RSZDJMZ3N4Q0NJMjBt?=
 =?utf-8?B?SDZyWWo4N29rOTdGR2thUzNQamI1TFk0Zll2aFR5YTYxc1l3V0xnWmVmTnph?=
 =?utf-8?B?TG9hcnJwU1RPblNqNU9TYmY3enRkeWtBUlA3Vm5pelptWjRkbXJXWUcyVmVM?=
 =?utf-8?Q?54Dg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd5c993-f51e-4137-6f0e-08daf3a482af
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 07:21:51.8755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rMElL+uEb1P0qMIFxbZBNi1Y8Jm1Z684isOp2Cj53DFZGWFtivO3eXbTUZOr8h5R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9173
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGlueXUgWXVhbiA8cXVp
Y19saW55eXVhbkBxdWljaW5jLmNvbT4NCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDksIDIwMjMg
MTE6NDIgQU0NCj4gVG86IEp1biBMaSAoT1NTKSA8anVuLmxpQG9zcy5ueHAuY29tPjsgR3JlZyBL
cm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFRoaW5oIE5ndXll
biA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5l
bC5vcmc7IEphY2sgUGhhbSA8cXVpY19qYWNrcEBxdWljaW5jLmNvbT47IFdlc2xleQ0KPiBDaGVu
ZyA8cXVpY193Y2hlbmdAcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSB1
c2I6IGR3YzM6IGFkZCBkd2MzX3JlYWRsX25vdHJhY2UoKSBmdW5jdGlvbg0KPiANCj4gDQo+IE9u
IDEvOS8yMDIzIDExOjMzIEFNLCBKdW4gTGkgKE9TUykgd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogTGlueXUgWXVhbiA8cXVpY19saW55eXVh
bkBxdWljaW5jLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDYsIDIwMjMgNToyMiBQ
TQ0KPiA+PiBUbzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz47IFRoaW5oIE5ndXllbg0KPiA+PiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gPj4g
Q2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IEphY2sgUGhhbSA8cXVpY19qYWNrcEBxdWlj
aW5jLmNvbT47DQo+ID4+IFdlc2xleSBDaGVuZyA8cXVpY193Y2hlbmdAcXVpY2luYy5jb20+OyBM
aW55dSBZdWFuDQo+ID4+IDxxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPg0KPiA+PiBTdWJqZWN0
OiBbUEFUQ0ggMi8zXSB1c2I6IGR3YzM6IGFkZCBkd2MzX3JlYWRsX25vdHJhY2UoKSBmdW5jdGlv
bg0KPiA+Pg0KPiA+PiBUaGVyZSBhcmUgbXVsdGlwbGUgcGxhY2VzIHdoaWNoIHdpbGwgcmV0cnkg
dXAgdG8gMTAwMDAgdGltZXMgdG8gcmVhZA0KPiA+PiBhIHJlZ2lzdGVyLA0KPiA+IEl0J3MgInVw
IHRvIiwgSSB0aGluayBhdCBub3JtYWwgY2FzZSwgaXQncyBhIHNtYWxsIG51bWJlciwgaWYgYSBs
YXJnZQ0KPiA+IEl0ZXJhdGlvbiBudW1iZXIgaXMgb2JzZXJ2ZWQsIHByb2JhYmx5IHRoZXJlIGlz
IHNvbWV0aGluZyB3cm9uZyBzaG91bGQNCj4gPiBiZSBjaGVja2VkPw0KPiBkbyB5b3UgbWVhbiB0
aGUgb3JpZ2luYWwgbG9vcCBjb3VudCBjYW4gYmUgcmVkdWNlZCA/DQoNCk5vLiBJIG1lYW4gdGhl
IG1heCBsb29wIG51bWJlciBpcyBub3QgYSBwcm9ibGVtIGF0IGdvb2QgSFcuDQpXaGF0J3MgdGhl
IGFjdHVhbCBsb29wIG51bWJlciBvbiB5b3UgSFc/IA0KDQo+ID4NCj4gPj4gd2hlbiB0cmFjZSBl
dmVudCBlbmFibGUsIGl0IGlzIG5vdCBnb29kIGFzIGFsbCBldmVudHMgbWF5IHNob3cgc2FtZSBk
YXRhLg0KPiA+Pg0KPiA+PiBBZGQgZHdjM19yZWFkbF9ub3RyYWNlKCkgZnVuY3Rpb24gd2hpY2gg
d2lsbCBub3Qgc2F2ZSB0cmFjZSBldmVudA0KPiA+PiB3aGVuIHJlYWQgcmVnaXN0ZXIuDQo+ID4g
U2ltcGx5IGRyb3AgcGFydCBvZiByZWdpc3RlciByZWFkIGlzIG5vdCBnb29kLCB0aGlzIGNhdXNl
IHRoZSBmaW5hbCBpbw0KPiA+IHRyYWNlIG9mIGR3YzMgaXMgbm90IGNvbXBsZXRlLCBJIHRoaW5r
IGEgZnVsbC9jb21wbGV0ZSBmb290IHByaW50IG9mDQo+ID4gaW8gcmVnaXN0ZXIgcmVhZC93cml0
ZSBzaG91bGQgYmUga2VwdC4NCj4gaWYgeW91IHByZWZlciBzYXZlIHRoZW0sIGlzIHRoZXJlIGEg
YmV0dGVyIHNvbHV0aW9uID8NCg0KSWYgdGhlIGFjdHVhbCBsb29wIG51bWJlciBpcyBub3QgYSBw
cm9ibGVtLCB0aGVuIEkgdGhpbmsgY3VycmVudA0KdHJhY2UgaXMganVzdCBmaW5lLg0KDQpMaSBK
dW4gDQoNCj4gPg0KPiA+IExpIEp1bg0KPiA+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IExpbnl1IFl1
YW4gPHF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMv
dXNiL2R3YzMvY29yZS5jICAgfCAgMiArLQ0KPiA+PiAgIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgfCAxMiArKysrKystLS0tLS0NCj4gPj4gICBkcml2ZXJzL3VzYi9kd2MzL2lvLmggICAgIHwg
MTAgKysrKysrKysrKw0KPiA+PiAgIGRyaXZlcnMvdXNiL2R3YzMvdWxwaS5jICAgfCAgMiArLQ0K
PiA+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgaW5kZXgNCj4gPj4gNDc2YjYzNi4uNTUwYmIyMyAxMDA2NDQNCj4g
Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gPj4gQEAgLTI5Nyw3ICsyOTcsNyBAQCBpbnQgZHdjM19jb3JlX3NvZnRf
cmVzZXQoc3RydWN0IGR3YzMgKmR3YykNCj4gPj4gICAJCXJldHJpZXMgPSAxMDsNCj4gPj4NCj4g
Pj4gICAJZG8gew0KPiA+PiAtCQlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19EQ1RM
KTsNCj4gPj4gKwkJcmVnID0gZHdjM19yZWFkbF9ub3RyYWNlKGR3Yy0+cmVncywgRFdDM19EQ1RM
KTsNCj4gPj4gICAJCWlmICghKHJlZyAmIERXQzNfRENUTF9DU0ZUUlNUKSkNCj4gPj4gICAJCQln
b3RvIGRvbmU7DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiA+PiBpbmRleA0KPiA+PiA3ODk5NzY1
Li5mMjEyNmYyNCAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
PiA+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4+IEBAIC05Nyw3ICs5Nyw3
IEBAIGludCBkd2MzX2dhZGdldF9zZXRfbGlua19zdGF0ZShzdHJ1Y3QgZHdjMyAqZHdjLA0KPiA+
PiBlbnVtIGR3YzNfbGlua19zdGF0ZSBzdGF0ZSkNCj4gPj4gICAJICovDQo+ID4+ICAgCWlmICgh
RFdDM19WRVJfSVNfUFJJT1IoRFdDMywgMTk0QSkpIHsNCj4gPj4gICAJCXdoaWxlICgtLXJldHJp
ZXMpIHsNCj4gPj4gLQkJCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0RTVFMpOw0K
PiA+PiArCQkJcmVnID0gZHdjM19yZWFkbF9ub3RyYWNlKGR3Yy0+cmVncywgRFdDM19EU1RTKTsN
Cj4gPj4gICAJCQlpZiAocmVnICYgRFdDM19EU1RTX0RDTlJEKQ0KPiA+PiAgIAkJCQl1ZGVsYXko
NSk7DQo+ID4+ICAgCQkJZWxzZQ0KPiA+PiBAQCAtMTI4LDcgKzEyOCw3IEBAIGludCBkd2MzX2dh
ZGdldF9zZXRfbGlua19zdGF0ZShzdHJ1Y3QgZHdjMyAqZHdjLA0KPiA+PiBlbnVtIGR3YzNfbGlu
a19zdGF0ZSBzdGF0ZSkNCj4gPj4gICAJLyogd2FpdCBmb3IgYSBjaGFuZ2UgaW4gRFNUUyAqLw0K
PiA+PiAgIAlyZXRyaWVzID0gMTAwMDA7DQo+ID4+ICAgCXdoaWxlICgtLXJldHJpZXMpIHsNCj4g
Pj4gLQkJcmVnID0gZHdjM19yZWFkbChkd2MtPnJlZ3MsIERXQzNfRFNUUyk7DQo+ID4+ICsJCXJl
ZyA9IGR3YzNfcmVhZGxfbm90cmFjZShkd2MtPnJlZ3MsIERXQzNfRFNUUyk7DQo+ID4+DQo+ID4+
ICAgCQlpZiAoRFdDM19EU1RTX1VTQkxOS1NUKHJlZykgPT0gc3RhdGUpDQo+ID4+ICAgCQkJcmV0
dXJuIDA7DQo+ID4+IEBAIC0yMzksNyArMjM5LDcgQEAgaW50IGR3YzNfc2VuZF9nYWRnZXRfZ2Vu
ZXJpY19jb21tYW5kKHN0cnVjdCBkd2MzDQo+ID4+ICpkd2MsIHVuc2lnbmVkIGludCBjbWQsDQo+
ID4+ICAgCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19ER0NNRCwgY21kIHwgRFdDM19ER0NN
RF9DTURBQ1QpOw0KPiA+Pg0KPiA+PiAgIAlkbyB7DQo+ID4+IC0JCXJlZyA9IGR3YzNfcmVhZGwo
ZHdjLT5yZWdzLCBEV0MzX0RHQ01EKTsNCj4gPj4gKwkJcmVnID0gZHdjM19yZWFkbF9ub3RyYWNl
KGR3Yy0+cmVncywgRFdDM19ER0NNRCk7DQo+ID4+ICAgCQlpZiAoIShyZWcgJiBEV0MzX0RHQ01E
X0NNREFDVCkpIHsNCj4gPj4gICAJCQlzdGF0dXMgPSBEV0MzX0RHQ01EX1NUQVRVUyhyZWcpOw0K
PiA+PiAgIAkJCWlmIChzdGF0dXMpDQo+ID4+IEBAIC0zNzUsNyArMzc1LDcgQEAgaW50IGR3YzNf
c2VuZF9nYWRnZXRfZXBfY21kKHN0cnVjdCBkd2MzX2VwICpkZXAsDQo+ID4+IHVuc2lnbmVkIGlu
dCBjbWQsDQo+ID4+ICAgCX0NCj4gPj4NCj4gPj4gICAJZG8gew0KPiA+PiAtCQlyZWcgPSBkd2Mz
X3JlYWRsKGRlcC0+cmVncywgRFdDM19ERVBDTUQpOw0KPiA+PiArCQlyZWcgPSBkd2MzX3JlYWRs
X25vdHJhY2UoZGVwLT5yZWdzLCBEV0MzX0RFUENNRCk7DQo+ID4+ICAgCQlpZiAoIShyZWcgJiBE
V0MzX0RFUENNRF9DTURBQ1QpKSB7DQo+ID4+ICAgCQkJY21kX3N0YXR1cyA9IERXQzNfREVQQ01E
X1NUQVRVUyhyZWcpOw0KPiA+Pg0KPiA+PiBAQCAtMjMyNCw3ICsyMzI0LDcgQEAgc3RhdGljIGlu
dCBfX2R3YzNfZ2FkZ2V0X3dha2V1cChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+PiAgIAlyZXRyaWVz
ID0gMjAwMDA7DQo+ID4+DQo+ID4+ICAgCXdoaWxlIChyZXRyaWVzLS0pIHsNCj4gPj4gLQkJcmVn
ID0gZHdjM19yZWFkbChkd2MtPnJlZ3MsIERXQzNfRFNUUyk7DQo+ID4+ICsJCXJlZyA9IGR3YzNf
cmVhZGxfbm90cmFjZShkd2MtPnJlZ3MsIERXQzNfRFNUUyk7DQo+ID4+DQo+ID4+ICAgCQkvKiBp
biBIUywgbWVhbnMgT04gKi8NCj4gPj4gICAJCWlmIChEV0MzX0RTVFNfVVNCTE5LU1QocmVnKSA9
PSBEV0MzX0xJTktfU1RBVEVfVTApIEBAIC0yNTEwLDcNCj4gPj4gKzI1MTAsNyBAQCBzdGF0aWMg
aW50IGR3YzNfZ2FkZ2V0X3J1bl9zdG9wKHN0cnVjdCBkd2MzICpkd2MsIGludA0KPiA+PiAraXNf
b24sIGludA0KPiA+PiBzdXNwZW5kKQ0KPiA+Pg0KPiA+PiAgIAlkbyB7DQo+ID4+ICAgCQl1c2xl
ZXBfcmFuZ2UoMTAwMCwgMjAwMCk7DQo+ID4+IC0JCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdz
LCBEV0MzX0RTVFMpOw0KPiA+PiArCQlyZWcgPSBkd2MzX3JlYWRsX25vdHJhY2UoZHdjLT5yZWdz
LCBEV0MzX0RTVFMpOw0KPiA+PiAgIAkJcmVnICY9IERXQzNfRFNUU19ERVZDVFJMSExUOw0KPiA+
PiAgIAl9IHdoaWxlICgtLXRpbWVvdXQgJiYgISghaXNfb24gXiAhcmVnKSk7DQo+ID4+DQo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2lvLmggYi9kcml2ZXJzL3VzYi9kd2MzL2lv
LmggaW5kZXgNCj4gPj4gZDkyODNmNC4uZDI0NTEzZSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVy
cy91c2IvZHdjMy9pby5oDQo+ID4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvaW8uaA0KPiA+PiBA
QCAtMzcsNiArMzcsMTYgQEAgc3RhdGljIGlubGluZSB1MzIgZHdjM19yZWFkbCh2b2lkIF9faW9t
ZW0gKmJhc2UsDQo+ID4+IHUzMg0KPiA+PiBvZmZzZXQpDQo+ID4+ICAgCXJldHVybiB2YWx1ZTsN
Cj4gPj4gICB9DQo+ID4+DQo+ID4+ICtzdGF0aWMgaW5saW5lIHUzMiBkd2MzX3JlYWRsX25vdHJh
Y2Uodm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zmc2V0KQ0KPiB7DQo+ID4+ICsJLyoNCj4gPj4g
KwkgKiBXZSByZXF1ZXN0ZWQgdGhlIG1lbSByZWdpb24gc3RhcnRpbmcgZnJvbSB0aGUgR2xvYmFs
cyBhZGRyZXNzDQo+ID4+ICsJICogc3BhY2UsIHNlZSBkd2MzX3Byb2JlIGluIGNvcmUuYy4NCj4g
Pj4gKwkgKiBUaGUgb2Zmc2V0cyBhcmUgYWxzbyBnaXZlbiBzdGFydGluZyBmcm9tIEdsb2JhbHMg
YWRkcmVzcyBzcGFjZS4NCj4gPj4gKwkgKi8NCj4gPj4gKwlyZXR1cm4gcmVhZGwoYmFzZSArIG9m
ZnNldCk7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gICBzdGF0aWMgaW5saW5lIHZvaWQgZHdjM193
cml0ZWwodm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgb2Zmc2V0LCB1MzINCj4gPj4gdmFsdWUpIHsN
Cj4gPj4gICAJLyoNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvdWxwaS5jIGIv
ZHJpdmVycy91c2IvZHdjMy91bHBpLmMgaW5kZXgNCj4gPj4gZjIzZjRjOS4uN2IyMjBiMCAxMDA2
NDQNCj4gPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy91bHBpLmMNCj4gPj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy91bHBpLmMNCj4gPj4gQEAgLTM5LDcgKzM5LDcgQEAgc3RhdGljIGludCBkd2Mz
X3VscGlfYnVzeWxvb3Aoc3RydWN0IGR3YzMgKmR3YywgdTgNCj4gPj4gYWRkciwgYm9vbCByZWFk
KQ0KPiA+Pg0KPiA+PiAgIAl3aGlsZSAoY291bnQtLSkgew0KPiA+PiAgIAkJbmRlbGF5KG5zKTsN
Cj4gPj4gLQkJcmVnID0gZHdjM19yZWFkbChkd2MtPnJlZ3MsIERXQzNfR1VTQjJQSFlBQ0MoMCkp
Ow0KPiA+PiArCQlyZWcgPSBkd2MzX3JlYWRsX25vdHJhY2UoZHdjLT5yZWdzLCBEV0MzX0dVU0Iy
UEhZQUNDKDApKTsNCj4gPj4gICAJCWlmIChyZWcgJiBEV0MzX0dVU0IyUEhZQUNDX0RPTkUpDQo+
ID4+ICAgCQkJcmV0dXJuIDA7DQo+ID4+ICAgCQljcHVfcmVsYXgoKTsNCj4gPj4gLS0NCj4gPj4g
Mi43LjQNCg==
