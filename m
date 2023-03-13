Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C136B7462
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 11:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjCMKmg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 06:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjCMKmf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 06:42:35 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A12D5BBB
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 03:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHhpqFno09lnQyDScyorXXO5mqXcuTRvIU6qqidvG0SSsi5B5u2LX2bPPaM6x4IIEHPWUmUiSxpjDR4AdKPpqztTjb2cadRItQCL3U5oGdzP0B14T4ZaTaZnh5sCJiI5K2IyRN/CAnFWZMUAhc1e1rw9ZezxJ6uDbZBDj4GCJvtJ+3mGxNJYLsXO/nr3qqFIthXV5yOiVlw2FE2nBJplJTy8BpEDKohRCPLTVezH/13vvN0fxm2EeYvX+fWUuYkCkEQyeTYWHcoTMUV94st9JkDUJ6MSAYrM9HW/LgrgI/kn+qgEKC1jZZuQ0akvHQZK92NcckBgWIVCWhHFAwnVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmMJ4FeJVl+kD3PlKOi+uAKKfCHmhZwhytFeJ2t+w7E=;
 b=XasKnlFGGYza5wXmuzdt2dJal2S8kw7x55pR/BLdcBniWjf1av3G9dC3hMqIwVIUqfI08mQkQdoQknil60RhxCLWDuzz5fpdruqxzKq50I0LiDazYlbXEe54uoM9E644GTpxWFva91p3Tlz7IiR/NyPwsEEK8uUNzQUsiJi9vp0/6IV4LgMEapI1yRfMW43ECb3279VF6VrWaYdegAs9ywPpgay+Q4izu1X26GCwaVPcCvkmglmV/HSYDBpnRXEfb1MVbiH/mP+3hMSiYCXxAYPCT5k9DTGrVq3tGJKlj7qQjoNnXicTBw6I03apUG4zQOgy4iBVwV0xmO9c/+c4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmMJ4FeJVl+kD3PlKOi+uAKKfCHmhZwhytFeJ2t+w7E=;
 b=jZ/63RNImw5ohuDBndjXqAXI2qW6GznCldUoRHUItWd128Ex9RdP4PzwS1u/NovcJOfVQV+uOG+nCfJGnGk+gEVa+kcsPDzdvpKls9J/xJqTPvhWXjCgzJltntvdJLIFbsgyL1u9OnxzO18dUlwkp8KSyhnmRcQZ1x4fxTVvfWbZiTXLmULxc25TKrvK/XV9Ob6htfZXLSY2EDMgvLMuDIUjgOH0r/UPb/FbVheb3Lf83egJJm67YZE8e7qGhUt9AS67t/iHe1mmd1yOVcUMHFWry7WRFSVWsd0x9x5XFFT10RLGq0HBVN3sxwmCg5x7HYHZ7URNfm+NtS/2bvjaRw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DS7PR10MB7190.namprd10.prod.outlook.com (2603:10b6:8:db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 10:42:30 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.022; Mon, 13 Mar 2023
 10:42:30 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAIAAMwIAgAAPLgCAAAUXgIAAz5OAgADhYYCAA+lKAA==
Date:   Mon, 13 Mar 2023 10:42:30 +0000
Message-ID: <ffddfec514d1080f8e8b73d559aa512b73b7ae6c.camel@infinera.com>
References: <ZAjE+p4IoXk/kvXu@kroah.com>
         <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
         <ZAja0So7EDH5FfI0@kroah.com>
         <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
         <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
         <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
         <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
         <08af59771700795133a9522d8ba5dc7272a78142.camel@infinera.com>
         <20230309210907.r5daisahfzyhjl46@synopsys.com>
         <50fc84ff18f33a8d70986c1865c977e638a8563f.camel@infinera.com>
         <20230310225843.m4ypslx5x6wsldla@synopsys.com>
In-Reply-To: <20230310225843.m4ypslx5x6wsldla@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DS7PR10MB7190:EE_
x-ms-office365-filtering-correlation-id: 424dfaf9-fa12-439b-e634-08db23afa54f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MjVbJgGZslwW7VIp/QZkbCdVhAsSeYMl6Tl7P7WajnnEOgJPbUbc7VlX+OV05SvGKsAzWZ6L7+2cwYF/H8ckywGe0L6VNWNN/jlOYBeWxMWBRNmQWthQRck9YOGFQ5mtI3ZK9r16uqJmikotPbe25dLiq64LnzENh7n/wnCpLyhx9n9mNEzpnCt9KTLsAH6mM/1vcf6A7rOG8zr1lvMaa2bohR+iEoKR1hmE+mPhrhFS7u4k2oDcL70k1YCH79pDjA4UKAOoEI9nUOdXzuty42Lk67VGxxFc+JcED7McjNo1b7YUvHsecIrAY8pFxG197bMrpqNCFIEU/pFtTnaQRAXOzBeSeRyo6qb0YOw4KsDafU7Q+t7Q027BRNWKb12GJ1nqEV2/P42wjD3cmyXm+mMEY1L8tyOquwexWnQDMKNidHrBR5pki1S1pyILnD53HF4GunKKgP73m4TNrSkWUdX0jlz2UgyIzHH1ImIHFwEBpABM0JaDscm+amYTiAEehgrlb7FD9hAp16H/04VKKFRKS1qQyw/lhgWDmjmcC29dfbR8x4wkAvZfTA9lbHlW/sTD+B88TMkHaZ0LO/9KMkv0Qhr8hXzAuCrbSX0o0kNDW/MRAn5y/TIWtJ9+GnlvesghjkGQKteWeAKt1Xp6odM9y1Q8uPikHTblm2S1IeDJSCEsifP0uFlRllOZgv2iSuJ4vFXaOHGb0Rv9fQY65g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39850400004)(366004)(376002)(136003)(396003)(451199018)(5660300002)(36756003)(83380400001)(186003)(478600001)(6512007)(6506007)(71200400001)(6486002)(2616005)(91956017)(38070700005)(4326008)(6916009)(66476007)(76116006)(66446008)(8936002)(66556008)(64756008)(66946007)(8676002)(86362001)(54906003)(316002)(38100700002)(41300700001)(122000001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUk5YklYdjYvaUE4aDRGWGdQeHQvVktXK05mMmozSTNDSENvRWdsTU4ycThn?=
 =?utf-8?B?UVpyeFVxd0h0bDdMbDc0ZHZPWk5UMGNhVXhDV0Y1WUJJZkxoMHBtc0tkTFNM?=
 =?utf-8?B?cmRJREFFd2I0bTYvRjdMZ3hJcWxJTVRzdzlYWDFhWGw1bnFyODhkWEd6M1Zx?=
 =?utf-8?B?RnNQa0R5TWlCVS9lMktCVFQxVjVYK1ZJaHE5cTFyZWMxWTBId2hCNm5lbTZV?=
 =?utf-8?B?NzV1d0RCZTV6emNORHcyeWljai9RM1VkMXhSV1NtVXpYYXYyTXE4K3VCU3lv?=
 =?utf-8?B?eHVDZmNXN3Jrd0prQnVtTkFQSmpqSUlVb2ZVTGxPWWNlTmpXanZZSVN6Yk5S?=
 =?utf-8?B?T1kyTlBrYitWNVNGUkI5bmhGbGJPWEV6SFJVeWhqcEYyMkRUZHVYdVR6UkJB?=
 =?utf-8?B?SXdhRW1rWEVoMWhVSStBMGJKN1NrbW5UYkRROGlmMWlraGYzVkpGaXM0Tm1S?=
 =?utf-8?B?ZGl3MU9FZ2lsSWplSjZiNzdaVGVrdEQ3S2dKUGtjNWFYUWVaKzFtSGdqZm16?=
 =?utf-8?B?ZTZVeHdXTjl6VTVBS3A2MnZQUEUrRy9rVUx6ZkhqUkFhZkdncjR1ZG1hYWph?=
 =?utf-8?B?MG45S3N5K0R0eGNUbkpGeVl2TS9PTFNDMnpUVUprcTFnYU5sbVVFaHR4NWZv?=
 =?utf-8?B?dWpSQ1JuMWZUS09OVFkzWGdvMFdWb0hFdHJyQmdMOFRhWVh6Q1loN1h4K2xU?=
 =?utf-8?B?QndoSityb3pFRE1lYXpoMXVIYnBRTko5cG0xeFJuUU1JT2pLNEpZWUVuVUpG?=
 =?utf-8?B?a3NiYUtjWHowV045OFkzYlgzb1Q2MmRtK1Z5RUM0UWdCdHNpa0RRNGxodThk?=
 =?utf-8?B?MUFsbWVIZldSS0dMcS81UHlwNzRiaTRNL2k3aXRZNHI2TFBVaFh1REhxbGxh?=
 =?utf-8?B?Ym1jMW1WdjU1NW5WR0JCZlp6bjgzc3hScFpGOGFFaGlJSWJ6UXNrSmhqR2o0?=
 =?utf-8?B?Z1RHcWxJSCtYTlJrM2c2VGpZWXY1TVM0NnI4MzRnRUhvZ0dIOWMyQmpMQXBO?=
 =?utf-8?B?UllQY1JjZzZuMmJaRklTSCsvMXJ5dTVXeTJvR1BYWUh2M3o1Qkh3dDQ2NE8w?=
 =?utf-8?B?QVJpenZyTFBOcmVXTHFLUTJwd2hNdkNLSjF1TnBpL2pERFN0WWNjNHJnT05N?=
 =?utf-8?B?RHEvSHR0RGxzNnpRSUo1dWRPWk5TTG1BNGxrLzBGMXpkb2ZMVDMxMGRQTExN?=
 =?utf-8?B?NTd5TTVnUE43L2I5SXh3a243VmRVcUQvUGFPdDZteDRCaVpHNXAwQlltZlk1?=
 =?utf-8?B?TDNGTGxjK0o1b1I0WThZUnlMZGR4RWJSUlNOOTFldmp1bXJEOS9JUHNlNEdG?=
 =?utf-8?B?MTFQNm1EQnNmN2JaOVprSm15R2FZYldvVDJ5WVdValU0K0hQbnF4cVloSExh?=
 =?utf-8?B?V3gyZFBMcUQ5UjUrZUI5VExWRjNlbmpMcU9heUFMczk1SnlRZWN1UmZFUWZR?=
 =?utf-8?B?dEZtOWNHWUdERy9vMHQwdzF0NGVqSVhEYkUvL2tyTkFKUlNTK3VPckFrZU1t?=
 =?utf-8?B?RTNQSEE4NHVqcFVyTWNxcWpCUG5TaldNc3dVaXpXRTA0TkUrVXk4WU9PQ2F4?=
 =?utf-8?B?K2s5NGIyRFRMb243QzVES3RUcU5uTnc3eVNPWnVtdFB5YVkycDhkNGZham9t?=
 =?utf-8?B?RWFwZWt3YkpzZ202R3hoTmM2Qnl1QWJMa2Vsbm1JVTU1ZDdZTTJSQ3NkMEJ6?=
 =?utf-8?B?Kzc3cVlueFovSVVaTk9EQ25sZi84bndSK2RmL2UrdFBpWGV6Y0lYUTF4YUJK?=
 =?utf-8?B?R1hLZTRIU2VNVVY4RzFsTGpGaDkrTkR5NUVhc1BLMGVZNURUUG0zRGFpTklu?=
 =?utf-8?B?bzFJb2VNeDlCWVFsSWJLcFZqbktBQzkyeXY4Mk03ZitOR0IzcXNBRmY1bEZF?=
 =?utf-8?B?Y2FBK1N5ZXc1aFVYRU4yTEthVTQ3Z2lQQ1pVTlp0bmtyYjRiSWh4RGZpaFBQ?=
 =?utf-8?B?TktGNXBSVngyTFFyb3BjMXJtSWVHc1ZzZmFDMjZHOG9LdlE2OTFCTy9nY2JU?=
 =?utf-8?B?UEZ4MjRlWXovQ2QxRUZMSDhPUFNCVEZIQ1F6ZytJeEFVMlZPMnFqL2Z3blR3?=
 =?utf-8?B?MmVRRUNZQWl2Y1VpakpxcG04MGdIQXNhdVFETWpWenZTd0RMVlpqVkdOMjhB?=
 =?utf-8?B?eGRKaHVOb2Rhc2VGbXl2aFA2Tzl2UG5CejFOeU9RKytvTkE4T2V5Y0l3M3po?=
 =?utf-8?Q?a6ZT+AaDehjH/+VrWi4VN45jTrvbtRFaDfksLaRthjG2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30D9FA2F535A5D41B26D7E71C9BFEEC1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 424dfaf9-fa12-439b-e634-08db23afa54f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 10:42:30.2158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzjuWg/IlKncIirlhHG8jztKUotXUnxM85WprPjK8zDrybViwMoBg+mul5dvi65Zf1yEm7gsqMDrpIAuQm8j6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7190
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIzLTAzLTEwIGF0IDIyOjU4ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IE9uIEZyaSwgTWFyIDEwLCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyMy0wMy0wOSBhdCAyMTowOSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4g
T24gVGh1LCBNYXIgMDksIDIwMjMsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+IE9u
IFRodSwgMjAyMy0wMy0wOSBhdCAxOTo1NiArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
ID4gPiA+IE9uIFRodSwgTWFyIDA5LCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+
ID4gPiA+ID4gT24gVGh1LCAyMDIzLTAzLTA5IGF0IDE3OjMyICswMTAwLCBKb2FraW0gVGplcm5s
dW5kIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMjI6MjYgKzAx
MDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCAyMDIz
LTAzLTA4IGF0IDE5OjU4ICswMTAwLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwgTWFyIDA4LCAyMDIzIGF0IDA2OjEyOjUxUE0gKzAw
MDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwg
MjAyMy0wMy0wOCBhdCAxODoyNSArMDEwMCwgR3JlZyBLSCB3cm90ZToNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNToxMDoxN1BNICswMDAwLCBKb2FraW0g
VGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gd2UgYXJlIHVzaW5nIGZz
bC1sczEwNDNhLXJkYiBiYXNlZCBkZXNpZ24gYnV0IHdpdGggYSBsczEwMjNhIFNPQyBhbmQNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IHVzZSBVU0IwIGluIGdhZGdldCBtb2RlIHJ1bm5pbmcgZWl0
aGVyIE5DTSBvciBSTkRJUyBldGhlcm5ldCBvbiB0b3AuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFdoZW4gd2UgY29ubmVjdCB0aGUgZ2FkZ2V0IHRv
IGEgUEMoTGludXggb2YgV2luZG93cykgb3ZlciBhbiBVU0IyIGh1YiwNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+IG5ldHdvcmtpbmcoTkNNIG9yIFJORElTKSB3b3JrcyB3ZWxsLg0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBIb3dldmVyLCB3aGVuIHdl
IGNvbm5lY3QgdGhlIGdhZGdldCBkaXJlY3RseSB0byB0aGUgUEMvbGFwdG9wIHdoaWNoIHVzZXMg
VVNCMw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gd2Ugc2VlIHNvbWV0aGluZyBvZGQ6DQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgIFBpbmcgZnJvbSBQQyB0byBnYWRnZXQgd29ya3MuDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgIFBpbmcgZnJvbSBnYWRnZXQgdG8gbGFwdG9wIGRvZXMgbm90
LiBIb3dldmVyIGlmIHdlIGFsc28gcGluZyBmcm9tIFBDIGF0IHRoZSBzYW1lIHRpbWUgd2UNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgc2VlIGdhZGdldCB0byBQQyBzdGFydCB3b3JraW5nLg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gU2VlbXMgbGlrZSBwaW5nIGZyb20gdGhlIFBDIHRpZ2dl
cnMgdGhlIGdhZGdldCB0byBzZWUgaW5jb21pbmcgcGtncyBzb21laG93Lg0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBBbnkgaWRlYSB3aGF0IG1pZ2h0
IGJlIHdyb25nIG9yIGhvdyB0byBkZWJ1ZyB0aGlzPw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
S2VybmVsIDUuMTUuODcNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiA1LjE1LnkgaXMgdmVyeSBvbGQsIGRvZXMgdGhpcyBhbHNvIGhhcHBlbiBvbiA2LjI/DQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiA+ID4gPiBJIGp1c3QgdHJpZWQgNi4xLjE1IGFuZCB0aGUgcHJvYmxlbSByZW1haW5zLCBJIGhv
cGUgdGhhdCBpcyBjbG9zZSBlbm91Z2ggPw0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+ID4gPiBJdCdzIGdvb2QgZW5vdWdoIDopDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gPiA+IEhhdmUgYW55IGxvZ3MgYXQgYWxsIHRoYXQgc2hvdyBhbnkgcHJvYmxlbXM/DQo+
ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBObywgZG9uJ3Qga25vdyB3aGVyZSB0
byBzdGFydC4gVGhlcmUgYXJlIG5vIGVycm9ycyBsb2dnZWQuDQo+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gPiAgIEFsc28sIHlvdSBtaWdodCB3YW50IHRvDQo+ID4gPiA+ID4gPiA+
ID4gPiAgY2M6ICB0aGUgZHdjMyBtYWludGFpbmVyLi4uDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gSSB0aG91Z2h0IEkgZGlkIGJ1dCB0aGF0IGxvb2sgbGlrZSBvbGQgaW5mbywg
YWRkZWQgVGhpbmggTmd1eWVuIG5vdywgdGhhbmtzDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+ID4gIEpvY2tlDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gPiA+ICB0aGFua3MsDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gPiA+ICBncmVnIGstaGoNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+IEZvdW5kIGFuZCBVU0JDIERvY2sgYW5kIGNvbm5lY3RlZCB0aGF0IGJldHdlZW4g
Z2FkZ2V0IGFuIFBDIGFuZCB0aGlzIGFsc28gd29ya3Mgd2VsbC4NCj4gPiA+ID4gPiA+ID4gU2Vl
bXMgbGlrZSBhIGh1YiwgcmVnYXJkbGVzcyBvZiBVU0IyL1VTQjMsIG1ha2UgdGhlIHVzYiBuZXR3
b3JrIGZ1bmN0aW9uIGluIGJvdGggZGlyZWN0aW9ucy4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+IEZvdW5kIG91dCBzb21ldGhpbmcgaW50ZXJlc3RpbmcsIG9uIFBDOg0KPiA+ID4gPiA+
ID4gPiBjZCAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE0LjAvdXNiMS8xLTEvcG93
ZXIgICMgV2hlcmUgbXkgZ2FkZ2V0IGlzIGNvbm5lY3RlZA0KPiA+ID4gPiA+ID4gPiBlY2hvIDAg
PiB1c2IyX2hhcmR3YXJlX2xwbQ0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gTm93IHBp
bmcgd29ya3Mgbm9ybWFsbHkuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBTbyBMUE0g
ZG9lcyBub3Qgc2VlbSB0byB3b3JrIHByb3Blcmx5IG9uIGdhZGdldC4gQ2FuIEkgZGlzYWJsZSBM
UE0gc29tZWhvdw0KPiA+ID4gPiA+ID4gPiBvbiBnYWRnZXQgc2lkZT8gDQo+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZXJlJ3Mgbm8gb3B0aW9uIGluIGdhZGdldCBjb25m
aWdmcyB0byBhbGxvdyB5b3UgdG8gZG8gdGhhdCBhdCB0aGUNCj4gPiA+ID4gPiBtb21lbnQuIFlv
dSBjYW4gZGlzYWJsZSBMUE0gaW4gZHdjMyBjb250cm9sbGVyIGluIHRoZSBkZXZpY2V0cmVlIHdp
dGgNCj4gPiA+ID4gPiAic25wcyxkaXNfZW5ibHNscG1fcXVpcmsiIGluc3RlYWQuDQo+ID4gPiA+
IA0KPiA+ID4gPiBZZXMsIEkgZm91bmQgdGhhdC4gVGhhbmtzLg0KPiA+ID4gDQo+ID4gPiBBbHNv
IG5vdGUgdGhhdCBMUE0gaXMgZm9yIGRldmljZSBvcGVyYXRpbmcgaW4gdXNiMiBzcGVlZC4gSWYg
aXQncyB1c2IzDQo+ID4gPiBzcGVlZHMsIHRoZW4geW91IG5lZWQgdG8gZGlzYWJsZSBVMyBzdXNw
ZW5kLg0KPiANCj4gQWN0dWFsbHksIHlvdSBjYW4ndCBkaXNhYmxlIFUzLiBUaGUgZGV2aWNlIGhh
cyB0byBvYmV5IHRoZSBob3N0IGlmIGl0DQo+IHJlcXVlc3RzIGZvciBVMyBlbnRyeS4NCj4gDQo+
ID4gDQo+ID4gQVRNIEkgaGF2ZToNCj4gPiAJc25wcyxkaXNfZW5ibHNscG1fcXVpcms7DQo+ID4g
CXNucHMsZGlzX3UyX3N1c3BoeV9xdWlyazsNCj4gPiAJc25wcyxkaXNfdTNfc3VzcGh5X3F1aXJr
Ow0KPiA+IAlzbnBzLHVzYjItZ2FkZ2V0LWxwbS1kaXNhYmxlOw0KPiA+IA0KPiA+IFRoYXQgZml4
ZXMgaXQsIEkgaGF2ZSBubyBuZWVkIGZvciBhbnkgTFBNL3N1c3BlbmQNCj4gDQo+IE5vdGUgdGhh
dCBhZGRpbmcgdGhlc2UgMiB3b24ndCBoZWxwIGlmIHRoZSBob3N0IHNlbmQgVTMgcmVxdWVzdC4N
Cj4gCXNucHMsZGlzX3UyX3N1c3BoeV9xdWlyazsNCj4gCXNucHMsZGlzX3UzX3N1c3BoeV9xdWly
azsNCj4gDQo+IFRoYXQncyBqdXN0IGRpc2FibGluZyB0aGUgcGh5IGZyb20gZ29pbmcgaW50byBs
b3dlciBwb3dlciBzdGF0ZS4gWW91DQo+IG5lZWQgdG8gcHJldmVudCB0aGUgaG9zdCBmcm9tIGF1
dG9zdXNwZW5kaW5nIGFuZCBwdXQgdGhlIGRldmljZSBpbiBVMy4NCj4gDQo+IEZvciB1c2IyIHNw
ZWVkLCB5b3Ugb25seSBuZWVkICJzbnBzLHVzYjItZ2FkZ2V0LWxwbS1kaXNhYmxlIi4NCg0KSnVz
dCBjaGVja2VkIHdpdGggSFcgYW5kIG91dCBVU0IgZGV2aWNlIGlzIG9ubHkgd2lyZWQgZm9yIFVT
QjIuDQoNCiBKb2NrZQ0K
