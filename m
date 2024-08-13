Return-Path: <linux-usb+bounces-13395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F76950FD5
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 00:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C13B71C21B8A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 22:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35C61AB528;
	Tue, 13 Aug 2024 22:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IhvF5fYu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1661AB512
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 22:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723588942; cv=none; b=AxJFxL9bLhDcQDUbldn0S2oFw2fd+sA2myQlMBNbtxFZbt0hsuL443N/nsL6GlQHAt1UYvH6Ygg0Pm8Adras4WZyvzu0V9iI+khcrJ+V+ypHkQbogzSwZAnTebWbN3dS4WBi5JTBCk2GTKUdFIWZNoHs6/BWVrd0I7D+vIxNn50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723588942; c=relaxed/simple;
	bh=/38aI+YAN2Wq+jg1IZPZHLPCfbDsyq9J8zvtu8VEKZc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NpBrXaB8K/f+LoO9T0TK8HL4pOTqQbk+GhPBM+vl7oEUeAVVCXJkXMhoQ/bEoeSbNy6ivwDfXoPJiuh3NxSVZpVhoFxDGR6/qHXpA9YbCMt5OL8VRWYtcUa1ywC49WsxdheFcgQ1Blnia9ApDO5cl7B6yj5go3Hr7zu7JErAPmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IhvF5fYu; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-66a8ce9eecfso4738517b3.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723588940; x=1724193740; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nNyQdek71tWkWFoFbYjEqvCxbsnsam31z3z18l0u0tw=;
        b=IhvF5fYuHrK2tDaGUA3dUOBJAAh2mvu0SAoI1MYqjLkYlDOWytZ2hTsvYNk8Z7WaM2
         dL5WE5v5QNrJkpJyyDywBLgSzcUwTxdf4bbKR+iRh+zOp3O7EDPTEBlp6QMwsJZ3p5xJ
         x9f4BEBiw4HW8+RevqJ0Bs3trDqfOWaAo4nsU5R5PA28L/hhm0UL+71t/jPtHHxgVdpZ
         Quhc+KvYRhN+iWPizLCDMWZHy0Xp50NeWmCxqQNWyl9i5Jre4sOIGLlm3b9gnhYnJi9e
         4w61iYVCF8C69mLA9BK/Vk7ngFapAc+W6GR7+RklmkMa80ILlC1GlJ94XZs15+BXFOk+
         tKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723588940; x=1724193740;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNyQdek71tWkWFoFbYjEqvCxbsnsam31z3z18l0u0tw=;
        b=MH24qP+SS5kl+9XJU8w8oXqUc1BUG4PKVA9BtbRYI8e3E/8rXs11UAQOGfOi9yMDsQ
         EgBpRgaK1q8CFkPVWOzrxtR0HVdujPghUaUfhw2nwbT2ryM+yxza6u0G5AITEwr4xDe3
         6ArhmZwy76pQ5E9XHmE5Bw/4tj40kXro45si6QN6JZ5gpNAL4NB2Uyx1N8Cqhjkhh0Ze
         maO6relgS8mDadVqY12GhVLXC9HqhfCR9hMKoSJncHz5pdGKkI2rzFQOoJS3jB3z45IO
         S/r/5KeXKxaaz+IGoqOwdKckrpR0fpIcLf32fad9i7kohwnVd9UGKGSFFusZyt5r79L/
         sXIA==
X-Forwarded-Encrypted: i=1; AJvYcCX/pDwDIi8e8PzWI90v5ooKXDaQJbJqYPboYXSxQGpWec49iq0aBr1YJQ+Vtjg52LuTx6ML5EphPeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiel7Jx0CQwqR4UFSi+3n+HrVfY3Pa0srN7oT7RoDwwj0GdXGN
	JErBTueA5TZAKzofJnaymEswGktyU7Qtt3TZTM2IHHWmY7vFqd2ML2ye5qjMCjZSp/CgS3ju2AY
	XbQ==
X-Google-Smtp-Source: AGHT+IFogisWsaivYv9CNJQlglDwle03mtYwK4ZCba6a77yHOJqB85TEgvNiv/CtmfMxOg5eUSyAfr02VmQ=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a81:77c1:0:b0:648:2f1d:1329 with SMTP id
 00721157ae682-6ac707e5fc2mr626617b3.1.1723588939990; Tue, 13 Aug 2024
 15:42:19 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:42:11 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240813224216.132619-1-amitsd@google.com>
Subject: [PATCH v1] usb: roles: add lockdep class key to struct usb_role_switch
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
---
 drivers/usb/roles/class.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index d7aa913ceb8a..807a8f18ec20 100644
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
@@ -33,6 +34,10 @@ struct usb_role_switch {
 	usb_role_switch_set_t set;
 	usb_role_switch_get_t get;
 	bool allow_userspace_control;
+
+#ifdef CONFIG_LOCKDEP
+	struct lock_class_key key;
+#endif
 };
 
 #define to_role_switch(d)	container_of(d, struct usb_role_switch, dev)
@@ -396,6 +401,11 @@ usb_role_switch_register(struct device *parent,
 
 	sw->registered = true;
 
+#ifdef CONFIG_LOCKDEP
+	lockdep_register_key(&sw->key);
+	lockdep_set_class(&sw->lock, &sw->key);
+#endif
+
 	/* TODO: Symlinks for the host port and the device controller. */
 
 	return sw;
@@ -412,6 +422,11 @@ void usb_role_switch_unregister(struct usb_role_switch *sw)
 {
 	if (IS_ERR_OR_NULL(sw))
 		return;
+
+#ifdef CONFIG_LOCKDEP
+	lockdep_unregister_key(&sw->key);
+#endif
+
 	sw->registered = false;
 	if (dev_fwnode(&sw->dev))
 		component_del(&sw->dev, &connector_ops);

base-commit: 38343be0bf9a7d7ef0d160da5f2db887a0e29b62
-- 
2.46.0.76.ge559c4bf1a-goog


