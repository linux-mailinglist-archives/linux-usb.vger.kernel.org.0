Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802EE275453
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 11:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIWJWO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 05:22:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:53722 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgIWJWG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 05:22:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600852924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=QHxctgCuNqwgEnaUO19yG0Cl1EVwRzPGYwo+m2GJyFc=;
        b=TzNMVOx7xnHIZpJorV1B5XTPIBTUkB3CCcfWIDLNrXYxHajC3PnEKOquVj/9oJWP8nCvfJ
        N5P23dC3pnv/MU3hEjEL89Q9Or/WNtDNrgkMwhLM2z0RHxh3wWIl0cvGWWj07XV/yqYv6s
        nb4royaUgqIFsn8uCnS/IcPJn025/vE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 17DFCAE8C;
        Wed, 23 Sep 2020 09:22:42 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org, gregKH@linuxfoundation.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 7/7] CDC-WDM: making flush() interruptible
Date:   Wed, 23 Sep 2020 11:21:36 +0200
Message-Id: <20200923092136.14824-8-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923092136.14824-1-oneukum@suse.com>
References: <20200923092136.14824-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need for flush() to be uninterruptible. close(2)
is allowed to return -EINTR.

30 seconds is quite long a time to sleep in an uninterruptible state.
Change it to an interruptible sleep.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 6ea03c12380c..b9cca1cb5058 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -622,7 +622,7 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	struct wdm_device *desc = file->private_data;
 	int rv;
 
-	rv = wait_event_timeout(desc->wait,
+	rv = wait_event_interruptible_timeout(desc->wait,
 			/*
 			 * needs both flags. We cannot do with one
 			 * because resetting it would cause a race
@@ -642,6 +642,8 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 		return -ENODEV;
 	if (!rv)
 		return -EIO;
+	if (rv < 0)
+		return -EINTR;
 
 	spin_lock_irq(&desc->iuspin);
 	rv = desc->werr;
-- 
2.16.4

