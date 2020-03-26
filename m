Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913E71941C1
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 15:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgCZOo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 10:44:26 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:50377 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgCZOoZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 10:44:25 -0400
Received: by mail-qt1-f202.google.com with SMTP id v3so5247218qte.17
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=uADEPLEkmZYfl7wsDudGbWabefvMuQ72zIel8QzC/WU=;
        b=aw0P04YP4yvA8GnGIM0IcXnPvtJDys1Gity150L+KCmm0IC/T5fGbPj9kC4kCEVNJ4
         9z8syQlUrww+G4voblWJf75Z6KRzu3d24JGR6TiMNBqStsOdio+mylrao3e92CrcY7LK
         QzGJpMPFaY45X6JLhgAw7rhDD+F0Jz0PwZW4ROIJm1pbACbd03E6sTciNdO6Xb2xvYY6
         IZSF2/47CDqMxYpMpTRNU0RubDpO+/S7+m5G//Uh2q+GRU58O9NWqPvP4lH4TsxRICYL
         ggJg3t9A9DyAAdsoXV3c1yfF6ts0TtxS3q+Q5j0mxGcUldYz06whBc5d1uUs/TmcGMxB
         GeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uADEPLEkmZYfl7wsDudGbWabefvMuQ72zIel8QzC/WU=;
        b=pVuqpKs8nGxsElHLdKS9jiQCJVqKezWGrnvBrOouArEXEQTjXXQBNYyM92puLRSTu/
         MehF6WByugoMsBEy4TW2YcMGwiWa3UeVMaSf6rhOCIRzq/m25OLc9v3yvJTFsb8/I4Z5
         E1+OO59D5nhJvoUnp9AwPINryHQWiLL5ex7oMvUj9ypMCuNo8PE+GCQ5jw/sGu0bD1aW
         kQ/kxPYCazsyX/qQ++T/x5rjm73uhlJK+tjPyfIP446spld62yweJs8CHn2NySkf6lb+
         bEYFIUCZTGC9UMVqF2Rj43szH/9ZDR45Fwoyl1BIBwo+VWm6BEXzHCpM6z4elkhL0HUi
         j2Xw==
X-Gm-Message-State: ANhLgQ2l7EheZ0EeiUgHyBnRgHqA7G0Sl11xyUpGxUkCkBeMhOn8wZxK
        aqBesNmNE4BOQ+LimzR7ZLysf2Ia5iH1Dcc1
X-Google-Smtp-Source: ADFU+vs4gqRNBmQXkP6I3fFSrAC8BH3/Wz+XULZj0Pml6O/pA3hyTV2hkInmZiNHUchejwlpgz8UdPROVbbRnL5U
X-Received: by 2002:ac8:3565:: with SMTP id z34mr8683029qtb.168.1585233862532;
 Thu, 26 Mar 2020 07:44:22 -0700 (PDT)
Date:   Thu, 26 Mar 2020 15:44:02 +0100
In-Reply-To: <cover.1585233617.git.andreyknvl@google.com>
Message-Id: <6644839d3567df61ade3c4b246a46cacbe4f9e11.1585233617.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 3/7] kcov: move t->kcov assignments into kcov_start/stop
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

Every time kcov_start/stop() is called, t->kcov is also assigned, so
move the assignment into the functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/kcov.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index cc5900ac2467..888d0a236b04 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -309,10 +309,12 @@ void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
 EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
-static void kcov_start(struct task_struct *t, unsigned int size,
-			void *area, enum kcov_mode mode, int sequence)
+static void kcov_start(struct task_struct *t, struct kcov *kcov,
+			unsigned int size, void *area, enum kcov_mode mode,
+			int sequence)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
+	t->kcov = kcov;
 	/* Cache in task struct for performance. */
 	t->kcov_size = size;
 	t->kcov_area = area;
@@ -326,6 +328,7 @@ static void kcov_stop(struct task_struct *t)
 {
 	WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);
 	barrier();
+	t->kcov = NULL;
 	t->kcov_size = 0;
 	t->kcov_area = NULL;
 }
@@ -333,7 +336,6 @@ static void kcov_stop(struct task_struct *t)
 static void kcov_task_reset(struct task_struct *t)
 {
 	kcov_stop(t);
-	t->kcov = NULL;
 	t->kcov_sequence = 0;
 	t->kcov_handle = 0;
 }
@@ -584,9 +586,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			return mode;
 		kcov_fault_in_area(kcov);
 		kcov->mode = mode;
-		kcov_start(t, kcov->size, kcov->area, kcov->mode,
+		kcov_start(t, kcov, kcov->size, kcov->area, kcov->mode,
 				kcov->sequence);
-		t->kcov = kcov;
 		kcov->t = t;
 		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
 		kcov_get(kcov);
@@ -778,7 +779,6 @@ void kcov_remote_start(u64 handle)
 	kcov = remote->kcov;
 	/* Put in kcov_remote_stop(). */
 	kcov_get(kcov);
-	t->kcov = kcov;
 	/*
 	 * Read kcov fields before unlock to prevent races with
 	 * KCOV_DISABLE / kcov_remote_reset().
@@ -792,7 +792,6 @@ void kcov_remote_start(u64 handle)
 	if (!area) {
 		area = vmalloc(size * sizeof(unsigned long));
 		if (!area) {
-			t->kcov = NULL;
 			kcov_put(kcov);
 			return;
 		}
@@ -800,7 +799,7 @@ void kcov_remote_start(u64 handle)
 	/* Reset coverage size. */
 	*(u64 *)area = 0;
 
-	kcov_start(t, size, area, mode, sequence);
+	kcov_start(t, kcov, size, area, mode, sequence);
 
 }
 EXPORT_SYMBOL(kcov_remote_start);
@@ -873,7 +872,6 @@ void kcov_remote_stop(void)
 		return;
 
 	kcov_stop(t);
-	t->kcov = NULL;
 
 	spin_lock(&kcov->lock);
 	/*
-- 
2.26.0.rc2.310.g2932bb562d-goog

