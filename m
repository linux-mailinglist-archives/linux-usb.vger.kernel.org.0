Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099D332B520
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 07:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354884AbhCCGH0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 01:07:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56689 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234444AbhCCFOm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 00:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614748378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l6lNTt9uEqeybnlQ990gCuM1U4pfhUT+cOU7SMHDcNU=;
        b=XyXWrXEvlWW6smFLnsOB/qNEXE2ztTwiQrjQv6nf4UTBZhWoFZAM+XITH8Ogrcv81jR918
        /3j40u0uVmvTyDivsBDxSadPG6psDCCZJSypO8Ld+749yjS1PtbWrGQygOOoUDoHiH3p+1
        1KG855tbROShlAmmp2Pg25WLPGGCUKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-W5au7m6ENmySxFNHyHHusQ-1; Wed, 03 Mar 2021 00:12:56 -0500
X-MC-Unique: W5au7m6ENmySxFNHyHHusQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B0E107ACC7;
        Wed,  3 Mar 2021 05:12:55 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-114-139.phx2.redhat.com [10.3.114.139])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C80B619C48;
        Wed,  3 Mar 2021 05:12:54 +0000 (UTC)
Date:   Tue, 2 Mar 2021 23:12:54 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        zaitcev@redhat.com
Subject: Re: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Message-ID: <20210302231254.7a0e32cb@suzdal.zaitcev.lan>
In-Reply-To: <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
        <YDyfL/yg9QNM4nku@kroah.com>
        <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YDymu1AlS+8UjdXG@kroah.com>
        <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YD3jlIR7UJjXT6Se@kroah.com>
        <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2 Mar 2021 07:41:07 +0000
"Zhang, Qiang" <Qiang.Zhang@windriver.com> wrote:

> and also I find  similar usage in usb/class/usbtmc.c

Seems like a bug indeed, but I don't like the example in usbtmc.c.
Please let me know if the following is acceptable:

commit 83591ac63bc666a44f250b43af6c0f5a1e001841
Author: Pete Zaitcev <zaitcev@kotori.zaitcev.us>
Date:   Tue Mar 2 23:00:28 2021 -0600

    usblp: fix a hang in poll() if disconnected
    
    Apparently an application that opens a device and calls select()
    on it, will hang if the decice is disconnected. It's a little
    surprising that we had this bug for 15 years, but apparently
    nobody ever uses select() with a printer: only write() and read(),
    and those work fine. Well, you can also select() with a timeout.
    
    The fix is modeled after devio.c. A few drivers check the
    condition first, then do not add the wait queue in case the
    device is disconnected. We doubt that's completely race-free.
    So, this patch adds the process first, then locks properly
    and checks for the disconnect.
    
    Reported-by: Zqiang <qiang.zhang@windriver.com>
    Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index fd87405adbed..5733a0067f5b 100644
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
+		ret != EPOLLHUP;
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

