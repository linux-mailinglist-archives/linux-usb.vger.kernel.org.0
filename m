Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F514399A8
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 17:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhJYPJb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 11:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbhJYPJa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 11:09:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B604C061745
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:07:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id p14so7451826wrd.10
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=xX9+8Vz5hLAENpVbj995OiW3YAJoqWpOBaB36WIdrhaMYttWvKRg7ROZtRiJBEtpnv
         VNuuvzxAFeonNXmGy7TkLViY775kPKYnaujJrTjtGIC4IL+M2gQUeU6FNBmdfJr81tIt
         rL3Z+VzgPnNtkyerJMRGuJaUvlPKw8Y5MlwVJssfS6kg/ZUXICpesb1Op2ap6aeWqO/R
         pgTxKHhDKEJcEJSXOi1q7vMZ+aE7tNbxOGMAG0QERs+PruyR8wCZesNs7LZfeV7iZ+9P
         dmVUQSW4RFiTKmMoJdYyAiYQqjLUEXqQ4k9XRV96uXcM8CtC7t0HeeYx5Wf6tI24LZ7C
         PvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=jJF82U+J/VI/pY2ezEwnBsIzzZbCxGLyx2HENC6i/dIZJJty0Qk0tpl2qJvb+s68YZ
         CUiVvA9Hy2n6NhtriK6KV8diL3hfqIrqVuUf6HzAN03AxpTTSFOztGOU7TqLFXpgzODo
         CjeeSmTZozXpER7dqxdZMB5L3EcZ5+tDPcsfr1nncxXWWYkKiPoe3eE7UDAQmSyxxOue
         GJrOhV9wqk1QjVdqk9PjJRhZpVLVpOBRmlbcNOKfiG8osv8jD1sfJKbVABrQDMdn5KiR
         ldiw5Ninh5vm/zHD6I0mxxC8xZQzRjf4CvW8ybWsE/xOfvOiouiHCOdR6Dk+jmu+Dend
         oIJw==
X-Gm-Message-State: AOAM531eSYflIv/DwN9YuY2zOvJ3yN0HLxlAprXP7XyFaOFoaMoY8rgB
        fp8D7pLS69T5PYbnVL/AOtnaoQ==
X-Google-Smtp-Source: ABdhPJxGMsDdemQGOxy3WtoZdy1C1NSsWMOHGONkEcvjkkqrHZ5Z7vIQnPvGve/bStGx4oN3jQmz8Q==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr24593896wru.113.1635174426790;
        Mon, 25 Oct 2021 08:07:06 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f20sm19173554wmq.38.2021.10.25.08.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:07:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 1/6] dt-bindings: usb: Add qcom,pmic-usb-typec dt-binding header
Date:   Mon, 25 Oct 2021 16:09:01 +0100
Message-Id: <20211025150906.176686-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adds a series of defines which are used in the DTS and type-c driver for
identifying interrupts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../usb/typec/tcpm/qcom,pmic-usb-typec.h       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h

diff --git a/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h
new file mode 100644
index 0000000000000..263c999b59b8d
--- /dev/null
+++ b/include/dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_TCPM_QCOM_PMIC_USB_TYPEC_H
+#define _DT_BINDINGS_TCPM_QCOM_PMIC_USB_TYPEC_H
+
+#define PMIC_TYPEC_OR_RID_IRQ		0x0
+#define PMIC_TYPEC_VPD_IRQ		0x1
+#define PMIC_TYPEC_CC_STATE_IRQ		0x2
+#define PMIC_TYPEC_VCONN_OC_IRQ		0x3
+#define PMIC_TYPEC_VBUS_IRQ		0x4
+#define PMIC_TYPEC_ATTACH_DETACH_IRQ	0x5
+#define PMIC_TYPEC_LEGACY_CABLE_IRQ	0x6
+#define PMIC_TYPEC_TRY_SNK_SRC_IRQ	0x7
+
+#endif
-- 
2.33.0

