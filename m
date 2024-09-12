Return-Path: <linux-usb+bounces-15057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF797746E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 00:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 458E6285C53
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 22:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA591C2DB9;
	Thu, 12 Sep 2024 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="oblpu6NR"
X-Original-To: linux-usb@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABD119F13D
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180823; cv=none; b=KMvYS9JLVwT9S6DlHUonfptQjrmydnWoczKVSStUdb7FBGC5IsCOiIGdaBItR/inUiCjq1tY8mn0H5Ev05z+iBPbc4cprUrobzz+LQYRb2lCthg8OnsshwgIf+bMw4HA4JOkEqHSx0G0lM1+NDh9+9swFtJEpqlbkXWgGJCXeB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180823; c=relaxed/simple;
	bh=MzTIZgO8Pr01Ze9i2JkO5CNFqOMRNj4unFZQJXRzUDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKMcvkW4x/CpDid0iyimptaHc9Bmzstv15ZXKPqrbRE4IEXZUI5368S3HPpO9/id+OLBVYDw1cYDEVZFz8CfIVwdrfUZt21lcV2rPOmC2xjjB2oxwb1zVHQi5de+8vl45br99w5kcuBsq10HLHik98gpiNEI+scdeL5O4QG+u9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=oblpu6NR; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X4XT13XGzzlgMVW;
	Thu, 12 Sep 2024 22:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1726180818; x=1728772819; bh=PVwFA
	aSgprFDzebneQxEdDzHnbI9aOLw0GmSwc9jzo0=; b=oblpu6NRB1LEy7e7l69LA
	YOGeIk0JjEBmvtDgfAVeVnPoBT8lm059vuevulDE6SL8jMgAdQjeHnxK+DmPB/aO
	sUH/2HVK/auePC36vu5zh89T1Fx26orb2qR5JUzkDQJwGFFADJeBJH8n9s5GF//6
	PPBPQn2V6JGqSSfZKppkQJ+hbyjm/VmmIC4Tqn0bAMkDOhsaKDgB+Imxl4NMBD8K
	c7x4UyPq7O+tKLECkC5sdun/uKchA67sdnqkop1+0r5HjHr8yokDMsYYs+12u4FM
	mm85FwiPBzPr3jwDCkr9vNhlw09jQhX4ZEtbkKXqmPlsgdJbQiEyZJYyEFFZFBNv
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id jf7NGG2hHlQY; Thu, 12 Sep 2024 22:40:18 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X4XSx4V2GzlgMVh;
	Thu, 12 Sep 2024 22:40:17 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v3 1/3] locking/mutex: Define mutex_init() once
Date: Thu, 12 Sep 2024 15:39:54 -0700
Message-ID: <20240912223956.3554086-2-bvanassche@acm.org>
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

With CONFIG_PREEMPT_RT disabled __mutex_init() is a function. With
CONFIG_PREEMPT_RT enabled, __mutex_init() is a macro. I assume this is wh=
y
mutex_init() is defined twice as exactly the same macro.

Prepare for introducing a new macro for mutex initialization by combining
the two identical mutex_init() definitions into a single definition. This
patch does not change any functionality because the C preprocessor expand=
s
macros when it encounters the macro name and not when a macro definition
is encountered. See also commit bb630f9f7a7d ("locking/rtmutex: Add mutex
variant for RT").

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/mutex.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index a561c629d89f..ef617089db19 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -49,7 +49,6 @@ static inline void mutex_destroy(struct mutex *lock) {}
=20
 #endif
=20
-#ifndef CONFIG_PREEMPT_RT
 /**
  * mutex_init - initialize the mutex
  * @mutex: the mutex to be initialized
@@ -65,6 +64,7 @@ do {									\
 	__mutex_init((mutex), #mutex, &__key);				\
 } while (0)
=20
+#ifndef CONFIG_PREEMPT_RT
 #define __MUTEX_INITIALIZER(lockname) \
 		{ .owner =3D ATOMIC_LONG_INIT(0) \
 		, .wait_lock =3D __RAW_SPIN_LOCK_UNLOCKED(lockname.wait_lock) \
@@ -111,12 +111,6 @@ do {							\
 	__mutex_rt_init((mutex), name, key);		\
 } while (0)
=20
-#define mutex_init(mutex)				\
-do {							\
-	static struct lock_class_key __key;		\
-							\
-	__mutex_init((mutex), #mutex, &__key);		\
-} while (0)
 #endif /* CONFIG_PREEMPT_RT */
=20
 #ifdef CONFIG_DEBUG_MUTEXES

