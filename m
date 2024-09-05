Return-Path: <linux-usb+bounces-14742-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4787F96E45B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 22:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F1DB243BC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 20:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C971A727B;
	Thu,  5 Sep 2024 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="bW9XmCS7"
X-Original-To: linux-usb@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DDF3D6D
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569258; cv=none; b=WCXzeIJ/BAhIq2RomKJTc/7aUCGRalOP7fgRH5VmONOXaW+356QaJ299WzorcaO9tET7OUZFio+82ATpvJWHCv3SISBhVcOrusPHEZgKLwuokyUQK4NOs5KZOKwDt2aV+retbvchH3IGzt5OZA1oPlnCTe0mFfiBRaeEZ5Kaib8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569258; c=relaxed/simple;
	bh=xL2Cb4/VSZof31xlNvAm7jxrEdCtUmtRtLCGqLxXBP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YE4gB0dDn91A5dZn0fzJAAPjVvQ1R7UJKkA0Co2hjZhCnVJvmZhIrJD0HM0aS6RMrJ/p1JHbYdPMPsGuIC0kQSpIJDLXC47amObmJcUbYqJMNtjuTRSOL5zx03QCpcU2xXOgp11lJxCUhAU0diBvgCxco8HP1IQQFMYeeAlqZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=bW9XmCS7; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X0BJ85ZkGzlgMVL;
	Thu,  5 Sep 2024 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1725569253; x=1728161254; bh=VE75y
	2PZNpv97rcFuBflEUaHs5bByovg34YBSk0oV+g=; b=bW9XmCS7fPnzsejdUbYSj
	wXBjKglpjCUedOLLGDDkWj9cPgB8HIGJgydDS0YsTrLNOpvjGr0UMR9SxL1vQe1i
	PYk4bLxAdyH/TMATqEecq3AxkzIkTYnzZIobNjBDRjQ89wT00PWGZfUoT2fWBOtz
	kYDjtySIYwoiKr1BRWyhusDZydMjnAn4HdQfvF0A0cVcOIXe7G75fkmKruXvpYJQ
	9gY5ioKCsGeyG+SKet39VskVZ+Nd6zg/JrduQnqF94HmG8akj55FBfwXJbS86oD9
	Ms6ZLUAq4rP7+mMueFuNjElIDkMMcD/mXPIr2fT0/XgkUMbXn2qrFY7IkbtX9vnx
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id a1YZHCr6QzqL; Thu,  5 Sep 2024 20:47:33 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X0BJ43tjrzlgMVN;
	Thu,  5 Sep 2024 20:47:32 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2 2/3] locking/mutex: Introduce mutex_init_with_key()
Date: Thu,  5 Sep 2024 13:47:08 -0700
Message-ID: <20240905204709.556577-3-bvanassche@acm.org>
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

The following pattern occurs 5 times in kernel drivers:

	lockdep_register_key(key);
	__mutex_init(mutex, name, key);

In several cases the 'name' argument matches #mutex. Hence, introduce
the mutex_init_with_key() macro. This macro derives the 'name' argument
from the 'mutex' argument.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

