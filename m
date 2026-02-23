Return-Path: <linux-usb+bounces-33548-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD6mM4k6nGlCBgQAu9opvQ
	(envelope-from <linux-usb+bounces-33548-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:31:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3342C1758AD
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC800309345F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8807362137;
	Mon, 23 Feb 2026 11:27:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A8336167A
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846070; cv=none; b=lvCGdnHQd4J68hPRNO0+DKptct7dNJ0AyzD7BzjDQA656Bs7gul1ubiS6vEWV+/8f4fVSrYDQuqUdTcAHERj5JvDyYbhZ+rUx8uUuvZY7tZPUY1cR2eCkjpRC/Q2IoBVDVAh/BZXEBV5XUwY/Qx8kMhko2SaJbx/N14MRzriPgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846070; c=relaxed/simple;
	bh=lpw5HGx1Ps1o3mWsL+UrALhOcYvde4wFeFOH4IdFpmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6JoAEqbVPTjz7xCbctWaeCAsxi4SCegpmNSKk8sklD8j4N6E8JDFxLb4x2XYdWra5UX+M6jMYt9LIllj017/BJWA+VIjTTgZp2H9X9gaDqSqBW9EnygA3rkV0xwgwn6N6PMQWta7clS8GLhSdYAawdcvZCyH2CFySGHrHVtffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vuU6C-0007VH-6E; Mon, 23 Feb 2026 12:27:36 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 23 Feb 2026 12:27:34 +0100
Subject: [PATCH v5 1/4] usb: port: track the disabled state
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33548-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.875];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 3342C1758AD
X-Rspamd-Action: no action

The disable state isn't tracked at the moment, instead the state is
directly passed to the hub driver. Change this behavior to only trigger
the hub if a state change happened. Exit early in case of no state
changes but don't return an error.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/core/hub.h  | 2 ++
 drivers/usb/core/port.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a325d63e01b0deb59a1853d2b13c8d5..297adf2c6078809ca582104f228e5222c464f999 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -97,6 +97,7 @@ struct usb_hub {
  * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
  * @early_stop: whether port initialization will be stopped earlier.
  * @ignore_event: whether events of the port are ignored.
+ * @disabled: whether the port is disabled
  */
 struct usb_port {
 	struct usb_device *child;
@@ -118,6 +119,7 @@ struct usb_port {
 	unsigned int is_superspeed:1;
 	unsigned int usb3_lpm_u1_permit:1;
 	unsigned int usb3_lpm_u2_permit:1;
+	unsigned int disabled:1;
 };
 
 #define to_usb_port(_dev) \
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 44e38f922bc553adee64b35c536dfd4154a42d8a..86e9d6d0c0f505782569565fde8e4a46b06b8b4d 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -117,6 +117,10 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 	if (rc)
 		return rc;
 
+	/* Early quit if no change was detected */
+	if (port_dev->disabled == disabled)
+		return count;
+
 	hub_get(hub);
 	rc = usb_autopm_get_interface(intf);
 	if (rc < 0)
@@ -148,6 +152,8 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
 	}
 
+	port_dev->disabled = disabled;
+
 	if (!rc)
 		rc = count;
 

-- 
2.47.3


