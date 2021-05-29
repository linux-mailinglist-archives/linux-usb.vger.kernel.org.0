Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C716E394DF1
	for <lists+linux-usb@lfdr.de>; Sat, 29 May 2021 21:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhE2Tbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 May 2021 15:31:35 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11937 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhE2Tbe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 May 2021 15:31:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622316598; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=fQyUE58iaAi8NnHI1V7764COjMIGNrGcn481ccfwdz0=; b=ZYkNdeBGPCHFpKwmIZtiPAVTeM0eO2EfL3fMHpzHBSpwLgyDiv2ZTGU6m/Z55922VQM7h1vE
 PhlJ+6KtdvWwbURBRt7wBaJ9GE7oMB3opxQC2tod1stWnHRdn/Ah/87iA289c5vIxI28a2cA
 0x5WI1Himx/O+JbbN8KGrt2X/wk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60b29629f726fa4188b6e0a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 May 2021 19:29:45
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B6EE1C4338A; Sat, 29 May 2021 19:29:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EE3DC433D3;
        Sat, 29 May 2021 19:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EE3DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: dwc3: debugfs: Add and remove endpoint dirs dynamically
Date:   Sat, 29 May 2021 12:29:32 -0700
Message-Id: <20210529192932.22912-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DWC3 DebugFS directory and files are currently created once
during probe.  This includes creation of subdirectories for each
of the gadget's endpoints.  This works fine for peripheral-only
controllers, as dwc3_core_init_mode() calls dwc3_gadget_init()
just prior to calling dwc3_debugfs_init().

However, for dual-role controllers, dwc3_core_init_mode() will
instead call dwc3_drd_init() which is problematic in a few ways.
First, the initial state must be determined, then dwc3_set_mode()
will have to schedule drd_work and by then dwc3_debugfs_init()
could have already been invoked.  Even if the initial mode is
peripheral, dwc3_gadget_init() happens after the DebugFS files
are created, and worse so if the initial state is host and the
controller switches to peripheral much later.  And secondly,
even if the gadget endpoints' debug entries were successfully
created, if the controller exits peripheral mode, its dwc3_eps
are freed so the debug files would now hold stale references.

So it is best if the DebugFS endpoint entries are created and
removed dynamically at the same time the underlying dwc3_eps are.
Do this by calling dwc3_debugfs_create_endpoint_dir() as each
endpoint is created, and conversely remove the DebugFS entry when
the endpoint is freed.

Fixes: 41ce1456e1db ("usb: dwc3: core: make dwc3_set_mode() work properly")
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/dwc3/debug.h   |  3 +++
 drivers/usb/dwc3/debugfs.c | 21 ++-------------------
 drivers/usb/dwc3/gadget.c  |  3 +++
 3 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index d0ac89c5b317..d223c54115f4 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -413,9 +413,12 @@ static inline const char *dwc3_gadget_generic_cmd_status_string(int status)
 
 
 #ifdef CONFIG_DEBUG_FS
+extern void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep);
 extern void dwc3_debugfs_init(struct dwc3 *d);
 extern void dwc3_debugfs_exit(struct dwc3 *d);
 #else
+static inline void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep)
+{  }
 static inline void dwc3_debugfs_init(struct dwc3 *d)
 {  }
 static inline void dwc3_debugfs_exit(struct dwc3 *d)
diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 7146ee2ac057..5dbbe53269d3 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -886,30 +886,14 @@ static void dwc3_debugfs_create_endpoint_files(struct dwc3_ep *dep,
 	}
 }
 
-static void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep,
-		struct dentry *parent)
+void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep)
 {
 	struct dentry		*dir;
 
-	dir = debugfs_create_dir(dep->name, parent);
+	dir = debugfs_create_dir(dep->name, dep->dwc->root);
 	dwc3_debugfs_create_endpoint_files(dep, dir);
 }
 
-static void dwc3_debugfs_create_endpoint_dirs(struct dwc3 *dwc,
-		struct dentry *parent)
-{
-	int			i;
-
-	for (i = 0; i < dwc->num_eps; i++) {
-		struct dwc3_ep	*dep = dwc->eps[i];
-
-		if (!dep)
-			continue;
-
-		dwc3_debugfs_create_endpoint_dir(dep, parent);
-	}
-}
-
 void dwc3_debugfs_init(struct dwc3 *dwc)
 {
 	struct dentry		*root;
@@ -940,7 +924,6 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
 				&dwc3_testmode_fops);
 		debugfs_create_file("link_state", 0644, root, dwc,
 				    &dwc3_link_state_fops);
-		dwc3_debugfs_create_endpoint_dirs(dwc, root);
 	}
 }
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 65d9b7227752..dbba31d415d7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2754,6 +2754,8 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
 	INIT_LIST_HEAD(&dep->started_list);
 	INIT_LIST_HEAD(&dep->cancelled_list);
 
+	dwc3_debugfs_create_endpoint_dir(dep);
+
 	return 0;
 }
 
@@ -2797,6 +2799,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
 			list_del(&dep->endpoint.ep_list);
 		}
 
+		debugfs_remove_recursive(debugfs_lookup(dep->name, dwc->root));
 		kfree(dep);
 	}
 }
-- 
2.24.0

