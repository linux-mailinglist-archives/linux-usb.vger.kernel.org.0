Return-Path: <linux-usb+bounces-35654-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGykCxlJymkQ7QUAu9opvQ
	(envelope-from <linux-usb+bounces-35654-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:57:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87750358B37
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C857E3060BDB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC193B636C;
	Mon, 30 Mar 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEHkj4J9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1FE382362;
	Mon, 30 Mar 2026 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864248; cv=none; b=LxveGsufm+EbSmDHiG6iNr8hANG8LoLS/j4cTeaiMWszdhw6H4kmOdu4KE+JnJO4HMZP4ZIjfDz6U8Wwo+tPj7jhP69Bt6lYtaAOEtfNNVTfjkOjvDqLwQtpzgIJhy972dW1jsXQO7kAx3zkr8uBQBBaBHkq8kHIVHBaS1Ulsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864248; c=relaxed/simple;
	bh=2R0XiSThscQGR2hKMVvvQzdQ0roKCi/Co++rrfvdx+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SmZMe9cTLoW+yEKuTTtVMZkyyj/MOR29OkBBrTQMVr6+NrAwG1vSslwZrarLeGac/3dGUZBBnAg8EE6E910vIeajX/uvBKTaL6XBJzkqYDpPdaync7GkhkGgK9KFBDxlSMH3/VX68/2+Mp0HOtA/FcxskbpBkr0N/gqBu4Q69HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEHkj4J9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B76C4CEF7;
	Mon, 30 Mar 2026 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774864248;
	bh=2R0XiSThscQGR2hKMVvvQzdQ0roKCi/Co++rrfvdx+E=;
	h=From:To:Cc:Subject:Date:From;
	b=UEHkj4J9OQfqVDofTmjy1Do0PEB9cSMMgAlwxawtvBiVJUf0mNChFh9eA/13bMTov
	 P8+UTBRv7VDCOLC+jF0vzT3RPDTocYmt3n3N9xdjuRZoZpcsfYkKGNm/QvxSkvx24l
	 devIIursN11wXcoHRQAAJ2eyhi4BY5Ec9wa/xMdgbNJBUJViA4TZugQYLRoj5NN1Xi
	 5ouku/+GvML7ZwQligrmjH5YG6Lzgp7gxQRRKmvZQnm3L6NfZkb3pxagn9g9ZFRpvQ
	 9lm5rs7/FsniaPXlf2Rdkpqv87A+WR5H06xieviBWYoHMBasUX9JYq472JLpjpJcKP
	 kwjJWHBw6mmXQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79Gg-00000006yQV-1Mv4;
	Mon, 30 Mar 2026 11:50:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] HID: usbhid: refactor endpoint lookup
Date: Mon, 30 Mar 2026 11:50:34 +0200
Message-ID: <20260330095034.1662231-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35654-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87750358B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the common USB helper for looking up interrupt-in endpoints instead
of open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/hid/usbhid/hid-core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index ddd5d77fb5a5..2447bc7cb7a1 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1363,19 +1363,17 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 {
 	struct usb_host_interface *interface = intf->cur_altsetting;
 	struct usb_device *dev = interface_to_usbdev(intf);
+	struct usb_endpoint_descriptor *ep;
 	struct usbhid_device *usbhid;
 	struct hid_device *hid;
-	unsigned int n, has_in = 0;
 	size_t len;
 	int ret;
 
 	dbg_hid("HID probe called for ifnum %d\n",
 			intf->altsetting->desc.bInterfaceNumber);
 
-	for (n = 0; n < interface->desc.bNumEndpoints; n++)
-		if (usb_endpoint_is_int_in(&interface->endpoint[n].desc))
-			has_in++;
-	if (!has_in) {
+	ret = usb_find_int_in_endpoint(interface, &ep);
+	if (ret) {
 		hid_err(intf, "couldn't find an input interrupt endpoint\n");
 		return -ENODEV;
 	}
-- 
2.52.0


