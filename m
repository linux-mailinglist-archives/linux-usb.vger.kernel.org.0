Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7690C34180A
	for <lists+linux-usb@lfdr.de>; Fri, 19 Mar 2021 10:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCSJPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 05:15:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13207 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhCSJPX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Mar 2021 05:15:23 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1ypv5LVtzmYgk;
        Fri, 19 Mar 2021 17:12:55 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 17:15:13 +0800
From:   Jay Fang <f.fangjian@huawei.com>
To:     <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <tangzihao1@hisilicon.com>,
        <huangdaode@huawei.com>
Subject: [PATCH] USB: gadget: f_fs: Use memdup_user() as a cleanup
Date:   Fri, 19 Mar 2021 17:15:46 +0800
Message-ID: <1616145346-1410-1-git-send-email-f.fangjian@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zihao Tang <tangzihao1@hisilicon.com>

Fix coccicheck warning which recommends to use memdup_user():

drivers/usb/gadget/function/f_fs.c:3829:8-15: WARNING opportunity for memdup_user

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
Signed-off-by: Jay Fang <f.fangjian@huawei.com>
---
 drivers/usb/gadget/function/f_fs.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 801a8b6..2f904f0 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3826,14 +3826,7 @@ static char *ffs_prepare_buffer(const char __user *buf, size_t len)
 	if (!len)
 		return NULL;
 
-	data = kmalloc(len, GFP_KERNEL);
-	if (!data)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(data, buf, len)) {
-		kfree(data);
-		return ERR_PTR(-EFAULT);
-	}
+	data = memdup_user(buf, len);
 
 	pr_vdebug("Buffer from user space:\n");
 	ffs_dump_mem("", data, len);
-- 
2.7.4

