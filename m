Return-Path: <linux-usb+bounces-34488-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF8yN2lTsGmBiAIAu9opvQ
	(envelope-from <linux-usb+bounces-34488-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 18:22:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A702557AB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 18:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 463393028C03
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 17:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450E33C9EF2;
	Tue, 10 Mar 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="baNT5FHc"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F540DFB9;
	Tue, 10 Mar 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163057; cv=none; b=O3LK81jHqb3tw3tLHTYZEswJb1lSi7cfDRhUS20D6/VmjTucGmpTl+25axhO46ocxgxhjBHFQrE/t0GI//gQHUP4PNN3WAAz8cwNgcqOKdB1U9boQywSn+Y1Teb+hytaWZ4kqOIBbmCzq4j4i6zYIAWe56lFGJcPUqlPRCoCFsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163057; c=relaxed/simple;
	bh=Z+61i1KejLDU448AmtfkHV2MHfpFo0pJbhwF4WeIFa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jnqox0ogBDFbauu6flkNIv/arCvBJDLWRwMWdgtEhPd6qJyUw5wOzEUb/NutNA8xpl/Pco/KXDuiE1adQDzzeGfymUqfA9NDpxOEYGlq8lZV+b8dlVLCub0r7RNNWHYMDS+MHshjMkX2qbpQwtrPLxqoY5GgKMs2Lu2LZTxqRAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=baNT5FHc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773163054;
	bh=Z+61i1KejLDU448AmtfkHV2MHfpFo0pJbhwF4WeIFa8=;
	h=From:Date:Subject:To:Cc:From;
	b=baNT5FHcGYQvzbWr4fA+mL7nul/7k6CTns8vws5uOC6tQAtAH67WcAvkisoKfxbc7
	 +jgeLdFZB5//49cOM9/EVjOhM6D57VUEwldos2QZRD5iN28uofysskTtrak5riKS2J
	 hHFRy7VtHFKMhbrbkUlZlqxhbCtku66Ol+mAASVSXkbhb0ESK/7vziU7WNGzaPx/Ka
	 Vg2foqNcDuQyM2MgRXLty58X1/m77mSXVbmb1QkxVSw1NIY7nZd/AWADhYZGPpuOnx
	 CJ/Y7oQx/luwQEVj/SKbhdG1KC1aa+iHX5UkWPiUnwWU9dKVq/thOn42yWYTZ8BBMs
	 WlJ6TVlOrzisQ==
Received: from jupiter.universe (dyndsl-091-248-208-051.ewe-ip-backbone.de [91.248.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABD8A17E0454;
	Tue, 10 Mar 2026 18:17:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3FF72480026; Tue, 10 Mar 2026 18:17:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Mar 2026 18:17:34 +0100
Subject: [PATCH] usb: typec: fusb302: add DRM DP HPD bridge support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-fusb302-drm-dp-hpd-bridge-v1-1-ffd41ef9afe3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAC1SsGkC/x2MQQrDMAzAvlJ8rsFNoLB9pfSQxM7iw7rgsFEI/
 XvDjgJJHZqYSoPn1MHkp00/x4BlniCVcLwElQeDI7eSXwjzt0VPDtneyBVLZYymPESivKZHkOR
 DhNFXk6zn/73t13UDF1heyWsAAAA=
X-Change-ID: 20260310-fusb302-drm-dp-hpd-bridge-00f6c9aec3ab
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3411;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Z+61i1KejLDU448AmtfkHV2MHfpFo0pJbhwF4WeIFa8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmwUi6RX9Y2kI5UcNWkOw+LFMowoDZsd7JWD
 cLvu2vdPAV1x4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpsFIuAAoJENju1/PI
 O/qaSqwP/2d/oJKYnkiUCntWVEn4FcewQ9e8bW5QXqfdF4ggKGAYIT5lrJlCTIeLGnlgvsaZWGK
 RNa98ZYWBk3qMaSMfzv3vZPFEojsrgsjBcxC77xtTheruCcjSj1U3Wsg3M/cfyW6g09nMDrhwNU
 hgnlw5KukvQU5wWzwcqWRPWtsNV/Cuj+sdP1Zu6yahf5YCdfB87QxtV4ukcVgiM+io/r8jlYBxq
 Q+eYpkp0Pgx2fgEDGdTObzhjZUBBUiHdIQVT+sp9pEKp2i7IwurDyVa8GggaKY6EZIDDpgxBfI9
 r77yOGVnmsizystV3UOGmAyzCwjpcZIYUJYH8Kv0G03xXFvJ1T2nqsCszjMZ2c4fwbut50CBsyO
 4IYyELzPe5yhX9pCDTaNLX8uPZWjHz7giXZ5AgX2AkjHroen9BFve24gKgEtSCkNPsSDvszlg+3
 3yrcnXoxyo26wEJwkJIQI/0q++em3LIemF8sfc0g0qgsMucqos8QU3BINQuHnJ1b6G320HAm+Ho
 uqxeSipfsZWfokMOahnf6o0wpswyOuaY45pkwmoch87LDdINL1Ga8spyhss6fvdWIGLZc4+0SY9
 gVVF7ruer9GJ2ZwaltWIjrs5/YrQdTu4Mu4gYx62NR9N8MPTOsiYVmA4PijYJLwaqYUtC2hUs67
 MvkiM0MqDV2j+YunxMPkoEA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Queue-Id: 14A702557AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34488-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.22:email,collabora.com:dkim,collabora.com:email,collabora.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,2ac50000:email,2b010000:email]
X-Rspamd-Action: no action

Add support to use fusb302 based USB-C connectors with the DP altmode
helper code on devicetree based platforms. To get this working there
must be a DRM bridge chain from the DisplayPort controller to the USB-C
connector. E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
	refcount: 7
	type: [10] DP
	OF: /soc/dp@27e40000:rockchip,rk3576-dp
	ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
	refcount: 4
	type: [0] Unknown
	OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
	ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
	refcount: 5
	type: [10] DP
	OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
	ops: [0x4] hpd

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
To make this usable on Rockchip RK3588 and RK3576 platforms as shown in
the commit message, the Designware DP driver and the USBDP PHY driver
also need changes. Those are being send separately as the fusb302 patch
can be merged completley independently.
---
 drivers/usb/typec/tcpm/Kconfig   |  2 ++
 drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 8cdd84ca5d6f..00baa7503d45 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -58,6 +58,8 @@ config TYPEC_FUSB302
 	tristate "Fairchild FUSB302 Type-C chip driver"
 	depends on I2C
 	depends on EXTCON || !EXTCON
+	depends on DRM || DRM=n
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  The Fairchild FUSB302 Type-C chip driver that works with
 	  Type-C Port Controller Manager to provide USB PD and USB
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 19ff8217818e..ce7069fb4be6 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -5,6 +5,7 @@
  * Fairchild FUSB302 Type-C Chip Driver
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -1689,6 +1690,7 @@ static int fusb302_probe(struct i2c_client *client)
 {
 	struct fusb302_chip *chip;
 	struct i2c_adapter *adapter = client->adapter;
+	struct auxiliary_device *bridge_dev;
 	struct device *dev = &client->dev;
 	const char *name;
 	int ret = 0;
@@ -1747,6 +1749,13 @@ static int fusb302_probe(struct i2c_client *client)
 		goto destroy_workqueue;
 	}
 
+	bridge_dev = devm_drm_dp_hpd_bridge_alloc(chip->dev, to_of_node(chip->tcpc_dev.fwnode));
+	if (IS_ERR(bridge_dev)) {
+		ret = PTR_ERR(bridge_dev);
+		dev_err_probe(chip->dev, ret, "failed to alloc bridge\n");
+		goto destroy_workqueue;
+	}
+
 	chip->tcpm_port = tcpm_register_port(&client->dev, &chip->tcpc_dev);
 	if (IS_ERR(chip->tcpm_port)) {
 		fwnode_handle_put(chip->tcpc_dev.fwnode);
@@ -1764,6 +1773,10 @@ static int fusb302_probe(struct i2c_client *client)
 	enable_irq_wake(chip->gpio_int_n_irq);
 	i2c_set_clientdata(client, chip);
 
+	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
+	if (ret)
+		return ret;
+
 	return ret;
 
 tcpm_unregister_port:

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260310-fusb302-drm-dp-hpd-bridge-00f6c9aec3ab

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


