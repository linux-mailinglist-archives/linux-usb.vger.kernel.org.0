Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9A5478622
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 09:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbhLQIY3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 03:24:29 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:30137 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbhLQIY3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 03:24:29 -0500
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JFhmN0Y4Vz8vsR;
        Fri, 17 Dec 2021 16:22:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 16:24:26 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@intel.com>,
        Tony Olech <tony.olech@elandigitalsystems.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] usb: ftdi-elan: fix memory leak on device disconnect
Date:   Fri, 17 Dec 2021 16:34:28 +0800
Message-ID: <20211217083428.2441-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

'ftdi' is alloced when probe device, but not free on device disconnect,
this cause a memory leak as follows:

unreferenced object 0xffff88800d584000 (size 8400):
  comm "kworker/0:2", pid 3809, jiffies 4295453055 (age 13.784s)
  hex dump (first 32 bytes):
    00 40 58 0d 80 88 ff ff 00 40 58 0d 80 88 ff ff  .@X......@X.....
    00 00 00 00 00 00 00 00 00 00 00 00 ad 4e ad de  .............N..
  backtrace:
    [<000000000d47f947>] kmalloc_order_trace+0x19/0x110 mm/slab_common.c:960
    [<000000008548ac68>] ftdi_elan_probe+0x8c/0x880 drivers/usb/misc/ftdi-elan.c:2647
    [<000000007f73e422>] usb_probe_interface+0x31b/0x800 drivers/usb/core/driver.c:396
    [<00000000fe8d07fc>] really_probe+0x299/0xc30 drivers/base/dd.c:517
    [<0000000005da7d32>] __driver_probe_device+0x357/0x500 drivers/base/dd.c:751
    [<000000003c2c9579>] driver_probe_device+0x4e/0x140 drivers/base/dd.c:781

Fix it by freeing 'ftdi' after nobody use it.

Fixes: a5c66e4b2418 ("USB: ftdi-elan: client driver for ELAN Uxxx adapters")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index e5a8fcdbb78e..6c38c62d29b2 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -202,6 +202,7 @@ static void ftdi_elan_delete(struct kref *kref)
 	mutex_unlock(&ftdi_module_lock);
 	kfree(ftdi->bulk_in_buffer);
 	ftdi->bulk_in_buffer = NULL;
+	kfree(ftdi);
 }
 
 static void ftdi_elan_put_kref(struct usb_ftdi *ftdi)
-- 
2.25.1

