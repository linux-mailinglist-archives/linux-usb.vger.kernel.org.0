Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 110F0166FE0
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 07:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgBUGxO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 01:53:14 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:34660 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbgBUGxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 01:53:13 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C3AC0C008C;
        Fri, 21 Feb 2020 06:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1582267993; bh=lSSoHadAux+NSyOr/UQoXR3OiTdP6h8kp/PUFr4MRgg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=X2+Qn6sfXWcV6SQue4rY1I/jXjBNtmJ3J0pTsBQzdUgsF2USll68jBKMHVY9ff6m1
         2haXq6AkRSjMRQzlRvRtTiIVGJNcIOo1hAX65x0geKhjpxszlOSuMtuhnc0+N5/V6I
         xC0etCduVHZqyKWJZrP7bxmtQJl0m73LN+/e9m23LKFxtI1KLC72C6zRCCBtEZM80k
         yNZa5noCcsLK0tDiPoODE7bKRM7M0WO4scbXYN7SgUnicL2RqX6jgA8K5za5IqyjgO
         MqgJiNq90fGLjGuU3lAHUgnDg5GemPcApzOglkykTeRWUiCpXSiH+TKYrkrVyBMSAI
         8xrH1th0rrLGg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id DD0C9A00B0;
        Fri, 21 Feb 2020 06:53:08 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 20 Feb 2020 22:52:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 20 Feb 2020 22:52:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmgsMVLeUVORATP7qngAB4YUbJH/G5A/5tH0RcsmHzDO0jdalc2F+tXt0pCALxLu89iAMmOMJwQ1ZHb1qMEU+9pyroJjliBxeEu1pk4j+Pw+ata4uNr740i3uMPPomkHGygA9aWYA7G6j8tmUgcslLZ0rsaqH8NwaKfXYwWqvRu0X3syQJxjforptGvVQWIVu7x8LH13ojVCnF5HKrX0McLTO5hdNbHNhfHeJCWyB0EtIb24ptXtdRDo+XTsjg6RkVfe6MI10ZlhWhYh3ohCUc1J4FekDtp+ErjGSKBBJuBNwwS8LPSjBUMqN2ftOFzwMnn+0S8yAhILev3d0JLN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSSoHadAux+NSyOr/UQoXR3OiTdP6h8kp/PUFr4MRgg=;
 b=EuMkkrCo788S5r2KlKkZrNd7QZjSPK40DMpq7V1kZw5rxc9EurPDIFDkHbo9Sxp9iYBF/KxB1vzOnZdupB6oddB52Af9+HqzdECIzgLbAsUr6PdMS8MJiRwcv6O3mRAg5a/Ff8v0DnC+V/qbSUOutG2Xus0Gc4rA4URSwEHuL6djND33i7hIQwi3vkQZUPayVgRZpbrjuP6VKRbjk3OPjcj11AFJaZrMh4SfyyoedSMI8zJOP0T62MBKkFDqxht1HN0C9C+dnORDUxvJpkrFdocKuUgtyffiZP5f2zugijt3wXiNdIOvQwZw7mYPQ327JOP4rGfZEVBaxoyI3FjRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSSoHadAux+NSyOr/UQoXR3OiTdP6h8kp/PUFr4MRgg=;
 b=pNVljr6+M6WR4ofbBijPC4AQVJkNwPs+b63LpoJVSVgbXQCmLrfjfjoSYzsNozF9BV+Lx5Lm3+QWURiaRnN0AMTqsIrW1gBc28HLfVqzpOATSsOo0zscam6kBP4mDKpxkdx6wTMSBxlK/yOKjCudNfstZlnF7iXaosJtvrid7ik=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.31; Fri, 21 Feb
 2020 06:52:55 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2750.021; Fri, 21 Feb 2020
 06:52:55 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
Thread-Topic: USB DWC2 stops responding when insert/remove cable multiple
 times
Thread-Index: AQHV4zxylJsWeUZ0JUKEDMOhhpCodKgfGkgAgAA7cgCAAA+HAIAAbA0AgAKn7gCAAC2+gIABCQCAgABpVgCAASdLgA==
Date:   Fri, 21 Feb 2020 06:52:55 +0000
Message-ID: <1d2ee918-57e4-53b2-6953-0107d7720c59@synopsys.com>
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
 <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
 <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com>
 <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
 <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com>
 <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
In-Reply-To: <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 76d18a43-84df-4dce-4275-08d7b69aadbc
x-ms-traffictypediagnostic: MN2PR12MB3935:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3935F14BAD4246C7C1FFC158A7120@MN2PR12MB3935.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0320B28BE1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(366004)(396003)(39850400004)(199004)(189003)(54906003)(66446008)(66556008)(71200400001)(66476007)(66946007)(2616005)(110136005)(316002)(81166006)(31686004)(8676002)(81156014)(2906002)(64756008)(8936002)(36756003)(76116006)(91956017)(478600001)(4326008)(86362001)(6506007)(53546011)(186003)(5660300002)(31696002)(6486002)(6512007)(4744005)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3935;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mb2HJ0ErJ4lhRqbqa1Y8YEuntBQF9PzSwhGvrAFpo3S3Sf5GMwuAvd+tGrgKXBrgo0fdA8nHQBw8ZteD3PxV2oM0K9rv8nIqTXVwXDk+HlKiMkNtCZBZQGviblzrkg9YeBvqTjFL0SXTM/+7PJWVmyG7EOjgJpJ0C90m7cOsPN4r9mRrN5HD1C2vG2Q3etniOaOdnkSRE/GCN4MSZGFrycjVkVONahxPqq80KXv43Rs1+ARqHqtTtHBJhDYvJU+fITorbL9sTJ8OZ8pek2dZ3BS2FUbtWxiq5UqsQ6DsOwWzIACpszW+Sw4FJtuwfgKZiMPsqH/XY8d86IJWRaOYP3bSw17ibn505CElOH1QRSU5QVC3peT9GpSCNbdMKhMafvnhXMrq0s909mIwviDja9JDOOJJH0xuweaO7D2N+ouElMRH3DxbiqpO5Rh+AQmB
x-ms-exchange-antispam-messagedata: 8QZ2qwXmxQdcyhY+aR8Zv0WjQXZrdaE4FzRVfOClpuWvHwcF3I/hNzADIq0dYHCo1ltQZcB6HBq54N51iZq5yw/erwJdvvUN72YPbls66pIUloR+x5NXgJmEPtl/hmH6ypSnmz0FgX9lITH5qIVFeQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0FA17DE08992D46951D53D1D2CFD12E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d18a43-84df-4dce-4275-08d7b69aadbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2020 06:52:55.0357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 059VbqZ9pfW2GJffxknR7sY3ieBWKBNUXfPfZBK1/n+w9y+rRMXrKRvO284qTvnbkYV7RnrJJzIWc3mlcQJ/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT3RhdmlvLA0KDQpPbiAyLzIwLzIwMjAgNToxNiBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3Rl
Og0KPiBIZWxsbyBNaW5hcywNCj4gDQo+IFRoYW5rcyBmb3IgYWxsIHlvdXIgaGVscCBvbiB0aGlz
LCAuLi4NCj4gDQo+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDM6NTkgQU0gTWluYXMgSGFydXR5
dW55YW4NCj4gPE1pbmFzLkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+Pg0KPj4g
T24gMi8xOS8yMDIwIDc6MTAgUE0sIE90YXZpbyBTYWx2YWRvciB3cm90ZToNCj4gLi4uDQo+Pj4g
V2hhdCBzZXF1ZW5jZSBkbyB5b3Ugd2FudCB1cyB0byBkbz8NCj4+DQpQbGVhc2UgcHJvdmlkZSBk
d2MyIGRlYnVnIGxvZyB3aGVuIHN0b3Agd29ya2luZyB3aXRoIGdfc2VyaWFsIGV4Y2VwdGlvbiAN
CmR1bXAgaW5zaWRlLg0KQWxzbyBwcm92aWRlIGR3YzIgbG9nIHdoZW4gaXQncyB3b3JrIHdpdGhv
dXQgaXNzdWUuDQoNCj4+IFllcy4gQ2FuIHlvdSBwcm92aWRlIGFsc28gVVNCIHRyYWNlID4NCj4g
SSBjYW4sIGhvd2V2ZXIsIGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGF0IHlvdSB3YW50IHVzIHRv
IGRvLg0KPiANCj4gU2hvdWxkIHdlIHVzZSwgb24gaG9zdCBzaWRlLCB1c2Jtb24/IG9yIGRvIHlv
dSB3YW50IHNvbWV0aGluZyBkaWZmZXJlbnQ/DQo+IA0KRG8geW91IGhhdmUgYW55IFVTQiB0cmFj
ZXIgZXF1aXBtZW50IHRvIHJlY29yZCB0cmFjZSBiZXR3ZWVuIGhvc3QgYW5kIA0KZGV2aWNlPw0K
DQpUaGFua3MsDQpNaW5hcw0K
