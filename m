Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E57E25B94E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 05:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgICDgQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 23:36:16 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:35231 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726776AbgICDgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 23:36:16 -0400
X-UUID: 9dde8453235a47dbb3bd719c30bca2d7-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=G+l2nCRr0+/8nka2nngFFVIR8XrakSr3N56sAqsrVVs=;
        b=TgxVzL42IyHDk+MKrBWupj9Z4pNFzKtA0nv2MlJflitamZPzpL42OfwvDtF/XZSAbSMTlFNEtGD+Ha/VfaBlNif79KHVfPbIXxIz+Eccm90kQrQ1ruInxUPD8ZC9bqiGnOE7IdAXF653GzsTJ+lyKgl89ZyfShmURGRJAsTvyCI=;
X-UUID: 9dde8453235a47dbb3bd719c30bca2d7-20200903
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 61005348; Thu, 03 Sep 2020 11:36:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:36:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 11:36:09 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Zhanyong Wang <zhanyong.wang@mediatek.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [RFC PATCH 4/4] arm64: dts: mt8192: add SSUSB related nodes
Date:   Thu, 3 Sep 2020 11:34:25 +0800
Message-ID: <1599104065-8009-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3A3E419C5DC6D5207B72190C999188292D90C9DBD895924E68040D78088BB0772000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogWmhhbnlvbmcgV2FuZyA8emhhbnlvbmcud2FuZ0BtZWRpYXRlay5jb20+DQoNCkFkZCBT
U1VTQiByZWxhdGVkIG5vZGVzIGZvciBtdDgxOTINCg0KU2lnbmVkLW9mZi1ieTogWmhhbnlvbmcg
V2FuZyA8emhhbnlvbmcud2FuZ0BtZWRpYXRlay5jb20+DQpTaWduZWQtb2ZmLWJ5OiBDaHVuZmVu
ZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCkRlcGVuZHMgb246DQpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNzEzNTU5Lw0KW3Y0LDEvM10gYXJtNjQ6
IGR0czogQWRkIE1lZGlhdGVrIFNvQyBNVDgxOTIgYW5kIGV2YWx1YXRpb24gYm9hcmQgZHRzIGFu
ZCBNYWtlZmlsZQ0KLS0tDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRz
aSB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQs
IDQ4IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5k
dHNpDQppbmRleCA4ODcxYzJmLi43NTVmMTUyIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTIuZHRzaQ0KQEAgLTQzNCw2ICs0MzQsNTQgQEANCiAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOw0KIAkJfTsNCiANCisJCXhoY2k6IHhoY2lAMTEyMDAwMDAgew0KKwkJCWNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTkyLXhoY2kiLA0KKwkJCQkgICAgICJtZWRpYXRlayxtdGsteGhj
aSI7DQorCQkJcmVnID0gPDAgMHgxMTIwMDAwMCAwIDB4MTAwMD4sDQorCQkJICAgICAgPDAgMHgx
MTIwM2UwMCAwIDB4MDEwMD47DQorCQkJcmVnLW5hbWVzID0gIm1hYyIsICJpcHBjIjsNCisJCQlp
bnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZnaWMgR0lDX1NQSSA5NyBJUlFfVFlQRV9MRVZFTF9ISUdI
IDA+LA0KKwkJCQkJICAgICAgPCZwaW8gMjExIElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQkJcGh5
cyA9IDwmdTJwb3J0MCBQSFlfVFlQRV9VU0IyPiwNCisJCQkgICAgICAgPCZ1M3BvcnQwIFBIWV9U
WVBFX1VTQjM+Ow0KKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9VU0Jf
VE9QX1NFTD4sDQorCQkJCQkgIDwmdG9wY2tnZW4gQ0xLX1RPUF9TU1VTQl9YSENJX1NFTD47DQor
CQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9VTklWUExMX0Q1
X0Q0PiwNCisJCQkJCQkgPCZ0b3Bja2dlbiBDTEtfVE9QX1VOSVZQTExfRDVfRDQ+Ow0KKwkJCWNs
b2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1NTVVNCPiwNCisJCQkJIDwmaW5mcmFjZmcgQ0xL
X0lORlJBX1NTVVNCX1hIQ0k+LA0KKwkJCQkgPCZhcG1peGVkc3lzIENMS19BUE1JWEVEX1VTQlBM
TD47DQorCQkJY2xvY2stbmFtZXMgPSAic3lzX2NrIiwgInhoY2lfY2siLCAicmVmX2NrIjsNCisJ
CQltZWRpYXRlayxzeXNjb24td2FrZXVwID0gPCZwZXJpY2ZnIDB4NDIwIDM+Ow0KKwkJCSNhZGRy
ZXNzLWNlbGxzID0gPDI+Ow0KKwkJCSNzaXplLWNlbGxzID0gPDI+Ow0KKwkJfTsNCisNCisJCXUz
cGh5MDogdXNiLXBoeUAxMWU0MDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
OTItdHBoeSIsDQorCQkJCSAgICAgIm1lZGlhdGVrLGdlbmVyaWMtdHBoeS12MiI7DQorCQkJI2Fk
ZHJlc3MtY2VsbHMgPSA8Mj47DQorCQkJI3NpemUtY2VsbHMgPSA8Mj47DQorCQkJcmFuZ2VzOw0K
KwkJCXN0YXR1cyA9ICJva2F5IjsNCisNCisJCQl1MnBvcnQwOiB1c2ItcGh5QDExZTQwMDAwIHsN
CisJCQkJcmVnID0gPDAgMHgxMWU0MDAwMCAwIDB4NzAwPjsNCisJCQkJY2xvY2tzID0gPCZjbGsy
Nm0+Ow0KKwkJCQljbG9jay1uYW1lcyA9ICJyZWYiOw0KKwkJCQkjcGh5LWNlbGxzID0gPDE+Ow0K
KwkJCQlzdGF0dXMgPSAib2theSI7DQorCQkJfTsNCisNCisJCQl1M3BvcnQwOiB1c2ItcGh5QDEx
ZTQwNzAwIHsNCisJCQkJcmVnID0gPDAgMHgxMWU0MDcwMCAwIDB4OTAwPjsNCisJCQkJY2xvY2tz
ID0gPCZjbGsyNm0+Ow0KKwkJCQljbG9jay1uYW1lcyA9ICJyZWYiOw0KKwkJCQkjcGh5LWNlbGxz
ID0gPDE+Ow0KKwkJCQlzdGF0dXMgPSAib2theSI7DQorCQkJfTsNCisJCX07DQorDQogCQlhdWRz
eXM6IHN5c2NvbkAxMTIxMDAwMCB7DQogCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTIt
YXVkc3lzIiwgInN5c2NvbiI7DQogCQkJcmVnID0gPDAgMHgxMTIxMDAwMCAwIDB4MTAwMD47DQot
LSANCjEuOS4xDQo=

