Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D87DDAFEC3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 16:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfIKOe2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 10:34:28 -0400
Received: from mail-eopbgr680063.outbound.protection.outlook.com ([40.107.68.63]:53734
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726525AbfIKOe2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Sep 2019 10:34:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FF2ONEDY9c+ZGBN0wn9d9LFnwsj3kAR8Bq21/17Ut4Il+BYwWaQMtksZ1lifGyqqU6x1C4fu0IXGp2mWUfSgkoJONpIUT27GxPi/MMpcdk/xpI1/UqWEi4RhayrRQJBvPLPIln5CDyrd24+fjf6XY2LfPFtNeyECrcBpavCOy9AXf96cyY4q0NNn68YWKAgvOioUp28vdpaL/1SBA1Rs3YYue4sCZ3tOEygZUdvkYMrvjFgZLtjZ+VLryQu9F79ruJt+ofudHOCMOyW2T7LgltkQ2mk+2w99w0193Koilq5uFoO50luxHBWr08YVRhYPGOzTUnVcou3W5bjbJGxqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beSk3DiFlfKW1SN/rw62XJ99uK7OYXOyBjgKYMrjUSU=;
 b=dIPriph8fTjNqGmP0H72KvRjvZdFZjmPNyJDPt3LDKuRFu1dtDj44gkrHRcFWthFGPxyimwGrn5rFD88tzzfkOF2uf358grTOeTCTWf2Pdx/Zg8BXXA5T4YouIhz02p6hsopHB9nq/zEZ957V7l1bWCCGL2wlS0OFxo9LO5Laz+mfRj+se3IRCRP21JU1Lr1+fFiDu3byRAnVde+XThANBT1L/8J1uUTyuMcB0kBhopLrf74TqbW8gZdZ4STd1bEuiNi9GFXo58pZ/NbfTftkX0kLUdgiPehlT4d4IAqQIjFz3f9o4Ajj1ewk6OfAsPlHaI3ERvlZMA7xhRS3T2vtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beSk3DiFlfKW1SN/rw62XJ99uK7OYXOyBjgKYMrjUSU=;
 b=SB2eoP2iOySjzCdPx0O27PW61sEbw0+B1W6/qTSc0n8BplYs2Sebah+SKPWjKDncKzTmWyfMu9K2J2pEhiqjjP5tztXqaPbxwQNo+Hl/VafhJmdqZOtH+/5f6RgOvP/d89x0VWIqMpvaV1ptbQYMhlZXClj2CFRQPT5YMbCFtNc=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.77.152) by
 BN8PR10MB3636.namprd10.prod.outlook.com (20.179.96.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 11 Sep 2019 14:34:25 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::e0e3:696d:ad87:592]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::e0e3:696d:ad87:592%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 14:34:25 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM and BREAK chars ?
Thread-Topic: ttyACM and BREAK chars ?
Thread-Index: AQHVaJ3+9xKYLNcbx0KMaPN/wPJq3acmh1uAgAADbAA=
Date:   Wed, 11 Sep 2019 14:34:25 +0000
Message-ID: <24612ff3f7cd87642a3ab298950be31f8945fcc2.camel@infinera.com>
References: <f7e55901a096024af2d77ae7838df3b658f2c28d.camel@infinera.com>
         <1568211729.11279.6.camel@suse.com>
In-Reply-To: <1568211729.11279.6.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b08164c-ff22-435c-74df-08d736c52550
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN8PR10MB3636;
x-ms-traffictypediagnostic: BN8PR10MB3636:
x-microsoft-antispam-prvs: <BN8PR10MB36363827723E02F62651F56DF4B10@BN8PR10MB3636.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(199004)(189003)(256004)(5024004)(66066001)(476003)(486006)(110136005)(316002)(8676002)(81156014)(81166006)(8936002)(118296001)(6486002)(229853002)(86362001)(2501003)(36756003)(2906002)(478600001)(25786009)(14454004)(6246003)(53936002)(6436002)(6512007)(3846002)(6116002)(305945005)(7736002)(99286004)(71200400001)(76176011)(71190400001)(186003)(5660300002)(102836004)(2616005)(26005)(66446008)(11346002)(446003)(64756008)(91956017)(76116006)(66556008)(66476007)(66946007)(3480700005)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR10MB3636;H:BN8PR10MB3540.namprd10.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sZhP6sGuJysQEQjO3YLHwasrD3Q1LdzLL39KXop1fh731KrFg3rg5MNmAgb9vpjXhCEE++EdUKBtqWNXw8RsnCjxKfTWzhZZMa8U4jHcUe3q0TD5Qg3pAeKI3jj3fYRWtxUNep3eb1aS2d1Eo+qrwJ/sx5HcmswGheZoaVH8yyAqUSsLs6s6c5L+KieiVgGAhYBorHkrFmid/1cS6HP0yXaQhwoPY0VM+jV/aKShu0pbpZVRVRKp4JOE/gvI+9zbnblsT1/KtTDBSjIykE1TGuLAn1p4rlBUKirhoWktGbEKGOt0fH2epN5VBp8q29eK8fejm1isLCiG6AB2xOG4GTQySwuEPJP5pQy8kp/G5SfxAve415bh+Bl+IuabaFA3lpwhGHY3u5yID5YRUf8qtfhZiy5GtHG8oX7k8EEiwp0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0025BA253A3D642BF80CEE9AE8F893F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b08164c-ff22-435c-74df-08d736c52550
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 14:34:25.6672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/c4ciHZHxkMVl5qttYgwEk1Tc+kN6VVjhUAdn17B1Dobvv71+UPuZZYU5NXXuIZZmxae0/UtYTz4EHbQo933Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3636
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDE5LTA5LTExIGF0IDE2OjIyICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdh
bml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiBBbSBNaXR0d29jaCwgZGVuIDExLjA5LjIwMTksIDEyOjM5ICswMDAwIHNjaHJpZWIg
Sm9ha2ltIFRqZXJubHVuZDoNCj4gPiBFdmVyeSBub3cgYW5kIHRoZW4gbXkgdHR5QUNNMCBoYW5n
cyB1cCBvciBzZW5kcyBhIEJSRUFLIGNoYXIgdG8gbXkgZGV2aWNlLg0KPiA+IEkgYW0gdHJ5aW5n
IHRvIG1ha2UgdHR5QUNNIGlnbm9yZSBpbmNvbWluZyhvdmVyIFVTQikgYW5kIG5vdCBlbWl0DQo+
ID4gYW55IEJSRUFLIGF1dG9tYXRpY2FsbHkgdXNpbmcgdGVybWlvcyAoSUdOX0JSSykgYnV0IHRo
YXQgZG9lcyBub3QgbWFrZSBhIGRpZmZlcmVuY2UuDQo+ID4gDQo+ID4gSXMgQlJFQUsgaGFuZGxp
bmcgdW5pbXBsLiBpbiB0dHlBQ00gPw0KPiANCj4gYWNtX3NlbmRfYnJlYWsoKSBpbXBsZW1lbnRz
IGl0Lg0KDQpZZXMsIEkgc2UgdGhhdCBmdW5rdGlvbiBidXQgSSBkb24ndCBzZWUgaG93IG9uZSBj
YW4gaWdub3JlIHJlY2VpdmVkIEJSRUFLcw0KSWYgSSBzZXQgSUdOX0JSSyBvbiAvZGV2L3R0eUFD
TTAgSSBleHBlY3QgdGhhdCBldmVyeSBCUkVBSyBzaG91bGQganVzdCBiZSBpZ25vcmVkDQoNCj4g
QnV0IHRoZSBzdXBwb3J0IGlzIG9wdGlvbmFsIGluIEFDTSBkZXZpY2VzLg0KPiANCj4gV2hhdCBp
cyBibUNhcGFiaWxpdGllcyBpbiBzeXNmcyBmb3IgeW91ciBkZXZpY2U/DQoNCkkgZm91bmQgb25l
IGJtQ2FwYWJpbGl0aWVzIGluIHN5c2ZzOg0KIGNhdCAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8w
MDAwOjAwOjE0LjAvdXNiMS8xLTYvMS02LjMvMS02LjM6MS4xL2JtQ2FwYWJpbGl0aWVzDQogMg0K
DQpMb2NrcyBsaWtlIG15IGRldmljZSANCg0KICAgSm9ja2UNCg==
