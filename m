Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D75C215208
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 07:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgGFFHG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 01:07:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57914 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728766AbgGFFHG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 01:07:06 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97231401EE;
        Mon,  6 Jul 2020 05:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594012025; bh=gBBDqW69oZA6e4Sgk2ek+z24ZyNhC/6ZkVNPrgCF5Co=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=h26XS15YKQcxnshfHzbPgv5CbydZizpCuu6UizlzI7arnrQqAQdvG9hj2sUsJ22V7
         WUimtpgiKSXwt85PPSt20xczBV1s3rbQ9PdtW1dsambIZ9/B/9cuN/deA38xsA05fl
         99/iQB5Zc0jUdMCYfT8yJ56hh0GCSoRYcfOKuixh4DELY6R3pkbNsx37SNsAmLbTUy
         ENOxLScbRmIag+LBz60ZnTwQdWStN6VEuFEVrAzlL7ENPEwkg+b3ULRq+NeG9N/nKg
         kjHWGk0Wk66aHSWlh8Ho6MpoF8ebGVjq4lIEe4K28g01Dr4qW81FXFOztSLQJVBQpy
         WdThayP10Db9g==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 02E6EA0071;
        Mon,  6 Jul 2020 05:07:04 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5410F4017D;
        Mon,  6 Jul 2020 05:07:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="v9Pha6Br";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0GEFwoEEGY8nCIX43U+DiaH9Fx7kOnEjkkVp6yax0hnTfhTMlvVbP3QwJxBkFbSUAJ+jc+/JQGHrUqK7rCJRzaUZD8hVq2sAfA9nLuCN02eC5baGEarBe/dNKIm/FVfADhkMbHd+h1DXoWRi3YBTo9wmnEkOD8nm5S36V74F+wytoD9vwDuifkbUHztTR5piVXFpq/PHIrGHkpID3qN1VG+WqxAp4ULZNiDJSXYC19ZhG0JLsY3o6ug/YX7BjwOCNhC5ayS633O+Pn/gqEIesVlWnXj3etWJ/3zqQfhfc4aHNHvPuSnIWRRUjRaOv2ulXiy2mWNcyvBt8BtuyYG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBBDqW69oZA6e4Sgk2ek+z24ZyNhC/6ZkVNPrgCF5Co=;
 b=YxKGXInz2c+2RMxL3PiEkUaUodXTp21QOI49+zJKwctBHyk9jG5YUsKGRzQCcfqCUtcUf5uTY0ISX/S0MiwUcux8UKPPMOMlPWpg4Z+k1gTNAPCF+E695fn0R6xKoALw93nr28Z0H9UV6dRsY8KoK95HZ5tIoFd7GdYHy1VBp3H2DMgVHRrH69x/EGvWqpUxydAMxWg84bBIMlnXmcf/sge329mN+5R8+iErtYoAN7gagSotHxH+mlO27y9uf+EKUTGR5K3OqqS3mF9MFiAPoVVPzLOEh/J4XnEDfG/nJZFtsrLfxILK74N5dEWL45tjFAbxoqnkcrfemRNXlm89ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBBDqW69oZA6e4Sgk2ek+z24ZyNhC/6ZkVNPrgCF5Co=;
 b=v9Pha6BrZgYeE8Rbs+RpGs65VvyUSOdOwxLYRYP+uhzjfExK24hftg2hKlFkTI1l1QXm+cP+ZAFMc+PGSqMJiP0B1epQNifSkttD7p1SdPKTBSGu5779VnSSwqkiq9l+2MhlOJ8Tn6Z4TUmXlQipfnwDJWmWQp2SVuwnhBYQ4nQ=
Received: from BN8PR12MB3458.namprd12.prod.outlook.com (2603:10b6:408:44::32)
 by BN6PR12MB1827.namprd12.prod.outlook.com (2603:10b6:404:fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Mon, 6 Jul
 2020 05:07:03 +0000
Received: from BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6]) by BN8PR12MB3458.namprd12.prod.outlook.com
 ([fe80::9559:91b2:aaa3:bfd6%2]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 05:07:02 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Topic: [PATCH v3 3/4] usb: dwc3: Add device property
 sgl-trb-cache-size-quirk
Thread-Index: AQHWNBPIzVDQozhV20CqjRBnx+8J26j6PmiA
Date:   Mon, 6 Jul 2020 05:07:02 +0000
Message-ID: <5534d9d6-5452-dade-e46e-f4b0910becdb@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
 <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
In-Reply-To: <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.193.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff9d8df6-ff9c-47ee-5e84-08d8216a6ba8
x-ms-traffictypediagnostic: BN6PR12MB1827:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB18276DC56DCECD0FE39E1EE1A4690@BN6PR12MB1827.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NMSBZ0vTO3pYV7hHpJ4Mk3pN2EIsQ5g77Pm62SLDwefVzmsia1S/t61aIP3p4ftif7o2pgGnbAcI/PUzK4AT27EeamxVsAeuslmciLgYxjUfyAJiuSeq5/JNP2t+LydchOlRkoWUFZlpC78wCRxUFt7JOpw0dMNbtXBgSd48Ofd52uIiTwLoPXMNwhVOUF1iitva0hoQqIt185DBdVoX5ObgXqSqxSLn/0Pq0/vDVTJDy74zJPZL65ckGzkztuK+ndwyRXnk1xqha1/3vCaGjB/sSgEqgh3Ir+LDa4hmtyWxSZiwmmyc/FWW49I7/gpY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3458.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39850400004)(366004)(136003)(396003)(2906002)(6512007)(53546011)(54906003)(55236004)(6506007)(86362001)(31696002)(4326008)(36756003)(107886003)(2616005)(186003)(8936002)(26005)(6916009)(8676002)(316002)(6486002)(66446008)(71200400001)(76116006)(5660300002)(91956017)(64756008)(31686004)(66476007)(66556008)(66946007)(83380400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /Ci2xqEkYII37dS0j2KFPNOqlzh0/nvkQfDfMKylge8c+qDUw/tMTPtLg+vki+MYjUE1FhJ9PEY1AAsaDf6idrfshRnlAhNnasBZpYEB4K6vDJJ7GiKOiyKkSUiYAqcG8Y9s+HFNq61hClGNYWIVtrMha+npeDMb/MqUF4Lv4zeP0B4TnOIhbU7hLoco6Bd1fiL38cJo3CLsFf7daN/H31oEcmxbJS2lk4kIR62L6RfpFDiy7oJ8B0EobaQcT3WVoFMd5LNmcnArCa0qQJTG199zBzaC87P/ovTRUS1v3c7R0RV1LPyUkJ6TsKLQ9/qzZ/Ly48K3pENw6buSxGsPEuF0RSB5oksRlYb6J9Lt2qFnF1Qo4ps7+JrAAQQUPuk57S+NVj6RXx9zrs+cmpQ7iaPL2OluCKG+TWGlvFdWYu/QpLLEUaEczb48m1gxoTDZ13DMPoXfJfberNcMPxv2cbFt0RBi2bRjzf1ehJdWZwTX7/SP4ESkZtDKu+SpDXnZ
Content-Type: text/plain; charset="utf-8"
Content-ID: <D33E9757BAE2C244AFF2303FC2579502@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3458.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9d8df6-ff9c-47ee-5e84-08d8216a6ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 05:07:02.8571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5beTwGK5R0BxFKeajpcg0coMbMPqvzdhjfgw5NGp2FtLQ2+OeOv+tX2WCO/y4tcCL0Pep6Xao+qEYwNQjByzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1827
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KT24gNS8yNy8yMDIwIDQ6MTEgUE0sIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0K
PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBzZ2wtdHJiLWNhY2hlLXNpemUtcXVpcmsgcHJvcGVydHkg
dG8gZW5hYmxlDQo+IHF1aXJrIGZvciB0aGUgWEhDSSBkcml2ZXIgd2l0aCBTeW5vcHN5cyB4SEMu
IFRoaXMgcHJvcGVydHkgaXMNCj4gZW5hYmxlZCBhcyBpbml0aWFsIHByb3BlcnR5IGZvciB0aGUg
ZHdjMy1oYXBzIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRlamFzIEpvZ2xla2FyIDxq
b2dsZWthckBzeW5vcHN5cy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMg
ICAgICB8IDIgKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oICAgICAgfCAyICsrDQo+ICBk
cml2ZXJzL3VzYi9kd2MzL2R3YzMtaGFwcy5jIHwgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2hv
c3QuYyAgICAgIHwgNiArKysrKy0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggMjVjNjg2YTc1MmIwLi5iYzI5
NTQ3N2UxYmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0xMjk5LDYgKzEyOTksOCBAQCBzdGF0aWMg
dm9pZCBkd2MzX2dldF9wcm9wZXJ0aWVzKHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJCQkJInNucHMs
dXNiM19scG1fY2FwYWJsZSIpOw0KPiAgCWR3Yy0+dXNiMl9scG1fZGlzYWJsZSA9IGRldmljZV9w
cm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0KPiAgCQkJCSJzbnBzLHVzYjItbHBtLWRpc2FibGUiKTsN
Cj4gKwlkd2MtPnNnbF90cmJfY2FjaGVfc2l6ZV9xdWlyayA9IGRldmljZV9wcm9wZXJ0eV9yZWFk
X2Jvb2woZGV2LA0KPiArCQkJCSJzbnBzLHNnbC10cmItY2FjaGUtc2l6ZS1xdWlyayIpOw0KPiAg
CWRldmljZV9wcm9wZXJ0eV9yZWFkX3U4KGRldiwgInNucHMscngtdGhyLW51bS1wa3QtcHJkIiwN
Cj4gIAkJCQkmcnhfdGhyX251bV9wa3RfcHJkKTsNCj4gIAlkZXZpY2VfcHJvcGVydHlfcmVhZF91
OChkZXYsICJzbnBzLHJ4LW1heC1idXJzdC1wcmQiLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCAwMTNmNDJh
MmI1ZGMuLjBkY2EwZGJmNDMwOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTEwMjEsNiArMTAyMSw3
IEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJyYXkgew0KPiAgICoJCQlub3QgbmVlZGVkIGZv
ciBEV0NfdXNiMzEgdmVyc2lvbiAxLjcwYS1lYTA2IGFuZCBiZWxvdw0KPiAgICogQHVzYjNfbHBt
X2NhcGFibGU6IHNldCBpZiBoYWRyd2FyZSBzdXBwb3J0cyBMaW5rIFBvd2VyIE1hbmFnZW1lbnQN
Cj4gICAqIEB1c2IyX2xwbV9kaXNhYmxlOiBzZXQgdG8gZGlzYWJsZSB1c2IyIGxwbQ0KPiArICog
QHNnbF90cmJfY2FjaGVfc2l6ZV9xdWlyazogc2V0IHRvIGVuYWJsZSB0aGUgU0cgbGlzdCBjb25z
b2xpZGF0aW9uDQo+ICAgKiBAZGlzYWJsZV9zY3JhbWJsZV9xdWlyazogc2V0IGlmIHdlIGVuYWJs
ZSB0aGUgZGlzYWJsZSBzY3JhbWJsZSBxdWlyaw0KPiAgICogQHUyZXhpdF9sZnBzX3F1aXJrOiBz
ZXQgaWYgd2UgZW5hYmxlIHUyZXhpdCBsZnBzIHF1aXJrDQo+ICAgKiBAdTJzc19pbnAzX3F1aXJr
OiBzZXQgaWYgd2UgZW5hYmxlIFAzIE9LIGZvciBVMi9TUyBJbmFjdGl2ZSBxdWlyaw0KPiBAQCAt
MTIyMCw2ICsxMjIxLDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCXVuc2lnbmVkCQlkaXNfc3RhcnRf
dHJhbnNmZXJfcXVpcms6MTsNCj4gIAl1bnNpZ25lZAkJdXNiM19scG1fY2FwYWJsZToxOw0KPiAg
CXVuc2lnbmVkCQl1c2IyX2xwbV9kaXNhYmxlOjE7DQo+ICsJdW5zaWduZWQJCXNnbF90cmJfY2Fj
aGVfc2l6ZV9xdWlyazoxOw0KPiAgDQo+ICAJdW5zaWduZWQJCWRpc2FibGVfc2NyYW1ibGVfcXVp
cms6MTsNCj4gIAl1bnNpZ25lZAkJdTJleGl0X2xmcHNfcXVpcms6MTsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1oYXBzLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaGFw
cy5jDQo+IGluZGV4IDNjZWNiZjE2OTQ1Mi4uOTMxMWNiZTVmMjY0IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMtaGFwcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1oYXBzLmMNCj4gQEAgLTI5LDYgKzI5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcm9wZXJ0
eV9lbnRyeSBpbml0aWFsX3Byb3BlcnRpZXNbXSA9IHsNCj4gIAlQUk9QRVJUWV9FTlRSWV9CT09M
KCJzbnBzLHVzYjNfbHBtX2NhcGFibGUiKSwNCj4gIAlQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBz
LGhhcy1scG0tZXJyYXR1bSIpLA0KPiAgCVBST1BFUlRZX0VOVFJZX0JPT0woInNucHMsZGlzX2Vu
YmxzbHBtX3F1aXJrIiksDQo+ICsJUFJPUEVSVFlfRU5UUllfQk9PTCgic25wcyxzZ2wtdHJiLWNh
Y2hlLXNpemUtcXVpcmsiKSwNCj4gIAlQUk9QRVJUWV9FTlRSWV9CT09MKCJsaW51eCxzeXNkZXZf
aXNfcGFyZW50IiksDQo+ICAJeyB9LA0KPiAgfTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvaG9zdC5jIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4gaW5kZXggYmVmMWMxYWMy
MDY3Li5lMDA4OWM4MjcyOGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvaG9zdC5jDQo+IEBAIC00NCw3ICs0NCw3IEBAIHN0
YXRpYyBpbnQgZHdjM19ob3N0X2dldF9pcnEoc3RydWN0IGR3YzMgKmR3YykNCj4gIA0KPiAgaW50
IGR3YzNfaG9zdF9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICB7DQo+IC0Jc3RydWN0IHByb3Bl
cnR5X2VudHJ5CXByb3BzWzRdOw0KPiArCXN0cnVjdCBwcm9wZXJ0eV9lbnRyeQlwcm9wc1s1XTsN
Cj4gIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCSp4aGNpOw0KPiAgCWludAkJCXJldCwgaXJxOw0K
PiAgCXN0cnVjdCByZXNvdXJjZQkJKnJlczsNCj4gQEAgLTk1LDYgKzk1LDEwIEBAIGludCBkd2Mz
X2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCWlmIChkd2MtPnVzYjJfbHBtX2Rpc2Fi
bGUpDQo+ICAJCXByb3BzW3Byb3BfaWR4KytdID0gUFJPUEVSVFlfRU5UUllfQk9PTCgidXNiMi1s
cG0tZGlzYWJsZSIpOw0KPiAgDQo+ICsJaWYgKGR3Yy0+c2dsX3RyYl9jYWNoZV9zaXplX3F1aXJr
KQ0KPiArCQlwcm9wc1twcm9wX2lkeCsrXSA9DQo+ICsJCQlQUk9QRVJUWV9FTlRSWV9CT09MKCJz
Z2wtdHJiLWNhY2hlLXNpemUtcXVpcmsiKTsNCj4gKw0KPiAgCS8qKg0KPiAgCSAqIFdPUktBUk9V
TkQ6IGR3YzMgcmV2aXNpb25zIDw9My4wMGEgaGF2ZSBhIGxpbWl0YXRpb24NCj4gIAkgKiB3aGVy
ZSBQb3J0IERpc2FibGUgY29tbWFuZCBkb2Vzbid0IHdvcmsuDQo+IA0KRG9lcyB0aGlzIGltcGxl
bWVudGF0aW9uIGxvb2tzIGdvb2QgdG8geW91PyBSb2IgaGFzIHNvbWUgY29uY2VybmVkIG92ZXIg
dGhlIERUIGVudHJpZXMsDQp5b3Ugc3VnZ2VzdGVkIHVzaW5nIGNvbXBhdGlibGUgc3RyaW5nIHdp
dGggdGhpcyBxdWlyayBhZGRpdGlvbi4NCkNhbiB5b3UgcGxlYXNlIGJyaWVmIGFib3V0IGhvdyB5
b3Ugd291bGQgbGlrZSB0byBoYXZlIHRoaXMgcXVpcmsgaW1wbGVtZW50ZWQ/DQpJIGNhbiBzZW5k
IHRoZSB1cGRhdGVkIHBhdGNoLiBNeSBwYXRjaCBzZXJpZXMgaXMgcGVuZGluZyBmb3IgbWVyZ2Ug
anVzdCBiZWNhdXNlIG9mIHRoZQ0KRFQgYW5kIHF1aXJrIGlzc3VlLiBDYW4geW91IHBsZWFzZSBo
ZWxwPw0KDQpUaGFua3MgJiBSZWdhcmRzLA0KIFRlamFzIEpvZ2xla2FyDQo=
