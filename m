Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4412351A0B5
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 15:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348749AbiEDNYS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 09:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350508AbiEDNXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 09:23:36 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566BD40E4E
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 06:19:41 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id be20so1649274edb.12
        for <linux-usb@vger.kernel.org>; Wed, 04 May 2022 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADNyDG2DBGoI4aNwBUTKAtbwSm7KSpl3k1qLdQ+eNVc=;
        b=jWzS0esi1guJympagVAcA3QTh3pWmFIg059YzKQUR43O1SsyuAePGn1+b179PJujHl
         /XO4EoffzIkbOtmFoXliLccdVP0GlgC6lSYieM9AMLcGFkBaq9vW7qNq39lUKFgxWM94
         GvAHZgvyT7N/eDJpbbM1oEnaF/+GBRDy9MgWx2iOzkf24u6oh9o18VYgNeSSjEl2PGam
         Dx5khFSWL5HHKbSVFbdPpDNSmeHON7JFCeOHFIeS2S1bjZkiqGst+ysnyLCOy0nGNqNj
         XotVUY5gJigxDEgGhHKGSY0e7aY/3+SYMsBJkclQNygDnW1klMdpaH31KUZNx5qVBBzM
         +yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADNyDG2DBGoI4aNwBUTKAtbwSm7KSpl3k1qLdQ+eNVc=;
        b=UoStxwyjWqNfdouaDORUXgV0QIL3LABjdTdn2gHUK8+Q0sKf3VvrGtvohRHXjtaWfQ
         3byoCvD6ErNMuB52q2cLrvnjXInwTZraFkAMfHWBsG1CAFsNu3SIWydjlmcSis34dPBe
         j5A7Id8+hbx+lY6YWbr/Ugc4ITaok1XDlt1qYahMjx/u4kuvAJqIh/HV9ZkuEWZez5/3
         0Q0RDimWRonCdDjEFzYFNib71aQgP2kgHISBCvO9XI93auTx8VoO2TkJwpB9TEWmV/S/
         jtuM65Mef+gKic08o8HxxpxMSzQzfmdHS+tXlceUvcTKkgnNEKHQ23yhCs810OPct1xG
         N1+g==
X-Gm-Message-State: AOAM531T9LcuUdv7iKrVKeBv2kjkJkZPg+pZu3bNMyqjN3bzq0Y8n5ET
        GMQJofm118VSl4MCTtz7WG/Rtw==
X-Google-Smtp-Source: ABdhPJzi0UFBk+U8jgTCaeO7i9cpBHQDLvfub0EZ5Bf6vo5Ltzx5N8wg/f9zEiZuAimbgXJnuku/eg==
X-Received: by 2002:aa7:cd0a:0:b0:425:bc13:4ccb with SMTP id b10-20020aa7cd0a000000b00425bc134ccbmr22949498edw.229.1651670379824;
        Wed, 04 May 2022 06:19:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gx3-20020a1709068a4300b006f3ef214dc4sm5660924ejc.42.2022.05.04.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:19:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/13] arm64: dts: qcom: msm8996: add clock-names to DWC3 USB node
Date:   Wed,  4 May 2022 15:19:21 +0200
Message-Id: <20220504131923.214367-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The clock-names is a required property of DWC3 USB node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index fc2e026d4c07..b717c01d87e8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3050,6 +3050,11 @@ usb2: usb@76f8800 {
 				<&gcc GCC_USB20_MOCK_UTMI_CLK>,
 				<&gcc GCC_USB20_SLEEP_CLK>,
 				<&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
 
 			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
 					  <&gcc GCC_USB20_MASTER_CLK>;
-- 
2.32.0

