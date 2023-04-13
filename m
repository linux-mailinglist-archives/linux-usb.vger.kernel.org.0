Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3606E0CAB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 13:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjDMLfc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 07:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjDMLf2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 07:35:28 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C139771
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:35:08 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s12so5423986wrb.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385690; x=1683977690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ezqUbWswfy2WUlCvIHmGIfKnDufe3ITp5T03UEYhmU=;
        b=CD+CzSHsSiQ2hTlz/UD+rhJW6/30TpyZPMQuD2Mdu9L/51CYVpqhbrB/4W9GGaZ4VE
         ZQ3HzkQ+zLtyZ6x3ptueo6Evnc51exxpLBvibWfWINrwwS3iwJpNvFKwkqcNZDOAUQ7E
         MoOa65obVhho9mKVJVTAhfC2FXbexZsNGSLp2ovw8bSWShCxk8ya6rPe0wX4pDhHKJgw
         ZtPfFb5H54jJTXlnXvvGUhefA5aYfejsWHH8jG70EPDeyaB9/Ic6G2Qh9zn++OBiu0U5
         c/CEfuiuOFvX2UGh+f76meRnMGVywy2J6XyiAiw2udmqls8WWmHejEcpKlFvc5tN2H60
         Tzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385690; x=1683977690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ezqUbWswfy2WUlCvIHmGIfKnDufe3ITp5T03UEYhmU=;
        b=aACVcPfanksbyhlylVo7UO/dWpUk74obRZnmvPCXb8OS9wPBdqnzWVlJcCIq7yI0us
         ngQjHGy39C0DvwprA8XoYXhllzzp03Tpd41lQcETP+fCFs5eipCynN7gUqLYgEMtWFlV
         L+SJgEtOV0X0STVKeHiPuUPUyZmav/DnndYQIOXdgZWxYLIN9F3kci5XBGEMRWUF9prT
         8BtL+Kv3UNVZpsJ0Gz3xF3Whey0208sSCzpOxLFzVE0iXXudKtVkby+5V1vq6upgolSE
         u5C+hGIClSyf6dThtLr/tM1fvXUtVKCKOjNHXffx+ZUzBf4LPie646nXtYAfAVc0fyTS
         ZKdw==
X-Gm-Message-State: AAQBX9fWDcPOZNovBbkPuDhc7r1cNKcJ38jzntQeJQVQxDQEPHHE1NhS
        F9AmyLT+O+FVgR4Kr0x1TYCdYg==
X-Google-Smtp-Source: AKy350Z6IqszLQulGtTmNfmshN4wu2kHt73nJaOhYTBkD6v63ODtZe1z/7hT12R6tkRxaa2vuHbr7w==
X-Received: by 2002:adf:e3cb:0:b0:2f5:9146:701c with SMTP id k11-20020adfe3cb000000b002f59146701cmr1370303wrm.52.1681385690284;
        Thu, 13 Apr 2023 04:34:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:49 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 07/14] arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching
Date:   Thu, 13 Apr 2023 12:34:31 +0100
Message-Id: <20230413113438.1577658-8-bryan.odonoghue@linaro.org>
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

ports for orientation switching input and output. The individual board dts
files will instantiate port@0 and port@1 depending on the supported
feature-set.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a91d1175255e8..af16d3ba76b8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3581,6 +3581,19 @@ dp_phy: dp-phy@88ea200 {
 				#phy-cells = <0>;
 				#clock-cells = <1>;
 			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.39.2

