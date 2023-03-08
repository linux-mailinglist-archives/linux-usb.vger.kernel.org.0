Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B1A6B13CF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 22:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCHV06 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 16:26:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjCHV04 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 16:26:56 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::624])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3795D227B9
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 13:26:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwSKoXvou8zMe+EDpMLaIwPi8ljL3MJcUJPrcZajX9R958KS/orNhLrqiJ5igSjK9VFjpJOkgvH/GiHV0QFguEJuyf2QSNabEbTePHr6BQMLqpIxmnCaVl3IhDdrIu2UvOfZQ3IlkhCMR+iQq5CyFCQiiWVueUigrnk68gvTaQNGqw3BSbqKXYrAux0iSPHyeUwE5MlhbbsZFvVU9THEvtPbcG4ZHK6G7NHhxo86IcujPuH8vUuyMZNKKY3fWTU+3GxoiLDJ0KAtWHoBdrLE6HHblo633mJALGILB/pIrBNI8cycn6RWSBRCq6tG/UL4Bd1M8wOyebPd8GqnEDs7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbtdZz9cIJ4+wgYrMSReuSTm4lRZkv7VZxrI15dZVwo=;
 b=dT468YmeZHNSBWaph5GVxx4p1kJc8PvyoxGEdx6vXtl8pmjFIsi/5xaUUI6airqNBrWxfBHhgNWwPBP3AKjheE5pIKffNQFS4FR30kQwjFNSPMjux+cqcuN8bY81qH3SEP/DYSs/Vkhj9kB/qSgxVwsGMPM3N377eBvD2UrdvdUU8v6Go3hUZ1XYiaNZs1qvO4V2Gav+WZLHSsMWW7v+q71TbJip/M7Crn2jt/mGXBkF+7vRd1n6AUHzXsYoKoPCHsXcrOrK22sg7KgLAwIadHVWM/d9BDR6liM4fmYaTwooE8j7VQeAj4bE7+9rZeEDFyKSDHiobmJpgaEKUfCf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbtdZz9cIJ4+wgYrMSReuSTm4lRZkv7VZxrI15dZVwo=;
 b=frO3pcBXTfdL0WRYW8elzPqSI7x/2MeCVDg1FbuvOSYIUkMZwE6VEGCWz6tL0Fx4UUC34/f7Oq3IiuQ6uSuw9kwlx6rWoJE51L+4iSQr+CBSyJQOmYJKPt7D2gErOGWGf+RsCxR9guhRCjd2Zv611mfS8S38qCwd4WUM3IAFslttqjvPWVGYD0verUel+RamPT3Pq1TYHvnpfZoMvphcE6wfdUhBNx94O7SvlEpHFOSf7OUzy/pr5q5ygVq22EMbW47PTeEtz1VhbRjO8JUA1ZTK2tT6GJxBmm/8o6VFlq/v2zRXwn0ir3Lq1aechkZ+n2oDW3AylzNqB0IqkSAUAw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CH3PR10MB7353.namprd10.prod.outlook.com (2603:10b6:610:12c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 21:26:50 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 21:26:50 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUA
Date:   Wed, 8 Mar 2023 21:26:49 +0000
Message-ID: <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
         <ZAjE+p4IoXk/kvXu@kroah.com>
         <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
         <ZAja0So7EDH5FfI0@kroah.com>
In-Reply-To: <ZAja0So7EDH5FfI0@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CH3PR10MB7353:EE_
x-ms-office365-filtering-correlation-id: e708690f-fbf0-4a0d-3d3f-08db201bd442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UCcTsh4AQ9BKCaGmFC0QU+WEixjbufReKs1QYuoFtSQEVsv4cKX744w6blFR9qPo3SgfEY/+4dVUMRZByLrwdBGE3n9dfRhS8+0XajQvtbGllusYjb6P3iOac/bREKKPcSWZzyhCDi9uUlCjmRXkHwSs/rwhBjwue4p2nMg6U+0ZLuYS+g3dLW2c5Kw9LM2opu5Z0DElicN5DGsZKCsSyXPL6pxekzCU2+zL9pL299uXKFUflIuJZ+ZAxVQIFPBWGWGvoI018mWbIhl9MkbC/6F4ygMgfYJdVpTrG8XvbVlslKRfgI+HSpisMoAUe7jHxw53kIZxXuRcNSSLoQJOy1GyMEsXUSj1jz4Fv4yhyDLFV6VnLqhNJk+jeyU+SkcR4AvDHm/uShg1tjR+RVN2M1VNSCGHtnL413hKRWSv+JHbcY/NrZHijndhGw+HfVwcCrlhbxw5HxD+YMdobFsu9svOzO+ZcXwikR6RCjJG3KiUDdbXt/gqt1vfRgmsQn+iMTWtICcBDVAGlMq/3Tfu8ZGGTN1BlYQRWFaSK8fjRccaiq85p9qZhcKOIdOy7cOhJ5XlKU5QQi0SUQtjUoXQa5XxiysgQNcgFItNbpTA3bPsBnzQBHoNmZKGU5ZvGsjxthJn8QevjEZRlGGHBmcRH96cwibCMjS0u0h0bhW4P5R5/EhY+hqHcTusky3MvNkyeQEaPPlNRXPPXI8cRPBd+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199018)(71200400001)(86362001)(38100700002)(4326008)(8676002)(316002)(54906003)(66476007)(41300700001)(76116006)(66946007)(91956017)(66446008)(6916009)(64756008)(5660300002)(36756003)(66556008)(8936002)(83380400001)(122000001)(2906002)(6506007)(186003)(6512007)(2616005)(478600001)(38070700005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVpuNWVxRGZzMXRiVWJ3WjRoVTNUMTlDT2lKS3VwSURJaHhjTXh5WUFWTjNJ?=
 =?utf-8?B?UlpFdS9uQjF3MUxUdkNZTWswRXZtZjhaSTU3UWczMnFSdy9LdWh4dmlOa1pW?=
 =?utf-8?B?b3g0SGhNUWU5UXYxb0FRN3lNL1Z3NmRZbGRyQ2hFVjVPZGQ2eW90eDRBTTd3?=
 =?utf-8?B?QUtZNGNuN09QWitJVldQQUxOemZLZStEci9VYWJRUEtjNDVneDhqbGdzM3Fp?=
 =?utf-8?B?YmhCMSswSHM4a3dsREJuNkdMdHNMZGpQQ0d1YmV2T204Y0E5MER4ME44cGxy?=
 =?utf-8?B?MXAyMHRrWkRGdk51NFMzTEg5QnAwWXVHd25UVmV2RlVhTDhubFY1Z2g1SEQx?=
 =?utf-8?B?cmNyRlJVcWlWK0JWNFo0WGdvaXczNkxIdzV5YnJyYUhmRVdkclBCVlRQSVdD?=
 =?utf-8?B?Nk5KUHBHR1QwUUZhQkhlR2x5NndEaC9ZdEFQcnBHRlFNTlREdzFkU2hVTzVZ?=
 =?utf-8?B?andmNXcvRVZudVFzMEVwS0dJK3dmZk5wZWtuWVZxemRKbFRhSDlEVkYwQWJK?=
 =?utf-8?B?YkxkNlo5WWh4OEo2TGFjc3YxbHF4L25WaGNqZDkrNFJmV0xyYzhPd3k2WDJj?=
 =?utf-8?B?QnNCaXphd0hYK0lKWnd1anJlK0E0VC9mVGhSa1lPZHZlWEl0bUE1dm50QkVN?=
 =?utf-8?B?SVFHd3p5T0Q5Y2VvOFNNVmRWZzZoRzRRbDNrRzZZSEo2TVR0aHF0cDBqT3Vm?=
 =?utf-8?B?aXRCT2dPNWJoRnVaM0pZSldhUFArRERTUW5nQkV1d2VUeWdPMjdVYnYzQm4r?=
 =?utf-8?B?QW1yKzJsVXFhMUJjYmxjWjJaQjNLSElnd0UyTG51UU1maHorMTZqdWtHRDFV?=
 =?utf-8?B?WklOeFoxa1duVWhGSWZYajVDSTE4aHZIOVVSNWhmTVJNVEpqekVSMWk4Vmta?=
 =?utf-8?B?SWhRSERTL0NQZUhvZkRMK1JJRzdmNUE0TEZ4WUlxYnFEc0w4U3NCTXBvRk5v?=
 =?utf-8?B?Wk9tczV1T21EbXNjWS9iVTB0Q2NuM1pYL3NzeFc2SGV1Q3YvZ0xCbnhYc2FY?=
 =?utf-8?B?dXdjSXZQUGhhTTlNY1FCSFlHYURwOHZKa05pODAvRHdaTGJVNzhnN1J0b1cv?=
 =?utf-8?B?ejQyOVJJZUx0RXpkUGNkUXhtT2s2NnJQY0ZWTUd5bFJFeFY4QWNpblNzaG11?=
 =?utf-8?B?ajEycTh5a29ITk1BU1JManpJbVJQcXUzcUVCYndYMWNFVEhObUVLZ0xwcXJk?=
 =?utf-8?B?aTZmU2d1QzlRbnAweko0VU1SMkJZMXBCRmxsbFBMdDFWb0wzQ3M5bmFKdmhr?=
 =?utf-8?B?MGlwNkUwZm10RmFlcDhmS1JkMDhXeHp6YmxNMEpXL2RVSk1ZOFE4M3FTRWgy?=
 =?utf-8?B?M2JlQ0FZdmlOaHllRk1yYW9mbi8rQkt0WDVjT3BoSjcrMTJOL3pkbE1NK01G?=
 =?utf-8?B?UGVQMmFKTXNzcnNZUlFYRDJuaFRKUlk5Q1BNNHg5RC9XemI2TGh6VGozTjdQ?=
 =?utf-8?B?Um9uRTdPdmJzNm04S1llSEVvM2V5a0xuNjhJQVpUUEJ1NFpXY1Y3ZTFFc3pS?=
 =?utf-8?B?bkExNnorS1J6dVlFVUNGUmdUd09rYjdiSlMvb1ozazlxLzEyT2xxS2RpVUVX?=
 =?utf-8?B?azNlSEF0aFNBY2Z4elROdys4c2k1b1BZcURPR2daUnhJODA3VXRjY3dPeko4?=
 =?utf-8?B?dDhPMUwzR3dIU3VRZGYxWmRrU09FSXFQaFNZOUxDcjlBd1lZUnR6UDkycWtK?=
 =?utf-8?B?RWVuWXRnQ3NsMGxMeGhDMXZTaTdjTkZCc2JoWk1lV0dmVUN0L1RrMi91Tm5t?=
 =?utf-8?B?VnFReVJQcGI4blNmRi9jMFBlbzZ4bDhHTUZXeUdLNmRjUnVTRS9JVGRVVEcw?=
 =?utf-8?B?MTZMc3RhM3g1RXhzQ05vNEJxNlh6dTlkK0NHWXo5MDJXTjdhbk5EM21sOVRG?=
 =?utf-8?B?WlB5d1BRdFFnY0dEOUhFMnF0aWFpZXlaanE5Vk5tcXM0c1p3a3NqdzBRem1j?=
 =?utf-8?B?WGJDWEZPZnpYM1lXc0RHaG0xeFlTYWVtMXI2NUV5THRmZTJEd08zSXpFcEJi?=
 =?utf-8?B?bDIwRkhDRWJsZGpTcFRZMnEwZVdydUptbzlOL1gyUjFvY3ViYTNHZ2ZkQ2Nk?=
 =?utf-8?B?RWxrQ1lwU3lMdlVaVEJNTEoxcXBZSVE0VWgxclQ0SFNIbDYrZkVnSUxMQU9R?=
 =?utf-8?B?dVFhTU9hSG1QMDhES1E5K2ljYkJSa1owYjJNY0ZHSGpBampwcG52VkVrNEN3?=
 =?utf-8?Q?vVcwzf+QUL4GORn5lFgFGiiaY92PfSZgog7P11cIuaum?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8649068C84FE8740A8CEB632CD0AEE61@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e708690f-fbf0-4a0d-3d3f-08db201bd442
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 21:26:49.9905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5i1YForGCytzjEaSFgMKyGUQdKs2hxNrE8KDDJWor0yiUQ1gE8zN0q2QyO0gJc24csKS5MfjfL+BXeZIxg2EjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7353
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIzLTAzLTA4IGF0IDE5OjU4ICswMTAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gV2VkLCBNYXIgMDgsIDIwMjMgYXQgMDY6MTI6NTFQTSArMDAwMCwg
Sm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMTg6MjUg
KzAxMDAsIEdyZWcgS0ggd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNTox
MDoxN1BNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiB3ZSBhcmUgdXNp
bmcgZnNsLWxzMTA0M2EtcmRiIGJhc2VkIGRlc2lnbiBidXQgd2l0aCBhIGxzMTAyM2EgU09DIGFu
ZA0KPiA+ID4gPiB1c2UgVVNCMCBpbiBnYWRnZXQgbW9kZSBydW5uaW5nIGVpdGhlciBOQ00gb3Ig
Uk5ESVMgZXRoZXJuZXQgb24gdG9wLg0KPiA+ID4gPiANCj4gPiA+ID4gV2hlbiB3ZSBjb25uZWN0
IHRoZSBnYWRnZXQgdG8gYSBQQyhMaW51eCBvZiBXaW5kb3dzKSBvdmVyIGFuIFVTQjIgaHViLA0K
PiA+ID4gPiBuZXR3b3JraW5nKE5DTSBvciBSTkRJUykgd29ya3Mgd2VsbC4NCj4gPiA+ID4gDQo+
ID4gPiA+IEhvd2V2ZXIsIHdoZW4gd2UgY29ubmVjdCB0aGUgZ2FkZ2V0IGRpcmVjdGx5IHRvIHRo
ZSBQQy9sYXB0b3Agd2hpY2ggdXNlcyBVU0IzDQo+ID4gPiA+IHdlIHNlZSBzb21ldGhpbmcgb2Rk
Og0KPiA+ID4gPiAgIFBpbmcgZnJvbSBQQyB0byBnYWRnZXQgd29ya3MuDQo+ID4gPiA+ICAgUGlu
ZyBmcm9tIGdhZGdldCB0byBsYXB0b3AgZG9lcyBub3QuIEhvd2V2ZXIgaWYgd2UgYWxzbyBwaW5n
IGZyb20gUEMgYXQgdGhlIHNhbWUgdGltZSB3ZQ0KPiA+ID4gPiAgIHNlZSBnYWRnZXQgdG8gUEMg
c3RhcnQgd29ya2luZy4NCj4gPiA+ID4gU2VlbXMgbGlrZSBwaW5nIGZyb20gdGhlIFBDIHRpZ2dl
cnMgdGhlIGdhZGdldCB0byBzZWUgaW5jb21pbmcgcGtncyBzb21laG93Lg0KPiA+ID4gPiANCj4g
PiA+ID4gQW55IGlkZWEgd2hhdCBtaWdodCBiZSB3cm9uZyBvciBob3cgdG8gZGVidWcgdGhpcz8N
Cj4gPiA+ID4gS2VybmVsIDUuMTUuODcNCj4gPiA+IA0KPiA+ID4gNS4xNS55IGlzIHZlcnkgb2xk
LCBkb2VzIHRoaXMgYWxzbyBoYXBwZW4gb24gNi4yPw0KPiA+ID4gDQo+ID4gDQo+ID4gSSBqdXN0
IHRyaWVkIDYuMS4xNSBhbmQgdGhlIHByb2JsZW0gcmVtYWlucywgSSBob3BlIHRoYXQgaXMgY2xv
c2UgZW5vdWdoID8NCj4gDQo+IEl0J3MgZ29vZCBlbm91Z2ggOikNCj4gDQo+IEhhdmUgYW55IGxv
Z3MgYXQgYWxsIHRoYXQgc2hvdyBhbnkgcHJvYmxlbXM/DQo+IA0KTm8sIGRvbid0IGtub3cgd2hl
cmUgdG8gc3RhcnQuIFRoZXJlIGFyZSBubyBlcnJvcnMgbG9nZ2VkLg0KDQo+ICAgQWxzbywgeW91
IG1pZ2h0IHdhbnQgdG8NCj4gIGNjOiAgdGhlIGR3YzMgbWFpbnRhaW5lci4uLg0KDQpJIHRob3Vn
aHQgSSBkaWQgYnV0IHRoYXQgbG9vayBsaWtlIG9sZCBpbmZvLCBhZGRlZCBUaGluaCBOZ3V5ZW4g
bm93LCB0aGFua3MNCg0KIEpvY2tlDQoNCj4gDQo+ICB0aGFua3MsDQo+IA0KPiAgZ3JlZyBrLWhq
DQoNCg==
