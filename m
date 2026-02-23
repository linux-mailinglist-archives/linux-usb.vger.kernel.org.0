Return-Path: <linux-usb+bounces-33588-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDp3K4OcnGmyJgQAu9opvQ
	(envelope-from <linux-usb+bounces-33588-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 19:29:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AA17B7CC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 19:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DDBE307E87A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 18:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0439341052;
	Mon, 23 Feb 2026 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ld8V3TW3"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC755339856;
	Mon, 23 Feb 2026 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871274; cv=none; b=V8TzNvF/yPLSQnzCeXC34BDoY+Hd1zItANXsIvogLoGjYa6vaY2du+06qF9EKSmIQd7cRMkFOCAQnAVl8tH/7qfqtPe5/omj64OB0RtaIoPCoTBgTy1388LlYZqjxympik71dO+WSn5HmjWVaOkHg0zjLQQYDd6KWXyn5fEQrLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871274; c=relaxed/simple;
	bh=ZKTKJXwc+kl7Ab9mU1SVJNsU6LthWfVAAfFAYE4wjoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqBYn33kR+F9RoymCDVxAWsK2bguNmxGjcmCubzSJawH+UcVgT4ktcQhwn3n29svtJ2Xcq+EVjETYLg6igu5/KIilDlB7Rm954dkPsZIObAszz0+zcLc4PKyTXGyTMU580zmlQ4FeyYIZO9y6UKuw9TOkcJls6ehk6JDnpLT/zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ld8V3TW3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771871271;
	bh=ZKTKJXwc+kl7Ab9mU1SVJNsU6LthWfVAAfFAYE4wjoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ld8V3TW331cwhDSd3oWPpeMhcKEo5Z9XNOnTZeiUvBLsfFpUfvasDf+j/8ZtxWqpg
	 AW3wnX8ibOTBTT/lJJnsf1mFW0xxotQ3aRwe7FD0uWfLRknWaBBI0yiumy26OUpZ56
	 gfkiN+ePRSidM4WBC15Ogp7V96wvboe9FOHwJoTJF/6aMnLr+cToYNuzFHHQ45J7Gm
	 nUj+/43bUOY8bPrvKSBRUtBFtHvsI+qZd9rSx15foHmn//pvK+c5T5J63l/bCeD++s
	 aXFofTy4yXp/Himeuu+Z56QDOvS2B8Z6zefHeSTPcY+Sgho3YrBCqzecNBUobibZ64
	 Dxs9tX64sf2ag==
Received: from jupiter.universe (dyndsl-091-248-208-033.ewe-ip-backbone.de [91.248.208.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E84517E05B5;
	Mon, 23 Feb 2026 19:27:51 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E588A480026; Mon, 23 Feb 2026 19:27:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 23 Feb 2026 19:27:39 +0100
Subject: [PATCH v2 2/2] usb: typec: mux: avoid duplicated mux switches
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-typec-mux-duplication-fix-v2-2-0402fefc222e@collabora.com>
References: <20260223-typec-mux-duplication-fix-v2-0-0402fefc222e@collabora.com>
In-Reply-To: <20260223-typec-mux-duplication-fix-v2-0-0402fefc222e@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1774;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZKTKJXwc+kl7Ab9mU1SVJNsU6LthWfVAAfFAYE4wjoY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmcnCaum/l9UPE3MDVcAZ5Xfc/Rjp4GpY5Qu
 6fLesuQtgZ2sYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpnJwmAAoJENju1/PI
 O/qaXksQAI4aqlfRVReFnKOboH85tS8yesiJbV4tGE9NS01dgNjjcjC20WgTYybPNc3cfgTbFw4
 9dRYtq776Dd7yyAn/2P3EUuKLvESlc96OhSaIj5SZD1BoYixEaTsnGOcpNWZqJk9Tjl2phlzLui
 hXZYCFjKOaR+1en0zp/pY/G0oEOEocO47H0Pq8lvGdwmJt6GFsVGDbqyxRZ0Pwf7pyamFKWmQL6
 u7MTL9y1HFzZSuMkIu+4quA40CQp7aUFQVZGBrvQhtRcFES8/09mNZeQXYQPCi3YwahSw48Qp8E
 8MJwsiP81rtWOhcJMq6vM7E4r4gbcNIsoRtA7TLjaqoLLry4JE9X+8pdnhyCoPBAI+ROnE8bOJP
 BqoQbn5QLcKy9O0aMNze7gkwnWifZ0ihu5XvChLurkjM2I8spWgt3flff4ApezJEawsRVM6x0k4
 ViS+VXmp+S23+bEXpP/wugX9mpV1BnN16LLo0B9snfWNe2fuHvH5ROVVKl8vi+skiQqTChvSciY
 H6SgPNcmBLi6heloSBZK5r48uBL8Im2QkX/olGT0LfJDu/QW9jfco1JH6Vj+jl5LGYRUPUgJoEQ
 K3n6Fm1EQdzPa09XifcEdyRfPNVoEPsdmLqPWAdkn3LG+DC6eKIIp8wwHRhUmDmujZeSysmXrRW
 uYC6phPR8m/YRCqxgTuUlmQ==
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
	TAGGED_FROM(0.00)[bounces-33588-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 2A1AA17B7CC
X-Rspamd-Action: no action

Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
handle the lane muxing. These PHYs are referenced twice from
the USB-C connector (USB super-speed lines and SBU/AUX lines)
resulting in the mux being configured twice. Avoid this by
dropping duplicates.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/mux.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 9b908c46bd7d..db5e4a4c0a99 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -275,7 +275,9 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
 static void *typec_mux_match(const struct fwnode_handle *fwnode,
 			     const char *id, void *data)
 {
+	struct typec_mux_dev **mux_devs = data;
 	struct device *dev;
+	int i;
 
 	/*
 	 * Device graph (OF graph) does not give any means to identify the
@@ -291,6 +293,14 @@ static void *typec_mux_match(const struct fwnode_handle *fwnode,
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				mux_fwnode_match);
 
+	/* Skip duplicates */
+	for (i = 0; i < TYPEC_MUX_MAX_DEVS; i++)
+		if (to_typec_mux_dev(dev) == mux_devs[i]) {
+			put_device(dev);
+			return NULL;
+		}
+
+
 	return dev ? to_typec_mux_dev(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
@@ -316,7 +326,8 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
 		return ERR_PTR(-ENOMEM);
 
 	count = fwnode_connection_find_matches(fwnode, "mode-switch",
-					       NULL, typec_mux_match,
+					       (void **)mux_devs,
+					       typec_mux_match,
 					       (void **)mux_devs,
 					       ARRAY_SIZE(mux_devs));
 	if (count <= 0) {

-- 
2.51.0


