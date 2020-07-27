Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E1622F5EC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 19:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgG0RCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 13:02:32 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:36744 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728434AbgG0RCc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 13:02:32 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 970C0F3E7EAD344E2C57;
        Tue, 28 Jul 2020 01:02:26 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Jul 2020 01:02:16 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>
Subject: [PATCH -next] xhci: dbc: Make function xhci_dbc_ring_alloc() static
Date:   Tue, 28 Jul 2020 01:12:07 +0800
Message-ID: <20200727171207.3101-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The sparse tool complains as follows:

drivers/usb/host/xhci-dbgcap.c:422:18: warning:
 symbol 'xhci_dbc_ring_alloc' was not declared. Should it be static?

This function is not used outside ofxhci-dbgcap.c, so this commit
marks it static.

Fixes: ac286428c69f ("xhci: dbc: don't use generic xhci ring allocation functions for dbc.")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/host/xhci-dbgcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index c57178db7994..fcc5ac5ce8b1 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -419,7 +419,7 @@ dbc_alloc_ctx(struct device *dev, gfp_t flags)
 	return ctx;
 }
 
-struct xhci_ring *
+static struct xhci_ring *
 xhci_dbc_ring_alloc(struct device *dev, enum xhci_ring_type type, gfp_t flags)
 {
 	struct xhci_ring *ring;

