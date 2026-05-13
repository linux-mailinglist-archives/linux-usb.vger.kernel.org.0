Return-Path: <linux-usb+bounces-37384-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLl6KumEBGrVKwIAu9opvQ
	(envelope-from <linux-usb+bounces-37384-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:04:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74E534A4F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5B0235040A6
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618753F411B;
	Wed, 13 May 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Ih1ArHji"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3E3F4135
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679804; cv=none; b=OwgWp+ViF7njXQUNBTD3hEsxSldeEGeV06EhasKiHiL0RCczidEXTWRPT9oSdSUPEJnLC17/NhhCW99sNzGUVi6pBWhCHy4FlHxaRK5zVAtysNdBTQBtAEXytN9Q1wEU/7/OPcNoVEfxUP9ZxtebnqxX79uZfye6MgJ7ooOMn6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679804; c=relaxed/simple;
	bh=tr2ESAIzJ6yhJ/0fE6tII3PLo1xmjUXum+LDUQzpEws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QuKILt7FWluQ+pl/5yuypWzmqMOz8cNaCs9XZmQPbuGHisXYVcFEF8UM/tFdysjxP32XHSb52LdrogiHSLKB4tRpnQtnrF39BrUWfgGZ51Nz0sLCDylgn397uksVobwAfz61Ysa1Q2uCXe36ow7FWQAJA/3ByJbsJQmXYtpnyDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Ih1ArHji; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so30240325e9.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1778679802; x=1779284602; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eW4+ZGhAwVH3SDz4zpFmqSn6d/etYAQ93M+0Gp+S2WE=;
        b=Ih1ArHjidedUPAqVslcV5PFokuwdWTzrnmGdSHPj/TyDCYephab/a0ErSv7aqlzhgS
         1nFwmd0/e5bq3xpnHQpYPYxm1TuybITY1h3hngQStlFr5enavafmJpfeqTupEC9NyA2q
         kTTDSL5oz/EoWhYYeznahdIX6z4Yixv9/s/z7pl3nD4EAECE84hFZBBlkKdIBlutSQ5I
         vrN0TGM2NW3963zdL/upgNU2JUj9kUmSVdDN9xW0Gxcy4+FAkTU1tJVDW3gKNssr7ct1
         V+c9NDMjnoEDzpEmhQV1DNxrNg9OoHPgZJPUOr7LIKHaSn5A0r52oso0OqJ1EKVt8h0Z
         R4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679802; x=1779284602;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW4+ZGhAwVH3SDz4zpFmqSn6d/etYAQ93M+0Gp+S2WE=;
        b=UyqkV2jPX8JztsF4f5rFbKVnfQtBgU/abWhjOL5PbuZMcD54LTMBZ3N7Euy7nL+5/Z
         9vIkmduLTOzIowl8ONRvjbDpO/UuOkHAGt4AjGugYwLZF9D/agf31g9PH0HZGG8uM/rv
         BY9pRW5Yl5o1/Eq6POILco7AJKcCOakmQbqCSBJxxMiX71HOGBOGYrPEQRcjU35RyuTP
         R4kbES173e8s6oJXc++JhgKw03p/csl870uIWbX8z/ilxEo+wI99PKpCWae+dU6gT4gw
         OESILP89/D2Y8EHmkwOwlw62w5b0+dyZ4013EMJyG8J20mVhbrauNEpj+bilbj2lsMns
         cy9Q==
X-Gm-Message-State: AOJu0Yz3ZGsJz6OkvGh5jtmFVoy5wA1uNeyoAlXvcfXLK6WVAUt2ngaa
	oXVMs/vMXrLdLPQ5oSvwu+wrWNTqwM/+UGkGeJ3ljOP0G+6oRbRMV9e5y1bsUWRYIxA=
X-Gm-Gg: Acq92OHdaAIh3MC7gYx+AdpknDf+LRC/lVhcuAc/yMHLk5HNL34s95LG6V3ndoHYO8G
	q6PNK3e7K4UXSpohO2YTbGFtUojVdL+ZHsUj5mz2irgjFiGqIFuf8urSgvGkgCsUev/CsmNn3yh
	hsR5+UZ25myz0VTggQYOLRVQKCg9JCULLYc/93BrE2k332Rohyd7jmouEJGrn4Wnkfns7ib8iXz
	Dl+BC0AZanEW6EvnV9bgAe+xAoS2/Jlq18cGTkvisatQ7Au2oOwnK3HiPRx14Z/HU9mIsa2c30v
	8bQuE+UoAq2FDhXIFuCfsb4DWNZ4Sjo1s7REmApsINHWASF4aSoolZeGBbiAHWEOuNue4rhos77
	hmT/ZLcBiVnm+ges2GdrhVeADgfmxzNC2r89R33o4hoD+z2dx7Z+XI1s+hOLWfMzdu4nDnL7Fjl
	UkSCe1paOuvHdizgXKASjPMKwNQe++HwFJW6p/LfH+alItcrC4UEFsjP01ZOCHAWWm7EGN7qMx7
	lpATTrI
X-Received: by 2002:a05:600c:350f:b0:48e:8741:fd4c with SMTP id 5b1f17b1804b1-48fce9ead8fmr42055595e9.18.1778679801732;
        Wed, 13 May 2026 06:43:21 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-83-110-135-253.alshamil.net.ae. [83.110.135.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fcdf6408bsm55887265e9.3.2026.05.13.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:43:21 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 13 May 2026 17:43:16 +0400
Subject: [PATCH] usb: typec: tcpci: add DRM DP HPD bridge support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-tcpci-drm-bridge-v1-1-1467e770727d@flipper.net>
X-B4-Tracking: v=1; b=H4sIAPN/BGoC/x2MywqAIBAAfyX2nKDZQ/qV6FDuVnvIYo0IpH9PO
 g7DTIJIwhShLxII3Rz5CBlMWYDfprCSYswMla5a3RirLn96Vii7moUxe3TorauxM0SQs1No4ed
 fDuP7fk97k6ViAAAA
X-Change-ID: 20260513-tcpci-drm-bridge-d8dc384d71ee
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339; i=alchark@flipper.net;
 h=from:subject:message-id; bh=tr2ESAIzJ6yhJ/0fE6tII3PLo1xmjUXum+LDUQzpEws=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSx1H+PO/9mql+f3NmEfxvvhmU0rrC6kL1mC8u3Mv20R
 YpqJ44u6JjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCq93kx/M9OyIq48vv/opVthm98GK/s3MLl0emdrbPTJXz1B19tk4uMDLc32pn
 ztDCpPPvZH+uhrr3y9puiwmcl837bK2/dd0XzIh8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Rspamd-Queue-Id: EC74E534A4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37384-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[flipper.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flipper.net:email,flipper.net:mid,flipper.net:dkim]
X-Rspamd-Action: no action

Add support to use TCPCI based USB-C connectors with the DP AltMode
helper code on devicetree based platforms.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/Kconfig |  2 ++
 drivers/usb/typec/tcpm/tcpci.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 00baa7503d45..53abde8ebef9 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -13,7 +13,9 @@ if TYPEC_TCPM
 
 config TYPEC_TCPCI
 	tristate "Type-C Port Controller Interface driver"
+	depends on DRM || DRM=n
 	depends on I2C
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	select REGMAP_I2C
 	help
 	  Type-C Port Controller driver for TCPCI-compliant controller.
diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0148b8f50412..e6cccbd377f7 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -5,6 +5,7 @@
  * USB Type-C Port Controller Interface.
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -837,6 +838,7 @@ static int tcpci_parse_config(struct tcpci *tcpci)
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 {
+	struct auxiliary_device *bridge_dev;
 	struct tcpci *tcpci;
 	int err;
 
@@ -889,12 +891,23 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	if (err < 0)
 		return ERR_PTR(err);
 
+	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpci->dev, to_of_node(tcpci->tcpc.fwnode));
+	if (IS_ERR(bridge_dev))
+		return ERR_CAST(bridge_dev);
+
 	tcpci->port = tcpm_register_port(tcpci->dev, &tcpci->tcpc);
 	if (IS_ERR(tcpci->port)) {
 		fwnode_handle_put(tcpci->tcpc.fwnode);
 		return ERR_CAST(tcpci->port);
 	}
 
+	err = devm_drm_dp_hpd_bridge_add(tcpci->dev, bridge_dev);
+	if (err < 0) {
+		tcpm_unregister_port(tcpci->port);
+		fwnode_handle_put(tcpci->tcpc.fwnode);
+		return ERR_PTR(err);
+	}
+
 	return tcpci;
 }
 EXPORT_SYMBOL_GPL(tcpci_register_port);

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-tcpci-drm-bridge-d8dc384d71ee

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


