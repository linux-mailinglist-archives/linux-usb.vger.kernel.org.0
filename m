Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3BC1941C6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 15:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgCZOoi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 10:44:38 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:48204 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgCZOog (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 10:44:36 -0400
Received: by mail-wr1-f73.google.com with SMTP id d1so3132240wru.15
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=BlSTEEJDHJm2U/4O7K2LlSQNpyzxY2AHmNeqxBMGqLE=;
        b=T7rfAJNouLP3QFbM7TjP2jKWn6OXe65PojXJkkX0Qk8dDkngAXWRVnPYsr8VxL1ujL
         +c6h+Q2mhiAEGAZzGrjdL5kHYOFN3oHTyYRbTbzsD1HOOF9s1L3ZXQ5WQgk0ugjvhzoT
         RglWzWjx+LDQPZRsXCDn6CJBZD5VRg4q+irS+8ww6cO54kjukjRDPxQBtYWdF+LXxx6g
         Rr5R7U4IG8Z6F2v9gHuUdr/x+/7NDk0OpSI5FzKBZBkAKtIVzl2M4cGxT61BGgV1ILzd
         jxr1PH63vVfKFE1rWp6cPQ13CoQTvQqOIPdfbAwgWZN/xAZudV1B7iWOy9z+iQuGcsVH
         Kxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BlSTEEJDHJm2U/4O7K2LlSQNpyzxY2AHmNeqxBMGqLE=;
        b=Bh3M9vgvK/xPE/5lmJ4LTjhv3/c5d7ST4l5m+Yr5Ga8m90MAUeDLSg6cbLBKWcimjY
         k61QYIIgMTKSzEzJX7+wkQt2FsMpdHzazGU4upSY4I70V7AvxjdpRjfNH18vQgvCnpUV
         qLT08CHyweyTSD05FRYK247UCibkEsCSzH9ekE1blnAkhBPdjf+tMoUwg13Ya6/na0DJ
         yX0nvHfHX2wODFmtiNbqfBw64BL2CB3w0yUswB4H4PD2iv/vPnOYzF9GKLvtshkGae+Y
         0zhI/cMAg6Q3weoUWXZwE1+mpRu4Mzkg3YuKvtFsdF/SYchVobA9JlEuQBS1SRfvgrlv
         7NIA==
X-Gm-Message-State: ANhLgQ3iGR6a+4njRwG3WGL0VdiEbIToP+gChAmCfBeNRi3qi5piOTIX
        XoK6TGmDOKpoypkPm0F97yCG2muu/c7bABfz
X-Google-Smtp-Source: ADFU+vu4Wmk3bo0iTn0SCfakv1wwE8avBfBttA5grmmbe01DRbQuLXjTHB3LsyiFQwggR2UX3CWXHn0Kedt0netC
X-Received: by 2002:adf:db0a:: with SMTP id s10mr6783005wri.361.1585233874611;
 Thu, 26 Mar 2020 07:44:34 -0700 (PDT)
Date:   Thu, 26 Mar 2020 15:44:06 +0100
In-Reply-To: <cover.1585233617.git.andreyknvl@google.com>
Message-Id: <4520671eeb604adbc2432c248b0c07fbaa5519ef.1585233617.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v4 7/7] usb: core: kcov: collect coverage from usb complete callback
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

This patch adds kcov_remote_start/stop() callbacks around the urb
complete() callback that is executed in softirq context when dummy_hcd
is in use. As the result, kcov can be used to collect coverage from those
callbacks, which is used to facilitate coverage-guided fuzzing with
syzkaller.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/usb/core/hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index aa45840d8273..de624c47e190 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -31,6 +31,7 @@
 #include <linux/types.h>
 #include <linux/genalloc.h>
 #include <linux/io.h>
+#include <linux/kcov.h>
 
 #include <linux/phy/phy.h>
 #include <linux/usb.h>
@@ -1645,7 +1646,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 
 	/* pass ownership to the completion handler */
 	urb->status = status;
+	kcov_remote_start_usb((u64)urb->dev->bus->busnum);
 	urb->complete(urb);
+	kcov_remote_stop();
 
 	usb_anchor_resume_wakeups(anchor);
 	atomic_dec(&urb->use_count);
-- 
2.26.0.rc2.310.g2932bb562d-goog

