Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470462EB3C0
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 20:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbhAETyb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 14:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbhAETyb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 14:54:31 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1477C061793
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 11:53:50 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id o17so291787wra.8
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 11:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=ToKZZMMFz2dd/gf3h/vSB+5EZJff08Hd9cEbaiMy84Y=;
        b=CWm5A0APLQGiDEX/cmztnRMrbSiqhmqNLQmIiJ0APCRrgh8oPEfvPm3qT7VkHmQwdo
         yTuH+GeHC95ca5j7oc/L/LRrH/US/VSZBO/tmmfhNPQkYoV/A5R5kLVqrZxUbaqn3YNg
         B059PR+md3XhtobFjtGkaFTRh0fVl87wm3IMQHS2rtmr/ouQNgdX8RGAM/osW8xCPTqE
         gM/3lBPaPvPmwkfh2SNaDI0jfhi92G61vgQeyFfJ86isCPHarV+Cf4dY4eGV0cSDqdle
         wTKqgCytRkySBjnElA2jamUygG7Vj350ZRqW+AQw8ZyVOe4wyTPpo9Z1vxs/+G6YQn7n
         uIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=ToKZZMMFz2dd/gf3h/vSB+5EZJff08Hd9cEbaiMy84Y=;
        b=Z38U1FkImYYyYsolR8r9hpB/1n4mMqNwaozgpQAoL6k0drhmmoSM26PEqBgNs+wrjX
         ablJWmnyVdBMVa22PxMejlevnmXfFsxicgGUhC4AAbJZ0cN8cb+XsCPmCzsTl07Z8vyb
         +JOAJvnCuIRhpjW/J9KXpIz96xC+sMj6LXS9XxBm4bMSAiliQ+CAAIKGZxgrGR/EZZmr
         oNenCDIrlOVltfqvh2EKOCrtjgrdbSxlKt/VSU107hqaNvxpJrGzbqzVOIOOpKKaWf0n
         7/rZWO2HvMtwbrDnetuhkhjw1orxLShvU2o0DLx246vBVtYnqLFpugb7ejVQkOVjveu0
         CnPw==
X-Gm-Message-State: AOAM5313lKU/AVibMeLSs+yVlmZhehoQzJ+Brh0IzKAJBN0UEUV+3WBk
        sTwHdffNngFgxPCa4ofCtcq1ACl0NpHTX2fC
X-Google-Smtp-Source: ABdhPJxoYl3KGFqdPYJ3I4EGacdjLC4SRz3qt4263BrYNUoQ6K35UXDh04EsS5xi+B9QaOw5AmzVyEP717uA092A
Sender: "andreyknvl via sendgmr" <andreyknvl@andreyknvl3.muc.corp.google.com>
X-Received: from andreyknvl3.muc.corp.google.com ([2a00:79e0:15:13:7220:84ff:fe09:7e9d])
 (user=andreyknvl job=sendgmr) by 2002:adf:f6c9:: with SMTP id
 y9mr1090609wrp.121.1609876429392; Tue, 05 Jan 2021 11:53:49 -0800 (PST)
Date:   Tue,  5 Jan 2021 20:53:42 +0100
Message-Id: <aeb430c5bb90b0ccdf1ec302c70831c1a47b9c45.1609876340.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH] kcov, usb: hide in_serving_softirq checks in __usb_hcd_giveback_urb
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Done opencode in_serving_softirq() checks in in_serving_softirq() to avoid
cluttering the code, hide them in kcov helpers instead.

Fixes: aee9ddb1d371 ("kcov, usb: only collect coverage from __usb_hcd_giveback_urb in softirq")
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/core/hcd.c |  8 +++-----
 include/linux/kcov.h   | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 60886a7464c3..ad5a0f405a75 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1649,14 +1649,12 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	urb->status = status;
 	/*
 	 * This function can be called in task context inside another remote
-	 * coverage collection section, but KCOV doesn't support that kind of
+	 * coverage collection section, but kcov doesn't support that kind of
 	 * recursion yet. Only collect coverage in softirq context for now.
 	 */
-	if (in_serving_softirq())
-		kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+	kcov_remote_start_usb_softirq((u64)urb->dev->bus->busnum);
 	urb->complete(urb);
-	if (in_serving_softirq())
-		kcov_remote_stop();
+	kcov_remote_stop_softirq();
 
 	usb_anchor_resume_wakeups(anchor);
 	atomic_dec(&urb->use_count);
diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index a10e84707d82..4e3037dc1204 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -52,6 +52,25 @@ static inline void kcov_remote_start_usb(u64 id)
 	kcov_remote_start(kcov_remote_handle(KCOV_SUBSYSTEM_USB, id));
 }
 
+/*
+ * The softirq flavor of kcov_remote_*() functions is introduced as a temporary
+ * work around for kcov's lack of nested remote coverage sections support in
+ * task context. Adding suport for nested sections is tracked in:
+ * https://bugzilla.kernel.org/show_bug.cgi?id=210337
+ */
+
+static inline void kcov_remote_start_usb_softirq(u64 id)
+{
+	if (in_serving_softirq())
+		kcov_remote_start_usb(id);
+}
+
+static inline void kcov_remote_stop_softirq(void)
+{
+	if (in_serving_softirq())
+		kcov_remote_stop();
+}
+
 #else
 
 static inline void kcov_task_init(struct task_struct *t) {}
@@ -66,6 +85,8 @@ static inline u64 kcov_common_handle(void)
 }
 static inline void kcov_remote_start_common(u64 id) {}
 static inline void kcov_remote_start_usb(u64 id) {}
+static inline void kcov_remote_start_usb_softirq(u64 id) {}
+static inline void kcov_remote_stop_softirq(void) {}
 
 #endif /* CONFIG_KCOV */
 #endif /* _LINUX_KCOV_H */
-- 
2.29.2.729.g45daf8777d-goog

