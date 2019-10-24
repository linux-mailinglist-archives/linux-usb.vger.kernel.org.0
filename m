Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2922BE27FF
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 04:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436740AbfJXCPp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 22:15:45 -0400
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:58622 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436605AbfJXCPp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 22:15:45 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A9543C0239;
        Thu, 24 Oct 2019 02:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571883344; bh=N6N+xiy43WEoIJ73vc6RQdArovxlIQFDlOKfTocuX8Q=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Q/buGT4KrEDGvcy2AsZMdJ4pqhIyTg+Vf+SbHJIe8n5RE/7+NGqN3Kd4yk7XUSt6B
         40wJ/CT7snCvpdLAuVNCe5fP7/JhfEUvH5Hb9kKZhQd6U0gx40xWJjOIXoE0Ercpq7
         AJvUpn0DP7K3piyAq5z7ufSecer6vqdTzGZiUioUp+5oJFqu5X1Bb2/EaA14r7LNW7
         fPNzM52BZieCWvzfRA7XgGWGq5kX+1q1S/r9TZP1f3k6gCQg1+SQ7VAv+kcagJTrjH
         evl7DmQ2klm1It+mz2I+YrArK+vGRM8Fq8pvS3LMzh3EEfzlY4jYhk5zRMNr07W2ML
         3s0hEWeRk/puA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 744A3A005A;
        Thu, 24 Oct 2019 02:15:43 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 23 Oct 2019 19:15:43 -0700
Date:   Wed, 23 Oct 2019 19:15:43 -0700
Message-Id: <3abc68f12aa32abf41b61a668f1e5b136d2acfc4.1571882179.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571882179.git.thinhn@synopsys.com>
References: <cover.1571882179.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 1/4] usb: dwc3: gadget: Don't send unintended link state change
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DCTL.ULSTCHNGREQ is a write-only field. When doing a read-modify-write
to DCTL, the driver must make sure that there's no unintended link state
change request from whatever is read from DCTL.ULSTCHNGREQ. Set link
state change to no-action when the driver writes to DCTL.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---

Changes in v2:
 - Create inline function to do safe write to DCTL

 drivers/usb/dwc3/gadget.c | 16 +++++++---------
 drivers/usb/dwc3/gadget.h | 14 ++++++++++++++
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 86dc1db788a9..85adc718808a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -57,7 +57,7 @@ int dwc3_gadget_set_test_mode(struct dwc3 *dwc, int mode)
 		return -EINVAL;
 	}
 
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	return 0;
 }
@@ -1822,7 +1822,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 		dwc->pullups_connected = false;
 	}
 
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	do {
 		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
@@ -2745,10 +2745,8 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_INITU1ENA;
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
-
 	reg &= ~DWC3_DCTL_INITU2ENA;
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_gadget_dctl_write_safe(dwc, reg);
 
 	dwc3_disconnect_gadget(dwc);
 
@@ -2800,7 +2798,7 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	reg &= ~DWC3_DCTL_TSTCTRL_MASK;
-	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+	dwc3_gadget_dctl_write_safe(dwc, reg);
 	dwc->test_mode = false;
 	dwc3_clear_stall_all_ep(dwc);
 
@@ -2904,11 +2902,11 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		if (dwc->has_lpm_erratum && dwc->revision >= DWC3_REVISION_240A)
 			reg |= DWC3_DCTL_NYET_THRES(dwc->lpm_nyet_threshold);
 
-		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+		dwc3_gadget_dctl_write_safe(dwc, reg);
 	} else {
 		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 		reg &= ~DWC3_DCTL_HIRD_THRES_MASK;
-		dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+		dwc3_gadget_dctl_write_safe(dwc, reg);
 	}
 
 	dep = dwc->eps[0];
@@ -3017,7 +3015,7 @@ static void dwc3_gadget_linksts_change_interrupt(struct dwc3 *dwc,
 
 				reg &= ~u1u2;
 
-				dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+				dwc3_gadget_dctl_write_safe(dwc, reg);
 				break;
 			default:
 				/* do nothing */
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 5faf4d1249e0..fbc7d8013f0b 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -127,4 +127,18 @@ static inline void dwc3_gadget_ep_get_transfer_index(struct dwc3_ep *dep)
 	dep->resource_index = DWC3_DEPCMD_GET_RSC_IDX(res_id);
 }
 
+/**
+ * dwc3_gadget_dctl_write_safe - write to DCTL safe from link state change
+ * @dwc: pointer to our context structure
+ * @value: value to write to DCTL
+ *
+ * Use this function when doing read-modify-write to DCTL. It will not
+ * send link state change request.
+ */
+static inline void dwc3_gadget_dctl_write_safe(struct dwc3 *dwc, u32 value)
+{
+	value &= ~DWC3_DCTL_ULSTCHNGREQ_MASK;
+	dwc3_writel(dwc->regs, DWC3_DCTL, value);
+}
+
 #endif /* __DRIVERS_USB_DWC3_GADGET_H */
-- 
2.11.0

