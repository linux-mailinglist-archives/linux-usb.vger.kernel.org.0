Return-Path: <linux-usb+bounces-37484-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACCVCa3iBmrVogIAu9opvQ
	(envelope-from <linux-usb+bounces-37484-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B874554C0B1
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E7FD30891AF
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE6C43637E;
	Fri, 15 May 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XlhjQUpa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE28429833
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835747; cv=none; b=A3QkwJFP4yyTt1dywXATaMj5q910V+vvS4/spnX1S0X8uM+bz+EzZ3NILUa6HiqKLtmuBQlOfh76A+JJoYgE8e9v7V+7BqlC6qt2I65nZMBOvAopPytWeqnT/ZWUdmWuZZFWzc90d5RV1qhzObOWWjUOqP+x9DGQfr4fMqqZcnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835747; c=relaxed/simple;
	bh=ThZbiS1vJdpqqF5s9c83K6xjiqLVYZz844wOEk97YQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9Ly3INdUyhfzyKbj07tjfd8VCZt+xIhBw6YnxPU2d7fo5BY91qE2Rd6tJPX/ONYsZrABCdh7ND5tLH9AZXsXvsl2LN/mGtRjOsaRKSElTMxxwMQNhBCX5vhwg/l/c0xoO1kv+uXEyyrh+NGSe/GxhNcwKo/yk0jD2ATILqVyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XlhjQUpa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-365d8e43759so319793a91.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835745; x=1779440545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5s0xfmF/GQtBdazhqko0ifwn84a9WWF/9AOtLNrAd4=;
        b=XlhjQUpaJFI97ZjAaeRMQTINqRBWk2ijtS/8RsoQwASSs3ACilaYIuHm0KcipNSibT
         GQrmF3/0a2jHgaaEFe5bmKwA+8Tmxf4LjaDiLa7vdXD4nCoUusIXHLLPmkjBavK0sU74
         m0jV5fSJQoYP1Vf++g5Oat9B6/FSlTy+41nno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835745; x=1779440545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5s0xfmF/GQtBdazhqko0ifwn84a9WWF/9AOtLNrAd4=;
        b=XCjlgSVVKXbV3pmmx9bJMlvNIuZ0ZAO0hftrSAPrP73Sifz7ib9hG5KMLOhWq/eYQ8
         U7bz1wtAz5VrlLaSJzV8mf19qQTAv5y4BYtuG4FZvK++sCBa4Phx1T56mNogq2RM2zt3
         Pof9Wy7FhPegyO7S31KF795pdZbRPELxNh82f6sZ/O1Wl4pMBT7ML2xYDm0hwgNNg3cZ
         YJbA18b1lkGQ5vQ4l3ZvAKqyS7T2iyky4umSrHber1ZOSZXWUBogl5Dr/VJ5OS2CoFsA
         X66G4zW8V7QALrcCMaYg7RLGR/ZqZ/WmKnrgnP5ce5pX+b1kQS9Ga6TR2jriT8mJ64+z
         uoiA==
X-Forwarded-Encrypted: i=1; AFNElJ+jzAfwUoUNaIRFyBKels3VQ3x0GQ/0HP0j+qp59UYi270AYgMN+Ax1+iKE8SDxrf5BXO02PC0cGcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJwncnuIvGxxdTykxWgNOJg4cbExqYlm087/zXyPQGc+KMvvy
	JBwf/g56nxJEYb0u8YdaMhGJvj71+1sCJdTbMiYCKdQ9Mes/IuwEnvGNZUqICAqifw==
X-Gm-Gg: Acq92OEwksmBalipb8Egl6+MeX379mgVFRWP6iuqD9NzVhGDkpi7Rj5Q9ZbyZqOtfrc
	NuMhvOB1cybAMD0Xb9E81CFCMlaj4uI5djaU+D8NiZgvOHETfGvOYDL1Y8juiy2ygkVT9kHMCQp
	mGhw48Wo841xoqJLzGibUldAArlQ3IV3+GU/Gw4iq2cULNY/z768ZlpjeTTf9Kd5G/hVqtV74ud
	olZruEZwNRuR2XSQJW+lkvnvoBqQ5d8VW9MfO2eaMdrBErtYKt7B80xffyAJVj3E72YBNkmG98J
	Qlp7cz6oDagBFBPXJ9JCAz3OXaDgUyzQ680ZaxgeOiX6B13tzV+ABkw21c/pJTOKPe9VombkttJ
	R2n6JLS0XbYRxX/fODWgUh9EDgRbPqNwYYhPCD0Opgt7bNwUgRF9E03LOwpP/QqDHxoL8wOZee7
	VBuo2168Rt6+ZPvH1XL6LDBcrJsewFPC5DpYuX5UxZ4BprAhzjAVUgp21Z4UuP2+jBIs2ozDzpe
	xcXcl7IE03I0Vcu2ds=
X-Received: by 2002:a17:90b:134b:b0:35f:bb17:39f with SMTP id 98e67ed59e1d1-36923318fc5mr6642779a91.1.1778835744858;
        Fri, 15 May 2026 02:02:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key connectors
Date: Fri, 15 May 2026 17:01:41 +0800
Message-ID: <20260515090149.3169406-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B874554C0B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37484-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The new M.2 E-key connector can have a USB connection. For the USB device
on this connector to work, its power must be enabled and the W_DISABLE2#
signal deasserted. The connector driver handles this and provides a
toggle over the power sequencing API.

This feature currently only supports a directly connected (no mux in
between) M.2 E-key connector. Existing USB connector types are not
covered. The USB A connector was recently added to the onboard devices
driver. USB B connectors have historically been managed by the USB
gadget or dual-role device controller drivers. USB C connectors are
handled by TCPM drivers.

The power sequencing API does not know whether a power sequence provider
is not needed or not available yet, so we only request it for connectors
that we know need it, which at this time is just the E-key connector.

The feature is limited to OF platforms, since the connection is over an
OF graph. And it doesn't make sense to return an error when the power
sequencing framework is not enabled, as that would block all USB
devices. Therefor the function short circuits out if any of these
conditions happen.

Also, this is not implemented in the onboard USB devices driver. The
power sequencing API expects the consumer device to make the request,
but there is no device node to instantiate a platform device to tie
the driver to. The connector is not a child node of the USB host or
hub, and the graph connection is from a USB port to the connector.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c  | 17 ++++++++++++-
 drivers/usb/core/hub.h  |  2 ++
 drivers/usb/core/port.c | 54 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 90ea597d42ae..4165f71e212b 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -31,7 +31,9 @@
 #include <linux/minmax.h>
 #include <linux/mutex.h>
 #include <linux/random.h>
+#include <linux/of_graph.h>
 #include <linux/pm_qos.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/kobject.h>
 
 #include <linux/bitfield.h>
@@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 {
 	int ret;
 
+	if (set)
+		ret = pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
+	else
+		ret = pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
+	if (ret)
+		return ret;
+
 	if (set)
 		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 	else
 		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
-	if (ret)
+	if (ret) {
+		if (set)
+			pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
+		else
+			pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
 		return ret;
+	}
 
 	if (set)
 		set_bit(port1, hub->power_bits);
@@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..6039e5f5dcd7 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -85,6 +85,7 @@ struct usb_hub {
  * @port_owner: port's owner
  * @peer: related usb2 and usb3 ports (share the same connector)
  * @connector: USB Type-C connector
+ * @pwrseq: power sequencing descriptor for the port
  * @req: default pm qos request for hubs without port power control
  * @connect_type: port's connect type
  * @state: device state of the usb device attached to the port
@@ -104,6 +105,7 @@ struct usb_port {
 	struct usb_dev_state *port_owner;
 	struct usb_port *peer;
 	struct typec_connector *connector;
+	struct pwrseq_desc *pwrseq;
 	struct dev_pm_qos_request *req;
 	enum usb_port_connect_type connect_type;
 	enum usb_device_state state;
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..2d09037fee93 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,11 +7,14 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
+#include <linux/of_graph.h>
 #include <linux/pm_qos.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/component.h>
 #include <linux/usb/of.h>
 
@@ -28,6 +31,9 @@ static bool usb_port_allow_power_off(struct usb_device *hdev,
 	if (hub_is_port_power_switchable(hub))
 		return true;
 
+	if (port_dev->pwrseq)
+		return true;
+
 	if (!IS_ENABLED(CONFIG_ACPI))
 		return false;
 
@@ -748,6 +754,32 @@ static const struct component_ops connector_ops = {
 	.unbind = connector_unbind,
 };
 
+static struct pwrseq_desc *usb_hub_port_pwrseq_get(struct usb_device *hub, int port1)
+{
+	struct device_node *node = dev_of_node(&hub->dev);
+	struct device_node *np __free(device_node) = NULL;
+
+	if (!IS_ENABLED(CONFIG_OF))
+		return NULL;
+
+	if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
+		return NULL;
+
+	if (!of_graph_is_present(node))
+		return NULL;
+
+	np = of_graph_get_remote_node(node, port1, -1);
+	if (!np)
+		return NULL;
+
+	if (!of_device_is_compatible(np, "pcie-m2-e-connector")) {
+		dev_dbg(&hub->dev, "remote endpoint %pOF not m2 connector", np);
+		return NULL;
+	}
+
+	return pwrseq_get_index(&hub->dev, "usb", port1);
+}
+
 int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
@@ -801,10 +833,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		goto err_put_kn;
 	}
 
+	port_dev->pwrseq = usb_hub_port_pwrseq_get(hdev, port1);
+	if (IS_ERR(port_dev->pwrseq)) {
+		retval = PTR_ERR(port_dev->pwrseq);
+		dev_err_probe(&port_dev->dev, retval,
+			      "failed to get power sequencing descriptor\n");
+		goto err_put_kn;
+	}
+
+	retval = pwrseq_power_on(port_dev->pwrseq);
+	if (retval) {
+		dev_err_probe(&port_dev->dev, retval, "failed to enable power\n");
+		goto err_put_pwrseq;
+	}
+
 	retval = component_add(&port_dev->dev, &connector_ops);
 	if (retval) {
 		dev_warn(&port_dev->dev, "failed to add component\n");
-		goto err_put_kn;
+		goto err_pwrseq_off;
 	}
 
 	find_and_link_peer(hub, port1);
@@ -842,6 +888,10 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	}
 	return 0;
 
+err_pwrseq_off:
+	pwrseq_power_off(port_dev->pwrseq);
+err_put_pwrseq:
+	pwrseq_put(port_dev->pwrseq);
 err_put_kn:
 	sysfs_put(port_dev->state_kn);
 err_unregister:
@@ -858,6 +908,8 @@ void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 	peer = port_dev->peer;
 	if (peer)
 		unlink_peers(port_dev, peer);
+	pwrseq_power_off(port_dev->pwrseq);
+	pwrseq_put(port_dev->pwrseq);
 	component_del(&port_dev->dev, &connector_ops);
 	sysfs_put(port_dev->state_kn);
 	device_unregister(&port_dev->dev);
-- 
2.54.0.563.g4f69b47b94-goog


