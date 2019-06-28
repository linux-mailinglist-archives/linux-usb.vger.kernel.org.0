Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1C359FE3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 17:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfF1Put (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 11:50:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59752 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfF1Pus (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 11:50:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2E3353082B43;
        Fri, 28 Jun 2019 15:50:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-219.rdu2.redhat.com [10.10.120.219])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 135965D71B;
        Fri, 28 Jun 2019 15:50:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/6] vfs: Add a mount-notification facility [ver #5]
From:   David Howells <dhowells@redhat.com>
To:     viro@zeniv.linux.org.uk
Cc:     dhowells@redhat.com, Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        nicolas.dichtel@6wind.com, raven@themaw.net,
        Christian Brauner <christian@brauner.io>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-block@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 28 Jun 2019 16:50:44 +0100
Message-ID: <156173704415.15650.4547638158176391624.stgit@warthog.procyon.org.uk>
In-Reply-To: <156173701358.15650.8735203424342507015.stgit@warthog.procyon.org.uk>
References: <156173701358.15650.8735203424342507015.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 28 Jun 2019 15:50:48 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a mount notification facility whereby notifications about changes in
mount topology and configuration can be received.  Note that this only
covers vfsmount topology changes and not superblock events.  A separate
facility will be added for that.

Firstly, an event queue needs to be created:

	fd = open("/dev/event_queue", O_RDWR);
	ioctl(fd, IOC_WATCH_QUEUE_SET_SIZE, page_size << n);

then a notification can be set up to report notifications via that queue:

	struct watch_notification_filter filter = {
		.nr_filters = 1,
		.filters = {
			[0] = {
				.type = WATCH_TYPE_MOUNT_NOTIFY,
				.subtype_filter[0] = UINT_MAX,
			},
		},
	};
	ioctl(fd, IOC_WATCH_QUEUE_SET_FILTER, &filter);
	watch_mount(AT_FDCWD, "/", 0, fd, 0x02);

In this case, it would let me monitor the mount topology subtree rooted at
"/" for events.  Mount notifications propagate up the tree towards the
root, so a watch will catch all of the events happening in the subtree
rooted at the watch.

After setting the watch, records will be placed into the queue when, for
example, as superblock switches between read-write and read-only.  Records
are of the following format:

	struct mount_notification {
		struct watch_notification watch;
		__u32	triggered_on;
		__u32	changed_mount;
	} *n;

Where:

	n->watch.type will be WATCH_TYPE_MOUNT_NOTIFY.

	n->watch.subtype will indicate the type of event, such as
	NOTIFY_MOUNT_NEW_MOUNT.

	n->watch.info & WATCH_INFO_LENGTH will indicate the length of the
	record.

	n->watch.info & WATCH_INFO_ID will be the fifth argument to
	watch_mount(), shifted.

	n->watch.info & NOTIFY_MOUNT_IN_SUBTREE if true indicates that the
	notifcation was generated in the mount subtree rooted at the watch,
	and not actually in the watch itself.

	n->watch.info & NOTIFY_MOUNT_IS_RECURSIVE if true indicates that
	the notifcation was generated by an event (eg. SETATTR) that was
	applied recursively.  The notification is only generated for the
	object that initially triggered it.

	n->watch.info & NOTIFY_MOUNT_IS_NOW_RO will be used for
	NOTIFY_MOUNT_READONLY, being set if the superblock becomes R/O, and
	being cleared otherwise, and for NOTIFY_MOUNT_NEW_MOUNT, being set
	if the new mount is a submount (e.g. an automount).

	n->watch.info & NOTIFY_MOUNT_IS_SUBMOUNT if true indicates that the
	NOTIFY_MOUNT_NEW_MOUNT notification is in response to a mount
	performed by the kernel (e.g. an automount).

	n->triggered_on indicates the ID of the mount on which the watch
	was installed.

	n->changed_mount indicates the ID of the mount that was affected.

The mount IDs can be retrieved with the fsinfo() syscall, using the
fsinfo_mount_info and fsinfo_mount_child attributes.  There are change
notification counters there too for when a buffer overrun occurs, thereby
allowing the mount tree to be quickly rescanned.

Note that it is permissible for event records to be of variable length -
or, at least, the length may be dependent on the subtype.  Note also that
the queue can be shared between multiple notifications of various types.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 arch/alpha/kernel/syscalls/syscall.tbl      |    1 
 arch/arm/tools/syscall.tbl                  |    1 
 arch/arm64/include/asm/unistd.h             |    2 
 arch/ia64/kernel/syscalls/syscall.tbl       |    1 
 arch/m68k/kernel/syscalls/syscall.tbl       |    1 
 arch/microblaze/kernel/syscalls/syscall.tbl |    1 
 arch/mips/kernel/syscalls/syscall_n32.tbl   |    1 
 arch/mips/kernel/syscalls/syscall_n64.tbl   |    1 
 arch/mips/kernel/syscalls/syscall_o32.tbl   |    1 
 arch/parisc/kernel/syscalls/syscall.tbl     |    1 
 arch/powerpc/kernel/syscalls/syscall.tbl    |    1 
 arch/s390/kernel/syscalls/syscall.tbl       |    1 
 arch/sh/kernel/syscalls/syscall.tbl         |    1 
 arch/sparc/kernel/syscalls/syscall.tbl      |    1 
 arch/x86/entry/syscalls/syscall_32.tbl      |    1 
 arch/x86/entry/syscalls/syscall_64.tbl      |    1 
 arch/xtensa/kernel/syscalls/syscall.tbl     |    1 
 fs/Kconfig                                  |    9 +
 fs/Makefile                                 |    1 
 fs/mount.h                                  |   33 +++--
 fs/mount_notify.c                           |  188 +++++++++++++++++++++++++++
 fs/namespace.c                              |   16 ++
 include/linux/dcache.h                      |    1 
 include/linux/syscalls.h                    |    2 
 include/uapi/asm-generic/unistd.h           |    4 -
 include/uapi/linux/watch_queue.h            |   32 ++++-
 kernel/sys_ni.c                             |    1 
 27 files changed, 287 insertions(+), 18 deletions(-)
 create mode 100644 fs/mount_notify.c

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 1aee39ab62ac..fbf0d0f5cfb3 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -475,3 +475,4 @@
 543	common	fspick				sys_fspick
 544	common	fsinfo				sys_fsinfo
 545	common	watch_devices			sys_watch_devices
+546	common	watch_mount			sys_watch_mount
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index 35e4557af12d..a15324ed6419 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -449,3 +449,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index e8f7d95a1481..d04eb26cfaeb 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -44,7 +44,7 @@
 #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
 #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 
-#define __NR_compat_syscalls		435
+#define __NR_compat_syscalls		436
 #endif
 
 #define __ARCH_WANT_SYS_CLONE
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index 796e60d26d47..2e7becfa2f56 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -356,3 +356,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 64ac06b4ac16..3431e8df17f5 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -435,3 +435,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index cfba0cdbdf26..fbe3c932c3d8 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -441,3 +441,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 23a9ccb23113..e2f6e92ed8c5 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -374,3 +374,4 @@
 433	n32	fspick				sys_fspick
 434	n32	fsinfo				sys_fsinfo
 435	n32	watch_devices			sys_watch_devices
+436	n32	watch_mount			sys_watch_mount
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 43e25257fa13..bdd1f98f3515 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -350,3 +350,4 @@
 433	n64	fspick				sys_fspick
 434	n64	fsinfo				sys_fsinfo
 435	n64	watch_devices			sys_watch_devices
+436	n64	watch_mount			sys_watch_mount
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index f3e66772e497..ff992a6fdd95 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -423,3 +423,4 @@
 433	o32	fspick				sys_fspick
 434	o32	fsinfo				sys_fsinfo
 435	o32	watch_devices			sys_watch_devices
+436	o32	watch_mount			sys_watch_mount
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index e3237dac3acb..11ae6854d49c 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -432,3 +432,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 11e9bcf7cc83..7bc79d837385 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -517,3 +517,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index e7daacbe2d68..e2f8785d1c4a 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -438,3 +438,4 @@
 433  common	fspick			sys_fspick			sys_fspick
 434	common	fsinfo			sys_fsinfo			sys_fsinfo
 435	common	watch_devices		sys_watch_devices		sys_watch_devices
+436	common	watch_mount		sys_watch_mount			sys_watch_mount
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index 6ae830c9c13a..d94d71558742 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -438,3 +438,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 860b2bd72a48..9f7fa4f381cc 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -481,3 +481,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 9ee8a11a9148..ea34893de5b9 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -440,3 +440,4 @@
 433	i386	fspick			sys_fspick			__ia32_sys_fspick
 434	i386	fsinfo			sys_fsinfo			__ia32_sys_fsinfo
 435	i386	watch_devices		sys_watch_devices		__ia32_sys_watch_devices
+436	i386	watch_mount		sys_watch_mount			__ia32_sys_watch_mount
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index 344ffc3a98be..b6f3fdbee456 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -357,6 +357,7 @@
 433	common	fspick			__x64_sys_fspick
 434	common	fsinfo			__x64_sys_fsinfo
 435	common	watch_devices		__x64_sys_watch_devices
+436	common	watch_mount		__x64_sys_watch_mount
 
 #
 # x32-specific system call numbers start at 512 to avoid cache impact
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index 941dae94159b..570b23dc5582 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -406,3 +406,4 @@
 433	common	fspick				sys_fspick
 434	common	fsinfo				sys_fsinfo
 435	common	watch_devices			sys_watch_devices
+436	common	watch_mount			sys_watch_mount
diff --git a/fs/Kconfig b/fs/Kconfig
index 9e7d2f2c0111..a26bbe27a791 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -121,6 +121,15 @@ source "fs/crypto/Kconfig"
 
 source "fs/notify/Kconfig"
 
+config MOUNT_NOTIFICATIONS
+	bool "Mount topology change notifications"
+	select WATCH_QUEUE
+	help
+	  This option provides support for getting change notifications on the
+	  mount tree topology.  This makes use of the /dev/watch_queue misc
+	  device to handle the notification buffer and provides the
+	  mount_notify() system call to enable/disable watchpoints.
+
 source "fs/quota/Kconfig"
 
 source "fs/autofs/Kconfig"
diff --git a/fs/Makefile b/fs/Makefile
index 26eaeae4b9a1..c6a71daf2464 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -131,3 +131,4 @@ obj-$(CONFIG_F2FS_FS)		+= f2fs/
 obj-$(CONFIG_CEPH_FS)		+= ceph/
 obj-$(CONFIG_PSTORE)		+= pstore/
 obj-$(CONFIG_EFIVAR_FS)		+= efivarfs/
+obj-$(CONFIG_MOUNT_NOTIFICATIONS) += mount_notify.o
diff --git a/fs/mount.h b/fs/mount.h
index 65cb51f47c8c..4711e7d603a9 100644
--- a/fs/mount.h
+++ b/fs/mount.h
@@ -4,6 +4,7 @@
 #include <linux/poll.h>
 #include <linux/ns_common.h>
 #include <linux/fs_pin.h>
+#include <linux/watch_queue.h>
 
 struct mnt_namespace {
 	atomic_t		count;
@@ -67,10 +68,14 @@ struct mount {
 	int mnt_id;			/* mount identifier */
 	int mnt_group_id;		/* peer group identifier */
 	int mnt_expiry_mark;		/* true if marked for expiry */
+	int mnt_nr_watchers;		/* The number of subtree watches tracking this */
 	struct hlist_head mnt_pins;
 	struct fs_pin mnt_umount;
 	struct dentry *mnt_ex_mountpoint;
 	atomic_t mnt_change_counter;	/* Number of changed applied */
+#ifdef CONFIG_MOUNT_NOTIFICATIONS
+	struct watch_list *mnt_watchers; /* Watches on dentries within this mount */
+#endif
 } __randomize_layout;
 
 #define MNT_NS_INTERNAL ERR_PTR(-EINVAL) /* distinct from any mnt_namespace */
@@ -153,18 +158,8 @@ static inline bool is_anon_ns(struct mnt_namespace *ns)
 	return ns->seq == 0;
 }
 
-/*
- * Type of mount topology change notification.
- */
-enum mount_notification_subtype {
-	NOTIFY_MOUNT_NEW_MOUNT	= 0, /* New mount added */
-	NOTIFY_MOUNT_UNMOUNT	= 1, /* Mount removed manually */
-	NOTIFY_MOUNT_EXPIRY	= 2, /* Automount expired */
-	NOTIFY_MOUNT_READONLY	= 3, /* Mount R/O state changed */
-	NOTIFY_MOUNT_SETATTR	= 4, /* Mount attributes changed */
-	NOTIFY_MOUNT_MOVE_FROM	= 5, /* Mount moved from here */
-	NOTIFY_MOUNT_MOVE_TO	= 6, /* Mount moved to here (compare op_id) */
-};
+extern void post_mount_notification(struct mount *changed,
+				    struct mount_notification *notify);
 
 static inline void notify_mount(struct mount *changed,
 				struct mount *aux,
@@ -172,4 +167,18 @@ static inline void notify_mount(struct mount *changed,
 				u32 info_flags)
 {
 	atomic_inc(&changed->mnt_change_counter);
+
+#ifdef CONFIG_MOUNT_NOTIFICATIONS
+	{
+		struct mount_notification n = {
+			.watch.type	= WATCH_TYPE_MOUNT_NOTIFY,
+			.watch.subtype	= subtype,
+			.watch.info	= info_flags | watch_sizeof(n),
+			.triggered_on	= changed->mnt_id,
+			.changed_mount	= aux ? aux->mnt_id : 0,
+		};
+
+		post_mount_notification(changed, &n);
+	}
+#endif
 }
diff --git a/fs/mount_notify.c b/fs/mount_notify.c
new file mode 100644
index 000000000000..a8d6187c6262
--- /dev/null
+++ b/fs/mount_notify.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Provide mount topology/attribute change notifications.
+ *
+ * Copyright (C) 2019 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/fs.h>
+#include <linux/namei.h>
+#include <linux/syscalls.h>
+#include <linux/slab.h>
+#include <linux/security.h>
+#include "mount.h"
+
+/*
+ * Post mount notifications to all watches going rootwards along the tree.
+ *
+ * Must be called with the mount_lock held.
+ */
+void post_mount_notification(struct mount *changed,
+			     struct mount_notification *notify)
+{
+	const struct cred *cred = current_cred();
+	struct path cursor;
+	struct mount *mnt;
+	unsigned seq;
+
+	seq = 0;
+	rcu_read_lock();
+restart:
+	cursor.mnt = &changed->mnt;
+	cursor.dentry = changed->mnt.mnt_root;
+	mnt = real_mount(cursor.mnt);
+	notify->watch.info &= ~NOTIFY_MOUNT_IN_SUBTREE;
+
+	read_seqbegin_or_lock(&rename_lock, &seq);
+	for (;;) {
+		if (mnt->mnt_watchers &&
+		    !hlist_empty(&mnt->mnt_watchers->watchers)) {
+			if (cursor.dentry->d_flags & DCACHE_MOUNT_WATCH)
+				post_watch_notification(mnt->mnt_watchers,
+							&notify->watch, cred,
+							(unsigned long)cursor.dentry);
+		} else {
+			cursor.dentry = mnt->mnt.mnt_root;
+		}
+		notify->watch.info |= NOTIFY_MOUNT_IN_SUBTREE;
+
+		if (cursor.dentry == cursor.mnt->mnt_root ||
+		    IS_ROOT(cursor.dentry)) {
+			struct mount *parent = READ_ONCE(mnt->mnt_parent);
+
+			/* Escaped? */
+			if (cursor.dentry != cursor.mnt->mnt_root)
+				break;
+
+			/* Global root? */
+			if (mnt == parent)
+				break;
+
+			cursor.dentry = READ_ONCE(mnt->mnt_mountpoint);
+			mnt = parent;
+			cursor.mnt = &mnt->mnt;
+		} else {
+			cursor.dentry = cursor.dentry->d_parent;
+		}
+	}
+
+	if (need_seqretry(&rename_lock, seq)) {
+		seq = 1;
+		goto restart;
+	}
+
+	done_seqretry(&rename_lock, seq);
+	rcu_read_unlock();
+}
+
+static void release_mount_watch(struct watch *watch)
+{
+	struct dentry *dentry = (struct dentry *)(unsigned long)watch->id;
+
+	dput(dentry);
+}
+
+/**
+ * sys_watch_mount - Watch for mount topology/attribute changes
+ * @dfd: Base directory to pathwalk from or fd referring to mount.
+ * @filename: Path to mount to place the watch upon
+ * @at_flags: Pathwalk control flags
+ * @watch_fd: The watch queue to send notifications to.
+ * @watch_id: The watch ID to be placed in the notification (-1 to remove watch)
+ */
+SYSCALL_DEFINE5(watch_mount,
+		int, dfd,
+		const char __user *, filename,
+		unsigned int, at_flags,
+		int, watch_fd,
+		int, watch_id)
+{
+	struct watch_queue *wqueue;
+	struct watch_list *wlist = NULL;
+	struct watch *watch;
+	struct mount *m;
+	struct path path;
+	unsigned int lookup_flags =
+		LOOKUP_DIRECTORY | LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT;
+	int ret;
+
+	if (watch_id < -1 || watch_id > 0xff)
+		return -EINVAL;
+	if ((at_flags & ~(AT_NO_AUTOMOUNT | AT_EMPTY_PATH)) != 0)
+		return -EINVAL;
+	if (at_flags & AT_NO_AUTOMOUNT)
+		lookup_flags &= ~LOOKUP_AUTOMOUNT;
+	if (at_flags & AT_EMPTY_PATH)
+		lookup_flags |= LOOKUP_EMPTY;
+
+	ret = user_path_at(dfd, filename, lookup_flags, &path);
+	if (ret)
+		return ret;
+
+	ret = inode_permission(path.dentry->d_inode, MAY_EXEC);
+	if (ret)
+		goto err_path;
+
+	wqueue = get_watch_queue(watch_fd);
+	if (IS_ERR(wqueue))
+		goto err_path;
+
+	m = real_mount(path.mnt);
+
+	if (watch_id >= 0) {
+		ret = -ENOMEM;
+		if (!m->mnt_watchers) {
+			wlist = kzalloc(sizeof(*wlist), GFP_KERNEL);
+			if (!wlist)
+				goto err_wqueue;
+			init_watch_list(wlist, release_mount_watch);
+		}
+
+		watch = kzalloc(sizeof(*watch), GFP_KERNEL);
+		if (!watch)
+			goto err_wlist;
+
+		init_watch(watch, wqueue);
+		watch->id		= (unsigned long)path.dentry;
+		watch->info_id		= (u32)watch_id << 24;
+
+		ret = security_watch_mount(watch, &path);
+		if (ret < 0)
+			goto err_watch;
+
+		down_write(&m->mnt.mnt_sb->s_umount);
+		if (!m->mnt_watchers) {
+			m->mnt_watchers = wlist;
+			wlist = NULL;
+		}
+
+		ret = add_watch_to_object(watch, m->mnt_watchers);
+		if (ret == 0) {
+			spin_lock(&path.dentry->d_lock);
+			path.dentry->d_flags |= DCACHE_MOUNT_WATCH;
+			spin_unlock(&path.dentry->d_lock);
+			dget(path.dentry);
+			watch = NULL;
+		}
+		up_write(&m->mnt.mnt_sb->s_umount);
+	} else {
+		ret = -EBADSLT;
+		if (m->mnt_watchers) {
+			down_write(&m->mnt.mnt_sb->s_umount);
+			ret = remove_watch_from_object(m->mnt_watchers, wqueue,
+						       (unsigned long)path.dentry,
+						       false);
+			up_write(&m->mnt.mnt_sb->s_umount);
+		}
+	}
+
+err_watch:
+	kfree(watch);
+err_wlist:
+	kfree(wlist);
+err_wqueue:
+	put_watch_queue(wqueue);
+err_path:
+	path_put(&path);
+	return ret;
+}
diff --git a/fs/namespace.c b/fs/namespace.c
index 925602b8c329..71cbd192a306 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -183,6 +183,10 @@ unsigned int mnt_get_count(struct mount *mnt)
 static void drop_mountpoint(struct fs_pin *p)
 {
 	struct mount *m = container_of(p, struct mount, mnt_umount);
+#ifdef CONFIG_MOUNT_NOTIFICATIONS
+	if (m->mnt_watchers)
+		remove_watch_list(m->mnt_watchers);
+#endif
 	dput(m->mnt_ex_mountpoint);
 	pin_remove(p);
 	mntput(&m->mnt);
@@ -515,7 +519,8 @@ static int mnt_make_readonly(struct mount *mnt)
 	mnt->mnt.mnt_flags &= ~MNT_WRITE_HOLD;
 	unlock_mount_hash();
 	if (ret == 0)
-		notify_mount(mnt, NULL, NOTIFY_MOUNT_READONLY, 0x10000);
+		notify_mount(mnt, NULL, NOTIFY_MOUNT_READONLY,
+			     NOTIFY_MOUNT_IS_NOW_RO);
 	return ret;
 }
 
@@ -2113,7 +2118,11 @@ static int attach_recursive_mnt(struct mount *source_mnt,
 			list_del_init(&source_mnt->mnt_ns->list);
 		}
 		mnt_set_mountpoint(dest_mnt, dest_mp, source_mnt);
-		notify_mount(dest_mnt, source_mnt, NOTIFY_MOUNT_NEW_MOUNT, 0);
+		notify_mount(dest_mnt, source_mnt, NOTIFY_MOUNT_NEW_MOUNT,
+			     (source_mnt->mnt.mnt_sb->s_flags & SB_RDONLY ?
+			      NOTIFY_MOUNT_IS_NOW_RO : 0) |
+			     (source_mnt->mnt.mnt_sb->s_flags & SB_SUBMOUNT ?
+			      NOTIFY_MOUNT_IS_SUBMOUNT : 0));
 		commit_tree(source_mnt);
 	}
 
@@ -2490,7 +2499,8 @@ static void set_mount_attributes(struct mount *mnt, unsigned int mnt_flags)
 	mnt->mnt.mnt_flags = mnt_flags;
 	touch_mnt_namespace(mnt->mnt_ns);
 	unlock_mount_hash();
-	notify_mount(mnt, NULL, NOTIFY_MOUNT_SETATTR, 0);
+	notify_mount(mnt, NULL, NOTIFY_MOUNT_SETATTR,
+		     (mnt_flags & SB_RDONLY ? NOTIFY_MOUNT_IS_NOW_RO : 0));
 }
 
 /*
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index f14e587c5d5d..a9e5b0070d6d 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -217,6 +217,7 @@ struct dentry_operations {
 #define DCACHE_PAR_LOOKUP		0x10000000 /* being looked up (with parent locked shared) */
 #define DCACHE_DENTRY_CURSOR		0x20000000
 #define DCACHE_NORCU			0x40000000 /* No RCU delay for freeing */
+#define DCACHE_MOUNT_WATCH		0x80000000 /* There's a mount watch here */
 
 extern seqlock_t rename_lock;
 
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 52cc2dd6d5aa..8b0ab1594a62 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1002,6 +1002,8 @@ asmlinkage long sys_fsinfo(int dfd, const char __user *pathname,
 			   struct fsinfo_params __user *params,
 			   void __user *buffer, size_t buf_size);
 asmlinkage long sys_watch_devices(int watch_fd, int watch_id, unsigned int flags);
+asmlinkage long sys_watch_mount(int dfd, const char __user *path,
+				unsigned int at_flags, int watch_fd, int watch_id);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 8ed4e1c73f6a..85977cfa853d 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -848,9 +848,11 @@ __SYSCALL(__NR_fspick, sys_fspick)
 __SYSCALL(__NR_fsinfo, sys_fsinfo)
 #define __NR_watch_devices 435
 __SYSCALL(__NR_watch_devices, sys_watch_devices)
+#define __NR_watch_mount 436
+__SYSCALL(__NR_watch_mount, sys_watch_mount)
 
 #undef __NR_syscalls
-#define __NR_syscalls 436
+#define __NR_syscalls 437
 
 /*
  * 32 bit systems traditionally used different
diff --git a/include/uapi/linux/watch_queue.h b/include/uapi/linux/watch_queue.h
index 7e695ac43104..1dce57287ded 100644
--- a/include/uapi/linux/watch_queue.h
+++ b/include/uapi/linux/watch_queue.h
@@ -13,7 +13,8 @@ enum watch_notification_type {
 	WATCH_TYPE_KEY_NOTIFY	= 1,	/* Key change event notification */
 	WATCH_TYPE_BLOCK_NOTIFY	= 2,	/* Block layer event notification */
 	WATCH_TYPE_USB_NOTIFY	= 3,	/* USB subsystem event notification */
-	WATCH_TYPE___NR		= 4
+	WATCH_TYPE_MOUNT_NOTIFY	= 4,	/* Mount topology change notification */
+	WATCH_TYPE___NR		= 5
 };
 
 enum watch_meta_notification_subtype {
@@ -167,4 +168,33 @@ struct usb_notification {
 
 #define USB_NOTIFICATION_MAX_NAME_LEN 63
 
+/*
+ * Type of mount topology change notification.
+ */
+enum mount_notification_subtype {
+	NOTIFY_MOUNT_NEW_MOUNT	= 0, /* New mount added */
+	NOTIFY_MOUNT_UNMOUNT	= 1, /* Mount removed manually */
+	NOTIFY_MOUNT_EXPIRY	= 2, /* Automount expired */
+	NOTIFY_MOUNT_READONLY	= 3, /* Mount R/O state changed */
+	NOTIFY_MOUNT_SETATTR	= 4, /* Mount attributes changed */
+	NOTIFY_MOUNT_MOVE_FROM	= 5, /* Mount moved from here */
+	NOTIFY_MOUNT_MOVE_TO	= 6, /* Mount moved to here (compare op_id) */
+};
+
+#define NOTIFY_MOUNT_IN_SUBTREE		WATCH_INFO_FLAG_0 /* Event not actually at watched dentry */
+#define NOTIFY_MOUNT_IS_RECURSIVE	WATCH_INFO_FLAG_1 /* Change applied recursively */
+#define NOTIFY_MOUNT_IS_NOW_RO		WATCH_INFO_FLAG_2 /* Mount changed to R/O */
+#define NOTIFY_MOUNT_IS_SUBMOUNT	WATCH_INFO_FLAG_3 /* New mount is submount */
+
+/*
+ * Mount topology/configuration change notification record.
+ * - watch.type = WATCH_TYPE_MOUNT_NOTIFY
+ * - watch.subtype = enum mount_notification_subtype
+ */
+struct mount_notification {
+	struct watch_notification watch; /* WATCH_TYPE_MOUNT_NOTIFY */
+	__u32	triggered_on;		/* The mount that the notify was on */
+	__u32	changed_mount;		/* The mount that got changed */
+};
+
 #endif /* _UAPI_LINUX_WATCH_QUEUE_H */
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index 9d583aae405f..3755d0e5d748 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -53,6 +53,7 @@ COND_SYSCALL(io_uring_enter);
 COND_SYSCALL(io_uring_register);
 COND_SYSCALL(fsinfo);
 COND_SYSCALL(watch_devices);
+COND_SYSCALL(watch_mount);
 
 /* fs/xattr.c */
 

