Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2C43429A5
	for <lists+linux-usb@lfdr.de>; Sat, 20 Mar 2021 02:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhCTBb7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 21:31:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14023 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhCTBb2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Mar 2021 21:31:28 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F2NT75CXTzPl0P;
        Sat, 20 Mar 2021 09:28:59 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Sat, 20 Mar 2021 09:31:17 +0800
From:   Jay Fang <f.fangjian@huawei.com>
To:     <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>, <tangzihao1@hisilicon.com>,
        <dan.carpenter@oracle.com>, <huangdaode@huawei.com>
Subject: [PATCH] usb: ohci: remove unreachable platform_driver_unregister() call
Date:   Sat, 20 Mar 2021 09:31:51 +0800
Message-ID: <1616203911-4207-1-git-send-email-f.fangjian@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zihao Tang <tangzihao1@hisilicon.com>

Fix the following smatch warnings:

drivers/usb/host/ohci-hcd.c:1318 ohci_hcd_mod_init() warn:
ignoring unreachable code.

platform_driver_register(&TMIO_OHCI_DRIVER) is the last
platform_driver_register() call in ohci_hcd_mod_init(), so if it
failed, there's no need to unregister it, but just goto error_tmio.

So remove the unreachable platform_driver_unregister(&TMIO_OHCI_DRIVER).
No functionality change.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 drivers/usb/host/ohci-hcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 1f5e693..2d09ef2 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -1319,7 +1319,6 @@ static int __init ohci_hcd_mod_init(void)
 
 	/* Error path */
 #ifdef TMIO_OHCI_DRIVER
-	platform_driver_unregister(&TMIO_OHCI_DRIVER);
  error_tmio:
 #endif
 #ifdef SM501_OHCI_DRIVER
-- 
2.7.4

