Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E3218C2D0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 23:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgCSWMO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 18:12:14 -0400
Received: from mail-wr1-f74.google.com ([209.85.221.74]:53221 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgCSWMM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 18:12:12 -0400
Received: by mail-wr1-f74.google.com with SMTP id d17so1671856wrw.19
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8LGf7mqyvLqXZrrvJsz8LQcDGg59iY7bK5qVK/N9es0=;
        b=Wa4zjhYYw9fOnQZ803gTUAiJjoEKKYG8Xo5Xn8641bgx1vfOMqwEET8E9e6ZWYRUG/
         BWUTYcpFSP/Yc/iR2fryFH3A8kjgIKBr0wn7s6GRaMfjar7fIk0jqJKyPOJK+2EqumKC
         RkeEeyd2byoXL3Qf3ShNq9VhebTgoA8eG3ZvQaUw9OHs3MfVfxV9UvrvnJeiS4cQ0Axd
         mn4c30uz9LPXLu/UOeKVYPG6qbmdpvrHBJDchPIUiDoWG+VGwJd5JnnDHczPFD/O0lXI
         YOIH3dAwGHfAPaZi8YqB+uiqZWUazpI6v1zdmamtSe6xECmzW3XDPkkYOj/vaOkavX1j
         tvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8LGf7mqyvLqXZrrvJsz8LQcDGg59iY7bK5qVK/N9es0=;
        b=omxP4NfIMBhcbwntWvgsyTYNzX2TnXVvswccw8DuyY/z2lA7VxoL/m5vVboWytRwoI
         l+toSBEuePNfMPBqxc+BsYS7n8xyKIPIJadMrofbv+GPmtvBiW/5Olhs37FDqOTDHEO+
         KvF4JuwbgdooqGzZboeLgsvIs7JjJSiTQgpKUdbNLFI0LneozzjGGf2TLA2C70vPMGBY
         cMGXbLgmNpIuWTwDgvjPcO3rfrm0JAQvZ2LjHnvToLGTcxUbQWaGJAuYWhtfxLmfQ6lm
         9noMlMMBbHeW3z3oEfRGApyRw48d9TKaK3Q1Nb4ejJANtUvGXGZURCNO2w7Qzd4tGUuA
         1URA==
X-Gm-Message-State: ANhLgQ1tPTwVDtRtp1NwpVBsex9enGanM5wJvx6r9kic0Xnp5CRaRQfS
        P6vyNf0lhnWmJbknWYUG0CU4zCWQc7PwYf/w
X-Google-Smtp-Source: ADFU+vuFyA/Xz/jPv5nBTJW3XDTUs7apjv2wzeBcU9KexYm5pCPMedFFcUJhm/SRQ1qE5C/o+VfNUOh1BYaJyEGE
X-Received: by 2002:adf:ec82:: with SMTP id z2mr7178209wrn.302.1584655930071;
 Thu, 19 Mar 2020 15:12:10 -0700 (PDT)
Date:   Thu, 19 Mar 2020 23:11:40 +0100
In-Reply-To: <cover.1584655448.git.andreyknvl@google.com>
Message-Id: <469bd385c431d050bc38a593296eff4baae50666.1584655448.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1584655448.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 6/7] kcov: collect coverage from interrupts
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
 kernel/kcov.c                    | 194 ++++++++++++++++++++++++-------
 lib/Kconfig.debug                |   9 ++
 4 files changed, 176 insertions(+), 47 deletions(-)

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
index e43f06b5b2e4..50d330a2b30d 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -86,6 +86,18 @@ static DEFINE_SPINLOCK(kcov_remote_lock);
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
@@ -145,9 +157,10 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 
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
@@ -360,8 +373,9 @@ static void kcov_remote_reset(struct kcov *kcov)
 	int bkt;
 	struct kcov_remote *remote;
 	struct hlist_node *tmp;
+	unsigned long flags;
 
-	spin_lock(&kcov_remote_lock);
+	spin_lock_irqsave(&kcov_remote_lock, flags);
 	hash_for_each_safe(kcov_remote_map, bkt, tmp, remote, hnode) {
 		if (remote->kcov != kcov)
 			continue;
@@ -370,7 +384,7 @@ static void kcov_remote_reset(struct kcov *kcov)
 	}
 	/* Do reset before unlock to prevent races with kcov_remote_start(). */
 	kcov_reset(kcov);
-	spin_unlock(&kcov_remote_lock);
+	spin_unlock_irqrestore(&kcov_remote_lock, flags);
 }
 
 static void kcov_disable(struct task_struct *t, struct kcov *kcov)
@@ -399,12 +413,13 @@ static void kcov_put(struct kcov *kcov)
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
@@ -428,12 +443,12 @@ void kcov_task_exit(struct task_struct *t)
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
 
@@ -444,12 +459,13 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
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
@@ -459,7 +475,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	if (!kcov->area) {
 		kcov->area = area;
 		vma->vm_flags |= VM_DONTEXPAND;
-		spin_unlock(&kcov->lock);
+		spin_unlock_irqrestore(&kcov->lock, flags);
 		for (off = 0; off < size; off += PAGE_SIZE) {
 			page = vmalloc_to_page(kcov->area + off);
 			if (vm_insert_page(vma, vma->vm_start + off, page))
@@ -468,7 +484,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 		return 0;
 	}
 exit:
-	spin_unlock(&kcov->lock);
+	spin_unlock_irqrestore(&kcov->lock, flags);
 	vfree(area);
 	return res;
 }
@@ -548,6 +564,7 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 	int mode, i;
 	struct kcov_remote_arg *remote_arg;
 	struct kcov_remote *remote;
+	unsigned long flags;
 
 	switch (cmd) {
 	case KCOV_INIT_TRACE:
@@ -620,17 +637,19 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
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
@@ -638,20 +657,22 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
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
@@ -667,6 +688,7 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	struct kcov_remote_arg *remote_arg = NULL;
 	unsigned int remote_num_handles;
 	unsigned long remote_arg_size;
+	unsigned long flags;
 
 	if (cmd == KCOV_REMOTE_ENABLE) {
 		if (get_user(remote_num_handles, (unsigned __user *)(arg +
@@ -687,9 +709,9 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	}
 
 	kcov = filep->private_data;
-	spin_lock(&kcov->lock);
+	spin_lock_irqsave(&kcov->lock, flags);
 	res = kcov_ioctl_locked(kcov, cmd, arg);
-	spin_unlock(&kcov->lock);
+	spin_unlock_irqrestore(&kcov->lock, flags);
 
 	kfree(remote_arg);
 
@@ -706,8 +728,8 @@ static const struct file_operations kcov_fops = {
 
 /*
  * kcov_remote_start() and kcov_remote_stop() can be used to annotate a section
- * of code in a kernel background thread to allow kcov to be used to collect
- * coverage from that part of code.
+ * of code in a kernel background thread or in a softirq to allow kcov to be
+ * used to collect coverage from that part of code.
  *
  * The handle argument of kcov_remote_start() identifies a code section that is
  * used for coverage collection. A userspace process passes this handle to
@@ -718,9 +740,9 @@ static const struct file_operations kcov_fops = {
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
@@ -739,7 +761,7 @@ static const struct file_operations kcov_fops = {
  *
  * See Documentation/dev-tools/kcov.rst for more details.
  *
- * Internally, this function looks up the kcov device associated with the
+ * Internally, kcov_remote_start() looks up the kcov device associated with the
  * provided handle, allocates an area for coverage collection, and saves the
  * pointers to kcov and area into the current task_struct to allow coverage to
  * be collected via __sanitizer_cov_trace_pc()
@@ -752,6 +774,39 @@ static inline bool kcov_mode_enabled(unsigned int mode)
 	return (mode & ~KCOV_IN_CTXSW) != KCOV_MODE_DISABLED;
 }
 
+void kcov_remote_softirq_start(struct task_struct *t)
+{
+	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
+	unsigned int mode;
+
+	mode = READ_ONCE(t->kcov_mode);
+	barrier();
+	if (kcov_mode_enabled(mode)) {
+		data->saved_mode = mode;
+		data->saved_size = t->kcov_size;
+		data->saved_area = t->kcov_area;
+		data->saved_sequence = t->kcov_sequence;
+		data->saved_kcov = t->kcov;
+		kcov_stop(t);
+	}
+}
+
+void kcov_remote_softirq_stop(struct task_struct *t)
+{
+	struct kcov_percpu_data *data = this_cpu_ptr(&kcov_percpu_data);
+
+	if (data->saved_kcov) {
+		kcov_start(t, data->saved_kcov, data->saved_size,
+				data->saved_area, data->saved_mode,
+				data->saved_sequence);
+		data->saved_mode = 0;
+		data->saved_size = 0;
+		data->saved_area = NULL;
+		data->saved_sequence = 0;
+		data->saved_kcov = NULL;
+	}
+}
+
 void kcov_remote_start(u64 handle)
 {
 	struct task_struct *t = current;
@@ -761,28 +816,42 @@ void kcov_remote_start(u64 handle)
 	void *area;
 	unsigned int size;
 	int sequence;
+	unsigned long flags;
 
 	if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
 		return;
-	if (WARN_ON(!in_task()))
+	if (!in_task() && !in_serving_softirq())
 		return;
 
+	local_irq_save(flags);
+
 	/*
-	 * Check that kcov_remote_start is not called twice
-	 * nor called by user tasks (with enabled kcov).
+	 * Check that kcov_remote_start() is not called twice in background
+	 * threads nor called by user tasks (with enabled kcov).
 	 */
 	mode = READ_ONCE(t->kcov_mode);
-	if (WARN_ON(kcov_mode_enabled(mode)))
+	if (WARN_ON(in_task() && kcov_mode_enabled(mode))) {
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
 	kcov = remote->kcov;
 	/* Put in kcov_remote_stop(). */
 	kcov_get(kcov);
@@ -790,12 +859,18 @@ void kcov_remote_start(u64 handle)
 	 * Read kcov fields before unlock to prevent races with
 	 * KCOV_DISABLE / kcov_remote_reset().
 	 */
-	size = kcov->remote_size;
 	mode = kcov->mode;
 	sequence = kcov->sequence;
-	area = kcov_remote_area_get(size);
-	spin_unlock(&kcov_remote_lock);
+	if (in_task()) {
+		size = kcov->remote_size;
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
@@ -803,11 +878,20 @@ void kcov_remote_start(u64 handle)
 			return;
 		}
 	}
+
+	local_irq_save(flags);
+
 	/* Reset coverage size. */
 	*(u64 *)area = 0;
 
+	if (in_serving_softirq()) {
+		kcov_remote_softirq_start(t);
+		t->kcov_softirq = true;
+	}
 	kcov_start(t, kcov, size, area, mode, sequence);
 
+	local_irq_restore(flags);
+
 }
 EXPORT_SYMBOL(kcov_remote_start);
 
@@ -875,31 +959,53 @@ void kcov_remote_stop(void)
 	void *area;
 	unsigned int size;
 	int sequence;
+	unsigned long flags;
+
+	if (!in_task() && !in_serving_softirq())
+		return;
+
+	local_irq_save(flags);
 
 	mode = READ_ONCE(t->kcov_mode);
 	barrier();
-	if (!kcov_mode_enabled(mode))
+	if (!kcov_mode_enabled(mode)) {
+		local_irq_restore(flags);
 		return;
+	}
 	kcov = t->kcov;
 	area = t->kcov_area;
 	size = t->kcov_size;
 	sequence = t->kcov_sequence;
 
+	if (WARN_ON(!in_serving_softirq() && t->kcov_softirq)) {
+		local_irq_restore(flags);
+		return;
+	}
+
 	kcov_stop(t);
+	if (in_serving_softirq()) {
+		t->kcov_softirq = false;
+		kcov_remote_softirq_stop(t);
+	}
 
 	spin_lock(&kcov->lock);
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
+	}
 
+	local_irq_restore(flags);
+
+	/* Get in kcov_remote_start(). */
 	kcov_put(kcov);
 }
 EXPORT_SYMBOL(kcov_remote_stop);
@@ -913,6 +1019,16 @@ EXPORT_SYMBOL(kcov_common_handle);
 
 static int __init kcov_init(void)
 {
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		void *area = vmalloc(CONFIG_KCOV_IRQ_AREA_SIZE *
+				sizeof(unsigned long));
+		if (!area)
+			return -ENOMEM;
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
2.25.1.696.g5e7596f4ac-goog

