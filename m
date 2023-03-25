Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB436C8F91
	for <lists+linux-usb@lfdr.de>; Sat, 25 Mar 2023 17:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbjCYQwj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Mar 2023 12:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbjCYQwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Mar 2023 12:52:37 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6237D10A8B
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 09:52:33 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so4414335pjl.4
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679763153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7SFhVIy9FiHRYuAVmr5oCzy1fSTsBZJqJuUJjAhwMU=;
        b=runkUjvi440oz3iTpTbSsu3XyBNpxPoC2CRukScXahnGwh0GvHSUdFC97vwWCNuzCw
         ys6qdo+HVEVTcHPDvOOQxyr5cHT/J8ibb7o/vUIEwmndQfIQ/dQ10fWuFa2PdIc7WxSt
         c+C6/U02ZOt47SQR7m90y2s5CL9ssXA1C28j5G1m/eK/n7VNjtQ7o3Gj51prlf0RFW+n
         1ALXZ0h4VfqebnB+cHsqrj4THYOEWfZoO4XZCTSEgs4VFgbicvN9iRQ1rCL4ezP/vLjr
         SlSMtlG86niVpayWoCx572w1B05zFY5lBBTDBKF86CtEvp04knbjG37kDzVoaa9cSW8c
         rrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679763153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7SFhVIy9FiHRYuAVmr5oCzy1fSTsBZJqJuUJjAhwMU=;
        b=m2fZuMYHGg4uwH+Ov0yhnEUaVHhF2GWAJ+KZ2b/3aF3xXcGcUTf9pPRmACb2W59OGr
         fr1MxBmAjPt7HdH9TvOySdMR7C9PuuNGh7d/JcHcRMlp4wYPJ3wpRv/eQaGB+3nBCtXd
         7StafkQv9k7zKhBxXTNvTrT662DCN3GZ50KrzZ8RljMQoKY5h7KXgd3oaT/64Hr273iV
         HMLVmJvYEYh1gdpUI6mj53/2Vwx99IiimWMKtQlglFHeCBoYb/qGhWneEtqDy0VEjRIN
         n5ubGqxTzEEmnVlUvhaOjUcB/wcfSFpOZwBnplusEiMPCd8ceyRywxpuCCFlHthSh/VR
         VckQ==
X-Gm-Message-State: AAQBX9eEyWbCH1ORxWZ087AD7bmZy42dLMfwdbok07v7Rm3rZdHvSTyP
        gRCcfyNy22U7ZbVne/Wpvghu
X-Google-Smtp-Source: AKy350ZjCXmBhgZ6Bl0DVFjZswxej9wl1wM/D1SPCFgRUkhdxleFS+0AWBrkte51z7VOJCKZWNas2A==
X-Received: by 2002:a17:902:f34d:b0:1a1:cef2:accf with SMTP id q13-20020a170902f34d00b001a1cef2accfmr4965302ple.30.1679763152728;
        Sat, 25 Mar 2023 09:52:32 -0700 (PDT)
Received: from localhost.localdomain ([117.217.184.99])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709026b8500b001a1aeb3a7a9sm14889787plk.137.2023.03.25.09.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 09:52:32 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: sc8280xp: Add missing dwc3 quirks
Date:   Sat, 25 Mar 2023 22:22:13 +0530
Message-Id: <20230325165217.31069-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add missing quirks for the USB DWC3 IP.

Cc: stable@vger.kernel.org # 5.20
Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 0d02599d8867..266a94c712aa 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3040,6 +3040,13 @@ usb_0_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x820 0x0>;
 				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,usb2-gadget-lpm-disable;
+				snps,is-utmi-l1-suspend;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,has-lpm-erratum;
+				tx-fifo-resize;
 
 				port {
 					usb_0_role_switch: endpoint {
@@ -3100,6 +3107,13 @@ usb_1_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x860 0x0>;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,usb2-gadget-lpm-disable;
+				snps,is-utmi-l1-suspend;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,has-lpm-erratum;
+				tx-fifo-resize;
 
 				port {
 					usb_1_role_switch: endpoint {
-- 
2.25.1

