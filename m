Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC7BCAFCEC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 14:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbfIKMju (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 08:39:50 -0400
Received: from mail-eopbgr770085.outbound.protection.outlook.com ([40.107.77.85]:39426
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727782AbfIKMjt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Sep 2019 08:39:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkizU7AuQcQSX3xZPejdf5AL2MGzZCveRtQou51NZiUV4xtcIHZFkTKjPWDxmEtmlKmlMPrQw6vxFjic9Y9m+LsKGSRhdoIukUAUC6u0JMYPsdpMqzWwmvs9MOyOg+gbMlWjszFXwA0Ysx82nvYcFkoBckMf+qsvkDPMpPyqjwqDHrS0cAQPyaT8cdxPl+s2gMKy4ulbb5QXcZK3lA95uersz3Nd606n2h5W1k/o+xP6q/nHTfWWX1d3bN2PnVWmAqP37CPnps7ZOTwnzdvQKQZwItS0k30Lu0yGqc6Nfdpf748Vlb8brqPUwglyAFNWfkKgtEM+ZQiIA9eNZgYLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+lIYOpNoaup5cXpxoOQA+nRtipCCprJBFsqHw/1jEU=;
 b=G1080eiqUmyt05ZwIjxjzkJJx6wyO1i5d908ajKsTFhJvLBEwrK+wbnWFBEugrXh1amSZZia13vvxWTqj9VgCMLjq8QpZL/Zg5ANNtZFDeJ9l1GRFmiaLpnFJBbRQtb/BUZGpRv+jp3yJ8O0WGSOiF4pdXfDR2/g51E7i/blAHWzSVv24tA41Bj3JSrNXH9ZJgPu06q1kgg8vigi2fX9m+oV7yXEX6TDQthdkX+j+I8KpJWJaLcoANCvotIvAnvkXyiKLFHrO7AZLIG7TsjFcmCXOiaZGNvx8UeUPSCw4b4i4hgayQ89rI7ahby3HcN6/2xJp7jGlA/u5Hg2NEEp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+lIYOpNoaup5cXpxoOQA+nRtipCCprJBFsqHw/1jEU=;
 b=fzjie916DL+nqXF/o3uwRqMhUpyFMpIb1X8I5/srUc9nJoeousmbdFubQbsnqDPqJxfuCKBT7ph99VyD4yCwjtsfy977+mu/t1wwxBnUWiBk3HXfURJX799EkLzALUENjGVhquQz1COQ7RZt8azYgxU3GWMkfOO4iaEgzYqnbyU=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.77.152) by
 BN8PR10MB3475.namprd10.prod.outlook.com (20.179.78.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 11 Sep 2019 12:39:47 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::e0e3:696d:ad87:592]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::e0e3:696d:ad87:592%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 12:39:47 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: ttyACM and BREAK chars ?
Thread-Topic: ttyACM and BREAK chars ?
Thread-Index: AQHVaJ3+9xKYLNcbx0KMaPN/wPJq3Q==
Date:   Wed, 11 Sep 2019 12:39:47 +0000
Message-ID: <f7e55901a096024af2d77ae7838df3b658f2c28d.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 218f85d3-02d8-45b4-9738-08d736b52164
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN8PR10MB3475;
x-ms-traffictypediagnostic: BN8PR10MB3475:
x-microsoft-antispam-prvs: <BN8PR10MB347513E4107E8913EFED70FEF4B10@BN8PR10MB3475.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(189003)(199004)(53936002)(2501003)(2906002)(6116002)(305945005)(2351001)(3480700005)(14454004)(558084003)(7736002)(71200400001)(71190400001)(3846002)(66066001)(476003)(118296001)(486006)(2616005)(81166006)(81156014)(8676002)(256004)(186003)(26005)(6916009)(25786009)(102836004)(316002)(6506007)(5660300002)(6512007)(66446008)(64756008)(66556008)(66476007)(6436002)(66946007)(6486002)(76116006)(91956017)(99286004)(8936002)(478600001)(36756003)(5640700003)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR10MB3475;H:BN8PR10MB3540.namprd10.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Zh/mv5cPRhOpgB/lFBunCpB8Bl00NQr5AqoD/bZsXhuZQD0iENzNTt0O+/pb2+vB6Hc90+SHnwMMKow2H7w9A2mNHKCWmo6JLu0B/0Owd1gBedLKlnMzPjuntg+VwZg63Qe/z2l6s7PIrcAAa+YbjWXBKjim2JPOwa4YcGPew8wswxV++0K63ehN/ngb9VeUDAyFlkQPbsei15TIHNGYlRvEoO1IK7YyIAOOUEN5y9VouDTzoJa1zFXnsI0zD19089gXD6Sk8g9zyKx5cYD7WP30hnCgtQhGlDzKdmGUKOSh7tG+9ckv9DttfujnXQ4deNmy6osrnmHca5oBCV+TvPsu6zL3aeSz5jGbh3HbKv8qaUVFag25KvNQXon3vhSeY/qdfrVhguBfAFTkKrILcNJOSHHMbJLZZ20etablg/M=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B60B53673D0D3A46B66B00E6AEEA4BFB@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218f85d3-02d8-45b4-9738-08d736b52164
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 12:39:47.2555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zy8hFBdzD2SBWMINRHlhW+azOVrtXEggjV/jg2Uu7wEBCpMhoSUujLOJBJyUGEhMu6MJJWmvHy0SiX+44hHSyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3475
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RXZlcnkgbm93IGFuZCB0aGVuIG15IHR0eUFDTTAgaGFuZ3MgdXAgb3Igc2VuZHMgYSBCUkVBSyBj
aGFyIHRvIG15IGRldmljZS4NCkkgYW0gdHJ5aW5nIHRvIG1ha2UgdHR5QUNNIGlnbm9yZSBpbmNv
bWluZyhvdmVyIFVTQikgYW5kIG5vdCBlbWl0DQphbnkgQlJFQUsgYXV0b21hdGljYWxseSB1c2lu
ZyB0ZXJtaW9zIChJR05fQlJLKSBidXQgdGhhdCBkb2VzIG5vdCBtYWtlIGEgZGlmZmVyZW5jZS4N
Cg0KSXMgQlJFQUsgaGFuZGxpbmcgdW5pbXBsLiBpbiB0dHlBQ00gPw0KaWYgc28sIGNvdWxkIGl0
IGJlIGFkZGVkID8NCg0KICBKb2NrZSAgDQo=
