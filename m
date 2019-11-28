Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D110C8E0
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 13:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfK1Mqt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 07:46:49 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:37798 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726610AbfK1Mqs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 07:46:48 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A1C1942397;
        Thu, 28 Nov 2019 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1574945207; bh=dgFr/EKpcqsabbxP1kuYbYIbLbvZFSHSFny25wwI4s8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=N+BKjxJLjK02DHr8WceHvKEhLI1xPy5DSFIu4XYHpcGC/876jAKvm7g0wKhwasMwB
         4siS3xr5l2B2EgqvRzLyf9dNBbqtYXp0VO+3x18TU60TQ7PXjarfkYWMkkJM8U+bx5
         3ee79J9xnHyVtk6jilAh/SLOlDoiXq7MyzdwtiVmJ9iZ804dke1oiCe/6O14cQYDs7
         JWL+Yy2a7DoASIzKAka9YfMv+77oofK3scibN5uXiK5ZlxHQxnFDgrV3U5tOyB5pDY
         7YtTKGzdx8aiebqAy/H0fSuc0wsktRx9hqgQZUdnMgQE/6JtZX9387E8rFnzVZfWIJ
         p7cAEVOSeH4iA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 484A6A0079;
        Thu, 28 Nov 2019 12:46:47 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 28 Nov 2019 04:46:47 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 28 Nov 2019 04:46:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee7O+aEQU5MCrO7YgftCjHJ9O80D2UCiqQXXJdDcQVe6M6CaWBoJuJQVjk0lFOKK3UZd1LY65KJgOYrROo6lJn7VdlSy9wFvcCSyxkEUoMLvmByAUWsD7P+5CZLjXSmy75eHB2rMdrFr5i58PSYpika7SDsw1R6j53Zwso80Bn4xUsXvm4rNzTt2Bnm/v8ew8EKtkURkeUevVNG3sKTsv/tKEj7P7thqaQhAEILxjsor91ZR5JNFKy7ugKplce/97YJyfn00d2ZratVx4Ko/MKYpPUJhVnOK1zHSX8Z0NcZr8ltj0A1woxYLALUkrZfj4B46ePmPguXpH1QX77o+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgFr/EKpcqsabbxP1kuYbYIbLbvZFSHSFny25wwI4s8=;
 b=jYL8QbGF4S8BBZzIzjPrHQov52/TGttGRaZW63TId8eAKflbhLxSH9B0O5HGqmHZIc6tizXUvDiXpYZdY34CxvMp8xLq1HI6QlDOMvz8YM+EDw9MpyKUjP88iT95REhFoGJuvumTu/Gdz/mwb07z0Y49/fTPEtvaneFHAyrpQwBCL26kNNAjN+c5MThK7SyxncYI+p1VAB2sDJjH4QrOA7TeNMgVy2Hl/yUEeun94OMiqN1YSwcu5fAJrb+UJ9u56/4X9yMUCIXnjj4f4LTMgkg0FP6VM8emwe4J0n73p02PC1//kKZC0KfAlOTFaiWpyHxgCEQntdyePrqBHFjRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgFr/EKpcqsabbxP1kuYbYIbLbvZFSHSFny25wwI4s8=;
 b=piWKkfbVyDHUoyeM6TyGjS2Y3QZcNpnnFhvLerYzJnLEMANUzpwRu03BPMzdANnXVVf/LDTvBrS+wC2igiTiMoDY0+ZAIQPwCqVV3HdEKBmJ8G5921EfsuJmB1tGu01UuiDtXH1mZKZkEsvHp4zkbt8VQi/D+JIzDeUYZhr7vNA=
Received: from CH2PR12MB4088.namprd12.prod.outlook.com (20.180.5.200) by
 CH2PR12MB3975.namprd12.prod.outlook.com (52.132.247.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Thu, 28 Nov 2019 12:46:43 +0000
Received: from CH2PR12MB4088.namprd12.prod.outlook.com
 ([fe80::281c:344a:980f:e54e]) by CH2PR12MB4088.namprd12.prod.outlook.com
 ([fe80::281c:344a:980f:e54e%2]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 12:46:43 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Jun Chen <ptchentw@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Jun Chen <jun.chen@vatics.com>
Subject: Re: [PATCH] usb: dwc2: gadget: stall handshakes returned by control
 pipes in status stage
Thread-Topic: [PATCH] usb: dwc2: gadget: stall handshakes returned by control
 pipes in status stage
Thread-Index: AQHVj9LXB1Nv9YuOvE2ai4bkGHgDzaegtCCA
Date:   Thu, 28 Nov 2019 12:46:43 +0000
Message-ID: <da692cfb-2d23-cc24-8313-f1c836a9aa6b@synopsys.com>
References: <1572516292-23969-1-git-send-email-ptchentw@gmail.com>
In-Reply-To: <1572516292-23969-1-git-send-email-ptchentw@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6091e6c-ba33-4b03-70e5-08d7740105e2
x-ms-traffictypediagnostic: CH2PR12MB3975:
x-microsoft-antispam-prvs: <CH2PR12MB39756CDF983FABDA8621DD2AA7470@CH2PR12MB3975.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(346002)(39860400002)(376002)(366004)(199004)(189003)(6116002)(5660300002)(305945005)(3846002)(2906002)(6512007)(7736002)(4326008)(6246003)(66476007)(66946007)(76116006)(91956017)(31686004)(14454004)(66446008)(64756008)(66556008)(478600001)(31696002)(316002)(2501003)(86362001)(25786009)(229853002)(6436002)(8676002)(81156014)(6486002)(8936002)(99286004)(81166006)(110136005)(58126008)(65806001)(36756003)(65956001)(66066001)(446003)(102836004)(26005)(71190400001)(71200400001)(186003)(6506007)(2616005)(53546011)(14444005)(76176011)(11346002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:CH2PR12MB3975;H:CH2PR12MB4088.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6HeeYRTkTWmSZ3JOh9zb4fqmSTsxwjLHs2cwUF4yEDKeVD9xwlFTV3OvMUEH6yoHgg8h9G8wE8vZ8daPSQqUMoyqWUWfDLDBuwUCh9DvkHs52zadBVZutPj20VCc3slPHO6T3nO84bYBirS+SLXkf0uZedX8zNnGM2lPbfilFNZz1eMTDlOY22K1oO2/yoZFPVV9GQ7ZX/c3HvnPtG7lod9vdugBeFpRyryPtCQbN4In5kNxaEg86HgHLyyMZyB3ER25H7zR0vuuixeLk0k3FEcgmbl0Hf7W0h22QFywCYLcrzbFRlmLLUuxpGYZs3ztXB2Z3LyUnyvWe/GYzmhAwcuD7R6go4Zs8NrK9SjvQtqQfwk9ARM4u+Yi4pCLXl62WO6QNCQXOslBZKb6tDlrh4FFl6HFZwI1xPJKwdCeNUgEWQfNf8zT48eksybsQfxR
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC33D5CEEBDD35409E7D61ED1F60D952@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a6091e6c-ba33-4b03-70e5-08d7740105e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 12:46:43.7365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSBZ6IXAtvhw3DtqH/Xlp7ofVYhPD5M5AqCMeyNXUJasrU9Af66tCUSIx8BMqt4nilDjfekoMuE+Pj8jt3tYCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3975
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSnVuLA0KDQpPbiAxMC8zMS8yMDE5IDI6MDQgUE0sIEp1biBDaGVuIHdyb3RlOg0KPiBGcm9t
OiBKdW4gQ2hlbiA8anVuLmNoZW5AdmF0aWNzLmNvbT4NCj4gDQo+IEFjY29yZGluZyB0byBVU0Iy
LjAgc3BlYyA4LjUuMywgIklmIHRoZSBjb250cm9sIHNlcXVlbmNlDQo+IGhhcyBubyBEYXRhIHN0
YWdlLCB0aGVuIGl0IGNvbnNpc3RzIG9mIGEgU2V0dXAgc3RhZ2UNCj4gZm9sbG93ZWQgYnkgYSBT
dGF0dXMgc3RhZ2UgY29uc2lzdGluZyBvZiBhbiBJTiB0cmFuc2FjdGlvbi4iDQo+IA0KPiBCdXQg
d2hlbiBkb2luZyBjb250cm9sIHJlYWQgaW4gc29tZSBIT1NUIChsaWtlIE1TIFdpbmRvd3MpLA0K
PiBhZnRlciBhIFNFVFVQIHRyYW5zYWN0aW9uIHdpdGggbm8gRGF0YSBzdGFnZSwgdGhlIHNlcXVl
bmNlDQo+IHN0YXkgaW4gdGhlIFN0YXR1cyBzdGFnZSBvZiBhbiBPVVQgdHJhbnNhY3Rpb24gdW50
aWwgdGltZW91dC4NCj4gDQpDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgZGVidWcgbG9nIG9mIGFi
b3ZlIHNjZW5hcmlvPw0KDQo+IFRoaXMgcGF0Y2ggU3RhbGwgYm90aCBJTiBhbmQgT1VUIG9uIGVw
MCBpbiBzdGF0dXMgc3RhZ2UsDQo+IGZpeCB0aGUgdW5oYW5kbGluZyBzdGF0ZSB3aGVuIHdlIGdv
dCBhbiBlcnJvciBjb21tYW5kDQo+IHdpdGggemVybyBsZW5ndGggY29udHJvbCByZWFkIHJlcXVl
c3QuDQo+IA0KPiBJdCdzIGFsc28gYmFzZWQgb24gdGhlIFVTQjIuMCBzcGVjIDguNS4zLjQsDQo+
ICJUaGUgcHJvdG9jb2wgU1RBTEwgY29uZGl0aW9uIGxhc3RzIHVudGlsIHRoZSByZWNlaXB0IG9m
DQo+IHRoZSBuZXh0IFNFVFVQIHRyYW5zYWN0aW9uLCBhbmQgdGhlIGZ1bmN0aW9uIHdpbGwgcmV0
dXJuDQo+IFNUQUxMIGluIHJlc3BvbnNlIHRvIGFueSBJTiBvciBPVVQgdHJhbnNhY3Rpb24gb24g
dGhlIHBpcGUNCj4gdW50aWwgdGhlIFNFVFVQIHRyYW5zYWN0aW9uIGlzIHJlY2VpdmVkLiINCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEp1biBDaGVuIDxqdW4uY2hlbkB2YXRpY3MuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMg
Yi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+IGluZGV4IDZiZTEwZTQ5Ni4uNzNiNTk0NCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MyL2dhZGdldC5jDQo+IEBAIC0xODUzLDIzICsxODUzLDMwIEBAIHN0YXRpYyB2b2lk
IGR3YzJfaHNvdGdfc3RhbGxfZXAwKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4gICAJc3Ry
dWN0IGR3YzJfaHNvdGdfZXAgKmVwMCA9IGhzb3RnLT5lcHNfb3V0WzBdOw0KPiAgIAl1MzIgcmVn
Ow0KPiAgIAl1MzIgY3RybDsNCj4gKwl1MzIgZGlyZWN0aW9uOw0KPiAgIA0KPiAtCWRldl9kYmco
aHNvdGctPmRldiwgImVwMCBzdGFsbCAoZGlyPSVkKVxuIiwgZXAwLT5kaXJfaW4pOw0KPiAtCXJl
ZyA9IChlcDAtPmRpcl9pbikgPyBESUVQQ1RMMCA6IERPRVBDVEwwOw0KPiArCWRpcmVjdGlvbiA9
IGVwMC0+ZGlyX2luOw0KPiArCWRvIHsNCj4gKwkJZGV2X2RiZyhoc290Zy0+ZGV2LCAiZXAwIHN0
YWxsIChkaXI9JWQpXG4iLCBlcDAtPmRpcl9pbik7DQo+ICsJCXJlZyA9IChlcDAtPmRpcl9pbikg
PyBESUVQQ1RMMCA6IERPRVBDVEwwOw0KPiAgIA0KPiAtCS8qDQo+IC0JICogRHhFUENUTF9TdGFs
bCB3aWxsIGJlIGNsZWFyZWQgYnkgRVAgb25jZSBpdCBoYXMNCj4gLQkgKiB0YWtlbiBlZmZlY3Qs
IHNvIG5vIG5lZWQgdG8gY2xlYXIgbGF0ZXIuDQo+IC0JICovDQo+ICsJCS8qDQo+ICsJCSAqIER4
RVBDVExfU3RhbGwgd2lsbCBiZSBjbGVhcmVkIGJ5IEVQIG9uY2UgaXQgaGFzDQo+ICsJCSAqIHRh
a2VuIGVmZmVjdCwgc28gbm8gbmVlZCB0byBjbGVhciBsYXRlci4NCj4gKwkJICovDQo+ICAgDQo+
IC0JY3RybCA9IGR3YzJfcmVhZGwoaHNvdGcsIHJlZyk7DQo+IC0JY3RybCB8PSBEWEVQQ1RMX1NU
QUxMOw0KPiAtCWN0cmwgfD0gRFhFUENUTF9DTkFLOw0KPiAtCWR3YzJfd3JpdGVsKGhzb3RnLCBj
dHJsLCByZWcpOw0KPiArCQljdHJsID0gZHdjMl9yZWFkbChoc290ZywgcmVnKTsNCj4gKwkJY3Ry
bCB8PSBEWEVQQ1RMX1NUQUxMOw0KPiArCQljdHJsIHw9IERYRVBDVExfQ05BSzsNCj4gKwkJZHdj
Ml93cml0ZWwoaHNvdGcsIGN0cmwsIHJlZyk7DQo+ICAgDQo+IC0JZGV2X2RiZyhoc290Zy0+ZGV2
LA0KPiAtCQkid3JpdHRlbiBEWEVQQ1RMPTB4JTA4eCB0byAlMDh4IChEWEVQQ1RMPTB4JTA4eClc
biIsDQo+IC0JCWN0cmwsIHJlZywgZHdjMl9yZWFkbChoc290ZywgcmVnKSk7DQo+ICsJCWRldl9k
YmcoaHNvdGctPmRldiwNCj4gKwkJCSJ3cml0dGVuIERYRVBDVEw9MHglMDh4IHRvICUwOHggKERY
RVBDVEw9MHglMDh4KVxuIiwNCj4gKwkJCWN0cmwsIHJlZywgZHdjMl9yZWFkbChoc290ZywgcmVn
KSk7DQo+ICsNCj4gKwkJaWYgKGhzb3RnLT5lcDBfc3RhdGUgPT0gRFdDMl9FUDBfU1RBVFVTX0lO
KQ0KPiArCQkJZXAwLT5kaXJfaW4gPSAoZXAwLT5kaXJfaW4gPT0gMSkgPyAwIDogMTsNCj4gKwl9
IHdoaWxlIChlcDAtPmRpcl9pbiAhPSBkaXJlY3Rpb24pOw0KPiAgIA0KPiAgIAkgLyoNCj4gICAJ
ICAqIGNvbXBsZXRlIHdvbid0IGJlIGNhbGxlZCwgc28gd2UgZW5xdWV1ZQ0KPiANCg0KVGhhbmtz
LA0KTWluYXMNCg==
