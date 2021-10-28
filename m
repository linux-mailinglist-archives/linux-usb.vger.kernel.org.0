Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AF743E689
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 18:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhJ1QuP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Oct 2021 12:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhJ1QuO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Oct 2021 12:50:14 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACE9C061570
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 09:47:47 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v17so11285148wrv.9
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=fSEgbfCmAD7l1maFzzfo4ntux8Czn15LspIDvE89ZBeycOzGCJ5MBex42lORU2wYL3
         4np+8KErBWQVQwoIc4vJw/BU2wRrPGot3CeomaV9A8JsiFXJl33RVuH15HS4nJymZ8S1
         E3Gy7ZyE7McfDiZsgGBzzpF0z0Bv+Y/J+GNdJbDhXdUXdTdrFyiIhI/nkwf3479FA3Yx
         CVS9EATZAwb4NRVBwoM2i/MmfKGZjdQfGMrYCPYiGNcWeHtmtygdJKDeKBsvXpj+Rpsi
         s9KlxZt0Elm7iYX03JTiKIBJy1N/HgMA7RkXPaglM1AXqdeHIYE0hKqoVXEf46AkQU1P
         ptow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q128a9lhY0ksiYIyPMAMQms4ozwMnmwzN8Z/nJ9OKEQ=;
        b=5otG/E53/qpzLm75rn3UIGw7e1rEXvcqXJGfFsUyOsTBJ4e8YOb/YNojrHtokni3g0
         I4oI2U38TnaLm3h1hYPyLrMgStkIm1vSSen4wf3J2weFAC+qXkHFgU0Q8ylTmWgrIVQp
         1DxXzsUcGDRQWVb2XvHUtXeyTPsuALWUpeJuK7SXj94D/ZeolA+VD4+6puXpR/j/9x4U
         rpRXk6QnXPX3SEcaryq9jrgq51weOiyvyNSVBp+AvOA59yAYlehFT5lBRQWXhnWajmQL
         Smpc38EsaD6e+3Zq9V9iEopyeBa6F1/TWteV5JltYFUJ1mPtop+L1pmsrPMmdPkGS5jS
         c7SQ==
X-Gm-Message-State: AOAM532TGg0CSIq23g+iHHIaC8kNmNdI5c8gjY0Ihdyy1zhvS8449QhT
        GFGOzqp0VT5Q7r5X8+A+1Y04fw==
X-Google-Smtp-Source: ABdhPJxBvNicteu8Kk/NeIdXVz2M6mgN0Smm9jf26pymA0l62seqMqOH8acTkvmBZWynMQBqELhWEA==
X-Received: by 2002:adf:8b06:: with SMTP id n6mr7276270wra.5.1635439665711;
        Thu, 28 Oct 2021 09:47:45 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y8sm3601724wrq.77.2021.10.28.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:47:45 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 3/7] dt-bindings: usb: Add qcom,pmic-usb-pdphy dt-binding header
Date:   Thu, 28 Oct 2021 17:49:37 +0100
Message-Id: <20211028164941.831918-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
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

