Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A53A1E199A
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 04:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388563AbgEZCkE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 22:40:04 -0400
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:1581
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388428AbgEZCkD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 22:40:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEUbQp2hgADuduVgobFgketZwaS0/S3CDGM0KXov5ugdGlDNTBJbrDj0CWV0l6k671AoGa9oErIiwiLyp6Ktd48gSt6kFawCfLT3Eu8jLfZLZ/i2hghQrUZhwKDiNWaMdHRdh7AQ4Cao3qHnkzLgzCEqDdYxf4qkZzemEL/zGswMizKd1rcn9qixMPztTd7eciQcOScAqTFhHncw6TORd02axE8+oeMfncadtNW25QO3fuObN2vStMRHsjd8LyX0dERHfA+cUc+Si/whlfaMiYHnlX238Z/XGai9uJtR8IQwQM8wnULnzb7OdlEHi+glmwlvNevwFOMj0jUQw0sojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+wyT9IBokjYkS5uUs0z7kNU/lnMA+Vx0LM/mFZA4Mo=;
 b=GQDWKT3bRq3rNeg9E+6E07XaqaWq9FfuJJ6KR4qOGOO6stlsb4wry7D7Gajun3XS8EmLUe/FvZWurdG6CneLKLzVQlPG1YuYtQd3/pyEvDmhdF0ShMxv4iuhHnPkNCCzow53jPxgL9C5iyXSPgJJrVjG7dM0SOTOSjpaOdHMQ2EQwoGZVZUy9XrGGKQ9DmjKTNbk972nizj67jmLZvOpqcpFdvl5WvbQW+AsqlcY9XFF2J5Whfw9AIju64w1wtZk7zsizOl9DleNmXUa4FFvJgB8PO3l2hqbyvxzDg5UfXRoLoELJ9xJoflxspRz8H8Oz/mXoHLVpU7e7KNvzrv/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+wyT9IBokjYkS5uUs0z7kNU/lnMA+Vx0LM/mFZA4Mo=;
 b=Tpqz3jgSgCTgEbx3ZOQmMOYSsBxRRSxBG/BCOaZN3sGqNrguDPIwuG/BM9yi+KAduYP/NVrSNntfjYkAV2V7KJcl1FTXu6i8sQyFO6O/z8gZGkcj1nXhQb5O4uz9ckfGojcob5WPEz5OQA62MUce7OgohTG1GMaZea7fQiOzSr4=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7110.eurprd04.prod.outlook.com (2603:10a6:20b:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Tue, 26 May
 2020 02:39:59 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 02:39:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: chipidea: changes for v5.8-rc1
Thread-Topic: [GIT PULL] usb: chipidea: changes for v5.8-rc1
Thread-Index: AQHWMwbyltU6ttscfkmZTSSibxHh6A==
Date:   Tue, 26 May 2020 02:39:59 +0000
Message-ID: <20200526024024.GC27933@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ca18c06-ec26-4421-5efd-08d8011e1575
x-ms-traffictypediagnostic: AM7PR04MB7110:
x-microsoft-antispam-prvs: <AM7PR04MB71107F32547194E921A3D5778BB00@AM7PR04MB7110.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pe1ZGY0A38ybLYiF0OXCVtdWUbyP0lYmyOcmUPs83KP3jszhqNhdmxYoA4XTn2uoFOyVmsMm+RD/5YiNzg0ZcHkjRDZInWzpnfr/wGbOmml24+648An8pq/FFmqZq9CLPNJLfCFY/RGdnbo/7auAzlzsG9WVk3c0oHJduZNa7D+KEHHovd+hVLZCsGPzskZIgq8gboVp2CCLN5ds5ioUx0JOKam/z1E04rr0trizTuRBXYn20QuZjT55um2S0Z13Ra8w6AbR0GcQ+/rkxQfNtZ2Goy/eMqNTM4FkSjxBBGGksyLfkYuUN8o82DqnhcO3+LNoRuCKyy4yR+PfJy/NnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(376002)(39850400004)(136003)(396003)(346002)(366004)(8936002)(316002)(1076003)(6506007)(186003)(478600001)(2906002)(86362001)(33656002)(4326008)(26005)(66574014)(33716001)(44832011)(91956017)(6916009)(66946007)(5660300002)(76116006)(66556008)(64756008)(71200400001)(66446008)(66476007)(6486002)(8676002)(9686003)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7ZOjJ+4Z0VkWaobF+sgudNwsu2HP60LdxTfhdWXvOXfbM5L+uRwhZJVRqkkKqj9hGlY/EaiusXMC71+x/PrGgK6bjCb3syxzCMGL6mVKjcIC3rjuTIhgPwnzTXBrwqEKDKvhp/RufwfDo7bW9QyPE9SIkHfcASKGPzDU1bJxaRvN8zgAb+2755nMG1Rav6TWW4q0Jc4PstHHe7U1cLlhwpaur1GHKlOclUNe5wXaxrUl9Jp4EEh3MW4MwrYeW7c7a4g0kTITfwxIJFE/QjxqLEUyGrlM97P8EJaYnIogzzT7M4jcD+TXbCmDu0LZyLkKSBv9nvKrZlt4H/fb6Z9cvHO3jYaUk0g65LjkdrKay/mL06oU4pnx20af78e8BZIMCe5amipoGpO89JH/SPbvvF+XkVKqAD+d8WEafpvbcuRkVXLmi5peFLc9HjRuCBKUket1FmyalcEJXfW+w2q2T7p1VHH95rUwctxRQ8r/xwI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC684E67CDC90A4BA1DCE549E652EC2B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca18c06-ec26-4421-5efd-08d8011e1575
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 02:39:59.2709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ez/GPtFY7APMIzQH+CiB1SlhKxUVnvGSTHENL7iyMtIYjliSAOxNyvVOgJl+nrcr/KlDLGkL4H0G156pRKvMRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7110
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KQmVsb3cgYXJlIHRoZSBjaGFuZ2VzIGZvciB0aGlzIG1lcmdlIHdpbmRvdywg
YW5kIGFsbCBwYXRjaGVzIGFyZSBhdA0KbXkgdHJlZSBzZXZlcmFsIHdlZWtzLCBubyBpc3N1ZXMg
YXJlIHJlcG9ydGVkLg0KDQoNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2
MmQ2NWJkZDlkMDUxNThhYTI1NDdmOGVmNzIzNzU1MzVmM2JjNmUzOg0KDQogIFVTQjogY2RjLWFj
bTogcmVzdG9yZSBjYXBhYmlsaXR5IGNoZWNrIG9yZGVyICgyMDIwLTAzLTI3IDE2OjI0OjE2ICsw
MTAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGV0ZXIuY2hlbi91c2Iu
Z2l0LyB0YWdzL3VzYi1jaS12NS44LXJjMQ0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gNmRiYmJjY2RiYTYxMThiMzA4MzdjNDJmM2QzNTZlY2YwYWFmNGExZjoNCg0KICB1c2I6IGNo
aXBpZGVhOiBFbmFibGUgdXNlci1zcGFjZSB0cmlnZ2VyZWQgcm9sZS1zd2l0Y2hpbmcgKDIwMjAt
MDUtMDYgMDk6NDU6MjQgKzA4MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCi0gU29tZSBpbXByb3ZtZW50cyBmb3Ig
Y2lfaGRyY191c2IyLmMNCi0gU3VwcG9ydCBpbXg3ZCBVU0IgY2hhcmdlcg0KLSBBZGQgc29mdHdh
cmUgc2cgc3VwcG9ydCBmb3IgVURDDQotIEVuYWJsZSB1c2VyIHRyaWdnZXIgcm9sZSBzd2l0Y2gN
Cg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KQnJ5YW4gTydEb25vZ2h1ZSAoMSk6DQogICAgICB1c2I6IGNoaXBpZGVhOiBF
bmFibGUgdXNlci1zcGFjZSB0cmlnZ2VyZWQgcm9sZS1zd2l0Y2hpbmcNCg0KSmFzb24gWWFuICgx
KToNCiAgICAgIHVzYjogY2hpcGlkZWE6IHVzYjI6IHJlbW92ZSB1bm5lZWRlZCBzZW1pY29sb24N
Cg0KSnVuIExpICgxKToNCiAgICAgIHVzYjogY2hpcGlkZWE6IGludHJvZHVjZSBpbXg3ZCBVU0Ig
Y2hhcmdlciBkZXRlY3Rpb24NCg0KTWljaGHFgiBNaXJvc8WCYXcgKDUpOg0KICAgICAgdXNiOiBj
aGlwaWRlYTogdXNiMjogY29uc3RpZnkgenlucV9wZGF0YQ0KICAgICAgdXNiOiBjaGlwaWRlYTog
dXNiMjogZml4IGZvcm1hdHRpbmcNCiAgICAgIHVzYjogY2hpcGlkZWE6IHVzYjI6IG1ha2UgY2xv
Y2sgb3B0aW9uYWwNCiAgICAgIHVzYjogY2hpcGlkZWE6IHVzYjI6IGFic29yYiB6ZXZpbyBnbHVl
IGRyaXZlcg0KICAgICAgdXNiOiBjaGlwaWRlYTogYWxsb3cgZGlzYWJsaW5nIGdsdWUgZHJpdmVy
cyBpZiBFTUJFRERFRA0KDQpQZXRlciBDaGVuICg3KToNCiAgICAgIHVzYjogY2hpcGlkZWE6IHVk
YzogZml4IHRoZSBrZXJuZWwgZG9jIGZvciB1ZGMuaA0KICAgICAgdXNiOiBjaGlwaWRlYTogY29y
ZTogcmVmaW5lIHRoZSBkZXNjcmlwdGlvbiBmb3IgdGhpcyBkcml2ZXINCiAgICAgIHVzYjogY2hp
cGlkZWE6IGNvcmU6IHNob3cgdGhlIHJlYWwgcG9pbnRlciB2YWx1ZSBmb3IgcmVnaXN0ZXINCiAg
ICAgIHVzYjogY2hpcGlkZWE6IGludHJvZHVjZSBDSV9IRFJDX0NPTlRST0xMRVJfVkJVU19FVkVO
VCBnbHVlIGxheWVyIHVzZQ0KICAgICAgdXNiOiBjaGlwaWRlYTogcHVsbCBkb3duIGRwIGZvciBw
b3NzaWJsZSBjaGFyZ2VyIGRldGVjdGlvbiBvcGVyYXRpb24NCiAgICAgIHVzYjogY2hpcGlkZWE6
IHVzYm1pc2NfaW14OiB1c2luZyBkaWZmZXJlbnQgb3BzIGZvciBpbXg3ZCBhbmQgaW14N3VscA0K
ICAgICAgdXNiOiBjaGlwaWRlYTogdWRjOiBhZGQgc29mdHdhcmUgc2cgbGlzdCBzdXBwb3J0DQoN
CiBkcml2ZXJzL3VzYi9jaGlwaWRlYS9LY29uZmlnICAgICAgICAgfCAgMzcgKystLQ0KIGRyaXZl
cnMvdXNiL2NoaXBpZGVhL01ha2VmaWxlICAgICAgICB8ICAxMyArLQ0KIGRyaXZlcnMvdXNiL2No
aXBpZGVhL2NpLmggICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy91c2IvY2hpcGlkZWEvY2lf
aGRyY19pbXguYyAgIHwgIDEzICstDQogZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY19pbXgu
aCAgIHwgICAyICsNCiBkcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX3VzYjIuYyAgfCAgMzAg
KystLQ0KIGRyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfemV2aW8uYyB8ICA2NyAtLS0tLS0t
DQogZHJpdmVycy91c2IvY2hpcGlkZWEvY29yZS5jICAgICAgICAgIHwgIDQ4ICsrLS0tDQogZHJp
dmVycy91c2IvY2hpcGlkZWEvdWRjLmMgICAgICAgICAgIHwgMTcwICsrKysrKysrKysrKysrLS0t
LQ0KIGRyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5oICAgICAgICAgICB8ICAgNiArLQ0KIGRyaXZl
cnMvdXNiL2NoaXBpZGVhL3VzYm1pc2NfaW14LmMgICB8IDMzNCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQ0KIGluY2x1ZGUvbGludXgvdXNiL2NoaXBpZGVhLmggICAgICAgICB8
ICAgMSArDQogMTIgZmlsZXMgY2hhbmdlZCwgNTQ2IGluc2VydGlvbnMoKyksIDE3NiBkZWxldGlv
bnMoLSkNCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY196
ZXZpby5jDQoNCi0tIA0KDQpUaGFua3MsDQpQZXRlciBDaGVu
