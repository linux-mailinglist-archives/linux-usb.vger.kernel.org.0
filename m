Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FF62906AE
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 15:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408169AbgJPN54 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 09:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395556AbgJPN5z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 09:57:55 -0400
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889ABC061755
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 06:57:55 -0700 (PDT)
Received: by mail-wm1-x34a.google.com with SMTP id c204so811795wmd.5
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=7zDNhPy5uc8ogz43uAAVw05Oz1rJmR7+6LDT853a82A=;
        b=Y4XB+ZRhrCz7A+n9G/WnCF8CEAVpPH07zo9bQCsffKeXsRpHkh4nYvpGW9+UdVYH9I
         5ewSDjdF+a6y0YJNM7iMm9F/TQT9oox5ruhHmKebT//cZXOkVCuABfGe7UUFhYERSAPj
         hTfj5tqZ6X0TF9X/3PAcmBdgpOrga4CXpcq8tQybjN18LXGarSEWMwket6K8LvfkzhYf
         AceeBY45BtBzhysrUEXMvx7iHFIVsN1nmY8Lgv5lA/qBUXLiPvV0Nxe3Dk4yDBe1kZVQ
         BrUBWSyIHFKryNJhGizpiQn18nzMEVvoKxNPfYK6kGPqmNzlMLwGtVEw2FciLOe6+spk
         G1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=7zDNhPy5uc8ogz43uAAVw05Oz1rJmR7+6LDT853a82A=;
        b=jKLG00775bVHhiNqjf3mZhGEbX2OyQPDx6xIJRFETZC7Sagu3EJCLAc3YVown0lyp5
         9Usha4HkDbnELDqTerPK6elC5czbhalE4cDRrpDFpuOsfPn/pUpwnqkKMAIJ/pB34wQF
         lc/U2KGALaj42rfKj4Dl4TSMHzu3gSA/E81si+bCyVyBLm3jH4ftVwkUiB8O4uatdP7H
         hiI11C4M69wUB74eMC/pFVPXwcYJFMj0Y+ABWL+hDzT2/KXPWM+fUZX1qKMPsa4Oy+Mj
         Jo47OS7VwsOchk454oVL8Nyq+T/eIvWd72Mpl9a919jH7u+4CcZapMs5Pq07Eq9bsLWZ
         pj3Q==
X-Gm-Message-State: AOAM532lmSUNftPrAth2FNGmWZS4qiPAWGGr9okimB9iiaEn3stf8/Iy
        9RHTgtfXk2ul7Fg3SanIhQ2Cs85SO4CnXPYX
X-Google-Smtp-Source: ABdhPJyjpxbLtjDZsCgYCWCSKPekYZtidvLDRCAX+mRjETMl7mHYP/SGTA6yKCFT9+QDQLxxgZfWL5c6GwsXIZUW
Sender: "andreyknvl via sendgmr" <andreyknvl@andreyknvl3.muc.corp.google.com>
X-Received: from andreyknvl3.muc.corp.google.com ([2a00:79e0:15:13:7220:84ff:fe09:7e9d])
 (user=andreyknvl job=sendgmr) by 2002:a1c:c28a:: with SMTP id
 s132mr3899832wmf.67.1602856673396; Fri, 16 Oct 2020 06:57:53 -0700 (PDT)
Date:   Fri, 16 Oct 2020 15:57:45 +0200
Message-Id: <f3a7a153f0719cb53ec385b16e912798bd3e4cf9.1602856358.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v4] kcov, usb: only collect coverage from __usb_hcd_giveback_urb
 in softirq
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently there's a KCOV remote coverage collection section in
__usb_hcd_giveback_urb(). Initially that section was added based on the
assumption that usb_hcd_giveback_urb() can only be called in interrupt
context as indicated by a comment before it. This is what happens when
syzkaller is fuzzing the USB stack via the dummy_hcd driver.

As it turns out, it's actually valid to call usb_hcd_giveback_urb() in task
context, provided that the caller turned off the interrupts; USB/IP does
exactly that. This can lead to a nested KCOV remote coverage collection
sections both trying to collect coverage in task context. This isn't
supported by KCOV, and leads to a WARNING.

Change __usb_hcd_giveback_urb() to only call kcov_remote_*() callbacks
when it's being executed in a softirq. As the result, the coverage from
USB/IP related usb_hcd_giveback_urb() calls won't be collected, but the
WARNING is fixed.

A potential future improvement would be to support nested remote coverage
collection sections, but this patch doesn't address that.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
Acked-by: Marco Elver <elver@google.com>
---

Changes v3->v4:
- Don't make any kcov changes, do a softirq context check in usb code
  instead.

---
 drivers/usb/core/hcd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a33b849e8beb..2f6a39e09dc6 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1646,9 +1646,16 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 
 	/* pass ownership to the completion handler */
 	urb->status = status;
-	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
+	/*
+	 * This function can be called in task context inside another remote
+	 * coverage collection section, but KCOV doesn't support that kind of
+	 * recursion yet. Only collect coverage in softirq context for now.
+	 */
+	if (in_serving_softirq())
+		kcov_remote_start_usb((u64)urb->dev->bus->busnum);
 	urb->complete(urb);
-	kcov_remote_stop();
+	if (in_serving_softirq())
+		kcov_remote_stop();
 
 	usb_anchor_resume_wakeups(anchor);
 	atomic_dec(&urb->use_count);
-- 
2.29.0.rc1.297.gfa9743e501-goog

