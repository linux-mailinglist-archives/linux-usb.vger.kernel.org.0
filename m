Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6651325B93E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 05:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgICDba (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 23:31:30 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:20031 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726776AbgICDb2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 23:31:28 -0400
X-UUID: 4359d6f45e5e4deca48d946b846566f7-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l3EbkQdRiEbnD4eo5ajOcZQMO9Q+g+tkG31DY7MaqFw=;
        b=FffztwOYLryYV1Vq/dAMIIwDcdrJGyG7luRROUF+Xt88tmQX+3jVkywN9c9B7JCx4Synl3ZZbgnTeqYWdo/Ls1ofPPFV3btM1MZT/ilNXFAPvig6kuFPPpv4BzuE7LmW4ebc1KXEsvvcxACy4v/y+8IcNXRTQcVYcXRSBOaE8Cg=;
X-UUID: 4359d6f45e5e4deca48d946b846566f7-20200903
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1882016549; Thu, 03 Sep 2020 11:31:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:31:14 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 11:31:14 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Zhanyong Wang <zhanyong.wang@mediatek.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Yaqii Wu <yaqii.wu@mediatek.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [RFC PATCH 1/4] usb: xhci-mtk: improve bandwidth scheduling with multi-TT
Date:   Thu, 3 Sep 2020 11:28:56 +0800
Message-ID: <1599103739-7873-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3D133A1F43B1CBBF7B1690D57DB5E46500CA11DE79EDFE7DC8771C4CA5147A0A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RnJvbTogWmhhbnlvbmcgV2FuZyA8emhhbnlvbmcud2FuZ0BtZWRpYXRlay5jb20+DQoNCkFmdGVy
IGluc2VydGVkIHRoZSB1c2IgdHlwZS1jIDMuNW1tIGRvbmdsZSB3aXRoIGhlYWRzZXQsIGRtZXNn
IHNob3dlZDoNCnVzYiAxLTEuMTogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgNSB1
c2luZyB4aGNpLW10aw0KdXNiIDEtMS4xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9
MDVhYywgaWRQcm9kdWN0PTExMGEsIGJjZERldmljZT0yNi4xMQ0KdXNiIDEtMS4xOiBOZXcgVVNC
IGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KdXNiIDEt
MS4xOiBQcm9kdWN0OiBVU0ItQyB0byAzLjVtbSBIZWFkcGhvbmUgSmFjayBBZGFwdGVyDQp1c2Ig
MS0xLjE6IE1hbnVmYWN0dXJlcjogQXBwbGUsIEluYy4NCnVzYiAxLTEuMTogU2VyaWFsTnVtYmVy
OiBEV0g5MTU1MDFURkpLTFRBTQ0KeGhjaS1tdGsgMTEyMDAwMDAueGhjaTogTm90IGVub3VnaCBi
YW5kd2lkdGghDQp1c2IgMS0xLjE6IGNhbid0IHNldCBjb25maWcgIzIsIGVycm9yIC0yOA0KDQpp
bXByb3ZlIGxvdy1zcGVlZC9mdWxsLXNwZWVkIElOVC9JU09DIGJhbmR3aWR0aCBzY2hlZHVsaW5n
IHdpdGggVVNCDQptdWxpLVRULg0KDQpTaWduZWQtb2ZmLWJ5OiBZYXFpaSBXdSA8eWFxaWkud3VA
bWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5A
bWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay1zY2guYyB8IDkx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQogZHJpdmVycy91c2Iv
aG9zdC94aGNpLW10ay5oICAgICB8ICA4ICsrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDg0IGluc2Vy
dGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMDA3NTUg
ZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay1zY2guYw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvaG9zdC94aGNpLW10ay1zY2guYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGstc2NoLmMN
Cm9sZCBtb2RlIDEwMDY0NA0KbmV3IG1vZGUgMTAwNzU1DQppbmRleCA0NWM1NGQ1Ni4uOTQyOTJi
OQ0KLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay1zY2guYw0KKysrIGIvZHJpdmVycy91
c2IvaG9zdC94aGNpLW10ay1zY2guYw0KQEAgLTM4Myw3ICszODMsOSBAQCBzdGF0aWMgaW50IGNo
ZWNrX3NjaF90dChzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwNCiAJdTMyIGZzX2J1ZGdldF9zdGFy
dDsNCiAJdTMyIHN0YXJ0X3NzLCBsYXN0X3NzOw0KIAl1MzIgc3RhcnRfY3MsIGxhc3RfY3M7DQot
CWludCBpOw0KKwl1MzIgbnVtX2VzaXQsIGJhc2U7DQorCWludCBpLCBqOw0KKwl1MzIgdG1wOw0K
IA0KIAlzdGFydF9zcyA9IG9mZnNldCAlIDg7DQogCWZzX2J1ZGdldF9zdGFydCA9IChzdGFydF9z
cyArIDEpICUgODsNCkBAIC0zOTgsMTAgKzQwMCwxMyBAQCBzdGF0aWMgaW50IGNoZWNrX3NjaF90
dChzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwNCiAJCWlmICghKHN0YXJ0X3NzID09IDcgfHwgbGFz
dF9zcyA8IDYpKQ0KIAkJCXJldHVybiAtRVJBTkdFOw0KIA0KLQkJZm9yIChpID0gMDsgaSA8IHNj
aF9lcC0+Y3NfY291bnQ7IGkrKykNCi0JCQlpZiAodGVzdF9iaXQob2Zmc2V0ICsgaSwgdHQtPnNw
bGl0X2JpdF9tYXApKQ0KKwkJZm9yIChpID0gMDsgaSA8IHNjaF9lcC0+Y3NfY291bnQ7IGkrKykg
ew0KKwkJCWlmICh0ZXN0X2JpdChvZmZzZXQgKyBpLCB0dC0+c3NfYml0X21hcCkpDQogCQkJCXJl
dHVybiAtRVJBTkdFOw0KIA0KKwkJCWlmICh0ZXN0X2JpdChvZmZzZXQgKyBpLCB0dC0+Y3NfYml0
X21hcCkpDQorCQkJCXJldHVybiAtRVJBTkdFOw0KKwkJfQ0KIAl9IGVsc2Ugew0KIAkJdTMyIGNz
X2NvdW50ID0gRElWX1JPVU5EX1VQKHNjaF9lcC0+bWF4cGt0LCBGU19QQVlMT0FEX01BWCk7DQog
DQpAQCAtNDI4LDggKzQzMywxMCBAQCBzdGF0aWMgaW50IGNoZWNrX3NjaF90dChzdHJ1Y3QgdXNi
X2RldmljZSAqdWRldiwNCiAJCWlmIChjc19jb3VudCA+IDcpDQogCQkJY3NfY291bnQgPSA3OyAv
KiBIVyBsaW1pdCAqLw0KIA0KLQkJZm9yIChpID0gMDsgaSA8IGNzX2NvdW50ICsgMjsgaSsrKSB7
DQotCQkJaWYgKHRlc3RfYml0KG9mZnNldCArIGksIHR0LT5zcGxpdF9iaXRfbWFwKSkNCisJCWlm
ICh0ZXN0X2JpdChvZmZzZXQsIHR0LT5zc19iaXRfbWFwKSkNCisJCQlyZXR1cm4gLUVSQU5HRTsN
CisJCWZvciAoaSA9IDA7IGkgPCBjc19jb3VudDsgaSsrKSB7DQorCQkJaWYgKHRlc3RfYml0KG9m
ZnNldCArIDIgKyBpLCB0dC0+Y3NfYml0X21hcCkpDQogCQkJCXJldHVybiAtRVJBTkdFOw0KIAkJ
fQ0KIA0KQEAgLTQ0NSwxMSArNDUyLDIyIEBAIHN0YXRpYyBpbnQgY2hlY2tfc2NoX3R0KHN0cnVj
dCB1c2JfZGV2aWNlICp1ZGV2LA0KIAkJCXNjaF9lcC0+bnVtX2J1ZGdldF9taWNyb2ZyYW1lcyA9
IHNjaF9lcC0+ZXNpdDsNCiAJfQ0KIA0KKwludW1fZXNpdCA9IFhIQ0lfTVRLX01BWF9FU0lUIC8g
c2NoX2VwLT5lc2l0Ow0KKwlmb3IgKGkgPSAwOyBpIDwgbnVtX2VzaXQ7IGkrKykgew0KKwkJYmFz
ZSA9IHNjaF9lcC0+b2Zmc2V0ICsgaSAqIHNjaF9lcC0+ZXNpdDsNCisJCWZvciAoaiA9IDA7IGog
PCBzY2hfZXAtPm51bV9idWRnZXRfbWljcm9mcmFtZXM7IGorKykgew0KKwkJCXRtcCA9IHR0LT5m
c19idXNfYndbYmFzZSArIGpdDQorCQkJICAgICAgKyBzY2hfZXAtPmJ3X2Nvc3RfcGVyX21pY3Jv
ZnJhbWU7DQorCQkJaWYgKHRtcCA+IEZTX1BBWUxPQURfTUFYKQ0KKwkJCQlyZXR1cm4gLUVSQU5H
RTsNCisJCX0NCisJfQ0KKw0KIAlyZXR1cm4gMDsNCiB9DQogDQogc3RhdGljIHZvaWQgdXBkYXRl
X3NjaF90dChzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwNCi0Jc3RydWN0IG11M2hfc2NoX2VwX2lu
Zm8gKnNjaF9lcCkNCisJc3RydWN0IG11M2hfc2NoX2VwX2luZm8gKnNjaF9lcCwgYm9vbCB1c2Vk
KQ0KIHsNCiAJc3RydWN0IG11M2hfc2NoX3R0ICp0dCA9IHNjaF9lcC0+c2NoX3R0Ow0KIAl1MzIg
YmFzZSwgbnVtX2VzaXQ7DQpAQCAtNDU4LDExICs0NzYsNTIgQEAgc3RhdGljIHZvaWQgdXBkYXRl
X3NjaF90dChzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwNCiAJbnVtX2VzaXQgPSBYSENJX01US19N
QVhfRVNJVCAvIHNjaF9lcC0+ZXNpdDsNCiAJZm9yIChpID0gMDsgaSA8IG51bV9lc2l0OyBpKysp
IHsNCiAJCWJhc2UgPSBzY2hfZXAtPm9mZnNldCArIGkgKiBzY2hfZXAtPmVzaXQ7DQotCQlmb3Ig
KGogPSAwOyBqIDwgc2NoX2VwLT5udW1fYnVkZ2V0X21pY3JvZnJhbWVzOyBqKyspDQotCQkJc2V0
X2JpdChiYXNlICsgaiwgdHQtPnNwbGl0X2JpdF9tYXApOw0KKwkJZm9yIChqID0gMDsgaiA8IHNj
aF9lcC0+bnVtX2J1ZGdldF9taWNyb2ZyYW1lczsgaisrKSB7DQorCQkJaWYgKHVzZWQpDQorCQkJ
CXNldF9iaXQoYmFzZSArIGosIHR0LT5zcGxpdF9iaXRfbWFwKTsNCisJCQllbHNlDQorCQkJCWNs
ZWFyX2JpdChiYXNlICsgaiwgdHQtPnNwbGl0X2JpdF9tYXApOw0KKwkJfQ0KKw0KKwkJaWYgKHNj
aF9lcC0+ZXBfdHlwZSA9PSBJU09DX09VVF9FUCkgew0KKwkJCWZvciAoaiA9IDA7IGogPCBzY2hf
ZXAtPm51bV9idWRnZXRfbWljcm9mcmFtZXM7IGorKykgew0KKwkJCQlpZiAodXNlZCkgew0KKwkJ
CQkJc2V0X2JpdChiYXNlICsgaiwgdHQtPnNzX2JpdF9tYXApOw0KKwkJCQkJc2V0X2JpdChiYXNl
ICsgaiwgdHQtPmNzX2JpdF9tYXApOw0KKwkJCQkJdHQtPmZzX2J1c19id1tiYXNlICsgal0gKz0N
CisJCQkJCQlzY2hfZXAtPmJ3X2Nvc3RfcGVyX21pY3JvZnJhbWU7DQorCQkJCX0gZWxzZSB7DQor
CQkJCQljbGVhcl9iaXQoYmFzZSArIGosIHR0LT5zc19iaXRfbWFwKTsNCisJCQkJCWNsZWFyX2Jp
dChiYXNlICsgaiwgdHQtPmNzX2JpdF9tYXApOw0KKwkJCQkJdHQtPmZzX2J1c19id1tiYXNlICsg
al0gLT0NCisJCQkJCQlzY2hfZXAtPmJ3X2Nvc3RfcGVyX21pY3JvZnJhbWU7DQorCQkJCX0NCisJ
CQl9DQorCQl9IGVsc2Ugew0KKwkJCWlmICh1c2VkKQ0KKwkJCQlzZXRfYml0KGJhc2UsIHR0LT5z
c19iaXRfbWFwKTsNCisJCQllbHNlDQorCQkJCWNsZWFyX2JpdChiYXNlLCB0dC0+c3NfYml0X21h
cCk7DQorDQorCQkJZm9yIChqID0gMDsgaiA8IHNjaF9lcC0+Y3NfY291bnQ7IGorKykgew0KKwkJ
CQlpZiAodXNlZCkgew0KKwkJCQkJc2V0X2JpdChiYXNlICsgMiArIGosIHR0LT5jc19iaXRfbWFw
KTsNCisNCisJCQkJCXR0LT5mc19idXNfYndbYmFzZSArIDIgKyBqXSArPQ0KKwkJCQkJCXNjaF9l
cC0+YndfY29zdF9wZXJfbWljcm9mcmFtZTsNCisJCQkJfSBlbHNlIHsNCisJCQkJCWNsZWFyX2Jp
dChiYXNlICsgMiArIGosIHR0LT5jc19iaXRfbWFwKTsNCisJCQkJCXR0LT5mc19idXNfYndbYmFz
ZSArIDIgKyBqXSAtPQ0KKwkJCQkJCXNjaF9lcC0+YndfY29zdF9wZXJfbWljcm9mcmFtZTsNCisJ
CQkJfQ0KKwkJCX0NCisJCX0NCiAJfQ0KIA0KLQlsaXN0X2FkZF90YWlsKCZzY2hfZXAtPnR0X2Vu
ZHBvaW50LCAmdHQtPmVwX2xpc3QpOw0KKwlpZiAodXNlZCkNCisJCWxpc3RfYWRkX3RhaWwoJnNj
aF9lcC0+dHRfZW5kcG9pbnQsICZ0dC0+ZXBfbGlzdCk7DQorCWVsc2UNCisJCWxpc3RfZGVsKCZz
Y2hfZXAtPnR0X2VuZHBvaW50KTsNCiB9DQogDQogc3RhdGljIGludCBjaGVja19zY2hfYncoc3Ry
dWN0IHVzYl9kZXZpY2UgKnVkZXYsDQpAQCAtNDcwLDYgKzUyOSw3IEBAIHN0YXRpYyBpbnQgY2hl
Y2tfc2NoX2J3KHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LA0KIHsNCiAJdTMyIG9mZnNldDsNCiAJ
dTMyIGVzaXQ7DQorCXUzMiBib3VuZGFyeTsNCiAJdTMyIG1pbl9idzsNCiAJdTMyIG1pbl9pbmRl
eDsNCiAJdTMyIHdvcnN0X2J3Ow0KQEAgLTQ4NywxMCArNTQ3LDEzIEBAIHN0YXRpYyBpbnQgY2hl
Y2tfc2NoX2J3KHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LA0KIAkgKi8NCiAJbWluX2J3ID0gfjA7
DQogCW1pbl9pbmRleCA9IDA7DQorCWJvdW5kYXJ5ID0gZXNpdDsNCiAJbWluX2NzX2NvdW50ID0g
c2NoX2VwLT5jc19jb3VudDsNCiAJbWluX251bV9idWRnZXQgPSBzY2hfZXAtPm51bV9idWRnZXRf
bWljcm9mcmFtZXM7DQogCWZvciAob2Zmc2V0ID0gMDsgb2Zmc2V0IDwgZXNpdDsgb2Zmc2V0Kysp
IHsNCiAJCWlmIChpc19mc19vcl9scyh1ZGV2LT5zcGVlZCkpIHsNCisJCQlpZiAoc2NoX2VwLT5l
cF90eXBlICE9IElTT0NfT1VUX0VQKQ0KKwkJCQlib3VuZGFyeSA9IGVzaXQgKyAxOw0KIAkJCXJl
dCA9IGNoZWNrX3NjaF90dCh1ZGV2LCBzY2hfZXAsIG9mZnNldCk7DQogCQkJaWYgKHJldCkNCiAJ
CQkJY29udGludWU7DQpAQCAtNDk4LDcgKzU2MSw3IEBAIHN0YXRpYyBpbnQgY2hlY2tfc2NoX2J3
KHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LA0KIAkJCQl0dF9vZmZzZXRfb2sgPSB0cnVlOw0KIAkJ
fQ0KIA0KLQkJaWYgKChvZmZzZXQgKyBzY2hfZXAtPm51bV9idWRnZXRfbWljcm9mcmFtZXMpID4g
c2NoX2VwLT5lc2l0KQ0KKwkJaWYgKChvZmZzZXQgKyBzY2hfZXAtPm51bV9idWRnZXRfbWljcm9m
cmFtZXMpID4gYm91bmRhcnkpDQogCQkJYnJlYWs7DQogDQogCQl3b3JzdF9idyA9IGdldF9tYXhf
Yncoc2NoX2J3LCBzY2hfZXAsIG9mZnNldCk7DQpAQCAtNTMyLDcgKzU5NSw3IEBAIHN0YXRpYyBp
bnQgY2hlY2tfc2NoX2J3KHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LA0KIAkJaWYgKCF0dF9vZmZz
ZXRfb2spDQogCQkJcmV0dXJuIC1FUkFOR0U7DQogDQotCQl1cGRhdGVfc2NoX3R0KHVkZXYsIHNj
aF9lcCk7DQorCQl1cGRhdGVfc2NoX3R0KHVkZXYsIHNjaF9lcCwgMSk7DQogCX0NCiANCiAJLyog
dXBkYXRlIGJ1cyBiYW5kd2lkdGggaW5mbyAqLw0KQEAgLTY5NiwxMiArNzU5LDEyIEBAIHZvaWQg
eGhjaV9tdGtfZHJvcF9lcF9xdWlyayhzdHJ1Y3QgdXNiX2hjZCAqaGNkLCBzdHJ1Y3QgdXNiX2Rl
dmljZSAqdWRldiwNCiANCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShzY2hfZXAsICZzY2hfYnctPmJ3
X2VwX2xpc3QsIGVuZHBvaW50KSB7DQogCQlpZiAoc2NoX2VwLT5lcCA9PSBlcCkgew0KLQkJCXVw
ZGF0ZV9idXNfYncoc2NoX2J3LCBzY2hfZXAsIDApOw0KLQkJCWxpc3RfZGVsKCZzY2hfZXAtPmVu
ZHBvaW50KTsNCiAJCQlpZiAoaXNfZnNfb3JfbHModWRldi0+c3BlZWQpKSB7DQotCQkJCWxpc3Rf
ZGVsKCZzY2hfZXAtPnR0X2VuZHBvaW50KTsNCisJCQkJdXBkYXRlX3NjaF90dCh1ZGV2LCBzY2hf
ZXAsIDApOw0KIAkJCQlkcm9wX3R0KHVkZXYpOw0KIAkJCX0NCisJCQl1cGRhdGVfYnVzX2J3KHNj
aF9idywgc2NoX2VwLCAwKTsNCisJCQlsaXN0X2RlbCgmc2NoX2VwLT5lbmRwb2ludCk7DQogCQkJ
a2ZyZWUoc2NoX2VwKTsNCiAJCQlicmVhazsNCiAJCX0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9ob3N0L3hoY2ktbXRrLmggYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLmgNCmluZGV4IGE5
M2NmZTguLjMyM2IyODEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLmgN
CisrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGsuaA0KQEAgLTIxLDEyICsyMSwxOCBAQA0K
IA0KIC8qKg0KICAqIEBzcGxpdF9iaXRfbWFwOiB1c2VkIHRvIGF2b2lkIHNwbGl0IG1pY3JvZnJh
bWVzIG92ZXJsYXkNCisgKiBAc3NfYml0X21hcDogdXNlZCB0byBhdm9pZCBzdGFydCBzcGxpdCBt
aWNyb2ZyYW1lcyBvdmVybGF5DQorICogQGNzX2JpdF9tYXA6IHVzZWQgdG8gYXZvaWQgY29tcGxl
dGUgc3BsaXQgbWljcm9mcmFtZXMgb3ZlcmxheQ0KKyAqIEBmc19idXNfYnc6IGFycmF5IHRvIGtl
ZXAgdHJhY2sgb2YgYmFuZHdpZHRoIGFscmVhZHkgdXNlZCBhdCBmdWxsIHNwZWVkDQogICogQGVw
X2xpc3Q6IEVuZHBvaW50cyB1c2luZyB0aGlzIFRUDQogICogQHVzYl90dDogdXNiIFRUIHJlbGF0
ZWQNCiAgKiBAdHRfcG9ydDogVFQgcG9ydCBudW1iZXINCiAgKi8NCiBzdHJ1Y3QgbXUzaF9zY2hf
dHQgew0KIAlERUNMQVJFX0JJVE1BUChzcGxpdF9iaXRfbWFwLCBYSENJX01US19NQVhfRVNJVCk7
DQorCURFQ0xBUkVfQklUTUFQKHNzX2JpdF9tYXAsIFhIQ0lfTVRLX01BWF9FU0lUKTsNCisJREVD
TEFSRV9CSVRNQVAoY3NfYml0X21hcCwgWEhDSV9NVEtfTUFYX0VTSVQgKyAxKTsNCisJdTMyIGZz
X2J1c19id1tYSENJX01US19NQVhfRVNJVF07DQogCXN0cnVjdCBsaXN0X2hlYWQgZXBfbGlzdDsN
CiAJc3RydWN0IHVzYl90dCAqdXNiX3R0Ow0KIAlpbnQgdHRfcG9ydDsNCkBAIC00Miw3ICs0OCw3
IEBAIHN0cnVjdCBtdTNoX3NjaF90dCB7DQogICogdHdvIGJhbmR3aWR0aCBkb21haW5zLCBvbmUg
Zm9yIElOIGVwcyBhbmQgYW5vdGhlciBmb3IgT1VUIGVwcy4NCiAgKi8NCiBzdHJ1Y3QgbXUzaF9z
Y2hfYndfaW5mbyB7DQotCXUzMiBidXNfYndbWEhDSV9NVEtfTUFYX0VTSVRdOw0KKwl1MzIgYnVz
X2J3W1hIQ0lfTVRLX01BWF9FU0lUICsgMV07DQogCXN0cnVjdCBsaXN0X2hlYWQgYndfZXBfbGlz
dDsNCiB9Ow0KIA0KLS0gDQoxLjkuMQ0K

