Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C83256B3AA8
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 10:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjCJJfw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 04:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjCJJfW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 04:35:22 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092CDEE289
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 01:32:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpaYHv4bly39DdPVU6NZsGC12JMHD9gF7dOZOjF5d4OzbitjNQ1UXmsYNM384rOJVsGdWoj0pzKpv79C4LtlRZm/yJkzJ290xbYRX9qz4sxytbRKsa6B+VyfS9kFhyeLtNjLFXaUPjk/oJXIsFxi/CCn1VO/p10JlMRurNfeV7ECMAFcUUEk91zyROtmXkcDMZSSOOfl7yXhD2b+GMihFwbURAz7ZUxEl0qdiZmg7xvHPTI0+/lYWhwjjW6hboIC5rJlJwGQ+hnJ133oOgMn0aTN3b0HRhyDln6y4MTLhS9InNOZCj7FSo/ZMLaMVD2m9RvBvfV5yVcr04sChwx09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHDwZsKF3F6cQN/X8BgclB6hSACyb/AWIiYatM7xTaE=;
 b=WSAoqUjhyva7pyoPcQbIbkxZtvyRM+PeYXN33vjtk9A+fWkT1qTV5A7ZPQmX/kPs85fp3IcEIBkP/B1zj29tlsYpw+tsprgT3OVv+lZYeCJnnbvFseL/6k1zFS6uOD2naDaa0DwZ13bWfgcrw7EH7/q126HEWfbyVCkoJuwvbywuGV6Dhguu7i/txFrQJSwkH14RNWs9Igp1qtP8VUp4IUa+eiiO9pJIy19MAjXr2rjNrUEPB0UaKxonPZAs9/4MM7/GZo2SP8f2/RDXZ+enywQPflWLm9Z3/Z+/bNj14sp/A8qW8dgqR4eVWAncj/TpYzqaemf54QRhoON1cFzWdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHDwZsKF3F6cQN/X8BgclB6hSACyb/AWIiYatM7xTaE=;
 b=K/QsBdabYGUf5YktUb1352xWvwPWkOnRw0RM9IIYqEEsPKaLmJFlfiwIyXvnVmd0GkfZFA6kDsRv6uqezq9JL0hWL+CPnbZrVIIciDPU8plCZ5T4s30edUu0KhB+4LGNs4lHdhVyCTVR6HPKWnaWVtBaeOKj0yKSn1VfUo1TsRYKYSdq+Vn7Vg1scnfsqhnnRiC5bRblqT1vKeSSaoHLYNl9GedSV04emShtM+u/ZmILJNxkCZ1qMsdM7X683bfDU1TzOA3jSMb/zTkJRRKJGl3kahnqtpXXcPmhRlps9/nIjN4dJ+c0EFUUG8f83fn96caJWuMG2fqAZyNmv/ZKRw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DM6PR10MB4171.namprd10.prod.outlook.com (2603:10b6:5:21f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:32:05 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 09:32:05 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAIAAMwIAgAAPLgCAAAUXgIAAz5OA
Date:   Fri, 10 Mar 2023 09:32:05 +0000
Message-ID: <50fc84ff18f33a8d70986c1865c977e638a8563f.camel@infinera.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
         <ZAjE+p4IoXk/kvXu@kroah.com>
         <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
         <ZAja0So7EDH5FfI0@kroah.com>
         <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
         <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
         <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
         <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
         <08af59771700795133a9522d8ba5dc7272a78142.camel@infinera.com>
         <20230309210907.r5daisahfzyhjl46@synopsys.com>
In-Reply-To: <20230309210907.r5daisahfzyhjl46@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DM6PR10MB4171:EE_
x-ms-office365-filtering-correlation-id: ef4ef19d-04c9-4431-3c2c-08db214a4fe7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ec1d/CeqpyYgBv+W32IL++44u6KjlT12OhEfTvgwcV8IzvXJq7x1GYOc6px/PuRPio0TpILagxoY4sscpnT3aOdpmSz6ZOwVsU9DMaUTlEMY0iGLrw/E/F7TXMZGoAKnPaYXomHE97htGuy2ykoPGGqhxdnBdDIftOSFUtRrEf+E5jw6cptchfKNe8RrswIDQzUG8f+4hhq5AmxMwBmw8Jawcg7oq+6VmWKL9X0nIy8Y/z9Czq4mkyeorwYiqCQQ0gO2MxnIcCuvIp+vp2Aic7gzWhvNYJa8R+ggFcpDLnx7ApQFAlFPe9sx2RLWgGmJI5279Eej/RnUgNoW/8567bqeGPqfsP1Mw8Xq/qtDD2Kvi8P2WQpfSv8NxKKvAE7LfGrc6851DSZPnBTRdWO2cUwSIZdesTus/O4oexL2BAPziu6kQqK6JxX4liUjevhRXA6noaIifJc0O8qCh3cqtcWfSVatrmKsB3Uh0uzNU7lUs1ryu2+3zIxbGFy9AGsz9qMS3Pd/ymqhKd1YixpJQX55BLPUue1aTk1U6bob4kNo4ub/u2Z2Ouw9JVMoHEamm1s2AjuuyBAbnaA5hht70Mz3owTV7lDI6yVZHqyL6GeYBi/g9tXrwmRUUVTtUyQ/XDHfE56P8u9jDNkoaaASNXBxzL6dvwJ+OfDLYDLkCTyASAtCxaxdnCfqG7VJdHXgvDNQ5+DsW14HnB6QbrATPLNdR/HyxMT9RAQXNxhnjLHC+WW2Mri7BdfITjmIfqKJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199018)(86362001)(36756003)(38070700005)(38100700002)(122000001)(8936002)(2906002)(66556008)(76116006)(66946007)(66446008)(91956017)(64756008)(66476007)(41300700001)(6916009)(5660300002)(8676002)(4326008)(2616005)(83380400001)(6486002)(478600001)(316002)(54906003)(6506007)(6512007)(186003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cStrSFd3ZVJ0bGVoZTBtWWxBNlJaMkw4QWRxNmc1T0Y5dWtqNXlUQzh5L2Nh?=
 =?utf-8?B?WXBDRFR0OXg2MnVmem5CK0g5VGdxbzlTeVNmOE8ydDZXVjVURWV5QXZHOVZh?=
 =?utf-8?B?eVphMkZZVUlueFcyak43RS9DYTJUQXVNNVJHS25ERTFaakc0U1JXa3JXK3pk?=
 =?utf-8?B?MjUycUVUNHo0Nml3bjdReWlYZnA4R0kxVStBOVJtN0ZPelpGTGloZXlGOXFH?=
 =?utf-8?B?ZVFpMXkzUkJGU09pNDVzTFAwVDNZTDRUWllrajNlMko0Nlh0YVI5M1dkQzAr?=
 =?utf-8?B?MWlDZ1BiNmpCYmd0L1Y0Z0I3blF3UEtObG91RzFZSEVzeXYzSk5wOS9FbUZu?=
 =?utf-8?B?S3dHQkgzcHViNHNWVzk4K1BnanY4SmdaTkZBRjdDRWVjMFZsRy95SStYNGU0?=
 =?utf-8?B?MVE3SHpNQXhoMjJHK3EyMTdJT1VyMW1EdVV4bjVzVkl6NEtmMUFJdXJRRFpt?=
 =?utf-8?B?MGlRRjVtWm1BQmhFNU5DUmZJSnZHTTk1Q0RXaVZYdCtzM0JOa0lqazNYcmtV?=
 =?utf-8?B?cW9TZUpaNnVkQ05OWVBlLzc2ZTQ4Wlo3U2ZUYVVDL0pPb2Z1WmlGNHVLYzYr?=
 =?utf-8?B?RDk0eEc3bHgxZGVWTjczVHhUeTU5L3ZmU1hEemhKR0E3eEpKYjBzUlJsblFW?=
 =?utf-8?B?cmdpaFpYaUtzNnlPeXdyUE9wRWUwSDUzbkVuRmkyWHVEQWV4SVhrT1pnMFVm?=
 =?utf-8?B?cmNNeU9HWlg5RXpMQW1hS1FFTGhhTkZyUGRxbXdyRzRuQnJ2NUZZTzMvV2k5?=
 =?utf-8?B?eGlmWTIyc3FWNVFaM3FJNzc4QmVibUdyUWRydk1NQzNzWnpHZDlBYUkwYWd5?=
 =?utf-8?B?OE1VSmo1ckE5UGljRCtNVVRGditJOVRmVERzdGZRTHI4M3pHOWpSMmZTcHhh?=
 =?utf-8?B?SFBUQ1JKeFVlc1R0MVE2RXVISXJickJieVpIeUtGQWlFM1lHelY0NzIreHhl?=
 =?utf-8?B?NG83VE9RRnBFQUQwOFJLNk1lVTZOblNvK1hzSGFSTlBMZXZyWGV1cXRTMlNI?=
 =?utf-8?B?V04vREFEOUtWR21wWHY1WEI0NGRnODlmVWxyelpOWE81NkZkTFhNZUJhbW8x?=
 =?utf-8?B?eW5reDBaUlJaSmRVeXN5M25IT2hpeWh6RlE2QVlqOUQ1b0xEMnpURldTc25l?=
 =?utf-8?B?QWxMckZwRy9uQ3VkOHRUNE9YdFpERWZ2bkZuVkp0NHh6UXl0dzBBVzNCNnR4?=
 =?utf-8?B?em8yQSt1MWNYeVA4SWd1eHBERTR5WDhmd2M1RFpKR3R4N0VGblVoNzhDWXdw?=
 =?utf-8?B?eVRDUG1lOHV6L250aHA0bGtQWlJGWnNFK3R3a2V6VjN2d3lpM1c1QmtMQndZ?=
 =?utf-8?B?UmNZZ0M4WlNTSS9zVkpBLzNoQmFmNDNYeUxXM1lUUjFKMkFLcjV0YTE3TGJZ?=
 =?utf-8?B?clZNamwzeStveWxQVnN6OU53L2NQeGRLd29FWEJlKzJhajJYTUJKYUNmZ1F5?=
 =?utf-8?B?TnBOSmFEZXZ2bTJST0JiNTRkWlNySkswOXpCSjFseUZZMkdFTGNFa3A5ckd4?=
 =?utf-8?B?RzlrRVBhWVJUcXQwMmFjNjd6MitaaXd1cmZCZ3RJcUlPbC9VNHU1MVhyenZK?=
 =?utf-8?B?dFd6QTFzd25tWDVJb000cTlRM3ljc25sYkJ3Z3lkZlFZQXIxMGdLMHFOY0dZ?=
 =?utf-8?B?bnowMUJ0amFFd0VkbEVBUGpZaFNQN1ZjZDBkTUtOMWNlaHE4REFCSWVvOWF3?=
 =?utf-8?B?dW1qc0NlUVBlYW1HSTJFN2h6ZmxkaFpicjNNeEh2VVV1Z2o5MUJmdGxmRHhl?=
 =?utf-8?B?d0VMSjN6YS9vNW00LzFXUXVYZlNUSlRCYzRKK0syYnRBeUY5MlByTjdaZzRo?=
 =?utf-8?B?TUNDVGliYlV5M0tnVW52cnl4QkVQR1NHczFYT1ZSWnhPQkhuVUNXdnU3b2Fo?=
 =?utf-8?B?UkNoKzZmKzcrZWNIWTErN0lTTi8yUkoxWFVqK2JzblVINGcyRXNrYTBjajEw?=
 =?utf-8?B?bEdrWkQrbHVPWks3RXRaRFN2K28xdDBHNTdPWnBiOW5qMGUwQnh5VkhDNTNC?=
 =?utf-8?B?a25KM1F2U3pzbmNrM0c0emhPK2pKNlZlSDBVeVlRVUlVelM3L1ZvYWJ0N2pJ?=
 =?utf-8?B?VC93cnYxS05EMmRPTUlDOHNDRlZoU3YxRUFEYTdqQ3BDVjN5azBGU2RQYjZV?=
 =?utf-8?B?SGc3RG0wOTFzNXBNOFJBc2c3M3BDVy8ydVN3d0hGdUhPbVdPZUVEc0dPU204?=
 =?utf-8?Q?i0ScbGfApRnQQNV9/g0vzZx5ErutJ0kM6O/MC8lDyIij?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <898EB6D7C7343E4C90A0CEB0F525B762@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4ef19d-04c9-4431-3c2c-08db214a4fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 09:32:05.4283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9XAhIzCQONIbjZor+5hHwq1Y5AQnBO7AqSIbPe6GgzNl0ESaxu9f1zYd9214l9QWhSL1rrnEPReATbiXVTsSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4171
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIzLTAzLTA5IGF0IDIxOjA5ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IE9uIFRodSwgTWFyIDA5LCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyMy0wMy0wOSBhdCAxOTo1NiArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4g
T24gVGh1LCBNYXIgMDksIDIwMjMsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+IE9u
IFRodSwgMjAyMy0wMy0wOSBhdCAxNzozMiArMDEwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToN
Cj4gPiA+ID4gPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMjI6MjYgKzAxMDAsIEpvYWtpbSBUamVy
bmx1bmQgd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMTk6NTggKzAx
MDAsIGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBX
ZWQsIE1hciAwOCwgMjAyMyBhdCAwNjoxMjo1MVBNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdy
b3RlOg0KPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwgMjAyMy0wMy0wOCBhdCAxODoyNSArMDEwMCwg
R3JlZyBLSCB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+IE9uIFdlZCwgTWFyIDA4LCAyMDIzIGF0
IDA1OjEwOjE3UE0gKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+ID4gPiA+
ID4gPiA+IHdlIGFyZSB1c2luZyBmc2wtbHMxMDQzYS1yZGIgYmFzZWQgZGVzaWduIGJ1dCB3aXRo
IGEgbHMxMDIzYSBTT0MgYW5kDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHVzZSBVU0IwIGluIGdhZGdl
dCBtb2RlIHJ1bm5pbmcgZWl0aGVyIE5DTSBvciBSTkRJUyBldGhlcm5ldCBvbiB0b3AuDQo+ID4g
PiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBXaGVuIHdlIGNvbm5lY3QgdGhl
IGdhZGdldCB0byBhIFBDKExpbnV4IG9mIFdpbmRvd3MpIG92ZXIgYW4gVVNCMiBodWIsDQo+ID4g
PiA+ID4gPiA+ID4gPiA+IG5ldHdvcmtpbmcoTkNNIG9yIFJORElTKSB3b3JrcyB3ZWxsLg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gSG93ZXZlciwgd2hlbiB3ZSBj
b25uZWN0IHRoZSBnYWRnZXQgZGlyZWN0bHkgdG8gdGhlIFBDL2xhcHRvcCB3aGljaCB1c2VzIFVT
QjMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gd2Ugc2VlIHNvbWV0aGluZyBvZGQ6DQo+ID4gPiA+ID4g
PiA+ID4gPiA+ICAgUGluZyBmcm9tIFBDIHRvIGdhZGdldCB3b3Jrcy4NCj4gPiA+ID4gPiA+ID4g
PiA+ID4gICBQaW5nIGZyb20gZ2FkZ2V0IHRvIGxhcHRvcCBkb2VzIG5vdC4gSG93ZXZlciBpZiB3
ZSBhbHNvIHBpbmcgZnJvbSBQQyBhdCB0aGUgc2FtZSB0aW1lIHdlDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ICAgc2VlIGdhZGdldCB0byBQQyBzdGFydCB3b3JraW5nLg0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBTZWVtcyBsaWtlIHBpbmcgZnJvbSB0aGUgUEMgdGlnZ2VycyB0aGUgZ2FkZ2V0IHRvIHNlZSBp
bmNvbWluZyBwa2dzIHNvbWVob3cuDQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiA+ID4gPiBBbnkgaWRlYSB3aGF0IG1pZ2h0IGJlIHdyb25nIG9yIGhvdyB0byBkZWJ1ZyB0aGlz
Pw0KPiA+ID4gPiA+ID4gPiA+ID4gPiBLZXJuZWwgNS4xNS44Nw0KPiA+ID4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+ID4gPiA1LjE1LnkgaXMgdmVyeSBvbGQsIGRvZXMgdGhpcyBhbHNvIGhh
cHBlbiBvbiA2LjI/DQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiBJIGp1c3QgdHJpZWQgNi4xLjE1IGFuZCB0aGUgcHJvYmxlbSByZW1haW5zLCBJ
IGhvcGUgdGhhdCBpcyBjbG9zZSBlbm91Z2ggPw0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gSXQncyBnb29kIGVub3VnaCA6KQ0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gSGF2
ZSBhbnkgbG9ncyBhdCBhbGwgdGhhdCBzaG93IGFueSBwcm9ibGVtcz8NCj4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiBObywgZG9uJ3Qga25vdyB3aGVyZSB0byBzdGFydC4gVGhlcmUgYXJlIG5v
IGVycm9ycyBsb2dnZWQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gICBBbHNvLCB5b3Ug
bWlnaHQgd2FudCB0bw0KPiA+ID4gPiA+ID4gPiAgY2M6ICB0aGUgZHdjMyBtYWludGFpbmVyLi4u
DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEkgdGhvdWdodCBJIGRpZCBidXQgdGhhdCBsb29r
IGxpa2Ugb2xkIGluZm8sIGFkZGVkIFRoaW5oIE5ndXllbiBub3csIHRoYW5rcw0KPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiAgSm9ja2UNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gIHRoYW5rcywNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ICBncmVn
IGstaGoNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZvdW5kIGFuZCBVU0JD
IERvY2sgYW5kIGNvbm5lY3RlZCB0aGF0IGJldHdlZW4gZ2FkZ2V0IGFuIFBDIGFuZCB0aGlzIGFs
c28gd29ya3Mgd2VsbC4NCj4gPiA+ID4gPiBTZWVtcyBsaWtlIGEgaHViLCByZWdhcmRsZXNzIG9m
IFVTQjIvVVNCMywgbWFrZSB0aGUgdXNiIG5ldHdvcmsgZnVuY3Rpb24gaW4gYm90aCBkaXJlY3Rp
b25zLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZvdW5kIG91dCBzb21ldGhpbmcgaW50ZXJlc3Rp
bmcsIG9uIFBDOg0KPiA+ID4gPiA+IGNkIC9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6
MTQuMC91c2IxLzEtMS9wb3dlciAgIyBXaGVyZSBteSBnYWRnZXQgaXMgY29ubmVjdGVkDQo+ID4g
PiA+ID4gZWNobyAwID4gdXNiMl9oYXJkd2FyZV9scG0NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBO
b3cgcGluZyB3b3JrcyBub3JtYWxseS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTbyBMUE0gZG9l
cyBub3Qgc2VlbSB0byB3b3JrIHByb3Blcmx5IG9uIGdhZGdldC4gQ2FuIEkgZGlzYWJsZSBMUE0g
c29tZWhvdw0KPiA+ID4gPiA+IG9uIGdhZGdldCBzaWRlPyANCj4gPiA+ID4gPiANCj4gPiA+IA0K
PiA+ID4gVGhlcmUncyBubyBvcHRpb24gaW4gZ2FkZ2V0IGNvbmZpZ2ZzIHRvIGFsbG93IHlvdSB0
byBkbyB0aGF0IGF0IHRoZQ0KPiA+ID4gbW9tZW50LiBZb3UgY2FuIGRpc2FibGUgTFBNIGluIGR3
YzMgY29udHJvbGxlciBpbiB0aGUgZGV2aWNldHJlZSB3aXRoDQo+ID4gPiAic25wcyxkaXNfZW5i
bHNscG1fcXVpcmsiIGluc3RlYWQuDQo+ID4gDQo+ID4gWWVzLCBJIGZvdW5kIHRoYXQuIFRoYW5r
cy4NCj4gDQo+IEFsc28gbm90ZSB0aGF0IExQTSBpcyBmb3IgZGV2aWNlIG9wZXJhdGluZyBpbiB1
c2IyIHNwZWVkLiBJZiBpdCdzIHVzYjMNCj4gc3BlZWRzLCB0aGVuIHlvdSBuZWVkIHRvIGRpc2Fi
bGUgVTMgc3VzcGVuZC4NCg0KQVRNIEkgaGF2ZToNCglzbnBzLGRpc19lbmJsc2xwbV9xdWlyazsN
CglzbnBzLGRpc191Ml9zdXNwaHlfcXVpcms7DQoJc25wcyxkaXNfdTNfc3VzcGh5X3F1aXJrOw0K
CXNucHMsdXNiMi1nYWRnZXQtbHBtLWRpc2FibGU7DQoNClRoYXQgZml4ZXMgaXQsIEkgaGF2ZSBu
byBuZWVkIGZvciBhbnkgTFBNL3N1c3BlbmQNCg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gSWYg
dGhlIGhvc3QgcHV0cyB0aGUgZ2FkZ2V0IGluIHN1c3BlbmQsIHRoZSBnYWRnZXQgd29uJ3QgYmUg
YWJsZSB0bw0KPiA+ID4gY29tbXVuaWNhdGUgd2l0aCB0aGUgaG9zdCB1bnRpbCB0aGUgaG9zdCB3
YWtlcyB0aGUgZ2FkZ2V0IHVwIGFuZCBzdGFydHMNCj4gPiA+IHRhbGtpbmcgdG8gdGhlIGdhZGdl
dCBhZ2Fpbi4gVGhlIGdhZGdldCBtYXkgYmUgYWJsZSB0byBzaWduYWwgdGhlIGhvc3QNCj4gPiA+
IHRvIHdha2V1cCB2aWEgcmVtb3RlIHdha2V1cC4gRGlkIHlvdSBjaGVjayBpZiB0aGUgZGV2aWNl
IGlzIGluIHN1c3BlbmQ/DQo+ID4gPiBJZiBpdCdzIGluIHN1c3BlbmQsIGlzIHRoZSBnYWRnZXQg
ZW5hYmxlZCB3aXRoIHJlbW90ZSB3YWtldXA/IERpZCB0aGUNCj4gPiA+IE5DTSBkcml2ZXIgc2Vu
dCBhIHJlbW90ZSB3YWtldXAgc2lnbmFsIHRvIHRoZSBob3N0PyBJIGRpZG4ndCB2ZXJpZnksIGJ1
dA0KPiA+ID4gSSBzdXNwZWN0IHRoZSBOQ00gZ2FkZ2V0IGRyaXZlciBpc24ndCBjb25maWd1cmVk
L2ltcGxlbWVudGVkIHdpdGggcmVtb3RlDQo+ID4gPiB3YWtldXAuDQo+ID4gDQo+ID4gVGhlbiBt
YXliZSBOQ00vUk5ESVMgc2hvdWxkIGluZm9ybS9kaXNhYmxlIExQTSBpbiB0aGUgZGV2aWNlIGRy
aXZlcj8NCj4gPiBPbmUgY2Fubm90IGhhdmUgaGFsZiBhbiBpbXBsLiBvZiB0aGlzIGZlYXR1cmUu
DQo+IA0KPiBNb3N0IGRyaXZlcnMgZG9uJ3QgZnVsbHkgc3VwcG9ydCBldmVyeSBmZWF0dXJlLiBU
aGV5IGFyZSBpbXBsZW1lbnRlZCBhcw0KPiBuZWVkZWQuIEknbSBub3QgZmFtaWxpYXIgd2l0aCBO
Q00vUk5ESVMgZHJpdmVyLiBQZXJoYXBzIHlvdSBjYW4gcGluZyBpdHMNCj4gbWFpbnRhaW5lciB0
byBzZWUgaXRzIGN1cnJlbnQgc3RhdHVzIHRvIHNlZSBpZiBpdCBuZWVkcyB0byBiZSB1cGRhdGVk
Lg0KPiBVbmxlc3MgdGhlcmUncyBhIHF1aXJrIGZyb20gdGhlIGhvc3QvZGV2aWNlLCB3ZSBzaG91
bGRuJ3QgaGF2ZSB0bw0KPiBkaXNhYmxlIExQTS4NCj4gDQpSaWdodCBidXQgaXNuJ3QgTFBNIHNv
bWV0aGluZyBlbHNlPyBPbmUgY2FuIHJlYWQgaW4gRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9z
eXNmcy1idXMtdXNiOg0KV2hhdDoJCS9zeXMvYnVzL3VzYi9kZXZpY2VzLy4uLi9wb3dlci91c2Iy
X2hhcmR3YXJlX2xwbQ0KRGF0ZToJCVNlcHRlbWJlciAyMDExDQpDb250YWN0OglBbmRpcnkgWHUg
PGFuZGlyeS54dUBhbWQuY29tPg0KRGVzY3JpcHRpb246DQoJCUlmIENPTkZJR19QTSBpcyBzZXQg
YW5kIGEgVVNCIDIuMCBscG0tY2FwYWJsZSBkZXZpY2UgaXMgcGx1Z2dlZA0KCQlpbiB0byBhIHhI
Q0kgaG9zdCB3aGljaCBzdXBwb3J0IGxpbmsgUE0sIGl0IHdpbGwgcGVyZm9ybSBhIExQTQ0KCQl0
ZXN0OyBpZiB0aGUgdGVzdCBpcyBwYXNzZWQgYW5kIGhvc3Qgc3VwcG9ydHMgVVNCMiBoYXJkd2Fy
ZSBMUE0NCgkJKHhIQ0kgMS4wIGZlYXR1cmUpLCBVU0IyIGhhcmR3YXJlIExQTSB3aWxsIGJlIGVu
YWJsZWQgZm9yIHRoZQ0KCQlkZXZpY2UgYW5kIHRoZSBVU0IgZGV2aWNlIGRpcmVjdG9yeSB3aWxs
IGNvbnRhaW4gYSBmaWxlIG5hbWVkDQoJCXBvd2VyL3VzYjJfaGFyZHdhcmVfbHBtLiAgVGhlIGZp
bGUgaG9sZHMgYSBzdHJpbmcgdmFsdWUgKGVuYWJsZQ0KCQlvciBkaXNhYmxlKSBpbmRpY2F0aW5n
IHdoZXRoZXIgb3Igbm90IFVTQjIgaGFyZHdhcmUgTFBNIGlzDQoJCWVuYWJsZWQgZm9yIHRoZSBk
ZXZpY2UuIERldmVsb3BlciBjYW4gd3JpdGUgeS9ZLzEgb3Igbi9OLzAgdG8NCgkJdGhlIGZpbGUg
dG8gZW5hYmxlL2Rpc2FibGUgdGhlIGZlYXR1cmUuDQoNCldoYXQ6CQkvc3lzL2J1cy91c2IvZGV2
aWNlcy8uLi4vcG93ZXIvdXNiM19oYXJkd2FyZV9scG1fdTENCgkJL3N5cy9idXMvdXNiL2Rldmlj
ZXMvLi4uL3Bvd2VyL3VzYjNfaGFyZHdhcmVfbHBtX3UyDQpEYXRlOgkJTm92ZW1iZXIgMjAxNQ0K
Q29udGFjdDoJS2V2aW4gU3RyYXNzZXIgPGtldmluLnN0cmFzc2VyQGxpbnV4LmludGVsLmNvbT4N
CgkJTHUgQmFvbHUgPGJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbT4NCkRlc2NyaXB0aW9uOg0KCQlJ
ZiBDT05GSUdfUE0gaXMgc2V0IGFuZCBhIFVTQiAzLjAgbHBtLWNhcGFibGUgZGV2aWNlIGlzIHBs
dWdnZWQNCgkJaW4gdG8gYSB4SENJIGhvc3Qgd2hpY2ggc3VwcG9ydHMgbGluayBQTSwgaXQgd2ls
bCBjaGVjayBpZiBVMQ0KCQlhbmQgVTIgZXhpdCBsYXRlbmNpZXMgaGF2ZSBiZWVuIHNldCBpbiB0
aGUgQk9TIGRlc2NyaXB0b3I7IGlmDQoJCXRoZSBjaGVjayBpcyBwYXNzZWQgYW5kIHRoZSBob3N0
IHN1cHBvcnRzIFVTQjMgaGFyZHdhcmUgTFBNLA0KCQlVU0IzIGhhcmR3YXJlIExQTSB3aWxsIGJl
IGVuYWJsZWQgZm9yIHRoZSBkZXZpY2UgYW5kIHRoZSBVU0INCgkJZGV2aWNlIGRpcmVjdG9yeSB3
aWxsIGNvbnRhaW4gdHdvIGZpbGVzIG5hbWVkDQoJCXBvd2VyL3VzYjNfaGFyZHdhcmVfbHBtX3Ux
IGFuZCBwb3dlci91c2IzX2hhcmR3YXJlX2xwbV91Mi4gVGhlc2UNCgkJZmlsZXMgaG9sZCBhIHN0
cmluZyB2YWx1ZSAoZW5hYmxlIG9yIGRpc2FibGUpIGluZGljYXRpbmcgd2hldGhlcg0KCQlvciBu
b3QgVVNCMyBoYXJkd2FyZSBMUE0gVTEgb3IgVTIgaXMgZW5hYmxlZCBmb3IgdGhlIGRldmljZS4N
Cg0KVGhpcyBzZWVtcyB0byBpbmRpY2F0ZSB0aGF0IExQTSBpcyBvbiBkZXZpY2UgZHJpdmVyL2Nv
bnRyb2xsZXIgbGV2ZWwgcmF0aGVyIHRoYW4NCm9uIGhpZ2hlciBsZXZlbHMgbGlrZSBSTkRJUy9O
Q00gPw0KDQoNCldoaWxlIEkgcmVtZW1iZXIsIEkgdHJpZWQgdG8gY3JlYXRlIGJvdGggYSBOQ00g
YW5kIGEgdHR5QUNNIG9uIHRvcCBvZiBteSBkd2MzIGdhZGdldA0KYnV0IHRoZW4gSSBnb3Qgc29t
IGJpbmQgZXJyb3Igd2hlbiBhY3RpdmF0aW5nIHRoZSBVREMuIElzIHRoYXQgZXhwZWN0ZWQgPw0K
SSBmaWd1cmVkIGJvdGggY291bGQgbGl2ZSBvbiB0aGUgc2FtZSBkZXZpY2UgYW5kIHdvdWxkIGp1
c3QgbXV4IHRoZSB0d28gcHJvdG9jb2xzLg0KDQogSm9ja2UNCg0K
