Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA20B6BEC3C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjCQPFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjCQPEw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:04:52 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8050931BCB
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r29so4704019wra.13
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81l551VcpX1M6mk9/O5MVJii8ShKhy56jAQgidl0DwY=;
        b=QK8Srk+nXHNfVumQzoJm2XSv8qMrDwjoQnSJCdPoXRC7Zk5Jckw0GncDh2Z+AjxkTM
         mvFbA+g0SVgRBjYuUzNYklqK5YkvufidELDDFEF9xcAcHUf/qVHfIyoyYnzQwVmfMFkv
         B1PoVh52r483oEmxeR+ObsVVUNeU9UoFh3Lk5Hku7o5IijxA1w1LAFF445kJ38JOXSy4
         biO6pLCfXPLVvaAUByKl/ub8wVjkSGcrbf6d5KRAXyT/rfQfv6SHjWpGU+Nwr0BtBkJR
         bGH64i8DycpQXoawBmemXMW3p5UD6htLQYdhPpP8PWMs3Q9yTRRb7pVFSv9j93JLibBR
         k50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81l551VcpX1M6mk9/O5MVJii8ShKhy56jAQgidl0DwY=;
        b=3Ol5bgj0NaJrTDGvgV56PUBgs+Inf8MC17mmPxZmQowQSnZtrdXkpclfnTYncVTQlp
         X6Kp2p6D/sGyBmCkte3FmrEoexv23WbM8hyUkKXyZ2lm3TU2kqIp2ZlDWv4aCr6iasDm
         k/ike1bpqfMHax0tex0nDjpUT6Ph4b5Wg8chHthKbkr6Fj+Rv81ivDMqDtzgojzfxyfs
         JYvc+qZ3Kn/Bp1/MvTQWJstx/9/tW4lCQ/POr5ChdxDZt6Tf2JuxHeT6L1CF3upFcVs1
         HRVR24pRrJAVEF5d815nTHYjbVTIkjaKoOeLFBcvx6yB+mxI+R6hqODOvGBcyJOGwOW1
         v7Ug==
X-Gm-Message-State: AO0yUKWLClC+e/RZNHME1ENj8pmMs73rarYtoG00+NujwSAzQVql9TqS
        WdDMNYWyTjfasd56paAxBG9LnA==
X-Google-Smtp-Source: AK7set9k2B6KLq3og1yxJGCSQGDPvlK4CCN4rLjAbLWbOlacyoKiEkRHsI6+tDFfNBEQEfaaFOAJLg==
X-Received: by 2002:adf:d84f:0:b0:2cf:ed87:37c9 with SMTP id k15-20020adfd84f000000b002cfed8737c9mr2779125wrl.11.1679065472241;
        Fri, 17 Mar 2023 08:04:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:24 +0100
Subject: [PATCH v4 08/12] arm64: dts: qcom: sm8550: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-8-38bf0f5d07bd@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add ports subnodes in dwc3 node to avoid repeating the
same description in each board DT.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 6af4079c9a35..da32f6bc34ab 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2460,6 +2460,25 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>,
 				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.34.1

