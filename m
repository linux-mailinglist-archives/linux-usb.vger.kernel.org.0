Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F215E504CF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 10:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfFXIrH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 04:47:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:45142 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726690AbfFXIrH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jun 2019 04:47:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2F1C4AE76;
        Mon, 24 Jun 2019 08:47:06 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     johan@kernel.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] gpss: core: no waiters left behind on deregister
Date:   Mon, 24 Jun 2019 10:33:23 +0200
Message-Id: <20190624083323.11876-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If you deregister a device you need to wake up all waiters
as there will be no further wakeups.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/gnss/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
index e6f94501cb28..0d13bd2cefd5 100644
--- a/drivers/gnss/core.c
+++ b/drivers/gnss/core.c
@@ -303,7 +303,7 @@ void gnss_deregister_device(struct gnss_device *gdev)
 	down_write(&gdev->rwsem);
 	gdev->disconnected = true;
 	if (gdev->count) {
-		wake_up_interruptible(&gdev->read_queue);
+		wake_up_interruptible_all(&gdev->read_queue);
 		gdev->ops->close(gdev);
 	}
 	up_write(&gdev->rwsem);
-- 
2.16.4

