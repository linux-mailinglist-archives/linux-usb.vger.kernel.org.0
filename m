Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCDD187C4
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 11:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfEIJbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 05:31:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:59310 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726084AbfEIJbe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 05:31:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D2797AB63;
        Thu,  9 May 2019 09:31:33 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     miquel@df.uba.ar, gregKH@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3 2/4] rio500: fix memeory leak in close after disconnect
Date:   Thu,  9 May 2019 11:30:59 +0200
Message-Id: <20190509093101.11450-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190509093101.11450-1-oneukum@suse.com>
References: <20190509093101.11450-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a disconnected device is closed, rio_close() must free
the buffers.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/rio500.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/rio500.c b/drivers/usb/misc/rio500.c
index fa921ae60ffa..a1832c195b5f 100644
--- a/drivers/usb/misc/rio500.c
+++ b/drivers/usb/misc/rio500.c
@@ -86,9 +86,22 @@ static int close_rio(struct inode *inode, struct file *file)
 {
 	struct rio_usb_data *rio = &rio_instance;
 
-	rio->isopen = 0;
+	/* against disconnect() */
+	mutex_lock(&rio500_mutex);
+	mutex_lock(&(rio->lock));
 
-	dev_info(&rio->rio_dev->dev, "Rio closed.\n");
+	rio->isopen = 0;
+	if (!rio->present) {
+		/* cleanup has been delayed */
+		kfree(rio->ibuf);
+		kfree(rio->obuf);
+		rio->ibuf = NULL;
+		rio->obuf = NULL;
+	} else {
+		dev_info(&rio->rio_dev->dev, "Rio closed.\n");
+	}
+	mutex_unlock(&(rio->lock));
+	mutex_unlock(&rio500_mutex);
 	return 0;
 }
 
-- 
2.16.4

