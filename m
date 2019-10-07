Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECCDECEB36
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 19:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbfJGR4H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 13:56:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36770 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729266AbfJGR4E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 13:56:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so9147978pfr.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YKLbWLWjJ/GA5qz2gzrLI3oAv45tZggVEaoyYmAEWtc=;
        b=UYzDC4h0moF6TQzBOgkcjKP7aKolNPTebeHscocKWyaubmFmhXEoRiaMdF5qy5ogAn
         mM09zumDqTlgW8ItdSALOkUZzEib3H67BIfdpf8Tcnhgtxgg588fAu1zMcQcOffL3GHj
         qKcJDmojl03dF9EWsgoSkdYCy5r5oCQx38zrCIcqPx4hFsKip6dNApLHQ5WDXIgZns5c
         4cE7lgRV9iUVqM0hBX91Ni7uZU3+5WG5d9/+wgk1oSY1yoP3Z1Y+ecl0V37tSKe19lrX
         iELOP5B+MFN2IHQFsm3QMYYUlkQy45Q0XNI+ibrrKGNRFGNiWNZSZcYQAK/4EVIfmach
         kjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YKLbWLWjJ/GA5qz2gzrLI3oAv45tZggVEaoyYmAEWtc=;
        b=SSgchGsgpmWR38h+hEpWkpdEbCdVr5f65lW9t09z9SLc8asbhjfmzMAog8PAlDHkgK
         /6YsAoES11RcRLhZuTdJ4RSrnaXbiLiav6Blsqon4XkSDK28xCXYQOrZ4Waw6IhoELp7
         PttIdgV8SZIuZiyvCqoU3iX14Hw4IKGL5bvGddFzxRQb5ImX9OCKn7vPmZ4xQA5KhSOR
         +7mE6xPdqjWb96e0DWBn48XZ0a7086/3RGNUDxBWwqGs9YjUft00vIUEINJUw0l+Gsbu
         EYyGah5X0tLhPWdjtrKzireBK02JTIPIS9t8dMjVWf+v9tSxbVKwxs6I635/YSn+mBPc
         PvzQ==
X-Gm-Message-State: APjAAAVlR0eVVtsJXB8uWjgwhYTgMDZ+gxv9ODT/6fxk0HveeFHxiNcq
        juqWsNpv5llgndomub2w16DK6w==
X-Google-Smtp-Source: APXvYqyP5ZSRlyeJVHXlGMo3HFliZL7HfRt+pmiWd6boT4KjdSiMtolf+T6RLS6pFrH4tgGXlUcUKw==
X-Received: by 2002:a62:7597:: with SMTP id q145mr33121812pfc.181.1570470963551;
        Mon, 07 Oct 2019 10:56:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k15sm3820096pgt.25.2019.10.07.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 10:56:02 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH v2 2/5] usb: dwc3: Execute GCTL Core Soft Reset while switch mdoe for Hisilicon Kirin Soc
Date:   Mon,  7 Oct 2019 17:55:50 +0000
Message-Id: <20191007175553.66940-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007175553.66940-1-john.stultz@linaro.org>
References: <20191007175553.66940-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

A GCTL soft reset should be executed when switch mode for dwc3 core
of Hisilicon Kirin Soc.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/core.c | 20 ++++++++++++++++++++
 drivers/usb/dwc3/core.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 999ce5e84d3c..440261432421 100644
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
@@ -156,6 +169,10 @@ static void __dwc3_set_mode(struct work_struct *work)
 
 	dwc3_set_prtcap(dwc, dwc->desired_dr_role);
 
+	/* Execute a GCTL Core Soft Reset when switch mode */
+	if (dwc->gctl_reset_quirk)
+		dwc3_gctl_core_soft_reset(dwc);
+
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	switch (dwc->desired_dr_role) {
@@ -1316,6 +1333,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
 
+	dwc->gctl_reset_quirk = device_property_read_bool(dev,
+				"snps,gctl-reset-quirk");
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8b349379af..b3cb6eec3f8f 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1029,6 +1029,7 @@ struct dwc3_scratchpad_array {
  * 	2	- No de-emphasis
  * 	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
+ * @gctl_reset_quirk: set to do a gctl soft-reset while switch operation mode.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *                 increments or 0 to disable.
  */
@@ -1219,6 +1220,8 @@ struct dwc3 {
 
 	unsigned		dis_metastability_quirk:1;
 
+	unsigned		gctl_reset_quirk:1;
+
 	u16			imod_interval;
 };
 
-- 
2.17.1

