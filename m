Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3901941CC
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 15:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgCZOow (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 10:44:52 -0400
Received: from mail-wm1-f74.google.com ([209.85.128.74]:41910 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgCZOoX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 10:44:23 -0400
Received: by mail-wm1-f74.google.com with SMTP id f207so2538054wme.6
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 07:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=pUHuESTKj8oX3rFdN5fYGgzuMeb9qfGw8IwhPoMTDMA=;
        b=FhIoyUmrn4ShByWsJAyife9npYZwAwtImGROiYB3g54hnYVqJHuVPKFwiLyFVD2JjF
         4hH1g2oXBbrKMrLg45cPPblaUO8K5EKVM53f49H9ca8i6t3BfL7OfI1PAYb6Y6VMND9M
         sqGui/aWUV+7roKV6oKPGulSLk3qzR1qMb3We2uY1F16QGAYN0KjbFnZxuyO6p4pywi+
         532T1vUIQRpkS1a7CCJ0moHhsFP1WuN06DKLupDZQ/RoADiJUGpfMTUthW/b7VHoZ1nu
         /wCHuS57uOKExIDF+B1o8DHWja5DUTEy06HKQPs4LFR3+AEr0o1tFXhqigq2DiMhtNMA
         2f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pUHuESTKj8oX3rFdN5fYGgzuMeb9qfGw8IwhPoMTDMA=;
        b=W/Br5WQjnAgINGX/594IrwgjcG2oQ5oDZvRgwvefKM3hl/ZlMb7twRl3m4JEiHX+v1
         bQ0jpZmekHPAY7nQRqV1N2IRZTpUk5GWv/FROAofBPeas7qgBEgIUUKc/9mXlUFCgBgr
         NpRP+x4PyKtf7u+YAzHoX9YKCIG/c1YbcNBfXL2k5SiEs0RW+eyezPErSnsvksLy395p
         zoa57sPkC6SkYK9EodNioqwajZhYBaPGAHQfUPgZE6CcrIDfqp0fxELcI+3kYKfcYa9Q
         IequZFYGbM//lh8vYBad7MsmCV/ehNmLqpGqCAkQCFA8xn8ktN8VQp3EjhqVwSG39x+e
         x8Yg==
X-Gm-Message-State: ANhLgQ1XEkg5+6CiTlCDXZKt17qmxkehP+dD6/LuZK9A2dpY8qdtM9Uf
        zOeC7j78yGvocfjmTermmq+zjA/XxaUOYckE
X-Google-Smtp-Source: ADFU+vs0KXaxlxADpXExCJIuRumete/6F3eTe5emAyvJp6l9dhGeqpsgqwUVVX03+S11UXk7EkQ4taSnSeGcmyij
X-Received: by 2002:a5d:4003:: with SMTP id n3mr9356095wrp.176.1585233859680;
 Thu, 26 Mar 2020 07:44:19 -0700 (PDT)
Date:   Thu, 26 Mar 2020 15:44:01 +0100
In-Reply-To: <cover.1585233617.git.andreyknvl@google.com>
Message-Id: <9d9134359725a965627b7e8f2652069f86f1d1fa.1585233617.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 2/7] kcov: fix potential use-after-free in kcov_remote_start
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

If vmalloc() fails in kcov_remote_start() we'll access remote->kcov
without holding kcov_remote_lock, so remote might potentially be freed
at that point. Cache kcov pointer in a local variable.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/kcov.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index f6bd119c9419..cc5900ac2467 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -748,6 +748,7 @@ static const struct file_operations kcov_fops = {
 void kcov_remote_start(u64 handle)
 {
 	struct kcov_remote *remote;
+	struct kcov *kcov;
 	void *area;
 	struct task_struct *t;
 	unsigned int size;
@@ -774,16 +775,17 @@ void kcov_remote_start(u64 handle)
 		spin_unlock(&kcov_remote_lock);
 		return;
 	}
+	kcov = remote->kcov;
 	/* Put in kcov_remote_stop(). */
-	kcov_get(remote->kcov);
-	t->kcov = remote->kcov;
+	kcov_get(kcov);
+	t->kcov = kcov;
 	/*
 	 * Read kcov fields before unlock to prevent races with
 	 * KCOV_DISABLE / kcov_remote_reset().
 	 */
-	size = remote->kcov->remote_size;
-	mode = remote->kcov->mode;
-	sequence = remote->kcov->sequence;
+	size = kcov->remote_size;
+	mode = kcov->mode;
+	sequence = kcov->sequence;
 	area = kcov_remote_area_get(size);
 	spin_unlock(&kcov_remote_lock);
 
@@ -791,7 +793,7 @@ void kcov_remote_start(u64 handle)
 		area = vmalloc(size * sizeof(unsigned long));
 		if (!area) {
 			t->kcov = NULL;
-			kcov_put(remote->kcov);
+			kcov_put(kcov);
 			return;
 		}
 	}
-- 
2.26.0.rc2.310.g2932bb562d-goog

