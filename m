Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0902358172
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 13:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhDHLPB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 07:15:01 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16092 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhDHLPB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 07:15:01 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGJWn08Rdz19KrH;
        Thu,  8 Apr 2021 19:12:37 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 19:14:40 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <valentina.manea.m@gmail.com>, <shuah@kernel.org>,
        <gregkh@linuxfoundation.org>, <yebin10@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <hulkci@huawei.com>
Subject: [PATCH -next v2] usbip: vudc: fix missing unlock on error in usbip_sockfd_store()
Date:   Thu, 8 Apr 2021 19:23:05 +0800
Message-ID: <20210408112305.1022247-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the missing unlock before return from function usbip_sockfd_store()
in the error handling case.

Fixes: bd8b82042269 ("usbip: vudc synchronize sysfs code paths")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/usb/usbip/vudc_sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index f7633ee655a1..d1cf6b51bf85 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -156,12 +156,14 @@ static ssize_t usbip_sockfd_store(struct device *dev,
 		tcp_rx = kthread_create(&v_rx_loop, &udc->ud, "vudc_rx");
 		if (IS_ERR(tcp_rx)) {
 			sockfd_put(socket);
+			mutex_unlock(&udc->ud.sysfs_lock);
 			return -EINVAL;
 		}
 		tcp_tx = kthread_create(&v_tx_loop, &udc->ud, "vudc_tx");
 		if (IS_ERR(tcp_tx)) {
 			kthread_stop(tcp_rx);
 			sockfd_put(socket);
+			mutex_unlock(&udc->ud.sysfs_lock);
 			return -EINVAL;
 		}
 
-- 
2.25.4

