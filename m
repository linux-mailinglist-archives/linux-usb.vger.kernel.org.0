Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91F121CFFF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 08:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgGMGtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 02:49:18 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:60722 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725804AbgGMGtR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 02:49:17 -0400
X-UUID: d5f1ad6373b044bd9401c4151356e722-20200713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=svTg6Y0J2kRBPHwhPL7b3ZSCWm0llLAuPVvNsUvQr4k=;
        b=dmVBhsYzFklLMN0AfUNtRIU8l6MoQ2HSUVistNSwbVMthy6xJ+4cjCeh01kVOZcMI1kUnF1mf8H8e8KAz1FOpHpQ/iEXb66tWBiQVGCWJoQRXIyizLO1QbZ5gIAGcxWXx+e8MUvBL/zcSj9oOHJherKBEJTlQf7bWzz+eva/T1U=;
X-UUID: d5f1ad6373b044bd9401c4151356e722-20200713
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1329946320; Mon, 13 Jul 2020 14:49:11 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 14:48:57 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:48:57 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [v3 PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify code
Date:   Mon, 13 Jul 2020 14:48:01 +0800
Message-ID: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: A74F600D8912FA0CAB6EA76F87F3D7DE540BD84732E377910E3B4BD15F3F74452000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VXNlIHJlYWRsX3BvbGxfdGltZW91dCgpIHRvIHBvbGwgcmVnaXN0ZXIgc3RhdHVzDQoNCkNjOiBG
bG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4NClNpZ25lZC1vZmYtYnk6IENo
dW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBGbG9y
aWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4NCi0tLQ0KdjMgY2hhbmdlczoNCiAg
MS4gaW5kZW50IGNvZGUgdG8gbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcyBzdWdnZXN0ZWQgYnkgRmxv
cmlhbg0KICAyLiBhZGQgUmV2aWV3ZWQtYnkgRmxvcmlhbg0KDQp2MiBjaGFuZ2VzLCBzdWdnZXN0
ZWQgYnkgU3RlcGhlbjoNCiAgMS4gdXNlIHVuc2lnbmVkIGludCBpbnN0ZWFkIG9mIGludCBmb3Ig
QHVzZWMgcGFyYW1ldGVyDQogIDIuIGFkZCBkZXZfbG9nKCkgYmFjaw0KICAzLiBkcm9wICJFcnIi
IGluIGVycm9yIGxvZw0KLS0tDQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2NvcmUu
YyB8IDI2ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
Z2FkZ2V0L3VkYy9iZGMvYmRjX2NvcmUuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2Jk
Y19jb3JlLmMNCmluZGV4IDAyYTNhNzcuLmQ1NjdlMjAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3Vz
Yi9nYWRnZXQvdWRjL2JkYy9iZGNfY29yZS5jDQorKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRj
L2JkYy9iZGNfY29yZS5jDQpAQCAtMTIsNiArMTIsNyBAQA0KICNpbmNsdWRlIDxsaW51eC9zcGlu
bG9jay5oPg0KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8
bGludXgvaW50ZXJydXB0Lmg+DQorI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KICNpbmNsdWRl
IDxsaW51eC9pb3BvcnQuaD4NCiAjaW5jbHVkZSA8bGludXgvaW8uaD4NCiAjaW5jbHVkZSA8bGlu
dXgvbGlzdC5oPg0KQEAgLTI5LDI0ICszMCwxOSBAQA0KICNpbmNsdWRlICJiZGNfZGJnLmgiDQog
DQogLyogUG9sbCB0aWxsIGNvbnRyb2xsZXIgc3RhdHVzIGlzIG5vdCBPSVAgKi8NCi1zdGF0aWMg
aW50IHBvbGxfb2lwKHN0cnVjdCBiZGMgKmJkYywgaW50IHVzZWMpDQorc3RhdGljIGludCBwb2xs
X29pcChzdHJ1Y3QgYmRjICpiZGMsIHUzMiB1c2VjKQ0KIHsNCiAJdTMyIHN0YXR1czsNCi0JLyog
UG9sbCB0aWxsIFNUUyE9IE9JUCAqLw0KLQl3aGlsZSAodXNlYykgew0KLQkJc3RhdHVzID0gYmRj
X3JlYWRsKGJkYy0+cmVncywgQkRDX0JEQ1NDKTsNCi0JCWlmIChCRENfQ1NUUyhzdGF0dXMpICE9
IEJEQ19PSVApIHsNCi0JCQlkZXZfZGJnKGJkYy0+ZGV2LA0KLQkJCQkicG9sbF9vaXAgY29tcGxl
dGUgc3RhdHVzPSVkIiwNCi0JCQkJQkRDX0NTVFMoc3RhdHVzKSk7DQotCQkJcmV0dXJuIDA7DQot
CQl9DQotCQl1ZGVsYXkoMTApOw0KLQkJdXNlYyAtPSAxMDsNCi0JfQ0KLQlkZXZfZXJyKGJkYy0+
ZGV2LCAiRXJyOiBvcGVyYXRpb24gdGltZWRvdXQgQkRDU0M6IDB4JTA4eFxuIiwgc3RhdHVzKTsN
CisJaW50IHJldDsNCiANCi0JcmV0dXJuIC1FVElNRURPVVQ7DQorCXJldCA9IHJlYWRsX3BvbGxf
dGltZW91dChiZGMtPnJlZ3MgKyBCRENfQkRDU0MsIHN0YXR1cywNCisJCQkJIChCRENfQ1NUUyhz
dGF0dXMpICE9IEJEQ19PSVApLCAxMCwgdXNlYyk7DQorCWlmIChyZXQpDQorCQlkZXZfZXJyKGJk
Yy0+ZGV2LCAib3BlcmF0aW9uIHRpbWVkb3V0IEJEQ1NDOiAweCUwOHhcbiIsIHN0YXR1cyk7DQor
CWVsc2UNCisJCWRldl9kYmcoYmRjLT5kZXYsICIlcyBjb21wbGV0ZSBzdGF0dXM9JWQiLCBfX2Z1
bmNfXywgQkRDX0NTVFMoc3RhdHVzKSk7DQorDQorCXJldHVybiByZXQ7DQogfQ0KIA0KIC8qIFN0
b3AgdGhlIEJEQyBjb250cm9sbGVyICovDQotLSANCjEuOS4xDQo=

