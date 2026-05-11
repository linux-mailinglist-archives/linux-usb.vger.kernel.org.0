Return-Path: <linux-usb+bounces-37231-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG1QIWqCAWpObwEAu9opvQ
	(envelope-from <linux-usb+bounces-37231-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D0508F67
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6504F300B52E
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907EE37E31E;
	Mon, 11 May 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljAZa+cH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634D1C5F11;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=U9+hsnZamGNM081CINwyzmQwYvaDnlv1jPYnM91MDY7YH9CsoerS0NlvXciM/vrlH1KwEQ7Z8uJ7hAAqTjDSRVvEOkXTaYzada6ik5Cl1NJoDaxd5hn0trRlZBDIyHWpstEqjTSr6U0sI3R5X9xIZAADkzGVkUtenWiVfK3OTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=oR4FI8tgxu4UekbFN2nRRGLLrnvkD4P29KG9EMuiJCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJ7z84zZ+s/W0l4CcQA3ebT0hgp0JUe/5WpUgUjWobnCn7K9Xz7Dz54r2HYDsX/nYUz7b542wO48Fsq4PSB+3iGyhIxuM7wruAvcPMA/+Af+Hw3nEQmjrEnLXM2mNZeDZgC4QBhUqJIBXcc6ezi2a59iCTIjioUSm9lUk6RRZcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljAZa+cH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2753C2BCFC;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=oR4FI8tgxu4UekbFN2nRRGLLrnvkD4P29KG9EMuiJCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljAZa+cHFJvVjcxbIkPl5xPeqRRYYH1qxF3Y03XQXd6AFxhqHLVZRLHQIIprPRoUB
	 ZyfUbAF3lCYD5fzE65bwELf8UY86m3RxRIJ7ZX+Mdj3i9uxBHCHAkBhjgkC4kQq7t6
	 OsLss3LdAthgy4uDRp6KGWg4r3QSNj0RABbrxznBQU4itpdyIeoTgLo/hnsGLwIjgE
	 e/c64y1dRAdvhyys3LFoSBBAaYLnEsAMBIII10T05zEoh6AhNRTohhN1dS4/EyHiy4
	 IQwla2R8DZxs0RZzND0bwLgU3ZhSaeZwt3YzLAfV9ikrhDiS7/fyj53+bNFpyiORx4
	 QcgleW8JeA1tA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCR-2u3t;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] USB: serial: drop unused uaccess includes
Date: Mon, 11 May 2026 09:14:44 +0200
Message-ID: <20260511071448.611875-5-johan@kernel.org>
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
X-Rspamd-Queue-Id: C90D0508F67
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
	TAGGED_FROM(0.00)[bounces-37231-lists,linux-usb=lfdr.de];
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

These drivers (and usb-serial.c) no longer use anything from uaccess.h
directly so drop the unnecessary include directives.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ark3116.c          | 1 -
 drivers/usb/serial/belkin_sa.c        | 1 -
 drivers/usb/serial/cyberjack.c        | 1 -
 drivers/usb/serial/cypress_m8.c       | 1 -
 drivers/usb/serial/digi_acceleport.c  | 1 -
 drivers/usb/serial/empeg.c            | 1 -
 drivers/usb/serial/f81232.c           | 1 -
 drivers/usb/serial/f81534.c           | 1 -
 drivers/usb/serial/garmin_gps.c       | 1 -
 drivers/usb/serial/generic.c          | 1 -
 drivers/usb/serial/io_ti.c            | 1 -
 drivers/usb/serial/ipaq.c             | 1 -
 drivers/usb/serial/ipw.c              | 1 -
 drivers/usb/serial/ir-usb.c           | 1 -
 drivers/usb/serial/iuu_phoenix.c      | 1 -
 drivers/usb/serial/keyspan.c          | 1 -
 drivers/usb/serial/keyspan_pda.c      | 1 -
 drivers/usb/serial/kl5kusb105.c       | 1 -
 drivers/usb/serial/kobil_sct.c        | 1 -
 drivers/usb/serial/mct_u232.c         | 1 -
 drivers/usb/serial/metro-usb.c        | 1 -
 drivers/usb/serial/mxuport.c          | 1 -
 drivers/usb/serial/omninet.c          | 1 -
 drivers/usb/serial/opticon.c          | 1 -
 drivers/usb/serial/oti6858.c          | 1 -
 drivers/usb/serial/pl2303.c           | 1 -
 drivers/usb/serial/quatech2.c         | 1 -
 drivers/usb/serial/safe_serial.c      | 1 -
 drivers/usb/serial/ssu100.c           | 1 -
 drivers/usb/serial/symbolserial.c     | 1 -
 drivers/usb/serial/ti_usb_3410_5052.c | 1 -
 drivers/usb/serial/usb-serial.c       | 1 -
 drivers/usb/serial/usb_wwan.c         | 1 -
 drivers/usb/serial/visor.c            | 1 -
 drivers/usb/serial/whiteheat.c        | 1 -
 drivers/usb/serial/wishbone-serial.c  | 1 -
 drivers/usb/serial/xsens_mt.c         | 1 -
 37 files changed, 37 deletions(-)

diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
index d974da43fba3..3a574b6ee0c4 100644
--- a/drivers/usb/serial/ark3116.c
+++ b/drivers/usb/serial/ark3116.c
@@ -28,7 +28,6 @@
 #include <linux/usb/serial.h>
 #include <linux/serial.h>
 #include <linux/serial_reg.h>
-#include <linux/uaccess.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
index adeb8e3441cf..36dcdb15d6ab 100644
--- a/drivers/usb/serial/belkin_sa.c
+++ b/drivers/usb/serial/belkin_sa.c
@@ -26,7 +26,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include "belkin_sa.h"
diff --git a/drivers/usb/serial/cyberjack.c b/drivers/usb/serial/cyberjack.c
index f457c8a65934..57e20eb02a46 100644
--- a/drivers/usb/serial/cyberjack.c
+++ b/drivers/usb/serial/cyberjack.c
@@ -31,7 +31,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index 5322f4b3cce6..1d61968ab69a 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -34,7 +34,6 @@
 #include <linux/serial.h>
 #include <linux/kfifo.h>
 #include <linux/delay.h>
-#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
 #include "cypress_m8.h"
diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 85dbf87aa361..a75813a57fbe 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -18,7 +18,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/wait.h>
 #include <linux/sched/signal.h>
diff --git a/drivers/usb/serial/empeg.c b/drivers/usb/serial/empeg.c
index 48e1a58ea3f5..4937575caff1 100644
--- a/drivers/usb/serial/empeg.c
+++ b/drivers/usb/serial/empeg.c
@@ -18,7 +18,6 @@
 #include <linux/tty.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/f81232.c b/drivers/usb/serial/f81232.c
index 74b55fd9fd3f..3a32f93a9738 100644
--- a/drivers/usb/serial/f81232.c
+++ b/drivers/usb/serial/f81232.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/serial_reg.h>
diff --git a/drivers/usb/serial/f81534.c b/drivers/usb/serial/f81534.c
index 685930ac8383..0037767e4bbf 100644
--- a/drivers/usb/serial/f81534.c
+++ b/drivers/usb/serial/f81534.c
@@ -28,7 +28,6 @@
 #include <linux/usb/serial.h>
 #include <linux/serial_reg.h>
 #include <linux/module.h>
-#include <linux/uaccess.h>
 
 /* Serial Port register Address */
 #define F81534_UART_BASE_ADDRESS	0x1200
diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 6ab3ad7be7fc..9f955962d546 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -18,7 +18,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/atomic.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 757f0a586ddb..6eaf74930aa3 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -17,7 +17,6 @@
 #include <linux/moduleparam.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-#include <linux/uaccess.h>
 #include <linux/kfifo.h>
 #include <linux/serial.h>
 
diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 21a631d8e88f..28e16515c7f1 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -27,7 +27,6 @@
 #include <linux/kfifo.h>
 #include <linux/ioctl.h>
 #include <linux/firmware.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/ipaq.c b/drivers/usb/serial/ipaq.c
index eb9b7a7b1d14..c01bdbcb3f55 100644
--- a/drivers/usb/serial/ipaq.c
+++ b/drivers/usb/serial/ipaq.c
@@ -12,7 +12,6 @@
 #include <linux/tty.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/ipw.c b/drivers/usb/serial/ipw.c
index b900d0317a71..5be153f2c68d 100644
--- a/drivers/usb/serial/ipw.c
+++ b/drivers/usb/serial/ipw.c
@@ -40,7 +40,6 @@
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-#include <linux/uaccess.h>
 #include "usb-wwan.h"
 
 #define DRIVER_AUTHOR	"Roelf Diedericks"
diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
index bda33a8976c7..aac84539730d 100644
--- a/drivers/usb/serial/ir-usb.c
+++ b/drivers/usb/serial/ir-usb.c
@@ -28,7 +28,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/usb/irda.h>
diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 6f2fd3a39d8e..3b1f7546fb5c 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include "iuu_phoenix.h"
diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index eb6e3d9d9ea7..4eea5ced2199 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -32,7 +32,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/usb/ezusb.h>
diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index 23a7683669eb..3b99f9676c35 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/usb/ezusb.h>
diff --git a/drivers/usb/serial/kl5kusb105.c b/drivers/usb/serial/kl5kusb105.c
index 64b7539043b1..e7917871ddf1 100644
--- a/drivers/usb/serial/kl5kusb105.c
+++ b/drivers/usb/serial/kl5kusb105.c
@@ -37,7 +37,6 @@
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
-#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/kobil_sct.c b/drivers/usb/serial/kobil_sct.c
index 2be31d7a7e1f..4a622cf8e6ae 100644
--- a/drivers/usb/serial/kobil_sct.c
+++ b/drivers/usb/serial/kobil_sct.c
@@ -26,7 +26,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/ioctl.h>
diff --git a/drivers/usb/serial/mct_u232.c b/drivers/usb/serial/mct_u232.c
index e009c2500a91..0e59289e7518 100644
--- a/drivers/usb/serial/mct_u232.c
+++ b/drivers/usb/serial/mct_u232.c
@@ -24,7 +24,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/metro-usb.c b/drivers/usb/serial/metro-usb.c
index 45e370593d4c..5fcd89f57ef3 100644
--- a/drivers/usb/serial/metro-usb.c
+++ b/drivers/usb/serial/metro-usb.c
@@ -16,7 +16,6 @@
 #include <linux/tty_flip.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb/serial.h>
 
 #define DRIVER_DESC "Metrologic Instruments Inc. - USB-POS driver"
diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 8f7ff187dbf5..9bdc5e2fee96 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/unaligned.h>
diff --git a/drivers/usb/serial/omninet.c b/drivers/usb/serial/omninet.c
index 3e44250dd360..1f35a7e7654f 100644
--- a/drivers/usb/serial/omninet.c
+++ b/drivers/usb/serial/omninet.c
@@ -16,7 +16,6 @@
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/opticon.c b/drivers/usb/serial/opticon.c
index b0c6e3578cf8..152dfc901cd8 100644
--- a/drivers/usb/serial/opticon.c
+++ b/drivers/usb/serial/opticon.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-#include <linux/uaccess.h>
 
 #define CONTROL_RTS			0x02
 #define RESEND_CTS_STATE	0x03
diff --git a/drivers/usb/serial/oti6858.c b/drivers/usb/serial/oti6858.c
index bb55bbb7ff25..77f34d7651d6 100644
--- a/drivers/usb/serial/oti6858.c
+++ b/drivers/usb/serial/oti6858.c
@@ -45,7 +45,6 @@
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-#include <linux/uaccess.h>
 #include <linux/kfifo.h>
 #include "oti6858.h"
 
diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 790c44c5d9b6..128c80f11f49 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/unaligned.h>
diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
index fc94d6026a62..dc2b39810a26 100644
--- a/drivers/usb/serial/quatech2.c
+++ b/drivers/usb/serial/quatech2.c
@@ -19,7 +19,6 @@
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/serial_reg.h>
-#include <linux/uaccess.h>
 
 /* default urb timeout for usb operations */
 #define QT2_USB_TIMEOUT USB_CTRL_SET_TIMEOUT
diff --git a/drivers/usb/serial/safe_serial.c b/drivers/usb/serial/safe_serial.c
index fa4128a0c933..a82b6453d79c 100644
--- a/drivers/usb/serial/safe_serial.c
+++ b/drivers/usb/serial/safe_serial.c
@@ -67,7 +67,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/ssu100.c b/drivers/usb/serial/ssu100.c
index 09fb698d3d89..b0d51558b73c 100644
--- a/drivers/usb/serial/ssu100.c
+++ b/drivers/usb/serial/ssu100.c
@@ -15,7 +15,6 @@
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/serial_reg.h>
-#include <linux/uaccess.h>
 
 #define QT_OPEN_CLOSE_CHANNEL       0xca
 #define QT_SET_GET_DEVICE           0xc2
diff --git a/drivers/usb/serial/symbolserial.c b/drivers/usb/serial/symbolserial.c
index c1f54248ecbb..8823671a9c7a 100644
--- a/drivers/usb/serial/symbolserial.c
+++ b/drivers/usb/serial/symbolserial.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-#include <linux/uaccess.h>
 
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x05e0, 0x0600) },
diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index a68d91c548b9..b3f00e315815 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -25,7 +25,6 @@
 #include <linux/serial.h>
 #include <linux/kfifo.h>
 #include <linux/mutex.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 67e880955ce7..45e8a0b8d438 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -28,7 +28,6 @@
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
-#include <linux/uaccess.h>
 #include <linux/serial.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index e752ffa4dc62..a183cc4515ed 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -27,7 +27,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/bitops.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/cdc.h>
 #include <linux/usb/serial.h>
diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 06e30be10ca6..75f290a67cb4 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/spinlock.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 #include <linux/usb/cdc.h>
diff --git a/drivers/usb/serial/whiteheat.c b/drivers/usb/serial/whiteheat.c
index 7ba05a1a3eae..106e9b5443d3 100644
--- a/drivers/usb/serial/whiteheat.c
+++ b/drivers/usb/serial/whiteheat.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
-#include <linux/uaccess.h>
 #include <asm/termbits.h>
 #include <linux/usb.h>
 #include <linux/serial_reg.h>
diff --git a/drivers/usb/serial/wishbone-serial.c b/drivers/usb/serial/wishbone-serial.c
index 670d573f6b63..4a1fed4cb57b 100644
--- a/drivers/usb/serial/wishbone-serial.c
+++ b/drivers/usb/serial/wishbone-serial.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-#include <linux/uaccess.h>
 
 #define GSI_VENDOR_OPENCLOSE 0xB0
 
diff --git a/drivers/usb/serial/xsens_mt.c b/drivers/usb/serial/xsens_mt.c
index 382b3698c1d5..151a6e893ba2 100644
--- a/drivers/usb/serial/xsens_mt.c
+++ b/drivers/usb/serial/xsens_mt.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
-#include <linux/uaccess.h>
 
 #define XSENS_VID 0x2639
 
-- 
2.53.0


