Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794F16F30BE
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 14:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbjEAMLc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 08:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjEAMLb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 08:11:31 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74E0198B
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 05:11:27 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f19ab99540so23350115e9.2
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 05:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943086; x=1685535086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCwho3uKk5QmWh01Wmw4tEPLfVlhN7/orLWF0pBPcCs=;
        b=f5j0DnAe6PQ0NI+7+xzDRkEk9Qc2qk7GUg1xB7/+2n9AfEH9HSLr6bE0Yw3R3wMG1g
         RaOEiv/KnJZHErmJUq65NmRwcpKJ+ZTkCUpN1m7bActF7P33KQi2Ch7CMaOzisv1NQEJ
         icDy0i5tE4TVR24oCsuzYU8YU8uMLmq7kFbUVcasOkmYI33NJdXOVKwSUUYXVpDCodAC
         fW55a7RSYKfH1Akf1NZe/kVcgH9q3kdICOBSKAtpin+eTiwEwRkNol5B9rSTOFoMWAYv
         0HGJCYfN7VZ+RA8hdtNUtFsBhcuZa7P5B9nEJHtsghTmivUrzFYM/6RH62D98S3U9wB0
         GEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943086; x=1685535086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCwho3uKk5QmWh01Wmw4tEPLfVlhN7/orLWF0pBPcCs=;
        b=KHdu3M6bO8mxpZc4vxMyfDVo/Jxilit9s33xEjqfXpwcU+u4ba77DXq5mdo7/4tTAK
         jYaOpJTIi0fMtP+1/cSJ7vtHeBXOVnrrN0BKGLxsIDCAvva3ltikRtyjxDAYQqz1m7gf
         yn3XG19JvvELIUGIed79TYEfdiZ6pktWT1h3E/eeulorH9HdP5uF1IcaFCZN3PgHcoN2
         p2SaSG7KjCJk4tB/J0FAkTgaNR2EoC60+veKqFJpfmhEXxUuATmG13RKNVBpyCJkZzlx
         fcYgU7J6zqJ/9c/kBDNKsVqnwZfoz3XXhE8IaVPo4oUGbnShbRcAL24JNxK01ZAdQzWy
         xIDw==
X-Gm-Message-State: AC+VfDwdvW6QJvFPv0VguhdWNV0Tt+y92JldugEvvnnPI3xHIZtlD/rF
        5RDqIPN7DMuKP+i0ycF5st8jAw==
X-Google-Smtp-Source: ACHHUZ5dDtqBmqjU7m8UeU/M3yuDuRSf7Qeqd6XPafB69qFbzDhkijrQ1Ug/2zNkvDkcImagYhDedQ==
X-Received: by 2002:a7b:c84b:0:b0:3f1:75a9:5c0d with SMTP id c11-20020a7bc84b000000b003f175a95c0dmr10488501wml.26.1682943086071;
        Mon, 01 May 2023 05:11:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v6 10/13] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
Date:   Mon,  1 May 2023 13:11:08 +0100
Message-Id: <20230501121111.1058190-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
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

