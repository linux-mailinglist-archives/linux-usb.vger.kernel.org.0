Return-Path: <linux-usb+bounces-27543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C3B43AAB
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 13:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EFD93B4351
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 11:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A806D2ECE9D;
	Thu,  4 Sep 2025 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+xCeqOJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C191D2F42
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986540; cv=none; b=uvnAK3tX6+pBdWVmt9xOKi7r+20rpHZrqz9WquXZV3hfsNCYD4WPICXeVZwdVxBjxjf5PQUhdxJCjDK7fLYWtNlfZ2UGKLhYXm4EUD/TKL1/yzgiiDJlyxc8xUqkI8mKEM9KjunzQKBMQwpKa38MajGkOACqtwZ0q3j1x0x/l5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986540; c=relaxed/simple;
	bh=VASocTHJoAGDMo9qO4gGhj6dPFU9OO/Gurv88r7gw4I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CBfrsP2CGhiBvESZvIyaryKzHcP8zEmoLOMcp18y5nOO60cBeW6DiZnan2dSwlqhXd1eetOA+sY0zNN1pSoyGbjhcx/JXQXn027oCUcLA5eFgelnE8BuB+qHtd8oRiMg3w3JF43paASJkP3/7OrLq3Tlzkmwm+APqSg0SlX3n2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+xCeqOJ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-248942647c5so27313775ad.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756986538; x=1757591338; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PgFAu8kmjISuTkZlf0/EdESi4MS0fsjEIDkDdhJkftg=;
        b=S+xCeqOJCdNd59i63GbGOAHEOYGFBvBizwJeV1SXbZ7hfMAif3IPqiUXqTbf916Nup
         V+dXt7jgyyDe77S+RpJzGLzy6s5+DsDH3VUaGQYP0iuort9c3qJ3SNwAbcXVL9EfD750
         0YwPM1BCdta/pO/d3R+6oX7OFC5lKxXs1oYWifb8FYv1LDEf3mT1f4w6lu6au+iwqq40
         0TYTZixih3rWBFtwKUYI5B7K4sx60qz8LHKFapH+eKRNLvNELlhR+/MxbRcBu0EfDSGt
         emHiPBDPY4Kz/IZNQnJkMJtqPy6tI/z3C6Nf1nYEnqJTKoL0jKw+RkD+ueN/nr7yAlQ9
         GSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986538; x=1757591338;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PgFAu8kmjISuTkZlf0/EdESi4MS0fsjEIDkDdhJkftg=;
        b=VoXjHAIPvO2waRjF44wEM3we5vaDK6zbK0sCD66whGrETK1nIA8xOXz8OcZIZFzLlq
         m2svr3tejqsvw4lnlRnn0nngoBYc4oqCdUStp7o9/74Y3bXF4Y9sxQH5c+PIjubEcS9M
         3k5eUIP3SV3FvySae0GZjD0xW5nM5ryNn7IVHN3CZEq3Mrgq5bhdEfYcl+gVVg1iwxyk
         r35k3aEDW8G2qXeQqeFfpps0KMRy1/sx1kTJ+dSc25Z8DE+gtWnQBl54rwn5NU9v0z2U
         EQO9DpT/axmD4JOTwulZgzc+r27IvncdMTgVolfuhxb0cpdJaAwoh7yFJgfucLp0hCZ8
         M/Mg==
X-Gm-Message-State: AOJu0Yw+mX6xgIKY6HefXbTl9K4uhbFBu5wA+aZ10wU3QLVyfVqF+usa
	7Smow0EHACtHlo958EMrcYgxg8/t4NVA2Pss109LL5QfhURyHrmdSAc1x9GQueRyhWLV0LWtv8x
	2Xljh0A==
X-Google-Smtp-Source: AGHT+IFgsx+pL9oMZFV9BCykuzC8US6ov9RReAFriqdxUVfAmeM9SUzyMdY3D96+AVJUxlOuI3NGf+RSOG0=
X-Received: from pjbdj14.prod.google.com ([2002:a17:90a:d2ce:b0:327:d54a:8c93])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11c7:b0:246:a152:2ad9
 with SMTP id d9443c01a7336-2493ee542d1mr260794175ad.11.1756986537964; Thu, 04
 Sep 2025 04:48:57 -0700 (PDT)
Date: Thu,  4 Sep 2025 19:46:13 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250904114854.1913155-1-khtsai@google.com>
Subject: [PATCH] usb: gadget: f_ncm: Fix NPE in ncm_bind error path
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org, zack.rusin@broadcom.com, 
	krzysztof.kozlowski@linaro.org, namcao@linutronix.de, 
	yauheni.kaliuta@nokia.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

When an ncm_bind/unbind cycle occurs, the ncm->notify_req pointer is
left pointing to a stale address. If a subsequent call to ncm_bind()
fails to allocate the endpoints, the function jumps to the unified error
label. The cleanup code sees the stale ncm->notify_req pointer and calls
usb_ep_free_request().

This results in a NPE because it attempts to access the free_request
function through the endpoint's operations table (ep->ops), which is
NULL.

Refactor the error path to use cascading goto labels, ensuring that
resources are freed in reverse order of allocation. Besides, explicitly
set pointers to NULL after freeing them.

Call trace:
 usb_ep_free_request+0x2c/0xec
 ncm_bind+0x39c/0x3dc
 usb_add_function+0xcc/0x1f0
 configfs_composite_bind+0x468/0x588
 gadget_bind_driver+0x104/0x270
 really_probe+0x190/0x374
 __driver_probe_device+0xa0/0x12c
 driver_probe_device+0x3c/0x218
 __device_attach_driver+0x14c/0x188
 bus_for_each_drv+0x10c/0x168
 __device_attach+0xfc/0x198
 device_initial_probe+0x14/0x24
 bus_probe_device+0x94/0x11c
 device_add+0x268/0x48c
 usb_add_gadget+0x198/0x28c
 dwc3_gadget_init+0x700/0x858
 __dwc3_set_mode+0x3cc/0x664
 process_scheduled_works+0x1d8/0x488
 worker_thread+0x244/0x334
 kthread+0x114/0x1bc
 ret_from_fork+0x10/0x20

Fixes: 9f6ce4240a2b ("usb: gadget: f_ncm.c added")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Tracing:
 ncm_bind: ep_autoconfig OUT failed
 ncm_bind: ncm->notify=0000000060ad7c2d, ncm->notify->ops=0000000000000000
 usb_ep_free_request: (null): req 00000000650c8918 length 0/158 sgs 0/0 stream 0 zsI status 0 --> 0

---
 drivers/usb/gadget/function/f_ncm.c | 37 ++++++++++++++++-------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 58b0dd575af3..0338cb820cb5 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1459,7 +1459,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	mutex_unlock(&ncm_opts->lock);

 	if (status)
-		goto fail;
+		goto fail_os_desc;

 	ncm_opts->bound = true;

@@ -1467,7 +1467,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 				 ARRAY_SIZE(ncm_string_defs));
 	if (IS_ERR(us)) {
 		status = PTR_ERR(us);
-		goto fail;
+		goto fail_os_desc;
 	}
 	ncm_control_intf.iInterface = us[STRING_CTRL_IDX].id;
 	ncm_data_nop_intf.iInterface = us[STRING_DATA_IDX].id;
@@ -1478,7 +1478,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	/* allocate instance-specific interface IDs */
 	status = usb_interface_id(c, f);
 	if (status < 0)
-		goto fail;
+		goto fail_os_desc;
 	ncm->ctrl_id = status;
 	ncm_iad_desc.bFirstInterface = status;

@@ -1491,7 +1491,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)

 	status = usb_interface_id(c, f);
 	if (status < 0)
-		goto fail;
+		goto fail_os_desc;
 	ncm->data_id = status;

 	ncm_data_nop_intf.bInterfaceNumber = status;
@@ -1505,17 +1505,17 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	/* allocate instance-specific endpoints */
 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
 	if (!ep)
-		goto fail;
+		goto fail_os_desc;
 	ncm->port.in_ep = ep;

 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_out_desc);
 	if (!ep)
-		goto fail;
+		goto fail_os_desc;
 	ncm->port.out_ep = ep;

 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_notify_desc);
 	if (!ep)
-		goto fail;
+		goto fail_os_desc;
 	ncm->notify = ep;

 	status = -ENOMEM;
@@ -1523,10 +1523,10 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	/* allocate notification request and buffer */
 	ncm->notify_req = usb_ep_alloc_request(ep, GFP_KERNEL);
 	if (!ncm->notify_req)
-		goto fail;
+		goto fail_os_desc;
 	ncm->notify_req->buf = kmalloc(NCM_STATUS_BYTECOUNT, GFP_KERNEL);
 	if (!ncm->notify_req->buf)
-		goto fail;
+		goto fail_notify_req;
 	ncm->notify_req->context = ncm;
 	ncm->notify_req->complete = ncm_notify_complete;

@@ -1548,7 +1548,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
 			ncm_ss_function, ncm_ss_function);
 	if (status)
-		goto fail;
+		goto fail_notify_req_buf;

 	/*
 	 * NOTE:  all that is done without knowing or caring about
@@ -1566,15 +1566,17 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 			ncm->notify->name);
 	return 0;

-fail:
+fail_notify_req_buf:
+	kfree(ncm->notify_req->buf);
+	ncm->notify_req->buf = NULL;
+fail_notify_req:
+	usb_ep_free_request(ncm->notify, ncm->notify_req);
+	ncm->notify_req = NULL;
+fail_os_desc:
 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;

-	if (ncm->notify_req) {
-		kfree(ncm->notify_req->buf);
-		usb_ep_free_request(ncm->notify, ncm->notify_req);
-	}
-
 	ERROR(cdev, "%s: can't bind, err %d\n", f->name, status);

 	return status;
@@ -1734,6 +1736,7 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 	hrtimer_cancel(&ncm->task_timer);

 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;

 	ncm_string_defs[0].id = 0;
@@ -1745,7 +1748,9 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 	}

 	kfree(ncm->notify_req->buf);
+	ncm->notify_req->buf = NULL;
 	usb_ep_free_request(ncm->notify, ncm->notify_req);
+	ncm->notify_req = NULL;
 }

 static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
--
2.51.0.338.gd7d06c2dae-goog


