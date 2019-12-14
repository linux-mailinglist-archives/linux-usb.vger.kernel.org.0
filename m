Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97EB511F090
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2019 07:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfLNGio (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Dec 2019 01:38:44 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7241 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725372AbfLNGio (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Dec 2019 01:38:44 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 13477E9D23A12DEFDBE2;
        Sat, 14 Dec 2019 14:38:41 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Sat, 14 Dec 2019 14:38:31 +0800
From:   Ma Feng <mafeng.ma@huawei.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ma Feng <mafeng.ma@huawei.com>
Subject: [PATCH] usb: gadget: Remove unneeded semicolon
Date:   Sat, 14 Dec 2019 14:39:29 +0800
Message-ID: <1576305569-106590-1-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes coccicheck warning:

drivers/usb/gadget/function/f_fs.c:2508:2-3: Unneeded semicolon
drivers/usb/gadget/udc/omap_udc.c:2579:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 drivers/usb/gadget/udc/omap_udc.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 0bbccac..92f4645 100644
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
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index f36f073..6bb65f3 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2576,7 +2576,7 @@ omap_ep_setup(char *name, u8 addr, u8 type,
 	case USB_ENDPOINT_XFER_INT:
 		ep->ep.caps.type_int = true;
 		break;
-	};
+	}

 	if (addr & USB_DIR_IN)
 		ep->ep.caps.dir_in = true;
--
2.6.2

