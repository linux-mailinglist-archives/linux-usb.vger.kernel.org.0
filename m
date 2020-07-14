Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A837121EBD8
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 10:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgGNIu7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 04:50:59 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:23565 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726851AbgGNIu7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 04:50:59 -0400
X-UUID: f42e069601354e08a7aa1eeba1a25f26-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=63syqxkiDARXC/86txfpZSfMUSpsIh5DHuOLV2ioXWM=;
        b=ivXEaD7aTGwtFAhsFM5/gCE6kbAqpli87c0Nmut0ygybOJLQNneKOo28pRNR4+vLQ/yloEh7q4nEkJ5oIBTYm/xLVwSsIVlltIYIQVYmvOvR2Bw0j6SsyePFeiFv3JLm1lybjaVV1LeYNp1wwCqJsTGjw0IOJrV7XPxAYoQ9yPc=;
X-UUID: f42e069601354e08a7aa1eeba1a25f26-20200714
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1775630585; Tue, 14 Jul 2020 16:50:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:50:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:50:37 +0800
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
Subject: [PATCH 7/9] usb: gadget: bdc: avoid precedence issues
Date:   Tue, 14 Jul 2020 16:48:52 +0800
Message-ID: <1594716535-24699-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 234CA84F4DA467BBD83226F9F4C2428C3E8ACA56B98815F818F14044E06F47A72000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWRkICgpIGFyb3VuZCBtYWNybyBhcmd1bWVudCB0byBhdm9pZCBwcmVjZWRlbmNlIGlzc3Vlcw0K
DQpTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+
DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JkYy9iZGMuaCB8IDE4ICsrKysrKysrKy0t
LS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JkYy9iZGMuaCBiL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkYy5oDQppbmRleCA2OTQwOTM0Li43YjE0YWYxIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjLmgNCisrKyBiL2RyaXZlcnMv
dXNiL2dhZGdldC91ZGMvYmRjL2JkYy5oDQpAQCAtODYsMjAgKzg2LDIwIEBADQogI2RlZmluZSBC
RENfRVBTVFM1CTB4NzQNCiAjZGVmaW5lIEJEQ19FUFNUUzYJMHg3OA0KICNkZWZpbmUgQkRDX0VQ
U1RTNwkweDdjDQotI2RlZmluZSBCRENfU1JSQkFMKG4pCSgweDIwMCArIChuICogMHgxMCkpDQot
I2RlZmluZSBCRENfU1JSQkFIKG4pCSgweDIwNCArIChuICogMHgxMCkpDQotI2RlZmluZSBCRENf
U1JSSU5UKG4pCSgweDIwOCArIChuICogMHgxMCkpDQotI2RlZmluZSBCRENfSU5UQ1RMUyhuKQko
MHgyMGMgKyAobiAqIDB4MTApKQ0KKyNkZWZpbmUgQkRDX1NSUkJBTChuKQkoMHgyMDAgKyAoKG4p
ICogMHgxMCkpDQorI2RlZmluZSBCRENfU1JSQkFIKG4pCSgweDIwNCArICgobikgKiAweDEwKSkN
CisjZGVmaW5lIEJEQ19TUlJJTlQobikJKDB4MjA4ICsgKChuKSAqIDB4MTApKQ0KKyNkZWZpbmUg
QkRDX0lOVENUTFMobikJKDB4MjBjICsgKChuKSAqIDB4MTApKQ0KIA0KIC8qIEV4dGVuZGVkIGNh
cGFiaWxpdHkgcmVncyAqLw0KICNkZWZpbmUgQkRDX0ZTQ05PQwkweGNkNA0KICNkZWZpbmUgQkRD
X0ZTQ05JQwkweGNlNA0KLSNkZWZpbmUgTlVNX05DUyhwKQkocCA+PiAyOCkNCisjZGVmaW5lIE5V
TV9OQ1MocCkJKChwKSA+PiAyOCkNCiANCiAvKiBSZWdpc3RlciBiaXQgZmllbGRzIGFuZCBNYXNr
cyAqLw0KIC8qIEJEQyBDb25maWd1cmF0aW9uIDAgKi8NCiAjZGVmaW5lIEJEQ19QR1MocCkJKCgo
cCkgJiAoMHg3IDw8IDgpKSA+PiA4KQ0KLSNkZWZpbmUgQkRDX1NQQihwKQkocCAmIDB4NykNCisj
ZGVmaW5lIEJEQ19TUEIocCkJKChwKSAmIDB4NykNCiANCiAvKiBCREMgQ2FwYWJpbGl0eTEgKi8N
CiAjZGVmaW5lIEJEQ19QNjQJCSgxIDw8IDApDQpAQCAtMTEzLDcgKzExMyw3IEBADQogI2RlZmlu
ZSBCRENfQ01EX0RWQwkweDENCiAjZGVmaW5lIEJEQ19DTURfQ1dTCQkoMHgxIDw8IDUpDQogI2Rl
ZmluZSBCRENfQ01EX0NTVChwKQkJKCgocCkgJiAoMHhmIDw8IDYpKSA+PiA2KQ0KLSNkZWZpbmUg
QkRDX0NNRF9FUE4ocCkJCSgocCAmIDB4MWYpIDw8IDEwKQ0KKyNkZWZpbmUgQkRDX0NNRF9FUE4o
cCkJCSgoKHApICYgMHgxZikgPDwgMTApDQogI2RlZmluZSBCRENfU1VCX0NNRF9BREQJCSgweDEg
PDwgMTcpDQogI2RlZmluZSBCRENfU1VCX0NNRF9GV0sJCSgweDQgPDwgMTcpDQogLyogUmVzZXQg
c2VxdWVuY2UgbnVtYmVyICovDQpAQCAtMTYzLDcgKzE2Myw3IEBADQogI2RlZmluZSBCRENfU1BF
RURfSFMJMHgzDQogI2RlZmluZSBCRENfU1BFRURfU1MJMHg0DQogDQotI2RlZmluZSBCRENfUFNU
KHApCShwICYgMHhmKQ0KKyNkZWZpbmUgQkRDX1BTVChwKQkoKHApICYgMHhmKQ0KICNkZWZpbmUg
QkRDX1BTVF9NQVNLCTB4Zg0KIA0KIC8qIFVTUFBNUyAqLw0KQEAgLTIyOCw3ICsyMjgsNyBAQA0K
IC8qIHN0YXR1cyByZXBvcnQgZGVmaW5lcyAqLw0KICNkZWZpbmUgU1JfWFNGCQkwDQogI2RlZmlu
ZSBTUl9VU1BDCQk0DQotI2RlZmluZSBTUl9CRF9MRU4ocCkgICAgKHAgJiAweGZmZmZmZikNCisj
ZGVmaW5lIFNSX0JEX0xFTihwKSAgICAoKHApICYgMHhmZmZmZmYpDQogDQogI2RlZmluZSBYU0Zf
U1VDQwkweDENCiAjZGVmaW5lIFhTRl9TSE9SVAkweDMNCi0tIA0KMS45LjENCg==

