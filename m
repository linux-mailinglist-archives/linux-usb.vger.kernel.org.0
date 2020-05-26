Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB161B8E7E
	for <lists+linux-usb@lfdr.de>; Sun, 26 Apr 2020 11:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgDZJnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Apr 2020 05:43:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2909 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726143AbgDZJnC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Apr 2020 05:43:02 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5DBDB860BFCC0A26912E;
        Sun, 26 Apr 2020 17:43:00 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 17:42:52 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] usb: gadget: udc: remove comparison to bool in mv_u3d_core.c
Date:   Sun, 26 Apr 2020 17:42:19 +0800
Message-ID: <20200426094219.23748-1-yanaijie@huawei.com>
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

drivers/usb/gadget/udc/mv_u3d_core.c:1551:5-13: WARNING: Comparison to
bool

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/gadget/udc/mv_u3d_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 35e02a8d0091..5bb0568b934e 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -1548,7 +1548,7 @@ static void mv_u3d_handle_setup_packet(struct mv_u3d *u3d, u8 ep_num,
 		delegate = true;
 
 	/* delegate USB standard requests to the gadget driver */
-	if (delegate == true) {
+	if (delegate) {
 		/* USB requests handled by gadget */
 		if (setup->wLength) {
 			/* DATA phase from gadget, STATUS phase from u3d */
-- 
2.21.1

