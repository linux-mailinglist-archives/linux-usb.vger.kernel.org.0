Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8901922E653
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 09:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgG0HQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 03:16:50 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:9340 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727098AbgG0HQt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 03:16:49 -0400
X-UUID: 993646a612354f7589969844d78cee05-20200727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dKMalhtdhFPPOdQozyVhSoiY/17guaRKov/u2gTo5Gk=;
        b=vAnnP6doSaYLjERbOiyUKH/Fe+AVwRRcFDJAbK/hPKlcNaKzhURF5j9aberKmFve7fswZAQPHDz2kvj3ue/RVI07pwtseVhBe+Jya4jvIFQV0cTSYAnNuDuIIitzaJYoBO+t+ACD8fYyYbV36FkDvb2I4uAVjb317S4G0Mtc0P8=;
X-UUID: 993646a612354f7589969844d78cee05-20200727
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1528417198; Mon, 27 Jul 2020 15:16:45 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:41 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:41 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 10/11] usb: mtu3: clear dual mode of u3port when disable device
Date:   Mon, 27 Jul 2020 15:14:59 +0800
Message-ID: <1595834101-13094-10-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SWYgbm90IGNsZWFyIHUzcG9ydCdzIGR1YWwgbW9kZSB3aGVuIGRpc2FibGUgZGV2aWNlLCB0aGUg
SVANCndpbGwgZmFpbCB0byBlbnRlciBzbGVlcCBtb2RlIHdoZW4gc3VzcGVuZC4NCg0KU2lnbmVk
LW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KLS0tDQog
ZHJpdmVycy91c2IvbXR1My9tdHUzX2NvcmUuYyB8IDYgKysrKystDQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvbXR1My9tdHUzX2NvcmUuYyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M19jb3JlLmMNCmluZGV4
IGM4NzViMjIuLmE5YzVjMzIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfY29y
ZS5jDQorKysgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfY29yZS5jDQpAQCAtMTMxLDggKzEzMSwx
MiBAQCBzdGF0aWMgdm9pZCBtdHUzX2RldmljZV9kaXNhYmxlKHN0cnVjdCBtdHUzICptdHUpDQog
CW10dTNfc2V0Yml0cyhpYmFzZSwgU1NVU0JfVTJfQ1RSTCgwKSwNCiAJCVNTVVNCX1UyX1BPUlRf
RElTIHwgU1NVU0JfVTJfUE9SVF9QRE4pOw0KIA0KLQlpZiAobXR1LT5zc3VzYi0+ZHJfbW9kZSA9
PSBVU0JfRFJfTU9ERV9PVEcpDQorCWlmIChtdHUtPnNzdXNiLT5kcl9tb2RlID09IFVTQl9EUl9N
T0RFX09URykgew0KIAkJbXR1M19jbHJiaXRzKGliYXNlLCBTU1VTQl9VMl9DVFJMKDApLCBTU1VT
Ql9VMl9QT1JUX09UR19TRUwpOw0KKwkJaWYgKG10dS0+aXNfdTNfaXApDQorCQkJbXR1M19jbHJi
aXRzKGliYXNlLCBTU1VTQl9VM19DVFJMKDApLA0KKwkJCQkgICAgIFNTVVNCX1UzX1BPUlRfRFVB
TF9NT0RFKTsNCisJfQ0KIA0KIAltdHUzX3NldGJpdHMoaWJhc2UsIFUzRF9TU1VTQl9JUF9QV19D
VFJMMiwgU1NVU0JfSVBfREVWX1BETik7DQogfQ0KLS0gDQoxLjkuMQ0K

