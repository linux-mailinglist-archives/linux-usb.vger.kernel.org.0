Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BDB6864CD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 11:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjBAKyH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 05:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjBAKyA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 05:54:00 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D46E05CD2C;
        Wed,  1 Feb 2023 02:53:57 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAF8E14BF;
        Wed,  1 Feb 2023 02:54:39 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CFF43F882;
        Wed,  1 Feb 2023 02:53:56 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v6 2/3] usb: musb: sunxi: add support for the F1C100s MUSB controller
Date:   Wed,  1 Feb 2023 10:53:47 +0000
Message-Id: <20230201105348.1815461-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201105348.1815461-1-andre.przywara@arm.com>
References: <20230201105348.1815461-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Icenowy Zheng <uwu@icenowy.me>

The suniv SoC has a MUSB controller like the one in A33, but with a SRAM
region to be claimed.

Add support for it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/usb/musb/sunxi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index 7f9a999cd5ff1..4b368d16a73ad 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -722,14 +722,17 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	INIT_WORK(&glue->work, sunxi_musb_work);
 	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
 
-	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb"))
+	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb") ||
+	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
 		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
+	}
 
 	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 
 	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb") ||
-	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb")) {
+	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb") ||
+	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
 	}
@@ -815,6 +818,7 @@ static const struct of_device_id sunxi_musb_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-musb", },
 	{ .compatible = "allwinner,sun8i-a33-musb", },
 	{ .compatible = "allwinner,sun8i-h3-musb", },
+	{ .compatible = "allwinner,suniv-f1c100s-musb", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_musb_match);
-- 
2.25.1

