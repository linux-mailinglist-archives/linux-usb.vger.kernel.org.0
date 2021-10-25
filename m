Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E794399AB
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 17:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbhJYPJe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 11:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbhJYPJc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 11:09:32 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB77C061745
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:07:10 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id e12so13422826wra.4
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=A0XxRKArRsXAGrhT5RwT3QiQmXTtl2leaqHBeuijG3mMuXEIbL7LCyDFw/GFfsqF+Y
         C6xViHf1QzDPaR1S3VEF4LgIEvX/KIl9yE+knP8BL2jZEWsYAAwF3nrA/oWCFDIhsKjq
         wfEVCzmyaKUiLiR9D0py3aq2olClyUkKbjQqRmuV2Dji/wWgYsqgPRwxC7gv8bACA1oX
         NlPi/Z6TN8YZSm6wbL8cwukPrapLrUWaGcAtvB2yKV6Pz0PieHHlINRmVh9k8eKzcCe4
         KXW4unkz06l4ZqDpZ1G3HBZUGa6ycLMpadASNHyLMvoCzhtT0R44KzYwQhb2rIcBKiLT
         pkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=7IgDxFE+JkmdVPRVP5vYQvCMqBoZDq3HJXy9DsnywMhjaCsbPfc38vbYzb86uqLIJ8
         Ru1iO3KiIjY47A+KcrKycZq6wEJAi+vGQaxvSFHLXWyojF9s2RIspUtqxBDt/wVAN0c0
         wrHyooZFu+SJEXd2k2kQOIo57YdLWUK6zLtqtEK9uxLpRNHfHfOGkmi/f/A93VSGho7S
         CP6cjYsSJ0gOiKM8ca0Y2Q1szrjTfGSgDo0DMHYBfQ4BPp7Ua2BKXh0vpD//KF9QD2Y0
         53vJy0d1Vcf5ljHP3hlQ+LpVnWOjobwSdGIDDmplmOtLzcW+49F1KL3H+T9e2H7tgeE2
         hDqg==
X-Gm-Message-State: AOAM533RG6ju0mJTR/u9Biy2ob4hFeknyfp89Y1WpOiwlhwaSQm4IgtY
        haMhG6oCR2a3iXT8Fsk8J9lW+w==
X-Google-Smtp-Source: ABdhPJw++sjAyDGkZSzgBxbCLFd5I+37Y30KZ17qxe54f8se62jNi86n9g0x0+YbeMCHqzy8Quh4tA==
X-Received: by 2002:adf:fd47:: with SMTP id h7mr20994717wrs.200.1635174429092;
        Mon, 25 Oct 2021 08:07:09 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f20sm19173554wmq.38.2021.10.25.08.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:07:08 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 3/6] dt-bindings: usb: Add qcom,pmic-usb-pdphy dt-binding header
Date:   Mon, 25 Oct 2021 16:09:03 +0100
Message-Id: <20211025150906.176686-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adds a series of defines which are used in the DTS and pdphy driver for
identifying interrupts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../usb/typec/tcpm/qcom,pmic-usb-pdphy.h       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h

diff --git a/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h
new file mode 100644
index 0000000000000..0bb1ce677fe5c
--- /dev/null
+++ b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, Linaro Ltd. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_TCPM_QCOM_PMIC_USB_PDPHY_H
+#define _DT_BINDINGS_TCPM_QCOM_PMIC_USB_PDPHY_H
+
+#define PMIC_PDPHY_SIG_TX_IRQ		0x0
+#define PMIC_PDPHY_SIG_RX_IRQ		0x1
+#define PMIC_PDPHY_MSG_TX_IRQ		0x2
+#define PMIC_PDPHY_MSG_RX_IRQ		0x3
+#define PMIC_PDPHY_MSG_TX_FAIL_IRQ	0x4
+#define PMIC_PDPHY_MSG_TX_DISCARD_IRQ	0x5
+#define PMIC_PDPHY_MSG_RX_DISCARD_IRQ	0x6
+#define PMIC_PDPHY_FR_SWAP_IRQ		0x7
+
+#endif
-- 
2.33.0

