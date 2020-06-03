Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE201ECBEA
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 10:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgFCIx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 04:53:29 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:32938 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725881AbgFCIx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 04:53:28 -0400
X-UUID: 1d9e7d6b831a4315a6462587d4eb2674-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=foh1LVDz4zG+nhm8SAdtAJltvmrb0X/O58Mlha3MLck=;
        b=p4zcfQj4p03d1P16QyH5JX3w9cApP6Ho1V/7AfCqnypmEF1M/kkE6mFc7nFRz0ELkDk6ZwGwMKHwA940DB+rXfwlgFbC8pBWJYn2VBrlefvnHXsqL9gTIRMZsMZAdLgtPeyIRqZMpf3SwEij9z586karCCgoC3Q7eFWtAgpTWlE=;
X-UUID: 1d9e7d6b831a4315a6462587d4eb2674-20200603
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1904591763; Wed, 03 Jun 2020 16:53:19 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Jun
 2020 16:53:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 16:53:16 +0800
Message-ID: <1591174278.15527.6.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/9] usb: cdns3: add runtime PM support
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     <balbi@kernel.org>, <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>, <linux-imx@nxp.com>,
        <pawell@cadence.com>, <rogerq@ti.com>,
        <gregkh@linuxfoundation.org>, <jun.li@nxp.com>
Date:   Wed, 3 Jun 2020 16:51:18 +0800
In-Reply-To: <20200523232304.23976-3-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
         <20200523232304.23976-3-peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0F3E947F390E28A1ADBF441C77E8D91A23CB4B06A92FFE823CE1810B44D053282000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgUGV0ZXIsDQpPbiBTdW4sIDIwMjAtMDUtMjQgYXQgMDc6MjIgKzA4MDAsIFBldGVyIENoZW4g
d3JvdGU6DQo+IEludHJvZHVjZSBydW50aW1lIFBNIGFuZCB3YWtldXAgaW50ZXJydXB0IGhhbmRs
ZXIgZm9yIGNkbnMzLA0KPiB0aGUgcnVudGltZSBQTSBpcyBkZWZhdWx0IG9mZiBzaW5jZSBvdGhl
ciBjZG5zMyBoYXMgbm90IGltcGxlbWVudGVkDQo+IGdsdWUgbGF5ZXIgc3VwcG9ydCBmb3IgcnVu
dGltZSBQTS4NCj4gDQo+IFdoZW4gdGhlIGNvbnRyb2xsZXIgaXMgaW4gbG93IHBvd2VyIG1vZGUs
IHRoZSBscG0gZmxhZyB3aWxsIGJlIHNldC4NCj4gVGhlIGludGVycnVwdCB0cmlnZ2VyZWQgbGF0
ZXIgdGhhbiBscG0gZmxhZyBpcyBzZXQgY29uc2lkZXJzIGFzDQo+IHdha2V1cCBpbnRlcnJ1cHQg
YW5kIGhhbmRsZWQgYXQgY2Ruc19kcmRfaXJxLiANCldvbmRlciB0byBrbm93IHRoYXQgQ1BVcyBt
YXkgYmUgcG93ZXJlZCBvZmYgaW4gdGhpcyBjYXNlPyANCkRvIHlvdSBjb25zaWRlciB0aGUgY2Fz
ZSB3aGVuIHVzYiBjb250cm9sbGVyIGlzIGluIGxvdyBwb3dlciBtb2RlLCBhbmQNCmFsc28gcG93
ZXIgb2ZmIENQVXMsIHRoZW4gaG93IHRvIHdha2V1cCB1c2IgY29udHJvbGxlcj8NCg0KVGhhbmtz
DQoNCj4gT25jZSB0aGUgd2FrZXVwDQo+IG9jY3VycywgaXQgZmlyc3QgZGlzYWJsZXMgaW50ZXJy
dXB0IHRvIGF2b2lkIGxhdGVyIGludGVycnVwdA0KPiBvY2N1cnJlbmNlIHNpbmNlIHRoZSBjb250
cm9sbGVyIGlzIGluIGxvdyBwb3dlciBtb2RlIGF0IHRoYXQNCj4gdGltZSwgYW5kIGFjY2VzcyBy
ZWdpc3RlcnMgbWF5IGJlIGludmFsaWQgYXQgdGhhdCB0aW1lLiBBdCB3YWtldXANCj4gaGFuZGxl
ciwgaXQgd2lsbCBjYWxsIHBtX3J1bnRpbWVfZ2V0IHRvIHdha2V1cCBjb250cm9sbGVyLCBhbmQN
Cj4gYXQgcnVudGltZSByZXN1bWUgaGFuZGxlciwgaXQgd2lsbCBlbmFibGUgaW50ZXJydXB0IGFn
YWluLg0KPiANCj4gVGhlIEFQSSBwbGF0Zm9ybV9zdXNwZW5kIGlzIGludHJvZHVjZWQgZm9yIGds
dWUgbGF5ZXIgdG8gaW1wbGVtZW50DQo+IHBsYXRmb3JtIHNwZWNpZmljIFBNIHNlcXVlbmNlLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL2NkbnMzL2NvcmUuYyAgIHwgMTE5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2NkbnMzL2NvcmUuaCAgIHwgIDE0
ICsrKysrDQo+ICBkcml2ZXJzL3VzYi9jZG5zMy9kcmQuYyAgICB8ICAgNyArKysNCj4gIGRyaXZl
cnMvdXNiL2NkbnMzL2dhZGdldC5jIHwgICA0ICsrDQo+ICBkcml2ZXJzL3VzYi9jZG5zMy9ob3N0
LmMgICB8ICAgNyArKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTM0IGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQ0KDQo=

