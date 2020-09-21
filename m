Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8285C2722B7
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgIULhz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:37:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:45680 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726803AbgIULhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:37:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600688274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=sYvQsLemH5qScXlX0gMPR+JDqQ7X1AsCDAL6RYSxupc=;
        b=DXl0Yl4LCBg2hGspUu84S//Qgn8OlK8vkU5x2AKFAlH40iDc+Op2WhBILLWEHFfez74Z4C
        TN6G+CsxEFsRYjrY1X1GtzUr3LeZ2SX43Ek4ROUlBiK0s/H2IYqMjcuKZMMnAXrTQm4hwl
        ChmgUaLmaLHsHQCILEullo+0W4FQd4k=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 640B4AF2A;
        Mon, 21 Sep 2020 11:38:30 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     keithp@keithp.com, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFT 1/4] chaoskey: O_NONBLOCK in concurrent reads
Date:   Mon, 21 Sep 2020 13:37:29 +0200
Message-Id: <20200921113732.11524-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921113732.11524-1-oneukum@suse.com>
References: <20200921113732.11524-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This changes the locking in chaoskey_read() to correctly
handle O_NONBLOCK in the case of concurrent readers.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/chaoskey.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index 665c75a1cdf9..ad4c0b6d02cf 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -435,9 +435,19 @@ static ssize_t chaoskey_read(struct file *file,
 			goto bail;
 		mutex_unlock(&dev->rng_lock);
 
-		result = mutex_lock_interruptible(&dev->lock);
-		if (result)
-			goto bail;
+		if (file->f_flags & O_NONBLOCK) {
+			result = mutex_trylock(&dev->lock);
+			if (result == 0) {
+				result = -EAGAIN;
+				goto bail;
+			} else {
+				result = 0;
+			}
+		} else {
+			result = mutex_lock_interruptible(&dev->lock);
+			if (result)
+				goto bail;
+		}
 		if (dev->valid == dev->used) {
 			result = _chaoskey_fill(dev);
 			if (result < 0) {
-- 
2.16.4

