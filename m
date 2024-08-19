Return-Path: <linux-usb+bounces-13686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A16499577CC
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 00:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DF6E1F21ED1
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 22:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68021EB490;
	Mon, 19 Aug 2024 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cLXSIE7i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BE01E6758
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 22:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724107139; cv=none; b=kIzbIBLn3ffSrzdwsP4pN1zVydQp6vgMhkCp4Pl5e7SMTCf1p75alw/zdHg8rG5XHZlRnNwE86XlZxuiWn4agkAXb5cnsF2IV4wTYb4DS4C9CfRcpIndl0aBQ3GxNLIhxUMfDu9RADQ4moGasjtLloxlG9JrO+T3r03gJq55vC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724107139; c=relaxed/simple;
	bh=4V2ipobc0QJANgLcRKLlZNLcULLuLPLzgIJNP1W0OjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcbGMdIOpMaY+M2oeEtpUj+qPfM0dXd/ElTEKkio6/K2fdOglxz0/iZBTQO6H04qexeH83dQLKml3gFBEqh3y61cDYChiggbep1fhf0+TjJuOe38+jS/ZqeAZQ8EqCNcsalFcVWAbDTzMc73d6SfEg1+sjFNZ+iMjqBxnuWsH38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cLXSIE7i; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2021537a8e6so27598085ad.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 15:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724107137; x=1724711937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywA8OaX1lKwB+QkeZviPO0tfv2glr07Z2pzYI3lLnXA=;
        b=cLXSIE7i3A5rPEePFBioba0Q6cg5DedcUbRQ5Ep89kFgATSdN8YkOJM4JdTTwtfd3f
         eiYd8bZfUBVRYy7icKJ+tDidWF8qqiOGOhip+2q1xnsPopErGzT6bWwK9zzRqe1RgTBv
         AxgRQDdCl2eUsVeXopvwwoRugsApweDA7vcGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724107137; x=1724711937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywA8OaX1lKwB+QkeZviPO0tfv2glr07Z2pzYI3lLnXA=;
        b=eqJdw+8R0e+CH6FV2JKyqgfPtTyFYyEcZacrbum1na0Anqi5diNYt6Z/P/GK7azM1b
         cMItHvOM1+kyT1nu0yFOa97Q1P9s3HVv5FHaq0deJEXHaRy/4J65FqHQr0R+IzAW6bpQ
         Q5RHrqtCygyK29LnUqQWgSoplkNEHtpyAf3KkwbRb/8HL6IFLgeYzTxxX7JBRoXHYM48
         7yvJIWkYQqLkG56ppPE2S43sYAaNSf6eh89U6AaLttD0+aLSdxMAjVoQ6VE2bvdcXGHm
         0gltgJCsUSvKw1LXZ3SLSkd8oE7BSapLgw81+98qCYe7SWOYGCOjVDSZ7nE5ejrr7rxM
         v52w==
X-Forwarded-Encrypted: i=1; AJvYcCVoCpW7yQTyN2aDdhhVz/buBAqyzvH4XNpAY+lfaBf8b4lZ5Dvu0S2yP3zX4bA++xTdFF5cc/HJFhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzjfj2GG0Mk0cVq+ipiiXz/ALh/VTqHrr0IOPYXJA4uIQBzyRX
	c+Yx/qbFid5YsY3be1KDRorvZ3WfK9LmpC0sfAXklwNtDu6j/3bb9LJY0heiZQ==
X-Google-Smtp-Source: AGHT+IHU3fWl4J6FiNvoKYuzaU+U5zGX0CHN6uE8R8CkbVuBd7tiKsG0Va+2cgyvp5/pf3qE90i/nA==
X-Received: by 2002:a17:902:d503:b0:201:f5e3:e36d with SMTP id d9443c01a7336-20203ea05d2mr143563805ad.25.1724107136555;
        Mon, 19 Aug 2024 15:38:56 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-201f03b2874sm66740535ad.308.2024.08.19.15.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 15:38:56 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 09/17] drm/bridge: dp_typec: Allow users to hook hpd notify path
Date: Mon, 19 Aug 2024 15:38:23 -0700
Message-ID: <20240819223834.2049862-10-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819223834.2049862-1-swboyd@chromium.org>
References: <20240819223834.2049862-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch added support for no-hpd to drm_dp_typec_bridge code.
Allow users of this bridge to hook the HPD notification path of the
bridge chain so that they can be made aware of the connector status
changing. This helps HPD-less users of the bridge inject the HPD state
into their code by using the connector status as a proxy for HPD being
asserted or deasserted.

In particular, this will help Trogdor/Strongbad boards that need to read
the EC's analog mux which steers the DP signal to one or the other USB
type-c ports to figure out which type-c port has HPD asserted.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 30 +++++++++++++++++++++++++
 include/drm/bridge/aux-bridge.h         |  9 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index adafda4f128f..815dc026718b 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -92,6 +92,8 @@ struct drm_dp_typec_bridge_dev {
 	struct auxiliary_device adev;
 	size_t max_lanes;
 	size_t num_typec_ports;
+	void (*hpd_notify)(void *data, enum drm_connector_status status);
+	void *hpd_data;
 };
 
 static inline struct drm_dp_typec_bridge_dev *
@@ -323,6 +325,20 @@ devm_drm_dp_typec_bridge_alloc(struct device *parent, struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(devm_drm_dp_typec_bridge_alloc);
 
+/**
+ * drm_dp_typec_bridge_add_hpd_notify: Register a callback called when the
+ * bridge chain hpd state changes
+ * @hpd_notify: callback for bridge hot plug detect events
+ * @hpd_data: data passed to @hpd_notify callback
+ */
+void drm_dp_typec_bridge_add_hpd_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+					hpd_notify_fn_t hpd_notify, void *hpd_data)
+{
+	typec_bridge_dev->hpd_notify = hpd_notify;
+	typec_bridge_dev->hpd_data = hpd_data;
+}
+EXPORT_SYMBOL_GPL(drm_dp_typec_bridge_add_hpd_notify);
+
 /**
  * devm_drm_dp_typec_bridge_add - register a USB type-c DisplayPort bridge
  * @dev: struct device to tie registration lifetime to
@@ -362,6 +378,19 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 }
 EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
 
+static void drm_dp_typec_bridge_hpd_notify(struct drm_bridge *bridge,
+					    enum drm_connector_status status)
+{
+	struct drm_dp_typec_bridge_data *data;
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
+
+	data = to_drm_dp_typec_bridge_data(bridge);
+	typec_bridge_dev = to_drm_dp_typec_bridge_dev(data->hpd_bridge.dev);
+
+	if (typec_bridge_dev->hpd_notify)
+		typec_bridge_dev->hpd_notify(typec_bridge_dev->hpd_data, status);
+}
+
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     enum drm_bridge_attach_flags flags)
 {
@@ -519,6 +548,7 @@ static const struct drm_bridge_funcs drm_dp_typec_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.hpd_notify = drm_dp_typec_bridge_hpd_notify,
 };
 
 static int drm_dp_typec_bridge_orientation_set(struct typec_switch_dev *sw,
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 73fc8582ec07..300f4a203a9b 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -22,6 +22,8 @@ static inline int drm_aux_bridge_register(struct device *parent)
 
 struct drm_dp_typec_bridge_dev;
 
+typedef void (*hpd_notify_fn_t)(void *data, enum drm_connector_status status);
+
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
 struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np);
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
@@ -30,6 +32,8 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
 void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
 struct drm_dp_typec_bridge_dev *devm_drm_dp_typec_bridge_alloc(struct device *parent,
 							       struct device_node *np);
+void drm_dp_typec_bridge_add_hpd_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+					hpd_notify_fn_t hpd_notify, void *hpd_data);
 int devm_drm_dp_typec_bridge_add(struct device *dev, struct drm_dp_typec_bridge_dev *typec_bridge_dev);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
@@ -55,6 +59,11 @@ devm_drm_dp_typec_bridge_alloc(struct device *parent, struct device_node *np)
 	return NULL;
 }
 
+static inline void drm_dp_typec_bridge_add_hpd_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+						      hpd_notify_fn_t hpd_notify, void *hpd_data)
+{
+}
+
 static inline int devm_drm_dp_typec_bridge_add(struct device *dev,
 					       struct drm_dp_typec_bridge_dev *typec_bridge_dev)
 {
-- 
https://chromeos.dev


