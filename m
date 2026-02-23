Return-Path: <linux-usb+bounces-33598-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP/KAq7EnGnJKAQAu9opvQ
	(envelope-from <linux-usb+bounces-33598-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 22:20:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5753A17D829
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 22:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1F94304D1E5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 21:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3747B378825;
	Mon, 23 Feb 2026 21:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fCJ53IRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3B34AB16;
	Mon, 23 Feb 2026 21:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881637; cv=none; b=fF1JeXxe7VFgb6KAYg5kRa6knAjfxY4lGzRpSWkYLmlR15uc6sOhapI5wTVUmt/K9K8q3Pyj0QysJvP7bcg3BcRynzCnsx0tXjPlXwJvPOF3Kkoa3RiH200/ea5RUs4F1HPbWQhe6YwT5eIz7qWWZhaCquoFO4CbKamgPQbvWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881637; c=relaxed/simple;
	bh=tHvwGgRhmexarHVDi9HdJ4bh8kvfnI75YV4slvKU2i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GZ61b1ExXNAfS9rf5IZ+bMe5wVyzlAbfN4nGg6BLN5V1DHi4h6DjxsQp1iwanv+CF+zJmWHeQPOqru6pNnfX/zVshlGRR9gizMBKI5Otr5DUoaphiFNFNuMEbKpkWf1T1zOaid1sTd7XrbqqTMfK8ijkwTNaXrB4TbH0BW2JejM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fCJ53IRg; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1771881634;
	bh=tHvwGgRhmexarHVDi9HdJ4bh8kvfnI75YV4slvKU2i0=;
	h=From:Date:Subject:To:Cc:From;
	b=fCJ53IRgTFxtQ2Frzf/h+RwrkzvCQkmIu2lqr0r3VHv18CphoPHy4YSVbZ1/NiDMe
	 1hLdzSCtvcJIGTdalrdddHKVlNtLCWEpCUvD1Ij2wzia6Bd5wBxLMfO7swIHiSwjmt
	 DUYyfWxSAAVDMZAbSWn8re7npYkxo2JATWmlS0YU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 23 Feb 2026 22:20:33 +0100
Subject: [PATCH] usb: endpoint: drop custom sysfs attribute structure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-sysfs-const-usb-v1-1-54c4434d83c8@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrE1CG/VzFbGgnTKbkg5CxN01l
 t/ivQeEIpNAlz0Q6WThNSSUeQZ2GcNMyC4ZVKFMoZRGucUL2jXIjodMaKZK123rx8Y5SNUWyfP
 1H/vhfT/cMt0jYQAAAA==
X-Change-ID: 20260223-sysfs-const-usb-6b53799fa8dd
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771881634; l=1096;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=tHvwGgRhmexarHVDi9HdJ4bh8kvfnI75YV4slvKU2i0=;
 b=oFeNPn4rHQkClAQ9F6WSLCwi5W4YYmzrkYW5gqT8+o5EsoKCXqdFYJwssvvRa2lOcaejoip8z
 5FeQTKQuRYmCpj7X1np1iE0VTGcbXnCqi7VqKtthLdApsmEgQUc+NOn
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33598-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:mid,weissschuh.net:dkim,weissschuh.net:email]
X-Rspamd-Queue-Id: 5753A17D829
X-Rspamd-Action: no action

Nowadays the USB endpoints use device attributes,
so the custom structure is unused.

Drop it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/usb/core/endpoint.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/core/endpoint.c b/drivers/usb/core/endpoint.c
index 4137ab47f1cd..e00eaf9e22cd 100644
--- a/drivers/usb/core/endpoint.c
+++ b/drivers/usb/core/endpoint.c
@@ -26,14 +26,6 @@ struct ep_device {
 #define to_ep_device(_dev) \
 	container_of(_dev, struct ep_device, dev)
 
-struct ep_attribute {
-	struct attribute attr;
-	ssize_t (*show)(struct usb_device *,
-			struct usb_endpoint_descriptor *, char *);
-};
-#define to_ep_attribute(_attr) \
-	container_of(_attr, struct ep_attribute, attr)
-
 #define usb_ep_attr(field, format_string)			\
 static ssize_t field##_show(struct device *dev,			\
 			       struct device_attribute *attr,	\

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-sysfs-const-usb-6b53799fa8dd

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


