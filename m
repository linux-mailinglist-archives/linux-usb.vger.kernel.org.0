Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E35B7524
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 10:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388339AbfISIaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 04:30:55 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36991 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387856AbfISIaz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 04:30:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id w67so1711565lff.4
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 01:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l086OEt/YmCp6+Ee4uju9cxpl1kQU9buLbBxRXPBhrY=;
        b=OIJSkZ2peox7zerRNtsPvIAFYgJXD4SR+GW2u1mMx8jfWg2yTDOh+NxXOF52UJS/tu
         LEnBoprTXM7b/cl9x63kdXjEZFn9j/9Yb97SV/Ko+0wm4mpbJHa0WYmdEfq8QFHm9GEJ
         uKvS1FupU+8tvpIGgGLO9+uqkf690tXcZj4Mg6jUNdZJpvEy15G76TmpeR+1Fpsee9lW
         BBn7mDR17KfiZGi/Ve5LAj370ZRKlOXLhEH5I6FQBGQf4WBVeNrwrSsZBfYUYM1VAP+c
         YxFpTYYIJq0fKKvb+1L62p6CVoYPPIu9UW+0mjp37dPMs+b8gnh3m7/zUlrZ3VMYKZRb
         XWcQ==
X-Gm-Message-State: APjAAAW7+8HRHqMeDu3dAE/49RoqJkTsohWXzYpyqUcaLhpTTT2HrSw5
        xsk1qb2bkUvZdy+jGnIU2Bs=
X-Google-Smtp-Source: APXvYqz4O8+Ujagy5UqM1spK/jmi0oFcUwgbeaTJCeYLcHHorsUYFDqLbLPUFeSDFH/+vTV5OogKbQ==
X-Received: by 2002:a19:9145:: with SMTP id y5mr4361326lfj.88.1568881853064;
        Thu, 19 Sep 2019 01:30:53 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id i142sm1417302lfi.5.2019.09.19.01.30.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 01:30:51 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iArpx-00083R-V2; Thu, 19 Sep 2019 10:30:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH RESEND 4/4] USB: legousbtower: fix open after failed reset request
Date:   Thu, 19 Sep 2019 10:30:39 +0200
Message-Id: <20190919083039.30898-5-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919083039.30898-1-johan@kernel.org>
References: <20190919083039.30898-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver would return with a nonzero open count in case the reset
control request failed. This would prevent any further attempts to open
the char dev until the device was disconnected.

Fix this by incrementing the open count only on successful open.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 4fa999882635..44d6a3381804 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -348,7 +348,6 @@ static int tower_open (struct inode *inode, struct file *file)
 		retval = -EBUSY;
 		goto unlock_exit;
 	}
-	dev->open_count = 1;
 
 	/* reset the tower */
 	result = usb_control_msg (dev->udev,
@@ -388,13 +387,14 @@ static int tower_open (struct inode *inode, struct file *file)
 		dev_err(&dev->udev->dev,
 			"Couldn't submit interrupt_in_urb %d\n", retval);
 		dev->interrupt_in_running = 0;
-		dev->open_count = 0;
 		goto unlock_exit;
 	}
 
 	/* save device in the file's private structure */
 	file->private_data = dev;
 
+	dev->open_count = 1;
+
 unlock_exit:
 	mutex_unlock(&dev->lock);
 
-- 
2.23.0

