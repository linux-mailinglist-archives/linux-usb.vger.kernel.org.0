Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBD5211258
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 20:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732841AbgGASGi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 14:06:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41890 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732814AbgGASGh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 14:06:37 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7FADC00B4;
        Wed,  1 Jul 2020 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593626796; bh=JfgjO+i47Jo0Q7zglPd40+bX5i9DLjLUjjb+G/avBAg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=R3qoeLP0SZfxl9aWeAjuU1+8Vg/zeeTWb4tqUwDg1AGGNP4a/BBaCg16LEPhI1VZO
         1TAphmY5LnbmRC1BDpUfaveGXg9NBpNfKi4l6TO6hMGR+oIad4YMefXGLuyrE/h5VV
         2uSuXTdWO0vLTjG3OdCfHMDWDri5p0f7Mym/EB7VBPBSMHZnJCMzEsJQkhHXGJu6P8
         s5K4xFU4vNuEk4wx8o3RxhAl8N2pTApUXFaEnabuYcPCfJWzCbYPJWwF2QauXEXINy
         ps22Wt7sCBEx76yhAAcYRU25aluzPGueNdKmvJxz8CYaxt8pQ0bl47E1IPN1Y//6SD
         yupj3KMh5ZKOw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CF4A5A0081;
        Wed,  1 Jul 2020 18:06:34 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4C2D1400C5;
        Wed,  1 Jul 2020 18:06:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="svDrsilD";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfzoPc02mzO5Dty8owPOajYm2NewJH+lvx8TwpelHwdIhSYhHzeJvZUjoTF+ont/TSQN2y3Jsq0+CIaITYHKaK8ANdyT6UptZkncD5vwDox4shIeblB246WDh3TNCIZ+o7H8PT9uvQqYXnkvIGEtXy67x4/PevBy88/o1dyvCYXoqGj0V1gnghcEAcMWGi6Iqc1N82N9BcHnv+XyBX8ZShCGP4w0shGoNlrFMI2QdXNPVqUKwxqeYlpOeCyzIjIhaDO7q6n1uouLsa1ndHNL5/plL7cD60XoamhMf+kONaZgLFZmawJl7sVRPiMT/tNpk4W3atH8Xf0wviobSrTfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfgjO+i47Jo0Q7zglPd40+bX5i9DLjLUjjb+G/avBAg=;
 b=OrJ1cyNM5olxzwucHFUCoFOGngbkGs5OmEZXtHpjsLQULSKYCld0eNN7n5YENwXoyOXAZ67h52X11zn/cDMlh5MorfZBfYI+LXphZ8Ar8IHBFvpsPuywDX7aSv0NBxZEXB9lZw8IOQbRi0WNtsxdwH9fgvCbJkO2NQbjUojtPxWaFOkfCdrTM8s6PooSxb2CwHjKAWNbIaeLPtB1eow6/kSYETn5LtE5lucSDGB8qcRuhYKnWRY+WVsgvS25RUNDFyoElhGVwbSott14m3PikdJ2AM09fUWeM6EUgCcCBZejozyZ8PhbRIL9mQ6PvOVwTuVYkENSQ5Rfmisg8f3+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfgjO+i47Jo0Q7zglPd40+bX5i9DLjLUjjb+G/avBAg=;
 b=svDrsilD/mHyMV/P60b9xMtyV/saH6WjzCDN2Lgvld3N2NveA2JDI7nh0PJS+S8hEvBfHy5hUNP6bUvoOhGhKzrK0cZealEyBC9z/uOR04aJY7AgacDQPYTf69NqAdTtTFiaKZjcqt3JMl5tLrln8YnKk0pCz7gtaIAO/Vu2yHQ=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3335.namprd12.prod.outlook.com (2603:10b6:a03:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Wed, 1 Jul
 2020 18:06:32 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3131.033; Wed, 1 Jul 2020
 18:06:32 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v4 2/3] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v4 2/3] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWT4qDIHZQHjNsvEWKpmZaYIZA2KjzBZ2A
Date:   Wed, 1 Jul 2020 18:06:32 +0000
Message-ID: <31362643-e438-3720-26ed-5698c8e903d8@synopsys.com>
References: <20200701093137.19485-1-m.grzeschik@pengutronix.de>
 <20200701093137.19485-3-m.grzeschik@pengutronix.de>
In-Reply-To: <20200701093137.19485-3-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a2976d7-805a-4719-02cc-08d81de97c5f
x-ms-traffictypediagnostic: BYAPR12MB3335:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3335B8381B74345E6EA3385AAA6C0@BYAPR12MB3335.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: noFPB6lmNobCZsfYimQ1QVbTQOwM6C3q+hFbVwlCxJZAFgKYR9NCiAlQJKvMKubvfHrCv7LbpzMAdpttt7IuXim0g/ppRMbYXgecUk/QK31fdy+ORRpEw7iBTx3qeuEaAJ2KKbwRpqcZ1putM+NYlWGq1B/zD/Xfcg6eqWzEDD/+ySXWxnCSAzyZZL4zI7fLwumCdcTTB0yCJRohFEHqdMIRZDTnr53fmM6iLZDx3woIWd/KoAxzAV0KqUn+plxQn/Mca5EcpevuUphBL65SLEMoEzpb/ZOsj3PJ974NFHsHOfNxfd5dg6inSFk0loaBLx8WGC6BHkonRO3KHV4p/nMwIRxDdEdG/PFdjazEmCt//Jhk6RyALE0dXDRfdEPX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(39860400002)(376002)(366004)(136003)(76116006)(31686004)(26005)(8936002)(6506007)(8676002)(186003)(6486002)(478600001)(36756003)(316002)(6512007)(83380400001)(71200400001)(54906003)(2906002)(2616005)(66446008)(66946007)(64756008)(4326008)(86362001)(66476007)(110136005)(66556008)(31696002)(5660300002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ZfAdLUSAcE7hWgH14KJRoS00IHcM5uPnSwLkVKT3S1UluNk+gWnmhfFPc84EOoRvzmKe3UOTuRvLlk4KLSv8eICUE4cEZXVCAdo/JpUJCjUMtU7nEvTEbXC+tjrCUTcD9EbdT2tfNZhR84O6/f/L+0WyDRfhHDRWc0nzEp3qxRJGanoEeQcuw/1ed4zW5CYChxk+k+JYBcpBuQvzIjlSw0COtUBQ8AIH2gMA7WRowvJteCwsoJtQJUXZTEWq/BnfnGWBxAuCPY0BPrCSGnzNZp4PW1B9z8HoMDIzlBwi06ID+D8nkfvA9Gb6XvHwsI1SSm1Uu/RXdI+dSYTR5x13HbVUo1wldnfbH3PWmzEKDxesuSJ5OLnIKO13DMZzybQeK+4F0B/iAT8Xr21h/S5r3O9MNuGGf/maIb2mM0Vob6+Vk+ec5/fC3XCRJuheusdQd0/hTzB57I2yam7VBkhNR9Ti96Iw15RLCzvhBilfxnA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEA731AD472AC74293DAA0F884DCC553@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2976d7-805a-4719-02cc-08d81de97c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 18:06:32.2243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A1LnMTjEQZiVfcT2BNzC891Bjpe9+gQC2/18DHl3wJLz4C39v0fB6OPi1nqZqyHKdgC+f7WceiH5r9BBxWbYGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3335
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IEZyb206IE1pY2hhZWwgT2xicmljaCA8bS5vbGJy
aWNoQHBlbmd1dHJvbml4LmRlPg0KPg0KPiBDdXJyZW50bHkgX19kd2MzX2dhZGdldF9zdGFydF9p
c29jIG11c3QgYmUgY2FsbGVkIHZlcnkgc2hvcnRseSBhZnRlcg0KPiBYZmVyTm90UmVhZHkuIE90
aGVyd2lzZSB0aGUgZnJhbWUgbnVtYmVyIGlzIG91dGRhdGVkIGFuZCBzdGFydCB0cmFuc2Zlcg0K
PiB3aWxsIGZhaWwsIGV2ZW4gd2l0aCBzZXZlcmFsIHJldHJpZXMuDQo+DQo+IERTVFMgcHJvdmlk
ZXMgdGhlIGxvd2VyIDE0IGJpdCBvZiB0aGUgZnJhbWUgbnVtYmVyLiBVc2UgaXQgaW4gY29tYmlu
YXRpb24NCj4gd2l0aCB0aGUgZnJhbWUgbnVtYmVyIHByb3ZpZGVkIGJ5IFhmZXJOb3RSZWFkeSB0
byBndWVzcyB0aGUgY3VycmVudCBmcmFtZQ0KPiBudW1iZXIuIFRoaXMgd2lsbCBzdWNjZWVkIHVu
bGVzcyBtb3JlIHRoYW4gb25lIDE0IHJvbGxvdmVyIGhhcyBoYXBwZW5lZA0KPiBzaW5jZSBYZmVy
Tm90UmVhZHkuDQo+DQo+IFN0YXJ0IHRyYW5zZmVyIG1pZ2h0IHN0aWxsIGZhaWwgaWYgdGhlIGZy
YW1lIG51bWJlciBpcyBpbmNyZWFzZWQNCj4gaW1tZWRpYXRlbHkgYWZ0ZXIgRFNUUyBpcyByZWFk
LiBTbyByZXRyaWVzIGFyZSBzdGlsbCBuZWVkZWQuDQo+IERvbid0IGRyb3AgdGhlIGN1cnJlbnQg
cmVxdWVzdCBpZiB0aGlzIGhhcHBlbnMuIFRoaXMgd2F5IGl0IGlzIG5vdCBsb3N0IGFuZA0KPiBj
YW4gYmUgdXNlZCBpbW1lZGlhdGVseSB0byB0cnkgYWdhaW4gd2l0aCB0aGUgbmV4dCBmcmFtZSBu
dW1iZXIuDQo+DQo+IFdpdGggdGhpcyBjaGFuZ2UsIF9fZHdjM19nYWRnZXRfc3RhcnRfaXNvYyBp
cyBzdGlsbCBub3Qgc3VjY2Vzc2Z1bGx5IGluIGFsbA0KPiBjYXNlcyBiaXQgaXQgaW5jcmVhc2Vz
IHRoZSBhY2NlcHRhYmxlIGRlbGF5IGFmdGVyIFhmZXJOb3RSZWFkeQ0KPiBzaWduaWZpY2FudGx5
Lg0KPg0KPiBSZXZpZXdlZC1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIE9sYnJpY2ggPG0ub2xicmljaEBwZW5ndXRyb25peC5k
ZT4NCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmV0dGVyIDxtLnRyZXR0ZXJAcGVuZ3V0cm9u
aXguZGU+DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgR3J6ZXNjaGlrIDxtLmdyemVzY2hpa0Bw
ZW5ndXRyb25peC5kZT4NCj4NCj4gLS0tDQo+IHYxIC0+IHYyOiAtIHJlbW92ZWQgbGFzdF9mcmFt
ZV9udW1iZXIgZnJvbSBzdHJ1Y3QNCj4gICAgICAgICAgICAtIGluY2x1ZGVkIHJvbGxvdmVyIHZh
cmlhYmxlDQo+IHYyIC0+IHYzOiAtIG1vdmVkIHRoZSBjYWxjdWxhdGlvbiBiZWZvcmUgdGhlIHJl
dHJ5IGxvb3ANCj4gICAgICAgICAgICAtIHNraXBwaW5nIHRoZSBjYWxjdWxhdGlvbiBpZiBiSW50
ZXJ2YWwgPiAxNA0KPiB2MyAtPiB2NDogLSB1c2VkIGRlZmluZSBmb3IgMHgzZmZmIGZyYW1lbnVt
YmVyIG1hc2sNCj4gICAgICAgICAgICAtIGFkZGVkIGxpbWl0YXRpb24gZm9yIHRoaXMgdG8gdXNi
ID4gZnVsbHNwZWVkDQo+DQo+ICAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDIyICsrKysr
KysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggNWZiNzg1MzVlZmE5YmRjLi5hMjE0NWY5MDVkNjcwNjcg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYw0KPiBAQCAtMTQ2Myw2ICsxNDYzLDcgQEAgc3RhdGljIGludCBk
d2MzX2dhZGdldF9zdGFydF9pc29jX3F1aXJrKHN0cnVjdCBkd2MzX2VwICpkZXApDQo+ICAgDQo+
ICAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X3N0YXJ0X2lzb2Moc3RydWN0IGR3YzNfZXAgKmRl
cCkNCj4gICB7DQo+ICsJY29uc3Qgc3RydWN0IHVzYl9lbmRwb2ludF9kZXNjcmlwdG9yICpkZXNj
ID0gZGVwLT5lbmRwb2ludC5kZXNjOw0KPiAgIAlzdHJ1Y3QgZHdjMyAqZHdjID0gZGVwLT5kd2M7
DQo+ICAgCWludCByZXQ7DQo+ICAgCWludCBpOw0KPiBAQCAtMTQ4MCw2ICsxNDgxLDI3IEBAIHN0
YXRpYyBpbnQgX19kd2MzX2dhZGdldF9zdGFydF9pc29jKHN0cnVjdCBkd2MzX2VwICpkZXApDQo+
ICAgCQkJcmV0dXJuIGR3YzNfZ2FkZ2V0X3N0YXJ0X2lzb2NfcXVpcmsoZGVwKTsNCj4gICAJfQ0K
PiAgIA0KPiArCWlmIChkZXNjLT5iSW50ZXJ2YWwgPD0gMTQgJiYNCj4gKwkgICAgZHdjLT5nYWRn
ZXQuc3BlZWQgPj0gVVNCX1NQRUVEX1NVUEVSKSB7DQoNCkhpZ2hzcGVlZCBpcyBzdGlsbCBhcHBs
aWNhYmxlLiBKdXN0IGlnbm9yZSBmdWxsc3BlZWQuDQoNCj4gKwkJdTMyIGZyYW1lID0gX19kd2Mz
X2dhZGdldF9nZXRfZnJhbWUoZHdjKTsNCj4gKwkJYm9vbCByb2xsb3ZlciA9IGZyYW1lIDwNCj4g
KwkJCQkoZGVwLT5mcmFtZV9udW1iZXIgJiBEV0MzX0ZSTlVNQkVSX01BU0spOw0KPiArDQo+ICsJ
CS8qDQo+ICsJCSAqIGZyYW1lX251bWJlciBpcyBzZXQgZnJvbSBYZmVyTm90UmVhZHkgYW5kIG1h
eSBiZSBhbHJlYWR5DQo+ICsJCSAqIG91dCBvZiBkYXRlLiBEU1RTIG9ubHkgcHJvdmlkZXMgdGhl
IGxvd2VyIDE0IGJpdCBvZiB0aGUNCj4gKwkJICogY3VycmVudCBmcmFtZSBudW1iZXIuIFNvIGFk
ZCB0aGUgdXBwZXIgdHdvIGJpdHMgb2YNCj4gKwkJICogZnJhbWVfbnVtYmVyIGFuZCBoYW5kbGUg
YSBwb3NzaWJsZSByb2xsb3Zlci4NCj4gKwkJICogVGhpcyB3aWxsIHByb3ZpZGUgdGhlIGNvcnJl
Y3QgZnJhbWVfbnVtYmVyIHVubGVzcyBtb3JlIHRoYW4NCj4gKwkJICogcm9sbG92ZXIgaGFzIGhh
cHBlbmVkIHNpbmNlIFhmZXJOb3RSZWFkeS4NCj4gKwkJICovDQo+ICsNCj4gKwkJZGVwLT5mcmFt
ZV9udW1iZXIgPSAoZGVwLT5mcmFtZV9udW1iZXIgJiB+RFdDM19GUk5VTUJFUl9NQVNLKSB8DQo+
ICsJCQkJICAgICBmcmFtZTsNCj4gKwkJaWYgKHJvbGxvdmVyKQ0KPiArCQkJZGVwLT5mcmFtZV9u
dW1iZXIgKz0gQklUKDE0KTsNCj4gKwl9DQo+ICsNCj4gICAJZm9yIChpID0gMDsgaSA8IERXQzNf
SVNPQ19NQVhfUkVUUklFUzsgaSsrKSB7DQo+ICAgCQlkZXAtPmZyYW1lX251bWJlciA9IERXQzNf
QUxJR05fRlJBTUUoZGVwLCBpICsgMSk7DQo+ICAgDQoNCkJSLA0KVGhpbmgNCg==
