Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192F928CA9C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 10:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404157AbgJMIwf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 04:52:35 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:55216 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404128AbgJMIwd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 04:52:33 -0400
X-UUID: 735e4d52064c4b6ca642764ebd732be3-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T4VkQOxj22dU5Q9Aqm4nbQZ8QC1woK+XWwRhFTeSle4=;
        b=N2kIyhKfZMrLUNt1D+FBNBr+XUIunjSb5odoUwrwBeojAEsS1QkMbgJh20+F9JoljHMAIIC2l6ZWjOzUynXBENDEQ9KgTPCW3reB9aEqwa9+BS0B+Q9iboy4W807BU0p7cXmOtfm8Xhoa233K3oXs2oemc2sYoho0htrgpta6pA=;
X-UUID: 735e4d52064c4b6ca642764ebd732be3-20201013
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 85443900; Tue, 13 Oct 2020 16:52:13 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 16:52:12 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Oct 2020 16:52:12 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        CK Hu <ck.hu@mediatek.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Min Guo <min.guo@mediatek.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v2 6/8] dt-bindings: usb: convert mediatek,mtk-xhci.txt to YAML schema
Date:   Tue, 13 Oct 2020 16:52:05 +0800
Message-ID: <20201013085207.17749-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Q29udmVydCBtZWRpYXRlayxtdGsteGhjaS50eHQgdG8gWUFNTCBzY2hlbWEgbWVkaWF0ZWssbXRr
LXhoY2kueWFtbA0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBt
ZWRpYXRlay5jb20+DQotLS0NCnYyOiBuZXcgcGF0Y2gNCi0tLQ0KIC4uLi9iaW5kaW5ncy91c2Iv
bWVkaWF0ZWssbXRrLXhoY2kudHh0ICAgICAgICB8IDEyMSAtLS0tLS0tLS0tLS0NCiAuLi4vYmlu
ZGluZ3MvdXNiL21lZGlhdGVrLG10ay14aGNpLnlhbWwgICAgICAgfCAxODAgKysrKysrKysrKysr
KysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAxODAgaW5zZXJ0aW9ucygrKSwgMTIxIGRlbGV0aW9u
cygtKQ0KIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL21lZGlhdGVrLG10ay14aGNpLnR4dA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay14aGNpLnlhbWwNCg0K
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0
ZWssbXRrLXhoY2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9t
ZWRpYXRlayxtdGsteGhjaS50eHQNCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggNDJk
ODgxNGY5MDNhLi4wMDAwMDAwMDAwMDANCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvbWVkaWF0ZWssbXRrLXhoY2kudHh0DQorKysgL2Rldi9udWxsDQpAQCAtMSwx
MjEgKzAsMCBAQA0KLU1UODE3MyB4SENJDQotDQotVGhlIGRldmljZSBub2RlIGZvciBNZWRpYXRl
ayBTT0MgVVNCMy4wIGhvc3QgY29udHJvbGxlcg0KLQ0KLVRoZXJlIGFyZSB0d28gc2NlbmFyaW9z
OiB0aGUgZmlyc3Qgb25lIG9ubHkgc3VwcG9ydHMgeEhDSSBkcml2ZXI7DQotdGhlIHNlY29uZCBv
bmUgc3VwcG9ydHMgZHVhbC1yb2xlIG1vZGUsIGFuZCB0aGUgaG9zdCBpcyBiYXNlZCBvbiB4SENJ
DQotZHJpdmVyLiBUYWtlIGFjY291bnQgb2YgYmFja3dhcmQgY29tcGF0aWJpbGl0eSwgd2UgZGl2
aWRlIGJpbmRpbmdzDQotaW50byB0d28gcGFydHMuDQotDQotMXN0OiBvbmx5IHN1cHBvcnRzIHhI
Q0kgZHJpdmVyDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQotDQotUmVxdWlyZWQgcHJvcGVydGllczoNCi0g
LSBjb21wYXRpYmxlIDogc2hvdWxkIGJlICJtZWRpYXRlayw8c29jLW1vZGVsPi14aGNpIiwgIm1l
ZGlhdGVrLG10ay14aGNpIiwNCi0Jc29jLW1vZGVsIGlzIHRoZSBuYW1lIG9mIFNvQywgc3VjaCBh
cyBtdDgxNzMsIG10MjcxMiBldGMsIHdoZW4gdXNpbmcNCi0JIm1lZGlhdGVrLG10ay14aGNpIiBj
b21wYXRpYmxlIHN0cmluZywgeW91IG5lZWQgU29DIHNwZWNpZmljIG9uZXMgaW4NCi0JYWRkaXRp
b24sIG9uZSBvZjoNCi0JLSAibWVkaWF0ZWssbXQ4MTczLXhoY2kiDQotIC0gcmVnIDogc3BlY2lm
aWVzIHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzDQotIC0g
cmVnLW5hbWVzOiBzaG91bGQgYmUgIm1hYyIgZm9yIHhIQ0kgTUFDIGFuZCAiaXBwYyIgZm9yIElQ
IHBvcnQgY29udHJvbA0KLSAtIGludGVycnVwdHMgOiBpbnRlcnJ1cHQgdXNlZCBieSB0aGUgY29u
dHJvbGxlcg0KLSAtIHBvd2VyLWRvbWFpbnMgOiBhIHBoYW5kbGUgdG8gVVNCIHBvd2VyIGRvbWFp
biBub2RlIHRvIGNvbnRyb2wgVVNCJ3MNCi0JbXRjbW9zDQotIC0gdnVzYjMzLXN1cHBseSA6IHJl
Z3VsYXRvciBvZiBVU0IgYXZkZDMuM3YNCi0NCi0gLSBjbG9ja3MgOiBhIGxpc3Qgb2YgcGhhbmRs
ZSArIGNsb2NrLXNwZWNpZmllciBwYWlycywgb25lIGZvciBlYWNoDQotCWVudHJ5IGluIGNsb2Nr
LW5hbWVzDQotIC0gY2xvY2stbmFtZXMgOiBtdXN0IGNvbnRhaW4NCi0JInN5c19jayI6IGNvbnRy
b2xsZXIgY2xvY2sgdXNlZCBieSBub3JtYWwgbW9kZSwNCi0JdGhlIGZvbGxvd2luZyBvbmVzIGFy
ZSBvcHRpb25hbDoNCi0JInJlZl9jayI6IHJlZmVyZW5jZSBjbG9jayB1c2VkIGJ5IGxvdyBwb3dl
ciBtb2RlIGV0YywNCi0JIm1jdV9jayI6IG1jdV9idXMgY2xvY2sgZm9yIHJlZ2lzdGVyIGFjY2Vz
cywNCi0JImRtYV9jayI6IGRtYV9idXMgY2xvY2sgZm9yIGRhdGEgdHJhbnNmZXIgYnkgRE1BLA0K
LQkieGhjaV9jayI6IGNvbnRyb2xsZXIgY2xvY2sNCi0NCi0gLSBwaHlzIDogc2VlIHVzYi1oY2Qu
eWFtbCBpbiB0aGUgY3VycmVudCBkaXJlY3RvcnkNCi0NCi1PcHRpb25hbCBwcm9wZXJ0aWVzOg0K
LSAtIHdha2V1cC1zb3VyY2UgOiBlbmFibGUgVVNCIHJlbW90ZSB3YWtldXA7DQotIC0gbWVkaWF0
ZWssc3lzY29uLXdha2V1cCA6IHBoYW5kbGUgdG8gc3lzY29uIHVzZWQgdG8gYWNjZXNzIHRoZSBy
ZWdpc3Rlcg0KLQlvZiB0aGUgVVNCIHdha2V1cCBnbHVlIGxheWVyIGJldHdlZW4geEhDSSBhbmQg
U1BNOyBpdCBkZXBlbmRzIG9uDQotCSJ3YWtldXAtc291cmNlIiwgYW5kIGhhcyB0d28gYXJndW1l
bnRzOg0KLQktIHRoZSBmaXJzdCBvbmUgOiByZWdpc3RlciBiYXNlIGFkZHJlc3Mgb2YgdGhlIGds
dWUgbGF5ZXIgaW4gc3lzY29uOw0KLQktIHRoZSBzZWNvbmQgb25lIDogaGFyZHdhcmUgdmVyc2lv
biBvZiB0aGUgZ2x1ZSBsYXllcg0KLQkJLSAxIDogdXNlZCBieSBtdDgxNzMgZXRjDQotCQktIDIg
OiB1c2VkIGJ5IG10MjcxMiBldGMNCi0gLSBtZWRpYXRlayx1M3AtZGlzLW1zayA6IG1hc2sgdG8g
ZGlzYWJsZSB1M3BvcnRzLCBiaXQwIGZvciB1M3BvcnQwLA0KLQliaXQxIGZvciB1M3BvcnQxLCAu
Li4gZXRjOw0KLSAtIHZidXMtc3VwcGx5IDogcmVmZXJlbmNlIHRvIHRoZSBWQlVTIHJlZ3VsYXRv
cjsNCi0gLSB1c2IzLWxwbS1jYXBhYmxlIDogc3VwcG9ydHMgVVNCMy4wIExQTQ0KLSAtIHBpbmN0
cmwtbmFtZXMgOiBhIHBpbmN0cmwgc3RhdGUgbmFtZWQgImRlZmF1bHQiIG11c3QgYmUgZGVmaW5l
ZA0KLSAtIHBpbmN0cmwtMCA6IHBpbiBjb250cm9sIGdyb3VwDQotCVNlZTogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1iaW5kaW5ncy50eHQNCi0gLSBp
bW9kLWludGVydmFsLW5zOiBkZWZhdWx0IGludGVycnVwdCBtb2RlcmF0aW9uIGludGVydmFsIGlz
IDUwMDBucw0KLQ0KLWFkZGl0aW9uYWxseSB0aGUgcHJvcGVydGllcyBmcm9tIHVzYi1oY2QueWFt
bCAoaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5KSBhcmUNCi1zdXBwb3J0ZWQuDQotDQotRXhhbXBs
ZToNCi11c2IzMDogdXNiQDExMjcwMDAwIHsNCi0JY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
NzMteGhjaSI7DQotCXJlZyA9IDwwIDB4MTEyNzAwMDAgMCAweDEwMDA+LA0KLQkgICAgICA8MCAw
eDExMjgwNzAwIDAgMHgwMTAwPjsNCi0JcmVnLW5hbWVzID0gIm1hYyIsICJpcHBjIjsNCi0JaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDExNSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KLQlwb3dlci1kb21h
aW5zID0gPCZzY3BzeXMgTVQ4MTczX1BPV0VSX0RPTUFJTl9VU0I+Ow0KLQljbG9ja3MgPSA8JnRv
cGNrZ2VuIENMS19UT1BfVVNCMzBfU0VMPiwgPCZjbGsyNm0+LA0KLQkJIDwmcGVyaWNmZyBDTEtf
UEVSSV9VU0IwPiwNCi0JCSA8JnBlcmljZmcgQ0xLX1BFUklfVVNCMT47DQotCWNsb2NrLW5hbWVz
ID0gInN5c19jayIsICJyZWZfY2siOw0KLQlwaHlzID0gPCZwaHlfcG9ydDAgUEhZX1RZUEVfVVNC
Mz4sDQotCSAgICAgICA8JnBoeV9wb3J0MSBQSFlfVFlQRV9VU0IyPjsNCi0JdnVzYjMzLXN1cHBs
eSA9IDwmbXQ2Mzk3X3Z1c2JfcmVnPjsNCi0JdmJ1cy1zdXBwbHkgPSA8JnVzYl9wMV92YnVzPjsN
Ci0JdXNiMy1scG0tY2FwYWJsZTsNCi0JbWVkaWF0ZWssc3lzY29uLXdha2V1cCA9IDwmcGVyaWNm
ZyAweDQwMCAxPjsNCi0Jd2FrZXVwLXNvdXJjZTsNCi0JaW1vZC1pbnRlcnZhbC1ucyA9IDwxMDAw
MD47DQotfTsNCi0NCi0ybmQ6IGR1YWwtcm9sZSBtb2RlIHdpdGggeEhDSSBkcml2ZXINCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCi0NCi1JbiB0aGUgY2FzZSwgeGhjaSBpcyBhZGRlZCBhcyBzdWJub2RlIHRv
IG10dTMuIEFuIGV4YW1wbGUgYW5kIHRoZSBEVCBiaW5kaW5nDQotZGV0YWlscyBvZiBtdHUzIGNh
biBiZSBmb3VuZCBpbjoNCi1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21l
ZGlhdGVrLG10dTMudHh0DQotDQotUmVxdWlyZWQgcHJvcGVydGllczoNCi0gLSBjb21wYXRpYmxl
IDogc2hvdWxkIGJlICJtZWRpYXRlayw8c29jLW1vZGVsPi14aGNpIiwgIm1lZGlhdGVrLG10ay14
aGNpIiwNCi0Jc29jLW1vZGVsIGlzIHRoZSBuYW1lIG9mIFNvQywgc3VjaCBhcyBtdDgxNzMsIG10
MjcxMiBldGMsIHdoZW4gdXNpbmcNCi0JIm1lZGlhdGVrLG10ay14aGNpIiBjb21wYXRpYmxlIHN0
cmluZywgeW91IG5lZWQgU29DIHNwZWNpZmljIG9uZXMgaW4NCi0JYWRkaXRpb24sIG9uZSBvZjoN
Ci0JLSAibWVkaWF0ZWssbXQ4MTczLXhoY2kiDQotIC0gcmVnIDogc3BlY2lmaWVzIHBoeXNpY2Fs
IGJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzDQotIC0gcmVnLW5hbWVzOiBz
aG91bGQgYmUgIm1hYyIgZm9yIHhIQ0kgTUFDDQotIC0gaW50ZXJydXB0cyA6IGludGVycnVwdCB1
c2VkIGJ5IHRoZSBob3N0IGNvbnRyb2xsZXINCi0gLSBwb3dlci1kb21haW5zIDogYSBwaGFuZGxl
IHRvIFVTQiBwb3dlciBkb21haW4gbm9kZSB0byBjb250cm9sIFVTQidzDQotCW10Y21vcw0KLSAt
IHZ1c2IzMy1zdXBwbHkgOiByZWd1bGF0b3Igb2YgVVNCIGF2ZGQzLjN2DQotDQotIC0gY2xvY2tz
IDogYSBsaXN0IG9mIHBoYW5kbGUgKyBjbG9jay1zcGVjaWZpZXIgcGFpcnMsIG9uZSBmb3IgZWFj
aA0KLQllbnRyeSBpbiBjbG9jay1uYW1lcw0KLSAtIGNsb2NrLW5hbWVzIDogbXVzdCBjb250YWlu
ICJzeXNfY2siLCBhbmQgdGhlIGZvbGxvd2luZyBvbmVzIGFyZSBvcHRpb25hbDoNCi0JInJlZl9j
ayIsICJtY3VfY2siIGFuZCAiZG1hX2NrIiwgInhoY2lfY2siDQotDQotT3B0aW9uYWwgcHJvcGVy
dGllczoNCi0gLSB2YnVzLXN1cHBseSA6IHJlZmVyZW5jZSB0byB0aGUgVkJVUyByZWd1bGF0b3I7
DQotIC0gdXNiMy1scG0tY2FwYWJsZSA6IHN1cHBvcnRzIFVTQjMuMCBMUE0NCi0NCi1FeGFtcGxl
Og0KLXVzYjMwOiB1c2JAMTEyNzAwMDAgew0KLQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3
My14aGNpIjsNCi0JcmVnID0gPDAgMHgxMTI3MDAwMCAwIDB4MTAwMD47DQotCXJlZy1uYW1lcyA9
ICJtYWMiOw0KLQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTE1IElSUV9UWVBFX0xFVkVMX0xPVz47
DQotCXBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgxNzNfUE9XRVJfRE9NQUlOX1VTQj47DQot
CWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9VU0IzMF9TRUw+LCA8JmNsazI2bT47DQotCWNs
b2NrLW5hbWVzID0gInN5c19jayIsICJyZWZfY2siOw0KLQl2dXNiMzMtc3VwcGx5ID0gPCZtdDYz
OTdfdnVzYl9yZWc+Ow0KLQl1c2IzLWxwbS1jYXBhYmxlOw0KLX07DQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhj
aS55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi5lYTY5NmM4
ZjEyNjkNCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy91c2IvbWVkaWF0ZWssbXRrLXhoY2kueWFtbA0KQEAgLTAsMCArMSwxODAgQEANCisjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCisj
IENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlaw0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL21lZGlhdGVrLG10ay14aGNpLnlhbWwjDQor
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQor
DQordGl0bGU6IE1lZGlhVGVrIFVTQjMgeEhDSSBEZXZpY2UgVHJlZSBCaW5kaW5ncw0KKw0KK21h
aW50YWluZXJzOg0KKyAgLSBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+
DQorDQorYWxsT2Y6DQorICAtICRyZWY6ICJ1c2ItaGNkLnlhbWwiDQorDQorZGVzY3JpcHRpb246
IHwNCisgIFRoZXJlIGFyZSB0d28gc2NlbmFyaW9zOg0KKyAgY2FzZSAxOiBvbmx5IHN1cHBvcnRz
IHhIQ0kgZHJpdmVyOw0KKyAgY2FzZSAyOiBzdXBwb3J0cyBkdWFsLXJvbGUgbW9kZSwgYW5kIHRo
ZSBob3N0IGlzIGJhc2VkIG9uIHhIQ0kgZHJpdmVyLg0KKw0KK3Byb3BlcnRpZXM6DQorICAjY29t
bW9uIHByb3BlcnRpZXMgZm9yIGJvdGggY2FzZSAxIGFuZCBjYXNlIDINCisgIGNvbXBhdGlibGU6
DQorICAgIGl0ZW1zOg0KKyAgICAgIC0gZW51bToNCisgICAgICAgICAgLSBtZWRpYXRlayxtdDI3
MTIteGhjaQ0KKyAgICAgICAgICAtIG1lZGlhdGVrLG10NzYyMi14aGNpDQorICAgICAgICAgIC0g
bWVkaWF0ZWssbXQ3NjI5LXhoY2kNCisgICAgICAgICAgLSBtZWRpYXRlayxtdDgxNzMteGhjaQ0K
KyAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4My14aGNpDQorICAgICAgLSBjb25zdDogbWVkaWF0
ZWssbXRrLXhoY2kNCisNCisgIHJlZzoNCisgICAgbWluSXRlbXM6IDENCisgICAgbWF4SXRlbXM6
IDINCisgICAgaXRlbXM6DQorICAgICAgLSBkZXNjcmlwdGlvbjogdGhlIHJlZ2lzdGVycyBvZiB4
SENJIE1BQw0KKyAgICAgIC0gZGVzY3JpcHRpb246IHRoZSByZWdpc3RlcnMgb2YgSVAgUG9ydCBD
b250cm9sDQorDQorICByZWctbmFtZXM6DQorICAgIG1pbkl0ZW1zOiAxDQorICAgIG1heEl0ZW1z
OiAyDQorICAgIGl0ZW1zOg0KKyAgICAgIC0gY29uc3Q6IG1hYw0KKyAgICAgIC0gY29uc3Q6IGlw
cGMgICNvcHRpb25hbCwgb25seSBuZWVkZWQgZm9yIGNhc2UgMS4NCisNCisgIGludGVycnVwdHM6
DQorICAgIG1heEl0ZW1zOiAxDQorDQorICBwb3dlci1kb21haW5zOg0KKyAgICBkZXNjcmlwdGlv
bjogQSBwaGFuZGxlIHRvIFVTQiBwb3dlciBkb21haW4gbm9kZSB0byBjb250cm9sIFVTQidzIE1U
Q01PUw0KKyAgICBtYXhJdGVtczogMQ0KKw0KKyAgY2xvY2tzOg0KKyAgICBtaW5JdGVtczogMQ0K
KyAgICBtYXhJdGVtczogNQ0KKyAgICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiBDb250
cm9sbGVyIGNsb2NrIHVzZWQgYnkgbm9ybWFsIG1vZGUNCisgICAgICAtIGRlc2NyaXB0aW9uOiBS
ZWZlcmVuY2UgY2xvY2sgdXNlZCBieSBsb3cgcG93ZXIgbW9kZSBldGMNCisgICAgICAtIGRlc2Ny
aXB0aW9uOiBNY3UgYnVzIGNsb2NrIGZvciByZWdpc3RlciBhY2Nlc3MNCisgICAgICAtIGRlc2Ny
aXB0aW9uOiBETUEgYnVzIGNsb2NrIGZvciBkYXRhIHRyYW5zZmVyDQorICAgICAgLSBkZXNjcmlw
dGlvbjogY29udHJvbGxlciBjbG9jaw0KKw0KKyAgY2xvY2stbmFtZXM6DQorICAgIG1pbkl0ZW1z
OiAxDQorICAgIG1heEl0ZW1zOiA1DQorICAgIGl0ZW1zOg0KKyAgICAgIC0gY29uc3Q6IHN5c19j
ayAgI3JlcXVpcmVkLCB0aGUgZm9sbG93aW5nIG9uZXMgYXJlIG9wdGlvbmFsDQorICAgICAgLSBj
b25zdDogcmVmX2NrDQorICAgICAgLSBjb25zdDogbWN1X2NrDQorICAgICAgLSBjb25zdDogZG1h
X2NrDQorICAgICAgLSBjb25zdDogeGhjaV9jaw0KKw0KKyAgcGh5czoNCisgICAgJHJlZjogL3Vz
Yi91c2ItaGNkLnlhbWwjDQorDQorICB2dXNiMzMtc3VwcGx5Og0KKyAgICBkZXNjcmlwdGlvbjog
UmVndWxhdG9yIG9mIFVTQiBBVkREMy4zdg0KKw0KKyAgdmJ1cy1zdXBwbHk6DQorICAgIGRlc2Ny
aXB0aW9uOiBSZWd1bGF0b3Igb2YgVVNCIFZCVVM1dg0KKw0KKyAgdXNiMy1scG0tY2FwYWJsZToN
CisgICAgZGVzY3JpcHRpb246IHN1cHBvcnRzIFVTQjMuMCBMUE0NCisgICAgdHlwZTogYm9vbGVh
bg0KKw0KKyAgaW1vZC1pbnRlcnZhbC1uczoNCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyDQorICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgSW50ZXJy
dXB0IG1vZGVyYXRpb24gaW50ZXJ2YWwgdmFsdWUsIGl0IGlzIDggdGltZXMgYXMgbXVjaCBhcyB0
aGF0DQorICAgICAgZGVmaW5lZCBpbiB0aGUgeEhDSSBzcGVjIG9uIE1USydzIGNvbnRyb2xsZXIu
DQorICAgIGRlZmF1bHQ6IDUwMDANCisNCisgICN0aGUgZm9sbG93aW5nIHByb3BlcnRpZXMgYXJl
IG9ubHkgdXNlZCBmb3IgY2FzZSAxDQorICBwaW5jdHJsLTA6DQorICAgIGRlc2NyaXB0aW9uOiBB
IHBoYW5kbGUgdG8gdGhlIGRlZmF1bHQgcGluY3RybCBzdGF0ZS4NCisNCisgIHBpbmN0cmwtbmFt
ZXM6DQorICAgIGRlc2NyaXB0aW9uOiBBIHBpbmN0cmwgc3RhdGUgbmFtZWQgImRlZmF1bHQiIG11
c3QgYmUgZGVmaW5lZC4NCisgICAgICBTZWUgcGluY3RybC9waW5jdHJsLWJpbmRpbmdzLnR4dA0K
KyAgICBjb25zdDogZGVmYXVsdA0KKw0KKyAgd2FrZXVwLXNvdXJjZToNCisgICAgZGVzY3JpcHRp
b246IGVuYWJsZSBVU0IgcmVtb3RlIHdha2V1cCwgc2VlIHBvd2VyL3dha2V1cC1zb3VyY2UudHh0
DQorICAgIHR5cGU6IGJvb2xlYW4NCisNCisgIG1lZGlhdGVrLHN5c2Nvbi13YWtldXA6DQorICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkNCisg
ICAgbWF4SXRlbXM6IDENCisgICAgZGVzY3JpcHRpb246IHwNCisgICAgICBBIHBoYW5kbGUgdG8g
c3lzY29uIHVzZWQgdG8gYWNjZXNzIHRoZSByZWdpc3RlciBvZiB0aGUgVVNCIHdha2V1cCBnbHVl
DQorICAgICAgbGF5ZXIgYmV0d2VlbiB4SENJIGFuZCBTUE0sIHRoZSBmaWVsZCBzaG91bGQgYWx3
YXlzIGJlIGEgbXVsdGlwbGUgb2YNCisgICAgICAzIGNlbGxzIGxvbmcuDQorDQorICAgICAgaXRl
bXM6DQorICAgICAgICAtIGRlc2NyaXB0aW9uOg0KKyAgICAgICAgICAgIFRoZSBmaXJzdCBjZWxs
IHJlcHJlc2VudHMgYSBwaGFuZGxlIHRvIHN5c2Nvbg0KKyAgICAgICAgLSBkZXNjcmlwdGlvbjoN
CisgICAgICAgICAgICBUaGUgc2Vjb25kIGNlbGwgcmVwcmVzZW50cyB0aGUgcmVnaXN0ZXIgYmFz
ZSBhZGRyZXNzIG9mIHRoZSBnbHVlDQorICAgICAgICAgICAgbGF5ZXIgaW4gc3lzY29uDQorICAg
ICAgICAtIGRlc2NyaXB0aW9uOg0KKyAgICAgICAgICAgIFRoZSB0aGlyZCBjZWxsIHJlcHJlc2Vu
dHMgdGhlIGhhcmR3YXJlIHZlcnNpb24gb2YgdGhlIGdsdWUgbGF5ZXIsDQorICAgICAgICAgICAg
MSBpcyB1c2VkIGJ5IG10ODE3MyBldGMsIDIgaXMgdXNlZCBieSBtdDI3MTIgZXRjDQorICAgICAg
ICAgIGVudW06IFsxLCAyXQ0KKw0KKyAgbWVkaWF0ZWssdTNwLWRpcy1tc2s6DQorICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KKyAgICBkZXNjcmlwdGlv
bjogVGhlIG1hc2sgdG8gZGlzYWJsZSB1M3BvcnRzLCBiaXQwIGZvciB1M3BvcnQwLA0KKyAgICAg
IGJpdDEgZm9yIHUzcG9ydDEsIC4uLiBldGMNCisNCisgICIjYWRkcmVzcy1jZWxscyI6DQorICAg
IGNvbnN0OiAxDQorDQorICAiI3NpemUtY2VsbHMiOg0KKyAgICBjb25zdDogMA0KKw0KK3BhdHRl
cm5Qcm9wZXJ0aWVzOg0KKyAgIl5bYS1mXStAWzAtOWEtZl0rJCI6DQorICAgICRyZWY6IC91c2Iv
dXNiLWhjZC55YW1sIw0KKyAgICB0eXBlOiBvYmplY3QNCisgICAgZGVzY3JpcHRpb246IFRoZSBo
YXJkIHdpcmVkIFVTQiBkZXZpY2VzLg0KKw0KK2RlcGVuZGVuY2llczoNCisgIHdha2V1cC1zb3Vy
Y2U6IFsgJ21lZGlhdGVrLHN5c2Nvbi13YWtldXAnIF0NCisNCityZXF1aXJlZDoNCisgIC0gY29t
cGF0aWJsZQ0KKyAgLSByZWcNCisgIC0gcmVnLW5hbWVzDQorICAtIGludGVycnVwdHMNCisgIC0g
Y2xvY2tzDQorICAtIGNsb2NrLW5hbWVzDQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
DQorDQorZXhhbXBsZXM6DQorICAtIHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2Nr
L210ODE3My1jbGsuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2FybS1naWMuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2lycS5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGh5L3BoeS5oPg0K
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvbXQ4MTczLXBvd2VyLmg+DQorDQorICAg
IHVzYjM6IHVzYkAxMTI3MDAwMCB7DQorICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE3My14aGNpIiwgIm1lZGlhdGVrLG10ay14aGNpIjsNCisgICAgICAgIHJlZyA9IDwweDExMjcw
MDAwIDB4MTAwMD4sIDwweDExMjgwNzAwIDB4MDEwMD47DQorICAgICAgICByZWctbmFtZXMgPSAi
bWFjIiwgImlwcGMiOw0KKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNSBJUlFfVFlQ
RV9MRVZFTF9MT1c+Ow0KKyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE3M19Q
T1dFUl9ET01BSU5fVVNCPjsNCisgICAgICAgIGNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9V
U0IzMF9TRUw+LCA8JmNsazI2bT47DQorICAgICAgICBjbG9jay1uYW1lcyA9ICJzeXNfY2siLCAi
cmVmX2NrIjsNCisgICAgICAgIHBoeXMgPSA8JnUzcG9ydDAgUEhZX1RZUEVfVVNCMz4sIDwmdTJw
b3J0MSBQSFlfVFlQRV9VU0IyPjsNCisgICAgICAgIHZ1c2IzMy1zdXBwbHkgPSA8Jm10NjM5N192
dXNiX3JlZz47DQorICAgICAgICB2YnVzLXN1cHBseSA9IDwmdXNiX3AxX3ZidXM+Ow0KKyAgICAg
ICAgaW1vZC1pbnRlcnZhbC1ucyA9IDwxMDAwMD47DQorICAgICAgICBtZWRpYXRlayxzeXNjb24t
d2FrZXVwID0gPCZwZXJpY2ZnIDB4NDAwIDE+Ow0KKyAgICAgICAgd2FrZXVwLXNvdXJjZTsNCisg
ICAgICAgIHVzYjMtbHBtLWNhcGFibGU7DQorICAgIH07DQorLi4uDQotLSANCjIuMTguMA0K

