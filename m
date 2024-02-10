Return-Path: <linux-usb+bounces-6190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2F4850302
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 08:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942671F23106
	for <lists+linux-usb@lfdr.de>; Sat, 10 Feb 2024 07:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB23374F6;
	Sat, 10 Feb 2024 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TyjwoXwY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE75364A8
	for <linux-usb@vger.kernel.org>; Sat, 10 Feb 2024 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707548988; cv=none; b=QF6WWnVxaTd+BcMi1u1z1zrrmQ2KyBL+r+hmWMqsLLQ8HvTyeyaZkPlMyPIHLEY/uDStiKTOL8BLWt2i5SwKwqq1NHHfQj9apz0vGexIqe+YKHtKty6u5ymuz6VKeM+anONDjRRmVORP34p/pvR/vfmFgT9Bs/Wmkd9C7jUbQdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707548988; c=relaxed/simple;
	bh=W4vZ4x3CP8SVyUrgLk7eS968yXX65ZHvPF7MpQkPKkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mY4OITogNCFXseEAr2oXP9wKhmBou3BwGMGbzNI9jsKiwz5KNFZIPEe4LcOpAgYBL3r+12Ca9qz4ZT+zz/Z0/rkPNYQHHGcQQQuUEehtUFytZveBQPnVwjkYfjI1nWkDCbkNHKT9ZGFo2oWVVku26ng+RrBlrBKfQcmLAsTaFtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TyjwoXwY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d73066880eso15192815ad.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Feb 2024 23:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707548986; x=1708153786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkD+zP+NWB9AGWV79+gv+/kfpMf3rGsHXh6c/wyG7zI=;
        b=TyjwoXwYgnd5orU7V6QnnN2OS9KYbnGH+gVPPF7XRwWQuAc1FxMfwBXZBSJlJqNOLt
         c/11weyUy7oAyNbewcfYDqSTc2Jm+hMKYn2qePF8ny7grKTi1ws/OLrkYKrm0mIKkoKF
         CTY+ov395mLQWmuFmGG5A/cd5od+1l16RwWwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707548986; x=1708153786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkD+zP+NWB9AGWV79+gv+/kfpMf3rGsHXh6c/wyG7zI=;
        b=nyxULyIgbGGFfBRfxqWox7quj0SHeiUp39htfdGkV4Rp9eidCfPbRswhsYj7o/dydT
         G97XV5La6G0pBLBM7b2E/3W7Oyais5YC/3pgq3N8DOrCcIR739WgG5DuFNom2gAIpXGH
         QM/3rP7ahLO9kiXcLs8mPOqQacG2pbiF+Y3Hg1YCsspNywroRohxmkz2mX1niiU3j8xQ
         dfqRHEGYVSSSWoAkn7Z+RorLruBYE9MSSKcUMir2QYb6NXagp07dP8gHA4h157JZK44p
         FRfvmarQshuakdurOLTmtReKTxUomBmZ2Tag7Y2xg7McgirW98ls6B28sCUU2uL+93vF
         OcOg==
X-Gm-Message-State: AOJu0Yx+ZL6jwx1fTLFxojvZcgQQJC9gYweqevFwdFenWgeyaE18Sndm
	XF10CfA9XlbK5o0O0AbtS+GaKs/JxGKn8mGAEE1Hh3HlnI6S1sk0D+J0ro889A==
X-Google-Smtp-Source: AGHT+IE/c8pAa5MU1KCu70BaKjPYC9gLrHaGU87OjcL/070j/D4osq6hs+au4elV+2dq4cOgocJ5RA==
X-Received: by 2002:a17:902:be14:b0:1d9:a609:dd7e with SMTP id r20-20020a170902be1400b001d9a609dd7emr1710601pls.55.1707548986273;
        Fri, 09 Feb 2024 23:09:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWI/ch18h9Q0LqkhYI9qvNSPXFKaQ+zZTw5iEWVutGXC3kUt5cSlLojPVIjctJzLIWli2TuZoulZ+xv5+4F5cm7BXzU7J5caPmQUVkQv44C6fgnze1u2LBEoJf8sgUoniTVtWZLh4LZvZ8AJIM0I7jYhvtvTaaRqt3PeoJmmTByxWzuN7Ik8fhGlYmoSGsGpd5UHFVZ9L0sCnLiMBuFuKlczas0/e64Cxru+iSkN39jwppcmC1t0TpWb8QRmt0LqsNfljAZTuKdWjvhzbz2EhmN/NRUdJVChHtcwqwPFitd97FaAVr1uzBS7oqnZruWzoFzq9fZSmAWd+ZAMD5jmNYZCDrPho+8AiRsCrSChYF0TsCKV8fj15RoxF6c8Rql53xnKG6zFvg2TN2LT5wAkXlr7HPGiA0ZcDk=
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id s7-20020a170903320700b001d9b749d281sm2493240plh.53.2024.02.09.23.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:09:45 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	linux-usb@vger.kernel.org,
	maciek swiech <drmasquatch@google.com>
Subject: [PATCH 04/22] usb: core: Set connect_type of ports based on DT node
Date: Fri,  9 Feb 2024 23:09:15 -0800
Message-ID: <20240210070934.2549994-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a USB hub is described in DT, such as any device that matches the
onboard-hub driver, the connect_type is set to "unknown" or
USB_PORT_CONNECT_TYPE_UNKNOWN. This makes any device plugged into that
USB port report their 'removable' device attribute as "unknown". Improve
the connect_type attribute for ports, and in turn the removable
attribute for USB devices, by looking for child devices with a reg
property or an OF graph when the device is described in DT.

If the graph exists, endpoints that are connected to a remote node must
be something like a usb-{a,b,c}-connector compatible node, or an
intermediate node like a redriver, and not a hardwired USB device on the
board. Set the connect_type to USB_PORT_CONNECT_TYPE_HOT_PLUG in this
case because the device is going to be plugged in. Set the connect_type
to USB_PORT_CONNECT_TYPE_HARD_WIRED if there's a child node for the port
like 'device@2' for port2. Set the connect_type to USB_PORT_NOT_USED if
there isn't an endpoint or child node corresponding to the port number.

To make sure things don't change, only set the port to not used if
there are child nodes. This way an onboard hub connect_type doesn't
change until ports are added or child nodes are added to describe
hardwired devices. It's assumed that all ports or no ports will be
described for a device.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: <linux-usb@vger.kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: maciek swiech <drmasquatch@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/core/port.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index c628c1abc907..622b8ada157c 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -9,6 +9,8 @@
 
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/pm_qos.h>
 #include <linux/component.h>
 
@@ -696,7 +698,10 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct device_node *np, *child, *ep, *remote_np, *port_np;
 	int retval;
+	enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
+	u32 reg;
 
 	port_dev = kzalloc(sizeof(*port_dev), GFP_KERNEL);
 	if (!port_dev)
@@ -708,6 +713,38 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		return -ENOMEM;
 	}
 
+	np = hdev->dev.of_node;
+	/* Only set connect_type if binding has ports/hardwired devices. */
+	if (of_get_child_count(np))
+		connect_type = USB_PORT_NOT_USED;
+
+	/* Hotplug ports are connected and available in the OF graph. */
+	if (of_graph_is_present(np)) {
+		port_np = of_graph_get_port_by_id(np, port1);
+		if (port_np) {
+			ep = of_graph_get_endpoint_by_regs(np, port1, -1);
+			if (ep) {
+				remote_np = of_graph_get_remote_port_parent(ep);
+				of_node_put(ep);
+				if (of_device_is_available(remote_np))
+					connect_type = USB_PORT_CONNECT_TYPE_HOT_PLUG;
+				of_node_put(remote_np);
+			}
+		}
+		of_node_put(port_np);
+	}
+
+	/*
+	 * Hard-wired ports are child nodes with a reg property corresponding
+	 * to the port number.
+	 */
+	for_each_available_child_of_node(np, child) {
+		if (!of_property_read_u32(child, "reg", &reg) && reg == port1)
+			connect_type = USB_PORT_CONNECT_TYPE_HARD_WIRED;
+	}
+
+	port_dev->connect_type = connect_type;
+
 	hub->ports[port1 - 1] = port_dev;
 	port_dev->portnum = port1;
 	set_bit(port1, hub->power_bits);
-- 
https://chromeos.dev


