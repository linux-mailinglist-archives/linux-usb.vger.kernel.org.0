Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85FC1C04EC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 20:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgD3Sge (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 14:36:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39134 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726272AbgD3Sge (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 14:36:34 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A151B40701;
        Thu, 30 Apr 2020 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588271793; bh=VvUwVHf799AhRL6Y0YOgZQBEVdX80laVzta7h4ZQsSk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=EAVyW2iXo3LOj8UY6/Z1QX8EWuVBJr5gbt+zI18jMV4PZWX5RFSS3hTbLmtLGIUbI
         I52lI1fm7OObSfwQ7KwGswRyxVfDqCvjTbPCD1J+w+LVlHZrVUbsYPfH4iN64fIJhC
         s5wl6JYfyxsXsifSW2gJI7tRJOwR+TQXJpFnmxOKHCV5lFq2FS1v4Ym4WfU/sUP9yS
         xbZIuFrb8jTDhUyjEeQUxShLfCsEAwnwPwhJPsrcVbWyMUO2wJioyFV0YeWhXTBtj5
         fO/QSntaSKYFAYRMRtwTNOcLJqsEi0syJOU/0l9uxz+xHum8CQEVXIH6220aC4BnJS
         MFKeRgKa9pcRg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C2587A006E;
        Thu, 30 Apr 2020 18:36:32 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 30 Apr 2020 11:36:32 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 30 Apr 2020 11:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acIzP2CB7+k4YLB2eCSm6mnt5vJ/Os4R/4m1DVqoZF4/tCnaxWnUolyEhlIyQAbMcD/246hlpYlLqfUn4rfIzqHa5szTYUoAsKqjBq81WyPnwBVLHl8VCdLpN8+zYAUrhcEt1I3UW1KDskRjZO5Fd4s+MwKsYtKD+Oi8WKdeYFsl35hQ7qDQLuAW3NONPBQRfDNKwhSct5LYu+UPUx/CgyKLdRe4F04ZoqIO+uMEv3Dpp6dk49/Wo0WB17h3AmmXsUrCOPBBCi+bERP9SLggkWJLU6DiTTJKFqdFz+U3LXzg51HMFWGOo0M0JcGfOgcf30EIbW0xBJATj9i+QeHKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvUwVHf799AhRL6Y0YOgZQBEVdX80laVzta7h4ZQsSk=;
 b=JKmC672Xyi7o9YmE6hPhl+mKb+ZK8xRcmSvpb9rLbgs9XL21HEK/wCnryCRl02cMYrMW4VJVDnZqykGOfVQNsjiKohW3yTd0QPXrpymKKvnol1fWPtpdYqEYrEvk1JnOS9aK/E1cEvm2YtWXQ2/9xt9hq6I4lPl1mzZ9COpWMVh8XUlvz7v69IW62NYtfspiDRHYgD01zEDVzhZz9KbqKsA8LCZH4u6+zZdtIwlKFj7ZPAAf8CKieC8Qc+sUKKX1aV9a9nu+bu7O+nQZ26mXc052RzxQ8foCaqGphYvIGZWUjLfpW/DGTFCfPL+7KP1xejaJWmtxFgePPfPBD5LCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvUwVHf799AhRL6Y0YOgZQBEVdX80laVzta7h4ZQsSk=;
 b=p0xQ8gCZmuOyr0BF9sp+MGd8UyM2OW+Z+s96pIGhaQmhkkzBOqLko61FMVZi3rDvFCPCZRbaFsdNGkZpDBq/UdK5NrfBjpWol32N8oBgJWAQGXbAgwaV4epL7XWsOJJk4csqRXpHE70O0YX68sq+/ZnMjdcztWyhFMGJMJfzuok=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB2645.namprd12.prod.outlook.com (2603:10b6:a03:61::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 18:36:30 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248%7]) with mapi id 15.20.2937.028; Thu, 30 Apr 2020
 18:36:30 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Topic: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Index: AQHWHOMiP7xQ0M6cVEqSUTmaHa412aiPbxIAgAFsnwCAADGbgIAAD8YAgACejwCAADEAgIAAEjWAgAAD6oA=
Date:   Thu, 30 Apr 2020 18:36:30 +0000
Message-ID: <27d4eeca-8b6d-3b32-72d1-5a36354cda5f@synopsys.com>
References: <Pine.LNX.4.44L0.2004301419470.14026-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004301419470.14026-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac67daa2-ea4a-4e9e-8ea0-08d7ed3566a4
x-ms-traffictypediagnostic: BYAPR12MB2645:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2645D20469A2E65BFF74218AAAAA0@BYAPR12MB2645.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0389EDA07F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8b5IwY+eQLcjhv1sOsrxAQJNtQlg/Y5ubync81ql7bGYbvWPMOUxX5J8bdLnJtQvtgkb2GlXyQenWsmyhr2zTDXR6GkgUDk1jNFOp5S6wsqxl4NxdSOdyb0XE45qoSbAYth0yOvQbBPUAjMApehaXApvsLDdBZZh7CeiHtyXZuYDSTv61uRSjNF5ZyXe2I9gIbsCfZ1gZwZgZ1aEcUwDIqGUwm6tDonU4VbN4i4/NKEFGKnHwtjL7z5PdhIFB9lKlZwGdSPgTgyZNgmgJOgAqeaS6uCq9DZIjdu2u+tmNuIS3ByWoefLEjmWTN/FJXmJQ1izk+KUc90Bgi4sXlXbroKiBPCtjn8Z8rex+NPOzC5PimtyMjdQdAX6pvTj+keP2SUGMd3pipO7nn3b5cJxGoUetwHJTCVREewp3JQ3bt46X7SxHXULuy5s9c4rO2tI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(366004)(39860400002)(346002)(396003)(31696002)(6486002)(478600001)(5660300002)(86362001)(71200400001)(186003)(316002)(26005)(110136005)(6506007)(2616005)(54906003)(107886003)(36756003)(4326008)(8936002)(2906002)(8676002)(64756008)(66446008)(66556008)(76116006)(6512007)(66946007)(66476007)(31686004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 25z73HDNrVX5BkOK3el+sEuSqVay/i+qNsJHXkbmdkBkRb4nPlP6wdwh5ETVB2V9bSOzWo5tvhFbPppA0w0YBWbW5noWv7PSKPJjxLfvvU/inQQlMAhMCrM3+cIPH40UiJCjJWaFXXeUfoZoCV6O7I8D/NtZTMyKhNG2+97FsxIXaQZN974fFYKohtxjM1SZWHoRUjzZ1FKCLtU6OmDyvMpZUc8GDywoSLTzG6fl/r5SGMA34uUVnyMAsZmrd6CXFL4IVYnIhqaZ3cgAWLGSG1ZU+5X8l3VKEIBqPNmXJyK8hZC9rtVvi8Iv981ZM6Tyr4cMblJabtKBFRwCC92tIXUlRk4NGSgv7hMppQ+O8Ia0KAkPjJ43EDHhxiBOGkQXjN/BU5Zgzj7hOb7x4Rdog0xpz1wFUFeK8Q3wx8IKEy9rsMATlxsgbBhtGWZPCG/n8HwP/5hk0JZ5EqNhinxGNhD0N7usgbsAsQIXvyQ0EZLFDa77ogIVtkXIoTpVh+nuQ2ttwkGaOG34qKQfflbe1g3VqJOqgrV2UKWAjpcQjzUViJObyuhr1Na977LUSPSA/Wz60YO3L8lH0GghIIJL9EOD2cAvjGadE+rMb/potCJ0qXe/qWexI8xCAUihjdqLMI1lOxEgnI0Af9eRO3Pu1fi2kK5k21saDB7p9HQ9Mg6LeF6BPoCTUQidbs5NkQlyJcOh3NcnUH4cFKCFCh+bH/y/QT4CiV5oQQg1e9/tFEWsh30RCoBfdM6+NbQW0TPP3AJwOhqpFqZ9Sl/5wETCMLCQCNk1ouqCmeQOE9haRxI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C5FB07ED61FF44CBB1E0A83DC58BDF9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac67daa2-ea4a-4e9e-8ea0-08d7ed3566a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 18:36:30.6954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pv56HkiSmvQHAhSWXqJoKqVmzkZOCwv91L3AlGup1Rn78cfLaUuyMh+FISWVe0EF93solEJUGUIzy3Iwtg558w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2645
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWxhbiBTdGVybiB3cm90ZToNCj4gT24gVGh1LCAzMCBBcHIgMjAyMCwgVGhpbmggTmd1eWVuIHdy
b3RlOg0KPg0KPj4gSGksDQo+Pg0KPj4gQWxhbiBTdGVybiB3cm90ZToNCj4+PiBPbiBUaHUsIDMw
IEFwciAyMDIwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4NCj4+Pj4gUGV0ZXIgQ2hlbiB3cm90
ZToNCj4+Pj4+IElmICd0cmFuc2ZlciBzaXplJyBoZXJlIGlzIHNvZnR3YXJlIGNvbmNlcHQsIHdo
eSBjb250cm9sbGVyIG5lZWRzIHRvIGtub3c/IFRoZSBnZW5lcmFsDQo+Pj4+PiBjb250cm9sbGVy
IGludGVybmFsIGxvZ2ljIGRvZXNuJ3QgY2FyZSBjbGFzcyBwcm90b2NvbCwgaXQgb25seSBjYXJl
cyBUUkIgY2hhaW4gc29mdHdhcmUgcHJlcGFyZXMuDQo+Pj4+IFdoaWxlIHNvbWUgY29udHJvbGxl
cnMgZG9uJ3QgaGF2ZSB0aGUgY29uY2VwdCBvZiB0aGlzLCBEV0NfdXNiM3ggZG9lcy4NCj4+Pj4g
SXQgaGFzIGEgbm90aW9uIG9mIHN0YXJ0aW5nIGFuZCBlbmRpbmcgYSB0cmFuc2Zlci4gV2hpbGUg
YSB0cmFuc2ZlciBpcw0KPj4+PiBzdGFydGVkLCB0aGUgZW5kcG9pbnQgdXNlcyBhIHJlc291cmNl
LiBJdCByZWxlYXNlcyB0aGF0IHJlc291cmNlIHdoZW4NCj4+Pj4gdGhlIHRyYW5zZmVyIGNvbXBs
ZXRlcy4gU28gZmFyLCBkd2MzIGltcGxlbWVudGVkIGluIHN1Y2ggYSB3YXkgdGhhdCBidWxrDQo+
Pj4+IHRyYW5zZmVycyBhcmUgYWx3YXlzIGluLXByb2dyZXNzIGFuZCBkb24ndCBjb21wbGV0ZS4g
VGhhdCdzIGZpbmUgc28gZmFyLA0KPj4+PiBidXQgaXQncyBub3QgdGhlIGNhc2Ugd2l0aCBzdHJl
YW1zLg0KPj4+IFRoaXMgaXMgcGVjdWxpYXIuICBJIGhhdmVuJ3QgaGVhcmQgb2YgYW55IG90aGVy
IGNvbnRyb2xsZXIgZG9pbmcgdGhpcy4NCj4+Pg0KPj4+IFdoYXQgZG9lcyB0aGUgY29udHJvbGxl
ciB1c2UgdGhpcyByZXNvdXJjZSBmb3I/ICBXb3VsZCBhbnl0aGluZyBnbw0KPj4+IHdyb25nIGlm
IHlvdSB0b2xkIHRoZSBjb250cm9sbGVyIHRoYXQgZWFjaCB0cmFuc2ZlciB3YXMgYSBzaW5nbGUN
Cj4+PiB1c2JfcmVxdWVzdD8NCj4+IEl0J3Mgbm8gcHJvYmxlbS4gRWFjaCB0cmFuc2ZlciBjYW4g
YmUgYSBzaW5nbGUgcmVxdWVzdC4gSnVzdCBzZXQgdGhlDQo+PiByZXF1ZXN0LT5pc19sYXN0LiAo
UmVmZXIgdG8gW3BhdGNoIDIvNV0gZm9yIGZfdGNtKS4NCj4+DQo+PiBUaGUgaXNzdWUgaGVyZSBp
cyB0aGF0IHRoZSBjb250cm9sbGVyIG5lZWRzIHRvIGtub3cgd2hlbiBhIHN0cmVhbQ0KPj4gY29t
cGxldGVzIHNvIGl0IGNhbiBzdGFydCBvbiBhIGRpZmZlcmVudCBzdHJlYW0uIEluIHRoZSBjb250
cm9sbGVyDQo+IFdoeSBkb2VzIGl0IG5lZWQgdG8ga25vdyB0aGlzPyAgV2h5IGNhbid0IGl0IHN0
YXJ0IG9uIGEgZGlmZmVyZW50DQo+IHN0cmVhbSBhdCBhbnkgdGltZT8NCg0KQnkgZGVzaWduLCB3
aGVuZXZlciB0aGUgY29udHJvbGxlciBuZWVkcyB0byBzdGFydCBvbiBhIGRpZmZlcmVudCBzdHJl
YW0sIA0KaXQgd2lsbCBpc3N1ZSBhIFNUQVJUX1RSQU5TRkVSIGNvbW1hbmQgYWxvbmcgd2l0aCBh
IHN0cmVhbSBJRC4gSXQgY2Fubm90IA0KaXNzdWUgU1RBUlRfVFJBTlNGRVIgY29tbWFuZCBhZ2Fp
biB1bnRpbCB0aGUgcHJldmlvdXMgdHJhbnNmZXIgY29tcGxldGVzIA0Kb3IgZW5kZWQuDQoNCj4N
Cj4+IGRyaXZlciwgdGhpcyBpcyBkb25lIGJ5IHNldHRpbmcgYSBjZXJ0YWluIGNvbnRyb2wgYml0
IGluIHRoZSBUUkINCj4+IGluZGljYXRpbmcgdGhlIGxhc3QgVFJCIG9mIGEgdHJhbnNmZXIuIFRo
aXMga25vd2xlZGdlIGNhbiBvbmx5IGNvbWUgZnJvbQ0KPj4gdGhlIGZ1bmN0aW9uIGRyaXZlciwg
d2hpY2ggaXMgd2h5IHdlIG5lZWQgdGhpcyAiaXNfbGFzdCIgZmllbGQuDQo+IFdoYXQncyB3cm9u
ZyB3aXRoIGp1c3QgYXNzdW1pbmcgX2V2ZXJ5XyB1c2JfcmVxdWVzdCBpcyB0aGUgbGFzdCBvbmUg
b2YNCj4gaXRzIHRyYW5zZmVyPyAgVGhlbiB5b3Ugd291bGRuJ3QgaGF2ZSB0byBhZGQgYSBuZXcg
ZmxhZyBvciBjaGFuZ2UgdGhlDQo+IGV4aXN0aW5nIGZ1bmN0aW9uIGRyaXZlcnMuDQoNClRoYXQg
d2lsbCBhZmZlY3QgcGVyZm9ybWFuY2UuIFRoZSBkcml2ZXIgd2lsbCB0aGVuIG5lZWQgdG8gc2Vy
dmljZSANCm11bHRpcGxlIGludGVycnVwdHMgYW5kIHJlc3RhcnQgdGhlIHRyYW5zZmVyIG11bHRp
cGxlIHRpbWVzLg0KDQpCUiwNClRoaW5oDQo=
