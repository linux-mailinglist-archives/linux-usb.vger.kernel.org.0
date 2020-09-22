Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9427827409E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726577AbgIVLVz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:21:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:37426 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgIVLVx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 07:21:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600773711;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=QHxctgCuNqwgEnaUO19yG0Cl1EVwRzPGYwo+m2GJyFc=;
        b=vEs3uoE45JluZQ9XBcgv8ZB8cpZqGePbvL1fBibNE9Eqjp4G+0Clr5H+zzhXfTgh02uFI2
        bekIBcBSfNJJZ3P58fAVOCYFLkb9m3xTdmfVfDlWjDSWP0v0VZYB0dA4RwseeJNrSYknCH
        AnY3FuPo3Mq5oEYSEbRjVIgIaOVTvGc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 454C4AE56;
        Tue, 22 Sep 2020 11:22:28 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 7/7] CDC-WDM: making flush() interruptible
Date:   Tue, 22 Sep 2020 13:21:26 +0200
Message-Id: <20200922112126.16919-8-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200922112126.16919-1-oneukum@suse.com>
References: <20200922112126.16919-1-oneukum@suse.com>
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

