Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D38B74FA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 10:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387857AbfISISm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 04:18:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42416 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731572AbfISISm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 04:18:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so2622801lje.9
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 01:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l086OEt/YmCp6+Ee4uju9cxpl1kQU9buLbBxRXPBhrY=;
        b=PZbL0YU3p0UNy3Yid8fpnoGXd4l6sQ/api+YNoIosbZ0PV9JprAryZY7Q2XSTlveHk
         fUWFbqyZ7Wp9t8BDOdMqUMOG4TYpigT6310W5P4ex8WS4GyygYxJe5VfDXk8tUaMFNTw
         QHXSf8scgJuZZM7t9qoXlnsnTIOJhmiq4lMmBQNGGJ+uExY+7Xf/ZH39uHkaJ1mLd7lK
         SUJiObn4veB2I3AmvyrLevbyjS83xj+t3perKRpfEf+bSKoVD8p7QXkIqfH74JG16H0p
         wv9isi+Hjrd8nQWLgyHQhHzsX8a0Lv8MSuUyHFKfiUTOouoOIvkuMQmuKqMO0He6dq+L
         t2gg==
X-Gm-Message-State: APjAAAXUNoiCULIcThcmPyg7rSR/KxVOZtVGoMrmt4UcjXfC+VGviJEy
        Q53SoWyXvvy3otzAOj8n+vU=
X-Google-Smtp-Source: APXvYqyJBfSZH1pjJ+SiSIykFl6LL9gVt37ixkc3rfHGrP7gar6NEb4Qf+/Y/4OEoXquTQEWH5caAQ==
X-Received: by 2002:a2e:810e:: with SMTP id d14mr4740962ljg.160.1568881119971;
        Thu, 19 Sep 2019 01:18:39 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q13sm1415116lfk.51.2019.09.19.01.18.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 01:18:37 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iAre8-0007vn-Ue; Thu, 19 Sep 2019 10:18:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/4] USB: legousbtower: fix open after failed reset request
Date:   Thu, 19 Sep 2019 10:18:15 +0200
Message-Id: <20190919081815.30422-5-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919081815.30422-1-johan@kernel.org>
References: <20190919081815.30422-1-johan@kernel.org>
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

