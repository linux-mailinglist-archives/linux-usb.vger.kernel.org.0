Return-Path: <linux-usb+bounces-33589-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCNxJ5mcnGmyJgQAu9opvQ
	(envelope-from <linux-usb+bounces-33589-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 19:29:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13B17B7E2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 19:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BFD63104E41
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 18:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634CA341ADF;
	Mon, 23 Feb 2026 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WyNIyzmZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C5339861;
	Mon, 23 Feb 2026 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871275; cv=none; b=FMUPveCDZk0MLxz7micp0nyE7eHny6O+8yhF+WEPourUqCJA222pFLRTFRIEcRrDIkfWR1oXyyJIamjHKZRiz+Wscdt3ReB6+6Q/Kvf461QhmWCjx0z87R0qwAUIG7hNT0CM+/aTCYQfyTNVfBw5GjDWc4JNb1w2Tf4OqJa1xfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871275; c=relaxed/simple;
	bh=Wz4vdsfnheRUMn1NJPAKeUGfoRavSQrri5sfE8QYfdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTYfxMEegr2GgYoWhs8xpKjYzv1qISUfzX6eS658y1QIFwZqCY23MEbyuTHgjxBLl9TBMAzXD+terKHaG6uxZD+0OuVoRASzzPFWREGBxrGYOzwbk3e7D7bAFccba/0Ursck585Kv5wfcVMRZUgCKjt6884omMRm6VWHd2sMS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WyNIyzmZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771871271;
	bh=Wz4vdsfnheRUMn1NJPAKeUGfoRavSQrri5sfE8QYfdE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WyNIyzmZ/X4XUurgK4i4TOkb78mh7o+nRhZhVJTCrU0W/hgDQ2ob9oqWFdAcK+CSf
	 bGQjwrONU4x2uOvglGCny1BOdPpXUQCaUkc1dUjBmVx4CEx8YOuEf3DxdhEzwCwyTK
	 sp3aZ2uBmmEsTUesk9+6TpS/HC85X7QGmqZw4BAcYn9SUTn1/oDo92KN6VWljdFwfD
	 uo7jRWjdS4YfFwVYRQHpaL+ZKMckYHskW4Az8Ro3FbGH/UC4nWppiz2TeJJI5beFLy
	 j4ZryKe3PMm+eE9nZN8Qr4Van6SyxCNm2XmB+AN+9c41daRXqNa184yxAIn/HYtQTd
	 FRycn4FqQKSeA==
Received: from jupiter.universe (dyndsl-091-248-208-033.ewe-ip-backbone.de [91.248.208.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FE5417E05E8;
	Mon, 23 Feb 2026 19:27:51 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E53A9480023; Mon, 23 Feb 2026 19:27:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 23 Feb 2026 19:27:38 +0100
Subject: [PATCH v2 1/2] usb: typec: mux: avoid duplicated orientation
 switches
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-typec-mux-duplication-fix-v2-1-0402fefc222e@collabora.com>
References: <20260223-typec-mux-duplication-fix-v2-0-0402fefc222e@collabora.com>
In-Reply-To: <20260223-typec-mux-duplication-fix-v2-0-0402fefc222e@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Wz4vdsfnheRUMn1NJPAKeUGfoRavSQrri5sfE8QYfdE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmcnCaBWimLuXHxcBpFaiErYcWKIDL4Eyma8
 mRYvgjWbUp554kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpnJwmAAoJENju1/PI
 O/qadVIQAJ6YZd4th8kIg1eQFpweAdS6jAwP02zIJ6IGRDN5P8UAxHgsq/xJGBoui58INu4/FHs
 OHJdZ5P2WSIEyvsLicoZsOZtRE2i94CkZPLlJB5fr1W3yc6fngrgyFyjLRiqImzo9KcDElCyny+
 mHXCPafxdhlC3hOZ2DW2A5qekxt6LfRJNQXAg9zSI3GOEu6xNKbtf/D9rhehszQ7KZOTEmpHuZq
 wPtHnMWoi2YwuGgtpCH10ffwdtG8QLqgT6gZ6Mm4pCuKTJeHjnI5jtujRnfDlrVp1XDxgLfwJiJ
 GmMrVBf4JNdRIXvy5PmPkMBdy/9xNGL9QEaCMd4K0vHI4gAMH0tuCECxN0vN6szHLErQ3OcM4DC
 BwqMLY9p5/h3IJS+GB4xKJV39hVQ1tElkbGAOZ51XRwHKExf4hjJZWXG7x/1fjPEVnStf0zxFTD
 Cc2j5nZ+Bs6kp7J9TE0ZitkabrgBuQD+oomQH2QKGTbh4ICmXj57MIDVPTB3OJZMfTQCqgLpL/U
 OhAOwojkRrdF4ePrdtnlKD+VgazSnR0yseNBDnm8RtcnqbFyjDxi1G2DjD+jBHNfctuKJRHAFoM
 1MmDOgHCD06AA8pIk6H0l/4oNE9pl7oJkjH/sm3DvJL44V/WyZsvTc4CKpzP49oXDWy3XFpX1JH
 41Kr6wYQw/nUfla6noBYj4A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33589-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE13B17B7E2
X-Rspamd-Action: no action

Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
handle the orientation mux. These PHYs are referenced twice from
the USB-C connector (USB super-speed lines and SBU/AUX lines)
resulting in the switch being configured twice. Avoid this by
dropping duplicates.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/mux.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 58fb97ea6877..9b908c46bd7d 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -35,7 +35,9 @@ static int switch_fwnode_match(struct device *dev, const void *fwnode)
 static void *typec_switch_match(const struct fwnode_handle *fwnode,
 				const char *id, void *data)
 {
+	struct typec_switch_dev **sw_devs = data;
 	struct device *dev;
+	int i;
 
 	/*
 	 * Device graph (OF graph) does not give any means to identify the
@@ -56,6 +58,13 @@ static void *typec_switch_match(const struct fwnode_handle *fwnode,
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				switch_fwnode_match);
 
+	/* Skip duplicates */
+	for (i = 0; i < TYPEC_MUX_MAX_DEVS; i++)
+		if (to_typec_switch_dev(dev) == sw_devs[i]) {
+			put_device(dev);
+			return NULL;
+		}
+
 	return dev ? to_typec_switch_dev(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
@@ -80,7 +89,8 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 	if (!sw)
 		return ERR_PTR(-ENOMEM);
 
-	count = fwnode_connection_find_matches(fwnode, "orientation-switch", NULL,
+	count = fwnode_connection_find_matches(fwnode, "orientation-switch",
+					       (void **)sw_devs,
 					       typec_switch_match,
 					       (void **)sw_devs,
 					       ARRAY_SIZE(sw_devs));

-- 
2.51.0


