Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B3522A0D3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 22:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgGVUgO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 16:36:14 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53102 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726642AbgGVUgO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 16:36:14 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0659C0083;
        Wed, 22 Jul 2020 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595450173; bh=etvrDQCdGx9qxA6ojyCAUthg+gd1trePcpy24QDH2xg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=CKZ8mEiLRLTAeHLmcorABvbAylVjJzQQTDCvQgNuW0TWzEh3wGtgksNm9BWgtPixU
         2MHq6Vav+aSyi8HLd+GSo0527px5Vzk3IT1WNhCUR/SIuofuj/OjW9kjpM+UYCUnfJ
         PolqvAsou74d2Q4Gua5Jvp9dkvQMqmMvmkF7JMag/USB2Q2COs05OTBkg9Tx/zEZbP
         Ve3OXKjR2toujqA+ogX4nFqt60/hXPqhSbSeLz7Roz7YQBpN9v/bJuCjpjfvq9/Ip4
         whM1nsxCWIp9eQm/rSViXQm3WFHXp2N93NtG+GJm7FDU/N+FNpcBEBFw2+/U/m9SpW
         iP6d8xCXVTjTw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4AD8DA0063;
        Wed, 22 Jul 2020 20:36:12 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C4DAE40161;
        Wed, 22 Jul 2020 20:36:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="IwgeuFBp";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUTL+VRltlZ+FBW0z8ygzKVy6V2yjNw6/+cfUEHZ5YMVOuADS+y9Zl51ivtkcJ//KRSlsb2T5L468PTb4mDubFDWMZbM5nU0Hr8u8Y0+pEn2jcze6guLX2MP2MlgsfPZzPFCD7hEJx+1uLRSz0OHjShCHtmUAXVHHDUXzx43eyrUpH7Or0PCT4z3olKrcVyVR/Lwc82sv8hYSHG9Nhg9bGaaeWQAr6fQAAxeesGG3IzY0JCAPj2DHAkrKWKUe4hOaajvTvgAlWp7Up+olrQD3Iv1X4mU7g+IABjKx3qPOYy8OcNWEfxOw0xxY2xXRTxMSVHMpZHV7kvD3h4n9P+8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etvrDQCdGx9qxA6ojyCAUthg+gd1trePcpy24QDH2xg=;
 b=kHpduzJzreeRP4XY+Zetep3GHjAGvMUFI+7GmYauDZUGh6B7K/XDU9hiPZpCYtmHY2yEn4IHQ4YISmSVXr+FRrxrrPl+OLlmBUj6luyXFdO9LX8oBPUOlZnRQ4Re+EKPK/oIJRjwmELj0K7gsuD6nNWu16dDeAHBtxxeWo3jNyxkgr9Flb7BYv8a+Bw+tXob6DWVQDbDaVsyg97zdq8aWHXnG0GNsAfSCTcKfc7BrmMyjxpZa7Bwgdq26l3ScZxrYtQsZ2mW2Mg/MnUVVFGBx0tYl/rueNVm6dAqKSsnTAg+qNVrE/+TOrZmtkqTa+Y7Zg7iDPN/Pi2BzXiZJmUYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etvrDQCdGx9qxA6ojyCAUthg+gd1trePcpy24QDH2xg=;
 b=IwgeuFBp2LGQjMTdVq9Wes3MgzBN3z2t1KkIn/fJb2ouxL/N0uU8K9bHjRs06ItJct+1fC+Yfd0Jb0nZYxUnUR6ROA2JSX+sHyLEqzSIpaVUvJ5Dhx8SQOAQlpCfo2E2cp3y3rlxheMfE92lDIbBlKN7wG673PniSerc7g/o7FU=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3143.namprd12.prod.outlook.com (2603:10b6:a03:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 20:36:10 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 20:36:10 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Li Jun <jun.li@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: debugfs: do not queue work if try to change
 mode on non-drd
Thread-Topic: [PATCH] usb: dwc3: debugfs: do not queue work if try to change
 mode on non-drd
Thread-Index: AQHWYAd0AWhznuHztkGR30E+GUSzFqkUD2eA
Date:   Wed, 22 Jul 2020 20:36:10 +0000
Message-ID: <7b386b9d-4dd8-5133-5a22-89e3eb86bd6a@synopsys.com>
References: <1595408575-13150-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1595408575-13150-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92b6d09c-3322-4cd9-46bf-08d82e7ede40
x-ms-traffictypediagnostic: BYAPR12MB3143:
x-microsoft-antispam-prvs: <BYAPR12MB3143677E643634EF95202BCFAA790@BYAPR12MB3143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3hLvtWQHnS/Sl7o2ElZcpatZonOp3MR+Sk9dOhSVKVAnAsCYaODFu0EDvROkiEF80+iVtFMaq+mrYwaB7JSbvKL1A6igwSWyh4Nf3vnYzUuTZfmkQbksJ7zqE0TIV+N5Zr2qY9/ZZhi5F1zax1gQ00NqDFGaPGaavzgtnN6b+v2duFxAhKRCXUkhGswPLIbjxKNzHWY31QMZo5/xRnR+92F8eONFfKkf0S8Pm7BNEMruGUjvWcSI3Gtrf9eaZnnB+iFA6iy1UabUGoaBrrxy9qYRWEGOjGpgdWZ7PAAwAdNFuXoHFoiGQmCP9YYo4O96egtxmkAxSPWvutL4qy0OzSQkzDYxErkkgHr6CSN6UzU493/eVLQiwpTHcl8hY2Rb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(346002)(376002)(39860400002)(366004)(31696002)(66556008)(36756003)(66476007)(54906003)(8936002)(66946007)(2906002)(76116006)(316002)(2616005)(8676002)(66446008)(71200400001)(64756008)(110136005)(31686004)(4326008)(6512007)(5660300002)(45080400002)(478600001)(186003)(26005)(86362001)(83380400001)(6506007)(6486002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 58iHHPn6D+qPcsUvOrwGIm+JT/LDIxNwBZohF25LPIxnfwXp7XLvdfTaYqSgkIW/6G0hlHapMmJpGLmv54Om2EL/g2IOD/YQITE/2otvI4nrSmFlwwLO2Vw7G0bKoV5yEFUugrCugf8AwMnuNGk5yd1D0kzp5Rf7jG/noHzS0aikuaqHzGhTkqRrIf/+BHlAQgv5Fh1dMLNDQBjackfQY4I1wzZv6+6FuGqR23xLvAT8YQ89klX6WhV66O0tZCn6t4BD4RtySyWszIwGw9yKAH2EMckU96lKJrRiykCIIMjGkG3er3cfb1DlvhP/cskUp8qPwXxpPGySqNcysK+H7pOqHtNpdAoOONnMaDt/4Q/WRgTvCQLyrrVTYNXu0Q9CwnpHqrOygT7NdSw8d7WUU23lbFanIMBCMrrrJfk/AtL36Yr9f6OG18cJY6A40P7UtxnHoycfYdIo6gnRXtMUzc4zOyhycLhzzJt5egllbKE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5036B49B13AB84E84BB4353A6346882@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b6d09c-3322-4cd9-46bf-08d82e7ede40
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 20:36:10.0997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: woFEUAAH78zOxAgNotnjEH6+gHfsJb+eUpdTcOtRdl/qld7bcn7dLWn6ztiPOEGNbnXnGBxvSbXmRbYJNEfZog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3143
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkxpIEp1biB3cm90ZToNCj4gRG8gbm90IHRyeSB0byBxdWV1ZSBhIGRyZCB3b3JrIGZv
ciBjaGFuZ2UgbW9kZSBpZiB0aGUgcG9ydCBpcyBub3QgYSBkcmQsDQo+IHRoaXMgaXMgdG8gYXZv
aWQgYmVsb3cga2VybmVsIGR1bXA6DQoNCkFyZSB5b3UgdGFsa2luZyBhYm91dCBPVEcgb3IgRFJE
PyBUaGlzIHBhdGNoIHNlZW1zIHRvIGJlIGZvciBPVEcuIElmIHlvdSANCm5lZWQgdG8gZGVidWcg
YW5kIG1hbnVhbGx5IGRvIHJvbGUgc3dpdGNoIGZvciBEUkQgZnJvbSB1c2Vyc3BhY2UsIGVuYWJs
ZSANCmFuZCB1c2Ugcm9sZSBjbGFzcyBzeXNmcyBhdHRyaWJ1dGUuDQoNCkJSLA0KVGhpbmgNCg0K
PiBbICAgNjAuMTE1NTI5XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4g
WyAgIDYwLjEyMDE2Nl0gV0FSTklORzogQ1BVOiAxIFBJRDogNjI3IGF0IGtlcm5lbC93b3JrcXVl
dWUuYzoxNDczDQo+IF9fcXVldWVfd29yaysweDQ2Yy8weDUyMA0KPiBbICAgNjAuMTI4MjU0XSBN
b2R1bGVzIGxpbmtlZCBpbjoNCj4gWyAgIDYwLjEzMTMxM10gQ1BVOiAxIFBJRDogNjI3IENvbW06
IHNoIE5vdCB0YWludGVkDQo+IDUuNy4wLXJjNC0wMDAyMi1nOTE0YTU4Ni1kaXJ0eSAjMTM1DQo+
IFsgICA2MC4xMzkwNTRdIEhhcmR3YXJlIG5hbWU6IE5YUCBpLk1YOE1RIEVWSyAoRFQpDQo+IFsg
ICA2MC4xNDM1ODVdIHBzdGF0ZTogYTAwMDAwODUgKE56Q3YgZGFJZiAtUEFOIC1VQU8pDQo+IFsg
ICA2MC4xNDgzNzZdIHBjIDogX19xdWV1ZV93b3JrKzB4NDZjLzB4NTIwDQo+IFsgICA2MC4xNTIz
ODVdIGxyIDogX19xdWV1ZV93b3JrKzB4MzE0LzB4NTIwDQo+IFsgICA2MC4xNTYzOTNdIHNwIDog
ZmZmZjgwMDAxMjRlYmM0MA0KPiBbICAgNjAuMTU5NzA1XSB4Mjk6IGZmZmY4MDAwMTI0ZWJjNDAg
eDI4OiBmZmZmODAwMDExODA4MDE4DQo+IFsgICA2MC4xNjUwMThdIHgyNzogZmZmZjgwMDAxMTgx
OWVmOCB4MjY6IGZmZmY4MDAwMTFkMzk5ODANCj4gWyAgIDYwLjE3MDMzMV0geDI1OiBmZmZmODAw
MDExODA4MDE4IHgyNDogMDAwMDAwMDAwMDAwMDEwMA0KPiBbICAgNjAuMTc1NjQzXSB4MjM6IDAw
MDAwMDAwMDAwMDAwMTMgeDIyOiAwMDAwMDAwMDAwMDAwMDAxDQo+IFsgICA2MC4xODA5NTVdIHgy
MTogZmZmZjAwMDBiN2MwOGUwMCB4MjA6IGZmZmYwMDAwYjZjMzEwODANCj4gWyAgIDYwLjE4NjI2
N10geDE5OiBmZmZmMDAwMGJiOTliYzAwIHgxODogMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgNjAu
MTkxNTc5XSB4MTc6IDAwMDAwMDAwMDAwMDAwMDAgeDE2OiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsg
ICA2MC4xOTY4OTFdIHgxNTogMDAwMDAwMDAwMDAwMDAwMCB4MTQ6IDAwMDAwMDAwMDAwMDAwMDAN
Cj4gWyAgIDYwLjIwMjIwMl0geDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAwMDAwMDAwMDAw
MDAwMA0KPiBbICAgNjAuMjA3NTE1XSB4MTE6IDAwMDAwMDAwMDAwMDAwMDAgeDEwOiAwMDAwMDAw
MDAwMDAwMDQwDQo+IFsgICA2MC4yMTI4MjddIHg5IDogZmZmZjgwMDAxMWQ1NTQ2MCB4OCA6IGZm
ZmY4MDAwMTFkNTU0NTgNCj4gWyAgIDYwLjIxODEzOF0geDcgOiBmZmZmMDAwMGI3ODAwMDI4IHg2
IDogMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgNjAuMjIzNDUwXSB4NSA6IGZmZmYwMDAwYjc4MDAw
MDAgeDQgOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsgICA2MC4yMjg3NjJdIHgzIDogZmZmZjAwMDBi
Yjk5N2NjMCB4MiA6IDAwMDAwMDAwMDAwMDAwMDENCj4gWyAgIDYwLjIzNDA3NF0geDEgOiAwMDAw
MDAwMDAwMDAwMDAwIHgwIDogZmZmZjAwMDBiNmMzMTA4OA0KPiBbICAgNjAuMjM5Mzg2XSBDYWxs
IHRyYWNlOg0KPiBbICAgNjAuMjQxODM0XSAgX19xdWV1ZV93b3JrKzB4NDZjLzB4NTIwDQo+IFsg
ICA2MC4yNDU0OTZdICBxdWV1ZV93b3JrX29uKzB4NmMvMHg5MA0KPiBbICAgNjAuMjQ5MDc1XSAg
ZHdjM19zZXRfbW9kZSsweDQ4LzB4NTgNCj4gWyAgIDYwLjI1MjY1MV0gIGR3YzNfbW9kZV93cml0
ZSsweGY4LzB4MTUwDQo+IFsgICA2MC4yNTY0ODldICBmdWxsX3Byb3h5X3dyaXRlKzB4NWMvMHhh
OA0KPiBbICAgNjAuMjYwMzI3XSAgX192ZnNfd3JpdGUrMHgxOC8weDQwDQo+IFsgICA2MC4yNjM3
MjldICB2ZnNfd3JpdGUrMHhkYy8weDFjOA0KPiBbICAgNjAuMjY3MDQ1XSAga3N5c193cml0ZSsw
eDY4LzB4ZjANCj4gWyAgIDYwLjI3MDM2MF0gIF9fYXJtNjRfc3lzX3dyaXRlKzB4MTgvMHgyMA0K
PiBbICAgNjAuMjc0Mjg2XSAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHg2OC8weDE2MA0K
PiBbICAgNjAuMjc5MDc3XSAgZG9fZWwwX3N2YysweDIwLzB4ODANCj4gWyAgIDYwLjI4MjM5NF0g
IGVsMF9zeW5jX2hhbmRsZXIrMHgxMGMvMHgxNzgNCj4gWyAgIDYwLjI4NjQwM10gIGVsMF9zeW5j
KzB4MTQwLzB4MTgwDQo+IFsgICA2MC4yODk3MTZdIC0tLVsgZW5kIHRyYWNlIDcwYjE1NTU4MmUy
Yjc5ODggXS0tLQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0K
PiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYyB8IDMgKysrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0KPiBpbmRleCA2ZDlk
ZTMzLi45OWU3ZjUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0KPiBAQCAtNDI4LDYgKzQyOCw5IEBA
IHN0YXRpYyBzc2l6ZV90IGR3YzNfbW9kZV93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwNCj4gICAJ
aWYgKGNvcHlfZnJvbV91c2VyKCZidWYsIHVidWYsIG1pbl90KHNpemVfdCwgc2l6ZW9mKGJ1Zikg
LSAxLCBjb3VudCkpKQ0KPiAgIAkJcmV0dXJuIC1FRkFVTFQ7DQo+ICAgDQo+ICsJaWYgKGR3Yy0+
ZHJfbW9kZSAhPSBVU0JfRFJfTU9ERV9PVEcpDQo+ICsJCXJldHVybiBjb3VudDsNCj4gKw0KPiAg
IAlpZiAoIXN0cm5jbXAoYnVmLCAiaG9zdCIsIDQpKQ0KPiAgIAkJbW9kZSA9IERXQzNfR0NUTF9Q
UlRDQVBfSE9TVDsNCj4gICANCg0K
