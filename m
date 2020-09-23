Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0769827544A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 11:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIWJWF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 05:22:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:53630 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgIWJWF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 05:22:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600852924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=RxFQPXtnIY8PwL4wcaQVQPCXz6qQ+yIZN0Kpgnlyksg=;
        b=mUIO5NW/8IJArEX3K4UmRa4SvPA3x+0KulOs8+GWS1EydKnoTGCKkH6GZ4zfhLC3I3KwM+
        QSOIK8IJClQrm5vvw6bw5dkFv5eDrY6Aichf8PXXdH01wjzJSpy6keuV34B6Oo+PGABHKI
        mir72r8FbQROMhjZ7PkHPFlQ5aBRi8I=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A7AEBACD0;
        Wed, 23 Sep 2020 09:22:41 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org, gregKH@linuxfoundation.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 3/7] CDC-WDM: remove use of intf->dev after potential disconnect
Date:   Wed, 23 Sep 2020 11:21:32 +0200
Message-Id: <20200923092136.14824-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923092136.14824-1-oneukum@suse.com>
References: <20200923092136.14824-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After a disconnect intf->dev is not a valid pointer any longer.
As flush() uses it only for logging purposes logging is not
worth it. Remove the dev_err()

Reported-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index b3a3f249a915..1ca2c85a977d 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -603,16 +603,17 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 			test_bit(WDM_DISCONNECTING, &desc->flags),
 			WDM_FLUSH_TIMEOUT);
 
-	/* cannot dereference desc->intf if WDM_DISCONNECTING */
+	/*
+	 * to report the correct error.
+	 * This is best effort
+	 * We are inevitably racing with the hardware.
+	 */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
 		return -ENODEV;
 	if (!rv)
 		return -EIO;
 
 	rv = desc->werr;
-	if (rv < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			rv);
 
 	return usb_translate_errors(rv);
 }
-- 
2.16.4

