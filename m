Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D495DB0947
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 09:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbfILHJd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 03:09:33 -0400
Received: from mail-eopbgr720077.outbound.protection.outlook.com ([40.107.72.77]:16450
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725765AbfILHJd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Sep 2019 03:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEK6Z1wGZPjZeagNGXL9CtqRqKKVMtkKW7drZkZ7jenXYp1og3Vg9HLbqjQy3E4tNPpKqx32xlALFT8QNi5al3lQhjmArPYHBrJVH3pZ+HCdwdAWTZf7r3QGEX8CdA7PEkDa8PQtsOY/RmEcL7jxWcR8Napydd4jnjN3esZnRcQCmvSNT5FsQhNFeZFRkDXWr9Dhh8Gj/A6+yNlCniMudMkDuTS05TeirC6B29BXUjA6fWjWsDvSDJHffadumPvaY2b68s3Ke+jDOM/rwPZ1QkqNOI93nXntxX4XgQKsnUAbzqcouh/aDVr9z2BOPZVafAF57aq4a1QXvVmC8ya5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyDu0ef5BuQo75tAxbOH7CXHaP+Saw1gz6U7tJi4Nps=;
 b=IvDdqeVwZkz80xa+mrg5o5Im1R5gX7yT0x18bclq9yWshv/2Ljjn/lYAqAqAB4uwwnP2gZcDlgwktJR1uODF07KRPBZU3YIfaGsw0cIRyzNjfKn33G1pzH1QB8E8J4VFUaM9ylSXhnloazk3MIt7P4/SUj7HoYw2dDe0B8MCZzn/pxVb6P8TSczkmRbSmFt7zkc1kaKeJZaOviXvgeixkkS8hEYVa6YH+gwrX4nK2NB4a0e7WKOqQL6JfvGxRIc1uqNf3x/YmB+eXgSsYrbJiViq60qANG+gfHl1sqvDLlBg6fCYECR47CkCLYcVLldasu6e9AOMliyVQhWEhH2LHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyDu0ef5BuQo75tAxbOH7CXHaP+Saw1gz6U7tJi4Nps=;
 b=V5iPgSLXaKmCp56/+rXpf1zNTnPLpIwQBOVw1meBvk1PkVbQjsohOwYxr4J2O0E+/cgBqjlTKoMfcj0KPFU8puR/QNaLHoqjQOlDHOCVVLYxWBwHOGz0gTy45S0hXDB6ztylT/Lol0hIWozhdIN6qPpKEG3N1DEr9JiGgv2bPdM=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.77.152) by
 BN8PR10MB3411.namprd10.prod.outlook.com (20.179.138.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 07:09:29 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::e0e3:696d:ad87:592]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::e0e3:696d:ad87:592%7]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 07:09:29 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM and BREAK chars ?
Thread-Topic: ttyACM and BREAK chars ?
Thread-Index: AQHVaJ3+9xKYLNcbx0KMaPN/wPJq3acmh1uAgAADbACAAEEdgIAA1OgA
Date:   Thu, 12 Sep 2019 07:09:29 +0000
Message-ID: <6e35e841122c1053ce0ec63383a883c7f58fca06.camel@infinera.com>
References: <f7e55901a096024af2d77ae7838df3b658f2c28d.camel@infinera.com>
         <1568211729.11279.6.camel@suse.com>
         <24612ff3f7cd87642a3ab298950be31f8945fcc2.camel@infinera.com>
         <1568226447.11279.8.camel@suse.com>
In-Reply-To: <1568226447.11279.8.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e1f7b01-3a29-4687-33c1-08d73750277a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BN8PR10MB3411;
x-ms-traffictypediagnostic: BN8PR10MB3411:
x-microsoft-antispam-prvs: <BN8PR10MB34113ABB0E7A09D956F548C3F4B00@BN8PR10MB3411.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(189003)(199004)(76116006)(229853002)(6486002)(25786009)(6116002)(3846002)(6436002)(53936002)(6246003)(476003)(5024004)(14444005)(6512007)(256004)(5660300002)(86362001)(99286004)(71190400001)(71200400001)(3480700005)(2616005)(316002)(110136005)(11346002)(446003)(118296001)(7736002)(102836004)(6506007)(14454004)(76176011)(186003)(26005)(486006)(305945005)(81156014)(8936002)(2501003)(36756003)(2906002)(8676002)(81166006)(66446008)(64756008)(66556008)(66476007)(91956017)(66946007)(66066001)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR10MB3411;H:BN8PR10MB3540.namprd10.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z9KP1nTTJ9J6lXZNL2B/kHD6XT3/MfKAb9adFU+x2nLuhDECtKaa8YzNe64dz/UP8Y+MR/Y8uH0X+APMrT//JP6Du9Oq8Rxes9Fld5eZ6vzxU5Liu5Zd0xu7sCAsyj5qoDvqRFEc4LFiYPutW6VtYHZiDO5vZEgxPVfPQDJj+UJ4ZkEj/pts953V4h4BdCD8Wq0YwhzAvtZwGuVyBf+nQIW1m/zz8dERAyIqQ4MG556pcYq5aEmADELWLFRBpzLIzlb0b5+9ZKXJOQXGz1hC5XQLrnBcsWsbYZQsCKNGmMisgJwpP5nLlXyWyx2PxA1NsiRwuvo2NuoG9Uw89Nh1govtLCRZYLK5GCMPQYPH63j5LrbtawwiQA6Dpnt6kP6NT1eLJgA0oc5iFX5Uxujh702+4Y7llIGj7sRgsqsjeng=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2FD1E4C9BA8DB41B3C2619549C69F90@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1f7b01-3a29-4687-33c1-08d73750277a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 07:09:29.3826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSATfASLfCQrXPkHkRcgv2aFwWAoHnZLs78QvVJ5LPq9u95kku3LO/+yBdvX3ASKtOSB0EOLquCr+BvWx85MzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3411
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDE5LTA5LTExIGF0IDIwOjI3ICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiBBbSBNaXR0d29jaCwgZGVuIDExLjA5LjIwMTksIDE0OjM0ICswMDAwIHNjaHJpZWIgSm9ha2lt
IFRqZXJubHVuZDoNCj4gPiBPbiBXZWQsIDIwMTktMDktMTEgYXQgMTY6MjIgKzAyMDAsIE9saXZl
ciBOZXVrdW0gd3JvdGU6DQo+ID4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJv
bSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZS4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBBbSBNaXR0d29jaCwgZGVu
IDExLjA5LjIwMTksIDEyOjM5ICswMDAwIHNjaHJpZWIgSm9ha2ltIFRqZXJubHVuZDoNCj4gPiA+
ID4gRXZlcnkgbm93IGFuZCB0aGVuIG15IHR0eUFDTTAgaGFuZ3MgdXAgb3Igc2VuZHMgYSBCUkVB
SyBjaGFyIHRvIG15IGRldmljZS4NCj4gPiA+ID4gSSBhbSB0cnlpbmcgdG8gbWFrZSB0dHlBQ00g
aWdub3JlIGluY29taW5nKG92ZXIgVVNCKSBhbmQgbm90IGVtaXQNCj4gPiA+ID4gYW55IEJSRUFL
IGF1dG9tYXRpY2FsbHkgdXNpbmcgdGVybWlvcyAoSUdOX0JSSykgYnV0IHRoYXQgZG9lcyBub3Qg
bWFrZSBhIGRpZmZlcmVuY2UuDQo+ID4gPiA+IA0KPiA+ID4gPiBJcyBCUkVBSyBoYW5kbGluZyB1
bmltcGwuIGluIHR0eUFDTSA/DQo+ID4gPiANCj4gPiA+IGFjbV9zZW5kX2JyZWFrKCkgaW1wbGVt
ZW50cyBpdC4NCj4gPiANCj4gPiBZZXMsIEkgc2UgdGhhdCBmdW5rdGlvbiBidXQgSSBkb24ndCBz
ZWUgaG93IG9uZSBjYW4gaWdub3JlIHJlY2VpdmVkIEJSRUFLcw0KPiA+IElmIEkgc2V0IElHTl9C
Uksgb24gL2Rldi90dHlBQ00wIEkgZXhwZWN0IHRoYXQgZXZlcnkgQlJFQUsgc2hvdWxkIGp1c3Qg
YmUgaWdub3JlZA0KPiANCj4gSGFuZGxpbmcgYnJlYWtzIGxvb2tzIGEgYml0IGJyb2tlbiBvbiBD
REMtQUNNLg0KPiBDb3VsZCB5b3UgdGVzdCB0aGUgYXR0YWNoZWQgcGF0Y2g/DQo+IA0KU3VyZSwg
SSBjYW4gdGVzdCBpdCBidXQgZnJvbSBsb29raW5nIGF0IHRoZSBwYXRjaCBpdCBzZWVtcyBsaWtl
IEFDTSBhbHJlYWR5IGlnbm9yZXMNCkJSRUFLcyhoYXJkY29kZWQpIGFuZCB3aXRoIHlvdXIgcGF0
Y2ggeW91IGFjdHVhbGx5IHN0YXJ0IHJlcG9ydGluZyB0aGVtLg0KDQpNeSBwcm9ibGVtIGlzIHN1
ZGRlbiBkaXNjb25uZWN0cyBJIGNhbm5vdCBleHBsYWluIGJ1dCBJIHRoaW5rIHRoZXkgYXJlIGNv
bm5lY3QgdG8gQlJFQUtzDQpJIGhhdmUgc2VlbiB0aGVzZSBlcnJvcnMgaW4gZG1lc2cgdGhvdWdo
LCBub3Qgc3VyZSBpZiB0aGV5IGhlbHAgdGhlIGRpYWdub3NlOg0KWzE4MTc4MC4xNjc5ODddIHVz
YiB1c2IxLXBvcnQ2OiBkaXNhYmxlZCBieSBodWIgKEVNST8pLCByZS1lbmFibGluZy4uLg0KDQpb
MTgxNzgwLjE2ODIwOF0gY2RjX2FjbSAxLTYuMzoxLjE6IGFjbV9jdHJsX2lycSAtIHVzYl9zdWJt
aXRfdXJiIGZhaWxlZDogLTE5DQpbMTgxNzgwLjE2Nzk5Nl0gdXNiIDEtNjogVVNCIGRpc2Nvbm5l
Y3QsIGRldmljZSBudW1iZXIgMzANClsxODE3ODAuMTc2NTQ4XSB1c2IgMS02LXBvcnQyOiBhdHRl
bXB0IHBvd2VyIGN5Y2xlDQpbMTgxNzgxLjc3Mjg0N10gdXNiIDEtNi4zOiBVU0IgZGlzY29ubmVj
dCwgZGV2aWNlIG51bWJlciAzMg0KWzE4MTc4MS43NzMxMzRdIGNkY19hY20gMS02LjM6MS4xOiBm
YWlsZWQgdG8gc2V0IGR0ci9ydHMNCg==
