Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63347E7BFC
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 23:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389904AbfJ1V71 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 17:59:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35056 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389644AbfJ1V70 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 17:59:26 -0400
Received: by mail-pg1-f194.google.com with SMTP id c8so7916073pgb.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 14:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+L6QotxBXClg8Fe4NEIvH2M7vhWfz5AENh5gfCd6GV4=;
        b=uaUmY97oSQxJQiygHKDaQ20ZTGg8dHh2CBe6oCjliV/RN29TrGpIx4ib9OqXas8o3L
         VGfHqIuml3QwWjby0s2prmA2YMmiKWQVFFb1lAwmvGl498yOYU5Uls0CSQZ34KDFix43
         G6JAmKHK8ywTaqFjTUQP00S7zXpDubMfH1Tir+VrVpTGeF7pp/x/zIimRziEyXRoQMht
         x7W2cxF8KEa5n6o6m8KFmj7LejeivOjoMf2XtSHXLftGcJYpn6KXhdcqvG0pZZJ4idlx
         kQxDcknr/f6WferMNpA/Vd7V+YIZo/bspA5ekOGZIugueMatX0phDtpfNMw5J5ckn8sF
         6leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+L6QotxBXClg8Fe4NEIvH2M7vhWfz5AENh5gfCd6GV4=;
        b=K5BgwjagSgl4FbunXr6VQ8W9qYuB+6sfiV0Ucf/Z93s2C/ePZn2HyWret1aSXQuJlp
         Y4fPIXi8Ky5JH0HIal5rCYUJ6Ok+vQYxAR3esv9wNgPuvAnIIo4UOQwC/RAqS/KrNlZ2
         Fzp6S9YBmvNGVZm6FeTewQS/eJoBD2KFKnkpuAWogbVGkBU5jjkZDTGT26DIJ7AVEXSH
         laM8/49n9FGC3re+DjRCSkC9FNo43WH5mJD0xYTCjodhFM8kSh+EtQlblBf3G8PldJ/v
         yULWCqkssVWxNhwbnXOmwaPpTxijaYh5LbLO6LD80wBgCmt7WC0uk6LEKb47mELAvrq3
         vMoA==
X-Gm-Message-State: APjAAAWkt4RempnQzRMJnsCiRWnRwWiUvTZGxUse/fxIHBjS77Fbgb00
        Va00WAudmm6+c2r9Bnvfi7IwdQ==
X-Google-Smtp-Source: APXvYqwoT7ayq2aO4CF8CK+7fEOHyKKj3eXU3Enm6OGIp8+0wievgg8RmOqjN0WXhlj2nCmqsIIU7g==
X-Received: by 2002:a63:f923:: with SMTP id h35mr23802494pgi.323.1572299965657;
        Mon, 28 Oct 2019 14:59:25 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id f12sm10880612pfn.152.2019.10.28.14.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:59:25 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH v4 2/9] usb: dwc3: Execute GCTL Core Soft Reset while switch modes
Date:   Mon, 28 Oct 2019 21:59:12 +0000
Message-Id: <20191028215919.83697-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028215919.83697-1-john.stultz@linaro.org>
References: <20191028215919.83697-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

On the HiKey960, we need to do a GCTL soft reset when
switching modes.

Jack Pham also noted that in the Synopsys databook it
mentions performing a GCTL CoreSoftReset when changing the
PrtCapDir between device & host modes.

So this patch always does a GCTL Core Soft Reset when
changing the mode.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Remove quirk conditional, as Jack Pham noted the
    Synopsis databook states this should be done generally.
    Also, at Jacks' suggestion, make the reset call before
    changing the prtcap direction.
---
 drivers/usb/dwc3/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 999ce5e84d3c..a039e35ec7ad 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -112,6 +112,19 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 	dwc->current_dr_role = mode;
 }
 
+static void dwc3_gctl_core_soft_reset(struct dwc3 *dwc)
+{
+	u32 reg;
+
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg |= DWC3_GCTL_CORESOFTRESET;
+	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	reg &= ~DWC3_GCTL_CORESOFTRESET;
+	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+}
+
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
@@ -154,6 +167,9 @@ static void __dwc3_set_mode(struct work_struct *work)
 
 	spin_lock_irqsave(&dwc->lock, flags);
 
+	/* Execute a GCTL Core Soft Reset when switch mode */
+	dwc3_gctl_core_soft_reset(dwc);
+
 	dwc3_set_prtcap(dwc, dwc->desired_dr_role);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
-- 
2.17.1

