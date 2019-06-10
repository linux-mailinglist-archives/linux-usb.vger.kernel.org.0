Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5BE83B0C4
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 10:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387947AbfFJIdW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 04:33:22 -0400
Received: from mail-eopbgr740057.outbound.protection.outlook.com ([40.107.74.57]:7232
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387862AbfFJIdW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 04:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcUWDiDkMVQUd19+ig1ZQgtOay7qj5SoRX9ggV3h6+8=;
 b=J9LsCZUvYM7aGxvST2JPmPMAEBYDvLhLfKBVGJWVXoHVMYhdHmMhjTZdgrEvMLpjcfOdTOMoEA1Y+lS0b+sui/zWC4Q4OKA+oIVqJ/Flt3mbqlSfPLRpnwUToqU/7N9ssV99niZVJq5PAIeJoH0T6one5EIy6IUfyDE58SZrHno=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3684.namprd10.prod.outlook.com (20.179.96.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Mon, 10 Jun 2019 08:33:17 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8%6]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 08:33:17 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: fsl_udc status?
Thread-Topic: fsl_udc status?
Thread-Index: AQHVH2FeViVekb5FTkyBYafYtN/FkaaUhSqAgAAKXoA=
Date:   Mon, 10 Jun 2019 08:33:17 +0000
Message-ID: <9171a0e63bebaa0efaec64838f9a1c6982fc33e8.camel@infinera.com>
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
         <87v9xdc1ra.fsf@linux.intel.com>
In-Reply-To: <87v9xdc1ra.fsf@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0eeba7c0-866b-4857-c7e8-08d6ed7e495f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN8PR10MB3684;
x-ms-traffictypediagnostic: BN8PR10MB3684:
x-microsoft-antispam-prvs: <BN8PR10MB36848EA39C71DF8CF56F5490F4130@BN8PR10MB3684.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(136003)(366004)(376002)(396003)(189003)(199004)(110136005)(14454004)(76176011)(2501003)(66946007)(478600001)(53936002)(36756003)(6246003)(102836004)(72206003)(6506007)(64756008)(66446008)(73956011)(5660300002)(66066001)(66476007)(66556008)(76116006)(91956017)(316002)(7116003)(2906002)(7736002)(6436002)(71200400001)(71190400001)(2201001)(118296001)(6512007)(446003)(26005)(186003)(11346002)(305945005)(4744005)(6116002)(256004)(3846002)(68736007)(8676002)(99286004)(6486002)(86362001)(81156014)(25786009)(486006)(476003)(229853002)(81166006)(8936002)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR10MB3684;H:BN8PR10MB3540.namprd10.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0nvHjYIBJOu8Y8/uzFdXiR2+iDA146+nmosM1aT2wYMsaNk0F/6gtD6ZE/yiTVwwHH0pv6CkE86Lp6hlXL/tFg1uDkGYFA4O9Z4yjywp5Qk4K93LUBJgPxTh3NPSydrn/HOlGjXU1+87E4O7Il1M/JoIYEjC7/VI0KBOl5oTyeWwe9n5nDU+Zxv2Fh6D1mmWN79dBpyhtDWI1wvirSkJZTgJ7dDGggZa214PGKK1YnGU1gWcTfQGKmDcj/G+JphYn9m5w4N7kJqWwOLSyYygAqQ2eYzaRLnNaVFbpvyjFpcshwupqt4U2rlRDE01tqlHan48HJIAP79sJbkSHsO49WmMAUMnk87tahjjW8fLDzdccsKGLoQvlGqs5zf87hKulTm8wDEvyL45y4OswS1bDP+wvMaYTYCLg1LpAiutBxg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F274123C9DAAF2478D9D37E734D028B3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eeba7c0-866b-4857-c7e8-08d6ed7e495f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 08:33:17.0760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jocke@infinera.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3684
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDE5LTA2LTEwIGF0IDEwOjU2ICswMzAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+
IEhpLA0KPiANCj4gSm9ha2ltIFRqZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5j
b20+IHdyaXRlczoNCj4gPiBXZSBhcmUgdHJ5aW5nIHRvIGdldCBmc2xfdWRjIHVwIGFuZCBydW5u
aW5nIG9uIGEgVDEwNDIgd2l0aCB3aXRob3V0IHN1Y2Nlc3MuDQo+ID4gU2VlbXMgbGlrZSB0aGlz
IGRyaXZlciBpcyBsYWdnaW5nIGJlaGluZCB0aGUgY29ycmVzcG9uZGluZyBob3N0IGRyaXZlciht
cGgpLg0KPiA+IFRoZSBtcGggZHJpdmVyIGhhcyBhIG51bWJlciBvZiBVU0IgZXJyYXRhIHdvcmth
cm91bmRzIHdoaWxlIHVkYyBoYXMgbm9uZS4NCj4gPiBBdCBsZWFzdCBlcnJhdGFzIEEwMDc3OTIg
c2VlbXMgYXBwbGljYWJsZSBmb3IgdWRjIHRvby4NCj4gPg0KPiA+IElzIHRoZSBmc2xfdWRjIGRy
aXZlciBmdW5jdGlvbmFsIG9uIDQuMTQueCh3aGljaCB3ZSB1c2UpPyBXaGF0IGlzIG1pc3Npbmcg
Pw0KPiANCj4gSWYgeW91J3JlIG9uIHY0LjE0LCB0aGVuIHlvdSBuZWVkIHRvIGFzayBmb3Igc3Vw
cG9ydCBmcm9tIHdob2V2ZXIgZ2F2ZQ0KPiB5b3UgdGhhdCBrZXJuZWwuIEluIHRoaXMgZm9ydW0g
d2UgdHJlYXQgbWFpbmxpbmUgb25seSwgd2hpY2ggY3VycmVudGx5DQo+IGlzIGF0IHY1LjItcmM0
LiBVbmxlc3MgeW91IGNhbiB0cnkgdGhhdCB2ZXJzaW9uIG9mIHRoZSBrZXJuZWwsIHdlIGNhbid0
DQo+IHJlYWxseSBoZWxwIHlvdSBoZXJlLg0KDQpOb25lIGdhdmUgbWUgdGhhdCBrZXJuZWwsIGl0
IGlzIHRoZSBzdGFibGUgNC4xNC54IHRyZWUgdGhhdCBHcmVnIG1haW50YWlucywgSSB3b3VsZA0K
YXNzdW1lIHRoYXQgdGhpcyBmb3J1bSBoYXMgc29tZSBzdXBwb3J0IGZvciBzdGFibGUga2VybmVs
cyB0b28/DQoNCkxvb2tpbmcgYXQgdXBzdHJlYW0sIHRoZXJlIGhhcyBub3QgYmVlbiBhbnkgc2ln
bmlmaWNhbnQgY2hhbmdlIGluIHRoaXMgYXJlYSBmb3IgYSBsb25nIHRpbWUuDQoNCiBKb2NrZQ0K
