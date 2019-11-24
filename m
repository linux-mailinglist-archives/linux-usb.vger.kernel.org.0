Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15091084FD
	for <lists+linux-usb@lfdr.de>; Sun, 24 Nov 2019 21:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfKXUzb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Nov 2019 15:55:31 -0500
Received: from netrider.rowland.org ([192.131.102.5]:40937 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726840AbfKXUzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Nov 2019 15:55:31 -0500
Received: (qmail 4767 invoked by uid 500); 24 Nov 2019 15:55:30 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Nov 2019 15:55:30 -0500
Date:   Sun, 24 Nov 2019 15:55:30 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     syzbot <syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <jrdr.linux@gmail.com>,
        <keescook@chromium.org>, <kstewart@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>, <tglx@linutronix.de>,
        <viro@zeniv.linux.org.uk>, <zaitcev@redhat.com>
Subject: Re: possible deadlock in mon_bin_vma_fault
In-Reply-To: <000000000000ce3cc905981c64bd@google.com>
Message-ID: <Pine.LNX.4.44L0.1911241553390.4632-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 24 Nov 2019, syzbot wrote:

> Hello,
> 
> syzbot tried to test the proposed patch but build/boot failed:
> 
> failed to apply patch:
> checking file drivers/usb/mon/mon_bin.c
> patch: **** unexpected end of file in patch

One more try...

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v5.3

commit 5252eb4c8297fedbf1c5f1e67da44efe00e6ef6b
Author: Pete Zaitcev <zaitcev@kotori.zaitcev.us>
Date:   Thu Nov 21 17:24:00 2019 -0600

     usb: Fix a deadlock in usbmon between mmap and read

     Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
     Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com

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


