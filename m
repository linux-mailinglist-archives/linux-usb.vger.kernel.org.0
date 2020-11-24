Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00D72C1E45
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 07:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgKXGb4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 01:31:56 -0500
Received: from mail-co1nam11on2075.outbound.protection.outlook.com ([40.107.220.75]:13888
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729737AbgKXGbz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 01:31:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRkZu0sOj8uolmY7UUlu5GfxldD/ELOVl+yO3V3ICyltr69bvwF0uJcH2tHy26QZGCtV8djzL7weSa0fDkkDxj8+DY6HuHdcEhNH7mlEb7AP23iH4ULbbSOnfYJxXikl5YdBJDXaUoLyVYBIpd10YEGxt/iWYDymNwyBdU2Tpi++lpZ2yjnHiSAy9CK28g9CB8O2zP5789iUg2TI03KFscRRXCeJ195ok4iX7fL89KLH4PsdEuWWy7ytbq8yY4G4Br/h19p3dkb3xxXgFHleVPadJXlJMXQ6x/HyXGSV5wQ1IajijwSuCNHzo42ptOmp7qYd1omNewWxDKjaTGzdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMuMO3xe4xYdrvEKeUz9f3u9K0vEyxFj+mUqUbfH7rs=;
 b=Ik8qBzOe+mTKzm7zbqCFZGQ2Hyrhgog2JyVv2eG1zTPv5COJXdnTEYbi/b5iusmlBNhfGb8xts511yFJSk9t5tWtVDvzcjJRFGYI4EKlk9BueANzZ9cekvZy4zqDCvkKJoDf70eF2GkkjbYeEglP443yP+dYfmJPH77kovatfYhgn6WudyTMNeUBgJSc1hENqzPUanj7gCoafXL7MzQK0MR/gupID2uWp2h8p0hcYgnnSd0Ibg70arLDXVz8CpnQ1PduObLWpJ9Zw5rzETrvTqKcSoVV4Z9Dj/LzSrCQcMnAc5EW8QJNLdGXAo57gPl3IOC+AVT1A8ouAVAOcUaPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMuMO3xe4xYdrvEKeUz9f3u9K0vEyxFj+mUqUbfH7rs=;
 b=jHjWn93bh+dQUMG02ZnSsBPO+0xfEWpIK+UOXIzfMU/dOlRzCO1Myq7K20haMfKLBvMxhotNYqktpWq0L3JOag4Dxud/IAxr67IjNSZw4L99+BcGmFGe8BOsFInGTrKgoPpAzzoPWdtlUCJ2gIskInj/RGAfcQ4NJ3FAwu7GySg=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3477.namprd11.prod.outlook.com (2603:10b6:a03:7c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 06:31:53 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006%5]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 06:31:52 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jkosina@suse.cz" <jkosina@suse.cz>
CC:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBISUQ6IHVzYmhpZDogZml4IG1lbWxlYWsgZm9yIGN0?=
 =?gb2312?Q?rl_or_out_raw=5Freport?=
Thread-Topic: [PATCH] HID: usbhid: fix memleak for ctrl or out raw_report
Thread-Index: AQHWvKVb+6zCNIfmoUym0BkOkTiTvKnW3PnQ
Date:   Tue, 24 Nov 2020 06:31:52 +0000
Message-ID: <BYAPR11MB2632FAF1DA3F5EB27A53CF80FFFB0@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20201117054851.557-1-qiang.zhang@windriver.com>
In-Reply-To: <20201117054851.557-1-qiang.zhang@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94125ed1-6743-41a1-5d70-08d89042a1ce
x-ms-traffictypediagnostic: BYAPR11MB3477:
x-microsoft-antispam-prvs: <BYAPR11MB3477ED2FE9B8E1A78EB89E2AFFFB0@BYAPR11MB3477.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7BP3/OImsHxXN6i49IehLBMgJg+Cc1FXWr1dbf7EXicaC9brIU8O7dDxGxL9vvxcgqzWk2/2dXB0qyHVDbQ04/7whh2Ehv5nRu3HpK1nlloxLwR4pGBgQHVFC06qGyRl1uL8s5TqFjXufwEQc8lxpPLRbpKu9SoyUr70Ixcq1clZibnJfb/T56CSBKW9dtC0wqEBdW7K86MOR/Q7T6K2lHSADXFBWa1DVX9KFgqLjPUb+TA96Bf974dDRJxBH/gCsUIAlthKXn4kCL/JWCe2LMemrhv2dxRR078weneSQSOk7PN5IFYeYFCLst3tIy9JQy0RNHHBBUv4cjN9cSzMnQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(52536014)(186003)(33656002)(2906002)(9686003)(55016002)(224303003)(6506007)(64756008)(66476007)(66556008)(66946007)(76116006)(4326008)(91956017)(5660300002)(54906003)(26005)(110136005)(316002)(8936002)(478600001)(7696005)(86362001)(66446008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: a6xf8EG6kWwrhvhQeX/X/VW5TVZcgIQqz4mcWz8cb9JeOREfw4wRqBaNfjqjBoTfUIZ1YpFI5WsIPVwkpBB+JkbUTr0yuXSOh9vNG/IupVTuTBQxrgMd1KvEJw6ntVJ56Wk9Cl5puM0yhPUVGv6QHaEqlknv6R/jUrSJ8r/o9zvptnFwd94vCKuVkJ91UzNeLVjYXlYRxDQ4XJfLxZjatgfxtw6PkHzvUZCTCjsf81vbPtaVPBYvcNWBZqlxWsPt9A/q7XxaPJJaenkum84lAGKbcdc+/hIO24HuRiz4T7kDO7kfLW8Sq05ZOx6FhZMCFCkVluDUvC1S1+G7SVxE6zFKB9RPW5t/L7lc6DSJj+Q3lxbLMjTHTL3h5X9VxLSplutJAWi641CiD8VsKLcilvBiYE0arxKvZ9L/8MyZX2Wa2RlT49ZZHBA/KFvulOcCBNX8sde2XJG4kMWB5FNqy13JDM01F7pZmycYkVj83P06i2vS92z7XB9doySfTI2N89/ulD7s+sebSCz/o4fcVoD4nwvXQl45JFN0yMEFTQG3a6+h/RzmW4febRvzuYpO7psa8umwa/og3aRYbByn5B5xince8vB5dk1rnDytSg4fbzix3xRBJ6vwUitrwY3vEI2Zji+ibFk4ogKtZz+zI1rLEGAKwM64/bE6kOkeoiRC/NnEBNeBRH6V6ocKoQmAtCzz0OOD8F8UQbYFQt1/CMiEarKPlGTQzJtHE7yKnJxDbdaYEgSKW2+wMbVx79T9/OIrmVZFUCJJQmYcJg7NVvPzDZIrCPpr9vGyu8xu49kdgFnkx7kE7HkNHvVu0q1JMuyQwGSyr+2AYWXQf3j/rannNzaZWsnhEoxWBr2HgRHoJ+yKyTTu6Ob53CFPVFmXm7iT07g61t+tIxbHSaSeXA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94125ed1-6743-41a1-5d70-08d89042a1ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 06:31:52.8873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6RNR7XmroZHvDQVkMdAZULAaN3X9zVrjmwkciqZpmOGu9DpuuOHviZgUK+BquZaGiiINbsWsnKWEkWcDVvrAmCAsfcgBmK8aHaPNc/AFE18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3477
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogWmhhbmcs
IFFpYW5nIDxxaWFuZy56aGFuZ0B3aW5kcml2ZXIuY29tPgq3osvNyrG85DogMjAyMMTqMTHUwjE3
yNUgMTM6NDkKytW8/sjLOiBqaWtvc0BrZXJuZWwub3JnOyBiZW5qYW1pbi50aXNzb2lyZXNAcmVk
aGF0LmNvbQqzrcvNOiBzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1OyBsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnCtb3zOI6IFtQQVRDSF0gSElEOiB1c2JoaWQ6IGZpeCBtZW1sZWFrIGZvciBjdHJs
IG9yIG91dCByYXdfcmVwb3J0CgpGcm9tOiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5j
b20+CgpXaGVuIHRoZSB1c2IgZGV2aWNlIGRpc2Nvbm5lY3QsIHVzYmhpZF9zdG9wIGZ1bmN0aW9u
IGJlIGNhbGxlZCwKaWYgY3RybCBvciBvdXQncyByYXdfcmVwb3J0IGV4aXN0cywgbmVlZCB0byBi
ZSBmcmVlLgoKU2lnbmVkLW9mZi1ieTogWnFpYW5nIDxxaWFuZy56aGFuZ0B3aW5kcml2ZXIuY29t
PgotLS0KIGRyaXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5jIHwgOCArKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL3VzYmhp
ZC9oaWQtY29yZS5jIGIvZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3JlLmMKaW5kZXggMTdhMjll
ZTBhYzZjLi5mOGE0OWY4ZDQwMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaGlkL3VzYmhpZC9oaWQt
Y29yZS5jCisrKyBiL2RyaXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5jCkBAIC0xMjA5LDYgKzEy
MDksNyBAQCBzdGF0aWMgaW50IHVzYmhpZF9zdGFydChzdHJ1Y3QgaGlkX2RldmljZSAqaGlkKQog
c3RhdGljIHZvaWQgdXNiaGlkX3N0b3Aoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCkKIHsKICAgICAg
ICBzdHJ1Y3QgdXNiaGlkX2RldmljZSAqdXNiaGlkID0gaGlkLT5kcml2ZXJfZGF0YTsKKyAgICAg
ICBpbnQgaW5kZXg7CgogICAgICAgIGlmIChXQVJOX09OKCF1c2JoaWQpKQogICAgICAgICAgICAg
ICAgcmV0dXJuOwpAQCAtMTIzMiw2ICsxMjMzLDEzIEBAIHN0YXRpYyB2b2lkIHVzYmhpZF9zdG9w
KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQpCgogICAgICAgIGhpZC0+Y2xhaW1lZCA9IDA7CgorICAg
ICAgIGZvciAoaW5kZXggPSAwOyBpbmRleCA8IEhJRF9DT05UUk9MX0ZJRk9fU0laRTsgaW5kZXgr
KykgeworICAgICAgICAgICAgICAgaWYgKHVzYmhpZC0+Y3RybFtpbmRleF0ucmF3X3JlcG9ydCkK
KyAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUodXNiaGlkLT5jdHJsW2luZGV4XS5yYXdfcmVw
b3J0KTsKKyAgICAgICAgICAgICAgIGlmICh1c2JoaWQtPm91dFtpbmRleF0ucmF3X3JlcG9ydCkK
KyAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUodXNiaGlkLT5vdXRbaW5kZXhdLnJhd19yZXBv
cnQpOworICAgICAgIH0KKwogICAgICAgIHVzYl9mcmVlX3VyYih1c2JoaWQtPnVyYmluKTsKICAg
ICAgICB1c2JfZnJlZV91cmIodXNiaGlkLT51cmJjdHJsKTsKICAgICAgICB1c2JfZnJlZV91cmIo
dXNiaGlkLT51cmJvdXQpOwotLQoyLjE3LjEKCg==
