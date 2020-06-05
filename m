Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758CE1EEFAC
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jun 2020 04:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFEC5U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 22:57:20 -0400
Received: from mail.windriver.com ([147.11.1.11]:49772 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgFEC5U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jun 2020 22:57:20 -0400
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
        by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0552uj75005311
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
        Thu, 4 Jun 2020 19:56:45 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 4 Jun 2020 19:56:44 -0700
From:   <qiang.zhang@windriver.com>
To:     <balbi@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: gadget: function: printer: fix use-after-free in __lock_acquire
Date:   Fri, 5 Jun 2020 11:05:33 +0800
Message-ID: <20200605030533.10102-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

Fix this by increase object reference count.

BUG: KASAN: use-after-free in __lock_acquire+0x3fd4/0x4180
kernel/locking/lockdep.c:3831
Read of size 8 at addr ffff8880683b0018 by task syz-executor.0/3377

CPU: 1 PID: 3377 Comm: syz-executor.0 Not tainted 5.6.11 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xce/0x128 lib/dump_stack.c:118
 print_address_description.constprop.4+0x21/0x3c0 mm/kasan/report.c:374
 __kasan_report+0x131/0x1b0 mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:641
 __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
 __lock_acquire+0x3fd4/0x4180 kernel/locking/lockdep.c:3831
 lock_acquire+0x127/0x350 kernel/locking/lockdep.c:4488
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x35/0x50 kernel/locking/spinlock.c:159
 printer_ioctl+0x4a/0x110 drivers/usb/gadget/function/f_printer.c:723
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0xfb/0x130 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0x9e/0x510 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4531a9
Code: ed 60 fc ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 0f 83 bb 60 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fd14ad72c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000073bfa8 RCX: 00000000004531a9
RDX: fffffffffffffff9 RSI: 000000000000009e RDI: 0000000000000003
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000004bbd61
R13: 00000000004d0a98 R14: 00007fd14ad736d4 R15: 00000000ffffffff

Allocated by task 2393:
 save_stack+0x21/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc.constprop.3+0xa7/0xd0 mm/kasan/common.c:515
 kasan_kmalloc+0x9/0x10 mm/kasan/common.c:529
 kmem_cache_alloc_trace+0xfa/0x2d0 mm/slub.c:2813
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 gprinter_alloc+0xa1/0x870 drivers/usb/gadget/function/f_printer.c:1416
 usb_get_function+0x58/0xc0 drivers/usb/gadget/functions.c:61
 config_usb_cfg_link+0x1ed/0x3e0 drivers/usb/gadget/configfs.c:444
 configfs_symlink+0x527/0x11d0 fs/configfs/symlink.c:202
 vfs_symlink+0x33d/0x5b0 fs/namei.c:4201
 do_symlinkat+0x11b/0x1d0 fs/namei.c:4228
 __do_sys_symlinkat fs/namei.c:4242 [inline]
 __se_sys_symlinkat fs/namei.c:4239 [inline]
 __x64_sys_symlinkat+0x73/0xb0 fs/namei.c:4239
 do_syscall_64+0x9e/0x510 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 3368:
 save_stack+0x21/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x135/0x190 mm/kasan/common.c:476
 kasan_slab_free+0xe/0x10 mm/kasan/common.c:485
 slab_free_hook mm/slub.c:1444 [inline]
 slab_free_freelist_hook mm/slub.c:1477 [inline]
 slab_free mm/slub.c:3034 [inline]
 kfree+0xf7/0x410 mm/slub.c:3995
 gprinter_free+0x49/0xd0 drivers/usb/gadget/function/f_printer.c:1353
 usb_put_function+0x38/0x50 drivers/usb/gadget/functions.c:87
 config_usb_cfg_unlink+0x2db/0x3b0 drivers/usb/gadget/configfs.c:485
 configfs_unlink+0x3b9/0x7f0 fs/configfs/symlink.c:250
 vfs_unlink+0x287/0x570 fs/namei.c:4073
 do_unlinkat+0x4f9/0x620 fs/namei.c:4137
 __do_sys_unlink fs/namei.c:4184 [inline]
 __se_sys_unlink fs/namei.c:4182 [inline]
 __x64_sys_unlink+0x42/0x50 fs/namei.c:4182
 do_syscall_64+0x9e/0x510 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8880683b0000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
 1024-byte region [ffff8880683b0000, ffff8880683b0400)
The buggy address belongs to the page:
page:ffffea0001a0ec00 refcount:1 mapcount:0 mapping:ffff88806c00e300
index:0xffff8880683b1800 compound_mapcount: 0
flags: 0x100000000010200(slab|head)
raw: 0100000000010200 0000000000000000 0000000600000001 ffff88806c00e300
raw: ffff8880683b1800 000000008010000a 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Reported-by: Kyungtae Kim <kt0755@gmail.com>
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 drivers/usb/gadget/function/f_printer.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 9c7ed2539ff7..8ed1295d7e35 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -31,6 +31,7 @@
 #include <linux/types.h>
 #include <linux/ctype.h>
 #include <linux/cdev.h>
+#include <linux/kref.h>
 
 #include <asm/byteorder.h>
 #include <linux/io.h>
@@ -64,7 +65,7 @@ struct printer_dev {
 	struct usb_gadget	*gadget;
 	s8			interface;
 	struct usb_ep		*in_ep, *out_ep;
-
+	struct kref             kref;
 	struct list_head	rx_reqs;	/* List of free RX structs */
 	struct list_head	rx_reqs_active;	/* List of Active RX xfers */
 	struct list_head	rx_buffers;	/* List of completed xfers */
@@ -218,6 +219,13 @@ static inline struct usb_endpoint_descriptor *ep_desc(struct usb_gadget *gadget,
 
 /*-------------------------------------------------------------------------*/
 
+static void printer_dev_free(struct kref *kref)
+{
+	struct printer_dev *dev = container_of(kref, struct printer_dev, kref);
+
+	kfree(dev);
+}
+
 static struct usb_request *
 printer_req_alloc(struct usb_ep *ep, unsigned len, gfp_t gfp_flags)
 {
@@ -348,6 +356,7 @@ printer_open(struct inode *inode, struct file *fd)
 
 	spin_unlock_irqrestore(&dev->lock, flags);
 
+	kref_get(&dev->kref);
 	DBG(dev, "printer_open returned %x\n", ret);
 	return ret;
 }
@@ -365,6 +374,7 @@ printer_close(struct inode *inode, struct file *fd)
 	dev->printer_status &= ~PRINTER_SELECTED;
 	spin_unlock_irqrestore(&dev->lock, flags);
 
+	kref_put(&dev->kref, printer_dev_free);
 	DBG(dev, "printer_close\n");
 
 	return 0;
@@ -1350,7 +1360,8 @@ static void gprinter_free(struct usb_function *f)
 	struct f_printer_opts *opts;
 
 	opts = container_of(f->fi, struct f_printer_opts, func_inst);
-	kfree(dev);
+
+	kref_put(&dev->kref, printer_dev_free);
 	mutex_lock(&opts->lock);
 	--opts->refcnt;
 	mutex_unlock(&opts->lock);
@@ -1419,6 +1430,7 @@ static struct usb_function *gprinter_alloc(struct usb_function_instance *fi)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	kref_init(&dev->kref);
 	++opts->refcnt;
 	dev->minor = opts->minor;
 	dev->pnp_string = opts->pnp_string;
-- 
2.24.1

