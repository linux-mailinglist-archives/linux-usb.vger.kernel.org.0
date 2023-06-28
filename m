Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC12741479
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jun 2023 17:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbjF1PC6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jun 2023 11:02:58 -0400
Received: from mail-db5eur01on2055.outbound.protection.outlook.com ([40.107.15.55]:11140
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231878AbjF1PC4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Jun 2023 11:02:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQnyj3gmed1uhd7fMVZBwOj9A/cw0mJEdzRewydIPiI5FH0BP/gnM8BJm1rDqzGj1Ve0M7jcIR2o/pejyCGSOfhYGPI8WKzescf1bxWfqFV03imASr9IFgocQ73C6AMVm79qlhSqmLYRNk1ZDiP8/mUfNYQhlUSnHju3a8DBwwaNVWhD6CRtAPKxl7lFRtSW2g/ztZAh4tZe4XSWnkLUw+HK6JGBxgGR0Q4oksSM36KREYj4aMEely5m73N5y9Zom/aQLQCCEEuzJm8kFVDCt8DPNCunfbr9D4cAx3GSGM8RPLQ5rLkCOax7bi//90vWXIdWES1SJBmLDe3m8bSSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmFylZTZk+9126+o/PTPwUpdZV1wnwMqXka08a+grvY=;
 b=aDQNYviirQoA/54oUUlbyYYcDS+5X41YqlLCOyD9zoYF+r1MSTZnyduWDK74KJoaNXhJwYYRaKvwpNUMaqJ4P6a57cHSpphcnCS6ZZJMjmP+hk1CwhFzcfPUm3m3wbhZY5XM1tFS9WrdhrgAfGEnc+edtlCbk1/3t1uIkMmvR88r/xYkYqqskughLTczyT+cqF6woTDvSVCW7UtO3TbcGC4omO7sEnR/SfFyVpT8AR93zeBd35l0GjwxH2R28OlXk3RspynplllXmEsM1ZTaYOAib/eYvPMUlDMi/nq8gs4bTcKHbxpmP+qqjKxDcSANtKX0OIQFb65FMsW3eo+B7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmFylZTZk+9126+o/PTPwUpdZV1wnwMqXka08a+grvY=;
 b=KnMOWhKQCplX2P2vmOXaeBJNKGrWZFAs+NtFZBKALVu1BM+sNFqDVZPQZJSdRxa9oRSsQEMU92T5h+oKuDs95PPqdOePIoVn+V7H5AWngxCp+31k3tbEJcOKg+umiZoXPkTvPvPr5Ep3xn0Z4+viCZmCFB3DQigbyFkT9envuLU=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB9PR04MB8123.eurprd04.prod.outlook.com (2603:10a6:10:243::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 15:02:54 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c%7]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 15:02:54 +0000
From:   Frank Li <frank.li@nxp.com>
To:     Roger Quadros <rogerq@kernel.org>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "pawell@cadence.com" <pawell@cadence.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [EXT] Re: usb: cdns3: Onchip memory reservation for built-in
 gadgets
Thread-Topic: [EXT] Re: usb: cdns3: Onchip memory reservation for built-in
 gadgets
Thread-Index: AQHZqOPr0K8Qv+d+aE+qe/9mSATp/a+euTRwgAGCvgCAABRTYA==
Date:   Wed, 28 Jun 2023 15:02:54 +0000
Message-ID: <AM6PR04MB4838ACB00BF08CCC08ADAF468824A@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <aa5837a9-8dd6-f10f-fd58-ec43e027ef07@ti.com>
 <b0314296-0df7-efcd-b0cf-166cb09ab338@kernel.org>
 <AM6PR04MB48382467AC7D6AF26C8CC4918827A@AM6PR04MB4838.eurprd04.prod.outlook.com>
 <211053fb-eec0-6610-065e-4cc6655b288d@kernel.org>
In-Reply-To: <211053fb-eec0-6610-065e-4cc6655b288d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|DB9PR04MB8123:EE_
x-ms-office365-filtering-correlation-id: 59d9197c-fb1f-416b-118c-08db77e8c012
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HblAOz5SDPRmXiBPfwPl/6AbXoCK+GXo/a86MmT4/ox4OrU17R00qDZ77X+Z600zhQpRYMshs0etM6vdKN01Imc5+QstxfQsfz8Jmg+wvbMubcpkiKn9mrCaofqa0kc1hXj449orNgUsQjXFFdeYLEFlZwso8yYhjwnBe+o4Qav0ofDfsTv0o/N9ISbRYAOwPnn6AyhiwbH4o7BoBbBwImOi0pvzz9nKB9wV4mj8Y4THZjewhY9RL2yiqWK5RdJJzdy37g+NvKaQVZvkIyCLKEDkiXAyaYB5yNzJ/YD3hVOmw4aCVR/TXAekz7hiTX8aPTs2n9HC2qNSnKamXF+28knG+YDgwO6Uie6MzaGBonVdXsO7dD2uqYZrXq1OnqAJApIbKLS1GbPWZ2/62mQBFNhpTOk4K1DC5rxjyzCULY9PbGA2+9diqmNW4z/exT79m9rURrtbkkBj0nrxvIznff54QnBpWMCe6SrHJSrlQQ9ucNRUbgsWCle96CxO4AWc0tYj+HRCmippvnD+1efMl1RgIlE8S7j6hzeYPTdyfYv74PQDO9dcBT9tVXE65NiMUtP+P17MghvkSCLxpFRS60v8Ps9Mtz2KTgMIB+bAQT2FnHpM93wyemHycR+1/pV9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(6506007)(122000001)(52536014)(33656002)(66476007)(76116006)(5660300002)(44832011)(86362001)(316002)(64756008)(4326008)(55016003)(66446008)(38070700005)(66556008)(41300700001)(8936002)(38100700002)(66946007)(8676002)(2906002)(4744005)(9686003)(186003)(7696005)(55236004)(26005)(71200400001)(478600001)(110136005)(83380400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjAxeE45NnRWTFpSbFl0b29Zck9HR09HTjFaazBnTEcxOWtxMGxiOWNqUGZl?=
 =?utf-8?B?NDlUenEvZUJ5NFV6MVpuMXhmRXk1ZFVvYXhnWEoydTFJejVBb1VvNUQzamhI?=
 =?utf-8?B?Skp4NEFHRzBadlM3R21RZ2Nrd09pVWNKamY3a2dRUzY5N1FwQm1rR3k1RjNT?=
 =?utf-8?B?OEZicDkwL3RTTlVBQUx4N041eERBQXNSUmZpeE1sSEcrM3RjcVA1QkZNci96?=
 =?utf-8?B?R2Z6cS9VdytDNmJVOEVFWVlqZUFMYlFGRWpTWGREUERCT3BZdHlySkNFVW8r?=
 =?utf-8?B?cXBxTThSTHZFNU1aOXlZdVBnL0tUYUhaWGJMaUc4bGJsQTJIcVhHb1ZMVVl1?=
 =?utf-8?B?WGtxMVFwNElzaGg4QXBhTWtPci8vbjQyMUdVUnZUa1pBNlcyYlJaWGt6ekd0?=
 =?utf-8?B?ZjNWb1V5NmJKaFNEYTk5NHZrV0FHdFZhdFk2SjBzT1ZRWG9rRHRBdVAvUHZp?=
 =?utf-8?B?SWo3RWR1NUlhRElZc1drTnh3QkpXTDdhb3BIaWVaaXU1ZC9EY1F3WGNoZjVR?=
 =?utf-8?B?bVF6U2Vtai9qZVRLMXNaNzRya0Z0SHYxblk3NkM5NTFjSWtpdUd4NlFJVjg0?=
 =?utf-8?B?WHQvZFY5ZGdUUExOMHlaS1JhbWJzYUNtalNjWGp0RXU5QkNkNGxzVllVSTN2?=
 =?utf-8?B?aUJObitvamxkMkVsd3o4UWZTd1JNU2JJMTBQQzVIcE1RQ0YvZ0dBSzBKMFUw?=
 =?utf-8?B?ZTV2dDBrVzFTWlRKR1FQVGdhaG81UTZnOVBzT1h3SURhK1JFUDFrWTVLYk56?=
 =?utf-8?B?WHh3Q1AxaU10aHJseHk1Y2FqdVdabDZUczRyb2ZYdXlwSmxoOTNybU9Gb1Uw?=
 =?utf-8?B?Q1Q5U2dQNlcrRjBHT1gvY0xPRTRlVFdhdEJLdWlxa3FwT3dqaGp2NGphVFVB?=
 =?utf-8?B?QUpvaUxsQi9FSkI4N2lHay9yREpzc2ordXprdkN2azF6OWlZRFc1VlNCZUNY?=
 =?utf-8?B?VDBPRnhuWXlPSnhwRjRMeGhiYXU5Y1loZEdrNnZzbVhySmpwODBqbkRNYWs0?=
 =?utf-8?B?eXpaRUFCRTNMS0V1cGNTYlRMb3pkb2xuSFZtWCtWb2RZa0pkelVXNDBVSGNt?=
 =?utf-8?B?K0pMTW9qTk93VWplekx6Mkt4Mng1Zm1uVVkzc3ZZUTJ4K1A2akx4QWpmbmMw?=
 =?utf-8?B?UHBGRE03YlJSeS9RNXlVSSt5VUlkUlowYVhkbkVGc0NQenI1aU1PSUFvcVU2?=
 =?utf-8?B?akdEOE5NQ2l5OHFmNU1DUWFva0JjQjlaWTRkOEJWZm5mZWhSUnVTd0h6QkMr?=
 =?utf-8?B?b3ZMM0l1SUhJV3F5S3FFY0U3Qlphc2V0Um5wU1FYcmsxYjgxbHNkZXBqZyt5?=
 =?utf-8?B?dkI5N1JZOWU4WFRCLzRhUlp0cFYyWURsRzZZZkRiTnNVUHNoY0svSmZleVdw?=
 =?utf-8?B?bDhUY0Jzelk0b09CWWtIM1FaaXZuY1Z6emRmNHl5UzRhYno5UWRLY0UveEtW?=
 =?utf-8?B?Ky9FTnMyS1NCVkRVOTRZTEtGdFBubkZhWlNCcWxPVE9PdS9EVVpGK2tqcSt2?=
 =?utf-8?B?WUpUWlA2d0JwQnpkZ0hiMUtoa2VtSDRmaXAxVW1MVUovUVU2WG5MRVA4Z21l?=
 =?utf-8?B?RzUxTkhRRnlxSU9lUmVEbFFpR1hJZy9uUDVmbmVBZ3lYRXMvU1NJOUJwd3Q0?=
 =?utf-8?B?KzZ3emtOZEYrcHVSbnRvamRCTXQ0ckZGY2JwNGZYYW1RWjRGT0pUcE1hVjhL?=
 =?utf-8?B?QWsrNytmUHV4UjJ4M1JNa1Nyd1lUZEVKbGVYUmZTbTBVZmdQclprTW1vdmU0?=
 =?utf-8?B?QjM1Qk5VQlVFcitUeVRCQmNnc0FncVB3MEtweGhYd0RsaUxVcGc0S1VjNTZt?=
 =?utf-8?B?Wk50L3RrMUw0QXNoSW9BYjhwSWdxaGJSeG1TN1BjMHB4UThYWE5aU1FIVW40?=
 =?utf-8?B?QWJSL2hmUGpjNFYrUmdOTk91a2hSVmVRRHZvV0tHeHl5SklJbUlNaVhFZ1B2?=
 =?utf-8?B?Mk9KOWRSZEMvdEZYOFUrVmpPeVpuVFlJdFZZdEpuOWNEeFpxTlE0dUExUmhx?=
 =?utf-8?B?dmNaT3M5dFJOT3luWERMVUlkN2hENjVPL3h3NXhvYldvWkVBUXRNUXlTTUdk?=
 =?utf-8?B?Smp0V3dFM3cwQlNpbW5hTGRFNWhYMlBzY0Fyb0pKckdxcmZUYlgxVk91K1Uw?=
 =?utf-8?Q?Dngk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d9197c-fb1f-416b-118c-08db77e8c012
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 15:02:54.1420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLCO5bi3idWQW2koXj4gchHd+pjWrQTgm7hrK/sgDR70BHjXYTOn3jgOMDRtngYo/v484KaQUH4Jk00BcsoaTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8123
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiA+DQo+ID4gSSB0aGluayBpdCBzaG91bGQgZml4IGF0IGxlZ2FjeSBkcml2ZXIgYnkgY2FsbCB1
c2JfZ2FkZ2V0X2NoZWNrX2NvbmZpZy4NCj4gPiBBc3N1bWUgdGhlcmUgYXJlIGEgVURDIGNvbnRy
b2xsZXIsIHdoaWNoIG9ubHkgMiBlbmRwb2ludC4gIGdfY2RjIHNob3VsZA0KPiA+IGdldCBmYWls
dXJlLg0KPiA+DQo+IA0KPiBjb21taXQgZGNlNDk0NDllMDRmIGhhcyBicm9rZW4gbGVnYWN5IGdh
ZGdldCBkcml2ZXJzIGZvciBDRE5TMyBVREMNCj4gYW5kIHRoYXQgc2hvdWxkIGJlIGZpeGVkIGZp
cnN0Lg0KPiANCj4gTm8gb3RoZXIgVURDIGRyaXZlcnMgaW1wbGVtZW50IC5jaGVja19jb25maWco
KSB5ZXQuDQoNCk5vIGltcGxlbWVudCBpcyBub3QgZXhwbGljaXQgY29ycmVjdC4gIENETlMzIGp1
c3QgdHJpZ2dlciB0aGlzIHByb2JsZW0uIA0KIA0KPiANCj4gVURDIGRyaXZlciBzaG91bGQgc3Rh
cnQgd2l0aCBhIGRlZmF1bHQgc2FuZSBjb25maWd1cmF0aW9uIGFuZCB3b3JrIGV2ZW4gaWYNCj4g
dXNiX2dhZGdldF9jaGVja19jb25maWcoKSBpcyBub3QgY2FsbGVkIGJ5IGdhZGdldCBkcml2ZXIu
IA0KDQpJIGFtIHByZXBhcmluZyBhIHBhdGNoZXMgYWRkIHVzYl9nYWRnZXRfY2hlY2tfY29uZmln
KCkgaW4gbGVnYWN5IGdhZGdldCBkcml2ZXIuDQoNCg0KPiANCj4gLS0NCj4gY2hlZXJzLA0KPiAt
cm9nZXINCg==
