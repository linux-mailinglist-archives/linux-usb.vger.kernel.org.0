Return-Path: <linux-usb+bounces-35368-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AFtExxOwmnvbAQAu9opvQ
	(envelope-from <linux-usb+bounces-35368-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 09:41:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858A304D59
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 09:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 227543023903
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 08:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA4C3D7D8E;
	Tue, 24 Mar 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="knyO8X1r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D504383C6A
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341519; cv=none; b=RVGFKM+UnjDrKxMRcgo39nAbZTqXQNiZ16pBtanCqnsblDvvaKMNhPtah2cUq2exyStUA/l3AGGNQf6qHkahmXZsawswX5Lq2b328bm3QWusx3MzwGgtS7Y06G0p6KpcuFmqsYWYe4TaT2eOoUgZsnZ4m95PresKnVsMfLqtkTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341519; c=relaxed/simple;
	bh=sQFLfWDZnN2jbIWb/ty60Z2YG7NkDwuDP/51J79R/Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OHexbilEUzgpzps30AqQbM5v80p5Hvlfq8NWYuXy60tMzl84avD6XOC/w+Z7aF2vhNZ0KW5g9JfhfZGoj4QYSBWfm90EvCr70a5+P/Vj/JddAptHEE0qZCb30pazDPDl5g6u6RgIAey2Fkgm+UK15vZoTBWUbHBeZD6XChWpD/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=knyO8X1r; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b982b0889d8so144932066b.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774341509; x=1774946309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qfe8uxaJUIwAwgeZAc6EHsvJiN9WIJGVAt60/7iwUec=;
        b=knyO8X1rOUKBVeTHP6Ffqw4DkUvG4J0MWpVsgG/XyksHF9RYjRb+beWcG2Iw6aMK5o
         XYRiB29QJRxMOJP6IUEWODc7Fd+RkMS/Po+F+EHUHQMeOD2wgWdD+cWRdPYLiClrHKf4
         fuOSvLVrdWNRRZYCXPeyuhpQpnGGSnbJ7XBRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341509; x=1774946309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfe8uxaJUIwAwgeZAc6EHsvJiN9WIJGVAt60/7iwUec=;
        b=TKK/O931pj7KfGd3d+f9e7hUFsJpgXi4RJ3y5vAB81fICtG+odsvVgbZNz4zd5O9zc
         HUlF9hZLdBOysTHLOUjMc1lNtZuC3bNrLAMqiPdgsfO+OHQAizqV5RPQhKrumfJtJ/Lt
         +JLUctiPyuUZSx81eKY1W6CFqlvOaNGBPDuMH6fBlR3bScNqGhfuHTlCU7Du3AF2+XD/
         Z7BPM4V83jFqShFPezIiVgJ8v3BlmQV1oh2KhcsQcq2g1oZVeAFmfjwDIvcS+5stTyDV
         NTp5OJr8yYlnTwsTCYChoLA7qVpWVnl+GiYByJ2UeznH6PuNlEFW7U5LPsSnV9tiFPTa
         2/YA==
X-Forwarded-Encrypted: i=1; AJvYcCUtukULybzlbVVDr5L6xUx7kBVQ/cWwdWtuyPbn89ABPGJb+Pg+n61gWKpOYEpxLhR3azhZRAVeH5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz521uPjQq8H9k9oahOug5IyxyyI/nlxTc4GOTe+ZoaOSRBomMb
	PjE4HqszILTC6zXdSL4n3zcXPcdOfIBQBbKdqT10etH7om0SddZacNKTwVnmoc65RbqTQ8ykfjA
	uJOU=
X-Gm-Gg: ATEYQzwJY21OWK9GVti+RLOUiuW+bnaWuHUhdwb3fKSgMnlUweSEBsX6M4sZE7Pzian
	QE3Mt8S2FDlGVeEl5QJvGtcq8WyYFo6gGiJS5SHAE+gUTTe40bjbQrSOHLZFvVPppcDD77Z71o9
	gWywiu2rNKCR3KlANHRKcbYH8rJUHylLAVKA5a39rfWKeTlzO3dB9BJQhDIf4TAlQ8KeqkXFLzO
	hG9W/RHZHEn3tCjsvpF+nGgKhW1wzSWA3jQdAjBatD9IuzUWisZr+ZkbsQNybdN85Z1O7l2B2Xv
	2cONgb07hZo3h1RGymanWrPaA6S1KQ5E6c0cTwwS6Qe8p8v9RivZjYd61CkBYzilw4mTR9yOXqu
	xUTE0RfK0RxuBaaI3oyf/AApg4Q9/aMnpwnhUQxkwwjBFqsjLU3StD+3QSUzSFhTMxQq70GjAPJ
	AGi/i7s9m2ckkJ2DDN3ClMJJC/LmtBdyskAItdaid7dvK/D82SldBhT/3WvrNCXInM2QoDcIoWp
	ALFmuH3YrJ6OrF4naBpIEE=
X-Received: by 2002:a17:907:9725:b0:b98:6926:13c3 with SMTP id a640c23a62f3a-b9869262e7fmr491579266b.22.1774341508989;
        Tue, 24 Mar 2026 01:38:28 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365dbe4sm601555666b.47.2026.03.24.01.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:38:28 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Madhu M <madhu.m@intel.corp-partner.google.com>
Subject: [PATCH] usb: typec: Remove alt->adev.dev.class assignment
Date: Tue, 24 Mar 2026 08:38:18 +0000
Message-ID: <20260324083818.686269-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
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
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35368-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 5858A304D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The typec plug alternate mode is already registered as part of the bus.
When both class and bus are set for a device, device_add() attempts to
create the "subsystem" symlink in the device's sysfs directory twice, once
for the bus and once for the class.
This results in a duplicate filename error during registration,
causing the alternate mode registration to fail with warnings:

cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.0/
  PNP0C09:00/GOOG0004:00/cros-ec-dev.1.auto/cros_ec_ucsi.3.auto/typec/
  port1/port1-cable/port1-plug0/port1-plug0.0/subsystem'
typec port0-plug0: failed to register alternate mode (-17)
cros_ec_ucsi.3.auto: failed to registers svid 0x8087 mode 1

Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/class.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 8314309094719..0977581ad1b6e 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -686,10 +686,6 @@ typec_register_altmode(struct device *parent,
 
 	alt->adev.dev.bus = &typec_bus;
 
-	/* Plug alt modes need a class to generate udev events. */
-	if (is_typec_plug(parent))
-		alt->adev.dev.class = &typec_class;
-
 	ret = device_register(&alt->adev.dev);
 	if (ret) {
 		dev_err(parent, "failed to register alternate mode (%d)\n",
-- 
2.53.0.983.g0bb29b3bc5-goog


