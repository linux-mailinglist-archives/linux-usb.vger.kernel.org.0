Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834145B9472
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 08:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiIOG35 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 02:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiIOG3i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 02:29:38 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE5B8C03C;
        Wed, 14 Sep 2022 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223352; x=1694759352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nz3K58GYkjN1DFzET2mFu+DZKTsC6zB71nsZVaPjp1s=;
  b=BBe6vg0d06L0FV0jztUMN5a5PwNXWpOHDr/PdyP1lDm5+Ag+yG7mf2oe
   pkjoOdvIwkvySdN+Yjcx4E3e8S4xLaGmKEB7ysznDaVjHMmWv8xRPmdX7
   AG/JR5amqIUVK6rb8Wb1Gq6ex3/ohGM7n8k6yEyY5cmulCgTOgfJODU9n
   dHuI2XRY5T+PZ6e2KgLuota8YSa5kbHF0xU3ETayAwILL/14N6gRVqfgZ
   mOz2pKtu3WGmqds67ZfAQOOOUlDH5ULPJnq927oCfp5edUi2AgONCFvhg
   s1MjDG4PVpE160VUhWVzFzeyhVho8oDza4/hIwy4oS8I3YfGBXqgUI67z
   g==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189608"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Sep 2022 08:29:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 15 Sep 2022 08:29:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 15 Sep 2022 08:29:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223344; x=1694759344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nz3K58GYkjN1DFzET2mFu+DZKTsC6zB71nsZVaPjp1s=;
  b=TUQktTGJ3dwed0wxJRHNP8i64kG5vS1Ug9bJ8bd4qsz3JGfUUj8dCpq0
   VED91OGE8GJysLw+ce0HVzFTkZeCwNdwOmPzOR929StTTL+WqM1xhCMcv
   8kHvAZdOBno3NIEwk8RJyY8JyNyhz8wgSA6eSGwBNPI4paShAFtcvmj6d
   xoh224x9YfKLie7WC8Mkvxre/p2YD0Zs/CHFk7WKhj7uq8Rf81R8U/vkm
   Jba++GjNcYrQWICSRs5zDK+8Q5wVrQEIO7qDiMe9eR6j7u2qt57URsu/z
   TMtdvCptVWsqF1K3FSmUQzncOHBcW00lhZXPuk+PlTv2I0WoxMUThj4iA
   w==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189607"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Sep 2022 08:29:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 21E5D280072;
        Thu, 15 Sep 2022 08:29:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add gfladj-refclk-lpm-sel-quirk
Date:   Thu, 15 Sep 2022 08:28:52 +0200
Message-Id: <20220915062855.751881-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
References: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This selects SOF/ITP to be running on ref_clk.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1779d08ba1c0..2a54d0bb0b15 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -234,6 +234,11 @@ properties:
       avoid -EPROTO errors with usbhid on some devices (Hikey 970).
     type: boolean
 
+  snps,gfladj-refclk-lpm-sel-quirk:
+    description:
+      When set, run the SOF/ITP counter based on ref_clk.
+    type: boolean
+
   snps,is-utmi-l1-suspend:
     description:
       True when DWC3 asserts output signal utmi_l1_suspend_n, false when
-- 
2.25.1

