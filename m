Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72925242A35
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 15:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgHLNUy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 09:20:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:55752 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727961AbgHLNUt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 09:20:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DF7BEB76A;
        Wed, 12 Aug 2020 13:21:09 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 4/5] CDC-WDM: fix race reporting errors in flush
Date:   Wed, 12 Aug 2020 15:20:33 +0200
Message-Id: <20200812132034.14363-5-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200812132034.14363-1-oneukum@suse.com>
References: <20200812132034.14363-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a race was lost and multiple fds used,
an error could be reported multiple times. To fix
this a spinlock must be taken.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index f442f34f38da..6071c9044574 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -610,10 +610,14 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 		return -EIO;
 	if (rv < 0)
 		return -EINTR;
+
+	spin_lock_irq(&desc->iuspin);
 	rv = desc->werr;
+	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
+
 	if (rv < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			rv);
+		dev_err(&desc->intf->dev, "Error in flush path: %d\n", rv);
 
 	return usb_translate_errors(rv);
 }
-- 
2.16.4

