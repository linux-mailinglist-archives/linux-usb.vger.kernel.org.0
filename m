Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1FF27803A
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 08:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbgIYGEn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 02:04:43 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:40056 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727313AbgIYGEm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 02:04:42 -0400
X-UUID: 083787273e6e44eaaf7fdbdf269c9d44-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UU4g24a8gBnKtYu4tzeO/9s0b7IrNvX3qtQVd8/MiV4=;
        b=iCJUTYsm2wRXmBI4txlmnIXW4+hH87wAuaJKkso6UO1H35FKUuRsA7uxBoahA5mfgT0++X3yY3/VqPhjzfw9WJgWEIGB04CioI+/0WUuWCkEn62TWwlZHD/w7Yp/3UxQa7ZMbUmd1YxfarWqo70ZSdciJNhZQget7ne1+wMd68w=;
X-UUID: 083787273e6e44eaaf7fdbdf269c9d44-20200925
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 63336967; Fri, 25 Sep 2020 14:04:33 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:04:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:04:29 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Al Cooper <alcooperx@gmail.com>,
        Sasi Kumar <sasi.kumar@broadcom.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH RESEND v3 09/11] usb: gadget: bdc: fix checkpatch.pl tab warning
Date:   Fri, 25 Sep 2020 14:01:40 +0800
Message-ID: <1601013702-29079-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601013702-29079-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601013702-29079-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 73A53DB4409DAED6887D77E53AF24F01DF2CD31FAD3EE42DACD710A02F6F14392000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V0FSTklORzpTVVNQRUNUX0NPREVfSU5ERU5UOiBzdXNwZWN0IGNvZGUgaW5kZW50IGZvciBjb25k
aXRpb25hbCBzdGF0ZW1lbnRzDQpXQVJOSU5HOlRBQlNUT1A6IFN0YXRlbWVudHMgc2hvdWxkIHN0
YXJ0IG9uIGEgdGFic3RvcA0KDQpDYzogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFp
bC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+DQpBY2tlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+
DQotLS0NCnYzOiBhZGQgYWNrZWQtYnkgRmxvcmlhbg0KDQp2MjogYWRkIENjIEZsb3JpYW4NCi0t
LQ0KIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19jbWQuYyB8IDIgKy0NCiBkcml2ZXJz
L3VzYi9nYWRnZXQvdWRjL2JkYy9iZGNfZXAuYyAgfCA0ICsrLS0NCiAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2dhZGdldC91ZGMvYmRjL2JkY19jbWQuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRj
L2JkY19jbWQuYw0KaW5kZXggNDRjMmE1ZS4uOTk1Zjc5YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
dXNiL2dhZGdldC91ZGMvYmRjL2JkY19jbWQuYw0KKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3Vk
Yy9iZGMvYmRjX2NtZC5jDQpAQCAtMTYzLDcgKzE2Myw3IEBAIGludCBiZGNfY29uZmlnX2VwKHN0
cnVjdCBiZGMgKmJkYywgc3RydWN0IGJkY19lcCAqZXApDQogCQkJCQl1c2JfZW5kcG9pbnRfeGZl
cl9pc29jKGRlc2MpKSB7DQogCQkJcGFyYW0yIHw9IHNpOw0KIAkJCWlmICh1c2JfZW5kcG9pbnRf
eGZlcl9pc29jKGRlc2MpICYmIGNvbXBfZGVzYykNCi0JCQkJCW11bCA9IGNvbXBfZGVzYy0+Ym1B
dHRyaWJ1dGVzOw0KKwkJCQltdWwgPSBjb21wX2Rlc2MtPmJtQXR0cmlidXRlczsNCiANCiAJCX0N
CiAJCXBhcmFtMiB8PSBtdWwgPDwgRVBNX1NISUZUOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2dhZGdldC91ZGMvYmRjL2JkY19lcC5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRj
X2VwLmMNCmluZGV4IDNmYjM2YzguLmQyMjdkMjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9n
YWRnZXQvdWRjL2JkYy9iZGNfZXAuYw0KKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMv
YmRjX2VwLmMNCkBAIC0yNzUsNyArMjc1LDcgQEAgc3RhdGljIGlubGluZSBpbnQgZmluZF9lbmRf
YmRpKHN0cnVjdCBiZGNfZXAgKmVwLCBpbnQgbmV4dF9od2RfYmRpKQ0KIAllbmRfYmRpID0gbmV4
dF9od2RfYmRpIC0gMTsNCiAJaWYgKGVuZF9iZGkgPCAwKQ0KIAkJZW5kX2JkaSA9IGVwLT5iZF9s
aXN0Lm1heF9iZGkgLSAxOw0KLQkgZWxzZSBpZiAoKGVuZF9iZGkgJSAoZXAtPmJkX2xpc3QubnVt
X2Jkc190YWJsZS0xKSkgPT0gMCkNCisJZWxzZSBpZiAoKGVuZF9iZGkgJSAoZXAtPmJkX2xpc3Qu
bnVtX2Jkc190YWJsZS0xKSkgPT0gMCkNCiAJCWVuZF9iZGktLTsNCiANCiAJcmV0dXJuIGVuZF9i
ZGk7DQpAQCAtNzk1LDcgKzc5NSw3IEBAIHN0YXRpYyBpbnQgZXBfZGVxdWV1ZShzdHJ1Y3QgYmRj
X2VwICplcCwgc3RydWN0IGJkY19yZXEgKnJlcSkNCiAJCQlzdGFydF9wZW5kaW5nID0gdHJ1ZTsN
CiAJCQllbmRfcGVuZGluZyA9IHRydWU7DQogCQl9IGVsc2UgaWYgKGVuZF9iZGkgPj0gY3Vycl9o
d19kcXBpIHx8IGVuZF9iZGkgPD0gZXFwX2JkaSkgew0KLQkJCQllbmRfcGVuZGluZyA9IHRydWU7
DQorCQkJZW5kX3BlbmRpbmcgPSB0cnVlOw0KIAkJfQ0KIAl9IGVsc2Ugew0KIAkJaWYgKHN0YXJ0
X2JkaSA+PSBjdXJyX2h3X2RxcGkpIHsNCi0tIA0KMS45LjENCg==

