Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B754D8BA6
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 19:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243761AbiCNSV1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 14:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243727AbiCNSV0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 14:21:26 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF49735865
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:15 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ADE9740028
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282014;
        bh=fp8gzCHSAGGAhHxY8/ZkxcekCduFjxC+Ysw+LEh4qoM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=BExsAhYZgcKHoao29q5wOLXprN/vGcigf/rb5Ft3Hn06gfilxYl2Sk+AgQ5h0/fKf
         8oDLav2rWdoS6lqaz++d7PLAIiE+yDB7PHq0mSkpUnlhmCxONfQal5SMHa2ZO79Hf5
         uLUbp50wr8kMuuFu24h4Om+1X9LcsaSIeqKIaiwBuoONTbcOcmjhv84Q25P4bcJH5E
         zfCodh5cAww/By5E75BT3u7ML3Fn7TQ4QnwI1Evc/rvXNHtXHtLwMP7j/FV55adNSY
         3Pfaip+4+zuecXOTTUTnPeyzWtBQfwA9CwxeKiQnGAJnxnZmR/Y10Z5PfU9J4tg2JQ
         B2x6G7PgH2Dyg==
Received: by mail-ed1-f71.google.com with SMTP id i5-20020a056402054500b00415ce7443f4so9274642edx.12
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 11:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fp8gzCHSAGGAhHxY8/ZkxcekCduFjxC+Ysw+LEh4qoM=;
        b=awRaKgCmx6xuzkZFh0e8ezxJTOQXLiBhwaA7Os1x9fvpkXYm6eCh2Qc4TfC0J40kck
         U6kimy/avBdHCChR7o8Z/VJbmn34KktJV1mJU2Gvb/N+qBMDHGfylikfK2JIuxn5TB5o
         I7+YtU8dfZdrZ8eBJV7Tc7bTFhHGk7T5z4fcaPpFOTBSBVFhTNNIPBRupxeJ9y0NDhmi
         XPcXRWbMHEMMeivMkJm5G1TjJ3W7va9jB23gjW5QnYsUF8qF/GuaswJ4TSnkYZ7WwQLH
         z7YYetTCEb+qN0M1hMsCvFneUn6RoVGda5kd3ucqtcs4LCXFIylzYTkT25arO3CvQS1l
         2KEw==
X-Gm-Message-State: AOAM532daC9vI3flmhqHKFMzMj/YdsgKJYOWhEM7KJcnASUhha/RxYhW
        hJdy9/nkP/SgKVi1YQhS1QROvmZ3MNcZCLgfOW4jQ8D8e4vSxs0jbl1szJ8+QeZ+vbu7muwCXnh
        yZ2STF3+uDiKyCVEaKCEFn2RniknLmZKDxII6cQ==
X-Received: by 2002:a05:6402:5cb:b0:415:e04a:5230 with SMTP id n11-20020a05640205cb00b00415e04a5230mr22004452edx.352.1647282013441;
        Mon, 14 Mar 2022 11:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfJEfoRq9Vs7yHaKY2O3oU3VWB2UJaMc03+F75wKvACaBfz72jl5h/d9vBhLJ488DLA/DFXg==
X-Received: by 2002:a05:6402:5cb:b0:415:e04a:5230 with SMTP id n11-20020a05640205cb00b00415e04a5230mr22004429edx.352.1647282013219;
        Mon, 14 Mar 2022 11:20:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/5] ARM: dts: s5pv210: Use standard arrays of generic PHYs for EHCI/OHCI device
Date:   Mon, 14 Mar 2022 19:19:46 +0100
Message-Id: <20220314181948.246434-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Move USB PHYs to a standard arrays for S5PV210 EHCI/OHCI devices. This
resolves the conflict between S5PV210 EHCI/OHCI sub-nodes and generic USB
device bindings.

Suggested-by: Måns Rullgård <mans@mansr.com>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index a7aca54832d9..4ea1e638432a 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -434,14 +434,9 @@ ehci: usb@ec200000 {
 			interrupt-parent = <&vic1>;
 			clocks = <&clocks CLK_USB_HOST>;
 			clock-names = "usbhost";
-			#address-cells = <1>;
-			#size-cells = <0>;
+			phys = <&usbphy 1>;
+			phy-names = "host";
 			status = "disabled";
-
-			port@0 {
-				reg = <0>;
-				phys = <&usbphy 1>;
-			};
 		};
 
 		ohci: usb@ec300000 {
@@ -451,14 +446,9 @@ ohci: usb@ec300000 {
 			interrupt-parent = <&vic1>;
 			clocks = <&clocks CLK_USB_HOST>;
 			clock-names = "usbhost";
-			#address-cells = <1>;
-			#size-cells = <0>;
+			phys = <&usbphy 1>;
+			phy-names = "host";
 			status = "disabled";
-
-			port@0 {
-				reg = <0>;
-				phys = <&usbphy 1>;
-			};
 		};
 
 		mfc: codec@f1700000 {
-- 
2.32.0

