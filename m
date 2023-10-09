Return-Path: <linux-usb+bounces-1290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D87BE87B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 19:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7972280F45
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073C438DFF;
	Mon,  9 Oct 2023 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBJuf/WV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC438DE1
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 17:40:55 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E747EE6
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 10:40:53 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so60236651fa.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Oct 2023 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696873252; x=1697478052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNCqTbw0TXx6mJa4XxFsJKPj+YzowxN9M1WKiAD3Akc=;
        b=QBJuf/WVZa4xJ9Bf0RM9/OnH3xRHxMd7pDv/ZpNsNaYj1TJNssFRFfEK8tfBA1Ecph
         e+hvUGqcZOv+WmkjDVgnel4SpLHDAQDgET/Q1TPIlcHWcoAp97MwID5vEgM/nSK7Wfcq
         6GXeknY4xPVfxT375Q+2U1351ytjw7rFYQ4+SrNpQv8lTo9u2ybYQheUmyIym28cUPJC
         yvr5mJPxoATnC6dN6woeFk4YcvKIAsblxvAvu+8+CsKBYoiU3Wt0QChm/HSmFg8U1tda
         AIxBnmtRyzPIPB51B6Vrmuni+n8A4tYIzC1AJhwpC8AmDcseUsTV9UMrCk5vIajz13E0
         lOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873252; x=1697478052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNCqTbw0TXx6mJa4XxFsJKPj+YzowxN9M1WKiAD3Akc=;
        b=f6Y6hYu19J32C38KQNy4QqLH2w9wbOhmj5BiUQtrhpN5Q7pmcBaWnKagQ1oZijs7mf
         q3lTMI7mlAlJxve78KeKqLNeX8vgGsXt0Feie21jMEDEdF16ueMBakxtp4xY1uwAH2x4
         EZ93G+m0h5wGikkjdaUVZogtEVt+v2A12ru2nssM3oTJvQwoXYLJ59QlgE9XHktuYTXO
         nUUDAJH5LIyCnf0TtHWKxdJrhEqC+T0dkQWigA5AzKGhr6tvt6jSlksHe5F/1gDXjaYm
         48ohy7DnIlfI/wA+NTQmBUe32T23wqGDt72pb1JxDh/J0IqWDlcELvvzBnsAhx/90ti9
         H+KQ==
X-Gm-Message-State: AOJu0YxDZcGVFWu8d7b1E/etj/9GqUvtzx1XHNHIBWctawy+g76YCZsv
	ioTGzgZAwJkBOGU5WOS2AL6pfA==
X-Google-Smtp-Source: AGHT+IFd3zAbVawrOZoSBNYmDde/LniLsk39R7NLQiYJ3/SMoBEYMa27+sX2ewYfUYKTGZviaiHkJA==
X-Received: by 2002:a2e:7d15:0:b0:2bb:b01a:9226 with SMTP id y21-20020a2e7d15000000b002bbb01a9226mr13615060ljc.7.1696873252113;
        Mon, 09 Oct 2023 10:40:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z5-20020a2e3505000000b002bcbae4c21fsm2128988ljz.50.2023.10.09.10.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:40:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Simon Ser <contact@emersion.fr>,
	Janne Grunau <j@jannau.net>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 3/3 RESEND] drm/bridge_connector: implement oob_hotplug_event
Date: Mon,  9 Oct 2023 20:40:48 +0300
Message-Id: <20231009174048.2695981-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
References: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 31 +++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 70582491d955..8239ad43aed5 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -5,6 +5,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_state_helper.h>
@@ -107,10 +109,9 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	}
 }
 
-static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
+					    enum drm_connector_status status)
 {
-	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
@@ -123,6 +124,21 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_connector_hotplug_event(connector);
 }
 
+static void drm_bridge_connector_hpd_cb(void *cb_data,
+					enum drm_connector_status status)
+{
+	drm_bridge_connector_handle_hpd(cb_data, status);
+}
+
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_handle_hpd(bridge_connector, status);
+}
+
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -191,6 +207,8 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 
+	fwnode_handle_put(connector->fwnode);
+
 	kfree(bridge_connector);
 }
 
@@ -216,6 +234,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
@@ -352,6 +371,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
+#ifdef CONFIG_OF
+		if (!drm_bridge_get_next_bridge(bridge) &&
+		    bridge->of_node)
+			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
+#endif
+
 		if (bridge->ddc)
 			ddc = bridge->ddc;
 
-- 
2.39.2


