Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF71A17E715
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 19:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgCIS1T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 14:27:19 -0400
Received: from mail-qv1-f74.google.com ([209.85.219.74]:48606 "EHLO
        mail-qv1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbgCIS1S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 14:27:18 -0400
Received: by mail-qv1-f74.google.com with SMTP id l16so7309337qvo.15
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FGj5q0Yb6jj5wRzA0gLc2PX0YoJzn3UwC2YsDDaD5W4=;
        b=MxmKitUtpIx4m0JFpXv+1YaofqjYdV3ThhIysufFZHaPpiE/Q0Jc3TSWnjV0L/GEm9
         q5dDawI2aoaupIZ+A1PS+0iygf/WBP+MzYaZ2LGIOg87uwTjvYD3FRfp6PKAFHBd6bu3
         b8+KIIieHcDRqNUa14nHQJ1P7RIcK1Gi583nmydQu38FtpNSKi9K//NhKQabvRW2hN9k
         7XQzRLPYAOpmq+bidemIee9t/45RXBzfZILQBr3GrkiwWl66pClqPG5u0W31kSNzB/6P
         ta4j2edZtUiZJWc5YBdQdZdnb7b9UZxOEoI6APJnM0hK7MRo5Dnf3WPzzDgp8k39jBHl
         8Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FGj5q0Yb6jj5wRzA0gLc2PX0YoJzn3UwC2YsDDaD5W4=;
        b=hDrO6oB8HthdAEdjBXBzwGs8ZoOno7ozAK5ml6OM23I9pzYvF4eCXgpeR0LYMhE3Gp
         uIlFWwWIDhmYCvlvlSA8bg92Uf4DYUcufMHuovhZ/xf9xt4tM5rFC7s+xhSaPgYMcSZ3
         sp/LvKQnmJvheSpKVw1/nHvZRxuGTXtOK/sx1MdBIf4euhg7AGVweOlvhaidm7h5pk2d
         hsDypCx7axuYpeDCULJ6U5chzFjpc1sqfJw+wjGVChPhZRCpMWQnL8BSerm4pjher4cA
         GqX/uZynrzvEEE43VCG5s+wrRrPlAeVGW7/PG2WTTkkZYJqKCcBTym8qaqqpPs4fr4Cn
         RBlQ==
X-Gm-Message-State: ANhLgQ3foYhAF9R+TWZQRhvMvh4X4OnXSqsQynqFgc0JEJuyerki68BT
        Kod+WAudVyIL8b7vxSXJcY158MAwx0B0DXgq
X-Google-Smtp-Source: ADFU+vth2NVRGpusbI8ca1ZUZBuC52oB8OAFJGeT/fSxs/zvdrZsSS3IvvVAFQ1KA3kslWqQG2aY7KoWKpN4UfGp
X-Received: by 2002:ac8:1e90:: with SMTP id c16mr15564634qtm.265.1583778436745;
 Mon, 09 Mar 2020 11:27:16 -0700 (PDT)
Date:   Mon,  9 Mar 2020 19:27:05 +0100
In-Reply-To: <cover.1583778264.git.andreyknvl@google.com>
Message-Id: <1cc65812b7bf69ed61f3121627431081ed08c25c.1583778264.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1583778264.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v2 2/3] kcov: collect coverage from interrupts
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change extends kcov remote coverage support to allow collecting
coverage from soft interrupts in addition to kernel background threads.

To collect coverage from code that is executed in softirq context, a
part of that code has to be annotated with kcov_remote_start/stop() in a
similar way as how it is done for global kernel background threads. Then
the handle used for the annotations has to be passed to the
KCOV_REMOTE_ENABLE ioctl.

Internally this patch adjusts the __sanitizer_cov_trace_pc() compiler
inserted callback to not bail out when called from softirq context.
kcov_remote_start/stop() are updated to save/restore the current per
task kcov state in a per-cpu area (in case the softirq came when the
kernel was already collecting coverage in task context). Coverage from
softirqs is collected into pre-allocated per-cpu areas, whose size is
controlled by the new CONFIG_KCOV_IRQ_AREA_SIZE.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/dev-tools/kcov.rst |  17 +--
 include/linux/sched.h            |   3 +
 kernel/kcov.c                    | 203 +++++++++++++++++++++++--------
 lib/Kconfig.debug                |   9 ++
 4 files changed, 175 insertions(+), 57 deletions(-)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 1c4e1825d769..8548b0b04e43 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -217,14 +217,15 @@ This allows to collect coverage from two types of kernel background
 threads: the global ones, that are spawned during kernel boot in a limited
 number of instances (e.g. one USB hub_event() worker thread is spawned per
 USB HCD); and the local ones, that are spawned when a user interacts with
-some kernel interface (e.g. vhost workers).
+some kernel interface (e.g. vhost workers); as well as from soft
+interrupts.
 
-To enable collecting coverage from a global background thread, a unique
-global handle must be assigned and passed to the corresponding
-kcov_remote_start() call. Then a userspace process can pass a list of such
-handles to the KCOV_REMOTE_ENABLE ioctl in the handles array field of the
-kcov_remote_arg struct. This will attach the used kcov device to the code
-sections, that are referenced by those handles.
+To enable collecting coverage from a global background thread or from a
+softirq, a unique global handle must be assigned and passed to the
+corresponding kcov_remote_start() call. Then a userspace process can pass
+a list of such handles to the KCOV_REMOTE_ENABLE ioctl in the handles
+array field of the kcov_remote_arg struct. This will attach the used kcov
+device to the code sections, that are referenced by those handles.
 
 Since there might be many local background threads spawned from different
 userspace processes, we can't use a single global handle per annotation.
@@ -242,7 +243,7 @@ handles as they don't belong to a particular subsystem. The bytes 4-7 are
 currently reserved and must be zero. In the future the number of bytes
 used for the subsystem or handle ids might be increased.
 
-When a particular userspace proccess collects coverage by via a common
+When a particular userspace proccess collects coverage via a common
 handle, kcov will collect coverage for each code section that is annotated
 to use the common handle obtained as kcov_handle from the current
 task_struct. However non common handles allow to collect coverage
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 04278493bf15..ce47d685fa55 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1229,6 +1229,9 @@ struct task_struct {
 
 	/* KCOV sequence number: */
 	int				kcov_sequence;
+
+	/* Collect coverage from softirq context: */
+	bool				kcov_softirq;
 #endif
 
 #ifdef CONFIG_MEMCG
diff --git a/kernel/kcov.c b/kernel/kcov.c
index f6bd119c9419..db327c6835bb 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -26,6 +26,7 @@
 #include <asm/setup.h>
 
 #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
+#define kcov_err(fmt, ...) pr_err("%s: " fmt, __func__, ##__VA_ARGS__)
 
 /* Number of 64-bit words written per one comparison: */
 #define KCOV_WORDS_PER_CMP 4
@@ -86,6 +87,18 @@ static DEFINE_SPINLOCK(kcov_remote_lock);
 static DEFINE_HASHTABLE(kcov_remote_map, 4);
 static struct list_head kcov_remote_areas = LIST_HEAD_INIT(kcov_remote_areas);
 
+struct kcov_percpu_data {
+	void			*irq_area;
+
+	unsigned int		saved_mode;
+	unsigned int		saved_size;
+	void			*saved_area;
+	struct kcov		*saved_kcov;
+	int			saved_sequence;
+};
+
+DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data);
+
 /* Must be called with kcov_remote_lock locked. */
 static struct kcov_remote *kcov_remote_find(u64 handle)
 {
@@ -145,9 +158,10 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 
 	/*
 	 * We are interested in code coverage as a function of a syscall inputs,
-	 * so we ignore code executed in interrupts.
+	 * so we ignore code executed in interrupts, unless we are in a remote
+	 * coverage collection section in a softirq.
 	 */
-	if (!in_task())
+	if (!in_task() && !(in_serving_softirq() && t->kcov_softirq))
 		return false;
 	mode = READ_ONCE(t->kcov_mode);
 	/*
@@ -316,10 +330,10 @@ static void kcov_start(struct task_struct *t, unsigned int size,
 	/* Cache in task struct for performance. */
 	t->kcov_size = size;
 	t->kcov_area = area;
+	t->kcov_sequence = sequence;
 	/* See comment in check_kcov_mode(). */
 	barrier();
 	WRITE_ONCE(t->kcov_mode, mode);
-	t->kcov_sequence = sequence;
 }
 
 static void kcov_stop(struct task_struct *t)
@@ -328,12 +342,12 @@ static void kcov_stop(struct task_struct *t)
 	barrier();
 	t->kcov_size = 0;
 	t->kcov_area = NULL;
+	t->kcov = NULL;
 }
 
 static void kcov_task_reset(struct task_struct *t)
 {
 	kcov_stop(t);
-	t->kcov = NULL;
 	t->kcov_sequence = 0;
 	t->kcov_handle = 0;
 }
@@ -358,8 +372,9 @@ static void kcov_remote_reset(struct kcov *kcov)
 	int bkt;
 	struct kcov_remote *remote;
 	struct hlist_node *tmp;
+	unsigned long flags;
 
-	spin_lock(&kcov_remote_lock);
+	spin_lock_irqsave(&kcov_remote_lock, flags);
 	hash_for_each_safe(kcov_remote_map, bkt, tmp, remote, hnode) {
 		if (remote->kcov != kcov)
 			continue;
@@ -368,7 +383,7 @@ static void kcov_remote_reset(struct kcov *kcov)
 	}
 	/* Do reset before unlock to prevent races with kcov_remote_start(). */
 	kcov_reset(kcov);
-	spin_unlock(&kcov_remote_lock);
+	spin_unlock_irqrestore(&kcov_remote_lock, flags);
 }
 
 static void kcov_disable(struct task_struct *t, struct kcov *kcov)
@@ -397,12 +412,13 @@ static void kcov_put(struct kcov *kcov)
 void kcov_task_exit(struct task_struct *t)
 {
 	struct kcov *kcov;
+	unsigned long flags;
 
 	kcov = t->kcov;
 	if (kcov == NULL)
 		return;
 
-	spin_lock(&kcov->lock);
+	spin_lock_irqsave(&kcov->lock, flags);
 	kcov_debug("t = %px, kcov->t = %px\n", t, kcov->t);
 	/*
 	 * For KCOV_ENABLE devices we want to make sure that t->kcov->t == t,
@@ -426,12 +442,12 @@ void kcov_task_exit(struct task_struct *t)
 	 * By combining all three checks into one we get:
 	 */
 	if (WARN_ON(kcov->t != t)) {
-		spin_unlock(&kcov->lock);
+		spin_unlock_irqrestore(&kcov->lock, flags);
 		return;
 	}
 	/* Just to not leave dangling references behind. */
 	kcov_disable(t, kcov);
-	spin_unlock(&kcov->lock);
+	spin_unlock_irqrestore(&kcov->lock, flags);
 	kcov_put(kcov);
 }
 
@@ -442,12 +458,13 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	struct kcov *kcov = vma->vm_file->private_data;
 	unsigned long size, off;
 	struct page *page;
+	unsigned long flags;
 
 	area = vmalloc_user(vma->vm_end - vma->vm_start);
 	if (!area)
 		return -ENOMEM;
 
-	spin_lock(&kcov->lock);
+	spin_lock_irqsave(&kcov->lock, flags);
 	size = kcov->size * sizeof(unsigned long);
 	if (kcov->mode != KCOV_MODE_INIT || vma->vm_pgoff != 0 ||
 	    vma->vm_end - vma->vm_start != size) {
@@ -457,7 +474,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	if (!kcov->area) {
 		kcov->area = area;
 		vma->vm_flags |= VM_DONTEXPAND;
-		spin_unlock(&kcov->lock);
+		spin_unlock_irqrestore(&kcov->lock, flags);
 		for (off = 0; off < size; off += PAGE_SIZE) {
 			page = vmalloc_to_page(kcov->area + off);
 			if (vm_insert_page(vma, vma->vm_start + off, page))
@@ -466,7 +483,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 		return 0;
 	}
 exit:
-	spin_unlock(&kcov->lock);
+	spin_unlock_irqrestore(&kcov->lock, flags);
 	vfree(area);
 	return res;
 }
@@ -546,6 +563,7 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 	int mode, i;
 	struct kcov_remote_arg *remote_arg;
 	struct kcov_remote *remote;
+	unsigned long flags;
 
 	switch (cmd) {
 	case KCOV_INIT_TRACE:
@@ -619,17 +637,19 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		kcov->t = t;
 		kcov->remote = true;
 		kcov->remote_size = remote_arg->area_size;
-		spin_lock(&kcov_remote_lock);
+		spin_lock_irqsave(&kcov_remote_lock, flags);
 		for (i = 0; i < remote_arg->num_handles; i++) {
 			if (!kcov_check_handle(remote_arg->handles[i],
 						false, true, false)) {
-				spin_unlock(&kcov_remote_lock);
+				spin_unlock_irqrestore(&kcov_remote_lock,
+							flags);
 				kcov_disable(t, kcov);
 				return -EINVAL;
 			}
 			remote = kcov_remote_add(kcov, remote_arg->handles[i]);
 			if (IS_ERR(remote)) {
-				spin_unlock(&kcov_remote_lock);
+				spin_unlock_irqrestore(&kcov_remote_lock,
+							flags);
 				kcov_disable(t, kcov);
 				return PTR_ERR(remote);
 			}
@@ -637,20 +657,22 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		if (remote_arg->common_handle) {
 			if (!kcov_check_handle(remote_arg->common_handle,
 						true, false, false)) {
-				spin_unlock(&kcov_remote_lock);
+				spin_unlock_irqrestore(&kcov_remote_lock,
+							flags);
 				kcov_disable(t, kcov);
 				return -EINVAL;
 			}
 			remote = kcov_remote_add(kcov,
 					remote_arg->common_handle);
 			if (IS_ERR(remote)) {
-				spin_unlock(&kcov_remote_lock);
+				spin_unlock_irqrestore(&kcov_remote_lock,
+							flags);
 				kcov_disable(t, kcov);
 				return PTR_ERR(remote);
 			}
 			t->kcov_handle = remote_arg->common_handle;
 		}
-		spin_unlock(&kcov_remote_lock);
+		spin_unlock_irqrestore(&kcov_remote_lock, flags);
 		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
 		kcov_get(kcov);
 		return 0;
@@ -666,6 +688,7 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	struct kcov_remote_arg *remote_arg = NULL;
 	unsigned int remote_num_handles;
 	unsigned long remote_arg_size;
+	unsigned long flags;
 
 	if (cmd == KCOV_REMOTE_ENABLE) {
 		if (get_user(remote_num_handles, (unsigned __user *)(arg +
@@ -686,9 +709,9 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	}
 
 	kcov = filep->private_data;
-	spin_lock(&kcov->lock);
+	spin_lock_irqsave(&kcov->lock, flags);
 	res = kcov_ioctl_locked(kcov, cmd, arg);
-	spin_unlock(&kcov->lock);
+	spin_unlock_irqrestore(&kcov->lock, flags);
 
 	kfree(remote_arg);
 
@@ -705,8 +728,8 @@ static const struct file_operations kcov_fops = {
 
 /*
  * kcov_remote_start() and kcov_remote_stop() can be used to annotate a section
- * of code in a kernel background thread to allow kcov to be used to collect
- * coverage from that part of code.
+ * of code in a kernel background thread or in a softirq to allow kcov to be
+ * used to collect coverage from that part of code.
  *
  * The handle argument of kcov_remote_start() identifies a code section that is
  * used for coverage collection. A userspace process passes this handle to
@@ -717,9 +740,9 @@ static const struct file_operations kcov_fops = {
  * the type of the kernel thread whose code is being annotated.
  *
  * For global kernel threads that are spawned in a limited number of instances
- * (e.g. one USB hub_event() worker thread is spawned per USB HCD), each
- * instance must be assigned a unique 4-byte instance id. The instance id is
- * then combined with a 1-byte subsystem id to get a handle via
+ * (e.g. one USB hub_event() worker thread is spawned per USB HCD) and for
+ * softirqs, each instance must be assigned a unique 4-byte instance id. The
+ * instance id is then combined with a 1-byte subsystem id to get a handle via
  * kcov_remote_handle(subsystem_id, instance_id).
  *
  * For local kernel threads that are spawned from system calls handler when a
@@ -738,42 +761,80 @@ static const struct file_operations kcov_fops = {
  *
  * See Documentation/dev-tools/kcov.rst for more details.
  *
- * Internally, this function looks up the kcov device associated with the
+ * Internally, kcov_remote_start() looks up the kcov device associated with the
  * provided handle, allocates an area for coverage collection, and saves the
  * pointers to kcov and area into the current task_struct to allow coverage to
  * be collected via __sanitizer_cov_trace_pc()
  * In turns kcov_remote_stop() clears those pointers from task_struct to stop
  * collecting coverage and copies all collected coverage into the kcov area.
  */
+
+void kcov_remote_softirq_start(struct task_struct *t)
+{
+	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
+
+	data->saved_kcov = t->kcov;
+	data->saved_size = t->kcov_size;
+	data->saved_area = t->kcov_area;
+	data->saved_mode = t->kcov_mode;
+	data->saved_sequence = t->kcov_sequence;
+	kcov_stop(t);
+}
+
+void kcov_remote_softirq_stop(struct task_struct *t)
+{
+	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
+
+	kcov_start(t, data->saved_size, data->saved_area,
+			data->saved_mode, data->saved_sequence);
+	t->kcov = data->saved_kcov;
+}
+
 void kcov_remote_start(u64 handle)
 {
+	struct task_struct *t = current;
 	struct kcov_remote *remote;
 	void *area;
-	struct task_struct *t;
 	unsigned int size;
 	enum kcov_mode mode;
 	int sequence;
+	unsigned long flags;
 
 	if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
 		return;
-	if (WARN_ON(!in_task()))
+	if (!in_task() && !in_serving_softirq())
 		return;
-	t = current;
+
+	local_irq_save(flags);
+
 	/*
-	 * Check that kcov_remote_start is not called twice
-	 * nor called by user tasks (with enabled kcov).
+	 * Check that kcov_remote_start() is not called twice in background
+	 * threads nor called by user tasks (with enabled kcov).
 	 */
-	if (WARN_ON(t->kcov))
+	if (WARN_ON(in_task() && t->kcov)) {
+		local_irq_restore(flags);
 		return;
-
-	kcov_debug("handle = %llx\n", handle);
+	}
+	/*
+	 * Check that kcov_remote_start() is not called twice in softirqs.
+	 * Note, that kcov_remote_start() can be called from a softirq that
+	 * happened while collecting coverage from a background thread.
+	 */
+	if (WARN_ON(in_serving_softirq() && t->kcov_softirq)) {
+		local_irq_restore(flags);
+		return;
+	}
 
 	spin_lock(&kcov_remote_lock);
 	remote = kcov_remote_find(handle);
 	if (!remote) {
-		spin_unlock(&kcov_remote_lock);
+		spin_unlock_irqrestore(&kcov_remote_lock, flags);
 		return;
 	}
+	kcov_debug("handle = %llx, context: %s\n", handle,
+			in_task() ? "task" : "softirq");
+	if (in_serving_softirq())
+		kcov_remote_softirq_start(t);
 	/* Put in kcov_remote_stop(). */
 	kcov_get(remote->kcov);
 	t->kcov = remote->kcov;
@@ -781,12 +842,18 @@ void kcov_remote_start(u64 handle)
 	 * Read kcov fields before unlock to prevent races with
 	 * KCOV_DISABLE / kcov_remote_reset().
 	 */
-	size = remote->kcov->remote_size;
 	mode = remote->kcov->mode;
 	sequence = remote->kcov->sequence;
-	area = kcov_remote_area_get(size);
-	spin_unlock(&kcov_remote_lock);
+	if (in_task()) {
+		size = remote->kcov->remote_size;
+		area = kcov_remote_area_get(size);
+	} else {
+		size = CONFIG_KCOV_IRQ_AREA_SIZE;
+		area = this_cpu_ptr(&kcov_percpu_data)->irq_area;
+	}
+	spin_unlock_irqrestore(&kcov_remote_lock, flags);
 
+	/* Can only happen when in_task(). */
 	if (!area) {
 		area = vmalloc(size * sizeof(unsigned long));
 		if (!area) {
@@ -798,7 +865,11 @@ void kcov_remote_start(u64 handle)
 	/* Reset coverage size. */
 	*(u64 *)area = 0;
 
+	local_irq_save(flags);
 	kcov_start(t, size, area, mode, sequence);
+	if (in_serving_softirq())
+		t->kcov_softirq = true;
+	local_irq_restore(flags);
 
 }
 EXPORT_SYMBOL(kcov_remote_start);
@@ -862,30 +933,52 @@ static void kcov_move_area(enum kcov_mode mode, void *dst_area,
 void kcov_remote_stop(void)
 {
 	struct task_struct *t = current;
-	struct kcov *kcov = t->kcov;
-	void *area = t->kcov_area;
-	unsigned int size = t->kcov_size;
-	int sequence = t->kcov_sequence;
+	struct kcov *kcov;
+	void *area;
+	unsigned int size;
+	int sequence;
+	unsigned long flags;
 
-	if (!kcov)
+	if (!in_task() && !in_serving_softirq())
 		return;
 
-	kcov_stop(t);
-	t->kcov = NULL;
+	local_irq_save(flags);
+
+	kcov = t->kcov;
+	if (!kcov) {
+		local_irq_restore(flags);
+		return;
+	}
+	if (WARN_ON(!in_serving_softirq() && t->kcov_softirq)) {
+		local_irq_restore(flags);
+		return;
+	}
+	area = t->kcov_area;
+	size = t->kcov_size;
+	sequence = t->kcov_sequence;
 
 	spin_lock(&kcov->lock);
+	if (in_serving_softirq())
+		t->kcov_softirq = false;
+	kcov_stop(t);
 	/*
 	 * KCOV_DISABLE could have been called between kcov_remote_start()
-	 * and kcov_remote_stop(), hence the check.
+	 * and kcov_remote_stop(), hence the sequence check.
 	 */
 	if (sequence == kcov->sequence && kcov->remote)
 		kcov_move_area(kcov->mode, kcov->area, kcov->size, area);
 	spin_unlock(&kcov->lock);
 
-	spin_lock(&kcov_remote_lock);
-	kcov_remote_area_put(area, size);
-	spin_unlock(&kcov_remote_lock);
+	if (in_task()) {
+		spin_lock(&kcov_remote_lock);
+		kcov_remote_area_put(area, size);
+		spin_unlock(&kcov_remote_lock);
+	} else
+		kcov_remote_softirq_stop(t);
 
+	local_irq_restore(flags);
+
+	/* Get in kcov_remote_start(). */
 	kcov_put(kcov);
 }
 EXPORT_SYMBOL(kcov_remote_stop);
@@ -899,6 +992,18 @@ EXPORT_SYMBOL(kcov_common_handle);
 
 static int __init kcov_init(void)
 {
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		void *area = vmalloc(CONFIG_KCOV_IRQ_AREA_SIZE *
+				sizeof(unsigned long));
+		if (!area) {
+			kcov_err("failed to allocate irq coverage area\n");
+			return -ENOMEM;
+		}
+		per_cpu_ptr(&kcov_percpu_data, cpu)->irq_area = area;
+	}
+
 	/*
 	 * The kcov debugfs file won't ever get removed and thus,
 	 * there is no need to protect it against removal races. The
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 69def4a9df00..a1f25b27d32d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1740,6 +1740,15 @@ config KCOV_INSTRUMENT_ALL
 	  filesystem fuzzing with AFL) then you will want to enable coverage
 	  for more specific subsets of files, and should say n here.
 
+config KCOV_IRQ_AREA_SIZE
+	hex "Size of interrupt coverage collection area in words"
+	depends on KCOV
+	default 0x40000
+	help
+	  KCOV uses preallocated per-cpu areas to collect coverage from
+	  soft interrupts. This specifies the size of those areas in the
+	  number of unsigned long words.
+
 menuconfig RUNTIME_TESTING_MENU
 	bool "Runtime Testing"
 	def_bool y
-- 
2.25.1.481.gfbce0eb801-goog

