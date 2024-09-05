Return-Path: <linux-usb+bounces-14741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 696BD96E45A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 22:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 960D61C23BC4
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 20:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6DF1A7275;
	Thu,  5 Sep 2024 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="IhusZUuj"
X-Original-To: linux-usb@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1E78821
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569257; cv=none; b=qccebqCFcg1YVUPr7Y5q3iF3+2aJ8c7fybs/2C93YTUtguiMlkthB/gwdIgWeq+otd1KkZxOFXYchfawEG4SscckQYp7tAbY97ab+pxYzAGC3MY6wbqyxro7asOnFn9ulv5UppryfmtrsfBGwjhCpLcLE1tyix06ghr/ZM69mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569257; c=relaxed/simple;
	bh=g7eFIs8rWIiv6LyZA5yY4gfg+YZ9lUeHCDfTzDScKSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOpHjA1Vxcrz6tKZAnLTSKagfGcpFzIvMvzJZ+CkqOV6Hh/1CNmgZ5MD1qHVNyEp0jQKDHCvPWxBy+CHFwsdM48TDMExdj0sGqS3PWJyWOgy8RBj0gYGmQgSttdaqqTGUqwCqKWvG/VcmIwNTsvpjpQI7kZnDEgTil9Ib3KzO3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=IhusZUuj; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X0BJ73PW5zlgVnF;
	Thu,  5 Sep 2024 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1725569252; x=1728161253; bh=ij9YH
	tVJF77NPK/0c7KFSqL6vPi/fCqG3KtMptK68dg=; b=IhusZUujtFwEwgCDWseJx
	bCzsXZH/xUM6HsBmr2/6W8ZFNitpyalTyikS/RfZ4D7YkWFMmlMEvCcIH1smWNj+
	V38OBdRfIVIOjnQdtJLPyAYPgQC+xZCg8chE/pVrDAwzGnDNKECDrx24pBDTBKBw
	RJPusbn+XMzf62xXeJNHoJ26zgrd1acHQCq4jMzQyzzKW49ej2GEwt0ngdHZsCRU
	zzEmJag53Habvw44Uv7pp/IfF95KbJH6VtVcr/M3ZZc9miuLAqHCisQocEZr4oSx
	VKnaUiHQllS04CyAZt7T3RpkDg0KikCfc7LkZICWFvKjo+BcjWKPpKF/hrSxN5Jy
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 3jFaJtMxtoyw; Thu,  5 Sep 2024 20:47:32 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X0BJ34X1MzlgMVL;
	Thu,  5 Sep 2024 20:47:31 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2 1/3] locking/mutex: Define mutex_init() once
Date: Thu,  5 Sep 2024 13:47:07 -0700
Message-ID: <20240905204709.556577-2-bvanassche@acm.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240905204709.556577-1-bvanassche@acm.org>
References: <20240905204709.556577-1-bvanassche@acm.org>
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

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
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

