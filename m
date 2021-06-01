Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D095C393E95
	for <lists+linux-usb@lfdr.de>; Fri, 28 May 2021 10:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbhE1IR5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 May 2021 04:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235959AbhE1IRz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 May 2021 04:17:55 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059A9C061574
        for <linux-usb@vger.kernel.org>; Fri, 28 May 2021 01:16:19 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id o12-20020a5b050c0000b02904f4a117bd74so3552239ybp.17
        for <linux-usb@vger.kernel.org>; Fri, 28 May 2021 01:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=IGMauNtgVBPGGy8WGv6ECPQxdoO0JVhQLZud2NUEziI=;
        b=mMBusbY5nzn8Adxs7aCQ7grYRJkTFVN5NBU+4Ps1p0nquDQQkLYt4VfgEzMLCCk+3v
         8bh/b+JFWPVel0ZGmZeoNz4trYq8FwjquZxrnEYfpVgZFUfQ3ZPVOXdaTihZ3fYGXxgZ
         kX7FJl8dEqrT2mmUkO4H1FS0hD8pyKMIJ9LyCmOWVUvRZyUw97SWFIFOQBcX/cphcZaC
         CLXk3S9Oz3eL/Rbtd8IQti2/0e60Y15puIdg8ST/xeKcCr/Kj2cqizXGITiTy9PWBVhe
         BbD5bKjlkvCQFRkYNeo9niedT95xHYjHthSXtyeuyDU9CXqhR+JKEtwnpIZfvkSNaVJY
         Wong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=IGMauNtgVBPGGy8WGv6ECPQxdoO0JVhQLZud2NUEziI=;
        b=ZdMAr41ezm3hD+BooYkb6RqCdu25XrbcMKelD315kDmgHf3XCli5YXGRShhZ6MpB3c
         gw0CeNLP+EUk5OJ8bfmhndkL7Nroz8TOox0tCWUxax1vbnUxoJvkbSl6vq51Bao2Sr9v
         nIHyxkYa5CucSI45aBOYlP2SpqHrTM6SmhCnMe+fKt66Ef3pYCDcr7EviOSximZK+HKz
         IOVRGKi+VmfOG2EcX1vaUEOcXZtsqDtEQfrznvOr8ablCcvruHo7yC/hnws5MRBS/P6e
         XvaQy6yaWq78qpVEGU9clGEeqiAmuujgVYwAj/Eok4qJYTqVmyr7XFw8L8bVQ1s59vHY
         dV9w==
X-Gm-Message-State: AOAM533q5JxH+xVkTczEYA9WnGZnf7Iz3GhNnUpsMCYlGuHCe2bwp1Ro
        N/ML87jDEynzS6OfVkylGxk7wHSBwN0X
X-Google-Smtp-Source: ABdhPJw6LaBbL1OT9vwAUCoPFeawkotBh7NLDV/XmImrysOW7+DjvbuPARfM4t8+vTxFVlue7nf9FvCa9h/y
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:ce0b:b94c:8a37:2f9])
 (user=kyletso job=sendgmr) by 2002:a25:11c5:: with SMTP id
 188mr10349086ybr.322.1622189778225; Fri, 28 May 2021 01:16:18 -0700 (PDT)
Date:   Fri, 28 May 2021 16:16:13 +0800
Message-Id: <20210528081613.730661-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH] usb: pd: Set PD_T_SINK_WAIT_CAP to 310ms
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current timer PD_T_SINK_WAIT_CAP is set to 240ms which will violate the
SinkWaitCapTimer (tTypeCSinkWaitCap 310 - 620 ms) defined in the PD
Spec if the port is faster enough when running the state machine. Set it
to the lower bound 310ms to ensure the timeout is in Spec.

Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 include/linux/usb/pd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index bf00259493e0..96b7ff66f074 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -460,7 +460,7 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_T_RECEIVER_RESPONSE	15	/* 15ms max */
 #define PD_T_SOURCE_ACTIVITY	45
 #define PD_T_SINK_ACTIVITY	135
-#define PD_T_SINK_WAIT_CAP	240
+#define PD_T_SINK_WAIT_CAP	310	/* 310 - 620 ms */
 #define PD_T_PS_TRANSITION	500
 #define PD_T_SRC_TRANSITION	35
 #define PD_T_DRP_SNK		40
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

