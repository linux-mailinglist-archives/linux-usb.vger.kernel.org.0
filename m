Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A3B36D191
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 07:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbhD1FNV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 01:13:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55773 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235529AbhD1FNR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 01:13:17 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 27 Apr 2021 22:12:33 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Apr 2021 22:12:31 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 28 Apr 2021 10:42:03 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 26EF9399E; Wed, 28 Apr 2021 10:42:02 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v7 4/5] usb: dwc3: qcom: Configure wakeup interrupts during suspend
Date:   Wed, 28 Apr 2021 10:41:55 +0530
Message-Id: <1619586716-8687-5-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Configure interrupts based on hs_phy_mode to avoid triggering of
interrupts during system suspend and suspend the device successfully.

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 66183c6..82125bc 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -316,22 +316,36 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 
 static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
-	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 
-	dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+	dwc3_qcom_disable_wakeup_irq(qcom->hs_phy_irq);
 
-	dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+	} else {
+		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
+	}
 
 	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
-	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 
-	dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
 
-	dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
+	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
+	} else {
+		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
+		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
+	}
 
 	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

