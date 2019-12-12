Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B09FC11D914
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 23:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731299AbfLLWLe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 17:11:34 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:59414 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730811AbfLLWLe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 17:11:34 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ADAFB42371;
        Thu, 12 Dec 2019 22:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576188693; bh=sARM40Va+Kp8W8dUGLHEVQubGYCD/dmXxLUM+wFwP/4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=A0OJKN+QhENqSAl+FIKQ5tO3bLcXy70W5iN/934XJR8oldr4xrC3h3ry1Y4PldhoY
         dbksjAW+lUzc/gk61N6li35hU43388dRLMrkmTaPcly9qvyhO5qm8XNp6DwuxWE8hk
         3RfTuqkQNWavfc2lMUMKjYk8DXfdAPl7s2WQ0KWIFm06SUTAON3l8EKkPiPpHZcgy9
         iZs+qY36G9MyyKZUe9UtqKM/PnWPbeXkXQAV9opeggY7AomoLQ0HZYaUcQOnTGXK17
         vmo6KlXqh7GvRt+WfGxEHIdyK96X13yxRQbbumbjDzC7EQekl6kVNUp1Gdup0/1lyL
         HGLTWTKKE2RtQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 616A6A034D;
        Thu, 12 Dec 2019 22:11:33 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 14:10:55 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 14:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaRXlM13K4KHWwke0A+dYha97n7lnEgfe8u/k4vbsI6BJW+V/41qmpfOigesTS/yX0/WMjh8LJEf+z83x0YQ2f34GUci2PGQi6phCgjqSBeXYxbfquG7MYXzqZkQBnV54KuAwT2QUmyz8ihJOlEqS6t2Edy+eytdkBkcxVWNKAqjyRYSADdCXB/cj+fGgITAHU6b3fAzufFiunDyjxfy0fo264lvICrh97/9b8vqySZdYK4qEc7K1tDqFxzdOeJZQQPBLMz6b+ipDdl2xUY0OwzDnrscf9F+V3p69DLPTcca6F1q8cgaVpicUZ6vR8TdvDJLA7ESHDeUIDDrOxtQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sARM40Va+Kp8W8dUGLHEVQubGYCD/dmXxLUM+wFwP/4=;
 b=RMQlr3PFrUgagqLRW8VcGarXKLD3wEaUcxHpIrqseUwQgEoKcKVEYuYAMCsPfya3ue6T4ct7zvbUM06hrW5AkgSM60kgGpqgRP/qmF2V0PnO73EozYd1o5HERuS4OvUryfqDN7xdWcUGyaLZ3ufMfHoFdNvtb9PsrnJYnrKBv50J1XJh4HWv8dKjjjWecfZKG9PKJ9oCfu5PuY1EX5DEIkRMM3sfFDuOB0KUaSgdxVbm9Ea93j05V3CDw0l61dO84/ROcHCDQjRGYjOEea6Mh/6s1+OFp5x3LkFGMd3tOmS8KLHnmrnywFEQDHgxFaoDLERnqPY/sNxAg01hKfCSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sARM40Va+Kp8W8dUGLHEVQubGYCD/dmXxLUM+wFwP/4=;
 b=N/bK7Cb0Mc9e3O6ev6G40MmoBiPv3UzUcyNpbFKkdeLbJzXxv0Xz45Snr+4siu7zktPi59w4eegFXKkj3XDpeyDaAi5YUuwPt6AmQ8D9aGSTvj8u0azsHG2zisE1QlyqCMcz9POfzi4XLp0caG7U/0jKJnZXd9Sh+Q12+zIUQrs=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB2518.namprd12.prod.outlook.com (10.172.119.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 22:10:53 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:10:53 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 03/14] usb: composite: Properly report lsm
Thread-Topic: [RFC PATCH 03/14] usb: composite: Properly report lsm
Thread-Index: AQHVsJbYpREwuWh55kqSCSwmUWPChKe2Iw6AgADtzoA=
Date:   Thu, 12 Dec 2019 22:10:53 +0000
Message-ID: <f58dbca8-f2a9-75a4-4c62-3898ffc5bc65@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <0ff7d475567f10e2f5051554daaa41d2ce03aa35.1576118671.git.thinhn@synopsys.com>
 <871rtax9ce.fsf@kernel.org>
In-Reply-To: <871rtax9ce.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe0c10cd-dc69-479a-6a47-08d77f5027bd
x-ms-traffictypediagnostic: CY4PR1201MB2518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2518766B14B8BB2D511CBD75AA550@CY4PR1201MB2518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(199004)(189003)(110136005)(107886003)(2906002)(4326008)(6512007)(5660300002)(86362001)(6486002)(6506007)(2616005)(186003)(66946007)(31686004)(31696002)(76116006)(26005)(64756008)(66446008)(36756003)(66556008)(81156014)(8676002)(71200400001)(81166006)(498600001)(8936002)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB2518;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bSyt9/WGba2vf7fLtDhc+dmgtiyLXdkZf3jHXTuwmKhnk+qKy5G0SGldic87jWOJa8DZyhcNSH1sKBIQ4qaVSc/GzAaQsIksaPj2iQ1HJJjvVg7M2XuQ2qU9vmeuxgcwd4t6edqZR+AaJOkmL5egqNb+1NNWcip5eul+Ui/pLGUAKcfVxJy7yraZPn5yHTjX2DEKfEokca3zNJya9cptdy53JyxXGrAmuMZbe0nwGpoVkJ60JyQ0fZFvwP/I0eaYoW0aEl4KUThjXQYpis2hvbJrsujJhdiknWujhlGjd4khGVEvCE3YrhZTn+IKbt8IjftS/XwxvPqqV7MhRIvhBjpCKKLB9q3oUACVoXrn+xJ58Pcv0H8jsjXO6DymxW4MppGT/UWgVojUirsAckdtxycAVjX7dWlsVBfZdU+mx3TIRff4/FYK5pEonhHJ6S1S
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AA4F420D26DCE46B399D11EF3E3F4FC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0c10cd-dc69-479a-6a47-08d77f5027bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 22:10:53.5581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bX6FBiiFY1DXHDr3RTQLcfiQFLF6ygs8CE5iM3KzFfpU032fEkBKFK3ZZWGpyRatYx5S+sviaZqjcB9eC+1sCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2518
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gVXNlIHRoZSBtYXggbGFuZSBzcGVl
ZCBtYW50aXNhIHZhbHVlIGZyb20gdGhlIGdhZGdldCBhbmQgcmVwb3J0IHRvIHRoZQ0KPj4gZGV2
aWNlIGRlc2NyaXB0b3IgaWYgYXZhaWxhYmxlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5o
IE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3VzYi9n
YWRnZXQvY29tcG9zaXRlLmMgfCAxNCArKysrKysrKysrLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBvc2l0ZS5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L2NvbXBv
c2l0ZS5jDQo+PiBpbmRleCBhNGRlNWE4YzBmMTkuLmNkMzgwNzhkNmE0MiAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvdXNiL2dhZGdldC9jb21wb3NpdGUuYw0KPj4gKysrIGIvZHJpdmVycy91c2Iv
Z2FkZ2V0L2NvbXBvc2l0ZS5jDQo+PiBAQCAtNjgyLDYgKzY4MiwxMSBAQCBzdGF0aWMgaW50IGJv
c19kZXNjKHN0cnVjdCB1c2JfY29tcG9zaXRlX2RldiAqY2RldikNCj4+ICAgCS8qIFRoZSBTdXBl
clNwZWVkUGx1cyBVU0IgRGV2aWNlIENhcGFiaWxpdHkgZGVzY3JpcHRvciAqLw0KPj4gICAJaWYg
KGdhZGdldF9pc19zdXBlcnNwZWVkX3BsdXMoY2Rldi0+Z2FkZ2V0KSkgew0KPj4gICAJCXN0cnVj
dCB1c2Jfc3NwX2NhcF9kZXNjcmlwdG9yICpzc3BfY2FwOw0KPj4gKwkJaW50IGxzbSA9IDEwOw0K
Pj4gKw0KPj4gKwkJaWYgKGNkZXYtPmdhZGdldC0+b3BzLT51ZGNfc2V0X3N1YmxpbmtfYXR0ciAm
Jg0KPj4gKwkJICAgIGNkZXYtPmdhZGdldC0+bWF4X2xzbSkNCj4+ICsJCQlsc20gPSBjZGV2LT5n
YWRnZXQtPm1heF9sc207DQo+PiAgIA0KPj4gICAJCXNzcF9jYXAgPSBjZGV2LT5yZXEtPmJ1ZiAr
IGxlMTZfdG9fY3B1KGJvcy0+d1RvdGFsTGVuZ3RoKTsNCj4+ICAgCQlib3MtPmJOdW1EZXZpY2VD
YXBzKys7DQo+PiBAQCAtNzA5LDIwICs3MTQsMjEgQEAgc3RhdGljIGludCBib3NfZGVzYyhzdHJ1
Y3QgdXNiX2NvbXBvc2l0ZV9kZXYgKmNkZXYpDQo+PiAgIAkJICogICBTVCAgPSBTeW1tZXRyaWMs
IFJYDQo+PiAgIAkJICogICBMU0UgPSAgMyAoR2JwcykNCj4+ICAgCQkgKiAgIExQICA9ICAxIChT
dXBlclNwZWVkUGx1cykNCj4+IC0JCSAqICAgTFNNID0gMTAgKDEwIEdicHMpDQo+PiArCQkgKiAg
IExTTSA9ICA1IG9yIDEwDQo+PiAgIAkJICovDQo+PiAgIAkJc3NwX2NhcC0+Ym1TdWJsaW5rU3Bl
ZWRBdHRyWzBdID0NCj4+IC0JCQljcHVfdG9fbGUzMigoMyA8PCA0KSB8ICgxIDw8IDE0KSB8ICgw
eGEgPDwgMTYpKTsNCj4+ICsJCQljcHVfdG9fbGUzMigoMyA8PCA0KSB8ICgxIDw8IDE0KSB8IChs
c20gPDwgMTYpKTsNCj4gd2hpbGUgYXQgdGhhdCwgY2FuIHdlIGdldCByaWQgb2YgdGhlIG1hZ2lj
IGNvbnN0YW50cz8NCg0KT2suDQoNCj4NCj4+ICAgCQlzc3BfY2FwLT5ibVN1YmxpbmtTcGVlZEF0
dHJbMV0gPQ0KPj4gICAJCQljcHVfdG9fbGUzMigoMyA8PCA0KSB8ICgxIDw8IDE0KSB8DQo+PiAt
CQkJCSAgICAoMHhhIDw8IDE2KSB8ICgxIDw8IDcpKTsNCj4+ICsJCQkJICAgIChsc20gPDwgMTYp
IHwgKDEgPDwgNykpOw0KPiBkaXR0by4NCj4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
