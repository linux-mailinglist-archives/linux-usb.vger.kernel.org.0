Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112992A9616
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 13:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgKFMSh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 07:18:37 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:7464 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgKFMSg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 07:18:36 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CSKDR6B5vzhhVl;
        Fri,  6 Nov 2020 20:18:31 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Nov 2020
 20:18:30 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH -v2] xhci: hisilicon: fix refercence leak in xhci_histb_probe
Date:   Fri, 6 Nov 2020 20:22:21 +0800
Message-ID: <20201106122221.2304528-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pm_runtime_get_sync() will increment pm usage at first and it
will resume the device later. We should decrease the usage count
whetever it succeeded or failed(maybe runtime of the device has
error, or device is in inaccessible state, or other error state).
If we do not call put operation to decrease the reference, it will
result in reference leak in xhci_histb_probe. Moreover, this
device cannot enter the idle state and always stay busy or other
non-idle state later. So we fixed it by jumping to error handling
branch.

Fixes: c508f41da0788 ("xhci: hisilicon: support HiSilicon STB xHCI host controller")

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
Changelog:
v2
- added the description and fixes for reference leak details.
---
 drivers/usb/host/xhci-histb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index 5546e7e013a8..08369857686e 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -240,7 +240,7 @@ static int xhci_histb_probe(struct platform_device *pdev)
 	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret)
-		return ret;
+		goto disable_pm;
 
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
-- 
2.25.4

