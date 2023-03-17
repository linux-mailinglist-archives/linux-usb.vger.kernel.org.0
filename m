Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF65F6BEC47
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbjCQPFN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjCQPEr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:04:47 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACEB31BC0
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:33 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id l12so4711058wrm.10
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReaB5rrl626TQ7XHSiG6p5ZQGCluXJKDnds+E5f0Tbc=;
        b=WXhjrIdAfVHiF8NLxeoCPXbaxeGSHYyJODGYN92G5ELpkBJl/TJxTcpfFC4SvwHodI
         I+x1StaIafDJDnHYR8fDDBRJGiSPXiBZKWqIvn/x21r5fCkOWlHg3X0vI90agqM1TbEA
         1p9tbt8fD3JfhiNaKZyVXCkbWXU+ZqbsI94NtW/f8WRTcU3ZzqSqjgcwV4V/N2x428au
         gh2X8b6sBiezzOjqlEMdf8Ifu1wHyh8dtZHtw24vXQVwdqU2TUyWh6xbQC7gzq6I+pYu
         lAWCLk0zpGKaJbUpwPcCqx8eXVyQs837KvOucT0Q9NKLPWEDf/p8CGKGaMnVa6zce6l/
         Rqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReaB5rrl626TQ7XHSiG6p5ZQGCluXJKDnds+E5f0Tbc=;
        b=knQY6zTt05EunghnrSKMhkAEkghlJDdnlwjdWpmy6wdjNa1we79zCt8YpdADdmiEcZ
         W/fCQP8vhoWdhuETJOlgn6P2oAH0So1JD98yGG3i4pxCANcwbgKXt9ifQE/XFZjp8Znx
         417jEhat6A9DHZUupq/Bq2g+bT9hwJ+975fPEmwjMlNX2GQAC0H32tTcNKLZXpBxNzUF
         4f/yYg1uoVGKeQgfHRA60/1RLmerO+RSqB24P/JixGH8GwHEyYVy6/UMyp+wGkDBVyHb
         4QWtu8iD33x003beN/7/Ngx7ypFE7qu/B7nz5JS2LttKuBWJEfh5gGpcVpED4C9TiLp9
         uoQA==
X-Gm-Message-State: AO0yUKVByywAFOIRVkFyRt12dzHCKL6PTg65K9mfGou3Ud6R8kbfTDf6
        yihSitcuEOkE7JW5SSv7ku0y5Q==
X-Google-Smtp-Source: AK7set9YIM4syfd0k/zPwZ/LnKShfYni1ghT7/PXB6wYiPO+QFDsjuZ38afoWeaSCIyBTOXnWQ3i8w==
X-Received: by 2002:adf:f30a:0:b0:2cf:f061:4902 with SMTP id i10-20020adff30a000000b002cff0614902mr6996724wro.47.1679065473106;
        Fri, 17 Mar 2023 08:04:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:32 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:25 +0100
Subject: [PATCH v4 09/12] arm64: dts: qcom: sm8350-hdk: add pmic glink node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-9-38bf0f5d07bd@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the pmic glink node linked with the DWC3 USB controller
switched to OTG mode and tagged with usb-role-switch.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 67 ++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 09baf6959c71..01affb16d039 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -31,6 +31,40 @@ hdmi_con: endpoint {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8350-pmic-glink", "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -674,8 +708,37 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	/* TODO: Define USB-C connector properly */
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+				remote-endpoint = <&pmic_glink_hs_in>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&pmic_glink_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
 &usb_1_hsphy {

-- 
2.34.1

