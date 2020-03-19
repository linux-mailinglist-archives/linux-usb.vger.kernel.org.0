Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A429918C2CF
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 23:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgCSWMJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 18:12:09 -0400
Received: from mail-wm1-f74.google.com ([209.85.128.74]:39594 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgCSWMI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 18:12:08 -0400
Received: by mail-wm1-f74.google.com with SMTP id f8so1206483wmh.4
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Pwl3VRG7l199xZxXoBkdQ57y28gQcRR32eC7hYs9l4c=;
        b=pWhK7I5rdncYloHW6Fkfx4nIo8X3qtdW2rxT6ih9yWpH4pobvweIuJDqvPUYPPO4iY
         4pG5X3Qqv9W5F6idw4bdcmHH5SnzClP/tY5k2/zanV/TNQDGFVKBqtAlw+HvirHj/uMp
         d91WfBmdnK/WGSzwfj9bbIFA8YG7exOEDBBJIYKziaiVmqXfy6uW58J4U1mEdZ6cPcx9
         zCKOl67So2udYcFODqgJJEv9MO4J3KaYO79LqitpcKL33PYcTPjWSHlJEzi07OQNAaUf
         xhWjSfzO7+ZCa8dZf7NCr+b1lxh2SlD5kLGcHSO7u3CQyKCEDvHbC8G52l9kYUk/J8y+
         Q8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Pwl3VRG7l199xZxXoBkdQ57y28gQcRR32eC7hYs9l4c=;
        b=BNkEmRzW0BxjR7WttBe8IrBTK1crOFZ4D/GFCp+83AxHYcSboSil8uM/udVlc0BnZu
         XAWvdvkV58pFmB6GaXB3eEv7bRqCHqZ3tlgZC7H8HpVhkX8LJiLmmfTq90EeuCo/SMta
         eF6N58/QBZF5ox1MIHZ4luN908F53/xHq2xKxoWtDyJJngXid7kIllq9JJPWihhZ1QB0
         GrBlkz6i3va8AUxyATCY1I+nyU3gT8PrJ5sgxd1zyNVNiKfehPDxmWUDYLLBBZQZKnPb
         ZeS26gvXeuH1HJpFFdk8o14FzPoKHOWXZL4Rp8iwlLOCcYPQLch5gVXGF1e0aJ/ywRBB
         10iQ==
X-Gm-Message-State: ANhLgQ0N36fNsozz5KZHufHizfabmUVB9/SwZHHD6KA3xH5Z8waMMI8E
        PcG+Dd2AOE0LtIT2tM1ittYGE9+Xnzh0nJ+A
X-Google-Smtp-Source: ADFU+vsYnWygxaZdLWxuwiGudbZrcGJUrSwc+9kGKeC9fi4pOh1OgxeTaEDnXEJ7XF0KIUsfQI7FXPCAd+OsDFL1
X-Received: by 2002:adf:b31d:: with SMTP id j29mr5068188wrd.218.1584655926761;
 Thu, 19 Mar 2020 15:12:06 -0700 (PDT)
Date:   Thu, 19 Mar 2020 23:11:39 +0100
In-Reply-To: <cover.1584655448.git.andreyknvl@google.com>
Message-Id: <ee1a1dec43059da5d7664c85c1addc89c4cd58de.1584655448.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1584655448.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 5/7] kcov: use t->kcov_mode as enabled indicator
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Andrey Konovalov <andreyknvl@gmail.com>

Currently kcov_remote_start() and kcov_remote_stop() check t->kcov to
find out whether the coverage is already being collected by the
current task. Use t->kcov_mode for that instead. This doesn't change
the overall behavior in any way, but serves as a preparation for the
following softirq coverage collection support patch.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/kcov.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index b985b7a72870..e43f06b5b2e4 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -746,26 +746,33 @@ static const struct file_operations kcov_fops = {
  * In turns kcov_remote_stop() clears those pointers from task_struct to stop
  * collecting coverage and copies all collected coverage into the kcov area.
  */
+
+static inline bool kcov_mode_enabled(unsigned int mode)
+{
+	return (mode & ~KCOV_IN_CTXSW) != KCOV_MODE_DISABLED;
+}
+
 void kcov_remote_start(u64 handle)
 {
+	struct task_struct *t = current;
 	struct kcov_remote *remote;
 	struct kcov *kcov;
+	unsigned int mode;
 	void *area;
-	struct task_struct *t;
 	unsigned int size;
-	enum kcov_mode mode;
 	int sequence;
 
 	if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
 		return;
 	if (WARN_ON(!in_task()))
 		return;
-	t = current;
+
 	/*
 	 * Check that kcov_remote_start is not called twice
 	 * nor called by user tasks (with enabled kcov).
 	 */
-	if (WARN_ON(t->kcov))
+	mode = READ_ONCE(t->kcov_mode);
+	if (WARN_ON(kcov_mode_enabled(mode)))
 		return;
 
 	kcov_debug("handle = %llx\n", handle);
@@ -863,13 +870,20 @@ static void kcov_move_area(enum kcov_mode mode, void *dst_area,
 void kcov_remote_stop(void)
 {
 	struct task_struct *t = current;
-	struct kcov *kcov = t->kcov;
-	void *area = t->kcov_area;
-	unsigned int size = t->kcov_size;
-	int sequence = t->kcov_sequence;
+	struct kcov *kcov;
+	unsigned int mode;
+	void *area;
+	unsigned int size;
+	int sequence;
 
-	if (!kcov)
+	mode = READ_ONCE(t->kcov_mode);
+	barrier();
+	if (!kcov_mode_enabled(mode))
 		return;
+	kcov = t->kcov;
+	area = t->kcov_area;
+	size = t->kcov_size;
+	sequence = t->kcov_sequence;
 
 	kcov_stop(t);
 
-- 
2.25.1.696.g5e7596f4ac-goog

