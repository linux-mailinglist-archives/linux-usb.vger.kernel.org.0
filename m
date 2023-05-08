Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C874D6FB29F
	for <lists+linux-usb@lfdr.de>; Mon,  8 May 2023 16:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233973AbjEHOXl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 10:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234591AbjEHOXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 10:23:38 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF34B65A9
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 07:23:33 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f427118644so7911555e9.0
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555812; x=1686147812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuPqCRZb0IOEal0w8tbJWxx13wX54OyCGod52wMQWCk=;
        b=L095LF8R92NW0DNcTNK8xuw5TTo47xr5DJhu9QjB42R3KemLKRrJSlKGdxk8ZOy3Tm
         W8NfddmrEptWsjN+rnpD2xjKdu6Aaz31D74JGmq0nSir9qfuph0SxyJTWjTlnP5XZyOz
         84i4qTQiW2osU5rlgt0KhnPX6MaDlZKm+Ba9OQZdpRDXJU1Pw4Aaz792ywi8NN1A30ON
         5gLD6JtPbaYMpxoU3V1zcxgY/1YMJGNUPO40N8P/WayJBNS9AOjYFQYnp+oOJUFMe3M6
         aZ/UszyZvUvjPriE4hNQmizdLoC4mz7Xs2rkE+hlpWB4xWs7kSj2iO1AcLkVv/mr8cYI
         gOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555812; x=1686147812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuPqCRZb0IOEal0w8tbJWxx13wX54OyCGod52wMQWCk=;
        b=h3aokiNq556o8T1Ddkl+dP/AdUwnodHoXYX+CvcSIxwv8Lt5OXWBPMEL2k7b4pvYBb
         XbDQMex5h6s+1jzj8QC98vSRmxTR2baYnWjIGVkv42ebBiT5Fk0EMR74CYoqcuQgZJEc
         cdYUdqBZ49V8Z9QOZkqP/dloUasgXP30KHlbfEFBs9qnS2QlOa36Jy3eSQWCzz5qkQBm
         g0WuUVFnN1JVropYh7TYis35NOVYeLIWj8HPsaJdWJzo3Y7IfrtNgWyBxoW0qki0zNxx
         0wnnIDA05vDzn8zTcvM34dJCHIeSOAeuHtKgqRL49C4A6sBB45M9dQtr5pPHv0trkEop
         iZLw==
X-Gm-Message-State: AC+VfDzdoIXOpZU5+K/TVxlU3BDMZRVwcpGRQPRHgsWOVYu2gAtJIJYD
        nMUwwRjcEHx/GIG79INbep0wMHWUWu6a5ATaLlUVgw==
X-Google-Smtp-Source: ACHHUZ5Ta2Cw6d4nfqlsLV6srThJ8dTvJh/B+AlkW5yMFrvJalADUwbb90ib3hQChWCGN1p+zPaAEA==
X-Received: by 2002:a05:600c:2056:b0:3f4:1188:94ee with SMTP id p22-20020a05600c205600b003f4118894eemr6799013wmg.40.1683555812238;
        Mon, 08 May 2023 07:23:32 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:30 -0700 (PDT)
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
Subject: [PATCH v7 10/13] arm64: dts: qcom: qrb5165-rb5: Switch on Type-C VBUS boost
Date:   Mon,  8 May 2023 15:23:05 +0100
Message-Id: <20230508142308.1656410-11-bryan.odonoghue@linaro.org>
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

