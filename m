Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09AC32B06E5
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 14:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgKLNpv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 08:45:51 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7524 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgKLNpu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 08:45:50 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CX2t80HpXzhXmX;
        Thu, 12 Nov 2020 21:45:36 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 21:45:35 +0800
From:   Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To:     <zhangxiaoxu5@huawei.com>, <balbi@kernel.org>,
        <linux-usb@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <jun.li@freescale.com>
Subject: [PATCH] usb: gadget: ether: Fix wrong return value of eth_bind()
Date:   Thu, 12 Nov 2020 08:48:20 -0500
Message-ID: <20201112134820.2257361-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the otg descriptor allocate failed, we should return -ENOMEM,
rather than the 'status' from 'usb_string_ids_tab'.

Fixes: 9b95236eebdb ("usb: gadget: ether: allocate and init otg descriptor by otg capabilities")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/usb/gadget/legacy/ether.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/ether.c b/drivers/usb/gadget/legacy/ether.c
index 30313b233680..99c7fc0d1d59 100644
--- a/drivers/usb/gadget/legacy/ether.c
+++ b/drivers/usb/gadget/legacy/ether.c
@@ -403,8 +403,10 @@ static int eth_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail1;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
-- 
2.25.4

