Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8316834ACCF
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 17:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhCZQsa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 12:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCZQr7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Mar 2021 12:47:59 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969CFC0613AA
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 09:47:59 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b127so10583491ybc.13
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=j6eB8vl4RSOcQ+zI8HjkusAUwu6pZU1a/E6jKpNA5uA=;
        b=W/hyC0297iUC/DKT5BVTEYe1ohKG35vGOnqsq4JFZOk1Ue3K+aHQE6pSyxKgDOEgvn
         /GvDikUsshchYN3LMi6LrsB9azfah9qcwKAN4X7O3UBAzxwFGiMUSzaD144urL1bR4hY
         VTD19usxqRsHMzwqshhyzfLZI21+3u3tTnewv9yLj7Uuxfg4Eb5zQ5K5rEPRmwiMhFLD
         WsUYDzkyQyMCgK1o8X+lnoWc9jMXwrRyJmNcewdB44x+NhqxPpUZ5EHnyB2MnyqVx5eU
         LRnfL2/Ka4Fb7uY0dpFxmp/h9sIa3mTyMxCkUbI4V63/+ZDEemU990pBVVEXvON9NUik
         tdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=j6eB8vl4RSOcQ+zI8HjkusAUwu6pZU1a/E6jKpNA5uA=;
        b=Z3yJf5NVqqO9p2/M/7deXCnFwglpxRwRnrJF9i7ttmA3TDDHoU4rRiX9nPB3yTG4yz
         J/R4IAKNN1vqXJDDE98Dq9XxQ/qdffUX3rwi6V9MpedaSp7m3NEz6xqMTTNxqhmozJB7
         T0MhFwR0icLUQW2+w4ZQD9rpmMRTVDe5Z9jeMNPHQceODFaxlniHhG2wtfD9Ex0LquVg
         i/VP4vgLiRS3kUdlaG8sJY0KsrqxXyzNoArd4LrDx80Ky/VMOg5AcbaSLhufYo59LgnD
         xkBKNQme19n0hmWEgDHDKpjSr7dgKw2Ckf737X6g30ZMd/YT3KeI9PIpEYSSMY7/VBjy
         EurA==
X-Gm-Message-State: AOAM532czGOgfZrPWBXB32gBc91MzFsX15ChBH4A+26H/QLRu2NaQV5B
        k3J6zTioLMCCCTWPhRq5w0zffaUcXFA=
X-Google-Smtp-Source: ABdhPJxqOiqe7lmeNQxQVlrMqOF//4hv5J4Pm/Hr3pCfiEaZZSM4rrTI7xI46MQ60Ph30yxkr+SaO7DNw/Y=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:dd96:b17f:940b:5260])
 (user=raychi job=sendgmr) by 2002:a5b:44e:: with SMTP id s14mr17725353ybp.11.1616777278783;
 Fri, 26 Mar 2021 09:47:58 -0700 (PDT)
Date:   Sat, 27 Mar 2021 00:47:53 +0800
Message-Id: <20210326164753.1537417-1-raychi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [Patch v2] usb: dwc3: add cancelled reasons for dwc3 requests
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
 drivers/usb/dwc3/core.h   | 12 +++++++-----
 drivers/usb/dwc3/gadget.c | 21 +++++++++++++++++----
 drivers/usb/dwc3/gadget.h |  6 ++++--
 3 files changed, 28 insertions(+), 11 deletions(-)

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
index e1442fc763e1..b11fd02604bb 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1402,7 +1402,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
 		dwc3_stop_active_transfer(dep, true, true);
 
 		list_for_each_entry_safe(req, tmp, &dep->started_list, list)
-			dwc3_gadget_move_cancelled_request(req);
+			dwc3_gadget_move_cancelled_request(req, DWC3_REQUEST_STATUS_DEQUEUED);
 
 		/* If ep isn't started, then there's no end transfer pending */
 		if (!(dep->flags & DWC3_EP_END_TRANSFER_PENDING))
@@ -1732,7 +1732,19 @@ static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep)
 
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
+			break;
+		}
 	}
 }
 
@@ -1776,7 +1788,8 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 			 * cancelled.
 			 */
 			list_for_each_entry_safe(r, t, &dep->started_list, list)
-				dwc3_gadget_move_cancelled_request(r);
+				dwc3_gadget_move_cancelled_request(r,
+						DWC3_REQUEST_STATUS_DEQUEUED);
 
 			dep->flags &= ~DWC3_EP_WAIT_TRANSFER_COMPLETE;
 
@@ -1848,7 +1861,7 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int protocol)
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

