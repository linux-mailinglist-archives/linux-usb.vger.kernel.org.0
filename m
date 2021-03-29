Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985E034C233
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 05:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhC2D0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Mar 2021 23:26:45 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14505 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhC2D0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Mar 2021 23:26:19 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F7yby6VJ4zrbYJ;
        Mon, 29 Mar 2021 11:24:14 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Mon, 29 Mar 2021 11:26:11 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <hminas@synopsys.com>, <p.zabel@pengutronix.de>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: dwc2: delete duplicate word in the comment
Date:   Mon, 29 Mar 2021 11:26:43 +0800
Message-ID: <1616988403-48755-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Delete the duplicate word "from" in comment.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
---
 drivers/usb/dwc2/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 7161344..d0ebe72 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -426,7 +426,7 @@ enum dwc2_ep0_state {
  * @g_tx_fifo_size:	An array of TX fifo sizes in dedicated fifo
  *			mode. Each value corresponds to one EP
  *			starting from EP1 (max 15 values). Sizes are
- *			in DWORDS with possible values from from
+ *			in DWORDS with possible values from
  *			16-32768 (default: 256, 256, 256, 256, 768,
  *			768, 768, 768, 0, 0, 0, 0, 0, 0, 0).
  * @change_speed_quirk: Change speed configuration to DWC2_SPEED_PARAM_FULL
-- 
2.7.4

