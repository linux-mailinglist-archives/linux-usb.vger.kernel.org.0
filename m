Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7A36F6785
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 10:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjEDIa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 04:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjEDIaZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 04:30:25 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62A765B3
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 01:27:32 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6434440970fso293110b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 04 May 2023 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683188851; x=1685780851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz6g2/625qlFmhiR93VnIJ+EVOsf12tbuuuDirZwZ9U=;
        b=uh/cVkAvbCAQeNz+eFz44pqdjg9k5CWL5VqL1bx9HCYSnp54SVpjfh+R89DQ3unScf
         saWw0OzTNf3ReNCe4N6JqvMpOxFz5ATlmbMkuYTWgnHHzAYfdUL+A3KKAOFOAOR/DE7f
         1PT6V6GD0pxlBsO6yDgIiO7UM+33qmlscNyrseKXanMfXdvJCox4Qvyqy5/7WIDobQ9P
         8MMPZvhLdmas2kEuxJwqjufeFWPC7iDi7nx0meJab/Zy6+6NYLtZr/1uqUX9lv7zcPlC
         1i7U1iIIJ7ylSMdxDWz4xRQBCDATihGJr85QSD81mMELTbvY/oYX3oXJWRv24m2SETBQ
         ed5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188851; x=1685780851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz6g2/625qlFmhiR93VnIJ+EVOsf12tbuuuDirZwZ9U=;
        b=JrE1LmDKH7frgPdytgWOhNttSUyibYvfr3ZV28rw6WEeAIAauaXXZSaQC9Rg3ex1b7
         oKV554Qs5zoVQj0z03E7Why8BElpgG8It03vHPRvGV1JuQxTuqwaeJ4UBbaobe/DBiD2
         SSJmWOrjioBbAHmCakK3copQ+PQNjbVaF0dksrN/C1y38tE0bTVMaDmNf6QMkSYdKXQI
         VltqZ//xBewZJBVw+Vjsz7QFAfB02kQNcPXn/QqNO/T1kEoFLHNGuDE49dF84AUZ6BMd
         SiGu/eUkjnxZwGSSgFH7RUqHv0zKjsFutek5nB72pOkrz4yl59iofMiI+exUO/v0My1b
         4cjA==
X-Gm-Message-State: AC+VfDxZY2CsanCNXXzRLrXbkeWSR+9fVJb5Yut5IEdPTxFT26tFDvzI
        f4pktecfiUhxSEzfmBt5d6HfUw==
X-Google-Smtp-Source: ACHHUZ5pJk4+pL/gurW2SaGLZq20EkbWIIas0Rnxk/sNmRNhNANYG/Q7F0Ky1Z8TEduY/ecGWla3qQ==
X-Received: by 2002:a05:6a00:b86:b0:63d:3a18:4a03 with SMTP id g6-20020a056a000b8600b0063d3a184a03mr1878881pfj.5.1683188851588;
        Thu, 04 May 2023 01:27:31 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id s1-20020a056a00178100b00625d84a0194sm24913973pfg.107.2023.05.04.01.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:27:31 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v3 5/5] arm64: dts: qcom: qrb4210-rb2: Enable EUD debug peripheral
Date:   Thu,  4 May 2023 13:56:44 +0530
Message-Id: <20230504082644.1461582-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
References: <20230504082644.1461582-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the USB-C type port on the Qualcomm QRB4210-RB2 board
can be set primarily in a 'device' configuration (with the default
DIP switch settings), it makes sense to enable the EUD debug
peripheral on the board by default by setting the USB 'dr_mode' property
as 'otg'.

Now, the EUD debug peripheral can be enabled by executing:
 $ echo 1 > /sys/bus/platform/drivers/qcom_eud/1610000.eud/enable

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 27 +++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1a0776a0cfd0..0ce72f1ebc10 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -30,6 +30,10 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -253,7 +257,28 @@ &usb {
 
 &usb_dwc3 {
 	maximum-speed = "super-speed";
-	dr_mode = "peripheral";
+
+	/*
+	 * There is only one USB DWC3 controller on QRB4210 board and it is connected
+	 * via a DIP Switch:
+	 * - to either an USB - C type connector or an USB - A type connector
+	 *   (via a GL3590-S hub), and
+	 * - to either an USB - A type connector (via a GL3590-S hub) or a connector
+	 *   for further connection with a mezzanine board.
+	 *
+	 * All of the above hardware muxes would allow us to hook things up in
+	 * different ways to some potential benefit for static configurations (for e.g.
+	 * on one hand we can have two USB - A type connectors and a USB - Ethernet
+	 * connection available and on the other we can use the USB - C type in
+	 * peripheral mode).
+	 *
+	 * Note that since the USB - C type can be used only in peripehral mode,
+	 * so hardcoding the mode to 'peripheral' here makes sense.
+	 *
+	 * However since we want to use the EUD debug device, we set the mode as
+	 * 'otg' here.
+	 */
+	dr_mode = "otg";
 };
 
 &usb_hsphy {
-- 
2.38.1

