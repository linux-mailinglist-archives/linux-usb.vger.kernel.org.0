Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4DB2C0E3E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbgKWOx6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:53:58 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:7967 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731823AbgKWOx6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 09:53:58 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CfqsW3Z10zhb0H;
        Mon, 23 Nov 2020 22:53:35 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 23 Nov 2020
 22:53:48 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: ehci-omap: Fix PM disable depth umbalance in ehci_hcd_omap_probe
Date:   Mon, 23 Nov 2020 22:57:19 +0800
Message-ID: <20201123145719.1455849-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pm_runtime_enable will increase power disable depth. Imbalance
depth will resulted in enabling runtime PM of device fails later.
Thus a pairing decrement must be needed on the error handling path
to keep it balanced.

Fixes: 6c984b066d84b ("ARM: OMAP: USBHOST: Replace usbhs core driver APIs by Runtime pm APIs")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/host/ehci-omap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index 8771a2ed6926..7f4a03e8647a 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -220,6 +220,7 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 
 err_pm_runtime:
 	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
 
 err_phy:
 	for (i = 0; i < omap->nports; i++) {
-- 
2.25.4

