Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3D76E0CBB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjDMLfh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 07:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjDMLfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 07:35:31 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A820D9EDE
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:35:15 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e16so622540wra.6
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385696; x=1683977696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcMNU2pXY7at0soUmicgwVM/bFPgaN3uZsi3VUVpjYA=;
        b=fta7Yb+O1bsTNZqK70ZbYc0/Lj6QF5t6o7ldRAG8TEFsbUjd8otC26p5V1/0r8eKLI
         hjPvY++1QkY/55HuhKrkkoeFMTOSDBu9cayHxybQ6vaMI8B+E4DcEa8iVrqxP3yrbXjL
         lgnmuwtwabmkUnYFkOUN4ffq4ZAHY+f4sqtU36+Apdp7VE7ojyux2ub9b/WKG+UaKWmB
         ZZd2h9pzMfV5P3lxxVS+KukX1dY75g7YJWYS9QV3ekBcQNwoU5C+wMbZJCVzb0D2nFDL
         FHanbqlKuuVpOVd2qR5pUF88TXC2nxXuOeitTT20LK/A2egO7hunOrXqFymmi5/A36wu
         CNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385696; x=1683977696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcMNU2pXY7at0soUmicgwVM/bFPgaN3uZsi3VUVpjYA=;
        b=Q/6if5+Bzlzoj6eO3Y9b0J6VrkfzJ4lN4mN8wQ4bHuEmtbB4atc7h4wRpgeOtP5+KT
         HeScrlM2A/7M8HaGw8Jd6csj3BL2GNisNFktoEkeJSSX+g15Z53C+KZOcAxHTuElnBy7
         H9dJ8QL2pjh8wq2Da98d6NLLdUs4+v5V2GnLMuHep4K2GvlW0trTkTVsgH2YVO7QQzOb
         gOCvu5VrU/WHfz7A7LJJtrlIlnVXx2Lf4/CJibIAyWEpaBZaMn+tsND+ko7mdYzdqpy6
         8jU6moHbUbnUZZVDoKTn1HIpcS1stZNrgHzoWNpBYRNYanOWzWZ8rCUpFjwcT1R04bZl
         WzkA==
X-Gm-Message-State: AAQBX9eHSG+S2RLNfpQkqEGyqvbjx5oNdAoZPpoaoJnV1IeBjmUqHdfY
        XQhhj/2PhB06793ey+l9OXDJhw==
X-Google-Smtp-Source: AKy350ZAgbyOnh3nikW0nzPoUS50snyXA9Uy7VQ6IYZyCGF2ED7DeWPCIG04/AeDff6pBIxjTVna4g==
X-Received: by 2002:a5d:574f:0:b0:2f2:585f:5369 with SMTP id q15-20020a5d574f000000b002f2585f5369mr1273676wrw.62.1681385696517;
        Thu, 13 Apr 2023 04:34:56 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 12/14] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM orientation-switch for usb_1_qmpphy
Date:   Thu, 13 Apr 2023 12:34:36 +0100
Message-Id: <20230413113438.1577658-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index b5cc45358a474..8935a8e327904 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1295,6 +1295,14 @@ &usb_1_qmpphy {
 
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p92>;
+	orientation-switch;
+	ports {
+		port@1 {
+			qmpphy_typec_mux_in: endpoint {
+				remote-endpoint = <&pm8150b_typec_mux_out>;
+			};
+		};
+	};
 };
 
 &usb_2 {
@@ -1375,6 +1383,12 @@ pm8150b_role_switch_out: endpoint {
 					remote-endpoint = <&dwc3_role_switch_in>;
 				};
 			};
+			port@1 {
+				reg = <1>;
+				pm8150b_typec_mux_out: endpoint {
+					remote-endpoint = <&qmpphy_typec_mux_in>;
+				};
+			};
 		};
 	};
 };
-- 
2.39.2

