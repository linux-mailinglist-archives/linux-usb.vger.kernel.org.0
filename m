Return-Path: <linux-usb+bounces-38175-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DVhnItOdGmqy6AgAu9opvQ
	(envelope-from <linux-usb+bounces-38175-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 10:20:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E772C60BAAE
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 10:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ED2F304C886
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 08:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D8F384CCE;
	Sat, 30 May 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMmcbEx3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA32E736D;
	Sat, 30 May 2026 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780129225; cv=none; b=LAy5knijOOy84Ook6/HgIOi2pd0VX1DbNiUSFkCd4qiD7Zx6t7yeS/TaLPPFN2y5Z7R8WThZJRcAo3aguZD7zK16vrTl/g74DhAsLEqe8bYslKx1hdP1b2FhzjxD/KwchRwUrgfDsF58pBjUQILhW5i9qaPwv0Ir//qmp5AeQcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780129225; c=relaxed/simple;
	bh=/rBXPe0+ploCRR/1Dj/IzxG3wcKJ/yUdUiHIGVlC/tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lw6CWaPILOB3J/f6thP7ChUldbPygcCpLQNrIeQiY7usCsQT8JeOwdrJK3jYYA5fjvPSViXG98Pa8DtZh7sI5kiGA1qY7aVSevVIYqJQYQhSUN9VjLFqSBzYM0j3M9H6TZTU++UIZbHuaHFgTbKtIPaFEyr6zSXNIie5DplAXY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMmcbEx3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 455FDC19425;
	Sat, 30 May 2026 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780129225;
	bh=/rBXPe0+ploCRR/1Dj/IzxG3wcKJ/yUdUiHIGVlC/tg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=DMmcbEx3UVd/sLA4wcJ0OBqTXUxyphgiOU0AQujp1dozvRERkBskO3umQ+KT9p0Jj
	 Fu5xax/dMiui4MKgg5X4sSRLPpkcD2gU0s58jgeLQWhjHsM3QrOIzOqp5TY/sLjNXF
	 OAzvBSjj82RIJmkdA6rCNDqPJ3wvRgsHa/8R2f97z+7vAhCY/pnViL2zwzOZXyT/yW
	 lxL3CtETFUD2tqvBBvDpa2Zqg7fI8Lf0zV0iFuOMryqzQUVPwGQq98jhgSklldLPAU
	 mc5r3AflSvS4FOCiP4ANysqY8SRVF5iacQmCsa/nea6UpJn5sdPRUuxE79Jrcw+E99
	 zvbRwErmrk5YA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2742CCD5BD0;
	Sat, 30 May 2026 08:20:25 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 30 May 2026 10:20:22 +0200
Subject: [PATCH] Revert "usb: typec: mux: avoid duplicated mux switches"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-typc-mux-modeset-v1-1-64b0281e2cd6@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBuYCkO6SrQQm2oWWmhFId49a
 fkW/yeIHIQjDFWCwLdE2X1BU1dgN+NXRpmLoaW2J9URnu9h0V0Pun3myCeyWrTptGmILJTsCLz
 I8y/HKecPE3cNz2IAAAA=
X-Change-ID: 20260530-typc-mux-modeset-e5f8a38a100c
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780129223; l=2278;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=DsZwGjXI8H6vKbDo005iChwLLRz9y8hmwTBYCgo3fxg=;
 b=FQ+2pUnmupin9eRRqG37HNI8PVQy6nXa4FefM8P6Os36IVBWoa+JJXbStSiNHl8c7M34qNk3p
 Us0k47MlUpyAeLAV0JNH9B6pSbsQRRRW5Cw15RlhpkvRbhOVnZsYY7F
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38175-lists,linux-usb=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E772C60BAAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

This reverts commit b145c3f29d62f71cc9d2d714e2d4ae4c8d3f863d.

The deduplication logic appears to cause issues with separate
SBU muxes. The mode-switch call on these (like gpio-sbu-mux)
never appeared, so no successful mode-switch happened. The more
high-end Parade PS883X redrivers are not affected due to being
retimer-switch. The revert fixes dp altmode mode-switch for both.

Tested on:
  Lenovo Thinkbook 16 G7 QOY
  Lenovo Ideapad 5 2in1 14Q8X9
  Microsoft Windows Dev Kit 2023 (Blackrock)
  Lenovo Thinkpad T14s G6

Fixes: b145c3f29d62 ("usb: typec: mux: avoid duplicated mux switches")

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/usb/typec/mux.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index db5e4a4c0a996..9b908c46bd7df 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -275,9 +275,7 @@ static int mux_fwnode_match(struct device *dev, const void *fwnode)
 static void *typec_mux_match(const struct fwnode_handle *fwnode,
 			     const char *id, void *data)
 {
-	struct typec_mux_dev **mux_devs = data;
 	struct device *dev;
-	int i;
 
 	/*
 	 * Device graph (OF graph) does not give any means to identify the
@@ -293,14 +291,6 @@ static void *typec_mux_match(const struct fwnode_handle *fwnode,
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				mux_fwnode_match);
 
-	/* Skip duplicates */
-	for (i = 0; i < TYPEC_MUX_MAX_DEVS; i++)
-		if (to_typec_mux_dev(dev) == mux_devs[i]) {
-			put_device(dev);
-			return NULL;
-		}
-
-
 	return dev ? to_typec_mux_dev(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
@@ -326,8 +316,7 @@ struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode)
 		return ERR_PTR(-ENOMEM);
 
 	count = fwnode_connection_find_matches(fwnode, "mode-switch",
-					       (void **)mux_devs,
-					       typec_mux_match,
+					       NULL, typec_mux_match,
 					       (void **)mux_devs,
 					       ARRAY_SIZE(mux_devs));
 	if (count <= 0) {

---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260530-typc-mux-modeset-e5f8a38a100c

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



