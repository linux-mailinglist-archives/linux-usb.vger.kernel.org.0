Return-Path: <linux-usb+bounces-2528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EF7E0BD7
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 00:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7697B21434
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 23:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384A250FE;
	Fri,  3 Nov 2023 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTgpT3Rg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367A25102
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 23:04:23 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8046D61
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 16:04:21 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507a5f2193bso2776135e87.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Nov 2023 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699052660; x=1699657460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QARkaW3YAHrIEHRWT+FmbK4DkLcRgyf7kmgHichP+rw=;
        b=MTgpT3Rg6tuTrojZiUBaLWZP9L0BrJQU892TTM2XqWMr0i7nwBM8dvXFL2NYfscZoz
         dsQnoW+EhK079IbANVxm9mXJm/Qku7uXr+dHVY8Zi5NhQDyKyOQ9Nd9nOVvWhbtyPD2e
         vyF2FuGl14L53lc0ypm+llIqK/KxNJ3xX2DCL2H1QlsBaQqwynrY+vPYCDNVSTeH7gYr
         Au9T3nRKHGASsUJy6+EZ1X2uRSxEJCdjPSnNkTYJKiaxoUTjY5Cf2WChIwqIQzruAqZB
         3pc0Geb1AEzs+XIujRoC8xfR5Duj5YWJTJAr009TA6ErIXfOw0PL0JRB7XnWgYwDnoyt
         6VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699052660; x=1699657460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QARkaW3YAHrIEHRWT+FmbK4DkLcRgyf7kmgHichP+rw=;
        b=f6N3I/a0eC+yx4xgLIUnG+t8PYkaSqhXThhfmTQttC50QrZ2F8WPRV01BDhZ6yuuB6
         W93cKrriPS+50TcVTLs8SIHmmQxvrWFhzIVnaVTeZnM8xG6FBz0ZTQGh4zZtbyFro5NM
         5+IQZoYIlyeASz3zkQEjnUMRmiz76GOuNtocci1IngoNfaGCmvT5uFKfs5dABM7EddhA
         xiq24lyP3R0vL4R/sgT3vjLDE8GwOnEeA1iAABAom1GuVwlBz+NkD8qXxZN86uB/9FIj
         oyyAzY26K3rLFK8x5fVyfDAVZbVAqZXz+MGa2lIFxVf/c8yh7vbyhz0Fz+XvzrnuYVLx
         /Ghg==
X-Gm-Message-State: AOJu0YxECOLRTSU+AgY6oecUv8GLYCwQp15plO0rEa619tItaVJQR8MP
	ozE3jJQIyKIb7Dlu2A4TbMz8CA==
X-Google-Smtp-Source: AGHT+IHxZ3SwBOE6PCX0jYjbOHiWg1mHD/29WBAeYOQpW39iEwAyMKXLx8WJMBpsaR9rgdUOupSWJA==
X-Received: by 2002:a19:8c41:0:b0:500:c00e:8f15 with SMTP id i1-20020a198c41000000b00500c00e8f15mr1391304lfj.16.1699052659811;
        Fri, 03 Nov 2023 16:04:19 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:04:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v6 5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
Date: Sat,  4 Nov 2023 01:03:08 +0200
Message-ID: <20231103230414.1483428-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
same functionality for the DRM bridge chain termination.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig              |  1 +
 drivers/soc/qcom/pmic_glink_altmode.c | 33 ++++++++-------------------
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index b3634e10f6f5..c954001ae79e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -86,6 +86,7 @@ config QCOM_PMIC_GLINK
 	depends on OF
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
+	select DRM_AUX_HPD_BRIDGE
 	help
 	  The Qualcomm PMIC GLINK driver provides access, over GLINK, to the
 	  USB and battery firmware running on one of the coprocessors in
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 6f8b2f7ae3cc..cb0db362447c 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -11,7 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
@@ -76,7 +76,7 @@ struct pmic_glink_altmode_port {
 
 	struct work_struct work;
 
-	struct drm_bridge bridge;
+	struct device *bridge;
 
 	enum typec_orientation orientation;
 	u16 svid;
@@ -230,10 +230,10 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 	else
 		pmic_glink_altmode_enable_usb(altmode, alt_port);
 
-	if (alt_port->hpd_state)
-		drm_bridge_hpd_notify(&alt_port->bridge, connector_status_connected);
-	else
-		drm_bridge_hpd_notify(&alt_port->bridge, connector_status_disconnected);
+	drm_aux_hpd_bridge_notify(alt_port->bridge,
+				  alt_port->hpd_state ?
+				  connector_status_connected :
+				  connector_status_disconnected);
 
 	pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);
 };
@@ -365,16 +365,6 @@ static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv
 	}
 }
 
-static int pmic_glink_altmode_attach(struct drm_bridge *bridge,
-				     enum drm_bridge_attach_flags flags)
-{
-	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
-}
-
-static const struct drm_bridge_funcs pmic_glink_altmode_bridge_funcs = {
-	.attach = pmic_glink_altmode_attach,
-};
-
 static void pmic_glink_altmode_put_retimer(void *data)
 {
 	typec_retimer_put(data);
@@ -464,15 +454,10 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->index = port;
 		INIT_WORK(&alt_port->work, pmic_glink_altmode_worker);
 
-		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
-		alt_port->bridge.of_node = to_of_node(fwnode);
-		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-
-		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
-		if (ret) {
+		alt_port->bridge = drm_dp_hpd_bridge_register(dev, to_of_node(fwnode));
+		if (IS_ERR(alt_port->bridge)) {
 			fwnode_handle_put(fwnode);
-			return ret;
+			return PTR_ERR(alt_port->bridge);
 		}
 
 		alt_port->dp_alt.svid = USB_TYPEC_DP_SID;
-- 
2.42.0


