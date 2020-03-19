Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D753218C2D1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 23:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbgCSWMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 18:12:16 -0400
Received: from mail-wr1-f73.google.com ([209.85.221.73]:38027 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCSWMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 18:12:15 -0400
Received: by mail-wr1-f73.google.com with SMTP id q18so1682058wrw.5
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Ec1QNNZB9RdZOPOOrrZEv520YKl8QD3P6+7VUng4a2o=;
        b=wGNCWsxxzE05P/opJCYnv1N8zFwNt6cTq4ckyZiz9oQ5890qOacNIWKpN7Y++MLt6+
         +YKxBiZXwSFk1IGTSnQFc06R14nY8UWmBgLdcbf7MdFyRG1MvL6T6rd8RP3yB53TVKyf
         +Uc3R9oxRBqgWKVz/QSvUAel4ej1J8si1HLNu0Rai083j03ODYzNjaVZf5T0XtF/kjJh
         LwTg7zhgbj4V9RDUcQo4mmHihgfAC9ymlc6F/1mRhJPaKXIcT7VSTgKS++nhSDDRJStp
         Lp/miL7zNG4MdaM7dB/m1BK/l18wytSw5UL2GhIyw3LNguhr0wHydS463Cf5gI+Zqiwl
         CXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Ec1QNNZB9RdZOPOOrrZEv520YKl8QD3P6+7VUng4a2o=;
        b=ILPLwcfBYnzt7jG/kxM93ejctXpCKmqOG/aD1v3Ntme0Ad6JUuLvTKTOe2cSVDIv/f
         SdqEkQwodAvSSn2ij6OJa09Tjf4EPa8vqmKfLvajz/lV43oXDzHX3SFiatVbcaKcVnr+
         0sdjdYbTCfimx098kcZlV/rLiNizbixC1Kvbd09uogNWRVdI6PzlJSEMYPg9ms4227GG
         XP0eQ/dutAsHWvvd6buK9Z20EWvkYAOc4roe14t6cg/HiLV9/gwQWidaDC5pvkqx43xs
         Vfl8jFWcBJvd1B4hT1nTCp26EqpmE2JZDJdnCrJxUX5P95JCRNoQ1HJdxGthNuvzJXvO
         C8nQ==
X-Gm-Message-State: ANhLgQ08bB9xzpRiCn8LrmFNdeP8Xte4uN7vUkY7Ay+U3b4b8jd3EtkI
        0GhN28KSnUULLwwkzX95PovhonKOWhypV4Jh
X-Google-Smtp-Source: ADFU+vushxI8BnYkgZABMFdSfaL5+yV3YI3la2gcdZ5v3T5GugDgvBJQPNjSNj8fkPYEaoYtd6RE48XYpmoP4A7m
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr6989126wrs.96.1584655933185;
 Thu, 19 Mar 2020 15:12:13 -0700 (PDT)
Date:   Thu, 19 Mar 2020 23:11:41 +0100
In-Reply-To: <cover.1584655448.git.andreyknvl@google.com>
Message-Id: <2821d497ac1cdc0efb5e00df30271e4a67fc8009.1584655448.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1584655448.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 7/7] usb: core: kcov: collect coverage from usb complete callback
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
2.25.1.696.g5e7596f4ac-goog

