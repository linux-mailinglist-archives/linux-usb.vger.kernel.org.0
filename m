Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010EF34B8D8
	for <lists+linux-usb@lfdr.de>; Sat, 27 Mar 2021 19:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhC0SSS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 14:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhC0SRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Mar 2021 14:17:48 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D009C0613B2
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 11:17:47 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id b18so6258123qte.21
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=0aF78rGwXOP+0qsBfPCBrYK7C0Zi48a5Zjvtrsgqd/E=;
        b=HWqXTDvZxWmw+chb0K1fCpFvSbZG1BZhbkTtLAq8sQsQNHg9QAWZ+RAGch8DiE6O4u
         hgHml1pEpt/M29dCL4iahxwB2lOYMMCVNz0uQxtwbDVGLmdxqm7LUj+B+dtZOS8yNI4a
         oZjZj2yetgwaT0g6HYmzyr/p1MnCp7bzAtTvBydbaVelotbfCjqV0IR85GyZYdj8VNmv
         tNIobRu1E2PjLrEFpcLIYha15ThKLRh5uiZki9sBp5Q97YKpLxUv5iWWpO4f+H9uM22h
         nJH2N0uzAKq8hL1g46hIszFoA9VOHcc12CbpkFpYbX3DlCocUucwyfYgWCa91BmFmE88
         RAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=0aF78rGwXOP+0qsBfPCBrYK7C0Zi48a5Zjvtrsgqd/E=;
        b=GnPvMr9pSA9+HezzXbuyMREdSgrxFQmZvO3JjEwZKtwlox362Ii8xY+jmahQjRYNSz
         vJXyy3u2anAVrYcIZaoXv1N+BN9+x2UQ2T6e6RUoyrYWpjTZuZQlazSfvAHGQ6TM+98g
         y+vE+75SOYkd2fH96iyol6omYHVCoaJJorJsE0m1pmkD+1GAjwkxn3y5NYRhn+ZFN/O7
         jBdGC8faNzixEH2b+Qe0s4u1MZFnqzlsFacVaJQjuLnmhHsDrAzG9d+8/e6TMdCqF4fQ
         PzMIhSHXkepbZHbT9KUQvoixBsScWF0QT3LtivzWHhnFa6ez9QLC7CFcwk43HjwoPzMc
         7kfg==
X-Gm-Message-State: AOAM533FPz206S1DR1U0gyZDiH+DeHcc2ZTaWoPy5TYFv6efXo/mXcmx
        lOTzIVmYB4IhGzr/Bx1+TaLGNfeX8Uc=
X-Google-Smtp-Source: ABdhPJwWtwN88511olTVu3IDijNKlX9WNDWWInfrTuu/L+peEEOZF65zti5C9rM+VyRCCUMSrOMDag+w+9A=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:493c:e5b:69c:54cb])
 (user=raychi job=sendgmr) by 2002:ad4:44a9:: with SMTP id n9mr18833426qvt.60.1616869066282;
 Sat, 27 Mar 2021 11:17:46 -0700 (PDT)
Date:   Sun, 28 Mar 2021 02:17:42 +0800
Message-Id: <20210327181742.1810969-1-raychi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [Patch v4] usb: dwc3: add cancelled reasons for dwc3 requests
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        Thinh.Nguyen@synopsys.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        albertccwang@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, when dwc3 handles request cancelled, dwc3 just returns
-ECONNRESET for all requests. It will cause USB function drivers
can't know if the requests are cancelled by other reasons.

This patch will replace DWC3_REQUEST_STATUS_CANCELLED with the
reasons below.
  - DWC3_REQUEST_STATUS_DISCONNECTED
  - DWC3_REQUEST_STATUS_DEQUEUED
  - DWC3_REQUEST_STATUS_STALLED

Signed-off-by: Ray Chi <raychi@google.com>
---
Changelog since v3:
- add error log and pass -ECONNRESET in default case

Changelog since v2:
- modify the changelog 
- remove theree definitions
- replace DWC3_REQUEST_STATUS_CANCELLED with new cancelled reason
- In dwc3_gadget_ep_cleanup_cancelled_requests(), 
  add a switch case to give different error code base on the reason

Changelog since v1:
- Added new parameter to dwc3_gadget_move_cancelled_request()
- Added three definitions for cancelled reasons
- Passed the reason to req->request.status

 drivers/usb/dwc3/core.h   | 12 +++++++-----
 drivers/usb/dwc3/gadget.c | 24 ++++++++++++++++++++----
 drivers/usb/dwc3/gadget.h |  6 ++++--
 3 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 4ca4b4be85e4..51a3eec2428a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -908,11 +908,13 @@ struct dwc3_request {
 	unsigned int		remaining;
 
 	unsigned int		status;
-#define DWC3_REQUEST_STATUS_QUEUED	0
-#define DWC3_REQUEST_STATUS_STARTED	1
-#define DWC3_REQUEST_STATUS_CANCELLED	2
-#define DWC3_REQUEST_STATUS_COMPLETED	3
-#define DWC3_REQUEST_STATUS_UNKNOWN	-1
+#define DWC3_REQUEST_STATUS_QUEUED		0
+#define DWC3_REQUEST_STATUS_STARTED		1
+#define DWC3_REQUEST_STATUS_DISCONNECTED	2
+#define DWC3_REQUEST_STATUS_DEQUEUED		3
+#define DWC3_REQUEST_STATUS_STALLED		4
+#define DWC3_REQUEST_STATUS_COMPLETED		5
+#define DWC3_REQUEST_STATUS_UNKNOWN		-1
 
 	u8			epnum;
 	struct dwc3_trb		*trb;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e1442fc763e1..492086519539 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1402,7 +1402,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 		dwc3_stop_active_transfer(dep, true, true);
 
 		list_for_each_entry_safe(req, tmp, &dep->started_list, list)
-			dwc3_gadget_move_cancelled_request(req);
+			dwc3_gadget_move_cancelled_request(req, DWC3_REQUEST_STATUS_DEQUEUED);
 
 		/* If ep isn't started, then there's no end transfer pending */
 		if (!(dep->flags & DWC3_EP_END_TRANSFER_PENDING))
@@ -1729,10 +1729,25 @@ static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep)
 {
 	struct dwc3_request		*req;
 	struct dwc3_request		*tmp;
+	struct dwc3			*dwc = dep->dwc;
 
 	list_for_each_entry_safe(req, tmp, &dep->cancelled_list, list) {
 		dwc3_gadget_ep_skip_trbs(dep, req);
-		dwc3_gadget_giveback(dep, req, -ECONNRESET);
+		switch (req->status) {
+		case DWC3_REQUEST_STATUS_DISCONNECTED:
+			dwc3_gadget_giveback(dep, req, -ESHUTDOWN);
+			break;
+		case DWC3_REQUEST_STATUS_DEQUEUED:
+			dwc3_gadget_giveback(dep, req, -ECONNRESET);
+			break;
+		case DWC3_REQUEST_STATUS_STALLED:
+			dwc3_gadget_giveback(dep, req, -EPIPE);
+			break;
+		default:
+			dev_err(dwc->dev, "request cancelled with wrong reason:%d\n", req->status);
+			dwc3_gadget_giveback(dep, req, -ECONNRESET);
+			break;
+		}
 	}
 }
 
@@ -1776,7 +1791,8 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 			 * cancelled.
 			 */
 			list_for_each_entry_safe(r, t, &dep->started_list, list)
-				dwc3_gadget_move_cancelled_request(r);
+				dwc3_gadget_move_cancelled_request(r,
+						DWC3_REQUEST_STATUS_DEQUEUED);
 
 			dep->flags &= ~DWC3_EP_WAIT_TRANSFER_COMPLETE;
 
@@ -1848,7 +1864,7 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int protocol)
 		dwc3_stop_active_transfer(dep, true, true);
 
 		list_for_each_entry_safe(req, tmp, &dep->started_list, list)
-			dwc3_gadget_move_cancelled_request(req);
+			dwc3_gadget_move_cancelled_request(req, DWC3_REQUEST_STATUS_STALLED);
 
 		if (dep->flags & DWC3_EP_END_TRANSFER_PENDING) {
 			dep->flags |= DWC3_EP_PENDING_CLEAR_STALL;
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 0cd281949970..77df4b6d6c13 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -90,15 +90,17 @@ static inline void dwc3_gadget_move_started_request(struct dwc3_request *req)
 /**
  * dwc3_gadget_move_cancelled_request - move @req to the cancelled_list
  * @req: the request to be moved
+ * @reason: cancelled reason for the dwc3 request
  *
  * Caller should take care of locking. This function will move @req from its
  * current list to the endpoint's cancelled_list.
  */
-static inline void dwc3_gadget_move_cancelled_request(struct dwc3_request *req)
+static inline void dwc3_gadget_move_cancelled_request(struct dwc3_request *req,
+		unsigned int reason)
 {
 	struct dwc3_ep		*dep = req->dep;
 
-	req->status = DWC3_REQUEST_STATUS_CANCELLED;
+	req->status = reason;
 	list_move_tail(&req->list, &dep->cancelled_list);
 }
 
-- 
2.31.0.291.g576ba9dcdaf-goog

