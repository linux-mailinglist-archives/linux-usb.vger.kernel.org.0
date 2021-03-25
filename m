Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45EA834879D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 04:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhCYDsT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 23:48:19 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14467 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhCYDsI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 23:48:08 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5WGt2dTVzwQMT;
        Thu, 25 Mar 2021 11:45:58 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 11:47:51 +0800
From:   Jay Fang <f.fangjian@huawei.com>
To:     <balbi@kernel.org>, <greg@kroah.com>
CC:     <linux-usb@vger.kernel.org>, <tangzihao1@hisilicon.com>,
        <huangdaode@huawei.com>
Subject: [PATCH V2] USB: gadget: f_fs: Use memdup_user() as a cleanup
Date:   Thu, 25 Mar 2021 11:48:20 +0800
Message-ID: <1616644100-8214-1-git-send-email-f.fangjian@huawei.com>
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
 drivers/usb/gadget/function/f_fs.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 801a8b6..90a24d4 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3826,14 +3826,9 @@ static char *ffs_prepare_buffer(const char __user *buf, size_t len)
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
+	if (IS_ERR(data))
+		return data;
 
 	pr_vdebug("Buffer from user space:\n");
 	ffs_dump_mem("", data, len);
-- 
2.7.4

