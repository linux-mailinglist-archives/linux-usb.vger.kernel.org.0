Return-Path: <linux-usb+bounces-13912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED095C0EF
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 00:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7E431F24493
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 22:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887CA1D0DF0;
	Thu, 22 Aug 2024 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3nsxbdAE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4D81CB326
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724366242; cv=none; b=gkWnEdekVfBAhtGysrszuRZQJbNte8KCESyPtCdhyHVqQe0PeegM0y+0Om9stdOTtvigMpKwlXwNEa/xvefIgs+Rne0muFQFTiuo4dTqcAJwjHctWdYtgD2iqAQMBhW3iHSAk9CTQvxwlEFqSnGwdnM3wjvh97+vwWNo+qEAvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724366242; c=relaxed/simple;
	bh=bV0Hv4F5M4WK/rHCUNMOXrwO9S6mM5cJEw7CqiA6rR0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EB6DaMzBH066QIAkPxlJi4SQeK/H7keHF2L9G6HSJOhB/YwgIbapTmvWk5bT4OKZxKkGwdOM2UsBf1qQHFsWBW9buGzKh8aSMQ9dQlg+eGeMtytF99WeB8WQv3e8Z/BhNLQRhmFRMCmlEDZKajkIEjVMiUXG4Jr5kOSaHQW6mN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3nsxbdAE; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ad660add0fso19253607b3.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724366239; x=1724971039; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XWZ4Xz+lCe0RvJ+xWgJ0XVc3fOWwjYgwkNv7blQ8afQ=;
        b=3nsxbdAEwHsBrUk5LZ6n/G8eJkSrLtlEpgISFSrwWVYpk8/wg/9s5ncxt1SmLLa+rg
         ysGLV+aJ8INPJ0FWQ7Zbw/amkc7FsRw5IRFuvLYnK8jq/YmwDAbP76BQ9deosPUC+VGY
         /JhFKpJF+bw1By3N2yP0/ZvUQntEulPX7wlRVOUMgwj9koTy2Mfm1zIU9RyXR0FefKW6
         x1quYZmPri9EDsM26ZRBaCS6cXCIMYVcSOabiFJR8jyZMb6aawDGIM1GVStAUEUX/iMN
         7NQNfBeTeZophm4cg+psqwbY2yon7bZtRcAhTBDWD0mo3YkBWCOP0dHIn3d6+zJrTnV0
         K+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724366239; x=1724971039;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWZ4Xz+lCe0RvJ+xWgJ0XVc3fOWwjYgwkNv7blQ8afQ=;
        b=BKMiXvdKb7eFBbbfe+/fkTrEjhGGOPeV2v47LXnEZ8dD2ZxWmwzNpT7IjQDDYBTQxW
         v8u4aVQe7uASGwRhNkgi3Bo9wncQDyP2KQuFCCU/QJVgIMoujtP2Kn4BYM8c1dVJ6Rnk
         ppMxIgnQb4rUQiY3R4x9dECiIlD18Z56BjWGvrekdQWkysmyhs9p4IgCfGrON94wiKE+
         9iELFKBsAHTtrD2W+G4Jm0wmnJTUiUKcifS+uYnoygTESn3swATVBDb8DXQGQlB+4XVu
         vef9L5KhsEILr4oP3ddiT9O311GgodnY4psgHp5XjB1Zxlo1dK6j2EVhpctTgn4NsQst
         HhCA==
X-Forwarded-Encrypted: i=1; AJvYcCU/zXJu5zNdaokrr4zmO+3XmHzR6F2+oe7XnG0rkmbLCf67HS6HcDLOzkINyOWP1N4XOZAb5HHw63s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzipX/C58zFZ71iItJT9f5kzo2ul3n8C3dY01YeJHeRWdigMwAW
	bd8HPxAbP2Cmpa+qOoRWv5gQNrNRcI6kKxZ81bPqvVivv3tX6pzSgDNNIbA2kmONNN580B7krJn
	+oQ==
X-Google-Smtp-Source: AGHT+IEh0feUnYKmvoGoanKbfZ3EUdFCfO1u8P1OY5a3VSAoj+0fu18DZjI2TT/irFJwTHZPiFBAr6SCExg=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a81:f911:0:b0:6b2:7bd8:d794 with SMTP id
 00721157ae682-6c603e614a9mr253617b3.4.1724366239661; Thu, 22 Aug 2024
 15:37:19 -0700 (PDT)
Date: Thu, 22 Aug 2024 15:37:15 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240822223717.253433-1-amitsd@google.com>
Subject: [PATCH v3] usb: roles: add lockdep class key to struct usb_role_switch
From: Amit Sunil Dhamne <amitsd@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kyletso@google.com, rdbabiera@google.com, 
	Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

There can be multiple role switch devices running on a platform. Given
that lockdep is not capable of differentiating between locks of
different instances, false positive warnings for circular locking are
reported. To prevent this, register unique lockdep key for each of the
individual instances.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
v1->v2
- Avoid usage of ifdefs.
v2->v3
- Removed redundancies.
- Completed peer review and added reviewer signature.
---
 drivers/usb/roles/class.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index d7aa913ceb8a..7aca1ef7f44c 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -11,6 +11,7 @@
 #include <linux/usb/role.h>
 #include <linux/property.h>
 #include <linux/device.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -33,6 +34,8 @@ struct usb_role_switch {
 	usb_role_switch_set_t set;
 	usb_role_switch_get_t get;
 	bool allow_userspace_control;
+
+	struct lock_class_key key;
 };
 
 #define to_role_switch(d)	container_of(d, struct usb_role_switch, dev)
@@ -396,6 +399,9 @@ usb_role_switch_register(struct device *parent,
 
 	sw->registered = true;
 
+	lockdep_register_key(&sw->key);
+	lockdep_set_class(&sw->lock, &sw->key);
+
 	/* TODO: Symlinks for the host port and the device controller. */
 
 	return sw;
@@ -412,6 +418,9 @@ void usb_role_switch_unregister(struct usb_role_switch *sw)
 {
 	if (IS_ERR_OR_NULL(sw))
 		return;
+
+	lockdep_unregister_key(&sw->key);
+
 	sw->registered = false;
 	if (dev_fwnode(&sw->dev))
 		component_del(&sw->dev, &connector_ops);

base-commit: ca7df2c7bb5f83fe46aa9ce998b7352c6b28f3a1
-- 
2.46.0.184.g6999bdac58-goog


