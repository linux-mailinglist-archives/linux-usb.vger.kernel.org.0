Return-Path: <linux-usb+bounces-37225-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JkaNiyCAWpObwEAu9opvQ
	(envelope-from <linux-usb+bounces-37225-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:15:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA5508EEF
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 716E230071C5
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D7837BE88;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXIC2QHm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A9830BBBF;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=kIJ0kF6FM/jFCRnKDgmEPg/S733G8wfk6mY85s7fCS2l18JVXGRH3y6bByRfG2e+9QHUCaUQ8U3VtYZBFFmeERGn9nUG5ck6/oNxUhEbIZ0QfM3EPN4E2pImH+3eBhKEkPCX1OTHsQ5ZRjIMzPmgt2m8WjjBp+k53cWmWv6fIkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=cgxOpNM67L0e4Vc1zBsJIXDRzemnR+Ohbi4PH5gHL+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaaPo1lE+7VsFDWMRKm/lwHsimkbTWyQm8a8ZtKOaSyhKqyyuf4Yguad2bISH28msyLdu2+Lv7hZ68jYmomcWUdptPcoErDv4dZ6pC3skfneAEM4GWVNqEYrZGcZs7SP3He7H6Cu2y1nWHUF+EzBXlbwb9Ot7eZjzx3yDlM5o4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXIC2QHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0E5C2BCFA;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=cgxOpNM67L0e4Vc1zBsJIXDRzemnR+Ohbi4PH5gHL+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LXIC2QHmmaLsq68mq+VMljhTqNqGuPQZaGFIm//xGDq2GlLEY1X6znsp87/jn+/kN
	 o6wn+9IC1AcXRXpZ1Nq5dYNOhDsIocAqW6FjpsgiWQI4hXCS+a2rwrjfwufXyA6dZ7
	 hM20yh3z+oOnHwBOeFlwU8pvpsR4Bhe3UanpzffDeP5+b7EvfvTjsPC5ikNCtEye0p
	 3LmrKxuCFpk/7Pfy3vH+EAmu5lNWasqwulHtdvS4so39Fgikih43djEP7VdEH8tLrY
	 7XJz8gqK23suvNJphT9vqvmMa3club8ebSlJ05reA2C5/d1W9uLPlArYQRHL6rrcx4
	 G2vk4/dD0WmGQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCN-2pKg;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] USB: serial: drop unused tty_flip includes
Date: Mon, 11 May 2026 09:14:42 +0200
Message-ID: <20260511071448.611875-3-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 76DA5508EEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37225-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

These drivers (and usb-serial.c) no longer use anything from tty_flip.h
directly so drop the unnecessary include directives.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/empeg.c      | 1 -
 drivers/usb/serial/ipaq.c       | 1 -
 drivers/usb/serial/ipw.c        | 1 -
 drivers/usb/serial/option.c     | 1 -
 drivers/usb/serial/qcserial.c   | 1 -
 drivers/usb/serial/spcp8x5.c    | 1 -
 drivers/usb/serial/usb-serial.c | 1 -
 drivers/usb/serial/visor.c      | 1 -
 drivers/usb/serial/whiteheat.c  | 1 -
 9 files changed, 9 deletions(-)

diff --git a/drivers/usb/serial/empeg.c b/drivers/usb/serial/empeg.c
index a9f3d57236b2..48e1a58ea3f5 100644
--- a/drivers/usb/serial/empeg.c
+++ b/drivers/usb/serial/empeg.c
@@ -16,7 +16,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
diff --git a/drivers/usb/serial/ipaq.c b/drivers/usb/serial/ipaq.c
index d9c9b78c41bd..eb9b7a7b1d14 100644
--- a/drivers/usb/serial/ipaq.c
+++ b/drivers/usb/serial/ipaq.c
@@ -10,7 +10,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
diff --git a/drivers/usb/serial/ipw.c b/drivers/usb/serial/ipw.c
index 83709d678b3a..b900d0317a71 100644
--- a/drivers/usb/serial/ipw.c
+++ b/drivers/usb/serial/ipw.c
@@ -36,7 +36,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/usb.h>
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 42e4cecd28ac..fd5f1d9ab2f2 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -32,7 +32,6 @@
 #include <linux/jiffies.h>
 #include <linux/errno.h>
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/bitops.h>
diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 1a930dc668e4..105c0a0eae86 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -8,7 +8,6 @@
  */
 
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/spcp8x5.c b/drivers/usb/serial/spcp8x5.c
index 5d5ea63da5df..c11d64bf08fb 100644
--- a/drivers/usb/serial/spcp8x5.c
+++ b/drivers/usb/serial/spcp8x5.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/usb.h>
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 0e072fd87c3d..67e880955ce7 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/tty_driver.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>
diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 8e1c7233ec45..06e30be10ca6 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/whiteheat.c b/drivers/usb/serial/whiteheat.c
index 2487a4d81b98..7ba05a1a3eae 100644
--- a/drivers/usb/serial/whiteheat.c
+++ b/drivers/usb/serial/whiteheat.c
@@ -16,7 +16,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
-- 
2.53.0


