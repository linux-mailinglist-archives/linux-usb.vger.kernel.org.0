Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C07D21EBCE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 10:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGNIuq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 04:50:46 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:15032 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726845AbgGNIup (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 04:50:45 -0400
X-UUID: 28709503a4c64d9cae19874bedc1909c-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cYKlO6AjvO0zN+B/+SEdBEWj9IJvdlm+7ddbRfto77Y=;
        b=Ra50kKpXthTrR5Vf0OF+HTVT8QGMW95F45+3XW06/oHriYhsrbMGvjYs2AmvUXho44P/X7TCkewYVO93gCIrugNgJ/iH5Lnn6BSH8GHVL+FsNlbbIH6W00mBhUzEHwtuuD97yxsKfexblk4XczYpz3TFerHn4M/VjBAL612ytSI=;
X-UUID: 28709503a4c64d9cae19874bedc1909c-20200714
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1516079608; Tue, 14 Jul 2020 16:50:37 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:50:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:50:34 +0800
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
Subject: [PATCH 4/9] usb: gadget: bdc: remove bdc_ep_set_halt() declaration
Date:   Tue, 14 Jul 2020 16:48:49 +0800
Message-ID: <1594716535-24699-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 391F70AA9E9D925F66C2730FE470DD6FE7637FC7791DAF12E1E56ADCEF5E116B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tm8gZGVmaW5pdGlvbiBmb3IgYmRjX2VwX3NldF9oYWx0KCksIHNvIHJlbW92ZSBpdC4NCg0KU2ln
bmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KLS0t
DQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2NtZC5oIHwgMSAtDQogMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91
ZGMvYmRjL2JkY19jbWQuaCBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19jbWQuaA0K
aW5kZXggZTQ4MWQzNi4uYTNhNmRiZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91
ZGMvYmRjL2JkY19jbWQuaA0KKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2Nt
ZC5oDQpAQCAtMTYsNyArMTYsNiBAQA0KIGludCBiZGNfc3RvcF9lcChzdHJ1Y3QgYmRjICosIGlu
dCk7DQogaW50IGJkY19lcF9zZXRfc3RhbGwoc3RydWN0IGJkYyAqLCBpbnQpOw0KIGludCBiZGNf
ZXBfY2xlYXJfc3RhbGwoc3RydWN0IGJkYyAqLCBpbnQpOw0KLWludCBiZGNfZXBfc2V0X2hhbHQo
c3RydWN0IGJkY19lcCAqLCB1MzIsIGludCk7DQogaW50IGJkY19lcF9ibGEoc3RydWN0IGJkYyAq
LCBzdHJ1Y3QgYmRjX2VwICosIGRtYV9hZGRyX3QpOw0KIGludCBiZGNfZnVuY3Rpb25fd2FrZShz
dHJ1Y3QgYmRjKiwgdTgpOw0KIGludCBiZGNfZnVuY3Rpb25fd2FrZV9maChzdHJ1Y3QgYmRjKiwg
dTgpOw0KLS0gDQoxLjkuMQ0K

