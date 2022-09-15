Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8BFF5B9474
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 08:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiIOG36 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 02:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiIOG3p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 02:29:45 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D6F94EE8;
        Wed, 14 Sep 2022 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223358; x=1694759358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y0ZehfxrsLw0nxkn9kFuGZxK3j1l5W8LWS9DgXT3Upk=;
  b=FQnRGlHiXttC/o2bH8K7Q0hRzzXv7dcQ/EdIqpSjcHUG+9ZAh0K9Xwkx
   ELlCbTP/PTACxlY6J3GkwiCccwo5tc+jrK7j6o6RWWkO6S2nc44CMGAmG
   Ws8KS6ob+MmNGnQpXw31SIRFrAuVEUK5qd4NUST6JuZGW9FmWKMkcFITY
   6vPC5UPKoTL7oli4ueUK5P0d802dAel8+iUZjTZzF4Uh50uo/lWCJQwpB
   SPEE5JoqE/WTk11Kt1QTM58gnPHvAwwms3No+0OJw7hF2lAoQ/UB8PQRe
   GMbSVLTjG5uVhPhio4wQ0EsA509NhabCO7GV40QozbHdwC4UiHai4IIMM
   g==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189613"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Sep 2022 08:29:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 15 Sep 2022 08:29:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 15 Sep 2022 08:29:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223345; x=1694759345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y0ZehfxrsLw0nxkn9kFuGZxK3j1l5W8LWS9DgXT3Upk=;
  b=TDLR9/yQEfOwKIvDbUPLL2OYx49+6V+3+S3qRTlDlJ1tbdLxXS8BmTBt
   EFoGGM9XwDP0KcBMvCPnQrFhGV9+Wj9a8DlXa1xxPygyXAw5GhElteUn3
   qXmIDgbCCGT9Ad1rYY9kqbCGLVmxUGfNPvNFSjTsrS3cjtZxT1/mgRz8f
   Ns91UYoqsdFfNLCr1fN58yzykCTPa8qJv17ME6F5VYZmfWiE8oqHMZKkk
   YSEdsznV20J+0mUYTyZU9hzzz9QQ9kxvhABtrQNZ3zz8OaZ5tYIq37o8+
   Wg8jvUJ9cjE+tWfpqtvQP1tYeiQpk6Od9R09CfShb3SKKLLgfQc20Uq5s
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189612"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Sep 2022 08:29:05 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A30DA280072;
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
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
Date:   Thu, 15 Sep 2022 08:28:54 +0200
Message-Id: <20220915062855.751881-4-alexander.stein@ew.tq-group.com>
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

With this set the SOF/ITP counter is based on ref_clk when 2.0 ports are
suspended.
snps,dis-u2-freeclk-exists-quirk can be removed as
snps,gfladj-refclk-lpm-sel also clears the free running clock configuration
bit.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 504fd5f05395..d944ecca1b3c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1299,7 +1299,7 @@ usb_dwc3_0: usb@38100000 {
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb3_phy0>, <&usb3_phy0>;
 				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u2-freeclk-exists-quirk;
+				snps,gfladj-refclk-lpm-sel-quirk;
 			};
 
 		};
@@ -1341,7 +1341,7 @@ usb_dwc3_1: usb@38200000 {
 				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb3_phy1>, <&usb3_phy1>;
 				phy-names = "usb2-phy", "usb3-phy";
-				snps,dis-u2-freeclk-exists-quirk;
+				snps,gfladj-refclk-lpm-sel-quirk;
 			};
 		};
 
-- 
2.25.1

