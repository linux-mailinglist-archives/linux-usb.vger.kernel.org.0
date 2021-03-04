Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2C132CB3A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 05:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbhCDEM4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 23:12:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42156 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232952AbhCDEMX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 23:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614831057;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=IXs3zF75SzOR3sX6dltuZ3LkzNt/Igst3EtKMWfws+M=;
        b=a0+SGkM7PGR4cG7SSg/hprFe0aM7/maS5dj6kEsbKsCRq1wK2+VuZRWnizHehXqkQuVcTp
        yat7yWhsu3t11rPiFxzIH/6BMs+KXtGk4lPkBSsP3YVgjCf/SdZ10N0g4T1kEi/wYtZpRM
        5cnfBiwmEhXzmOwyHy3Sy7qzEy3Pjwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-C_sMAQWXPqqKw81VtdMo7A-1; Wed, 03 Mar 2021 23:10:55 -0500
X-MC-Unique: C_sMAQWXPqqKw81VtdMo7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE57801980;
        Thu,  4 Mar 2021 04:10:54 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-114-139.phx2.redhat.com [10.3.114.139])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B4B526A8E4;
        Thu,  4 Mar 2021 04:10:53 +0000 (UTC)
Date:   Wed, 3 Mar 2021 22:10:53 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Pete Zaitcev <zaitcev@redhat.com>, qiang.zhang@windriver.com
Subject: [PATCH] USB: usblp: fix a hang in poll() if disconnected
Message-ID: <20210303221053.1cf3313e@suzdal.zaitcev.lan>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Apparently an application that opens a device and calls select()
on it, will hang if the decice is disconnected. It's a little
surprising that we had this bug for 15 years, but apparently
nobody ever uses select() with a printer: only write() and read(),
and those work fine. Well, you can also select() with a timeout.

The fix is modeled after devio.c. A few other drivers check the
condition first, then do not add the wait queue in case the
device is disconnected. We doubt that's completely race-free.
So, this patch adds the process first, then locks properly
and checks for the disconnect.

Reviewed-by: Zqiang <qiang.zhang@windriver.com>
Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
---
 drivers/usb/class/usblp.c |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index fd87405adbed..9596e4279294 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -494,16 +494,24 @@ static int usblp_release(struct inode *inode, struct file *file)
 /* No kernel lock - fine */
 static __poll_t usblp_poll(struct file *file, struct poll_table_struct *wait)
 {
-	__poll_t ret;
+	struct usblp *usblp = file->private_data;
+	__poll_t ret = 0;
 	unsigned long flags;
 
-	struct usblp *usblp = file->private_data;
 	/* Should we check file->f_mode & FMODE_WRITE before poll_wait()? */
 	poll_wait(file, &usblp->rwait, wait);
 	poll_wait(file, &usblp->wwait, wait);
+
+	mutex_lock(&usblp->mut);
+	if (!usblp->present)
+		ret |= EPOLLHUP;
+	mutex_unlock(&usblp->mut);
+
 	spin_lock_irqsave(&usblp->lock, flags);
-	ret = ((usblp->bidir && usblp->rcomplete) ? EPOLLIN  | EPOLLRDNORM : 0) |
-	   ((usblp->no_paper || usblp->wcomplete) ? EPOLLOUT | EPOLLWRNORM : 0);
+	if (usblp->bidir && usblp->rcomplete)
+		ret |= EPOLLIN  | EPOLLRDNORM;
+	if (usblp->no_paper || usblp->wcomplete)
+		ret |= EPOLLOUT | EPOLLWRNORM;
 	spin_unlock_irqrestore(&usblp->lock, flags);
 	return ret;
 }

