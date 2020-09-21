Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7FA2722B8
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgIULh5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:37:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:45710 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgIULh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:37:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600688275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=ahVSMqMWxQiTVFLLP0Rh9U0UGtU0tS0+yc58D7AdFLc=;
        b=ReQwmY7UPSCvYxWDvYdS/CIau9V8b7R1cSHs9vFHjKA4DxC7VeDaeqOKqvEYF2FU7BBAFv
        IGWhyyHcnxGocFSqQZRz5zmpa/nuaA2WA8z73CHy3qRBRX/HJLpTY3SfnakKRkb8GHb1aL
        kuuBBAlv1spaNfC4Ei3EHk+CV51wYyA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 75CFEB54C;
        Mon, 21 Sep 2020 11:38:31 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     keithp@keithp.com, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFT 3/4] chaoskey: make read() obey O_NONBLOCK
Date:   Mon, 21 Sep 2020 13:37:31 +0200
Message-Id: <20200921113732.11524-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921113732.11524-1-oneukum@suse.com>
References: <20200921113732.11524-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This skips waiting for a read if O_NONBLOCK is set.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/chaoskey.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index d47c2cc65269..0d80cba162a4 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -467,10 +467,14 @@ static ssize_t chaoskey_read(struct file *file,
 				mutex_unlock(&dev->lock);
 				goto bail;
 			}
-			result = chaoskey_wait_fill(dev);
-			if (result < 0) {
-				mutex_unlock(&dev->lock);
-				goto bail;
+			if (!(file->f_flags & O_NONBLOCK)) {
+				result = chaoskey_wait_fill(dev);
+				if (result < 0) {
+					mutex_unlock(&dev->lock);
+					goto bail;
+				}
+			} else {
+				result = -EAGAIN;
 			}
 		}
 
-- 
2.16.4

