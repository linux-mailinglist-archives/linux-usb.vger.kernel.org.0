Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5354569BF
	for <lists+linux-usb@lfdr.de>; Fri, 19 Nov 2021 06:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhKSFfE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Nov 2021 00:35:04 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8747 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhKSFfE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Nov 2021 00:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637299923; x=1668835923;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=6rQgY2/d8BgMcO3ZvGeHFHIYr/+jMeHfpK7PLIR8z7E=;
  b=IGDWIYN85KW6GJCfd528IefTnG8VX818hDfUESbKnG4BjTwYLwpp//LE
   ++kab894m6FlOQHdTYwqee1JvmhhPyfF+B9GnfjhiylUrYz1wI5N1zCao
   wq494EQelDgIWLnIuyDcoEvmllLQ2OXvzvKHpWT9f1ne7t6qmDAP8tQOK
   0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 18 Nov 2021 21:32:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 21:32:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 21:32:02 -0800
Received: from ugoswami-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 21:31:59 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: [PATCH] usb: f_fs: Fix use-after-free for epfile
Date:   Fri, 19 Nov 2021 11:01:55 +0530
Message-ID: <1637299915-10477-1-git-send-email-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pratham Pratap <quic_ppratap@quicinc.com>

Consider a case where ffs_func_eps_disable is called from
ffs_func_disable as part of composition switch and at the
same time ffs_epfile_release get called from userspace.
ffs_epfile_release will free up the read buffer and call
ffs_data_closed which in turn destroys ffs->epfiles and
mark it as NULL. While this was happening the driver has
already initialized the local epfile in ffs_func_eps_disable
which is now freed and waiting to acquire the spinlock. Once
spinlock is acquired the driver proceeds with the stale value
of epfile and tries to free the already freed read buffer
causing use-after-free.

Following is the illustration of the race:

      CPU1                                  CPU2

   ffs_func_eps_disable
   epfiles (local copy)
					ffs_epfile_release
				  __ffs_epfile_read_buffer_free
					kfree(read_buffers)
					kfree(epfile)
(epfiles still accessible
 since local copy)
kfree(read_buffers) <use_after_free>

Another possibility of user after free is with the read_buffers
Currently, ffs_func_eps_disable & ffs_epfile_release can race,
if ffs_epfile_release ran in between while ffs_func_eps_disable
was executing, due to not being in any lock it can go ahead
and free the read buffer, but since ffs_func_eps_disable
maintains a local copy of epfiles, it will still be valid here
which when tried to free again will cause a user_after_free.
Following is the illustration of the case:
      CPU1				      CPU2

   ffs_func_eps_disable
   spin_lock_irqsave
   (epfile) local copy
	   				ffs_epfile_release
					__ffs_epfile_read_buffer_free
					kfree(epfile->read_buffer)
   __ffs_epfile_read_buffer_free
   kfree(epfile->read_buffer)
     <<use_after_free>>

Fix this races by taking epfile local copy & assigning it under
spinlock and if epfile(local) is null then update it in ffs->epfiles
then finally destroy it.

Change-Id: I85b1a0aea88c0033fbeef4c5db5104caac211540
Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
 drivers/usb/gadget/function/f_fs.c | 44 +++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 3c584da..3cdc636 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1268,10 +1268,13 @@ static int
 ffs_epfile_release(struct inode *inode, struct file *file)
 {
 	struct ffs_epfile *epfile = inode->i_private;
+	unsigned long flags;
 
 	ENTER();
 
+	spin_lock_irqsave(&epfile->ffs->eps_lock, flags);
 	__ffs_epfile_read_buffer_free(epfile);
+	spin_unlock_irqrestore(&epfile->ffs->eps_lock, flags);
 	ffs_data_closed(epfile->ffs);
 
 	return 0;
@@ -1711,16 +1714,23 @@ static void ffs_data_put(struct ffs_data *ffs)
 
 static void ffs_data_closed(struct ffs_data *ffs)
 {
+	struct ffs_epfile *epfile;
+	unsigned long flags;
 	ENTER();
 
 	if (atomic_dec_and_test(&ffs->opened)) {
 		if (ffs->no_disconnect) {
 			ffs->state = FFS_DEACTIVATED;
-			if (ffs->epfiles) {
-				ffs_epfiles_destroy(ffs->epfiles,
-						   ffs->eps_count);
-				ffs->epfiles = NULL;
-			}
+			spin_lock_irqsave(&ffs->eps_lock, flags);
+			epfile = ffs->epfiles;
+			ffs->epfiles = NULL;
+			spin_unlock_irqrestore(&ffs->eps_lock,
+							flags);
+
+			if (epfile)
+				ffs_epfiles_destroy(epfile,
+						 ffs->eps_count);
+
 			if (ffs->setup_state == FFS_SETUP_PENDING)
 				__ffs_ep0_stall(ffs);
 		} else {
@@ -1767,14 +1777,25 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
 
 static void ffs_data_clear(struct ffs_data *ffs)
 {
+	struct ffs_epfile *epfile;
+	unsigned long flags;
 	ENTER();
 
 	ffs_closed(ffs);
 
 	BUG_ON(ffs->gadget);
 
-	if (ffs->epfiles)
-		ffs_epfiles_destroy(ffs->epfiles, ffs->eps_count);
+	spin_lock_irqsave(&ffs->eps_lock, flags);
+	epfile = ffs->epfiles;
+	ffs->epfiles = NULL;
+	spin_unlock_irqrestore(&ffs->eps_lock, flags);
+	/* potential race possible between ffs_func_eps_disable
+	 * & ffs_epfile_release therefore maintaining a local
+	 * copy of epfile will save us from use-after-free.
+	 */
+	if (epfile)
+		ffs_epfiles_destroy(epfile,
+				    ffs->eps_count);
 
 	if (ffs->ffs_eventfd)
 		eventfd_ctx_put(ffs->ffs_eventfd);
@@ -1919,12 +1940,15 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
 
 static void ffs_func_eps_disable(struct ffs_function *func)
 {
-	struct ffs_ep *ep         = func->eps;
-	struct ffs_epfile *epfile = func->ffs->epfiles;
-	unsigned count            = func->ffs->eps_count;
+	struct ffs_ep *ep;
+	struct ffs_epfile *epfile;
+	unsigned short count;
 	unsigned long flags;
 
 	spin_lock_irqsave(&func->ffs->eps_lock, flags);
+	count = func->ffs->eps_count;
+	epfile = func->ffs->epfiles;
+	ep = func->eps;
 	while (count--) {
 		/* pending requests get nuked */
 		if (ep->ep)
-- 
2.7.4

