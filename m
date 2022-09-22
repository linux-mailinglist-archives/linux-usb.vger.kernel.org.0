Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA775E643F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 15:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbiIVNvx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 09:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbiIVNvp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:51:45 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB9E11824
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 06:51:29 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYGpF51kpzpVNk;
        Thu, 22 Sep 2022 21:48:37 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:51:25 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:51:27 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH] usb: ulpi: use DEFINE_SHOW_ATTRIBUTE to simplify ulpi_regs
Date:   Thu, 22 Sep 2022 22:25:05 +0800
Message-ID: <20220922142505.3248167-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/usb/common/ulpi.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index 0a4f441aff8f..d7c8461976ce 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -233,7 +233,7 @@ static int ulpi_read_id(struct ulpi *ulpi)
 	return 0;
 }
 
-static int ulpi_regs_read(struct seq_file *seq, void *data)
+static int ulpi_regs_show(struct seq_file *seq, void *data)
 {
 	struct ulpi *ulpi = seq->private;
 
@@ -269,21 +269,7 @@ static int ulpi_regs_read(struct seq_file *seq, void *data)
 
 	return 0;
 }
-
-static int ulpi_regs_open(struct inode *inode, struct file *f)
-{
-	struct ulpi *ulpi = inode->i_private;
-
-	return single_open(f, ulpi_regs_read, ulpi);
-}
-
-static const struct file_operations ulpi_regs_ops = {
-	.owner = THIS_MODULE,
-	.open = ulpi_regs_open,
-	.release = single_release,
-	.read = seq_read,
-	.llseek = seq_lseek
-};
+DEFINE_SHOW_ATTRIBUTE(ulpi_regs);
 
 #define ULPI_ROOT debugfs_lookup(KBUILD_MODNAME, NULL)
 
@@ -316,7 +302,7 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
 	}
 
 	root = debugfs_create_dir(dev_name(dev), ULPI_ROOT);
-	debugfs_create_file("regs", 0444, root, ulpi, &ulpi_regs_ops);
+	debugfs_create_file("regs", 0444, root, ulpi, &ulpi_regs_fops);
 
 	dev_dbg(&ulpi->dev, "registered ULPI PHY: vendor %04x, product %04x\n",
 		ulpi->id.vendor, ulpi->id.product);
-- 
2.25.1

