Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E5F278087
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 08:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgIYGXb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 02:23:31 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:50331 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726990AbgIYGX1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 02:23:27 -0400
X-UUID: 01d0363be70f44cc923ca83bb25699f7-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=n3YjiM2kc6MoQ07z5fNbMit68fBr1Ssmwppm8Zjd+W8=;
        b=S2W/V0XecRJFRttzLAW/5hLkPYS3NEqYvmkjpb1GryCkKajmN5YD7ofruwZfp09xLJL7SdcvDu5h3NCozWuthggcIVIoWs961h3qiZHPNXZqbv0eJ/vU6hBIAAJidHrxchQ/JfcjMVADHK2XbIClBRKi/AFwXckvOPX428r13T4=;
X-UUID: 01d0363be70f44cc923ca83bb25699f7-20200925
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 199449134; Fri, 25 Sep 2020 14:23:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:23:16 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:23:17 +0800
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
Subject: [PATCH V3 RESEND 01/11] usb: gadget: bdc: fix improper SPDX comment style for header file
Date:   Fri, 25 Sep 2020 14:20:22 +0800
Message-ID: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: CBBD74A7500EC9182D480AA98F084DD7FE3610717D09D4D1B40B4291CF34B6D92000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rm9yIEMgaGVhZGVyIGZpbGVzIERvY3VtZW50YXRpb24vcHJvY2Vzcy9saWNlbnNlLXJ1bGVzLnJz
dA0KbWFuZGF0ZXMgQy1saWtlIGNvbW1lbnRzIChvcHBvc2VkIHRvIEMgc291cmNlIGZpbGVzIHdo
ZXJlDQpDKysgc3R5bGUgc2hvdWxkIGJlIHVzZWQpLg0KDQpDYzogRmxvcmlhbiBGYWluZWxsaSA8
Zi5mYWluZWxsaUBnbWFpbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5m
ZW5nLnl1bkBtZWRpYXRlay5jb20+DQpBY2tlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWlu
ZWxsaUBnbWFpbC5jb20+DQotLS0NCnYzOiBhZGQgYWNrZWQtYnkgRmxvcmlhbg0KDQp2MjogYWRk
IENjIEZsb3JpYW4NCi0tLQ0KIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkYy5oICAgICB8
IDIgKy0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JkYy9iZGNfY21kLmggfCAyICstDQogZHJp
dmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2RiZy5oIHwgMiArLQ0KIGRyaXZlcnMvdXNiL2dh
ZGdldC91ZGMvYmRjL2JkY19lcC5oICB8IDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdl
dC91ZGMvYmRjL2JkYy5oIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjLmgNCmluZGV4
IGFjNzVlMjUuLmZjYmE3N2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2Jk
Yy9iZGMuaA0KKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjLmgNCkBAIC0xLDQg
KzEsNCBAQA0KLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKyAqLw0KIC8qDQogICogYmRjLmggLSBoZWFkZXIg
Zm9yIHRoZSBCUkNNIEJEQyBVU0IzLjAgZGV2aWNlIGNvbnRyb2xsZXINCiAgKg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19jbWQuaCBiL2RyaXZlcnMvdXNiL2dh
ZGdldC91ZGMvYmRjL2JkY19jbWQuaA0KaW5kZXggMjljYzk4OC4uMzczZTY3NCAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19jbWQuaA0KKysrIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2NtZC5oDQpAQCAtMSw0ICsxLDQgQEANCi0vLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCsgKi8NCiAvKg0KICAqIGJkY19jbWQuaCAtIGhlYWRlciBmb3IgdGhlIEJEQyBkZWJ1
ZyBmdW5jdGlvbnMNCiAgKg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRj
L2JkY19kYmcuaCBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19kYmcuaA0KaW5kZXgg
MzczZDVhYi4uODU5ZDU4OCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRj
L2JkY19kYmcuaA0KKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2RiZy5oDQpA
QCAtMSw0ICsxLDQgQEANCi0vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCisv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsgKi8NCiAvKg0KICAqIGJkY19kYmcu
aCAtIGhlYWRlciBmb3IgdGhlIEJEQyBkZWJ1ZyBmdW5jdGlvbnMNCiAgKg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmRjL2JkY19lcC5oIGIvZHJpdmVycy91c2IvZ2FkZ2V0
L3VkYy9iZGMvYmRjX2VwLmgNCmluZGV4IGEzN2ZmODAzLi41YmJkNzNmIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iZGMvYmRjX2VwLmgNCisrKyBiL2RyaXZlcnMvdXNiL2dh
ZGdldC91ZGMvYmRjL2JkY19lcC5oDQpAQCAtMSw0ICsxLDQgQEANCi0vLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCsNCisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MCsgKi8NCiAvKg0KICAqIGJkY19lcC5oIC0gaGVhZGVyIGZvciB0aGUgQkRDIGRlYnVnIGZ1bmN0
aW9ucw0KICAqDQotLSANCjEuOS4xDQo=

