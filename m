Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89DF22E65A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 09:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgG0HRJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 03:17:09 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53823 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727014AbgG0HQo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 03:16:44 -0400
X-UUID: 1223acda3d114b54adca4b5eb81886f8-20200727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R0PFD56iMUUiowOUwyB1KNj/knmrsfJF+Xf3HDW/OJs=;
        b=IeQC8Z1lS23jS0RO/jhG8gT8EtldQmBqZZNZczuBT5uvEzLF+G9HBFaPMCNt1yqb/34t/nAZ1a0mNBNnwk9+cWu371e0eJLOzDQ6XSTqRdLwzIt6Ps+DJ/5fbJh08Lk2icVOgIB/T5EDjf3bD56WdmOpEvzmpw56bnUhzkAsoU0=;
X-UUID: 1223acda3d114b54adca4b5eb81886f8-20200727
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1710702169; Mon, 27 Jul 2020 15:16:40 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 15:16:37 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 15:16:37 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 06/11] usb: mtu3: add ->udc_set_speed()
Date:   Mon, 27 Jul 2020 15:14:55 +0800
Message-ID: <1595834101-13094-6-git-send-email-chunfeng.yun@mediatek.com>
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

TWFrZSB1c2Ugb2YgdGhlIG1ldGhvZCB0byBtYWtlIHN1cmUgY29ubmVjdCBvbiBzcGVlZHMNCnN1
cHBvcnRlZCBieSB0aGUgZ2FkZ2V0IGRyaXZlci4NCg0KU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcg
WXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy91c2IvbXR1My9t
dHUzLmggICAgICAgIHwgIDQgKystDQogZHJpdmVycy91c2IvbXR1My9tdHUzX2NvcmUuYyAgIHwg
NjggKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQogZHJpdmVycy91
c2IvbXR1My9tdHUzX2dhZGdldC5jIHwgMTQgKysrKysrKysrDQogMyBmaWxlcyBjaGFuZ2VkLCA1
OCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL210dTMvbXR1My5oIGIvZHJpdmVycy91c2IvbXR1My9tdHUzLmgNCmluZGV4IGQ0OWRiOTIu
LjlkNjhmMjUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210dTMuaA0KKysrIGIvZHJp
dmVycy91c2IvbXR1My9tdHUzLmgNCkBAIC0zNDgsNyArMzQ4LDggQEAgc3RydWN0IG10dTMgew0K
IAlzdHJ1Y3QgdXNiX2dhZGdldF9kcml2ZXIgKmdhZGdldF9kcml2ZXI7DQogCXN0cnVjdCBtdHUz
X3JlcXVlc3QgZXAwX3JlcTsNCiAJdTggc2V0dXBfYnVmW0VQMF9SRVNQT05TRV9CVUZdOw0KLQl1
MzIgbWF4X3NwZWVkOw0KKwllbnVtIHVzYl9kZXZpY2Vfc3BlZWQgbWF4X3NwZWVkOw0KKwllbnVt
IHVzYl9kZXZpY2Vfc3BlZWQgc3BlZWQ7DQogDQogCXVuc2lnbmVkIGlzX2FjdGl2ZToxOw0KIAl1
bnNpZ25lZCBtYXlfd2FrZXVwOjE7DQpAQCAtNDMzLDYgKzQzNCw3IEBAIGludCBtdHUzX2NvbmZp
Z19lcChzdHJ1Y3QgbXR1MyAqbXR1LCBzdHJ1Y3QgbXR1M19lcCAqbWVwLA0KIHZvaWQgbXR1M19z
dGFydChzdHJ1Y3QgbXR1MyAqbXR1KTsNCiB2b2lkIG10dTNfc3RvcChzdHJ1Y3QgbXR1MyAqbXR1
KTsNCiB2b2lkIG10dTNfZGV2X29uX29mZihzdHJ1Y3QgbXR1MyAqbXR1LCBpbnQgaXNfb24pOw0K
K3ZvaWQgbXR1M19zZXRfc3BlZWQoc3RydWN0IG10dTMgKm10dSwgZW51bSB1c2JfZGV2aWNlX3Nw
ZWVkIHNwZWVkKTsNCiANCiBpbnQgbXR1M19nYWRnZXRfc2V0dXAoc3RydWN0IG10dTMgKm10dSk7
DQogdm9pZCBtdHUzX2dhZGdldF9jbGVhbnVwKHN0cnVjdCBtdHUzICptdHUpOw0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL210dTMvbXR1M19jb3JlLmMgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNf
Y29yZS5jDQppbmRleCA5Njk0ODEzLi5jODc1YjIyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2Iv
bXR1My9tdHUzX2NvcmUuYw0KKysrIGIvZHJpdmVycy91c2IvbXR1My9tdHUzX2NvcmUuYw0KQEAg
LTIwMyw3ICsyMDMsNDIgQEAgc3RhdGljIHZvaWQgbXR1M19pbnRyX2VuYWJsZShzdHJ1Y3QgbXR1
MyAqbXR1KQ0KIAltdHUzX3dyaXRlbChtYmFzZSwgVTNEX0RFVl9MSU5LX0lOVFJfRU5BQkxFLCBT
U1VTQl9ERVZfU1BFRURfQ0hHX0lOVFIpOw0KIH0NCiANCi1zdGF0aWMgdm9pZCBtdHUzX3NldF9z
cGVlZChzdHJ1Y3QgbXR1MyAqbXR1KTsNCit2b2lkIG10dTNfc2V0X3NwZWVkKHN0cnVjdCBtdHUz
ICptdHUsIGVudW0gdXNiX2RldmljZV9zcGVlZCBzcGVlZCkNCit7DQorCXZvaWQgX19pb21lbSAq
bWJhc2UgPSBtdHUtPm1hY19iYXNlOw0KKw0KKwlpZiAoc3BlZWQgPiBtdHUtPm1heF9zcGVlZCkN
CisJCXNwZWVkID0gbXR1LT5tYXhfc3BlZWQ7DQorDQorCXN3aXRjaCAoc3BlZWQpIHsNCisJY2Fz
ZSBVU0JfU1BFRURfRlVMTDoNCisJCS8qIGRpc2FibGUgVTMgU1MgZnVuY3Rpb24gKi8NCisJCW10
dTNfY2xyYml0cyhtYmFzZSwgVTNEX1VTQjNfQ09ORklHLCBVU0IzX0VOKTsNCisJCS8qIGRpc2Fi
bGUgSFMgZnVuY3Rpb24gKi8NCisJCW10dTNfY2xyYml0cyhtYmFzZSwgVTNEX1BPV0VSX01BTkFH
RU1FTlQsIEhTX0VOQUJMRSk7DQorCQlicmVhazsNCisJY2FzZSBVU0JfU1BFRURfSElHSDoNCisJ
CW10dTNfY2xyYml0cyhtYmFzZSwgVTNEX1VTQjNfQ09ORklHLCBVU0IzX0VOKTsNCisJCS8qIEhT
L0ZTIGRldGVjdGVkIGJ5IEhXICovDQorCQltdHUzX3NldGJpdHMobWJhc2UsIFUzRF9QT1dFUl9N
QU5BR0VNRU5ULCBIU19FTkFCTEUpOw0KKwkJYnJlYWs7DQorCWNhc2UgVVNCX1NQRUVEX1NVUEVS
Og0KKwkJbXR1M19jbHJiaXRzKG10dS0+aXBwY19iYXNlLCBTU1VTQl9VM19DVFJMKDApLA0KKwkJ
CSAgICAgU1NVU0JfVTNfUE9SVF9TU1BfU1BFRUQpOw0KKwkJYnJlYWs7DQorCWNhc2UgVVNCX1NQ
RUVEX1NVUEVSX1BMVVM6DQorCQkJbXR1M19zZXRiaXRzKG10dS0+aXBwY19iYXNlLCBTU1VTQl9V
M19DVFJMKDApLA0KKwkJCSAgICAgU1NVU0JfVTNfUE9SVF9TU1BfU1BFRUQpOw0KKwkJYnJlYWs7
DQorCWRlZmF1bHQ6DQorCQlkZXZfZXJyKG10dS0+ZGV2LCAiaW52YWxpZCBzcGVlZDogJXNcbiIs
DQorCQkJdXNiX3NwZWVkX3N0cmluZyhzcGVlZCkpOw0KKwkJcmV0dXJuOw0KKwl9DQorDQorCW10
dS0+c3BlZWQgPSBzcGVlZDsNCisJZGV2X2RiZyhtdHUtPmRldiwgInNldCBzcGVlZDogJXNcbiIs
IHVzYl9zcGVlZF9zdHJpbmcoc3BlZWQpKTsNCit9DQogDQogLyogQ1NSIHJlZ2lzdGVycyB3aWxs
IGJlIHJlc2V0IHRvIGRlZmF1bHQgdmFsdWUgaWYgcG9ydCBpcyBkaXNhYmxlZCAqLw0KIHN0YXRp
YyB2b2lkIG10dTNfY3NyX2luaXQoc3RydWN0IG10dTMgKm10dSkNCkBAIC0yMjUsOCArMjYwLDYg
QEAgc3RhdGljIHZvaWQgbXR1M19jc3JfaW5pdChzdHJ1Y3QgbXR1MyAqbXR1KQ0KIAkJbXR1M19z
ZXRiaXRzKG1iYXNlLCBVM0RfVTNVMl9TV0lUQ0hfQ1RSTCwgU09GVENPTl9DTFJfQVVUT19FTik7
DQogCX0NCiANCi0JbXR1M19zZXRfc3BlZWQobXR1KTsNCi0NCiAJLyogZGVsYXkgYWJvdXQgMC4x
dXMgZnJvbSBkZXRlY3RpbmcgcmVzZXQgdG8gc2VuZCBjaGlycC1LICovDQogCW10dTNfY2xyYml0
cyhtYmFzZSwgVTNEX0xJTktfUkVTRVRfSU5GTywgV1RDSFJQX01TSyk7DQogCS8qIGVuYWJsZSBh
dXRvbWF0aWNhbCBIV1JXIGZyb20gTDEgKi8NCkBAIC0yODAsMTMgKzMxMywxMyBAQCB2b2lkIG10
dTNfZXBfc3RhbGxfc2V0KHN0cnVjdCBtdHUzX2VwICptZXAsIGJvb2wgc2V0KQ0KIA0KIHZvaWQg
bXR1M19kZXZfb25fb2ZmKHN0cnVjdCBtdHUzICptdHUsIGludCBpc19vbikNCiB7DQotCWlmICht
dHUtPmlzX3UzX2lwICYmIG10dS0+bWF4X3NwZWVkID49IFVTQl9TUEVFRF9TVVBFUikNCisJaWYg
KG10dS0+aXNfdTNfaXAgJiYgbXR1LT5zcGVlZCA+PSBVU0JfU1BFRURfU1VQRVIpDQogCQltdHUz
X3NzX2Z1bmNfc2V0KG10dSwgaXNfb24pOw0KIAllbHNlDQogCQltdHUzX2hzX3NvZnRjb25uX3Nl
dChtdHUsIGlzX29uKTsNCiANCiAJZGV2X2luZm8obXR1LT5kZXYsICJnYWRnZXQgKCVzKSBwdWxs
dXAgRCVzXG4iLA0KLQkJdXNiX3NwZWVkX3N0cmluZyhtdHUtPm1heF9zcGVlZCksIGlzX29uID8g
IisiIDogIi0iKTsNCisJCXVzYl9zcGVlZF9zdHJpbmcobXR1LT5zcGVlZCksIGlzX29uID8gIisi
IDogIi0iKTsNCiB9DQogDQogdm9pZCBtdHUzX3N0YXJ0KHN0cnVjdCBtdHUzICptdHUpDQpAQCAt
Mjk5LDYgKzMzMiw3IEBAIHZvaWQgbXR1M19zdGFydChzdHJ1Y3QgbXR1MyAqbXR1KQ0KIAltdHUz
X2NscmJpdHMobXR1LT5pcHBjX2Jhc2UsIFUzRF9TU1VTQl9JUF9QV19DVFJMMiwgU1NVU0JfSVBf
REVWX1BETik7DQogDQogCW10dTNfY3NyX2luaXQobXR1KTsNCisJbXR1M19zZXRfc3BlZWQobXR1
LCBtdHUtPnNwZWVkKTsNCiANCiAJLyogSW5pdGlhbGl6ZSB0aGUgZGVmYXVsdCBpbnRlcnJ1cHRz
ICovDQogCW10dTNfaW50cl9lbmFibGUobXR1KTsNCkBAIC01NjksMjggKzYwMyw2IEBAIHN0YXRp
YyB2b2lkIG10dTNfbWVtX2ZyZWUoc3RydWN0IG10dTMgKm10dSkNCiAJa2ZyZWUobXR1LT5lcF9h
cnJheSk7DQogfQ0KIA0KLXN0YXRpYyB2b2lkIG10dTNfc2V0X3NwZWVkKHN0cnVjdCBtdHUzICpt
dHUpDQotew0KLQl2b2lkIF9faW9tZW0gKm1iYXNlID0gbXR1LT5tYWNfYmFzZTsNCi0NCi0JaWYg
KG10dS0+bWF4X3NwZWVkID09IFVTQl9TUEVFRF9GVUxMKSB7DQotCQkvKiBkaXNhYmxlIFUzIFNT
IGZ1bmN0aW9uICovDQotCQltdHUzX2NscmJpdHMobWJhc2UsIFUzRF9VU0IzX0NPTkZJRywgVVNC
M19FTik7DQotCQkvKiBkaXNhYmxlIEhTIGZ1bmN0aW9uICovDQotCQltdHUzX2NscmJpdHMobWJh
c2UsIFUzRF9QT1dFUl9NQU5BR0VNRU5ULCBIU19FTkFCTEUpOw0KLQl9IGVsc2UgaWYgKG10dS0+
bWF4X3NwZWVkID09IFVTQl9TUEVFRF9ISUdIKSB7DQotCQltdHUzX2NscmJpdHMobWJhc2UsIFUz
RF9VU0IzX0NPTkZJRywgVVNCM19FTik7DQotCQkvKiBIUy9GUyBkZXRlY3RlZCBieSBIVyAqLw0K
LQkJbXR1M19zZXRiaXRzKG1iYXNlLCBVM0RfUE9XRVJfTUFOQUdFTUVOVCwgSFNfRU5BQkxFKTsN
Ci0JfSBlbHNlIGlmIChtdHUtPm1heF9zcGVlZCA9PSBVU0JfU1BFRURfU1VQRVIpIHsNCi0JCW10
dTNfY2xyYml0cyhtdHUtPmlwcGNfYmFzZSwgU1NVU0JfVTNfQ1RSTCgwKSwNCi0JCQkgICAgIFNT
VVNCX1UzX1BPUlRfU1NQX1NQRUVEKTsNCi0JfQ0KLQ0KLQlkZXZfaW5mbyhtdHUtPmRldiwgIm1h
eF9zcGVlZDogJXNcbiIsDQotCQl1c2Jfc3BlZWRfc3RyaW5nKG10dS0+bWF4X3NwZWVkKSk7DQot
fQ0KLQ0KIHN0YXRpYyB2b2lkIG10dTNfcmVnc19pbml0KHN0cnVjdCBtdHUzICptdHUpDQogew0K
IAl2b2lkIF9faW9tZW0gKm1iYXNlID0gbXR1LT5tYWNfYmFzZTsNCkBAIC03ODAsNiArNzkyLDgg
QEAgc3RhdGljIHZvaWQgbXR1M19jaGVja19wYXJhbXMoc3RydWN0IG10dTMgKm10dSkNCiAJaWYg
KCFtdHUtPmlzX3UzX2lwICYmIChtdHUtPm1heF9zcGVlZCA+IFVTQl9TUEVFRF9ISUdIKSkNCiAJ
CW10dS0+bWF4X3NwZWVkID0gVVNCX1NQRUVEX0hJR0g7DQogDQorCW10dS0+c3BlZWQgPSBtdHUt
Pm1heF9zcGVlZDsNCisNCiAJZGV2X2luZm8obXR1LT5kZXYsICJtYXhfc3BlZWQ6ICVzXG4iLA0K
IAkJIHVzYl9zcGVlZF9zdHJpbmcobXR1LT5tYXhfc3BlZWQpKTsNCiB9DQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvbXR1My9tdHUzX2dhZGdldC5jIGIvZHJpdmVycy91c2IvbXR1My9tdHUzX2dh
ZGdldC5jDQppbmRleCA2YjI2Y2I4Li4zZDEzMTI5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2Iv
bXR1My9tdHUzX2dhZGdldC5jDQorKysgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfZ2FkZ2V0LmMN
CkBAIC01NzcsNiArNTc3LDE5IEBAIHN0YXRpYyBpbnQgbXR1M19nYWRnZXRfc3RvcChzdHJ1Y3Qg
dXNiX2dhZGdldCAqZykNCiAJcmV0dXJuIDA7DQogfQ0KIA0KK3N0YXRpYyB2b2lkDQorbXR1M19n
YWRnZXRfc2V0X3NwZWVkKHN0cnVjdCB1c2JfZ2FkZ2V0ICpnLCBlbnVtIHVzYl9kZXZpY2Vfc3Bl
ZWQgc3BlZWQpDQorew0KKwlzdHJ1Y3QgbXR1MyAqbXR1ID0gZ2FkZ2V0X3RvX210dTMoZyk7DQor
CXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQorDQorCWRldl9kYmcobXR1LT5kZXYsICIlcyAlc1xuIiwg
X19mdW5jX18sIHVzYl9zcGVlZF9zdHJpbmcoc3BlZWQpKTsNCisNCisJc3Bpbl9sb2NrX2lycXNh
dmUoJm10dS0+bG9jaywgZmxhZ3MpOw0KKwltdHUzX3NldF9zcGVlZChtdHUsIHNwZWVkKTsNCisJ
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbXR1LT5sb2NrLCBmbGFncyk7DQorfQ0KKw0KIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgdXNiX2dhZGdldF9vcHMgbXR1M19nYWRnZXRfb3BzID0gew0KIAkuZ2V0
X2ZyYW1lID0gbXR1M19nYWRnZXRfZ2V0X2ZyYW1lLA0KIAkud2FrZXVwID0gbXR1M19nYWRnZXRf
d2FrZXVwLA0KQEAgLTU4NCw2ICs1OTcsNyBAQCBzdGF0aWMgaW50IG10dTNfZ2FkZ2V0X3N0b3Ao
c3RydWN0IHVzYl9nYWRnZXQgKmcpDQogCS5wdWxsdXAgPSBtdHUzX2dhZGdldF9wdWxsdXAsDQog
CS51ZGNfc3RhcnQgPSBtdHUzX2dhZGdldF9zdGFydCwNCiAJLnVkY19zdG9wID0gbXR1M19nYWRn
ZXRfc3RvcCwNCisJLnVkY19zZXRfc3BlZWQgPSBtdHUzX2dhZGdldF9zZXRfc3BlZWQsDQogfTsN
CiANCiBzdGF0aWMgdm9pZCBtdHUzX3N0YXRlX3Jlc2V0KHN0cnVjdCBtdHUzICptdHUpDQotLSAN
CjEuOS4xDQo=

