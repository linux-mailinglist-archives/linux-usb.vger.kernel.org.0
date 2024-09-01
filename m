Return-Path: <linux-usb+bounces-14434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE829674BB
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 06:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D657E1F21E94
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 04:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36703B29D;
	Sun,  1 Sep 2024 04:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XosWRfMy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C00513B586
	for <linux-usb@vger.kernel.org>; Sun,  1 Sep 2024 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163640; cv=none; b=dA0lp95UL+FC8ic1oqTAG+FTc4hATTvODVpq3U+d3799WfXx6dxCMmxDsyl8QttdKsA+2+zG5jNwlr+zkPH/glK3OYxshhXNkzwwLhaPyY7K4aHZ9UToCvaMizh2aoPg8HGyexb8vsnilSogRruYy5hm3dXHspdJ28wC7tqIw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163640; c=relaxed/simple;
	bh=qY6RFdgdEz4w9jQTLOHoc3XmVl5kjOyodlnHhwG34MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8NA3M63M6zbrmaf7xp3fgeyQ9FwJzucYq9TCHL2piOCmdFLL9i4UtxojQ5wLCZfrc+puYMut+hzW/nxKtXGQ5a70Q4XxXEW6eJBHXkz5jWyIMcKkBnSfLei4RIAH+SGs9kJQfl7QOWKrqL1RarYm/OaqES11Rw/k8777Gu5U9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XosWRfMy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20536dcc6e9so11102465ad.2
        for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 21:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725163637; x=1725768437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnT+TkOPiwvRqtG4XdBzNIXwEpZ2e3WbsaKfU3N0MOw=;
        b=XosWRfMy30FNjhHcntK0aamG16FStgjIk2sbxV07QZARrI1n/vWg1aB4t4LuC+1A2Z
         6c8dWkr/eLO/FzqvkWNhVz4JWe/UwzOGU8KJS6U7wEPz1WkMTrHEltba5fxTWDBiD1M+
         LNFY9UZv/PXJELNBF2s5Gl2guENOdT4m+mcGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725163637; x=1725768437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnT+TkOPiwvRqtG4XdBzNIXwEpZ2e3WbsaKfU3N0MOw=;
        b=YtbRbFQqV7+Bv13CeCWlLEczY5tOomhSjjalr9oOEeIoKl1TN3wJ5TEGEsdt+mFCSQ
         HP2l0VH8CF3yUTy5lsw+QxLC64jNfcZWNAlRGJkrSoDkAj+ya3dVB0KaSeByMJviLqel
         arGc3qUpXcI87CBIpxREL94lzpngaftBXFT3LPZP1Yqp6Yo8AhmsmcFQ83FIql0ITy27
         8lawwZsD0rnA9pXLxx6p7FgIbQGg++5esVH+xNThPZCbNNdAa1kE8sryuP0xwAlTCW+j
         JtRFEQXlK/U17oNBfRA2P6pfAbHkflkFLuzuxv7koYaPwZ5I6JZcwDfH13n0JtFaK0hZ
         KqPA==
X-Forwarded-Encrypted: i=1; AJvYcCXUdASSrmx+GAhwbatImG4lpDgwcbU7CpxmcxKPr++OOJuy6ij7U7HWr7nu90AE1Ax9z/pAAdVltPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC5FgA7hwoEHRvIAwaj7aMhFEOzHH6jiZmuJ53OXKzGq0pUn7r
	z6BzVrPlyQpW4msi9rGKH2NnFvZJc7PWreBaPHr9ciPN1MmMcUF8H/nuk6mkMw==
X-Google-Smtp-Source: AGHT+IFy6qneRh0JJN2K30z3cDl+DrJ4fLZ39NN7FVzA1lAH0njyn66SGUGcS/pbvoFHuvYriZC5zA==
X-Received: by 2002:a17:903:1209:b0:1fa:1dd8:947a with SMTP id d9443c01a7336-2050c40deccmr100312495ad.46.1725163637193;
        Sat, 31 Aug 2024 21:07:17 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-205152b12c7sm46853475ad.56.2024.08.31.21.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 21:07:16 -0700 (PDT)
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
Subject: [PATCH v4 07/18] drm/bridge: dp_typec: Support USB Type-C orientation
Date: Sat, 31 Aug 2024 21:06:45 -0700
Message-ID: <20240901040658.157425-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register an orientation switch for each type-c output node to support
flipping the lane mapping when the port is in reverse orientation. Only
do this when the orientation-switch property is present. This is mostly
useful for the case where the DP lanes are directly connected to the
usb-c-connector and the device doesn't have an orientation switch wired
down on the board between the connector and the DP controller.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 77 +++++++++++++++++++++----
 1 file changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 32565f88ade7..d2832e6481d7 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -47,12 +47,16 @@ struct drm_dp_typec_bridge_data;
 /**
  * struct drm_dp_typec_bridge_typec_port - USB type-c port associated with DP bridge
  * @lane_mapping: Physical (array index) to logical (array value) USB type-C lane mapping
+ * @orientation: Orientation of USB type-c port
  * @mode_switch: DP altmode switch
+ * @orientation_switch: USB type-c orientation switch
  * @typec_data: Back pointer to type-c bridge data
  */
 struct drm_dp_typec_bridge_typec_port {
 	u32 lane_mapping[NUM_USB_SS];
+	enum typec_orientation orientation;
 	struct typec_mux_dev *mode_switch;
+	struct typec_switch_dev *orientation_switch;
 	struct drm_dp_typec_bridge_data *typec_data;
 };
 
@@ -378,17 +382,35 @@ static int dp_lane_to_typec_lane(enum dp_lane lane)
 	return -EINVAL;
 }
 
-static int typec_to_dp_lane(enum usb_ss_lane lane)
+static int typec_to_dp_lane(enum usb_ss_lane lane,
+			    enum typec_orientation orientation)
 {
-	switch (lane) {
-	case USB_SSRX1:
-		return DP_ML3;
-	case USB_SSTX1:
-		return DP_ML2;
-	case USB_SSTX2:
-		return DP_ML0;
-	case USB_SSRX2:
-		return DP_ML1;
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NONE:
+	case TYPEC_ORIENTATION_NORMAL:
+		switch (lane) {
+		case USB_SSRX1:
+			return DP_ML3;
+		case USB_SSTX1:
+			return DP_ML2;
+		case USB_SSTX2:
+			return DP_ML0;
+		case USB_SSRX2:
+			return DP_ML1;
+		}
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		switch (lane) {
+		case USB_SSRX1:
+			return DP_ML0;
+		case USB_SSTX1:
+			return DP_ML1;
+		case USB_SSTX2:
+			return DP_ML3;
+		case USB_SSRX2:
+			return DP_ML2;
+		}
+		break;
 	}
 
 	return -EINVAL;
@@ -413,6 +435,7 @@ drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev
 				u32 conf,
 				struct drm_dp_typec_bridge_typec_port *port)
 {
+	enum typec_orientation orientation = port->orientation;
 	enum usb_ss_lane *lane_mapping = port->lane_mapping;
 	struct auxiliary_device *adev = &typec_bridge_dev->adev;
 	struct drm_aux_hpd_bridge_data *hpd_data = auxiliary_get_drvdata(adev);
@@ -448,7 +471,7 @@ drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev
 		typec_lane = lane_mapping[typec_lane];
 
 		/* Map logical type-c lane to logical DP lane */
-		dp_lanes[i] = typec_to_dp_lane(typec_lane);
+		dp_lanes[i] = typec_to_dp_lane(typec_lane, orientation);
 	}
 
 	return 0;
@@ -496,6 +519,23 @@ static const struct drm_bridge_funcs drm_dp_typec_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 };
 
+static int drm_dp_typec_bridge_orientation_set(struct typec_switch_dev *sw,
+					       enum typec_orientation orientation)
+{
+	struct drm_dp_typec_bridge_typec_port *port;
+
+	/*
+	 * Lane remapping is in drm_dp_typec_bridge_mode_switch_set(). Whenever
+	 * an orientation changes the mode will switch in and out of DP mode,
+	 * HPD will deassert and reassert so that
+	 * drm_dp_typec_bridge_atomic_check() sees the proper state.
+	 */
+	port = typec_switch_get_drvdata(sw);
+	port->orientation = orientation;
+
+	return 0;
+}
+
 static int
 drm_dp_typec_bridge_mode_switch_set(struct typec_mux_dev *mode_switch,
 				    struct typec_mux_state *state)
@@ -544,7 +584,9 @@ drm_dp_typec_bridge_probe_typec_ports(struct drm_dp_typec_bridge_data *typec_dat
 	struct drm_dp_typec_bridge_typec_port *port;
 	size_t num_ports = typec_bridge_dev->num_typec_ports;
 	struct typec_mux_desc mode_switch_desc = { };
+	struct typec_switch_desc orientation_switch_desc = { };
 	struct fwnode_handle *fwnode;
+	bool orientation = of_property_read_bool(np, "orientation-switch");
 	const char *name;
 
 	port = devm_kcalloc(dev, num_ports, sizeof(*port), GFP_KERNEL);
@@ -587,6 +629,19 @@ drm_dp_typec_bridge_probe_typec_ports(struct drm_dp_typec_bridge_data *typec_dat
 			return PTR_ERR(port->mode_switch);
 		}
 
+		if (orientation) {
+			orientation_switch_desc.set = drm_dp_typec_bridge_orientation_set,
+			orientation_switch_desc.fwnode = fwnode;
+			orientation_switch_desc.drvdata = port;
+			orientation_switch_desc.name = name;
+			port->orientation_switch = typec_switch_register(dev,
+									 &orientation_switch_desc);
+			if (IS_ERR(port->orientation_switch)) {
+				kfree(name);
+				return PTR_ERR(port->orientation_switch);
+			}
+		}
+
 		kfree(name);
 		port++;
 	}
-- 
https://chromeos.dev


