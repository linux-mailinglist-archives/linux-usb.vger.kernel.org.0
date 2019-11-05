Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EF2EF772
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbfKEImV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:21 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45337 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730590AbfKEImV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:21 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so7179484ljg.12
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WVWQPUbkIxY8XxpQYbclm3TtPtetfRjLFXAjnV3l8xA=;
        b=b5jNeqEZ++21ut1H8jNPGP5PNl7AFC1+6ceIq1Jn3DZpjVJv0NHOGNu2XUzexL1yYh
         LCvE/wriq7nnix0hJJcqbqTCg6mieWiwAn9yjvbWTR2PZGNSIVY94QthTOr1vMTVZZ/l
         dgwLsHU44FRCQl0/mZos0RJ3vB622PJqeMx5dlpzsUw7NKKv+j31seva5MbFmqhAFJba
         ELlbpKHTk2bJ8DJwH+Xt+pRgV9VnJmEzSx5/Sh7GBoLYNgCXHyz5gN7U4RS0ZBInVDCq
         pvm8nnzNc2Mh0TsXfyXyoL9jabNrZy7Qgh4L+BNilo/l0dJEUDSxneG1pPOgHxSbghyu
         X7IQ==
X-Gm-Message-State: APjAAAUmjvxrHhaQfGheWBOLu18rB9tz5ychChqGOw5p8SR7Ns4wCSEN
        hpda1YHsTuEAH0Ba6nxxF9E=
X-Google-Smtp-Source: APXvYqyXrlV+M4k0NCRvY46xl69aK07r0Xvm9EdOFtFon/LangEVdycZ2ad3+0gkN4kpTgj/30U32A==
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr21640691ljh.116.1572943339331;
        Tue, 05 Nov 2019 00:42:19 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 30sm8784026lju.52.2019.11.05.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004H8-TQ; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 08/14] USB: legousbtower: remove tower_abort_transfers()
Date:   Tue,  5 Nov 2019 09:41:46 +0100
Message-Id: <20191105084152.16322-9-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the tower_abort_transfers() function which is now only called from
release and instead explicitly kill the two URBs.

This incidentally also fixes the outdated comment about freeing memory.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 3e409dfe172c..f85b6ed2fb8b 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -226,7 +226,6 @@ static int tower_release	(struct inode *inode, struct file *file);
 static __poll_t tower_poll	(struct file *file, poll_table *wait);
 static loff_t tower_llseek	(struct file *file, loff_t off, int whence);
 
-static void tower_abort_transfers (struct lego_usb_tower *dev);
 static void tower_check_for_read_packet (struct lego_usb_tower *dev);
 static void tower_interrupt_in_callback (struct urb *urb);
 static void tower_interrupt_out_callback (struct urb *urb);
@@ -431,7 +430,11 @@ static int tower_release (struct inode *inode, struct file *file)
 	if (dev->interrupt_out_busy) {
 		wait_event_interruptible_timeout (dev->write_wait, !dev->interrupt_out_busy, 2 * HZ);
 	}
-	tower_abort_transfers (dev);
+
+	/* shutdown transfers */
+	usb_kill_urb(dev->interrupt_in_urb);
+	usb_kill_urb(dev->interrupt_out_urb);
+
 	dev->open_count = 0;
 
 	mutex_unlock(&dev->lock);
@@ -439,19 +442,6 @@ static int tower_release (struct inode *inode, struct file *file)
 	return retval;
 }
 
-
-/**
- *	tower_abort_transfers
- *      aborts transfers and frees associated data structures
- */
-static void tower_abort_transfers (struct lego_usb_tower *dev)
-{
-	/* shutdown transfer */
-	usb_kill_urb(dev->interrupt_in_urb);
-	usb_kill_urb(dev->interrupt_out_urb);
-}
-
-
 /**
  *	tower_check_for_read_packet
  *
-- 
2.23.0

