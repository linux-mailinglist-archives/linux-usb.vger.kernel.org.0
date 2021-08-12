Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653523EA08B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Aug 2021 10:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbhHLI1S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Aug 2021 04:27:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49736 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233921AbhHLI1R (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Aug 2021 04:27:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628756812; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=7k/oDB0rNhUYP7m1bxHP/pw3xEKilTVympTxuOnZLmE=; b=d9zgLIL+Y5kgjluhsVThQAyZIgRWh1MgIEfbKAnvbdKl4w/mnm1fqgmCrYR9D8y+aDMiqhbk
 hnU0uNiC2rbTSell9aji4JnyE+b0ZJv7XvULXN8in5Um/cDPeDDvRJOcMsr7i/bKvOSzPtlp
 er0abLHs5AFeZL5Cw1Kh51MILp4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6114db4c76c3a9a172f7cd7e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 08:26:52
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AC0EC433F1; Thu, 12 Aug 2021 08:26:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0AA43C433D3;
        Thu, 12 Aug 2021 08:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0AA43C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Date:   Thu, 12 Aug 2021 01:26:35 -0700
Message-Id: <20210812082635.12924-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT
field (bit 31) which when enabled allows the controller in device
mode to treat USB 2.0 L1 LPM & L2 events separately.

After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
events") the controller will now receive events (and therefore
interrupts) for every state change when entering/exiting either
L1 or L2 states.  Since L1 is handled entirely by the hardware
and requires no software intervention, there is no need to even
enable these events and unnecessarily notify the gadget driver.
Enable the aforementioned bit to help reduce the overall interrupt
count for these L1 events that don't need to be handled while
retaining the events for full L2 suspend/wakeup.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/dwc3/core.c | 9 +++++++++
 drivers/usb/dwc3/core.h | 5 +++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ba74ad7f6995..719dac228703 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1050,6 +1050,15 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
 			reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
 
+		/*
+		 * Decouple USB 2.0 L1 & L2 events which will allow for
+		 * gadget driver to only receive U3/L2 suspend & wakeup
+		 * events and prevent the more frequent L1 LPM transitions
+		 * from interrupting the driver.
+		 */
+		if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
+			reg |= DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
+
 		if (dwc->dis_tx_ipgap_linecheck_quirk)
 			reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 5991766239ba..356b94a7ec70 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -256,9 +256,10 @@
 #define DWC3_GUCTL_HSTINAUTORETRY	BIT(14)
 
 /* Global User Control 1 Register */
-#define DWC3_GUCTL1_PARKMODE_DISABLE_SS	BIT(17)
+#define DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT	BIT(31)
 #define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS	BIT(28)
-#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW	BIT(24)
+#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW		BIT(24)
+#define DWC3_GUCTL1_PARKMODE_DISABLE_SS		BIT(17)
 
 /* Global Status Register */
 #define DWC3_GSTS_OTG_IP	BIT(10)
-- 
2.24.0

