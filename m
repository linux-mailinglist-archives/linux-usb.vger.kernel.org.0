Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82BCE113A03
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 03:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfLECjq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 21:39:46 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34199 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728098AbfLECjq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 21:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575513584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=4RG7+2DR9zpxnzZMDq5Gij8lRPDJUENz8pvvhATv50s=;
        b=L1kwx5/V0bFSuezVVAoC1DGUuEhHayNLl9rf3WMjnK/92QxbzKMd42rWOSNwv6ffwVH2l7
        K8Qtaj+u/x3Co3NsLLpKIra7YmorTtysmB+2GLNQ90Y8up+xcRxAKLToFhlLTNkuuAC443
        s+RJ6MGmsQPZkW3dHmOD7cclGnYCqM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-O6PHIKy-Nri_6Yt5sBwhVA-1; Wed, 04 Dec 2019 21:39:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E36321005502
        for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2019 02:39:42 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-116-180.phx2.redhat.com [10.3.116.180])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7DF260C80;
        Thu,  5 Dec 2019 02:39:41 +0000 (UTC)
Date:   Wed, 4 Dec 2019 20:39:41 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     <linux-usb@vger.kernel.org>
Cc:     Pete Zaitcev <zaitcev@redhat.com>
Subject: [PATCH] usb: mon: Fix a deadlock in usbmon between mmap and read
Message-ID: <20191204203941.3503452b@suzdal.zaitcev.lan>
Organization: Red Hat, Inc.
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: O6PHIKy-Nri_6Yt5sBwhVA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The problem arises because our read() function grabs a lock of the
circular buffer, finds something of interest, then invokes copy_to_user()
straight from the buffer, which in turn takes mm->mmap_sem. In the same
time, the callback mon_bin_vma_fault() is invoked under mm->mmap_sem.
It attempts to take the fetch lock and deadlocks.

This patch does away with protecting of our page list with any
semaphores, and instead relies on the kernel not close the device
while mmap is active in a process.

In addition, we prohibit re-sizing of a buffer while mmap is active.
This way, when (now unlocked) fault is processed, it works with the
page that is intended to be mapped-in, and not some other random page.
Note that this may have an ABI impact, but hopefully no legitimate
program is this wrong.

Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 46eb14a6e158 ("USB: fix usbmon BUG trigger")
Cc: <stable@vger.kernel.org>
---
 drivers/usb/mon/mon_bin.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index ac2b4fcc265f..f48a23adbc35 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -1039,12 +1039,18 @@ static long mon_bin_ioctl(struct file *file, unsigned int cmd, unsigned long arg
 
 		mutex_lock(&rp->fetch_lock);
 		spin_lock_irqsave(&rp->b_lock, flags);
-		mon_free_buff(rp->b_vec, rp->b_size/CHUNK_SIZE);
-		kfree(rp->b_vec);
-		rp->b_vec  = vec;
-		rp->b_size = size;
-		rp->b_read = rp->b_in = rp->b_out = rp->b_cnt = 0;
-		rp->cnt_lost = 0;
+		if (rp->mmap_active) {
+			mon_free_buff(vec, size/CHUNK_SIZE);
+			kfree(vec);
+			ret = -EBUSY;
+		} else {
+			mon_free_buff(rp->b_vec, rp->b_size/CHUNK_SIZE);
+			kfree(rp->b_vec);
+			rp->b_vec  = vec;
+			rp->b_size = size;
+			rp->b_read = rp->b_in = rp->b_out = rp->b_cnt = 0;
+			rp->cnt_lost = 0;
+		}
 		spin_unlock_irqrestore(&rp->b_lock, flags);
 		mutex_unlock(&rp->fetch_lock);
 		}
@@ -1216,13 +1222,21 @@ mon_bin_poll(struct file *file, struct poll_table_struct *wait)
 static void mon_bin_vma_open(struct vm_area_struct *vma)
 {
 	struct mon_reader_bin *rp = vma->vm_private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&rp->b_lock, flags);
 	rp->mmap_active++;
+	spin_unlock_irqrestore(&rp->b_lock, flags);
 }
 
 static void mon_bin_vma_close(struct vm_area_struct *vma)
 {
+	unsigned long flags;
+
 	struct mon_reader_bin *rp = vma->vm_private_data;
+	spin_lock_irqsave(&rp->b_lock, flags);
 	rp->mmap_active--;
+	spin_unlock_irqrestore(&rp->b_lock, flags);
 }
 
 /*
@@ -1234,16 +1248,12 @@ static vm_fault_t mon_bin_vma_fault(struct vm_fault *vmf)
 	unsigned long offset, chunk_idx;
 	struct page *pageptr;
 
-	mutex_lock(&rp->fetch_lock);
 	offset = vmf->pgoff << PAGE_SHIFT;
-	if (offset >= rp->b_size) {
-		mutex_unlock(&rp->fetch_lock);
+	if (offset >= rp->b_size)
 		return VM_FAULT_SIGBUS;
-	}
 	chunk_idx = offset / CHUNK_SIZE;
 	pageptr = rp->b_vec[chunk_idx].pg;
 	get_page(pageptr);
-	mutex_unlock(&rp->fetch_lock);
 	vmf->page = pageptr;
 	return 0;
 }

