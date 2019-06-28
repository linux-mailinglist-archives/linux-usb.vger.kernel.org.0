Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43F755A379
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 20:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfF1SYa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 14:24:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35202 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbfF1SYa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 14:24:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id d126so3399700pfd.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dZYduMfUWZ9SXxQiDlz5Ott25WscyPClGVJovh/j864=;
        b=dcz6yeTS+k9GW7rabIn/2jY7ktaZSb0v0RMSqU/Vl5fRVl6SddKmc9Gs/PSNl3Ag3P
         GsdxcSY97gFY4U8+ipD0Hrdy9dIx3IZw5IeVPPujWUdv+A8BAKm+QGpxPJ4e4fGx/dSE
         R07ouFUy2VcVkbM7pkQ3U3zjXglParYEw9SXblesMALpid29Wq+XlhgJqkJ4gxvziwuO
         BkZs33KdHh8dj00S4qmdFqSpxX/cYWvdL5nHutJwLSBNr73FCjPZDXyLlFcNweKy9Ko1
         f+1WQIIVCJuDZrQ6SzkKhvWqOPt//OvyHOH4zzF6QU+yh0rJVQvLznywfHoDy+emC4Vo
         RsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dZYduMfUWZ9SXxQiDlz5Ott25WscyPClGVJovh/j864=;
        b=lKvan9MZuCsuB1/026JwgajMYxL7mUX8AIJ/YqHsp32jhfAJe/+JapTRMUl0DbpEog
         uSWQHXs4aYY69cKWLMWOWcmXey8UgQHKdFaH3Si3GrY3pZ983ny2aOWnxW+R99uUnr1/
         Z0h38Gytig97Y16wZdzaygxhEjfek9FNdPEH4qrf7IAMzIqBn+mdYhFPpbiyJei0G39q
         IpxtsW7EQiBFbxHqQQOJF4lMr6KkZzNJiwtNmXKdQSQMoSVqZaLq2yzBjUUjB/1gQXxe
         moqf4RofVZIjNhSF5+NBQvMO7weW1NNQDEMVpsKhGhF+36m0Shy1En/pjpztKJZ3mwhY
         spsQ==
X-Gm-Message-State: APjAAAVHK4j+VYKXRmDT6m5s7firOJ0ysHFdlDEfwYp30FPNh7EveEfI
        G2DVcHss8TqtPikSJzJ5+FwgPg==
X-Google-Smtp-Source: APXvYqxwHT+rEAoznXp4RnOp+y/5ybIX1wyiM6yFmGmuvOOiuwojDxDrPEZMBAe5MJovxEHAv771qQ==
X-Received: by 2002:a63:d4c:: with SMTP id 12mr10869247pgn.30.1561746269237;
        Fri, 28 Jun 2019 11:24:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id s15sm2916223pfd.183.2019.06.28.11.24.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 11:24:28 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     stable@vger.kernel.org
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Fei Yang <fei.yang@intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 4.19.y v2 7/9] usb: dwc3: gadget: move requests to cancelled_list
Date:   Fri, 28 Jun 2019 18:24:11 +0000
Message-Id: <20190628182413.33225-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628182413.33225-1-john.stultz@linaro.org>
References: <20190628182413.33225-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <felipe.balbi@linux.intel.com>

commit d4f1afe5e896c18ae01099a85dab5e1a198bd2a8 upstream

Whenever we have a request in flight, we can move it to the cancelled
list and later simply iterate over that list and skip over any TRBs we
find.

Cc: Fei Yang <fei.yang@intel.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org # 4.19.y
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
(cherry picked from commit d4f1afe5e896c18ae01099a85dab5e1a198bd2a8)
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/gadget.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c2169bc626c8..8291fa1624e1 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1364,6 +1364,17 @@ static void dwc3_gadget_ep_skip_trbs(struct dwc3_ep *dep, struct dwc3_request *r
 	}
 }
 
+static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep)
+{
+	struct dwc3_request		*req;
+	struct dwc3_request		*tmp;
+
+	list_for_each_entry_safe(req, tmp, &dep->cancelled_list, list) {
+		dwc3_gadget_ep_skip_trbs(dep, req);
+		dwc3_gadget_giveback(dep, req, -ECONNRESET);
+	}
+}
+
 static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 		struct usb_request *request)
 {
@@ -1400,8 +1411,9 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 			if (!r->trb)
 				goto out0;
 
-			dwc3_gadget_ep_skip_trbs(dep, r);
-			goto out1;
+			dwc3_gadget_move_cancelled_request(req);
+			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
+			goto out0;
 		}
 		dev_err(dwc->dev, "request %pK was not queued to %s\n",
 				request, ep->name);
@@ -1409,7 +1421,6 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 		goto out0;
 	}
 
-out1:
 	dwc3_gadget_giveback(dep, req, -ECONNRESET);
 
 out0:
-- 
2.17.1

