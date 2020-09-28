Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476E327A791
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 08:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgI1Gbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 02:31:35 -0400
Received: from mail-dm6nam10on2048.outbound.protection.outlook.com ([40.107.93.48]:21806
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725294AbgI1Gbe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 02:31:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+O/JxkaZOhAD3iENwelUyybG6gtt8HuejIws7rh/aA8qAVMj6XE9KMaZF7japM1tnYmG6SkUlaS9Z9sismJqIcQ08wozVNeL07yG521q2lOlf8IHbl2u0yC2QAFD+/rhmvljX0O6Pu7O/ZiRavZfXm41PcoiT22+D0+szqt0dTn8mSMmnRnXLnBUkzUvmaUZI4HN+4fQGpvBFE97Bj7trA6prkBY8c179van3VFRwDEuLyuW+QYjRrFq1dJzreoIy/K8BvsUcm+Fir2bWIT1mJNVCBL9erAN99+LaUOEutJ5eAMlYgiQJCsF9K8EaMKBsF/rWI97RGxKF/2cfDFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9Soktc2GTe8VjNV3tBalyMvVn+pQU7Dt5Sz7px4Z48=;
 b=VnPTvKwbB0QEDnbYYxIyEy0LduFeUGf/uLE956rJbECCoNexBeWQE7Nw/J/XeAEqkSr9+9iWOK+E7/z0WtBUHjkiBuKA1tQFs/2R/8QTOgPazvn+XJ+wO+zgf01GTFBpjKTWchMP8w6kz+3xKMu37910NtZKHMiRuET2NqXCfFMy3H/Np+7f2ruA9CKSmQiWSurr+KCgpsiTj4/ZA8dxYjRivM3B5EUHIXPaoiSqVCX5cC8t8/oqAkRRbnDrDg3OOxhS6hDzspKH+jc3zdh+bPLxs58FuSxtPB+RSFmB+04G2yU5YFRjQ7CWGb+u7Lznwtbh4QHu53g+Pjr09EWieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9Soktc2GTe8VjNV3tBalyMvVn+pQU7Dt5Sz7px4Z48=;
 b=cnqxU0xy6XxQFEyYW0Zi7SF9u3iPl1iQGslmqp1p6x9GHTvR4XgFHIUJeN1IqdPSLLHtu9kroIc78t8Khwc60yQCeB6cCeYlwLg1CK5ygxAkw56NM3IKQ227Q9Tvon+Yhmnh/qHtJviJxZe3c9iYfkurkuxHPmSDgcNCdgcYR/0=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3608.namprd11.prod.outlook.com (2603:10b6:a03:b1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Mon, 28 Sep
 2020 06:31:29 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::80e9:e002:eeff:4d05]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::80e9:e002:eeff:4d05%3]) with mapi id 15.20.3412.026; Mon, 28 Sep 2020
 06:31:29 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSB1c2I6IGdhZGdldDogdXZjOiBGaXggdGhlIHdyb25n?=
 =?gb2312?B?IHY0bDJfZGV2aWNlX3VucmVnaXN0ZXIgY2FsbA==?=
Thread-Topic: [PATCH] usb: gadget: uvc: Fix the wrong v4l2_device_unregister
 call
Thread-Index: AQHWlKWu3YJEctMoJUayx7IudV3JTKl9mI5Y
Date:   Mon, 28 Sep 2020 06:31:28 +0000
Message-ID: <BYAPR11MB26322AE0FCD63AEB467D3AE3FF350@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20200927080116.24763-1-qiang.zhang@windriver.com>
In-Reply-To: <20200927080116.24763-1-qiang.zhang@windriver.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3319e8d-ac20-49e7-94f3-08d863782204
x-ms-traffictypediagnostic: BYAPR11MB3608:
x-microsoft-antispam-prvs: <BYAPR11MB36081DD30C44A3A43C5755ECFF350@BYAPR11MB3608.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qk8nhhzLssS6dO+u+SjVbXOttOg13OWrKxCBDN4GGwf/bexVYFeu32Q9nUhYf31zqlKT7zPKKhy6/gJQfD3HnAqQUOclhfEWqoyN13UZA4Gk0ATAq7NgogVr4YowmZs3lex5ktrAXlPFP2vjwwc3QLbRxY1BuMx6vCSu3WhNCB92dYVHM8vTDwn8NurIZS0TszBcURCkkinR9Z2sjSr0MA8J6iyle7fWiClWjRk/ckjp5h+aVDBOtC4vend5k3JcA3CHIN6xDI+6nLBe65XiEJbi/Tn2m+IMvWf/FCM0W+2m3jI1hNrDdCQOtu98pm+5T4TlLYvatCw4cNlPDswWr/R8eotCkiHoJpAzhMVx37fpTR4M+V8A/E2ilAiVmUjU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(136003)(396003)(346002)(366004)(2906002)(76116006)(91956017)(186003)(110136005)(52536014)(66946007)(6506007)(26005)(8936002)(7696005)(224303003)(83380400001)(9686003)(55016002)(316002)(33656002)(86362001)(71200400001)(66556008)(66476007)(64756008)(4326008)(66446008)(5660300002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: lDa4tWWk1lzoulcwdXp8QF806RgM0jbYT0gnnXtE5Mp6ffV4zuO7GZz7QF1uef28Hcu4Yy/ciHDw1+NnAxp/3JefFVo2ekXoJZS+VtS6tbBV/S3h1P15aG9MCqZtgevPy9pxjmUo3HQ/2MHCxNEjtOjV02pIkHldVJ1NFEv+vlcL3pa36K06g5JLfQwnbHcJaJm/KrCJM/koyhehRlthgY14PNnHaQ1QdAnyz5muTgCq53Wp6VBQbtpIDoDxl/9NTQav76ASo+VdJd4Co2jPzkR6Xzg2dbEbhxK+Pli8c4RrpcpeM3TpSNstJnE9Tnzx78EC+JUATKSzT2zXlWCr8rOue+JNsrbqjZC+ehFboEAKWpFcWqqxZksP2w35sqDFdrQl5uPI6JncHSLVMZ+q6KE6vtrlvYHnsezP4/Awknc0SWS4S+QusvrU1cQvzlA9KWpkh0izENhvklxf7fZyQr+hXu8wFHV6rHxcJnzlnVRpCchebIvLCxeAlDcW8UVcwvuu4CkmgTJjGz2o5uECFVmxlLoiaDCkAgWaXByEgw+OEY7Ts5n4dmWpI1sXbILgKmXdVYsM/f6TZPhBLYhIwjtW4hN4J8TIcAHLfAym0PMV2a+9nIADq+v3n3W6zMvWR+1dpdRv3GsHY0xwX+Mk5A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3319e8d-ac20-49e7-94f3-08d863782204
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 06:31:28.9616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+2MN8r6zdbF0C+YT7EjIk1FeFCPulcgpbxnTzWOHi2/K53fzVD9DnVEvWk5v7Zf2CMPX1Vp0kjndHlC1ec7HBh/8zNk5hSLGjsa3FALw/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3608
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Q2M6IEFsYW4gU3Rlcm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
t6K8/sjLOiBxaWFuZy56aGFuZ0B3aW5kcml2ZXIuY29tIDxxaWFuZy56aGFuZ0B3aW5kcml2ZXIu
Y29tPgq3osvNyrG85DogMjAyMMTqOdTCMjfI1SAxNjowMQrK1bz+yMs6IGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbTsgYmFsYmlAa2VybmVsLm9yZzsgZ3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmcKs63LzTogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZwrW98ziOiBbUEFUQ0hdIHVz
YjogZ2FkZ2V0OiB1dmM6IEZpeCB0aGUgd3JvbmcgdjRsMl9kZXZpY2VfdW5yZWdpc3RlciBjYWxs
CgpGcm9tOiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+CgpJZiBhbiBlcnJvciBv
Y2N1cnJlZCBiZWZvcmUgY2FsbGluZyB0aGUgJ3Y0bDJfZGV2aWNlX3JlZ2lzdGVyJyBmdW5jLAph
bmQgdGhlbiBnb3RvIGVycm9yLCBidXQgbm8gbmVlZCB0byBjYWxsICd2NGwyX2RldmljZV91bnJl
Z2lzdGVyJwpmdW5jLgoKU2lnbmVkLW9mZi1ieTogWnFpYW5nIDxxaWFuZy56aGFuZ0B3aW5kcml2
ZXIuY29tPgotLS0KIGRyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi9mX3V2Yy5jIHwgOCArKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl91dmMuYyBiL2RyaXZlcnMv
dXNiL2dhZGdldC9mdW5jdGlvbi9mX3V2Yy5jCmluZGV4IDBiOTcxMjYxNjQ1NS4uNDRiNDM1MmEy
Njc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl91dmMuYworKysg
Yi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl91dmMuYwpAQCAtNzQwLDIwICs3NDAsMjAg
QEAgdXZjX2Z1bmN0aW9uX2JpbmQoc3RydWN0IHVzYl9jb25maWd1cmF0aW9uICpjLCBzdHJ1Y3Qg
dXNiX2Z1bmN0aW9uICpmKQogICAgICAgIC8qIEluaXRpYWxpc2UgdmlkZW8uICovCiAgICAgICAg
cmV0ID0gdXZjZ192aWRlb19pbml0KCZ1dmMtPnZpZGVvLCB1dmMpOwogICAgICAgIGlmIChyZXQg
PCAwKQotICAgICAgICAgICAgICAgZ290byBlcnJvcjsKKyAgICAgICAgICAgICAgIGdvdG8gdjRs
Ml9lcnJvcjsKCiAgICAgICAgLyogUmVnaXN0ZXIgYSBWNEwyIGRldmljZS4gKi8KICAgICAgICBy
ZXQgPSB1dmNfcmVnaXN0ZXJfdmlkZW8odXZjKTsKICAgICAgICBpZiAocmV0IDwgMCkgewogICAg
ICAgICAgICAgICAgdXZjZ19lcnIoZiwgImZhaWxlZCB0byByZWdpc3RlciB2aWRlbyBkZXZpY2Vc
biIpOwotICAgICAgICAgICAgICAgZ290byBlcnJvcjsKKyAgICAgICAgICAgICAgIGdvdG8gdjRs
Ml9lcnJvcjsKICAgICAgICB9CgogICAgICAgIHJldHVybiAwOwoKLWVycm9yOgordjRsMl9lcnJv
cjoKICAgICAgICB2NGwyX2RldmljZV91bnJlZ2lzdGVyKCZ1dmMtPnY0bDJfZGV2KTsKLQorZXJy
b3I6CiAgICAgICAgaWYgKHV2Yy0+Y29udHJvbF9yZXEpCiAgICAgICAgICAgICAgICB1c2JfZXBf
ZnJlZV9yZXF1ZXN0KGNkZXYtPmdhZGdldC0+ZXAwLCB1dmMtPmNvbnRyb2xfcmVxKTsKICAgICAg
ICBrZnJlZSh1dmMtPmNvbnRyb2xfYnVmKTsKLS0KMi4xNy4xCgo=
