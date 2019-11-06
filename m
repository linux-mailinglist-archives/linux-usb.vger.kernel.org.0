Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6B9F1A31
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 16:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731943AbfKFPkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 10:40:35 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43560 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728638AbfKFPke (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Nov 2019 10:40:34 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 7D27A3188E9982D82CB2;
        Wed,  6 Nov 2019 23:40:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Wed, 6 Nov 2019 23:40:19 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        zhengbin <zhengbin13@huawei.com>, Li Jun <jun.li@freescale.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: fix error return code in acm_ms_bind()
Date:   Wed, 6 Nov 2019 15:39:33 +0000
Message-ID: <20191106153933.76757-1-weiyongjun1@huawei.com>
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

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 578aa8a2b12c ("usb: gadget: acm_ms: allocate and init otg descriptor by otg capabilities")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/gadget/legacy/acm_ms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/acm_ms.c b/drivers/usb/gadget/legacy/acm_ms.c
index 59be2d8417c9..e8033e5f0c18 100644
--- a/drivers/usb/gadget/legacy/acm_ms.c
+++ b/drivers/usb/gadget/legacy/acm_ms.c
@@ -200,8 +200,10 @@ static int acm_ms_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail_string_ids;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;



