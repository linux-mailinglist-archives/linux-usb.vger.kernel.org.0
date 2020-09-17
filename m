Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF0626D40F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 09:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIQHAe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 03:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgIQHAF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 03:00:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644B6C06178A
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 00:00:01 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g4so785830wrs.5
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 00:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oigsqv0xbxJDh4+eGFiginHqxJGGsS0Gt9+VPZlYuXQ=;
        b=v5O1H2h6BVXGNsYCO40bSXSDq67Ti1aqleKcmx7yLpmjrNUwAbQuoh6o8SY7NiN6Ft
         OTMp+x4/0+h9qtLiuvKerU6ydbeqLUn/q3JooBmjEDxIEHcpxK6Aet6cn+uRwln7C3j0
         bCXqKgHuHIclcZrWk9oT8sn7MA7VxhHNOx7qUvz5WLxySxpVeUsKLBaKAu1FLEoqAj2N
         ZaSlaSbfSrxGQ0dYtT+FPhRtJjbZKVdWQZUC/72l7sdEYyhtngTNzjj/cqY1jzubnC18
         Wjex2HPwO377L8EMzV3EF3c682H7VQeqlxWtDICzkqMbV/ZGqk5STrvVBkxsqoSdgrKh
         6QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oigsqv0xbxJDh4+eGFiginHqxJGGsS0Gt9+VPZlYuXQ=;
        b=S7mS6xeGLLhgZbABLp4sLnRZ9nyHQj1wXTy5dmAM5ijccll4D2IVRzrd/ioUH2ONV9
         XIFJTT3XZgYPmvzGemVvmLVt6NySek/d3ozaRra4vsiu0R+7ihIXx1rmVvlRE05xe0em
         DGCJgi4u3f7R46O5Gc/WBod75fi771p7+FO0xA8CxsukJaUHRyHlc7Z8TL2v+hG8q7GN
         N01QybyuEHlhFkxZ84oRYCVFJQIXxCjrBGqLbiAyq4ODRmTQmsNup29Pf30kGMdeCibK
         pdQ8/iIyi2c2tjMfqqCatyG8pQw6lUL2vJBQcLCBjTOa4AIsC65wQfMMRl2Lo9f1jU7X
         oFyQ==
X-Gm-Message-State: AOAM533b1IEdaw8c/Ued9uowa1TS981po4yNftWWcULFlwYCwTCMM16G
        z4H+0XZgX9BzjTY/XXlhnDFWUm+wHKLlL+sB
X-Google-Smtp-Source: ABdhPJwdpYaxpEzla+mW1BFwvftTJkMtrrj8tK9SVmXuIkteWyr7bm3xB0VQlP2vXnpLyQHxtJaVGA==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr31792797wrp.187.1600325999780;
        Wed, 16 Sep 2020 23:59:59 -0700 (PDT)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.16.23.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 23:59:58 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, kishon@ti.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 1/5] phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in Host mode
Date:   Thu, 17 Sep 2020 08:59:45 +0200
Message-Id: <20200917065949.3476-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917065949.3476-1-narmstrong@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order to keep OTG ID detection even when in Host mode, the ID line of
the PHY (if the current phy is an OTG one) pull-up should be kept
enable in both modes.

This fixes OTG switch on GXL, GXM & AXG platforms, otherwise once switched
to Host, the ID detection doesn't work anymore to switch back to Device.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 43ec9bf24abf..6e862ea60d8f 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -158,7 +158,8 @@ static int phy_meson_gxl_usb2_set_mode(struct phy *phy,
 				   U2P_R0_DM_PULLDOWN);
 		regmap_update_bits(priv->regmap, U2P_R0, U2P_R0_DP_PULLDOWN,
 				   U2P_R0_DP_PULLDOWN);
-		regmap_update_bits(priv->regmap, U2P_R0, U2P_R0_ID_PULLUP, 0);
+		regmap_update_bits(priv->regmap, U2P_R0, U2P_R0_ID_PULLUP,
+				   U2P_R0_ID_PULLUP);
 		break;
 
 	case PHY_MODE_USB_DEVICE:
-- 
2.22.0

