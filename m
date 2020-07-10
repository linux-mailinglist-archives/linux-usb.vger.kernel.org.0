Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD18D21B2A9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 11:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgGJJsU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 05:48:20 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:49911 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGJJsU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jul 2020 05:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1594374499; x=1625910499;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JNd2ZyE8Ydu1tud3OIgsZMs6x9fKYhBNZO1sVfY9fCk=;
  b=L6jey5NujeRDX0QJU+W5ZsjOvKpSqlkzRjVCh4ujwnl0xS11MJTlVuAk
   10gd4EobVyR0ss7w6GdKXiiui4ub42k6FrL+aPbfwRVnp/iEB7XuEVVWK
   zWCkSnDK6On2muaovwNz6AZzmC7qUbj6JeTqW/baIM26NB02li3YrXDGU
   2e3TY2UUjO/TMl9eqQ233iL/HBnJQiL+AmG8q3id7TsU7IdUl38n5Nk+a
   6jj4tkDTMBKehvcTMTrWF777Mlr0QSlrI6GEOKaqoZwcJ7KatNFqsSZwe
   PZ/Rv/aPctc8m/7XtKNM0H/g1CRHevEdz18tlFT3rtjRjAMgueNcgit7K
   g==;
IronPort-SDR: J+Q+ms4WVg3j7HTKlIdybuRp/6x+jEPw+xpy6YiO2fdK/fk2bKcjDHZcbfb4d60qMkgseO+LVT
 3rtc8VluZ3XxLUmXKkZJZqyjXm9eO5YiT89GJUWHeHFBAhxqd35oMk4I+D45Sz3Eeev0AZeI1E
 9D2b9VQU5KvDvDX5Qwfxh7j5ybPPouHL9hjLFzM0C/z3P22qUpR3mcucunEHigXprDFVbI661i
 WscgUto9Da5KLNP8iZn3VQd/7KrZOGMiJxtE02duHr7J260eOg0dsPpXwfSfSEg/z1uAF6f8wz
 2n8=
X-IronPort-AV: E=Sophos;i="5.75,335,1589266800"; 
   d="scan'208";a="79421313"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2020 02:48:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 10 Jul 2020 02:48:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 10 Jul 2020 02:47:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWhlMJAQESEHj1yndFyl636rA1OkwxeTfppQCCc6iBXuVV8ZzgWk3JKBRvDlcpcweTGnnE230HWhHf/10ztI8OeRXhupvXLOyaBqIVqBe+bd5+xIgT9aIm/s8jurynoqZ/rFIjJgXtPTsbP7JL2u+gA99oFpycBo8UJaBIWzQoYWEX0DEROy+u0ioy7oZzXmrujc82mk0B4dhqixjJpfR0Y5LaQQ869EGK+JX6xFiF+/YwclF9znaNSQPpksT/+6T7QZOm+IpeyHYebdYL5noTiSKdTQ9IpZ7/F3yOoIDu6k35hzIlUV/paMjBTOproSTy2C67bL6StvEz6kHaYUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNd2ZyE8Ydu1tud3OIgsZMs6x9fKYhBNZO1sVfY9fCk=;
 b=EhYYfHSwz/dfYY8H8ap2Yd5OauJa3UO/WRLOW6elxLBJqps7ImcKhK31CpX+D0DiZPmYzmhtVzFgVue4csVod3Apm8SuY5C5Svr2JtqvLrqTWCGaBGiG1dZaQ/g7J8EOWh1VUuuxShe/MZ5tc9PprXulPd7B8c3XzH7EhpzvqN75/Qd20ppwYvFKF/mm99Z38LAMNtzXc65sjk+lo/Tuq8ASBjh4dmv0bPCOoKV60Pa7rpj4mTNyUjkqav1z4SZFKcXQu67D8n+ww+C4sYIJlNVEqHy0FylWKLxYrXiXTFxg00JgByGrr/DL5pbIzS5jfoOoH+Ppji9Z3qsyOtoRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNd2ZyE8Ydu1tud3OIgsZMs6x9fKYhBNZO1sVfY9fCk=;
 b=TeONhYLc14yqkBB/2GDdXGAHzmVXUTKkK9Z8h7I3qUcT2cCOCJ161ln34YT7qfHBnvqCB+r69lwcO0J/E9ci3Tf0tKaDp6FEjZ9JVARMSz57hwnuL7vCh04EzMdyb1jt+kEsPoj6shmZV+gi93LOYLnBQK2MeajWVLEZxBNP1XM=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Fri, 10 Jul 2020 09:47:58 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8b2:1d82:49d9:f4b]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8b2:1d82:49d9:f4b%6]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 09:47:57 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <weiyongjun1@huawei.com>, <hulkci@huawei.com>,
        <Cristian.Birsan@microchip.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <gregory.clement@bootlin.com>
CC:     <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH -next] usb: gadget: udc: atmel: remove unused variable
 'pp'
Thread-Topic: [PATCH -next] usb: gadget: udc: atmel: remove unused variable
 'pp'
Thread-Index: AQHWVp8x8frjAuy40k6UOQSV3Tj5XA==
Date:   Fri, 10 Jul 2020 09:47:57 +0000
Message-ID: <79b167bf-6dc9-aad0-3dca-b4d31a02379c@microchip.com>
References: <20200710073033.58714-1-weiyongjun1@huawei.com>
In-Reply-To: <20200710073033.58714-1-weiyongjun1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.124.22.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0e8e083-2c1b-4aa9-8537-08d824b653b4
x-ms-traffictypediagnostic: DM6PR11MB3514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3514B9EE01878F06DA146B3187650@DM6PR11MB3514.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oDMfK/TTlOmSuv9kQdXEta3NZEFc8uKqYfVmohAClmLwknQDA7FyacsM213icXXs63pPu8FnphIAjivlH0CrPX0ga6XUCKUxEJ0IMgTxfIWrVz44+Off8ShbH3QdQS007PHNmVkPcgbJ5hzD5lBoY1AqJt+lb1yq6LvGuSzCtrbao1DPPBJjBrHR+P7BgrwgjuSBB63hCTRE1HhipRw6xmpRZNjSYrRmdoODQRD9gbOkqsL1HzmqDtWylHUthukFUb6ZUPX53oFp5OeYcUc4ftJ/8jIMqaqd7akWtMwCqAtMtTCrxIaYBt80MJIcp/tRoNv+JgUY38NVebVk1H+a//blYRsp8QRQRcevhc4H/+crSAfj8qoYdmf29gO3kyfs87c8WbPXOCZcFi1/HKfIeb40eS083Hf0S+eLnqg5E6Q1bg6bcnulqQ2S9/J55FoBKhc91o0o860chL2xYvZc5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39860400002)(136003)(376002)(346002)(4326008)(110136005)(54906003)(36756003)(2906002)(66446008)(91956017)(66556008)(66476007)(66946007)(478600001)(64756008)(76116006)(83380400001)(966005)(5660300002)(6486002)(86362001)(71200400001)(31696002)(53546011)(316002)(6506007)(8936002)(8676002)(31686004)(186003)(2616005)(26005)(6512007)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: V0kOfre84E0y5yWqWJZMAEPHGDIP47GgYT5T4lsjufMTLTgibt0LzFkwqQhKNKcyaEfJKx75Yqx3UY1efEbYmwO/K6I5N2fJPdAda9Rz2ZDH4FqA+gbsfLlOohTT7GhTHY1SJLhhoE6ituOjkSInznX4SOBFqGpnnQ9K0F+yPClZ68jxPdqJWIlvUE05hrr04mHy8Zj7RlkkcoE9LLkL66rLvni8DRUB1cUUrS8f3JnbjJNY2SZ4JQdX0lHcohrGrWS9XHkCEpX2blADb8UJSc+EY9B51AEaq3v2h0ncqxualwAZ1WgthM8v6uquNzbbW/UoP8W5birNOlZfTnMapfUaM9uKGkYkc5aW0U1qM48VvFwsF/nTCOqDFdq0Ygqo2QXsgiYTbcqqYw12P3Pl5ukIqykuQWo4GQL0EiWDjzt21EhHuDX44URFi95V39OUsv3k9ufZJuVf/RSFZLil8HTjtRBsORhcDVhDnPXhEKI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <156E03EABEF9564AAF6B4A02F4F153E7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e8e083-2c1b-4aa9-8537-08d824b653b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 09:47:57.8163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5rdthPW8U+yHsHeH1IJjz/WRFMtNMw0AkPDifJb5ivtstigwU5FiNM/oo6Zbk4FzQUN1houTGL3LL+QVCnfOZNVs9/YEx02NbtpksrgtS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3514
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDEwLjA3LjIwMjAgMTA6MzAsIFdlaSBZb25nanVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEdjYyByZXBvcnQgYnVpbGQgd2Fybmlu
ZyBhcyBmb2xsb3dzOg0KPiANCj4gZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9hdG1lbF91c2JhX3Vk
Yy5jOjIxMDY6MjI6IHdhcm5pbmc6DQo+ICB2YXJpYWJsZSBwcCBzZXQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQ0KPiAgMjEwNiB8ICBzdHJ1Y3QgZGV2aWNlX25vZGUg
KnBwOw0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+DQo+IA0KDQpUaGlzIGhhcyBi
ZWVuIGFsc28gcHJvcG9zZWQgaW4gc2VyaWVzIHdpdGggdGl0bGUNCiJbUEFUQ0ggMDAvMzJdIEZp
eCB0aGUgZmluYWwgYnVuY2ggb2YgVz0xIGlzc3VlcyBpbiBVU0IiDQoNCj4gQWZ0ZXIgY29tbWl0
IGU3ODM1NWI1NzdjNCAoInVzYjogZ2FkZ2V0OiB1ZGM6IGF0bWVsOiBEb24ndA0KPiB1c2UgRFQg
dG8gY29uZmlndXJlIGVuZCBwb2ludCIpLCB2YXJpYWJsZSAncHAnIGlzIG5ldmVyIHVzZWQsDQo+
IHNvIHJlbW92aW5nIGl0IHRvIGF2b2lkIHdhcm5pbmcuDQo+IA0KPiBSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBZb25nanVu
IDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2dhZGdldC91
ZGMvYXRtZWxfdXNiYV91ZGMuYyB8IDMgLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2F0bWVsX3Vz
YmFfdWRjLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2F0bWVsX3VzYmFfdWRjLmMNCj4gaW5k
ZXggZDY5ZjYxZmYwMTgxLi5hMTBiOGQ0MDZlNjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNi
L2dhZGdldC91ZGMvYXRtZWxfdXNiYV91ZGMuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQv
dWRjL2F0bWVsX3VzYmFfdWRjLmMNCj4gQEAgLTIxMDMsNyArMjEwMyw2IEBAIHN0YXRpYyBzdHJ1
Y3QgdXNiYV9lcCAqIGF0bWVsX3VkY19vZl9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5v
Zl9ub2RlOw0KPiAgICAgICAgIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOw0KPiAt
ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcHA7DQo+ICAgICAgICAgaW50IGksIHJldDsNCj4g
ICAgICAgICBzdHJ1Y3QgdXNiYV9lcCAqZXBzLCAqZXA7DQo+ICAgICAgICAgY29uc3Qgc3RydWN0
IHVzYmFfdWRjX2NvbmZpZyAqdWRjX2NvbmZpZzsNCj4gQEAgLTIxMjgsNyArMjEyNyw2IEBAIHN0
YXRpYyBzdHJ1Y3QgdXNiYV9lcCAqIGF0bWVsX3VkY19vZl9pbml0KHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEdQSU9EX0lOKTsNCj4gDQo+ICAgICAgICAgaWYgKGZpZm9fbW9kZSA9PSAwKSB7DQo+
IC0gICAgICAgICAgICAgICBwcCA9IE5VTEw7DQo+ICAgICAgICAgICAgICAgICB1ZGMtPm51bV9l
cCA9IHVkY19jb25maWctPm51bV9lcDsNCj4gICAgICAgICAgICAgICAgIHVkYy0+Y29uZmlndXJl
ZF9lcCA9IDE7DQo+ICAgICAgICAgfSBlbHNlIHsNCj4gQEAgLTIxNDQsNyArMjE0Miw2IEBAIHN0
YXRpYyBzdHJ1Y3QgdXNiYV9lcCAqIGF0bWVsX3VkY19vZl9pbml0KHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYsDQo+IA0KPiAgICAgICAgIElOSVRfTElTVF9IRUFEKCZlcHNbMF0uZXAuZXBf
bGlzdCk7DQo+IA0KPiAtICAgICAgIHBwID0gTlVMTDsNCj4gICAgICAgICBpID0gMDsNCj4gICAg
ICAgICB3aGlsZSAoaSA8IHVkYy0+bnVtX2VwKSB7DQo+ICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgdXNiYV9lcF9jb25maWcgKmVwX2NmZyA9ICZ1ZGNfY29uZmlnLT5jb25maWdbaV07DQo+
IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbA0KPiA=
