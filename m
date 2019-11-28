Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9903210C275
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 03:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbfK1CiJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 21:38:09 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:44138 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727854AbfK1CiJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Nov 2019 21:38:09 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 784E37976CA2274827AE;
        Thu, 28 Nov 2019 10:38:06 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Thu, 28 Nov 2019
 10:37:56 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 1/2] usb: gadget: f_fs: Remove unneeded semicolon
Date:   Thu, 28 Nov 2019 10:45:18 +0800
Message-ID: <1574909119-19714-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574909119-19714-1-git-send-email-zhengbin13@huawei.com>
References: <1574909119-19714-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes coccicheck warning:

drivers/usb/gadget/function/f_fs.c:2508:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index b0f3aa6..81e2dd8 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2505,7 +2505,7 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 		os_descs_count = get_unaligned_le32(data);
 		data += 4;
 		len -= 4;
-	};
+	}

 	/* Read descriptors */
 	raw_descs = data;
--
2.7.4

