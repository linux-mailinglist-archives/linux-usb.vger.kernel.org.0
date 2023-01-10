Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D667663FCE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 13:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjAJMEr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 07:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238369AbjAJMDu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 07:03:50 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1AD59323;
        Tue, 10 Jan 2023 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673352228; x=1704888228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AWWr/BlbU8yzxpuWX74jI3h7EABvwrmH5cTRTGGc+aE=;
  b=nuMTL+cHJB7aeW8wf02L+gISsn6jtyRBRVkHJ1XUiVyh1UPnWcY2T3I/
   Foch20Rs4odkkHVYp3XSFYe1R/GQrvO9Rt3TjMYWfQ4iecisjrYCGHioj
   JE21MKMD8bo+cIqisV1gm5RNr6U5U8vX/gRShT1A8Rr/guxhaKCd54hi6
   QcYMtYwQhc5bloCs7PpJeRkgXKX9GPAV/iP4JNDKHAKuMmX0sNmyphrDR
   0rRtEwiZP8ZmHpsCt/BbhvAQL/miT//N2LydVINCzhKiJDz65hw3zc092
   sI7T9zzhXlWH8dCbf/qwHBIuZrmeLJZb4hkDGcQ0WLfQIbG3qsBN56cGr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="350350165"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="350350165"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 04:03:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="799406968"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="799406968"
Received: from gbocanex-mobl.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.249.44.115])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 04:03:39 -0800
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Samuel=20Iglesias=20Gons=C3=A1lvez?= 
        <siglesias@igalia.com>, Rodolfo Giometti <giometti@enneenne.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 08/13] tty/serial: Make ->dcd_change()+uart_handle_dcd_change() status bool active
Date:   Tue, 10 Jan 2023 14:02:21 +0200
Message-Id: <20230110120226.14972-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110120226.14972-1-ilpo.jarvinen@linux.intel.com>
References: <20230110120226.14972-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert status parameter for ->dcd_change() and
uart_handle_dcd_change() to bool which matches to how the parameter is
used.

Rename status to active to better describe what the parameter means.

Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pps/clients/pps-ldisc.c  |  6 +++---
 drivers/tty/serial/serial_core.c |  8 ++++----
 drivers/tty/serial/sunhv.c       |  8 ++++----
 drivers/usb/serial/generic.c     | 10 +++++-----
 include/linux/serial_core.h      |  3 +--
 include/linux/tty_ldisc.h        |  4 ++--
 include/linux/usb/serial.h       |  2 +-
 7 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/pps/clients/pps-ldisc.c b/drivers/pps/clients/pps-ldisc.c
index d73c4c2ed4e1..443d6bae19d1 100644
--- a/drivers/pps/clients/pps-ldisc.c
+++ b/drivers/pps/clients/pps-ldisc.c
@@ -13,7 +13,7 @@
 #include <linux/pps_kernel.h>
 #include <linux/bug.h>
 
-static void pps_tty_dcd_change(struct tty_struct *tty, unsigned int status)
+static void pps_tty_dcd_change(struct tty_struct *tty, bool active)
 {
 	struct pps_device *pps;
 	struct pps_event_time ts;
@@ -29,11 +29,11 @@ static void pps_tty_dcd_change(struct tty_struct *tty, unsigned int status)
 		return;
 
 	/* Now do the PPS event report */
-	pps_event(pps, &ts, status ? PPS_CAPTUREASSERT :
+	pps_event(pps, &ts, active ? PPS_CAPTUREASSERT :
 			PPS_CAPTURECLEAR, NULL);
 
 	dev_dbg(pps->dev, "PPS %s at %lu\n",
-			status ? "assert" : "clear", jiffies);
+			active ? "assert" : "clear", jiffies);
 }
 
 static int (*alias_n_tty_open)(struct tty_struct *tty);
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 053535846ba2..f8a9386db482 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3252,11 +3252,11 @@ EXPORT_SYMBOL(uart_match_port);
 /**
  * uart_handle_dcd_change - handle a change of carrier detect state
  * @uport: uart_port structure for the open port
- * @status: new carrier detect status, nonzero if active
+ * @active: new carrier detect status
  *
  * Caller must hold uport->lock.
  */
-void uart_handle_dcd_change(struct uart_port *uport, unsigned int status)
+void uart_handle_dcd_change(struct uart_port *uport, bool active)
 {
 	struct tty_port *port = &uport->state->port;
 	struct tty_struct *tty = port->tty;
@@ -3268,7 +3268,7 @@ void uart_handle_dcd_change(struct uart_port *uport, unsigned int status)
 		ld = tty_ldisc_ref(tty);
 		if (ld) {
 			if (ld->ops->dcd_change)
-				ld->ops->dcd_change(tty, status);
+				ld->ops->dcd_change(tty, active);
 			tty_ldisc_deref(ld);
 		}
 	}
@@ -3276,7 +3276,7 @@ void uart_handle_dcd_change(struct uart_port *uport, unsigned int status)
 	uport->icount.dcd++;
 
 	if (uart_dcd_enabled(uport)) {
-		if (status)
+		if (active)
 			wake_up_interruptible(&port->open_wait);
 		else if (tty)
 			tty_hangup(tty);
diff --git a/drivers/tty/serial/sunhv.c b/drivers/tty/serial/sunhv.c
index 16c746a63258..7d38c33ef506 100644
--- a/drivers/tty/serial/sunhv.c
+++ b/drivers/tty/serial/sunhv.c
@@ -87,10 +87,10 @@ static int receive_chars_getchar(struct uart_port *port)
 
 		if (c == CON_HUP) {
 			hung_up = 1;
-			uart_handle_dcd_change(port, 0);
+			uart_handle_dcd_change(port, false);
 		} else if (hung_up) {
 			hung_up = 0;
-			uart_handle_dcd_change(port, 1);
+			uart_handle_dcd_change(port, true);
 		}
 
 		if (port->state == NULL) {
@@ -133,7 +133,7 @@ static int receive_chars_read(struct uart_port *port)
 				bytes_read = 1;
 			} else if (stat == CON_HUP) {
 				hung_up = 1;
-				uart_handle_dcd_change(port, 0);
+				uart_handle_dcd_change(port, false);
 				continue;
 			} else {
 				/* HV_EWOULDBLOCK, etc.  */
@@ -143,7 +143,7 @@ static int receive_chars_read(struct uart_port *port)
 
 		if (hung_up) {
 			hung_up = 0;
-			uart_handle_dcd_change(port, 1);
+			uart_handle_dcd_change(port, true);
 		}
 
 		if (port->sysrq != 0 &&  *con_read_page) {
diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 15b6dee3a8e5..f2d31e56eafc 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -605,24 +605,24 @@ EXPORT_SYMBOL_GPL(usb_serial_handle_break);
  * usb_serial_handle_dcd_change - handle a change of carrier detect state
  * @port: usb-serial port
  * @tty: tty for the port
- * @status: new carrier detect status, nonzero if active
+ * @active: new carrier-detect status
  */
 void usb_serial_handle_dcd_change(struct usb_serial_port *port,
-				struct tty_struct *tty, unsigned int status)
+				struct tty_struct *tty, bool active)
 {
-	dev_dbg(&port->dev, "%s - status %d\n", __func__, status);
+	dev_dbg(&port->dev, "%s - active %d\n", __func__, active);
 
 	if (tty) {
 		struct tty_ldisc *ld = tty_ldisc_ref(tty);
 
 		if (ld) {
 			if (ld->ops->dcd_change)
-				ld->ops->dcd_change(tty, status);
+				ld->ops->dcd_change(tty, active);
 			tty_ldisc_deref(ld);
 		}
 	}
 
-	if (status)
+	if (active)
 		wake_up_interruptible(&port->port.open_wait);
 	else if (tty && !C_CLOCAL(tty))
 		tty_hangup(tty);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index fd59f600094a..760c96ffb5bd 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -896,8 +896,7 @@ static inline bool uart_softcts_mode(struct uart_port *uport)
  * The following are helper functions for the low level drivers.
  */
 
-extern void uart_handle_dcd_change(struct uart_port *uport,
-		unsigned int status);
+extern void uart_handle_dcd_change(struct uart_port *uport, bool active);
 extern void uart_handle_cts_change(struct uart_port *uport,
 		unsigned int status);
 
diff --git a/include/linux/tty_ldisc.h b/include/linux/tty_ldisc.h
index dcb61ec11424..49dc172dedc7 100644
--- a/include/linux/tty_ldisc.h
+++ b/include/linux/tty_ldisc.h
@@ -170,7 +170,7 @@ int ldsem_down_write_nested(struct ld_semaphore *sem, int subclass,
  *	send, please arise a tasklet or workqueue to do the real data transfer.
  *	Do not send data in this hook, it may lead to a deadlock.
  *
- * @dcd_change: [DRV] ``void ()(struct tty_struct *tty, unsigned int status)``
+ * @dcd_change: [DRV] ``void ()(struct tty_struct *tty, bool active)``
  *
  *	Tells the discipline that the DCD pin has changed its status. Used
  *	exclusively by the %N_PPS (Pulse-Per-Second) line discipline.
@@ -238,7 +238,7 @@ struct tty_ldisc_ops {
 	void	(*receive_buf)(struct tty_struct *tty, const unsigned char *cp,
 			       const char *fp, int count);
 	void	(*write_wakeup)(struct tty_struct *tty);
-	void	(*dcd_change)(struct tty_struct *tty, unsigned int status);
+	void	(*dcd_change)(struct tty_struct *tty, bool active);
 	int	(*receive_buf2)(struct tty_struct *tty, const unsigned char *cp,
 				const char *fp, int count);
 	void	(*lookahead_buf)(struct tty_struct *tty, const unsigned char *cp,
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index c597357853d9..bad343c5e8a7 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -372,7 +372,7 @@ static inline int usb_serial_handle_break(struct usb_serial_port *port)
 #endif
 
 void usb_serial_handle_dcd_change(struct usb_serial_port *usb_port,
-		struct tty_struct *tty, unsigned int status);
+				  struct tty_struct *tty, bool active);
 
 
 int usb_serial_bus_register(struct usb_serial_driver *device);
-- 
2.30.2

