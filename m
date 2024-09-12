Return-Path: <linux-usb+bounces-15058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691C97746F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 00:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3120285C70
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 22:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93B91C2DCB;
	Thu, 12 Sep 2024 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="XhoYbKbd"
X-Original-To: linux-usb@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DDB1C244F
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180824; cv=none; b=Bc3WLRI+P+fyqBXM55yldKFWaG+pMR9T/Ii+BCzR4mwCHB3fE7N1vzgbsXmOopM1xQLe7KDTgOSsBTav/PEyXQbosI0AE3u7u/ttnJW207XWITuvEZM9xlVu6eGBpNg9cXC3Kr3uH68pllYmHpTTYrK0Wub/bFGpYj4F7I3w0g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180824; c=relaxed/simple;
	bh=ONsHOgeMoqgcozIioe8vsB4I9pIWlWgLwpnnbd+YRXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5+RQd73gW3NUN9yBq5RBSDdiHjInw6R5w+6IdVqoi3lvb1v2l2UX1X9v1BUwqwyShtgOUGCobabgmRuvlm+kOdAs4fEmE1djCnF9AZ2iUA/lDoBrhwbmi40xuC7fHJK//fBX9QNNjuZzbRBSYdvF/hV72B1Ol3oJvtyergVrHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=XhoYbKbd; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X4XT23mfrzlgMVh;
	Thu, 12 Sep 2024 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1726180819; x=1728772820; bh=EjgFf
	8+wlvPOTQeTYDkAOEa7NsvwgC+QrqwbcVIqNnc=; b=XhoYbKbdVMirqmD4i9bO3
	hniPw+ipTsTOVqnLDby5sMFHMQUaeHzN4sVIjPw+PyuhGAK5zntWtmrd3d5Pum37
	j1JfFMz9EOQ3ywLRgG4WWcOIyUemjiq7qY45y4dNYpgDVrHFwZ/EACMn0x9485OO
	++sOGhdZxe9np81NoJC9comlK7MI+L4zcRkBJ9MQWcWOZRbxNJ9BMEP9c3E7ek8l
	rH56VpnZVDEeWxDGhGrPaPzrOJcztIO2Gzk/A1Wm93F5Jw/KOUd7GPzJtFKkzjuE
	HB9TEycSNL2bdnqPmc+rExjdoGcr5ZUD3oDy3UFCMU0EyQVPq4NmPkAN1R6Zx6di
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id uj-b4hwG_5q3; Thu, 12 Sep 2024 22:40:19 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X4XSy3l6rzlgMVj;
	Thu, 12 Sep 2024 22:40:18 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v3 2/3] locking/mutex: Introduce mutex_init_with_key()
Date: Thu, 12 Sep 2024 15:39:55 -0700
Message-ID: <20240912223956.3554086-3-bvanassche@acm.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
In-Reply-To: <20240912223956.3554086-1-bvanassche@acm.org>
References: <20240912223956.3554086-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The following pattern occurs 5 times in kernel drivers:

	lockdep_register_key(key);
	__mutex_init(mutex, name, key);

In several cases the 'name' argument matches #mutex. Hence, introduce
the mutex_init_with_key() macro. This macro derives the 'name' argument
from the 'mutex' argument.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/mutex.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index ef617089db19..2bf91b57591b 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -64,6 +64,17 @@ do {									\
 	__mutex_init((mutex), #mutex, &__key);				\
 } while (0)
=20
+/**
+ * mutex_init_with_key - initialize a mutex with a given lockdep key
+ * @mutex: the mutex to be initialized
+ * @key: the lockdep key to be associated with the mutex
+ *
+ * Initialize the mutex to the unlocked state.
+ *
+ * It is not allowed to initialize an already locked mutex.
+ */
+#define mutex_init_with_key(mutex, key) __mutex_init((mutex), #mutex, (k=
ey))
+
 #ifndef CONFIG_PREEMPT_RT
 #define __MUTEX_INITIALIZER(lockname) \
 		{ .owner =3D ATOMIC_LONG_INIT(0) \

