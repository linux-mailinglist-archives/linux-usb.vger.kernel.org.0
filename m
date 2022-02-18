Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6954BBD2E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 17:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237603AbiBRQPy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 11:15:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237576AbiBRQPs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 11:15:48 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D232B2FC8
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 08:15:32 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0DAA04003C
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645200931;
        bh=eXTf6CI7XtqvYApoORACvc6rPyUPKkXor1yJtlktlDc=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=q8JH+mx0ZEKAm+LT0TpgTdfgGC2f2BsfEF0pdQZ1qiCetFcHX5IUivpa/Qxv1juyj
         U++5t+kVq4rxgzvsEgsIwiEeWZn9GVqtUoBdtpzOG7s2PwU1NvfR8rb7YWSQXbtUhd
         5aIYthhwHbyOjS792MqmVLfIKB8rjkt/YQt0PKgLDraUY0tsHjl3+gZyB7voLyaKoQ
         +VUR2hYY8FLbOBNVyawyHRWyVm5ooD28OfWeLCgq+HhOUhhVj49iQjWJFACCswZ38A
         06q/SobftYblfoe8Jquphy610SV4FvXjoX4vOlsMJjCyD1loIMKnU7vNE9DMyudivv
         tnz6VjL0sok8g==
Received: by mail-ej1-f70.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so3240989ejn.13
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 08:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eXTf6CI7XtqvYApoORACvc6rPyUPKkXor1yJtlktlDc=;
        b=crop64V9FBsb23ZalLYIBxc9dPcAyoTurbgG/8CDZ4dVMXD6F0KnjPmnYEPB8sFTgS
         LBlinpau+0BuDCWvcpK0PP5cYkuGE7/r6Nh7X7tAwbzQ1o8e7HATUy/7zCKmQcH/OjUB
         ko5dVG2e3eUxNThdu19try8HpflKWVUsdrroIBGjkBuCHZatZ4h/1a3QlxQfEBLuxnsj
         e5mLWX4nPa54qb+K6qVH7qlAyvXpFcJZOZh2Oqr0k3dZtX5iP2IX/V3Fp23aUlM3dWMa
         LM68Axf5aXeVNS3zJ+M7ETpOWxGD/H6jIETa1LcMcCvsdxFqTBKRl+jtZMS2Uexf5mgZ
         RZ4w==
X-Gm-Message-State: AOAM530DGMlTVzDz0SbaEAi8zwAh+YDuWGcGS4P/WTicarQZMqDt9gL8
        dYKLuRAI5jCeaWk63aXtzrImRkUTGTFqUg9/uWEXbztH33B3vhT5+BCuy/FiXWoALjy1ImNAIdo
        +gaM3llGh1Njf7XFFzfYmwfwA1tJ5wet+kgAEcQ==
X-Received: by 2002:a05:6402:1d8d:b0:408:4a31:9790 with SMTP id dk13-20020a0564021d8d00b004084a319790mr9100873edb.92.1645200930748;
        Fri, 18 Feb 2022 08:15:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdswzoYMv9GT1AsPyCy429Vy5ZKlXY8hiNZQFBnkjJI6JAvV6mE8WIdoqyTzwBSbyUSRKGRA==
X-Received: by 2002:a05:6402:1d8d:b0:408:4a31:9790 with SMTP id dk13-20020a0564021d8d00b004084a319790mr9100856edb.92.1645200930559;
        Fri, 18 Feb 2022 08:15:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id y21sm2325572ejq.185.2022.02.18.08.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:15:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: agilex/stratix10: add clock-names to USB DWC2 node
Date:   Fri, 18 Feb 2022 17:15:22 +0100
Message-Id: <20220218161522.52044-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220218161522.52044-1-krzysztof.kozlowski@canonical.com>
References: <20220218161522.52044-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB DWC2 requires clock-names:

  arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dt.yaml:
    usb@ffb00000: 'clock-names' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 1 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 3ec301bd08a9..d7d1918ae471 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -484,6 +484,7 @@ usb0: usb@ffb00000 {
 			resets = <&rst USB0_RESET>, <&rst USB0_OCP_RESET>;
 			reset-names = "dwc2", "dwc2-ecc";
 			clocks = <&clkmgr STRATIX10_USB_CLK>;
+			clock-names = "otg";
 			iommus = <&smmu 6>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index f4270cf18996..984c71b850c9 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -510,6 +510,7 @@ usb0: usb@ffb00000 {
 			resets = <&rst USB0_RESET>, <&rst USB0_OCP_RESET>;
 			reset-names = "dwc2", "dwc2-ecc";
 			clocks = <&clkmgr AGILEX_USB_CLK>;
+			clock-names = "otg";
 			iommus = <&smmu 6>;
 			status = "disabled";
 		};
-- 
2.32.0

