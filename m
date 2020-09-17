Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5296226D440
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 09:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgIQHH0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 03:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgIQHAO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 03:00:14 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3B2C061351
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 00:00:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so797316wrm.2
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 00:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZG6N/rhNc2zEd0OmlssDRFgV4b5KjiPy9hIEmRV9zOc=;
        b=GVoDkghgcAlUKt8WnZ0zuyGHxFOF6iJbX0CkdJ7VSuHnfyB0eSkmYBJmJvknoWmN16
         W67hTuQ48S68jHaxzPwVVIfNmpEwkoQSUT+VWRyQEX4g+RDNfoS+wJ7nHegZ838E6JKO
         RO4T9m2u9wQybkMXV0I+cZUqNZ/lCmsSgyWOSiF45JI8c6fQffCao9QuIdIhrRoGTOkP
         7PiyoG3oz1C7hBbcp4POtOnEWC44Ptmtzb4RXImlH2Jov0oKcidiEN+TOIU9FV+AaiCk
         4BmiXKy7ZPY5P8V2hDihIKzLqvG0Sp2INBAqC72OYYVBlZ7oduR9EMFdVsgzA2rUGSsF
         fHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZG6N/rhNc2zEd0OmlssDRFgV4b5KjiPy9hIEmRV9zOc=;
        b=I7jmbTPCixTKWCP6r1eZfk8cTNVukgytazM+WaKNy1q7gkkVIb6KFsxq6yShQ6+U/y
         2zFOz4GDoV/U/lWA+5dgSmkOyXaBQs+a0Xtlng0qc6vlfzagflreEU7+tVtOzGyDdkCw
         dDd/7fwWu8ZNcbrjxcP/QbN59I7Pag1CjZJqBU4dY1XD8UwA3awkAC2zZRjO/xTXA0Ds
         MYBysOo8gdGD6bVK2uGGrBXR0CjX3+Jp3fwchUawTEp3FzyFnTYG9RryiPAvJ5uyGXjc
         E7pqLdyLG07Zi2xy/Q5D/BXj4FEKYCNwUE0miql0294gzuQGa05PNmaGVBsE33BMqPVA
         dVRQ==
X-Gm-Message-State: AOAM531RZl34i554SVWOdzrtk/zumc6Da943c5Km3K/vEdTR9gDRwxIS
        ddXcJCjh/Ju1ZnXKQ0xgucUQgQ==
X-Google-Smtp-Source: ABdhPJyKfXYnIS4ErZB/cswC92sAGdSNdhniNnIBWbPAMUoVrHd/CFYke/iib87+7iJgpTBeQrIDnA==
X-Received: by 2002:adf:e989:: with SMTP id h9mr32555878wrm.38.1600326003291;
        Thu, 17 Sep 2020 00:00:03 -0700 (PDT)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.17.00.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:00:02 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, balbi@kernel.org,
        martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 3/5] usb: dwc-meson-g12a: Add support for USB on AXG SoCs
Date:   Thu, 17 Sep 2020 08:59:47 +0200
Message-Id: <20200917065949.3476-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917065949.3476-1-narmstrong@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Amlogic AXG is close to the GXL Glue but with a single OTG PHY.

It needs the same init sequence as GXL & GXM, but it seems it doesn't need
the host disconnect bit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 1f7f4d88ed9d..784e7eafc9ce 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -127,6 +127,7 @@ static const char *meson_g12a_phy_names[] = {
 /*
  * Amlogic A1 has a single physical PHY, in slot 1, but still has the
  * two U2 PHY controls register blocks like G12A.
+ * AXG has the similar scheme, thus needs the same tweak.
  * Handling the first PHY on slot 1 would need a large amount of code
  * changes, and the current management is generic enough to handle it
  * correctly when only the "usb2-phy1" phy is specified on-par with the
@@ -215,6 +216,19 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
+static struct dwc3_meson_g12a_drvdata axg_drvdata = {
+	.otg_switch_supported = true,
+	.clks = meson_gxl_clocks,
+	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
+	.phy_names = meson_a1_phy_names,
+	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
+	.setup_regmaps = dwc3_meson_gxl_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_gxl_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_gxl_set_phy_mode,
+	.usb_init = dwc3_meson_g12a_usb_init,
+	.usb_post_init = dwc3_meson_gxl_usb_post_init,
+};
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -930,6 +944,10 @@ static const struct of_device_id dwc3_meson_g12a_match[] = {
 		.compatible = "amlogic,meson-gxm-usb-ctrl",
 		.data = &gxm_drvdata,
 	},
+	{
+		.compatible = "amlogic,meson-axg-usb-ctrl",
+		.data = &axg_drvdata,
+	},
 	{
 		.compatible = "amlogic,meson-g12a-usb-ctrl",
 		.data = &g12a_drvdata,
-- 
2.22.0

