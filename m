Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9675386DB6
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 01:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344486AbhEQXhd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 19:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344478AbhEQXhc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 19:37:32 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F3AC061573
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 16:36:15 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v184-20020a257ac10000b02904f84a5c5297so11357841ybc.16
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=q+UoCkDGAvRqrLzMap85aK4sT0upthVT2kMDgBIV4RE=;
        b=nIvh1nvCynlMWsxrbrXssOnrwQgJaKqZul6qCGlZdEtCR8uM6Yjzba0iP1xUxLL+U3
         QeueNVoJ06ITkT+tmp4WdOgxMTgnagYMyUWIA71EfaO4pK4hU207CThEwDUgHV0R+7lE
         9iuSXWaa6Qt42o2oAjWttoN75vrpJvcbbdL7loOrw9gTxZw6WOawf+j8k1a5OHi8jYKy
         tmDhO5r8ooCRVSh4ylTyemWoQZTU/PMqEimGVBDDOgY9bKo+aSsp9le+QXa8tprQ/mWN
         dn5yziEzBxNFa2sPiL2S56W+FAqIRuAN0Z7p/NEwenHaVzdf3NgftJhI10EfAnChhpqg
         QVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=q+UoCkDGAvRqrLzMap85aK4sT0upthVT2kMDgBIV4RE=;
        b=iuB0gHiMn+T0L/YJNTG0HTlqWWy25kXJktstHlgtvnI0J7lzNNbVGV1ZwxzRlpXzfQ
         ysKXS8u1f0UIV3yYfVGa7vMdCykZcIjVgrstul8VNsnFdheU31A1Ztcj1VNoaSu925dw
         72qNWLyeX+3k0HVpkVdp9q3+YpY90o3Ygzp78U6Yz18saBWzwWz1RaKzjZrvoQUgvxm6
         A9Fc6NtA+gZBwwgwsmZVFhXD2zkgmfDAuR81yeLcyQGzhZDWEwtfhtXqDMg08q4pv8UE
         PUG2TQ/2Yxww8vZrUGdypqvVeEowTCGE5SU8FgQ+2xhroRqjmDIFLLredXywEajRRpyg
         ZJLg==
X-Gm-Message-State: AOAM531reroaVSt9jwVmif+U7+cCBGkVwS/p6+5lQIewLW1/jMEwy939
        CFGFEqCiBlJkv7dOoosiyr4WQtVVPEI=
X-Google-Smtp-Source: ABdhPJxyNIDZXlnARe5+IXunIQ1I+2VXbPVtN+U7UXk5wbWO8hIpBuQ1bL6dgPJrMYPRnrTTXmV7IAIjv/o=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:b562:7011:fe35:1c9e])
 (user=badhri job=sendgmr) by 2002:a25:2f57:: with SMTP id v84mr3257285ybv.107.1621294574479;
 Mon, 17 May 2021 16:36:14 -0700 (PDT)
Date:   Mon, 17 May 2021 16:36:09 -0700
In-Reply-To: <20210517233609.610248-1-badhri@google.com>
Message-Id: <20210517233609.610248-2-badhri@google.com>
Mime-Version: 1.0
References: <20210517233609.610248-1-badhri@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v1 2/2] usb: typec: tcpm: Add module parameter to wrap around logs
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the buffer is full, TCPM stops logging into the buffer.
This change adds log_wraparound module parameter which when set
flushes out the oldest log entries (FIFO) to make way for the
newer ones.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index b79194919b27..a369decade60 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -38,6 +38,10 @@ static bool modparam_log_misc_dev;
 module_param_named(log_misc_dev, modparam_log_misc_dev, bool, 0444);
 MODULE_PARM_DESC(log_misc_dev, "Expose tcpm logs through misc device");
 
+static bool modparam_log_wraparound;
+module_param_named(log_wraparound, modparam_log_wraparound, bool, 0444);
+MODULE_PARM_DESC(log_wraparound, "Wrap around logs");
+
 #define FOREACH_STATE(S)			\
 	S(INVALID_STATE),			\
 	S(TOGGLING),			\
@@ -597,7 +601,7 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
 
 	vsnprintf(tmpbuffer, sizeof(tmpbuffer), fmt, args);
 
-	if (tcpm_log_full(port)) {
+	if (!modparam_log_wraparound && tcpm_log_full(port)) {
 		port->logbuffer_head = max(port->logbuffer_head - 1, 0);
 		strcpy(tmpbuffer, "overflow");
 	}
@@ -621,6 +625,9 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
 		  (unsigned long)ts_nsec, rem_nsec / 1000,
 		  tmpbuffer);
 	port->logbuffer_head = (port->logbuffer_head + 1) % LOG_BUFFER_ENTRIES;
+	if (modparam_log_wraparound && port->logbuffer_head == port->logbuffer_tail)
+		port->logbuffer_tail =
+			(port->logbuffer_tail + 1) % LOG_BUFFER_ENTRIES;
 
 abort:
 	mutex_unlock(&port->logbuffer_lock);
@@ -733,7 +740,7 @@ static int tcpm_log_show(struct seq_file *s, void *v)
 		seq_printf(s, "%s\n", port->logbuffer[tail]);
 		tail = (tail + 1) % LOG_BUFFER_ENTRIES;
 	}
-	if (!seq_has_overflowed(s))
+	if (!modparam_log_wraparound && !seq_has_overflowed(s))
 		port->logbuffer_tail = tail;
 	mutex_unlock(&port->logbuffer_lock);
 
-- 
2.31.1.751.gd2f1c929bd-goog

