Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B196FB2A8
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 16:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbjEHOYB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 10:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbjEHOX7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 10:23:59 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9673E420C
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 07:23:51 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f19a80a330so30176455e9.2
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555816; x=1686147816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6epDoREeyW7xiYpBIh+9OmW/8MwkayI69pNElj0rHko=;
        b=npeYlGIXEpZf1feJ6JsnaYPH5yx6gv4uJQsVxnQiU1Dx/dgmfF3/NYaOmVv+/99mn5
         EuDL8zfDWvy5inU0rhs6N1NO7B3idhd1EiMihMmoYo9Bhy70K/UGBgEYRK92oxBIdpf8
         wAyDLQcooDvyjP10LZ4CYcehP+3+tbJ6/R+reHTn+0MfstK7cCOYJRZcn1kDBXeBn01t
         pjxqLvxJROuuqHn7gaTV6irF1qPk186pocjS/8hPsueq/kBJN5qlFXc5UQIuOtmoB6m5
         uE9K4EkCaYfS+vJ5yiwMEXFXesekkZFdeLK+FoJ/I/zuF4ZmgGauDowC0qZR0jrQNX+8
         P7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555816; x=1686147816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6epDoREeyW7xiYpBIh+9OmW/8MwkayI69pNElj0rHko=;
        b=YKB/y8mttUtgP082vvgD+qGihwVvnURRIkerKNMmcN4pom3A7daaOpdKNx25gLyr9s
         /L5HLuIETCQaGti2Ks4lGa7z05bdYfFUnW0SEh2pibE/8qnMifpc7AogzPiTKu+Tjvdk
         2UJTCbZL3sS0NO+1qXEzxrdxBQ8mGP6c4K+xz8fvrFiyXSZyZSN2NeZkMPKNZCZBvbOT
         PiQl/7CLVcVcK9+QTAt0nKb9X2leBPsLfqOCuT26FUK97oAG2zdmNGz+snMro1GwBR06
         9oKEoefimh47Ll/Bik4q974AZarND18lOISsVt3lMZHECtBlMFdbOlG5jscLbWl37SiN
         TDRQ==
X-Gm-Message-State: AC+VfDzDRn/aLj4Wk2FrCq1Nf5g7PzdICmsiftTxyRn7wS+a4xF1XPQX
        8rFvnRn9QRJ/M471Aauw91V5Fw==
X-Google-Smtp-Source: ACHHUZ5HrOPi4Zh1EtE+UopHE3YIu0K/UpyHlxZ8n6MukD06Vdr+QFlp2AagNqa9j3E1587ccsbtGg==
X-Received: by 2002:a1c:f715:0:b0:3f1:6fe2:c4b2 with SMTP id v21-20020a1cf715000000b003f16fe2c4b2mr6992686wmh.23.1683555816729;
        Mon, 08 May 2023 07:23:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v7 13/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy
Date:   Mon,  8 May 2023 15:23:08 +0100
Message-Id: <20230508142308.1656410-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Switch on USB orientation-switching for usb_1_qmp via TCPM. Detecting the
orientation switch is required to get the PHY to reset and bring-up the PHY
with the CC lines set to the appropriate lane.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 11 +++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |  1 +
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 286bf63caedd1..f522a48547472 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1294,6 +1294,11 @@ &usb_1_qmpphy {
 
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p92>;
+	orientation-switch;
+};
+
+&usb_1_qmpphy_typec_mux_in {
+	remote-endpoint = <&pm8150b_typec_mux_out>;
 };
 
 &usb_2 {
@@ -1376,6 +1381,12 @@ pm8150b_role_switch_out: endpoint {
 					remote-endpoint = <&usb_1_dwc3_role_switch_in>;
 				};
 			};
+			port@1 {
+				reg = <1>;
+				pm8150b_typec_mux_out: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
+				};
+			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 3d79110892298..0ffca1bd217f7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3588,6 +3588,7 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					usb_1_qmpphy_typec_mux_in: endpoint {};
 				};
 
 				port@1 {
-- 
2.39.2

