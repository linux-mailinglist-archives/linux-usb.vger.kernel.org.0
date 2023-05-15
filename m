Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA84702E5B
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 15:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241346AbjEONhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 09:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242390AbjEONg7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 09:36:59 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E1E1FEF
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:56 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30626f4d74aso8329495f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157816; x=1686749816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuPqCRZb0IOEal0w8tbJWxx13wX54OyCGod52wMQWCk=;
        b=JcqSgDTM/ySOQ6/P9BjOLEW38jMM3ftKOp0CVNl8sMYHi00RIyYW3hOH5uF3wn8Pf1
         9sAis0eIBR4dNi3OXIc3peSjeZk7gw6jCwRacBFT1/dWn5opHkeL2R0WREjy9e9s78r9
         Pxo8ePtyXfqqHoFrn/mbrtCv9USwIFw5dbyxAMTwilrtR6H3+1gh9VtWyEH7cYkLky0u
         SwSlAHPWh6atOT6/TeuSbbe3oJYIQtv4nDrak/zVdD9QzxRHmsXBQuscAFfz9ADFpBTA
         f8tlJFa0tQtqkpdboXjk0/IiNiSNhdsDMfmgAnhWFb0OZaRz1JROfirW+Q/TyUcAVI6H
         t81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157816; x=1686749816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuPqCRZb0IOEal0w8tbJWxx13wX54OyCGod52wMQWCk=;
        b=LipVr6MNJI+oFhZvlcmF3ZrkCZYCNqxHVa4ny8BALD9oNu3RS3BLzj7Z34ujKxmbBw
         4Bi1KY8zSN2MzoP6tsee+GqKucbadxV6V77GRN3e67ZxydP3WjN5fC4swKXGq0dS13P2
         xJcCwdOUf1h4Iy2Xam1vjy6NPBLvVWunJGhayfbtWvvZSSAxKXN8jwyQuiGVu89Z3d4P
         ubQ92Mh7I57NfkuR7wLBbK6x0uXBAKXuQlD+CLLreVoInR4YdRrNuEuL/4jlrJpvVzFz
         WFElugbn/k2a7B1GsWCV/HLP7d7wahibj7+FfILk7O+GCoR5SWrinFjj4CCYMmm8eFB+
         VstA==
X-Gm-Message-State: AC+VfDyd3uFXASeGsuUYB2Jv3KAWFCSmQJdZZBgaikY8XniGlC8lNFQR
        jsaSMP9cxwqgaS701L47VgTBNQ==
X-Google-Smtp-Source: ACHHUZ4lYvQ3HrSBEi/Fhlmj/Ybw2dRoWy7eedfFwF1cjPr6nJxYzAjJlWjW3kDlNyIvwRnIF67QAA==
X-Received: by 2002:adf:d0c7:0:b0:306:372d:7891 with SMTP id z7-20020adfd0c7000000b00306372d7891mr23840447wrh.59.1684157815859;
        Mon, 15 May 2023 06:36:55 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:55 -0700 (PDT)
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
Subject: [PATCH v8 08/11] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
Date:   Mon, 15 May 2023 14:36:40 +0100
Message-Id: <20230515133643.3621656-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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

Switch on VBUS for the Type-C port. We need to support a higher amperage
than the bootloader set 2 Amps.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dd924331b0eea..b326bdeeb7742 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1338,3 +1338,9 @@ &qup_spi0_data_clk {
 	drive-strength = <6>;
 	bias-disable;
 };
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
-- 
2.39.2

