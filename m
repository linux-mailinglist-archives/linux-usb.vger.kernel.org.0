Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6969EE20C
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 14:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfD2MQm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 08:16:42 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7140 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727956AbfD2MQm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 08:16:42 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E5B03775C5A6F9D27CCD;
        Mon, 29 Apr 2019 20:16:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Mon, 29 Apr 2019 20:16:28 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: typec: ucsi: ccg: fix missing unlock on error in ccg_cmd_write_flash_row()
Date:   Mon, 29 Apr 2019 12:26:30 +0000
Message-ID: <20190429122630.59334-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the missing unlock before return from function ccg_cmd_write_flash_row()
in the error handling case.

Fixes: 5c9ae5a87573 ("usb: typec: ucsi: ccg: add firmware flashing support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 4632b91a04a6..9d46aa9e4e35 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -631,6 +631,7 @@ ccg_cmd_write_flash_row(struct ucsi_ccg *uc, u16 row,
 	ret = i2c_master_send(client, buf, CCG4_ROW_SIZE + 2);
 	if (ret != CCG4_ROW_SIZE + 2) {
 		dev_err(uc->dev, "REG_FLASH_RW_MEM write fail %d\n", ret);
+		mutex_unlock(&uc->lock);
 		return ret < 0 ? ret : -EIO;
 	}



