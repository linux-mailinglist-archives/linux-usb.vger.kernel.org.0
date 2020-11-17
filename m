Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C122B56A0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 03:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKQCNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 21:13:01 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7925 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgKQCNB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 21:13:01 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZqGM4hJCz6wf0;
        Tue, 17 Nov 2020 10:12:43 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 17 Nov 2020
 10:12:51 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <peter.chen@nxp.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <sergei.shtylyov@gmail.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH v2 2/2] usb: gadget: Fix memleak in gadgetfs_fill_super
Date:   Tue, 17 Nov 2020 10:16:29 +0800
Message-ID: <20201117021629.1470544-3-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201117021629.1470544-1-zhangqilong3@huawei.com>
References: <20201117021629.1470544-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_get_gadget_udc_name will alloc memory for CHIP
in "Enomem" branch. we should free it before error
returns to prevent memleak.

Fixes: 175f712119c57 ("usb: gadget: provide interface for legacy gadgets to get UDC name")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
Changelog:
v2
- replace free with kfree.
---
 drivers/usb/gadget/legacy/inode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 1b430b36d0a6..71e7d10dd76b 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2039,6 +2039,9 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	return 0;
 
 Enomem:
+	kfree(CHIP);
+	CHIP = NULL;
+
 	return -ENOMEM;
 }
 
-- 
2.25.4

