Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF27443E683
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 18:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhJ1QuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Oct 2021 12:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhJ1QuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Oct 2021 12:50:12 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22CFC061570
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 09:47:44 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id d3so11302597wrh.8
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=tCH7i0NfpZmsvt1HOmWniPk+M0M7bhXHwP8/OiTJ43dnw429qDh7MzDO5sloB7vzDS
         d7TwroAbKpMFv+goAKbx42H89EYgPfa8Cd6cBptBfowp8UDQWYKxsxUltZrLNjqa2iFU
         DiqJYck1jBkYdLBYkZQWf9JHsSrFPo4LRfPBkfOR0zi4EQqMZ8KTCuhVNLiHAAr4ML3G
         teuBxexzhy02hVqP0jaNANDWKJ7RF37lQMsafySycwcBndNR6mVpBeDlQJHOhagTTes/
         dxFV6DjCuEjFwk2X5AGRrQ5349yd72x7Dlcr0LVmJ0JM9rt+tjzm4l7ARm1gNMhb6cws
         Xc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28ILwbMYYFYo+iwfSu1OAenWdD1ePSsQXhSvTodKWcU=;
        b=ZxKMsywaWzgiWhacBSwQKKpbabSCF7e/VZO0Dc2JzCWAgEerV6XA4NvL8dqB+Q5aFB
         6kt78+8mps9/zhwCe2zFyhb+dFDzaVpjwMQI08RKFVsrqGuebBQamxXZwY8zDbjQ5Zum
         i0QKjPtwQVaQp2Uya8A5MpO+ghgZeAITvxqPDPYUUDTpPWHeoNodKQePrMRUQOG2wPiz
         o+7SBu9ci9awRNtJOQT+QT0l4Tp9PM3ShxDbQQrvXWaF8oX5T/E5jxE6mo3ZrzhEU6vT
         08BuWEsEKNAPujDPf1+6wSjL0na4BAQt/cV1pSlrFHC3eEY6WJ4eHD//mb6U2luHGY4n
         AeAg==
X-Gm-Message-State: AOAM532aV+xowlzUV59gRkqfZeHQBCv6JZf93GHKD0R8E+RdkcLzO0Lp
        oVTsmwjFKMwjEnSz3f/cYP86Sw==
X-Google-Smtp-Source: ABdhPJzvsIhsV1dDj5Q5oNo13hardH75LFlX46pBlSHkeDYiUvCjve4Y0emWMS+uYvx5ChzRa+cjWw==
X-Received: by 2002:a5d:660e:: with SMTP id n14mr7264151wru.388.1635439663437;
        Thu, 28 Oct 2021 09:47:43 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y8sm3601724wrq.77.2021.10.28.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:47:42 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 1/7] dt-bindings: usb: Add qcom,pmic-usb-typec dt-binding header
Date:   Thu, 28 Oct 2021 17:49:35 +0100
Message-Id: <20211028164941.831918-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
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

