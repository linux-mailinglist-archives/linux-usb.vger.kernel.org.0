Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8346B48540B
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 15:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240533AbiAEOFi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 09:05:38 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36467 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240532AbiAEOFe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jan 2022 09:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641391535; x=1672927535;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=lTbKGCNvxFSS0d3GcIbzpHQ7e4M7Q8ISsp0N8PCJ73c=;
  b=UFAaIWC52LJR7VW/hc7TGZGll9UoQ4hFZAIZkw9IQLMIAwIYXvxBVpet
   rxMqbGbd9pJhDXOj17TB8Vs3UpMo3BpkQa4zSbG0M6rS0yoM9bs0kuUEQ
   cprZyHBDLjTUIHKvYlD8hAEBxE8nhR4flVvkFvAVOvVJTF0cAJAVYeufp
   U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 05 Jan 2022 06:05:34 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 06:05:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 5 Jan 2022 06:05:33 -0800
Received: from ugoswami-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 5 Jan 2022 06:05:30 -0800
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>
CC:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        <linux-usb@vger.kernel.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: [PATCH v8] usb: f_fs: Fix use-after-free for epfile
Date:   Wed, 5 Jan 2022 19:35:26 +0530
Message-ID: <1641391526-8737-1-git-send-email-quic_ugoswami@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
					ffs_data_closed
					if (last file closed)
					ffs_data_reset
					ffs_data_clear
					ffs_epfiles_destroy
spin_lock
dereference epfiles

Fix this races by taking epfiles local copy & assigning it under
spinlock and if epfiles(local) is null then update it in ffs->epfiles
then finally destroy it.
Extending the scope further from the race, protecting the ep related
structures, and concurrent accesses.

Fixes: a9e6f83c2df (usb: gadget: f_fs: stop sleeping in
ffs_func_eps_disable)
Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
Co-developed-by: Udipto Goswami <quic_ugoswami@quicinc.com>
Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
---
v8: Fixed compilation errors from previous version.

 drivers/usb/gadget/function/f_fs.c | 60 ++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 3c584da..541a4af 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1711,16 +1711,24 @@ static void ffs_data_put(struct ffs_data *ffs)
 
 static void ffs_data_closed(struct ffs_data *ffs)
 {
+	struct ffs_epfile *epfiles;
+	unsigned long flags;
+
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
+			epfiles = ffs->epfiles;
+			ffs->epfiles = NULL;
+			spin_unlock_irqrestore(&ffs->eps_lock,
+							flags);
+
+			if (epfiles)
+				ffs_epfiles_destroy(epfiles,
+						 ffs->eps_count);
+
 			if (ffs->setup_state == FFS_SETUP_PENDING)
 				__ffs_ep0_stall(ffs);
 		} else {
@@ -1767,14 +1775,27 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
 
 static void ffs_data_clear(struct ffs_data *ffs)
 {
+	struct ffs_epfile *epfiles;
+	unsigned long flags;
+
 	ENTER();
 
 	ffs_closed(ffs);
 
 	BUG_ON(ffs->gadget);
 
-	if (ffs->epfiles)
-		ffs_epfiles_destroy(ffs->epfiles, ffs->eps_count);
+	spin_lock_irqsave(&ffs->eps_lock, flags);
+	epfiles = ffs->epfiles;
+	ffs->epfiles = NULL;
+	spin_unlock_irqrestore(&ffs->eps_lock, flags);
+
+	/*
+	 * potential race possible between ffs_func_eps_disable
+	 * & ffs_epfile_release therefore maintaining a local
+	 * copy of epfile will save us from use-after-free.
+	 */
+	if (epfiles)
+		ffs_epfiles_destroy(epfiles, ffs->eps_count);
 
 	if (ffs->ffs_eventfd)
 		eventfd_ctx_put(ffs->ffs_eventfd);
@@ -1790,7 +1811,6 @@ static void ffs_data_reset(struct ffs_data *ffs)
 
 	ffs_data_clear(ffs);
 
-	ffs->epfiles = NULL;
 	ffs->raw_descs_data = NULL;
 	ffs->raw_descs = NULL;
 	ffs->raw_strings = NULL;
@@ -1870,6 +1890,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 {
 	struct ffs_epfile *epfile, *epfiles;
 	unsigned i, count;
+	unsigned long flags;
 
 	ENTER();
 
@@ -1895,7 +1916,9 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 		}
 	}
 
+	spin_lock_irqsave(&ffs->eps_lock, flags);
 	ffs->epfiles = epfiles;
+	spin_unlock_irqrestore(&ffs->eps_lock, flags);
 	return 0;
 }
 
@@ -1919,12 +1942,15 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
 
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
@@ -1942,14 +1968,18 @@ static void ffs_func_eps_disable(struct ffs_function *func)
 
 static int ffs_func_eps_enable(struct ffs_function *func)
 {
-	struct ffs_data *ffs      = func->ffs;
-	struct ffs_ep *ep         = func->eps;
-	struct ffs_epfile *epfile = ffs->epfiles;
-	unsigned count            = ffs->eps_count;
+	struct ffs_data *ffs;
+	struct ffs_ep *ep;
+	struct ffs_epfile *epfile;
+	unsigned short count;
 	unsigned long flags;
 	int ret = 0;
 
 	spin_lock_irqsave(&func->ffs->eps_lock, flags);
+	ffs = func->ffs;
+	ep = func->eps;
+	epfile = ffs->epfiles;
+	count = ffs->eps_count;
 	while(count--) {
 		ep->ep->driver_data = ep;
 
-- 
2.7.4

