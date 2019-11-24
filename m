Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313CA1083CE
	for <lists+linux-usb@lfdr.de>; Sun, 24 Nov 2019 15:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfKXOXM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Nov 2019 09:23:12 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:40576 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726779AbfKXOXM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Nov 2019 09:23:12 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=wenyang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Tiwhm23_1574605381;
Received: from localhost(mailfrom:wenyang@linux.alibaba.com fp:SMTPD_---0Tiwhm23_1574605381)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 24 Nov 2019 22:23:09 +0800
From:   Wen Yang <wenyang@linux.alibaba.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Wen Yang <wenyang@linux.alibaba.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: roles: fix a potential use after free
Date:   Sun, 24 Nov 2019 22:22:36 +0800
Message-Id: <20191124142236.25671-1-wenyang@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Free the sw structure only after we are done using it.
This patch just moves the put_device() down a bit to avoid the
use after free.

Fixes: 5c54fcac9a9d ("usb: roles: Take care of driver module reference counting")
Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/usb/roles/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 8273126..63a00ff 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -169,8 +169,8 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 void usb_role_switch_put(struct usb_role_switch *sw)
 {
 	if (!IS_ERR_OR_NULL(sw)) {
-		put_device(&sw->dev);
 		module_put(sw->dev.parent->driver->owner);
+		put_device(&sw->dev);
 	}
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_put);
-- 
1.8.3.1

