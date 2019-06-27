Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE8158C03
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 22:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfF0Uwr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 16:52:47 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39549 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbfF0Uwr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 16:52:47 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so1810911pfe.6
        for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2019 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XDEati5AnmeIwG/gbfDq9Iz0JoFW4jKO9V1cvoJDwbs=;
        b=zj0cwyUJjc4490ScZRzBvv+fzHqbH+UoOGU6jOcMpp/NPafDKPGu0mfwwyGL4NSL8I
         aMuqyYlFFw9hV/Tss88XvbIqvsWoMbtRYuVkVP4a9rizV4aFKNqFOlvcBzfSxY3xN9ju
         ZTwyS0G/f1RnzSE9HsvPDQqJ1rJONC2miE/fcQbIfSkeLp8su0LErsR0MyIx0L1MT1AG
         c4yPv868SisEcCj0GjZXCdDrsh3uMv6BL5bkm+ysWAsuHWt0FGxkx83qr5i/E5AMhCsD
         DDE0VqI9oDz8T6cm6Anj3W+1CKy+btKOSUMnEPyRlkMBNO+Zk4cEU3Q5pNPWgCaRul+C
         FRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XDEati5AnmeIwG/gbfDq9Iz0JoFW4jKO9V1cvoJDwbs=;
        b=nDv3qdhT+LKxyin3TRcavG+MAGGAgX0p+AzcTHdEcHENhtKupVdadbVN9q8E8Mo/p8
         belg1U93isPzHNUVkCtGa6bFk7wfzG4p5VZJ8m5Qps/DF6yG7i3dLe+r1zD64e2E6IzT
         MdYa+2m47Al8VJdnNppHsR2z4SAgJItBAkrpNosgjk+wSgMpbfI9TWZcDw/1TEyE+20R
         ixhJf2sdJlYFiC7CWD+oXJiyhIUcYSr9u7g1S7yGwWJlYA1o07c+5Zcn/rrlHUh8X9IU
         VZ8XUvYdGUePO+tSd+Bk8gsMVkYidIl3Mzu47yrH6727C2KCg+I32lkIXI5jZFXtAdP6
         VFmg==
X-Gm-Message-State: APjAAAVpxYJFeeDwAZxT8wAsZrAJMm4aGskosjzGiHMUHeWztTAp6tI+
        ghO3vH+42rslHxyZDJEAqmoB8Q==
X-Google-Smtp-Source: APXvYqw2DIFNltOk0pMfuDdIDROXrYNXCaXcRvY6zoErZhyNm0BDHfPoUZrYtANNsXav9qIru1U82g==
X-Received: by 2002:a17:90a:2228:: with SMTP id c37mr8570819pje.9.1561668766064;
        Thu, 27 Jun 2019 13:52:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 2sm3674083pff.174.2019.06.27.13.52.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 13:52:45 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     stable@vger.kernel.org
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Fei Yang <fei.yang@intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 4.19.y 1/9] usb: dwc3: gadget: combine unaligned and zero flags
Date:   Thu, 27 Jun 2019 20:52:32 +0000
Message-Id: <20190627205240.38366-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627205240.38366-1-john.stultz@linaro.org>
References: <20190627205240.38366-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <felipe.balbi@linux.intel.com>

commit 1a22ec643580626f439c8583edafdcc73798f2fb upstream

Both flags are used for the same purpose in dwc3: appending an extra
TRB at the end to deal with controller requirements. By combining both
flags into one, we make it clear that the situation is the same and
that they should be treated equally.

Cc: Fei Yang <fei.yang@intel.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org # 4.19.y
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
(cherry picked from commit 1a22ec643580626f439c8583edafdcc73798f2fb)
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/core.h   |  7 +++----
 drivers/usb/dwc3/gadget.c | 18 +++++++++---------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 5bfb62533e0f..4872cba8699b 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -847,11 +847,11 @@ struct dwc3_hwparams {
  * @epnum: endpoint number to which this request refers
  * @trb: pointer to struct dwc3_trb
  * @trb_dma: DMA address of @trb
- * @unaligned: true for OUT endpoints with length not divisible by maxp
+ * @needs_extra_trb: true when request needs one extra TRB (either due to ZLP
+ *	or unaligned OUT)
  * @direction: IN or OUT direction flag
  * @mapped: true when request has been dma-mapped
  * @started: request is started
- * @zero: wants a ZLP
  */
 struct dwc3_request {
 	struct usb_request	request;
@@ -867,11 +867,10 @@ struct dwc3_request {
 	struct dwc3_trb		*trb;
 	dma_addr_t		trb_dma;
 
-	unsigned		unaligned:1;
+	unsigned		needs_extra_trb:1;
 	unsigned		direction:1;
 	unsigned		mapped:1;
 	unsigned		started:1;
-	unsigned		zero:1;
 };
 
 /*
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 65ba1038b111..4894fed1441c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1070,7 +1070,7 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 			struct dwc3	*dwc = dep->dwc;
 			struct dwc3_trb	*trb;
 
-			req->unaligned = true;
+			req->needs_extra_trb = true;
 
 			/* prepare normal TRB */
 			dwc3_prepare_one_trb(dep, req, true, i);
@@ -1114,7 +1114,7 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		struct dwc3	*dwc = dep->dwc;
 		struct dwc3_trb	*trb;
 
-		req->unaligned = true;
+		req->needs_extra_trb = true;
 
 		/* prepare normal TRB */
 		dwc3_prepare_one_trb(dep, req, true, 0);
@@ -1130,7 +1130,7 @@ static void dwc3_prepare_one_trb_linear(struct dwc3_ep *dep,
 		struct dwc3	*dwc = dep->dwc;
 		struct dwc3_trb	*trb;
 
-		req->zero = true;
+		req->needs_extra_trb = true;
 
 		/* prepare normal TRB */
 		dwc3_prepare_one_trb(dep, req, true, 0);
@@ -1412,7 +1412,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 					dwc3_ep_inc_deq(dep);
 				}
 
-				if (r->unaligned || r->zero) {
+				if (r->needs_extra_trb) {
 					trb = r->trb + r->num_pending_sgs + 1;
 					trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
 					dwc3_ep_inc_deq(dep);
@@ -1423,7 +1423,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 				trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
 				dwc3_ep_inc_deq(dep);
 
-				if (r->unaligned || r->zero) {
+				if (r->needs_extra_trb) {
 					trb = r->trb + 1;
 					trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
 					dwc3_ep_inc_deq(dep);
@@ -2252,7 +2252,8 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
 	 * with one TRB pending in the ring. We need to manually clear HWO bit
 	 * from that TRB.
 	 */
-	if ((req->zero || req->unaligned) && !(trb->ctrl & DWC3_TRB_CTRL_CHN)) {
+
+	if (req->needs_extra_trb && !(trb->ctrl & DWC3_TRB_CTRL_CHN)) {
 		trb->ctrl &= ~DWC3_TRB_CTRL_HWO;
 		return 1;
 	}
@@ -2329,11 +2330,10 @@ static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
 		ret = dwc3_gadget_ep_reclaim_trb_linear(dep, req, event,
 				status);
 
-	if (req->unaligned || req->zero) {
+	if (req->needs_extra_trb) {
 		ret = dwc3_gadget_ep_reclaim_trb_linear(dep, req, event,
 				status);
-		req->unaligned = false;
-		req->zero = false;
+		req->needs_extra_trb = false;
 	}
 
 	req->request.actual = req->request.length - req->remaining;
-- 
2.17.1

