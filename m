Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3731221EBD5
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 10:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgGNIuz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 04:50:55 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:54529 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726437AbgGNIuw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 04:50:52 -0400
X-UUID: e1eb7e2aa578486db4ba4a9c4546aef5-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7ze8MUqRCqW8NAFyPQx+TiTtPZUYUkBO979o7vg+Kok=;
        b=WxhM0PJM8r5yEmzZQTcAECnTzqfIYKOPvt2/NvdsvgroEMpYjWli+385jQhqIo3ng0OCe1Aq1+KoMxmNDMgUJE6HQvvU6y0iMljKWxsmbPAym7EEpGEX9RHfjCeYqLLnHlFsebOEQ9GNhp3jDJojjdSVFfAVfE4h4+GrxIlSYsQ=;
X-UUID: e1eb7e2aa578486db4ba4a9c4546aef5-20200714
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 697251406; Tue, 14 Jul 2020 16:50:43 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:50:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:50:40 +0800
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
Subject: [PATCH 9/9] usb: gadget: bdc: prefer pointer dereference to pointer type
Date:   Tue, 14 Jul 2020 16:48:54 +0800
Message-ID: <1594716535-24699-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: C2E4303C8A8616C9F37FBD7111587A0843CFAC8B0C6422BCC7485C4D614E0B692000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UHJlZmVyIGt6YWxsb2Moc2l6ZW9mKCpiZF90YWJsZSkuLi4pIG92ZXINCmt6YWxsb2Moc2l6ZW9m
KHN0cnVjdCBiZF90YWJsZSkNCg0KU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVu
Zy55dW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRj
X2VwLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JkYy9iZGNfZXAuYyBi
L2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19lcC5jDQppbmRleCBlZWE2NmQ1Li5kMWFj
ZTc3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2VwLmMNCisr
KyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19lcC5jDQpAQCAtMTQ3LDcgKzE0Nyw3
IEBAIHN0YXRpYyBpbnQgZXBfYmRfbGlzdF9hbGxvYyhzdHJ1Y3QgYmRjX2VwICplcCkNCiAJLyog
QWxsb2NhdGUgbWVtb3J5IGZvciBlYWNoIHRhYmxlICovDQogCWZvciAoaW5kZXggPSAwOyBpbmRl
eCA8IG51bV90YWJzOyBpbmRleCsrKSB7DQogCQkvKiBBbGxvY2F0ZSBtZW1vcnkgZm9yIGJkX3Rh
YmxlIHN0cnVjdHVyZSAqLw0KLQkJYmRfdGFibGUgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgYmRf
dGFibGUpLCBHRlBfQVRPTUlDKTsNCisJCWJkX3RhYmxlID0ga3phbGxvYyhzaXplb2YoKmJkX3Rh
YmxlKSwgR0ZQX0FUT01JQyk7DQogCQlpZiAoIWJkX3RhYmxlKQ0KIAkJCWdvdG8gZmFpbDsNCiAN
Ci0tIA0KMS45LjENCg==

