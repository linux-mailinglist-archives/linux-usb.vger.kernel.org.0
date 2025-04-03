Return-Path: <linux-usb+bounces-22546-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E30A7B232
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 01:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18FB189B907
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 23:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19BF1D63C2;
	Thu,  3 Apr 2025 23:02:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1E1922FA
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 23:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743721347; cv=none; b=BETC3YKYLDStNu/vxa89WHbdgYKIFE4cLNJNjbtBgA9o4anbobsQBrX9WqUiy19q5WIoG+SJhQ3AXBcpG/09SUljaBcMh1uC94bu7e85CjyYL2cK0bGKElMPoYeI8VG9hTcxvfAgaRBd+v+oJZvFm2lit/paK/+gQpitFjJyP2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743721347; c=relaxed/simple;
	bh=5gz+IKOc8N3R2ZPRZ8QLjEQogRib4lDUx76Z0fGIaoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k4ANnHEP2gj8hOCXe54rwiM+8VaezbwPDNSGrXLGIiS1mEiykvnyO7Nn64ZP8HJO1lNtvT0/e1zsbQOv4ia12wK4U0MX56IFSLp4wHEOiM+DiAVKaUoy8OOohb11Fs/w68mcTTYi2rgmTXUIGcWsG5FL/G3peYGRRx8YlknMwYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0TZm-00020j-2a; Fri, 04 Apr 2025 01:02:22 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0TZl-003AlB-08;
	Fri, 04 Apr 2025 01:02:21 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0TZk-004d1L-3B;
	Fri, 04 Apr 2025 01:02:20 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 04 Apr 2025 01:02:20 +0200
Subject: [PATCH] usb: typec: mux: fsa4480: add regulator support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAHsT72cC/x3MQQqDMBBA0avIrDswpiONXqW4kDhpBxoNiYpFv
 LvB5Vv8f0CWpJKhqw5IsmnWeSqoHxW47zB9BHUsBkOmISbG8MNljupw+UdxGNYdfWa2hM/WML1
 8y94ylD4m8brf73d/nhfEvfVWawAAAA==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=5gz+IKOc8N3R2ZPRZ8QLjEQogRib4lDUx76Z0fGIaoE=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBn7xN8EiywtJhILSIHVsUv53/iqlpIIIdYB2VhW
 NasEmAvg9+JAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZ+8TfAAKCRC/aVhE+XH0
 q7ZwD/4u/xwXm3iubekHtT7RjkrbqscBQdjwM7EhYvz2WiFjNHTIcn2LBzCyHEZMagQuCSFPiW7
 1EBesBg9+KjkEy6byeiFYjxbREX7nTkADx/gXIDj8ryv30AYOzgDMQ5QKlmnzVXZpGWlb0JUEOd
 IlI9sB1XZdzaf2L26BFgwsugQfEHKDs5b4Rw/Df8/iTYAfdOF5iJ3O6RU35qWRXKk6kQq1EAakV
 U5iBqv/cdRpJ3QoJoiR0mR8YR3hLb7B2gVApPj0Hy33s+1oAQCYXW2z9LLrqYvYr9AXAsyZfbQf
 C0Nr7cCtCF9aW1BIP93UISavhVp2Z76Mxm1WzixU8MjwZ+bgO/x5l84ATHyB07SnUXnhAa1j4yv
 V9HTFTjqno8KE3OsFKHJnJywu0j04HNSLjj5i84tbfyry7TtQSxavCXYVrooNi/8ZwU3HuLD/jo
 uYDEq4fIXqb1Suapx6kAXQDXufU7BXwKKLQr3s7Dl2niM9tx1rSNeKOy0PTLeNpXHEhU3gDMC9e
 A6EWKMn+oVkDDBaZNSLKrIyw7iFS9PQazChJRYnsasvXUwOnLOt8wajI0H2zbsaw1oBk9M19GQS
 NGwB6JHIex7xOGfQ8GYVNnyTIzsEVDARMfO4Z1xwNpyl2WHzCrAvsVXojBxJ33U7jODzkUieX0t
 NTdVO0T7ull/yJg==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The fsa4480 vcc lane could be driven by some external regulator.
This patch is adding support to enable the regulator before probing.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/typec/mux/fsa4480.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index f71dba8bf07c9..c54e42c7e6a16 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -12,6 +12,7 @@
 #include <linux/regmap.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/regulator/consumer.h>
 
 #define FSA4480_DEVICE_ID	0x00
  #define FSA4480_DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
@@ -273,6 +274,10 @@ static int fsa4480_probe(struct i2c_client *client)
 	if (IS_ERR(fsa->regmap))
 		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize regmap\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "vcc");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "Failed to get regulator\n");
+
 	ret = regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
 	if (ret)
 		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");

---
base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
change-id: 20250404-ml-topic-typec-mux-fs4480-392407f94f84

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>


