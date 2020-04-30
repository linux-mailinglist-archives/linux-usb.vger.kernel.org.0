Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1903D1BED7F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 03:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgD3BRc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 21:17:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46588 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726284AbgD3BRb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 21:17:31 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BF114C054E;
        Thu, 30 Apr 2020 01:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588209450; bh=gHO/FgYn7jQxHOduAEVcuw2T69/PJDhuf2x4Pfh9Uss=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=bhxqVUsbV8uwaYQPHCIG88JsZx8kF/FshfYDERJ8uYvk6SqLSdUSDlAR6DGUUOyFs
         JFyopQpdE1z8HmstOIRVPbj02bMGoWfpfObUaBrWnNl2zOzT78s0oH71aLlxAoqMcK
         A+kgyd0l4UiExXdYOxC1R8DVOM+DZYimNsA9MTF/jK62BVj/bIPE4usHtwjkioo7hd
         PzPbv1yznUWKs9xliAuNHlDiBSQQ7zXu264Mi+syMy9Uv2c82RH2zJKJhqglAcNTe5
         uxGFuz3wGgb5cAKrDHlhX1q6LtxChl4nzRR6s+9rsDqWpweFdBxQAt2zMiUa8zh6t8
         b/8hRpBh4PvMA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4B073A008E;
        Thu, 30 Apr 2020 01:17:30 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 29 Apr 2020 18:16:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 29 Apr 2020 18:16:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2d8+9fIYo1m5pMJnKCreSF5KBkHLVKYaIoOfIGVnFyjy0n2QUhYp/6rbiD17KpOVLX7Nsq0r8mT8jo0NH7qlQhDKToM82Wh8H39vCX5ikNa1GKy7x2ZBsN6eUTmHdN3avDul2nGbQSFlbzrVNcviZyqWZDgkCCP6mkAWTNhOW0SmmTOgd8i8tgk3q57J8xuGrM6zEWP2mpulafaRawtFUcmLEasxcPf9I1BmkcQvGKiwBZVftniK/W+vMRNuS/lZc3znyGwr4QtQolmgEEeK94SBJ+1LUOaCFDbWDFf85ELywDsP7jJQ3M6K9nHtS0UjnqZaConuNQNxxcavQQnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHO/FgYn7jQxHOduAEVcuw2T69/PJDhuf2x4Pfh9Uss=;
 b=Xqt1zZymci7b416nJXiy3KviIBIy6gIs976pQHgz7HUxmSpfLJFMNYzh5H++SOQyyuPcmPzn1RXhNu8p//mp3Etz6AeKqjG+kQsx+Z8hScUkwahpM3C26UTC6EszzuRBBV4zPSOIwU5Vk+aqOEkwG3RA4JzMZzGcqnVBji4KPZMgxs8laZBTfauS1QT9fKsrnrVKfIlsxmNPy/1UdXaq04ldo0UWHTd1f5xtF2BHD91zGvtqDc1E0U3mUYPvTSm2LIic+0dNH1GhXOZbPkonzaJaubxCPrs63tLjW5+L/c4X2qu7pojtjhM9JD5wvC9CdKmfX1encd48wPVBvTX4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHO/FgYn7jQxHOduAEVcuw2T69/PJDhuf2x4Pfh9Uss=;
 b=Ob33aYcDJLd+kCkTcrGLv7ohv1uX9O/1dS38V6ni0wRcePKAX7Sj1ErQWt+7cpjHRBrbguMfjQ1H6AeLhmEdyWfMJhNyYFyaL3tKPdDu0PaMZ0V6vVC48IgRuu1Y5/d25sHfLnLwmeR4LZ/YQza350BWGpxiohZkDSc48eeIrIg=
Received: from DM6PR12MB2924.namprd12.prod.outlook.com (2603:10b6:5:183::23)
 by DM6PR12MB3305.namprd12.prod.outlook.com (2603:10b6:5:189::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 01:16:37 +0000
Received: from DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::102:1678:4c4d:e5c]) by DM6PR12MB2924.namprd12.prod.outlook.com
 ([fe80::102:1678:4c4d:e5c%6]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 01:16:37 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/5] usb: dwc3: gadget: Handle transfer completion
Thread-Topic: [PATCH 4/5] usb: dwc3: gadget: Handle transfer completion
Thread-Index: AQHWHOMqWgV25rtuykKU0ADVs2o1M6iPu08AgAEk5gA=
Date:   Thu, 30 Apr 2020 01:16:36 +0000
Message-ID: <ad3a0e37-c611-c6e9-959b-7351fb82ed0a@synopsys.com>
References: <cover.1588025916.git.thinhn@synopsys.com>
 <70555c2202529c6e0bdd23124003d0d4bc637cdc.1588025916.git.thinhn@synopsys.com>
 <87blna20n3.fsf@kernel.org>
In-Reply-To: <87blna20n3.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec0ddf84-ca09-4e20-b3e3-08d7eca42120
x-ms-traffictypediagnostic: DM6PR12MB3305:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB33053775DE39B7049D268961AAAA0@DM6PR12MB3305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0389EDA07F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2924.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(136003)(366004)(376002)(396003)(346002)(39860400002)(478600001)(4326008)(2616005)(5660300002)(26005)(186003)(36756003)(6506007)(71200400001)(110136005)(8676002)(86362001)(31686004)(66556008)(6486002)(316002)(107886003)(6512007)(66446008)(66476007)(2906002)(31696002)(8936002)(76116006)(66946007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vb3KO+G1AsGN8KBLwswwH/TmnzXAl9wXus7EJM5loCkP3MBscfmjA/M841mxD7Xb4crGMMEsnX0fmujvUYJU+TiTVm0UY3tV+i74zvqg+QLHVUxWSSBEJ3bDjHU3+f8K0GR2+eapmaCtRxRS43ScqIY6XnGpUJRst4n0hxiw5y8gYxXYZ9HxeWV6lt97xAefeWAx6HUGj1TOYCjA3KLVWIMNyI/nm+dTuTKW+LtIBGfKwxhWYv7gfVpd/tJjkzJt25Q8Wv8Z9Ipih+NvJiHIlkvVaJzdq3siLfqgh0DhZ7te8X733nWidkI4PwqxPikdF8mf4ycjB+iGM8BLZ8/yKhOvolE9DoNYSFgqizLPeuQwN8B2decZGi66j5vNnxnZVSjQnJJtk1MioH4q+KlKylGSgfIxwA/+DzW0bU6k+mDQ9+fp6grNUdjHrS6zsDkd/wptKz6a/UL8XUbiQrG4Ne3o+QMPbtht3ns24oDI6zn5ZkCA7ZBp+jB8WFrV+IkLNL1mLsg//fyXhTO81AsWF1wgPisEmDQnGTfIcCFd0A3amCD07QxwS99lny/l6tYGvW9EBMOan7l0PwmbRxgNPSTiG7vw+NVSzCzfFwAh5jE9cuQ1Opfjl8da0fBvs9BgrV/YjM70lBDxo8sfezo2rA==
x-ms-exchange-antispam-messagedata: 1VFafZ81K4n3bVC44MLcsSIDCfwVW1leCmkq3MmKfnOgeBMn2Gmh8LIDUwcbwOc7q3LVFmL4/9xKKiCv8MssOlSzq4tAdqC7WY+uqdXi4yZLEWuewt0ej7CJu+w3kdmpsxP9SkTmm0Mx33SHhO/H/y6LbDIrXTEp7P22KKFvIbC9tgCDRWnWQ6odjQl1hhDk/rkstW0RzMp3svbe3vNfsv8qsxLQmpwL3S1LTanoid5q8O/O3LfDvejTa9m139dpIfu+WUyUCETlCjFV2yc94DJ6jwhigyrvFBmOxvDAZn6nzsI5T6jnKQL+p3OvIl6E/lAuXufjZZxlqAKHmzCtD9dyCM7QvTTnxFnDB7I1i/c4NvzjsqRXi1A92IeA3U0e5vvta42vMCHRNFFARUlzLucll44wxj4od4XRYbauD/EaK6SwlSE0d9AhquEtWDtw2bTc4Qydbh5RaE/xeTiav1ZqeBuTbP2EMbzlg9pXc908y29b+NYBleAkgvbaZqQbbETDh0AoGpspk5ZhuXOIi98GT0udsjgPMqqIYJRwP4X/U84lTpJyGJcihCWW3xfIWEuHHjKyi02qYA5jap0E6qjxbRlXDcb7B2UnZ5o1oQgmfMJ7Qdl4bI6FnzTE34jtC0semq7nKAQljG/QpOxKrsvprBp6h+mdabB0fopQvvJmTSCfa/QA1HrXRTDL8lm1Q5rZAM+L8cjE/6pcasKnsir6ergMWiK7OVkRnDgsiZ8mYTpjmIixW1e2Usc5BRlBvxFxoKJyJIG7HcQwQB4E2UUjXtcOICEwiYM+bsIlXeg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E657EE68749109419A2EEC2E528BC34A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0ddf84-ca09-4e20-b3e3-08d7eca42120
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 01:16:36.9558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMenDIbGSo7uP8axH82MdtkHXMsrjvBx7prrrKzMFIQ72ZfuTKTyKvTbTQpTQToAbwJousFDdp03VtKSYtjSYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3305
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPg0KPj4gV2l0aCB0aGUgbmV3IHVzYl9y
ZXF1ZXN0LT5pc19sYXN0IGZpZWxkLCBub3cgdGhlIGZ1bmN0aW9uIGRyaXZlcnMgY2FuDQo+PiBp
bmZvcm0gd2hpY2ggcmVxdWVzdCBpcyB0aGUgZW5kIG9mIGEgdHJhbnNmZXIsIGR3YzMgY2FuIHBy
b2dyYW0gaXRzIFRSQnMNCj4+IHRvIGxldCB0aGUgY29udHJvbGxlciBrbm93IHdoZW4gdG8gZnJl
ZSBpdHMgcmVzb3VyY2VzIHdoZW4gYSB0cmFuc2Zlcg0KPj4gY29tcGxldGVzLiBUaGlzIGlzIHJl
cXVpcmVkIGZvciBzdHJlYW0gdHJhbnNmZXJzLiBUaGUgY29udHJvbGxlciBuZWVkcw0KPj4gdG8g
a25vdyB3aGVyZSBvbmUgc3RyZWFtIHN0YXJ0cyBhbmQgZW5kcyB0byBwcm9wZXJseSBhbGxvY2F0
ZSByZXNvdXJjZXMNCj4+IGZvciBkaWZmZXJlbnQgc3RyZWFtcy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+IGZyb20gYSBxdWljayBy
ZWFkLCBpdCBsb29rcyBsaWtlIHRoaXMgY2FuIGJlIGJyb2tlbiBkb3duIGludG8gc21hbGxlcg0K
PiBwYXRjaGVzLg0KDQpPay4NCg0KPg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4+IGluZGV4IDcyMDRhODM4ZWMwNi4u
YjExMTgzYTcxNWE3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+PiBAQCAtNzAxLDYgKzcwMSw3IEBAIHN0
cnVjdCBkd2MzX2VwIHsNCj4+ICAgI2RlZmluZSBEV0MzX0VQX0VORF9UUkFOU0ZFUl9QRU5ESU5H
IEJJVCg0KQ0KPj4gICAjZGVmaW5lIERXQzNfRVBfUEVORElOR19SRVFVRVNUCUJJVCg1KQ0KPj4g
ICAjZGVmaW5lIERXQzNfRVBfREVMQVlfU1RBUlQJQklUKDYpDQo+PiArI2RlZmluZSBEV0MzX0VQ
X1dBSVRfVFJBTlNGRVJfQ09NUExFVEUJQklUKDcpDQo+IHRoaXMgY291bGQgYmUgaXRzIG93biBw
YXRjaCB3aXRoIHByb3BlciBkZXNjcmlwdGlvbiAoYW5kIHVzYWdlKQ0KDQpXaWxsIGRvLg0KDQo+
PiAgIA0KPj4gICAJLyogVGhpcyBsYXN0IG9uZSBpcyBzcGVjaWZpYyB0byBFUDAgKi8NCj4+ICAg
I2RlZmluZSBEV0MzX0VQMF9ESVJfSU4JCUJJVCgzMSkNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gaW5kZXgg
ODY1ZTZmYmI3MzYwLi42MjhmOWQxNDI4NzYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+PiBAQCAt
NTc5LDYgKzU3OSw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfc2V0X2VwX2NvbmZpZyhzdHJ1
Y3QgZHdjM19lcCAqZGVwLCB1bnNpZ25lZCBpbnQgYWN0aW9uKQ0KPj4gICANCj4+ICAgCWlmICh1
c2Jfc3NfbWF4X3N0cmVhbXMoY29tcF9kZXNjKSAmJiB1c2JfZW5kcG9pbnRfeGZlcl9idWxrKGRl
c2MpKSB7DQo+PiAgIAkJcGFyYW1zLnBhcmFtMSB8PSBEV0MzX0RFUENGR19TVFJFQU1fQ0FQQUJM
RQ0KPj4gKwkJCXwgRFdDM19ERVBDRkdfWEZFUl9DT01QTEVURV9FTg0KPiBhZGRpbmcgdGhpcyBi
aXQgZm9yIHN0cmVhbSBlbmRwb2ludHMgY291bGQgYmUgYSBzZXBhcmF0ZSBjb21taXQuDQoNCldp
bGwgZG8uDQoNCj4NCj4+ICAgCQkJfCBEV0MzX0RFUENGR19TVFJFQU1fRVZFTlRfRU47DQo+PiAg
IAkJZGVwLT5zdHJlYW1fY2FwYWJsZSA9IHRydWU7DQo+PiAgIAl9DQo+PiBAQCAtOTE3LDggKzkx
OCw5IEBAIHN0YXRpYyB1MzIgZHdjM19jYWxjX3RyYnNfbGVmdChzdHJ1Y3QgZHdjM19lcCAqZGVw
KQ0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgdm9pZCBfX2R3YzNfcHJlcGFyZV9vbmVfdHJi
KHN0cnVjdCBkd2MzX2VwICpkZXAsIHN0cnVjdCBkd2MzX3RyYiAqdHJiLA0KPj4gLQkJZG1hX2Fk
ZHJfdCBkbWEsIHVuc2lnbmVkIGxlbmd0aCwgdW5zaWduZWQgY2hhaW4sIHVuc2lnbmVkIG5vZGUs
DQo+PiAtCQl1bnNpZ25lZCBzdHJlYW1faWQsIHVuc2lnbmVkIHNob3J0X25vdF9vaywgdW5zaWdu
ZWQgbm9faW50ZXJydXB0KQ0KPj4gKwkJZG1hX2FkZHJfdCBkbWEsIHVuc2lnbmVkIGxlbmd0aCwg
dW5zaWduZWQgY2hhaW4sDQo+PiArCQl1bnNpZ25lZCBpc19sYXN0LCB1bnNpZ25lZCBub2RlLCB1
bnNpZ25lZCBzdHJlYW1faWQsDQo+PiArCQl1bnNpZ25lZCBzaG9ydF9ub3Rfb2ssIHVuc2lnbmVk
IG5vX2ludGVycnVwdCkNCj4gaWYgeW91IGFkZCAiaXNfbGFzdCIgYXMgdGhlIGxhc3QgYXJndW1l
bnQsIHRoaXMgaHVuayB3aWxsIGxvb2sNCj4gc21hbGxlci4gTml0cGlja2luZywgSSBrbm93Lg0K
DQpObyBwcm9ibGVtIDopDQoNCj4NCj4+IEBAIC0xMjIzLDYgKzEyMzEsMTAgQEAgc3RhdGljIHZv
aWQgZHdjM19wcmVwYXJlX3RyYnMoc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4+ICAgDQo+PiAgIAkJ
aWYgKCFkd2MzX2NhbGNfdHJic19sZWZ0KGRlcCkpDQo+PiAgIAkJCXJldHVybjsNCj4+ICsNCj4+
ICsJCS8qIERvbid0IHByZXBhcmUgYWhlYWQuIFRoaXMgaXMgbm90IGFuIG9wdGlvbiBmb3IgRFdD
X3VzYjMyLiAqLw0KPj4gKwkJaWYgKHJlcS0+cmVxdWVzdC5pc19sYXN0KQ0KPj4gKwkJCXJldHVy
bjsNCj4gdGhpcyByZXF1aXJlcyBzb21lIGJldHRlciBkZXNjcmlwdGlvbi4gV2h5IGlzbid0IGl0
IGFuIG9wdGlvbiBmb3IgZHdjX3VzYjMyPw0KDQpJbnRlcm5hbGx5LCBEV0NfdXNiMzIgZG9lcyBz
b21lIGFkdmFuY2UgY2FjaGluZyBhbmQgYnVyc3QgdGhhdCB3ZSBzaG91bGQgDQpub3QgcHJlcGFy
ZSBtb3JlIFRSQiB1bnRpbCB0aGUgdHJhbnNmZXIgaXMgY29tcGxldGVkLg0KVGhpcyBkb2Vzbid0
IGFwcGx5IGZvciBpc29jLCBtaXNzZWQgYSBjaGVjayBoZXJlLiBOZWVkIHRvIGFwcGx5IG9uIHRo
ZSANCm5leHQgdmVyc2lvbi4NCg0KPg0KPj4gQEAgLTI2NDgsMzcgKzI2NjYsMjIgQEAgc3RhdGlj
IGJvb2wgZHdjM19nYWRnZXRfZXBfc2hvdWxkX2NvbnRpbnVlKHN0cnVjdCBkd2MzX2VwICpkZXAp
DQo+PiAgIAlyZXR1cm4gIWR3YzNfZ2FkZ2V0X2VwX3JlcXVlc3RfY29tcGxldGVkKHJlcSk7DQo+
PiAgIH0NCj4+ICAgDQo+PiAtc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfZW5kcG9pbnRfZnJhbWVf
ZnJvbV9ldmVudChzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KPj4gLQkJY29uc3Qgc3RydWN0IGR3YzNf
ZXZlbnRfZGVwZXZ0ICpldmVudCkNCj4+IC17DQo+PiAtCWRlcC0+ZnJhbWVfbnVtYmVyID0gZXZl
bnQtPnBhcmFtZXRlcnM7DQo+PiAtfQ0KPiBtb3ZpbmcgdGhlc2UgZnVuY3Rpb25zIGFyb3VuZCBj
b3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLiBUaGUgd2F5IGl0J3MNCj4gZG9uZSBub3cgdGFrZXMg
YXdheSBmcm9tIHJldmlldy4NCg0KWW91J3JlIHJpZ2h0LCBpdCdzIGEgYml0IGRpZmZpY3VsdCB0
byByZXZpZXcgYXMgaXMuDQoNCj4NCj4+IEBAIC0yNzA0LDYgKzI3MDcsNDUgQEAgc3RhdGljIHZv
aWQgZHdjM19nYWRnZXRfZW5kcG9pbnRfdHJhbnNmZXJfaW5fcHJvZ3Jlc3Moc3RydWN0IGR3YzNf
ZXAgKmRlcCwNCj4+ICAgDQo+PiAgIAkJZHdjLT51MXUyID0gMDsNCj4+ICAgCX0NCj4+ICsNCj4+
ICsJcmV0dXJuIG5vX3N0YXJ0ZWRfdHJiOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBk
d2MzX2dhZGdldF9lbmRwb2ludF9mcmFtZV9mcm9tX2V2ZW50KHN0cnVjdCBkd2MzX2VwICpkZXAs
DQo+PiArCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVudF9kZXBldnQgKmV2ZW50KQ0KPj4gK3sNCj4+
ICsJZGVwLT5mcmFtZV9udW1iZXIgPSBldmVudC0+cGFyYW1ldGVyczsNCj4+ICt9DQo+PiArDQo+
PiArc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfZW5kcG9pbnRfdHJhbnNmZXJfaW5fcHJvZ3Jlc3Mo
c3RydWN0IGR3YzNfZXAgKmRlcCwNCj4+ICsJCWNvbnN0IHN0cnVjdCBkd2MzX2V2ZW50X2RlcGV2
dCAqZXZlbnQpDQo+PiArew0KPj4gKwlpbnQgc3RhdHVzID0gMDsNCj4+ICsNCj4+ICsJaWYgKHVz
Yl9lbmRwb2ludF94ZmVyX2lzb2MoZGVwLT5lbmRwb2ludC5kZXNjKSkNCj4+ICsJCWR3YzNfZ2Fk
Z2V0X2VuZHBvaW50X2ZyYW1lX2Zyb21fZXZlbnQoZGVwLCBldmVudCk7DQo+PiArDQo+PiArCWlm
IChldmVudC0+c3RhdHVzICYgREVQRVZUX1NUQVRVU19CVVNFUlIpDQo+PiArCQlzdGF0dXMgPSAt
RUNPTk5SRVNFVDsNCj4+ICsNCj4+ICsJaWYgKGV2ZW50LT5zdGF0dXMgJiBERVBFVlRfU1RBVFVT
X01JU1NFRF9JU09DKQ0KPj4gKwkJc3RhdHVzID0gLUVYREVWOw0KPj4gKw0KPj4gKwlkd2MzX2dh
ZGdldF9lbmRwb2ludF90cmJzX2NvbXBsZXRlKGRlcCwgZXZlbnQsIHN0YXR1cyk7DQo+PiArfQ0K
Pj4gKw0KPj4gK3N0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2VuZHBvaW50X3RyYW5zZmVyX2NvbXBs
ZXRlKHN0cnVjdCBkd2MzX2VwICpkZXAsDQo+PiArCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVudF9k
ZXBldnQgKmV2ZW50KQ0KPj4gK3sNCj4+ICsJaW50IHN0YXR1cyA9IDA7DQo+PiArDQo+PiArCWRl
cC0+ZmxhZ3MgJj0gfkRXQzNfRVBfVFJBTlNGRVJfU1RBUlRFRDsNCj4+ICsNCj4+ICsJaWYgKGV2
ZW50LT5zdGF0dXMgJiBERVBFVlRfU1RBVFVTX0JVU0VSUikNCj4+ICsJCXN0YXR1cyA9IC1FQ09O
TlJFU0VUOw0KPj4gKw0KPj4gKwlpZiAoZHdjM19nYWRnZXRfZW5kcG9pbnRfdHJic19jb21wbGV0
ZShkZXAsIGV2ZW50LCBzdGF0dXMpKQ0KPj4gKwkJZGVwLT5mbGFncyAmPSB+RFdDM19FUF9XQUlU
X1RSQU5TRkVSX0NPTVBMRVRFOw0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgdm9pZCBkd2Mz
X2dhZGdldF9lbmRwb2ludF90cmFuc2Zlcl9ub3RfcmVhZHkoc3RydWN0IGR3YzNfZXAgKmRlcCwN
Cj4+IEBAIC0yNzcwLDcgKzI4MTIsMTAgQEAgc3RhdGljIHZvaWQgZHdjM19lbmRwb2ludF9pbnRl
cnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4+ICAgCQl9DQo+PiAgIAkJYnJlYWs7DQo+PiAgIAlj
YXNlIERXQzNfREVQRVZUX1NUUkVBTUVWVDoNCj4+ICsJCWJyZWFrOw0KPiBTd2FwIHRoZXNlIGFy
b3VuZC4gS2VlcCBhbGwgdGhlICJub3RoaW5nIHRvIGRvIGhlcmUiIGNhc2VzDQo+IHRvZ2V0aGVy
Lg0KPg0KDQpUaGFua3MsDQpUaGluaA0K
