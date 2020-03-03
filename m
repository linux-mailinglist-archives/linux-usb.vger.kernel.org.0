Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7130E177CFA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 18:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbgCCRMF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 12:12:05 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35235 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbgCCRMF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 12:12:05 -0500
Received: by mail-wm1-f67.google.com with SMTP id m3so3672661wmi.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2020 09:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NvkN5ieo3+2FwVw2nYNNBnNyWIU2wiUN/Xkbb42M4Aw=;
        b=bkYTyEM66MSZwFzvV+rUB0b7ffV0RJ8pVTz8/ULZ7ALdrwc4wknFHXf4Mc4VrVLF5W
         EhRDJGtlmgcvKplPcWdEUe7/7qbad4oSowGLtvo7cI1jQ+atmre6oJVu8+scmRujbwkx
         +AXB0+RMCO8RwT49voIZkK3ZNJs+b/hfam1TnWdvf13DMd0YfL1HMO5ZeuLL5D0vdU0E
         UjbfGacXSdBh16V6dSRjOaW7ELVyRafDVJsxSNMDwf6CPh25N1EYMT/BCCuppNOORpsG
         eUeaPOefvZwSk4dI2vzlZlctUV1MZ9wrDxjkubVX/zZUoFVFQBPyIAKu+wwfpRyF33Gy
         cTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NvkN5ieo3+2FwVw2nYNNBnNyWIU2wiUN/Xkbb42M4Aw=;
        b=cG5eajmRf7clb/QLudJCEDzAvet+BGDy4dii1mrKrMRMkgcJdJoHbwtVvb62GxUiDH
         5nw2FZVHYb2Uj7OvcqNYilCThcdYLvuBbyAaC7iu9vIysZ18uK0vUB8bAjb0+rwIsI+a
         rEwTI3DYZqtbhns482FOxG8iCdjgNGStAONlXrrfkFV88UgGcQYIqfBgmYaEZ8o+rhGX
         GPhKfZzYcRs4jzIlEAixfXxybgNG9cZAaLqHypTdEersmnuTBZqenamC3o/7HaYjit9J
         prWpcg1U6SHdcNG9Y0gFKgqgdvD4gCdktbKCEqkC5myMPQJDGB4uoFiv38Y4csKtBs0n
         4eAQ==
X-Gm-Message-State: ANhLgQ08n9rlEcUHdEu4Ze8EgfL68gufflj+xxKVT82IBT/C/vXLG6nG
        Ney/2oTcr2Oqa9ceII8nY476KQ==
X-Google-Smtp-Source: ADFU+vuO22XCb0pQ9DLER2YigBpY5HQHyJrxsV/u2ejVjTJU8HyJHVZ50MZUAN7jkyR/jmg+416KYQ==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr5062707wmi.128.1583255523220;
        Tue, 03 Mar 2020 09:12:03 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 09/18] usb: dwc3: qcom: Add support for usb-conn-gpio connectors
Date:   Tue,  3 Mar 2020 17:11:50 +0000
Message-Id: <20200303171159.246992-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a routine to find a usb-conn-gpio in the main DWC3 code.
This will be useful in a subsequent patch where we will reuse the current
extcon VBUS notifier with usb-conn-gpio.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024cd06b..6f4b2b3cffce 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -550,6 +550,21 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
 	.ss_phy_irq_index = 2
 };
 
+static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)
+{
+	struct device_node	*np;
+	bool			retval = false;
+
+	np = of_get_child_by_name(pdev->dev.of_node, "connector");
+	if (np) {
+		if (of_device_is_compatible(np, "gpio-usb-b-connector"))
+			retval = true;
+	}
+	of_node_put(np);
+
+	return retval;
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
-- 
2.25.1

