Return-Path: <linux-usb+bounces-37230-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFe1FWiCAWpObwEAu9opvQ
	(envelope-from <linux-usb+bounces-37230-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF41508F5E
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B2CB300B29B
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD1037E314;
	Mon, 11 May 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1RVlbtx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D0375AB5;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=scrlKb2GXuVCggVT2Et6GNOEGdwsgFJPzcGgEVqQ+UvxEDGzLasG2wto0Ser67zIUm0fObUUQ61lQYdBuNPuVbKzQP1Fl3ZtoNp5YnHlBxd+Ld5Lc3GilMHeLVOw61//xWx6JEv8+2yhM+0hQRMtHL7b4OMmj79nQbHMT3/BShY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=8h3SyMp2aA6/w7N6GcSPGIoVzZ1bbK0b2HhGFhCw14M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSZ+oiJDlaWtIXvWfpfZHhulizhyUFgOjszjKVXe3Q3dGbQeZlG7tAjF6wM0WL2wtmZdeCwM6tLgSRuoI473ZA3l5NAtipU0hMYrTVCToOk/H1kWEoKPiRYirzDFiFHwKbWvLE9AC/J7J5vczZrAK36zQle1ssCX5lkoPewXHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1RVlbtx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02958C2BCFF;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=8h3SyMp2aA6/w7N6GcSPGIoVzZ1bbK0b2HhGFhCw14M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1RVlbtxcOvisQ0O1pw/MfXtoIqvB57f3wtL2Wtlnvqion4XIkZgrm56JgbPQiZfr
	 3deLHcqKDg2bUp6NJZxUfrTGYvG5157P/xHNYjFUKTQfAJXKPKc6YOGMeVJMlllD/5
	 qXfy5KE1c8fh00OVWW7gzZj9IQtoDC0u+ubr3gacbSbjJ3Wa9iQJKM/U1zE/C3Qa7x
	 TVtlJiWZXxi4zwM6oohq7chynaNivCNzxFj1YkZBU91Yqgd2TLz9Cj7JHrLIsaebnR
	 Cpn9D9dGKAcyt6jJrIGJluIg2wIKTBv8YObu5wCkDNaCs1fDvc/v9eoaxxWU0N1dsR
	 fMeV47XxwqJuA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCL-2mhP;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] USB: serial: drop unused tty_driver includes
Date: Mon, 11 May 2026 09:14:41 +0200
Message-ID: <20260511071448.611875-2-johan@kernel.org>
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
X-Rspamd-Queue-Id: 8CF41508F5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37230-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

USB serial drivers do not use anything from tty_driver.h directly (only
core does) so drop the unnecessary include directives.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/belkin_sa.c        | 1 -
 drivers/usb/serial/cyberjack.c        | 1 -
 drivers/usb/serial/cypress_m8.c       | 1 -
 drivers/usb/serial/digi_acceleport.c  | 1 -
 drivers/usb/serial/empeg.c            | 1 -
 drivers/usb/serial/f81232.c           | 1 -
 drivers/usb/serial/ftdi_sio.c         | 1 -
 drivers/usb/serial/garmin_gps.c       | 1 -
 drivers/usb/serial/io_edgeport.c      | 1 -
 drivers/usb/serial/io_ti.c            | 1 -
 drivers/usb/serial/ipaq.c             | 1 -
 drivers/usb/serial/ir-usb.c           | 1 -
 drivers/usb/serial/iuu_phoenix.c      | 1 -
 drivers/usb/serial/keyspan.c          | 1 -
 drivers/usb/serial/keyspan_pda.c      | 1 -
 drivers/usb/serial/kl5kusb105.c       | 1 -
 drivers/usb/serial/kobil_sct.c        | 1 -
 drivers/usb/serial/mct_u232.c         | 1 -
 drivers/usb/serial/metro-usb.c        | 1 -
 drivers/usb/serial/mos7720.c          | 1 -
 drivers/usb/serial/mos7840.c          | 1 -
 drivers/usb/serial/mxuport.c          | 1 -
 drivers/usb/serial/omninet.c          | 1 -
 drivers/usb/serial/opticon.c          | 1 -
 drivers/usb/serial/oti6858.c          | 1 -
 drivers/usb/serial/pl2303.c           | 1 -
 drivers/usb/serial/quatech2.c         | 1 -
 drivers/usb/serial/safe_serial.c      | 1 -
 drivers/usb/serial/spcp8x5.c          | 1 -
 drivers/usb/serial/ssu100.c           | 1 -
 drivers/usb/serial/symbolserial.c     | 1 -
 drivers/usb/serial/ti_usb_3410_5052.c | 1 -
 drivers/usb/serial/visor.c            | 1 -
 drivers/usb/serial/whiteheat.c        | 1 -
 34 files changed, 34 deletions(-)

diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
index 38ac910b1082..adeb8e3441cf 100644
--- a/drivers/usb/serial/belkin_sa.c
+++ b/drivers/usb/serial/belkin_sa.c
@@ -23,7 +23,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/cyberjack.c b/drivers/usb/serial/cyberjack.c
index 4e8ceb23c27d..f457c8a65934 100644
--- a/drivers/usb/serial/cyberjack.c
+++ b/drivers/usb/serial/cyberjack.c
@@ -28,7 +28,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index afff1a0f4298..5322f4b3cce6 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -25,7 +25,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index d515df045c4c..85dbf87aa361 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/empeg.c b/drivers/usb/serial/empeg.c
index aedcf7ebd269..a9f3d57236b2 100644
--- a/drivers/usb/serial/empeg.c
+++ b/drivers/usb/serial/empeg.c
@@ -16,7 +16,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 9262a2ac97f5..74b55fd9fd3f 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -11,7 +11,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
 #include <linux/module.h>
diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index af14548fa03d..88dd32da82c2 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -31,7 +31,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 7205483a0115..6ab3ad7be7fc 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/timer.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 3f5889145e51..4cf77ead9334 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -30,7 +30,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index cb55370e036f..21a631d8e88f 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -18,7 +18,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/ipaq.c b/drivers/usb/serial/ipaq.c
index 3c6a9b9b9c2b..d9c9b78c41bd 100644
--- a/drivers/usb/serial/ipaq.c
+++ b/drivers/usb/serial/ipaq.c
@@ -10,7 +10,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
index 12e928d25ba1..bda33a8976c7 100644
--- a/drivers/usb/serial/ir-usb.c
+++ b/drivers/usb/serial/ir-usb.c
@@ -25,7 +25,6 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 0ca111b111c7..6f2fd3a39d8e 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
 #include <linux/module.h>
diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index 46448843541a..eb6e3d9d9ea7 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -29,7 +29,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index 5036600dd334..23a7683669eb 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/kl5kusb105.c b/drivers/usb/serial/kl5kusb105.c
index ed8531a64768..64b7539043b1 100644
--- a/drivers/usb/serial/kl5kusb105.c
+++ b/drivers/usb/serial/kl5kusb105.c
@@ -35,7 +35,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/uaccess.h>
diff --git a/drivers/usb/serial/kobil_sct.c b/drivers/usb/serial/kobil_sct.c
index 6126afd67a7b..2be31d7a7e1f 100644
--- a/drivers/usb/serial/kobil_sct.c
+++ b/drivers/usb/serial/kobil_sct.c
@@ -23,7 +23,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/mct_u232.c b/drivers/usb/serial/mct_u232.c
index 18844b92bd08..e009c2500a91 100644
--- a/drivers/usb/serial/mct_u232.c
+++ b/drivers/usb/serial/mct_u232.c
@@ -21,7 +21,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/metro-usb.c b/drivers/usb/serial/metro-usb.c
index bc834cc48550..45e370593d4c 100644
--- a/drivers/usb/serial/metro-usb.c
+++ b/drivers/usb/serial/metro-usb.c
@@ -13,7 +13,6 @@
 #include <linux/usb.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 94459408e7fb..bc3b631041a9 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -21,7 +21,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index c0d0c24b074b..ef803e74ab4b 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -13,7 +13,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/serial.h>
diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 591be1fe3737..8f7ff187dbf5 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -20,7 +20,6 @@
 #include <linux/serial_reg.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/uaccess.h>
 #include <linux/usb.h>
diff --git a/drivers/usb/serial/omninet.c b/drivers/usb/serial/omninet.c
index aa1e9745f967..3e44250dd360 100644
--- a/drivers/usb/serial/omninet.c
+++ b/drivers/usb/serial/omninet.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/uaccess.h>
diff --git a/drivers/usb/serial/opticon.c b/drivers/usb/serial/opticon.c
index e2bed477ad57..b0c6e3578cf8 100644
--- a/drivers/usb/serial/opticon.c
+++ b/drivers/usb/serial/opticon.c
@@ -10,7 +10,6 @@
 
 #include <linux/kernel.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
diff --git a/drivers/usb/serial/oti6858.c b/drivers/usb/serial/oti6858.c
index 3ef5b5d8ce1a..bb55bbb7ff25 100644
--- a/drivers/usb/serial/oti6858.c
+++ b/drivers/usb/serial/oti6858.c
@@ -38,7 +38,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
 #include <linux/module.h>
diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 50dc838e8115..790c44c5d9b6 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/serial.h>
 #include <linux/module.h>
diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
index b05c655b3cc4..fc94d6026a62 100644
--- a/drivers/usb/serial/quatech2.c
+++ b/drivers/usb/serial/quatech2.c
@@ -13,7 +13,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/serial.h>
diff --git a/drivers/usb/serial/safe_serial.c b/drivers/usb/serial/safe_serial.c
index 238b54993446..fa4128a0c933 100644
--- a/drivers/usb/serial/safe_serial.c
+++ b/drivers/usb/serial/safe_serial.c
@@ -64,7 +64,6 @@
 #include <linux/errno.h>
 #include <linux/gfp.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/spcp8x5.c b/drivers/usb/serial/spcp8x5.c
index 2fbb48f19efd..5d5ea63da5df 100644
--- a/drivers/usb/serial/spcp8x5.c
+++ b/drivers/usb/serial/spcp8x5.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/ssu100.c b/drivers/usb/serial/ssu100.c
index da6316410b77..09fb698d3d89 100644
--- a/drivers/usb/serial/ssu100.c
+++ b/drivers/usb/serial/ssu100.c
@@ -9,7 +9,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/serial.h>
diff --git a/drivers/usb/serial/symbolserial.c b/drivers/usb/serial/symbolserial.c
index 7a5aa39172a8..c1f54248ecbb 100644
--- a/drivers/usb/serial/symbolserial.c
+++ b/drivers/usb/serial/symbolserial.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/tty.h>
 #include <linux/slab.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/usb.h>
diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index b3591d6d7645..a68d91c548b9 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -18,7 +18,6 @@
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 062a38fe0c1c..8e1c7233ec45 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/drivers/usb/serial/whiteheat.c b/drivers/usb/serial/whiteheat.c
index 6e2b52b2b5f8..2487a4d81b98 100644
--- a/drivers/usb/serial/whiteheat.c
+++ b/drivers/usb/serial/whiteheat.c
@@ -16,7 +16,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
-#include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-- 
2.53.0


