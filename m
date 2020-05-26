Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C461AEA93
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2020 09:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgDRHvw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Apr 2020 03:51:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2792 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725856AbgDRHvw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 18 Apr 2020 03:51:52 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 36FD046E8400F9761D1D;
        Sat, 18 Apr 2020 15:51:47 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sat, 18 Apr 2020
 15:51:40 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <dhowells@redhat.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] usb: gadget: f_fs: remove unneeded semicolon in __ffs_data_got_descs()
Date:   Sat, 18 Apr 2020 16:18:07 +0800
Message-ID: <20200418081807.18675-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following coccicheck warning:

drivers/usb/gadget/function/f_fs.c:2507:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 10f01f974f67..494f853f2206 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2508,7 +2508,7 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 		os_descs_count = get_unaligned_le32(data);
 		data += 4;
 		len -= 4;
-	};
+	}
 
 	/* Read descriptors */
 	raw_descs = data;
-- 
2.21.1

