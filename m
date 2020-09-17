Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6610126D862
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgIQKGn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:06:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:37652 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726520AbgIQKGc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 06:06:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600337189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=s4M7sHgMh7BrpXP+6qi8QCUAy+sGdEkc6ndrA3Yc+Qo=;
        b=FAMQDtsvZiPSjpvilGyfqCCAZjxQd7hEAvqYZzeasO5W9ww5j9+pfKN5Fji40Q1Sm6vGqa
        eObNHoAbKemUvx7AHXqUIqs4HG4yR2CBGU+PP73XATuBCwYKmsfRXYuHopCBJ0wIFQMUAD
        R14uhw9960ZcF9w8WYwR1M2aeQg1RDe5amKUIC7qvYZWV3gt8nuZd5p/PU3JkuZaPrj+zf
        u0ptGPajJaPqFvz9kHhE5q7/7FM1ShGf9uRLnJOghw99DONCpdGiDbhAeqaUZGZh564u3h
        gLPYXzxrrtR1d53CBTo/6VluRKzl4kSmTojbXpNPde5xaRgzFf+Ehpr0siWlTA==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3D85FAD64;
        Thu, 17 Sep 2020 10:07:03 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 3/7] CDC-WDM: making flush() interruptible
Date:   Thu, 17 Sep 2020 12:06:10 +0200
Message-Id: <20200917100614.1010-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200917100614.1010-1-oneukum@suse.com>
References: <20200917100614.1010-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need for flush() to be uninterruptible. close(2)
is allowed to return -EAGAIN. Change it.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index fef011dc8dc4..eee19532e67e 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -592,7 +592,7 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 	struct wdm_device *desc = file->private_data;
 	int rv;
 
-	rv = wait_event_timeout(desc->wait,
+	rv = wait_event_interruptible_timeout(desc->wait,
 			/*
 			 * needs both flags. We cannot do with one
 			 * because resetting it would cause a race
@@ -608,7 +608,8 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 		return -ENODEV;
 	if (!rv)
 		return -EIO;
-
+	if (rv < 0)
+		return -EINTR;
 	rv = desc->werr;
 	if (rv < 0)
 		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-- 
2.16.4

