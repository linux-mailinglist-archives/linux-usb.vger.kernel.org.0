Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20406B256E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 14:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjCIN25 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 08:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjCIN2Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 08:28:16 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40EA5C9DD
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 05:28:13 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso1217385wmp.4
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 05:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Tp9zLtCwVp7RxG9ro6QJ1uHwHoo+Kd5QBn3UiGJnHo=;
        b=NCUBebvjDz+6NC5QufmIFkxawl1AuJIZ0HVIGF/Cscn8ErFIBKRgmCx1dvVMAwbaQn
         0xtUL7KQOAxqIWd2n8HB6avFYO+bs6OpZQMdbLv8VmUj4Nz3wK0X4pPAsK3BdJJ/Ybbd
         6SLXTo6KTNoYmQ2S8sAuwao8cuHh3blp0t7q1ejdigE9+jsJtv+/7DSj6fAAWX9tB7R+
         FdOFNSRsbgeoqCFyhuRUHHSGNoTYAvCasxdgqDDLpyV05JDeicY396QvFgL1/uzM+/eA
         umC2ekGeKIO+4oJmPNx7Vg4aRDXnktl0x18g01jfuXZ+TQhEILW7SU1q/RT2GC9Jxsqg
         vHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Tp9zLtCwVp7RxG9ro6QJ1uHwHoo+Kd5QBn3UiGJnHo=;
        b=3P9UnRpF0GeG/8PenL2RlU/rD0XMSVQYvPLMeYI1xZfEEdytlHINjAhh0P8ec1Iyk/
         7jVSEGy2ykXXwyevpROgLZbruBfRpQP3gjTTdgvS+W7LlWQVqu9s4Wd6quVq/MS/QXZL
         Mo5+n4SS1ZnkKg+cD4JIjVxPtswp7shsfZioi5d598oc1xjkE0ww95pumXO+rvmajaVI
         y+w58apI9uizQRQ07cKhUmmKgMMEBRD6Bn5op/x1daIqwsJMdyENkLqV6fOi58EB5IQq
         jlqEfdyPOsLy17s6W6Obxf7nmAONy5JcTN/YUOfV7qvwKct1HCVC/APRV5AEH+oxSeBq
         mq0Q==
X-Gm-Message-State: AO0yUKXv623vZ7j63sl4wGnJv/Kyx+47ho1uw/sBCPiKqXGBI1LW7hxn
        jAdioiFF/YKxmU/ayK4piCrhEA==
X-Google-Smtp-Source: AK7set+yhUnRnE75Evc8i1auRgI7JJDA5jtzXR/IRNFnYhUJFTbzGmu5u5QjdxQ2xDs3HZ4IWiAPWA==
X-Received: by 2002:a05:600c:3148:b0:3eb:3fea:a2ac with SMTP id h8-20020a05600c314800b003eb3feaa2acmr19973699wmo.22.1678368492706;
        Thu, 09 Mar 2023 05:28:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2926714wmo.2.2023.03.09.05.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 05:28:12 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 09 Mar 2023 14:28:03 +0100
Subject: [PATCH v3 12/12] arm64: defconfig: add PMIC GLINK modules
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v3-12-4c860d265d28@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v3-0-4c860d265d28@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable the PMIC GLINK core, altmode, battery and UCSI
aux drivers as module to enable USB Type-C management
over the PMIC GLINK protocol on modern Qcom platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7790ee42c68a..a925c9dc7f19 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -273,6 +273,10 @@ CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
 CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
+CONFIG_BATTERY_QCOM_BATTMGR=m
+CONFIG_QCOM_PMIC_GLINK=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_PMIC_GLINK=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
 CONFIG_EEPROM_AT24=m

-- 
2.34.1

