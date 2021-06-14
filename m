Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C17CB3A66D1
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 14:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhFNMpQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 08:45:16 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45396 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232875AbhFNMpO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 08:45:14 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E21C9403A1;
        Mon, 14 Jun 2021 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623674591; bh=CoiC+wnybxdj+K3tixNP48yg00q3pMPdGamKOvHrkGA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jO05qDCubHgvV5G6cPUdbD8UtK/FN0CDzFHkKCl7/UC4zDA012Sl3dW+iePbn0FLd
         gavuA77PloZMPk2cqHkBb5cIfk48nHApcT9ZoQdpehAJKAmRD73usd3A6FqHrQ3c/d
         0jZuAKmJ+z4leC8p0OGpNpjbuzmQNp3eX2ZZc0Hin5Qld9A+ULTYw8Bch+yq8sddG0
         zfjsX4ARJZ3fZAqJpT6jB727mlyO4yOI1jHTwyABo77GS/qcRK3iD4X7EzOKFP2a+S
         qgEBvCemy0m/rEs8l1L+AvPfQjjiYRVy/7nOEZ/6oYl/YhJTnviBcXAuuWGydHH3ad
         VAupPzRmdbmQQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7D717A0096;
        Mon, 14 Jun 2021 12:43:09 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3D897400A1;
        Mon, 14 Jun 2021 12:43:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="s1kkB5JR";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6Moh4Wjw8dNLJT+z4ewXSQ8Y30OTjmuwSPNq2j6K/r3CTqxMa8t8QpPtUzKG8OiB2sqZFDIw99p3/s9fWKEUjOsZaspV3A4MGWpSQFmUqBVUzaKR+WZZi2Z6eowW1HTBllUL/BYVnJu2PLq7e6mRJ/TkXKen3Qxj4NwZ8XTXr4wfroJchSP6TDGMrL4aQWJTzVUozcqCNE/crSt3ra+9hvVU9zSlWirrpzYaUlj0RUzm+AfGix+fJLqKJWPdSvXMvHE/9jvv9znSQxfM4x+LNX7HwKoKr+65eicctbCcu98YAQhEH0cWeHU1HGeJ5eRnabq1SvE7tohIV9N9WFFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoiC+wnybxdj+K3tixNP48yg00q3pMPdGamKOvHrkGA=;
 b=jtieWer6yq5M1eddsyLIpdmelyTNt3WO66O785RxjOh5EnHz41Df7ziioj05WtWYjYNCtRD6zJUZekxO6ML2InXhqvi9OGOwcIDvRXwgcOCIV/iuiGvc1FNOZuDXLX89o1wXf9ZvlzNYOu+07sOK99Kd+KXISC3DxHnxm7puU5ZiUq91Q/x86ItS5ytM5zYAPSAmU5gOwQzVPM7djuh5qSHVXMDjGQOOxpINAmY3PKwqEAqgDcGynlarohMd3Q99u9L/DYU0fuN8geTm6D2IQDoUNpsTVyoL25hx1/bKE5NEnKZDIND0Cb/SvNUNWNYxISiQW4QYo2IpkwqGpj/n6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoiC+wnybxdj+K3tixNP48yg00q3pMPdGamKOvHrkGA=;
 b=s1kkB5JRU26wczWrNEymdG4RB9h9mBCpA7jJR40YEEWEohMkBXxxLTnZCXMlSKNEIjKaDtpztFoXhukP8PgNEgh7qOWvCjt1bvVsxgj0K5IXOoL25S2LSdbggiO22J2RS6oWZ1DS95awhpjJR4tbebvyjdTS9De6bEppvKPOEkg=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5262.namprd12.prod.outlook.com (2603:10b6:5:399::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 12:43:04 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4%8]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:43:04 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     =?utf-8?B?Q2zDqW1lbnQgTGFzc2lldXI=?= <clement@lassieur.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "jmaselbas@kalray.eu" <jmaselbas@kalray.eu>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: dwc2: Don't reset the core after setting turnaround
 time
Thread-Topic: [PATCH] usb: dwc2: Don't reset the core after setting turnaround
 time
Thread-Index: AQHXWJF1wCrr/EyZSEuoKvE/UfVZ16sThH6A
Date:   Mon, 14 Jun 2021 12:43:04 +0000
Message-ID: <e01df823-648d-6793-8bfb-d334994a2d39@synopsys.com>
References: <20210603155921.940651-1-clement@lassieur.org>
In-Reply-To: <20210603155921.940651-1-clement@lassieur.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
authentication-results: lassieur.org; dkim=none (message not signed)
 header.d=none;lassieur.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.93.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b64b0c4-4299-4a30-c88f-08d92f31f458
x-ms-traffictypediagnostic: DM4PR12MB5262:
x-microsoft-antispam-prvs: <DM4PR12MB526215C2A23AA76C53A9BEFEA7319@DM4PR12MB5262.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8qorljVOKmTToa8kI6lrNZFyB+O+IYkTeQvV9aWaphiphXXTaqociU9EkQp2uZS9jvYzA9/jXCh5nWgN8pl7DuaN488Z5sK5RViMi1WWahT9Cgl7yiw12/MTc1kP15itw7Pv79civOK4afRzzE5q6rhXWRnU0JwPEGigpuePaMi1UMbQVqRGojVlwEBxTyPVHgF9jLf1/l0qNBBgBCKLNMHR6H8v2vTt1uWuV25HH7YWr3aZlMh7A5WA7WpH2wKwwwFjyXA/XOmELWZDibq0OvO0X6X3LdJ0YJ2GBCkeRDSaOxvc+cHoTDLgISsS627XkIkVvL0aRfYkuxdAmIprQXQkNZYEXxrV5rjtoEqWCwuf5VlLVAubUN0DxZesgVWP/QiurLXedvhqbKRnMvsLeyZ9cCvj2dANAlD/flY70vaLTzfRl868E9uIJbqQEgU/B3DGi/SaGXNK3C00naFibHPL3MLtmaG9LFwVuCtRvwBDB1HkzNZVEDG8YR/7chB/zixnZPxNdlLa8Ow/Olf1Pc4frwQQC/Nh9KuyXNcV5qoJYsoSrtX7UX8K5yqj24xXYmTki7KW9euFhgIzAPEQSBc+CmqQfUrwgfohij2M8wxY1y6PcFCwjTkXJNyCyZ8lht2onvtCfDltTvlxXnWi1FVykUEO2VdRRP4Qo3owvFmxW94362B6556KFsI3EHZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39860400002)(376002)(346002)(64756008)(66446008)(66476007)(66556008)(66946007)(6506007)(53546011)(110136005)(86362001)(71200400001)(31696002)(54906003)(38100700002)(31686004)(2906002)(5660300002)(478600001)(122000001)(83380400001)(76116006)(91956017)(186003)(26005)(8936002)(6486002)(4326008)(316002)(8676002)(36756003)(2616005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 8KOv81GSJoxPKBM46rrZCRcMGjJ3PdWH9tlAt2DaArY88yHyhhI2ZHm2H04oFz+VFOX8cB+qNPmMZEro8l+TBMGypOWB9EhcEXFjtoYMTxc5FRS0Ked4qvZaEre0N7/6f4528zmypmfcXv5DGTriQ6WAXn+OrLSiPBkMMFyZ6zaoSVKjNJ7i+d9S1WHNFR8xSbrzVIq6C1UL6t+JY39EAjWriGoObkZ/3NUwUcBBN6aXbCSUKT+SVTrldkMAq1ZXgxcP0W5Dfuk+bc9RUkGZTE2JfT63tGrcxhjU6uHdmiJceh/L1kEq2MUiELeOwuHGIUd57GW3kpU3n3rMdnCB5wQvWJ4WKWMRQvxrd3BfVF6aA2zJ9X2fPnscaxZfDKGamiLwSsCMPgaTrQbo7RovqVlYAPZc4YshE7N7VwTmuvvbWsaH6Cj7rxk13FiayxfD2BB4JJqaUVpKBtBBWdwNdulA4645LTqVYslyX3faQSbrqAyJcNE4QO39ioIK1u6xshtgrMSJdD0rCqx37RwIGWrDuw+6bR8TDYgviExMOW0puQT7W3617Hm3L2YlxTURauaANFCoZjlKf7NGhjoxZ+rjuDPU1QqQbaqId0kuXUsGVMLRX9IhCp38K7NcfaNHYo85bynvTtJ57dHlN0aD+szx3Rw1Kcq91DbKFa4M1AisZiHFA7TYSCE9ODcuW3K15B7EcvtOXzUP2oYtlBX59x4YeFEs1nUCsesXGipSdYw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA988888DBC8EF48A83D552DACA3ABE2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b64b0c4-4299-4a30-c88f-08d92f31f458
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 12:43:04.7146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ufB8w+t142tigZNHh1amk9focmtU9VjagzRjwuJM9IV3zUpb4pwJAQt133WJVwjvoKHz9LcX3FWjlvDU0RcUDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5262
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gNi8zLzIwMjEgNzo1OSBQTSwgQ2zDqW1lbnQgTGFzc2lldXIgd3JvdGU6DQo+IEV2ZXJ5IHRp
bWUgdGhlIGh1YiBzaWduYWxzIGEgcmVzZXQgd2hpbGUgd2UgKGRldmljZSkgYXJlIGhzb3RnLT5j
b25uZWN0ZWQsDQo+IGR3YzJfaHNvdGdfY29yZV9pbml0X2Rpc2Nvbm5lY3RlZCgpIGlzIGNhbGxl
ZCwgd2hpY2ggaW4gdHVybiBjYWxscw0KPiBkd2MyX2hzX3BoeV9pbml0KCkuDQo+IA0KPiBHVVNC
Q0ZHLlVTQlRyZFRpbSBpcyBjbGVhcmVkIHVwb24gQ29yZSBTb2Z0IFJlc2V0LCBzbyBpZg0KPiBo
c290Zy0+cGFyYW1zLnBoeV91dG1pX3dpZHRoIGlzIDgtYml0LCB0aGUgdmFsdWUgb2YgR1VTQkNG
Ry5VU0JUcmRUaW0gKHRoZQ0KPiBkZWZhdWx0IG9uZTogMHg1LCBjb3JyZXNwb25kaW5nIHRvIDE2
LWJpdCkgaXMgYWx3YXlzIGRpZmZlcmVudCBmcm9tDQo+IGhzb3RnLT5wYXJhbXMucGh5X3V0bWlf
d2lkdGgsIHRodXMgZHdjMl9jb3JlX3Jlc2V0KCkgaXMgY2FsbGVkIGV2ZXJ5DQo+IHRpbWUgKHVz
YmNmZyAhPSB1c2JjZmdfb2xkKSwgd2hpY2ggY2F1c2VzIDIgaXNzdWVzOg0KPiANCj4gMSkgVGhl
IGNhbGwgdG8gZHdjMl9jb3JlX3Jlc2V0KCkgZG9lcyBhbm90aGVyIHJlc2V0IDMwMHVzIGFmdGVy
IHRoZSBpbml0aWFsDQo+IENoaXJwIEsgb2YgdGhlIGZpcnN0IHJlc2V0ICh3aGljaCBzaG91bGQg
bGFzdCBhdCBsZWFzdCBUdWNoID0gMW1zKSwgYW5kDQo+IG1lc3NlcyB1cCB0aGUgSGlnaC1zcGVl
ZCBEZXRlY3Rpb24gSGFuZHNoYWtlOiBib3RoIGh1YiBhbmQgZGV2aWNlIGRyaXZlDQo+IGN1cnJl
bnQgaW50byB0aGUgRCsgYW5kIEQtIGxpbmVzIGF0IHRoZSBzYW1lIHRpbWUuDQo+IA0KPiAyKSBH
VVNCQ0ZHLlVTQlRyZFRpbSBpcyBjbGVhcmVkIGJ5IHRoZSBzZWNvbmQgcmVzZXQsIHNvIGl0cyB2
YWx1ZSBpcyBhbHdheXMNCj4gdGhlIGRlZmF1bHQgb25lICgweDUpLg0KPiANCj4gU2V0dGluZyBH
VVNCQ0ZHLlVTQlRyZFRpbSBhZnRlciB0aGUgcG90ZW50aWFsIGNhbGwgdG8gZHdjMl9jb3JlX3Jl
c2V0KCkNCj4gZml4ZXMgYm90aCBpc3N1ZXMuICBJdCBpcyBub3cgc2V0IGV2ZW4gd2hlbiBzZWxl
Y3RfcGh5IGlzIGZhbHNlIGJlY2F1c2UgdGhlDQo+IGNvc3Qgb2YgdGhlIENvcmUgU29mdCBSZXNl
dCBpcyByZW1vdmVkLg0KPiANCj4gRml4ZXM6IDFlODY4NTQ1ZjJiYiAoInVzYjogZHdjMjogZ2Fk
Z2V0OiBNb3ZlIGdhZGdldCBwaHkgaW5pdCBpbnRvIGNvcmUgcGh5IGluaXQiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMYXNzaWV1ciA8Y2xlbWVudEBsYXNzaWV1ci5vcmc+DQoNCg0KQWNr
ZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+
DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL2NvcmUuYyB8IDMwICsrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvY29y
ZS5jIGIvZHJpdmVycy91c2IvZHdjMi9jb3JlLmMNCj4gaW5kZXggNmY3MGFiOTU3N2I0Li4yNzJh
ZTU3MjJjODYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzIvY29yZS5jDQo+IEBAIC0xMTExLDE1ICsxMTExLDYgQEAgc3RhdGlj
IGludCBkd2MyX2hzX3BoeV9pbml0KHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZywgYm9vbCBzZWxl
Y3RfcGh5KQ0KPiAgIAkJdXNiY2ZnICY9IH4oR1VTQkNGR19VTFBJX1VUTUlfU0VMIHwgR1VTQkNG
R19QSFlJRjE2KTsNCj4gICAJCWlmIChoc290Zy0+cGFyYW1zLnBoeV91dG1pX3dpZHRoID09IDE2
KQ0KPiAgIAkJCXVzYmNmZyB8PSBHVVNCQ0ZHX1BIWUlGMTY7DQo+IC0NCj4gLQkJLyogU2V0IHR1
cm5hcm91bmQgdGltZSAqLw0KPiAtCQlpZiAoZHdjMl9pc19kZXZpY2VfbW9kZShoc290ZykpIHsN
Cj4gLQkJCXVzYmNmZyAmPSB+R1VTQkNGR19VU0JUUkRUSU1fTUFTSzsNCj4gLQkJCWlmIChoc290
Zy0+cGFyYW1zLnBoeV91dG1pX3dpZHRoID09IDE2KQ0KPiAtCQkJCXVzYmNmZyB8PSA1IDw8IEdV
U0JDRkdfVVNCVFJEVElNX1NISUZUOw0KPiAtCQkJZWxzZQ0KPiAtCQkJCXVzYmNmZyB8PSA5IDw8
IEdVU0JDRkdfVVNCVFJEVElNX1NISUZUOw0KPiAtCQl9DQo+ICAgCQlicmVhazsNCj4gICAJZGVm
YXVsdDoNCj4gICAJCWRldl9lcnIoaHNvdGctPmRldiwgIkZTIFBIWSBzZWxlY3RlZCBhdCBIUyFc
biIpOw0KPiBAQCAtMTE0MSw2ICsxMTMyLDI0IEBAIHN0YXRpYyBpbnQgZHdjMl9oc19waHlfaW5p
dChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGJvb2wgc2VsZWN0X3BoeSkNCj4gICAJcmV0dXJu
IHJldHZhbDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBkd2MyX3NldF90dXJuYXJvdW5k
X3RpbWUoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiArew0KPiArCXUzMiB1c2JjZmc7DQo+
ICsNCj4gKwlpZiAoaHNvdGctPnBhcmFtcy5waHlfdHlwZSAhPSBEV0MyX1BIWV9UWVBFX1BBUkFN
X1VUTUkpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCXVzYmNmZyA9IGR3YzJfcmVhZGwoaHNvdGcs
IEdVU0JDRkcpOw0KPiArDQo+ICsJdXNiY2ZnICY9IH5HVVNCQ0ZHX1VTQlRSRFRJTV9NQVNLOw0K
PiArCWlmIChoc290Zy0+cGFyYW1zLnBoeV91dG1pX3dpZHRoID09IDE2KQ0KPiArCQl1c2JjZmcg
fD0gNSA8PCBHVVNCQ0ZHX1VTQlRSRFRJTV9TSElGVDsNCj4gKwllbHNlDQo+ICsJCXVzYmNmZyB8
PSA5IDw8IEdVU0JDRkdfVVNCVFJEVElNX1NISUZUOw0KPiArDQo+ICsJZHdjMl93cml0ZWwoaHNv
dGcsIHVzYmNmZywgR1VTQkNGRyk7DQo+ICt9DQo+ICsNCj4gICBpbnQgZHdjMl9waHlfaW5pdChz
dHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGJvb2wgc2VsZWN0X3BoeSkNCj4gICB7DQo+ICAgCXUz
MiB1c2JjZmc7DQo+IEBAIC0xMTU4LDYgKzExNjcsOSBAQCBpbnQgZHdjMl9waHlfaW5pdChzdHJ1
Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGJvb2wgc2VsZWN0X3BoeSkNCj4gICAJCXJldHZhbCA9IGR3
YzJfaHNfcGh5X2luaXQoaHNvdGcsIHNlbGVjdF9waHkpOw0KPiAgIAkJaWYgKHJldHZhbCkNCj4g
ICAJCQlyZXR1cm4gcmV0dmFsOw0KPiArDQo+ICsJCWlmIChkd2MyX2lzX2RldmljZV9tb2RlKGhz
b3RnKSkNCj4gKwkJCWR3YzJfc2V0X3R1cm5hcm91bmRfdGltZShoc290Zyk7DQo+ICAgCX0NCj4g
ICANCj4gICAJaWYgKGhzb3RnLT5od19wYXJhbXMuaHNfcGh5X3R5cGUgPT0gR0hXQ0ZHMl9IU19Q
SFlfVFlQRV9VTFBJICYmDQo+IA0KDQo=
