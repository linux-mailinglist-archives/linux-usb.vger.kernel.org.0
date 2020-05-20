Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B4C1DC2F8
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 01:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgETXcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 19:32:32 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:60244 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgETXcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 19:32:31 -0400
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04KNW1jr089655;
        Thu, 21 May 2020 08:32:01 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Thu, 21 May 2020 08:32:01 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04KNVodI089590
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 21 May 2020 08:32:01 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Colin Ian King <colin.king@canonical.com>,
        Oliver Neukum <oneukum@suse.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE bit.
Date:   Thu, 21 May 2020 08:31:29 +0900
Message-Id: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.2
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since e.g. wdm_flush() calls wait_event() on WDM_IN_USE bit,
make sure to call wake_up_all() when clearing WDM_IN_USE bit.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/class/cdc-wdm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index e3db6fbeadef..bf2a6deb7b08 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -151,7 +151,7 @@ static void wdm_out_callback(struct urb *urb)
 	kfree(desc->outbuf);
 	desc->outbuf = NULL;
 	clear_bit(WDM_IN_USE, &desc->flags);
-	wake_up(&desc->wait);
+	wake_up_all(&desc->wait);
 }
 
 static void wdm_in_callback(struct urb *urb)
@@ -426,6 +426,7 @@ static ssize_t wdm_write
 		clear_bit(WDM_IN_USE, &desc->flags);
 		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
 		rv = usb_translate_errors(rv);
+		wake_up_all(&desc->wait);
 		goto out_free_mem_pm;
 	} else {
 		dev_dbg(&desc->intf->dev, "Tx URB has been submitted index=%d\n",
-- 
2.18.2

