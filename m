Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AB734C237
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 05:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhC2Db3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Mar 2021 23:31:29 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15367 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhC2DbZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Mar 2021 23:31:25 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F7yjl6PYpz9sJt;
        Mon, 29 Mar 2021 11:29:15 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 29 Mar 2021 11:31:14 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <hminas@synopsys.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: dwc2: add parenthess and space around *
Date:   Mon, 29 Mar 2021 11:31:45 +0800
Message-ID: <1616988705-27062-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Just fix the following checkpatch error:
ERROR: Macros with complex values should be enclosed in parentheses.`

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
---
 drivers/usb/dwc2/hcd_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 68bbac6..621a484 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -59,7 +59,7 @@
 #define DWC2_UNRESERVE_DELAY (msecs_to_jiffies(5))
 
 /* If we get a NAK, wait this long before retrying */
-#define DWC2_RETRY_WAIT_DELAY 1*1E6L
+#define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
 
 /**
  * dwc2_periodic_channel_available() - Checks that a channel is available for a
-- 
2.7.4

