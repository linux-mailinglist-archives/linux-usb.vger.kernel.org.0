Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDC528CA9F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 10:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404190AbgJMIw5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 04:52:57 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:55200 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404127AbgJMIwd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 04:52:33 -0400
X-UUID: 2fa52e5356474ce8bccb2e603a76ab2b-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1Dev3EYWtrIYsy1eSRPZuCs3F1H8Mjhi40scFT162aI=;
        b=nhWKOwOVbaqy70W81JFbzQYWBmZOzwtzkhxet8WLA+6xMQJnyDtVM+mDpkyW2aK+/RSJLQHmOU+6pcPt2TXWjN1dc90SBwW1Sfy3yfBllspkVDuf8GUrgb9Ae6HDPNLLh4xc8hrPP1U6bYFzJ5MDdUHgqbFoSp2ZjwxN97Lr0tY=;
X-UUID: 2fa52e5356474ce8bccb2e603a76ab2b-20201013
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 877043359; Tue, 13 Oct 2020 16:52:13 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 16:52:08 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Oct 2020 16:52:09 +0800
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
Subject: [PATCH v2 2/8] dt-bindings: phy: convert phy-mtk-tphy.txt to YAML schema
Date:   Tue, 13 Oct 2020 16:52:01 +0800
Message-ID: <20201013085207.17749-2-chunfeng.yun@mediatek.com>
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

Q29udmVydCBwaHktbXRrLXRwaHkudHh0IHRvIFlBTUwgc2NoZW1hIG1lZGlhdGVrLHRwaHkueWFt
bA0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5j
b20+DQotLS0NCnYyOiBtb2RpZnkgZGVzY3JpcHRpb24gYW5kIGNvbXBhdGlibGUNCi0tLQ0KIC4u
Li9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sICAgICAgICAgICB8IDI2MyArKysrKysr
KysrKysrKysrKysNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LW10ay10cGh5LnR4
dCAgfCAxNjIgLS0tLS0tLS0tLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDI2MyBpbnNlcnRpb25zKCsp
LCAxNjIgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNzU1IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssdHBoeS55YW1sDQogZGVsZXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LW10ay10cGh5LnR4
dA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9t
ZWRpYXRlayx0cGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5
L21lZGlhdGVrLHRwaHkueWFtbA0KbmV3IGZpbGUgbW9kZSAxMDA3NTUNCmluZGV4IDAwMDAwMDAw
MDAwMC4uNTZhZDhiZTY5MDk1DQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLHRwaHkueWFtbA0KQEAgLTAsMCArMSwyNjMg
QEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkNCisjIENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlaw0KKyVZQU1MIDEuMg0KKy0tLQ0K
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGh5L21lZGlhdGVrLHRwaHkueWFt
bCMNCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCisNCit0aXRsZTogTWVkaWFUZWsgVC1QSFkgQ29udHJvbGxlciBEZXZpY2UgVHJlZSBCaW5k
aW5ncw0KKw0KK21haW50YWluZXJzOg0KKyAgLSBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBt
ZWRpYXRlay5jb20+DQorDQorZGVzY3JpcHRpb246IHwNCisgIFRoZSBULVBIWSBjb250cm9sbGVy
IHN1cHBvcnRzIHBoeXNpY2FsIGxheWVyIGZ1bmN0aW9uYWxpdHkgZm9yIGEgbnVtYmVyIG9mDQor
ICBjb250cm9sbGVycyBvbiBNZWRpYVRlayBTb0NzLCBpbmNsdWRlcyBVU0IyLjAsIFVTQjMuMCwg
UENJZSBhbmQgU0FUQS4NCisNCisgIExheW91dCBkaWZmZXJlbmNlcyBvZiBiYW5rcyBiZXR3ZWVu
IFQtUEhZIFYxIChtdDgxNzMvbXQyNzAxKSBhbmQNCisgIFQtUEhZIFYyIChtdDI3MTIpIHdoZW4g
d29ya3Mgb24gVVNCIG1vZGU6DQorICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KKyAgVmVyc2lvbiAxOg0KKyAgcG9ydCAgICAgICAgb2Zmc2V0ICAgIGJhbmsNCisgIHNoYXJl
ZCAgICAgIDB4MDAwMCAgICBTUExMQw0KKyAgICAgICAgICAgICAgMHgwMTAwICAgIEZNUkVHDQor
ICB1MiBwb3J0MCAgICAweDA4MDAgICAgVTJQSFlfQ09NDQorICB1MyBwb3J0MCAgICAweDA5MDAg
ICAgVTNQSFlEDQorICAgICAgICAgICAgICAweDBhMDAgICAgVTNQSFlEX0JBTksyDQorICAgICAg
ICAgICAgICAweDBiMDAgICAgVTNQSFlBDQorICAgICAgICAgICAgICAweDBjMDAgICAgVTNQSFlB
X0RBDQorICB1MiBwb3J0MSAgICAweDEwMDAgICAgVTJQSFlfQ09NDQorICB1MyBwb3J0MSAgICAw
eDExMDAgICAgVTNQSFlEDQorICAgICAgICAgICAgICAweDEyMDAgICAgVTNQSFlEX0JBTksyDQor
ICAgICAgICAgICAgICAweDEzMDAgICAgVTNQSFlBDQorICAgICAgICAgICAgICAweDE0MDAgICAg
VTNQSFlBX0RBDQorICB1MiBwb3J0MiAgICAweDE4MDAgICAgVTJQSFlfQ09NDQorICAgICAgICAg
ICAgICAuLi4NCisNCisgIFZlcnNpb24gMjoNCisgIHBvcnQgICAgICAgIG9mZnNldCAgICBiYW5r
DQorICB1MiBwb3J0MCAgICAweDAwMDAgICAgTUlTQw0KKyAgICAgICAgICAgICAgMHgwMTAwICAg
IEZNUkVHDQorICAgICAgICAgICAgICAweDAzMDAgICAgVTJQSFlfQ09NDQorICB1MyBwb3J0MCAg
ICAweDA3MDAgICAgU1BMTEMNCisgICAgICAgICAgICAgIDB4MDgwMCAgICBDSElQDQorICAgICAg
ICAgICAgICAweDA5MDAgICAgVTNQSFlEDQorICAgICAgICAgICAgICAweDBhMDAgICAgVTNQSFlE
X0JBTksyDQorICAgICAgICAgICAgICAweDBiMDAgICAgVTNQSFlBDQorICAgICAgICAgICAgICAw
eDBjMDAgICAgVTNQSFlBX0RBDQorICB1MiBwb3J0MSAgICAweDEwMDAgICAgTUlTQw0KKyAgICAg
ICAgICAgICAgMHgxMTAwICAgIEZNUkVHDQorICAgICAgICAgICAgICAweDEzMDAgICAgVTJQSFlf
Q09NDQorICB1MyBwb3J0MSAgICAweDE3MDAgICAgU1BMTEMNCisgICAgICAgICAgICAgIDB4MTgw
MCAgICBDSElQDQorICAgICAgICAgICAgICAweDE5MDAgICAgVTNQSFlEDQorICAgICAgICAgICAg
ICAweDFhMDAgICAgVTNQSFlEX0JBTksyDQorICAgICAgICAgICAgICAweDFiMDAgICAgVTNQSFlB
DQorICAgICAgICAgICAgICAweDFjMDAgICAgVTNQSFlBX0RBDQorICB1MiBwb3J0MiAgICAweDIw
MDAgICAgTUlTQw0KKyAgICAgICAgICAgICAgLi4uDQorDQorICBTUExMQyBzaGFyZWQgYnkgdTMg
cG9ydHMgYW5kIEZNUkVHIHNoYXJlZCBieSB1MiBwb3J0cyBvbiBWMSBhcmUgcHV0IGJhY2sNCisg
IGludG8gZWFjaCBwb3J0OyBhIG5ldyBiYW5rIE1JU0MgZm9yIHUyIHBvcnRzIGFuZCBDSElQIGZv
ciB1MyBwb3J0cyBhcmUNCisgIGFkZGVkIG9uIFYyLg0KKw0KK3Byb3BlcnRpZXM6DQorICAkbm9k
ZW5hbWU6DQorICAgICBwYXR0ZXJuOiAiXnQtcGh5QFswLTlhLWZdKyQiDQorDQorICBjb21wYXRp
YmxlOg0KKyAgICBvbmVPZjoNCisgICAgICAtIGl0ZW1zOg0KKyAgICAgICAgICAtIGVudW06DQor
ICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10MjcwMS10cGh5DQorICAgICAgICAgICAgICAtIG1l
ZGlhdGVrLG10NzYyMy10cGh5DQorICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10NzYyMi10cGh5
DQorICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODUxNi10cGh5DQorICAgICAgICAgIC0gY29u
c3Q6IG1lZGlhdGVrLGdlbmVyaWMtdHBoeS12MQ0KKyAgICAgIC0gaXRlbXM6DQorICAgICAgICAg
IC0gZW51bToNCisgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQyNzEyLXRwaHkNCisgICAgICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ3NjI5LXRwaHkNCisgICAgICAgICAgICAgIC0gbWVkaWF0ZWss
bXQ4MTgzLXRwaHkNCisgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssZ2VuZXJpYy10cGh5LXYy
DQorICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQyNzAxLXUzcGh5DQorICAgICAgICBkZXByZWNh
dGVkOiB0cnVlDQorICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQyNzEyLXUzcGh5DQorICAgICAg
ICBkZXByZWNhdGVkOiB0cnVlDQorICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTczLXUzcGh5
DQorDQorICByZWc6DQorICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgUmVnaXN0ZXIgc2hhcmVk
IGJ5IG11bHRpcGxlIHBvcnRzLCBleGNsdWRlIHBvcnQncyBwcml2YXRlIHJlZ2lzdGVyLg0KKyAg
ICAgIEl0IGlzIG5lZWRlZCBmb3IgVC1QSFkgVjEsIHN1Y2ggYXMgbXQyNzAxIGFuZCBtdDgxNzMs
IGJ1dCBub3QgZm9yDQorICAgICAgVC1QSFkgVjIsIHN1Y2ggYXMgbXQyNzEyLg0KKyAgICBtYXhJ
dGVtczogMQ0KKw0KKyAgIiNhZGRyZXNzLWNlbGxzIjoNCisgICAgICBlbnVtOiBbMSwgMl0NCisN
CisgICIjc2l6ZS1jZWxscyI6DQorICAgICAgZW51bTogWzEsIDJdDQorDQorICAjIFVzZWQgd2l0
aCBub24tZW1wdHkgdmFsdWUgaWYgb3B0aW9uYWwgJ3JlZycgaXMgbm90IHByb3ZpZGVkLg0KKyAg
IyBUaGUgZm9ybWF0IG9mIHRoZSB2YWx1ZSBpcyBhbiBhcmJpdHJhcnkgbnVtYmVyIG9mIHRyaXBs
ZXRzIG9mDQorICAjIChjaGlsZC1idXMtYWRkcmVzcywgcGFyZW50LWJ1cy1hZGRyZXNzLCBsZW5n
dGgpLg0KKyAgcmFuZ2VzOiB0cnVlDQorDQorICBtZWRpYXRlayxzcmMtcmVmLWNsay1taHo6DQor
ICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIEZyZXF1ZW5jeSBvZiByZWZlcmVuY2UgY2xvY2sgZm9y
IHNsZXcgcmF0ZSBjYWxpYnJhdGUNCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyDQorICAgIGRlZmF1bHQ6IDI2DQorDQorICBtZWRpYXRlayxzcmMtY29l
ZjoNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgQ29lZmZpY2llbnQgZm9yIHNsZXcgcmF0ZSBj
YWxpYnJhdGUsIGRlcGVuZHMgb24gU29DIHByb2Nlc3MNCisgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQorICAgIGRlZmF1bHQ6IDI4DQorDQorIyBSZXF1
aXJlZCBjaGlsZCBub2RlOg0KK3BhdHRlcm5Qcm9wZXJ0aWVzOg0KKyAgIl51c2ItcGh5QFswLTlh
LWZdKyQiOg0KKyAgICB0eXBlOiBvYmplY3QNCisgICAgZGVzY3JpcHRpb246IHwNCisgICAgICBB
IHN1Yi1ub2RlIGlzIHJlcXVpcmVkIGZvciBlYWNoIHBvcnQgdGhlIGNvbnRyb2xsZXIgcHJvdmlk
ZXMuDQorICAgICAgQWRkcmVzcyByYW5nZSBpbmZvcm1hdGlvbiBpbmNsdWRpbmcgdGhlIHVzdWFs
ICdyZWcnIHByb3BlcnR5DQorICAgICAgaXMgdXNlZCBpbnNpZGUgdGhlc2Ugbm9kZXMgdG8gZGVz
Y3JpYmUgdGhlIGNvbnRyb2xsZXIncyB0b3BvbG9neS4NCisNCisgICAgcHJvcGVydGllczoNCisg
ICAgICByZWc6DQorICAgICAgICBtYXhJdGVtczogMQ0KKw0KKyAgICAgIGNsb2NrczoNCisgICAg
ICAgIG1pbkl0ZW1zOiAxDQorICAgICAgICBtYXhJdGVtczogMg0KKyAgICAgICAgaXRlbXM6DQor
ICAgICAgICAgIC0gZGVzY3JpcHRpb246IFJlZmVyZW5jZSBjbG9jaywgKEhTIGlzIDQ4TWh6LCBT
Uy9QIGlzIDI0fjI3TWh6KQ0KKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBSZWZlcmVuY2UgY2xv
Y2sgb2YgYW5hbG9nIHBoeQ0KKyAgICAgICAgZGVzY3JpcHRpb246IHwNCisgICAgICAgICAgVXNl
cyBib3RoIGNsb2NrcyBpZiB0aGUgY2xvY2sgb2YgYW5hbG9nIGFuZCBkaWdpdGFsIHBoeXMgYXJl
DQorICAgICAgICAgIHNlcGFyYXRlZCwgb3RoZXJ3aXNlIHVzZXMgInJlZiIgY2xvY2sgb25seSBp
ZiBuZWVkZWQuDQorDQorICAgICAgY2xvY2stbmFtZXM6DQorICAgICAgICBtaW5JdGVtczogMQ0K
KyAgICAgICAgbWF4SXRlbXM6IDINCisgICAgICAgIGl0ZW1zOg0KKyAgICAgICAgICAtIGNvbnN0
OiByZWYNCisgICAgICAgICAgLSBjb25zdDogZGFfcmVmDQorDQorICAgICAgIiNwaHktY2VsbHMi
Og0KKyAgICAgICAgY29uc3Q6IDENCisgICAgICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgICAg
IFRoZSBjZWxscyBjb250YWluIHRoZSBmb2xsb3dpbmcgYXJndW1lbnRzLg0KKw0KKyAgICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBUaGUgUEhZIHR5cGUNCisgICAgICAgICAgICAgIGVudW06DQorICAg
ICAgICAgICAgICAgIC0gUEhZX1RZUEVfVVNCMg0KKyAgICAgICAgICAgICAgICAtIFBIWV9UWVBF
X1VTQjMNCisgICAgICAgICAgICAgICAgLSBQSFlfVFlQRV9QQ0lFDQorICAgICAgICAgICAgICAg
IC0gUEhZX1RZUEVfU0FUQQ0KKw0KKyAgICAgICNUaGUgZm9sbG93aW5nIG9wdGlvbmFsIHZlbmRv
ciBwcm9wZXJ0aWVzIGFyZSBvbmx5IGZvciBkZWJ1ZyBvciBIUUEgdGVzdA0KKyAgICAgIG1lZGlh
dGVrLGV5ZS1zcmM6DQorICAgICAgICBkZXNjcmlwdGlvbjoNCisgICAgICAgICAgVGhlIHZhbHVl
IG9mIHNsZXcgcmF0ZSBjYWxpYnJhdGUgKFUyIHBoeSkNCisgICAgICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KKyAgICAgICAgbWluaW11bTogMQ0KKyAg
ICAgICAgbWF4aW11bTogNw0KKw0KKyAgICAgIG1lZGlhdGVrLGV5ZS12cnQ6DQorICAgICAgICBk
ZXNjcmlwdGlvbjoNCisgICAgICAgICAgVGhlIHNlbGVjdGlvbiBvZiBWUlQgcmVmZXJlbmNlIHZv
bHRhZ2UgKFUyIHBoeSkNCisgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMg0KKyAgICAgICAgbWluaW11bTogMQ0KKyAgICAgICAgbWF4aW11bTogNw0K
Kw0KKyAgICAgIG1lZGlhdGVrLGV5ZS10ZXJtOg0KKyAgICAgICAgZGVzY3JpcHRpb246DQorICAg
ICAgICAgIFRoZSBzZWxlY3Rpb24gb2YgSFNfVFggVEVSTSByZWZlcmVuY2Ugdm9sdGFnZSAoVTIg
cGh5KQ0KKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWlu
dDMyDQorICAgICAgICBtaW5pbXVtOiAxDQorICAgICAgICBtYXhpbXVtOiA3DQorDQorICAgICAg
bWVkaWF0ZWssaW50cjoNCisgICAgICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgICAgICBUaGUgc2Vs
ZWN0aW9uIG9mIGludGVybmFsIHJlc2lzdG9yIChVMiBwaHkpDQorICAgICAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCisgICAgICAgIG1pbmltdW06IDEN
CisgICAgICAgIG1heGltdW06IDMxDQorDQorICAgICAgbWVkaWF0ZWssZGlzY3RoOg0KKyAgICAg
ICAgZGVzY3JpcHRpb246DQorICAgICAgICAgIFRoZSBzZWxlY3Rpb24gb2YgZGlzY29ubmVjdCB0
aHJlc2hvbGQgKFUyIHBoeSkNCisgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3VpbnQzMg0KKyAgICAgICAgbWluaW11bTogMQ0KKyAgICAgICAgbWF4aW11bTog
MTUNCisNCisgICAgICBtZWRpYXRlayxiYzEyOg0KKyAgICAgICAgZGVzY3JpcHRpb246DQorICAg
ICAgICAgIFNwZWNpZnkgdGhlIGZsYWcgdG8gZW5hYmxlIEJDMS4yIGlmIHN1cHBvcnQgaXQNCisg
ICAgICAgIHR5cGU6IGJvb2xlYW4NCisNCisgICAgcmVxdWlyZWQ6DQorICAgICAgLSByZWcNCisg
ICAgICAtICIjcGh5LWNlbGxzIg0KKw0KKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UN
CisNCityZXF1aXJlZDoNCisgIC0gY29tcGF0aWJsZQ0KKyAgLSAiI2FkZHJlc3MtY2VsbHMiDQor
ICAtICIjc2l6ZS1jZWxscyINCisgIC0gcmFuZ2VzDQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2Nsb2NrL210ODE3My1jbGsuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2FybS1naWMuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2lycS5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGh5L3Bo
eS5oPg0KKyAgICBzdXNiOiB1c2JAMTEyNzEwMDAgew0KKyAgICAgICAgY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNzMtbXR1MyI7DQorICAgICAgICByZWcgPSA8MHgxMTI3MTAwMCAweDMwMDA+
LCA8MHgxMTI4MDcwMCAweDAxMDA+Ow0KKyAgICAgICAgcmVnLW5hbWVzID0gIm1hYyIsICJpcHBj
IjsNCisgICAgICAgIHBoeXMgPSA8JnUycG9ydDAgUEhZX1RZUEVfVVNCMj4sDQorICAgICAgICAg
ICAgICAgPCZ1M3BvcnQwIFBIWV9UWVBFX1VTQjM+LA0KKyAgICAgICAgICAgICAgIDwmdTJwb3J0
MSBQSFlfVFlQRV9VU0IyPjsNCisgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxMTUgSVJR
X1RZUEVfTEVWRUxfTE9XPjsNCisgICAgfTsNCisNCisgICAgdTNwaHk6IHQtcGh5QDExMjkwMDAw
IHsNCisgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLXUzcGh5IjsNCisgICAg
ICAgIHJlZyA9IDwweDExMjkwMDAwIDB4ODAwPjsNCisgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQorICAgICAgICByYW5nZXM7DQorICAg
ICAgICBzdGF0dXMgPSAib2theSI7DQorDQorICAgICAgICB1MnBvcnQwOiB1c2ItcGh5QDExMjkw
ODAwIHsNCisgICAgICAgICAgICByZWcgPSA8MHgxMTI5MDgwMCAweDEwMD47DQorICAgICAgICAg
ICAgY2xvY2tzID0gPCZhcG1peGVkc3lzIENMS19BUE1JWEVEX1JFRjJVU0JfVFg+LCA8JmNsazQ4
bT47DQorICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAicmVmIiwgImRhX3JlZiI7DQorICAgICAg
ICAgICAgI3BoeS1jZWxscyA9IDwxPjsNCisgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQor
ICAgICAgICB9Ow0KKw0KKyAgICAgICAgdTNwb3J0MDogdXNiLXBoeUAxMTI5MDkwMCB7DQorICAg
ICAgICAgICAgcmVnID0gPDB4MTEyOTA5MDAgMHg3MDA+Ow0KKyAgICAgICAgICAgIGNsb2NrcyA9
IDwmY2xrMjZtPjsNCisgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJyZWYiOw0KKyAgICAgICAg
ICAgICNwaHktY2VsbHMgPSA8MT47DQorICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKyAg
ICAgICAgfTsNCisNCisgICAgICAgIHUycG9ydDE6IHVzYi1waHlAMTEyOTEwMDAgew0KKyAgICAg
ICAgICAgIHJlZyA9IDwweDExMjkxMDAwIDB4MTAwPjsNCisgICAgICAgICAgICAjcGh5LWNlbGxz
ID0gPDE+Ow0KKyAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCisgICAgICAgIH07DQorICAg
IH07DQorDQorLi4uDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BoeS9waHktbXRrLXRwaHkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BoeS9waHktbXRrLXRwaHkudHh0DQpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4
IGRkNzViNjc2YjcxZC4uMDAwMDAwMDAwMDAwDQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L3BoeS1tdGstdHBoeS50eHQNCisrKyAvZGV2L251bGwNCkBAIC0xLDE2
MiArMCwwIEBADQotTWVkaWFUZWsgVC1QSFkgYmluZGluZw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQotDQotVC1waHkgY29udHJvbGxlciBzdXBwb3J0cyBwaHlzaWNhbCBsYXllciBmdW5j
dGlvbmFsaXR5IGZvciBhIG51bWJlciBvZg0KLWNvbnRyb2xsZXJzIG9uIE1lZGlhVGVrIFNvQ3Ms
IHN1Y2ggYXMsIFVTQjIuMCwgVVNCMy4wLCBQQ0llLCBhbmQgU0FUQS4NCi0NCi1SZXF1aXJlZCBw
cm9wZXJ0aWVzIChjb250cm9sbGVyIChwYXJlbnQpIG5vZGUpOg0KLSAtIGNvbXBhdGlibGUJOiBz
aG91bGQgYmUgb25lIG9mDQotCQkgICJtZWRpYXRlayxnZW5lcmljLXRwaHktdjEiDQotCQkgICJt
ZWRpYXRlayxnZW5lcmljLXRwaHktdjIiDQotCQkgICJtZWRpYXRlayxtdDI3MDEtdTNwaHkiIChk
ZXByZWNhdGVkKQ0KLQkJICAibWVkaWF0ZWssbXQyNzEyLXUzcGh5IiAoZGVwcmVjYXRlZCkNCi0J
CSAgIm1lZGlhdGVrLG10ODE3My11M3BoeSI7DQotCQkgIG1ha2UgdXNlIG9mICJtZWRpYXRlayxn
ZW5lcmljLXRwaHktdjEiIG9uIG10MjcwMSBpbnN0ZWFkIGFuZA0KLQkJICAibWVkaWF0ZWssZ2Vu
ZXJpYy10cGh5LXYyIiBvbiBtdDI3MTIgaW5zdGVhZC4NCi0NCi0tICNhZGRyZXNzLWNlbGxzOgl0
aGUgbnVtYmVyIG9mIGNlbGxzIHVzZWQgdG8gcmVwcmVzZW50IHBoeXNpY2FsDQotCQliYXNlIGFk
ZHJlc3Nlcy4NCi0tICNzaXplLWNlbGxzOgl0aGUgbnVtYmVyIG9mIGNlbGxzIHVzZWQgdG8gcmVw
cmVzZW50IHRoZSBzaXplIG9mIGFuIGFkZHJlc3MuDQotLSByYW5nZXM6CXRoZSBhZGRyZXNzIG1h
cHBpbmcgcmVsYXRpb25zaGlwIHRvIHRoZSBwYXJlbnQsIGRlZmluZWQgd2l0aA0KLQkJLSBlbXB0
eSB2YWx1ZTogaWYgb3B0aW9uYWwgJ3JlZycgaXMgdXNlZC4NCi0JCS0gbm9uLWVtcHR5IHZhbHVl
OiBpZiBvcHRpb25hbCAncmVnJyBpcyBub3QgdXNlZC4gc2hvdWxkIHNldA0KLQkJCXRoZSBjaGls
ZCdzIGJhc2UgYWRkcmVzcyB0byAwLCB0aGUgcGh5c2ljYWwgYWRkcmVzcw0KLQkJCXdpdGhpbiBw
YXJlbnQncyBhZGRyZXNzIHNwYWNlLCBhbmQgdGhlIGxlbmd0aCBvZg0KLQkJCXRoZSBhZGRyZXNz
IG1hcC4NCi0NCi1SZXF1aXJlZCBub2Rlcwk6IGEgc3ViLW5vZGUgaXMgcmVxdWlyZWQgZm9yIGVh
Y2ggcG9ydCB0aGUgY29udHJvbGxlcg0KLQkJICBwcm92aWRlcy4gQWRkcmVzcyByYW5nZSBpbmZv
cm1hdGlvbiBpbmNsdWRpbmcgdGhlIHVzdWFsDQotCQkgICdyZWcnIHByb3BlcnR5IGlzIHVzZWQg
aW5zaWRlIHRoZXNlIG5vZGVzIHRvIGRlc2NyaWJlDQotCQkgIHRoZSBjb250cm9sbGVyJ3MgdG9w
b2xvZ3kuDQotDQotT3B0aW9uYWwgcHJvcGVydGllcyAoY29udHJvbGxlciAocGFyZW50KSBub2Rl
KToNCi0gLSByZWcJCTogb2Zmc2V0IGFuZCBsZW5ndGggb2YgcmVnaXN0ZXIgc2hhcmVkIGJ5IG11
bHRpcGxlIHBvcnRzLA0KLQkJICBleGNsdWRlIHBvcnQncyBwcml2YXRlIHJlZ2lzdGVyLiBJdCBp
cyBuZWVkZWQgb24gbXQyNzAxDQotCQkgIGFuZCBtdDgxNzMsIGJ1dCBub3Qgb24gbXQyNzEyLg0K
LSAtIG1lZGlhdGVrLHNyYy1yZWYtY2xrLW1oegk6IGZyZXF1ZW5jeSBvZiByZWZlcmVuY2UgY2xv
Y2sgZm9yIHNsZXcgcmF0ZQ0KLQkJICBjYWxpYnJhdGUNCi0gLSBtZWRpYXRlayxzcmMtY29lZgk6
IGNvZWZmaWNpZW50IGZvciBzbGV3IHJhdGUgY2FsaWJyYXRlLCBkZXBlbmRzIG9uDQotCQkgIFNv
QyBwcm9jZXNzDQotDQotUmVxdWlyZWQgcHJvcGVydGllcyAocG9ydCAoY2hpbGQpIG5vZGUpOg0K
LS0gcmVnCQk6IGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0IGZvciB0aGUg
cG9ydC4NCi0tICNwaHktY2VsbHMJOiBzaG91bGQgYmUgMSAoU2VlIHNlY29uZCBleGFtcGxlKQ0K
LQkJICBjZWxsIGFmdGVyIHBvcnQgcGhhbmRsZSBpcyBwaHkgdHlwZSBmcm9tOg0KLQkJCS0gUEhZ
X1RZUEVfVVNCMg0KLQkJCS0gUEhZX1RZUEVfVVNCMw0KLQkJCS0gUEhZX1RZUEVfUENJRQ0KLQkJ
CS0gUEhZX1RZUEVfU0FUQQ0KLQ0KLU9wdGlvbmFsIHByb3BlcnRpZXMgKFBIWV9UWVBFX1VTQjIg
cG9ydCAoY2hpbGQpIG5vZGUpOg0KLS0gY2xvY2tzCTogYSBsaXN0IG9mIHBoYW5kbGUgKyBjbG9j
ay1zcGVjaWZpZXIgcGFpcnMsIG9uZSBmb3IgZWFjaA0KLQkJICBlbnRyeSBpbiBjbG9jay1uYW1l
cw0KLS0gY2xvY2stbmFtZXMJOiBtYXkgY29udGFpbg0KLQkJICAicmVmIjogNDhNIHJlZmVyZW5j
ZSBjbG9jayBmb3IgSGlnaFNwZWVkIChkaWdpdGFsKSBwaHk7IGFuZCAyNk0NCi0JCQlyZWZlcmVu
Y2UgY2xvY2sgZm9yIFN1cGVyU3BlZWQgKGRpZ2l0YWwpIHBoeSwgc29tZXRpbWVzIGlzDQotCQkJ
MjRNLCAyNU0gb3IgMjdNLCBkZXBlbmRlZCBvbiBwbGF0Zm9ybS4NCi0JCSAgImRhX3JlZiI6IHRo
ZSByZWZlcmVuY2UgY2xvY2sgb2YgYW5hbG9nIHBoeSwgdXNlZCBpZiB0aGUgY2xvY2tzDQotCQkJ
b2YgYW5hbG9nIGFuZCBkaWdpdGFsIHBoeXMgYXJlIHNlcGFyYXRlZCwgb3RoZXJ3aXNlIHVzZXMN
Ci0JCQkicmVmIiBjbG9jayBvbmx5IGlmIG5lZWRlZC4NCi0NCi0tIG1lZGlhdGVrLGV5ZS1zcmMJ
OiB1MzIsIHRoZSB2YWx1ZSBvZiBzbGV3IHJhdGUgY2FsaWJyYXRlDQotLSBtZWRpYXRlayxleWUt
dnJ0CTogdTMyLCB0aGUgc2VsZWN0aW9uIG9mIFZSVCByZWZlcmVuY2Ugdm9sdGFnZQ0KLS0gbWVk
aWF0ZWssZXllLXRlcm0JOiB1MzIsIHRoZSBzZWxlY3Rpb24gb2YgSFNfVFggVEVSTSByZWZlcmVu
Y2Ugdm9sdGFnZQ0KLS0gbWVkaWF0ZWssYmMxMgk6IGJvb2wsIGVuYWJsZSBCQzEyIG9mIHUycGh5
IGlmIHN1cHBvcnQgaXQNCi0tIG1lZGlhdGVrLGRpc2N0aAk6IHUzMiwgdGhlIHNlbGVjdGlvbiBv
ZiBkaXNjb25uZWN0IHRocmVzaG9sZA0KLS0gbWVkaWF0ZWssaW50cgk6IHUzMiwgdGhlIHNlbGVj
dGlvbiBvZiBpbnRlcm5hbCBSIChyZXNpc3RhbmNlKQ0KLQ0KLUV4YW1wbGU6DQotDQotdTNwaHk6
IHVzYi1waHlAMTEyOTAwMDAgew0KLQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My11M3Bo
eSI7DQotCXJlZyA9IDwwIDB4MTEyOTAwMDAgMCAweDgwMD47DQotCSNhZGRyZXNzLWNlbGxzID0g
PDI+Ow0KLQkjc2l6ZS1jZWxscyA9IDwyPjsNCi0JcmFuZ2VzOw0KLQ0KLQl1MnBvcnQwOiB1c2It
cGh5QDExMjkwODAwIHsNCi0JCXJlZyA9IDwwIDB4MTEyOTA4MDAgMCAweDEwMD47DQotCQljbG9j
a3MgPSA8JmFwbWl4ZWRzeXMgQ0xLX0FQTUlYRURfUkVGMlVTQl9UWD47DQotCQljbG9jay1uYW1l
cyA9ICJyZWYiOw0KLQkJI3BoeS1jZWxscyA9IDwxPjsNCi0JfTsNCi0NCi0JdTNwb3J0MDogdXNi
LXBoeUAxMTI5MDkwMCB7DQotCQlyZWcgPSA8MCAweDExMjkwODAwIDAgMHg3MDA+Ow0KLQkJY2xv
Y2tzID0gPCZjbGsyNm0+Ow0KLQkJY2xvY2stbmFtZXMgPSAicmVmIjsNCi0JCSNwaHktY2VsbHMg
PSA8MT47DQotCX07DQotDQotCXUycG9ydDE6IHVzYi1waHlAMTEyOTEwMDAgew0KLQkJcmVnID0g
PDAgMHgxMTI5MTAwMCAwIDB4MTAwPjsNCi0JCWNsb2NrcyA9IDwmYXBtaXhlZHN5cyBDTEtfQVBN
SVhFRF9SRUYyVVNCX1RYPjsNCi0JCWNsb2NrLW5hbWVzID0gInJlZiI7DQotCQkjcGh5LWNlbGxz
ID0gPDE+Ow0KLQl9Ow0KLX07DQotDQotU3BlY2lmeWluZyBwaHkgY29udHJvbCBvZiBkZXZpY2Vz
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQotDQotRGV2aWNlIG5vZGVzIHNo
b3VsZCBzcGVjaWZ5IHRoZSBjb25maWd1cmF0aW9uIHJlcXVpcmVkIGluIHRoZWlyICJwaHlzIg0K
LXByb3BlcnR5LCBjb250YWluaW5nIGEgcGhhbmRsZSB0byB0aGUgcGh5IHBvcnQgbm9kZSBhbmQg
YSBkZXZpY2UgdHlwZTsNCi1waHktbmFtZXMgZm9yIGVhY2ggcG9ydCBhcmUgb3B0aW9uYWwuDQot
DQotRXhhbXBsZToNCi0NCi0jaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGh5L3BoeS5oPg0KLQ0KLXVz
YjMwOiB1c2JAMTEyNzAwMDAgew0KLQkuLi4NCi0JcGh5cyA9IDwmdTJwb3J0MCBQSFlfVFlQRV9V
U0IyPiwgPCZ1M3BvcnQwIFBIWV9UWVBFX1VTQjM+Ow0KLQlwaHktbmFtZXMgPSAidXNiMi0wIiwg
InVzYjMtMCI7DQotCS4uLg0KLX07DQotDQotDQotTGF5b3V0IGRpZmZlcmVuY2VzIG9mIGJhbmtz
IGJldHdlZW4gbXQ4MTczL210MjcwMSBhbmQgbXQyNzEyDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KLW10ODE3MyBhbmQgbXQy
NzAxOg0KLXBvcnQgICAgICAgIG9mZnNldCAgICBiYW5rDQotc2hhcmVkICAgICAgMHgwMDAwICAg
IFNQTExDDQotICAgICAgICAgICAgMHgwMTAwICAgIEZNUkVHDQotdTIgcG9ydDAgICAgMHgwODAw
ICAgIFUyUEhZX0NPTQ0KLXUzIHBvcnQwICAgIDB4MDkwMCAgICBVM1BIWUQNCi0gICAgICAgICAg
ICAweDBhMDAgICAgVTNQSFlEX0JBTksyDQotICAgICAgICAgICAgMHgwYjAwICAgIFUzUEhZQQ0K
LSAgICAgICAgICAgIDB4MGMwMCAgICBVM1BIWUFfREENCi11MiBwb3J0MSAgICAweDEwMDAgICAg
VTJQSFlfQ09NDQotdTMgcG9ydDEgICAgMHgxMTAwICAgIFUzUEhZRA0KLSAgICAgICAgICAgIDB4
MTIwMCAgICBVM1BIWURfQkFOSzINCi0gICAgICAgICAgICAweDEzMDAgICAgVTNQSFlBDQotICAg
ICAgICAgICAgMHgxNDAwICAgIFUzUEhZQV9EQQ0KLXUyIHBvcnQyICAgIDB4MTgwMCAgICBVMlBI
WV9DT00NCi0gICAgICAgICAgICAuLi4NCi0NCi1tdDI3MTI6DQotcG9ydCAgICAgICAgb2Zmc2V0
ICAgIGJhbmsNCi11MiBwb3J0MCAgICAweDAwMDAgICAgTUlTQw0KLSAgICAgICAgICAgIDB4MDEw
MCAgICBGTVJFRw0KLSAgICAgICAgICAgIDB4MDMwMCAgICBVMlBIWV9DT00NCi11MyBwb3J0MCAg
ICAweDA3MDAgICAgU1BMTEMNCi0gICAgICAgICAgICAweDA4MDAgICAgQ0hJUA0KLSAgICAgICAg
ICAgIDB4MDkwMCAgICBVM1BIWUQNCi0gICAgICAgICAgICAweDBhMDAgICAgVTNQSFlEX0JBTksy
DQotICAgICAgICAgICAgMHgwYjAwICAgIFUzUEhZQQ0KLSAgICAgICAgICAgIDB4MGMwMCAgICBV
M1BIWUFfREENCi11MiBwb3J0MSAgICAweDEwMDAgICAgTUlTQw0KLSAgICAgICAgICAgIDB4MTEw
MCAgICBGTVJFRw0KLSAgICAgICAgICAgIDB4MTMwMCAgICBVMlBIWV9DT00NCi11MyBwb3J0MSAg
ICAweDE3MDAgICAgU1BMTEMNCi0gICAgICAgICAgICAweDE4MDAgICAgQ0hJUA0KLSAgICAgICAg
ICAgIDB4MTkwMCAgICBVM1BIWUQNCi0gICAgICAgICAgICAweDFhMDAgICAgVTNQSFlEX0JBTksy
DQotICAgICAgICAgICAgMHgxYjAwICAgIFUzUEhZQQ0KLSAgICAgICAgICAgIDB4MWMwMCAgICBV
M1BIWUFfREENCi11MiBwb3J0MiAgICAweDIwMDAgICAgTUlTQw0KLSAgICAgICAgICAgIC4uLg0K
LQ0KLSAgICBTUExMQyBzaGFyZWQgYnkgdTMgcG9ydHMgYW5kIEZNUkVHIHNoYXJlZCBieSB1MiBw
b3J0cyBvbg0KLW10ODE3My9tdDI3MDEgYXJlIHB1dCBiYWNrIGludG8gZWFjaCBwb3J0OyBhIG5l
dyBiYW5rIE1JU0MgZm9yDQotdTIgcG9ydHMgYW5kIENISVAgZm9yIHUzIHBvcnRzIGFyZSBhZGRl
ZCBvbiBtdDI3MTIuDQotLSANCjIuMTguMA0K

