Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9514B74C0A7
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jul 2023 05:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjGIDmV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jul 2023 23:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjGIDmR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jul 2023 23:42:17 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2B4E5
        for <linux-usb@vger.kernel.org>; Sat,  8 Jul 2023 20:42:16 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso50268101fa.0
        for <linux-usb@vger.kernel.org>; Sat, 08 Jul 2023 20:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688874135; x=1691466135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuK4zRTQtpemrtJQHlivu+9KOJF/i4juAvKU4fCYtbs=;
        b=sA+8HlTiTqDJZTtDglpA8b4/AIm2/r4HbV6YLCKxy4KQMN8jSI+p4pcnMsQmlFDlwL
         gb480YD1MUfAmtPeArJsnVpyG1TMf77WpkYB+1vtSy87fG65qc9+Qc2AkvdrwVshBUiD
         C6clyCgZqZ6WVwZMNl5a72c+8OWdFOXDY4CkheRJmubwRkm/hSjSUBMZH2cP1GINzeD0
         UrcfAJ5ypGDcPx/ocD0RQlc/gaaP5CODXurjiIUPCy49JYsRWdvJQEtDrjTcximg2k5l
         TxkMGwr1Pr1+bGSfv7xlA4NUo3GzO3c82yM2+AMXGvI20IgPvrURux/HbBVS8206jcMx
         2ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688874135; x=1691466135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuK4zRTQtpemrtJQHlivu+9KOJF/i4juAvKU4fCYtbs=;
        b=MqjrjJUEq7pIsOWIiLu3FwBB+pM34HgxM1rRQcNFwKvEeR+33G0mdvoMkD0teXpyFB
         g825dapYM4NtNBnseRnMlifktyjgGiNFLbhyU07wExRcPtSSaxCkNLLbreE72+cviNAB
         19OLpgz9tb3Q6o2SmK7+sKCGwkcxpVPkjNBPdJ9ftqleq8MZNCE0sJN88yeUSYqrkyJU
         4fSE1Z4J6T88hkenDXLVuMcr4b7Wxu58h/egpOCFD/O5PFxZgmGgYwMhctls78pnCMUU
         7JyeNEHA0mDSeWMG9RNfooRIH+gtUIIprd3Sytbh4LFLmMJd6Q5s9tLEix9LpJvgkcD4
         q1Og==
X-Gm-Message-State: ABy/qLYWuklMi8P7x/MEBAb3/7hXcXiHd/cs8vf8iHqBHg57cTimO47B
        AicwGE4IL6emeOG/9RAJgvXHSw==
X-Google-Smtp-Source: APBJJlFv0O8WZ+VPH1Ou8nrTgXdcBmf6HFZApHz5X21b8fVffVcQEGu1H6y+jckZ8DTwBaR4RSUfGQ==
X-Received: by 2002:a2e:969a:0:b0:2b6:dcde:b77f with SMTP id q26-20020a2e969a000000b002b6dcdeb77fmr7174439lji.35.1688874134831;
        Sat, 08 Jul 2023 20:42:14 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id y13-20020a2e9d4d000000b002b6d7682050sm1390289ljj.89.2023.07.08.20.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 20:42:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 3/3] drm/bridge_connector: implement oob_hotplug_event
Date:   Sun,  9 Jul 2023 06:42:11 +0300
Message-Id: <20230709034211.4045004-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709034211.4045004-1-dmitry.baryshkov@linaro.org>
References: <20230709034211.4045004-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 29 +++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 84d8d310ef04..364f6e37fbdc 100644
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
 	drm_kms_helper_hotplug_event(dev);
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
@@ -216,6 +232,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
@@ -351,6 +368,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
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

