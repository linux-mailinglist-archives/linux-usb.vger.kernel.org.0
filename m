Return-Path: <linux-usb+bounces-37929-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPW4GoYuEGrIUgYAu9opvQ
	(envelope-from <linux-usb+bounces-37929-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 12:23:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CAA5B1FDE
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 12:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53719301CDB0
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 10:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489B53CAE63;
	Fri, 22 May 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HE/3prED"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14783CA4BD;
	Fri, 22 May 2026 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445010; cv=none; b=i+NSHk9eswIa/S0wpaj7cGrXNIrxRvJA6IyaPCZ3fPXu4DK40zDHLT20DgotYDm4RIWq33MgP/wSQpIQqdcrS68ZJ1LRgdtyrDWRDavSUPUjwYyU55Y7ALKJM54FMav4vrzwjI2mcvJZqRu3bs/nOnB+z/FfNfFsEKEgzCGBiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445010; c=relaxed/simple;
	bh=jEw8zWzbkWDyx7Hq2HAzDO8qXrYVI6p7J67gbnOW2Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVW33DC4WKo4tyY+zhq9LYQ2Qt3YSXI3DFkGpK7dGzyDZyJ5OzLiC4fvuVgQWDSuEJquJrDcTD1gydp2KZh+zGfv7uVniOGPT2un9uuFLBh/eheFsGrTcfGdsmdopj6Bv7lAdrNwhhV6cdHhGyYkUJeItelEghcwHhNH6UsWO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HE/3prED; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206691F000E9;
	Fri, 22 May 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445008;
	bh=tie9Sx62ugl95zHwccy1jha3P+jxL/pmhS11ZitlbEA=;
	h=From:To:Cc:Subject:Date;
	b=HE/3prEDlp7XCDeQtG+5MERxqFl0uJZpWlkIrXWj9B11VRVICq+00xbTgYEYyXHEA
	 GQcwCwaIxUpawmfGGI7ooNuoIeTi7FmHMY4io5qYc7E7Wl0vXOmDbFQ7dfu4fzXa85
	 CUGlpbUHdF4wIQIXkKln3fWNKnAq/mmSztjnrtn4dZsXah4usGYkdwKo2TKimVhQTd
	 /ozmtHA0wsoelNtS9NUM/rrnxOey9mdXLNfPKa+ToUY7ODWXCnJMukyKOJEuI1QBxq
	 zkDi5LkwgCKEo1siJi/aOcBC2pg5kzBkYPPSqH57RzGfm5jKlAZe5iKy0/TFacezwi
	 yJRTrNDDz/3kg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wQMvt-00000003tAf-3cGO;
	Fri, 22 May 2026 12:16:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zhang Cen <rollkingzzc@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] USB: serial: cypress_m8: fix memory corruption with small endpoint
Date: Fri, 22 May 2026 12:16:21 +0200
Message-ID: <20260522101621.927034-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37929-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C5CAA5B1FDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make sure that the interrupt-out endpoint max packet size is at least
eight bytes to avoid user-controlled slab corruption or NULL-pointer
dereference should a malicious device report a smaller size.

Fixes: 3416eaa1f8f8 ("USB: cypress_m8: Packet format is separate from characteristic size")
Cc: stable@vger.kernel.org	# 2.6.26
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cypress_m8.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index afff1a0f4298..82ba0900b399 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -445,6 +445,14 @@ static int cypress_generic_port_probe(struct usb_serial_port *port)
 		return -ENODEV;
 	}
 
+	/*
+	 * The buffer must be large enough for the one or two-byte header (and
+	 * following data) but assume anything smaller than eight bytes is
+	 * broken.
+	 */
+	if (port->interrupt_out_size < 8)
+		return -EINVAL;
+
 	priv = kzalloc_obj(struct cypress_private);
 	if (!priv)
 		return -ENOMEM;
-- 
2.53.0


