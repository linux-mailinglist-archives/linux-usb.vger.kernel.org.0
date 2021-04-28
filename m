Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274F236D467
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 11:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhD1JCq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 05:02:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49606 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhD1JCq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 05:02:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619600521; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6wTHCnf1gNV3ywdGJSYeu/meR4wJo+W/s7SHNlfCFco=; b=dWN9IawTEhlalih9G+CaUo+SbGBS9sIbnQbw5L+bPp0nDrsdj3MwrotEkur2ZgUSfvqYEpG9
 dDDZ3D01++YhECf3GHJXOFiLPhAwOVGU8Q13ZOFsK9GfJY3iyeXiGiHe12D+LXeS/WVIgeld
 mCBU71TYS6OCz/6udqHJ3s35aGM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6089246c2cbba889804949cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 09:01:32
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC0B3C433D3; Wed, 28 Apr 2021 09:01:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1CCA2C4338A;
        Wed, 28 Apr 2021 09:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1CCA2C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH 2/2] usb: dwc3: gadget: Rename EOPF event macros to Suspend
Date:   Wed, 28 Apr 2021 02:01:11 -0700
Message-Id: <20210428090111.3370-2-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210428090111.3370-1-jackp@codeaurora.org>
References: <20210428090111.3370-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device event corresponding to End of Periodic Frame is only
found on older IP revisions (2.10a and prior, according to a
cursory SNPS databook search).  On revisions 2.30a and newer,
including DWC3.1, the same event value and corresponding DEVTEN
bit were repurposed to indicate that the link has gone into
suspend state (U3 or L2/L1).

EOPF events had never been enabled before in this driver, and
going forward we expect current and future DWC3-based devices
won't likely to be using such old DWC3 IP revisions either.
Hence rather than keeping the deprecated EOPF macro names let's
rename them to indicate their usage for suspend events.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/dwc3/core.h   | 6 +++---
 drivers/usb/dwc3/debug.h  | 8 ++++----
 drivers/usb/dwc3/gadget.c | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index b1e875c58f20..6091f63151d4 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -57,7 +57,7 @@
 #define DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE	3
 #define DWC3_DEVICE_EVENT_WAKEUP		4
 #define DWC3_DEVICE_EVENT_HIBER_REQ		5
-#define DWC3_DEVICE_EVENT_EOPF			6
+#define DWC3_DEVICE_EVENT_SUSPEND		6
 #define DWC3_DEVICE_EVENT_SOF			7
 #define DWC3_DEVICE_EVENT_ERRATIC_ERROR		9
 #define DWC3_DEVICE_EVENT_CMD_CMPL		10
@@ -460,7 +460,7 @@
 #define DWC3_DEVTEN_CMDCMPLTEN		BIT(10)
 #define DWC3_DEVTEN_ERRTICERREN		BIT(9)
 #define DWC3_DEVTEN_SOFEN		BIT(7)
-#define DWC3_DEVTEN_EOPFEN		BIT(6)
+#define DWC3_DEVTEN_U3L2L1SUSPEN	BIT(6)
 #define DWC3_DEVTEN_HIBERNATIONREQEVTEN	BIT(5)
 #define DWC3_DEVTEN_WKUPEVTEN		BIT(4)
 #define DWC3_DEVTEN_ULSTCNGEN		BIT(3)
@@ -1374,7 +1374,7 @@ struct dwc3_event_depevt {
  *	3	- ULStChng
  *	4	- WkUpEvt
  *	5	- Reserved
- *	6	- EOPF
+ *	6	- Suspend (EOPF on revisions 2.10a and prior)
  *	7	- SOF
  *	8	- Reserved
  *	9	- ErrticErr
diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index db231de46bb3..d0ac89c5b317 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -221,8 +221,8 @@ static inline const char *dwc3_gadget_event_string(char *str, size_t size,
 		snprintf(str, size, "WakeUp [%s]",
 				dwc3_gadget_link_string(state));
 		break;
-	case DWC3_DEVICE_EVENT_EOPF:
-		snprintf(str, size, "End-Of-Frame [%s]",
+	case DWC3_DEVICE_EVENT_SUSPEND:
+		snprintf(str, size, "Suspend [%s]",
 				dwc3_gadget_link_string(state));
 		break;
 	case DWC3_DEVICE_EVENT_SOF:
@@ -353,8 +353,8 @@ static inline const char *dwc3_gadget_event_type_string(u8 event)
 		return "Wake-Up";
 	case DWC3_DEVICE_EVENT_HIBER_REQ:
 		return "Hibernation";
-	case DWC3_DEVICE_EVENT_EOPF:
-		return "End of Periodic Frame";
+	case DWC3_DEVICE_EVENT_SUSPEND:
+		return "Suspend";
 	case DWC3_DEVICE_EVENT_SOF:
 		return "Start of Frame";
 	case DWC3_DEVICE_EVENT_ERRATIC_ERROR:
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index cab3a9184068..6eab78f8a1a7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2325,7 +2325,7 @@ static void dwc3_gadget_enable_irq(struct dwc3 *dwc)
 
 	/* On 2.30a and above this bit enables U3/L2-L1 Suspend Events */
 	if (!DWC3_VER_IS_PRIOR(DWC3, 230A))
-		reg |= DWC3_DEVTEN_EOPFEN;
+		reg |= DWC3_DEVTEN_U3L2L1SUSPEN;
 
 	dwc3_writel(dwc->regs, DWC3_DEVTEN, reg);
 }
@@ -3744,7 +3744,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 	case DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE:
 		dwc3_gadget_linksts_change_interrupt(dwc, event->event_info);
 		break;
-	case DWC3_DEVICE_EVENT_EOPF:
+	case DWC3_DEVICE_EVENT_SUSPEND:
 		/* It changed to be suspend event for version 2.30a and above */
 		if (!DWC3_VER_IS_PRIOR(DWC3, 230A)) {
 			/*
-- 
2.24.0

