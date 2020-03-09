Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A9817DCA3
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 10:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgCIJwP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 05:52:15 -0400
Received: from laas.laas.fr ([140.93.0.15]:19220 "EHLO laas.laas.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbgCIJwP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Mar 2020 05:52:15 -0400
Received: from beetle.laas.fr (beetle.laas.fr [IPv6:2001:660:6602:4:4a4d:7eff:fee1:650a])
        by laas.laas.fr (8.16.0.21/8.16.0.29) with SMTP id 0299q8o3033093;
        Mon, 9 Mar 2020 10:52:08 +0100 (CET)
Received: by beetle.laas.fr (sSMTP sendmail emulation); Mon, 09 Mar 2020 10:52:08 +0100
From:   Anthony Mallet <anthony.mallet@laas.fr>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Cc:     Anthony Mallet <anthony.mallet@laas.fr>
Subject: [PATCH 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
Date:   Mon,  9 Mar 2020 10:51:59 +0100
Message-Id: <20200309095159.14163-2-anthony.mallet@laas.fr>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309095159.14163-1-anthony.mallet@laas.fr>
References: <20200309095159.14163-1-anthony.mallet@laas.fr>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting the bug reporter:

By default, tty_port_init() initializes those parameters to a multiple
of HZ. For instance in line 69 of tty_port.c:
   port->close_delay = (50 * HZ) / 100;
https://github.com/torvalds/linux/blob/master/drivers/tty/tty_port.c#L69

With e.g. CONFIG_HZ = 250 (as this is the case for Ubuntu 18.04
linux-image-4.15.0-37-generic), the default setting for close_delay is
thus 125.

When ioctl(fd, TIOCGSERIAL, &s) is executed, the setting returned in
user space is '12' (125/10). When ioctl(fd, TIOCSSERIAL, &s) is then
executed with the same setting '12', the value is interpreted as '120'
which is different from the current setting and a EPERM error may be
raised by set_serial_info() if !CAP_SYS_ADMIN.
https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L919

Fixes: ba2d8ce9db0a6 ("cdc-acm: implement TIOCSSERIAL to avoid blocking close(2)")
Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
---
 drivers/usb/class/cdc-acm.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index da619176deca..a41a3d27016c 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -907,6 +907,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 {
 	struct acm *acm = tty->driver_data;
 	unsigned int closing_wait, close_delay;
+	unsigned int old_closing_wait, old_close_delay;
 	int retval = 0;
 
 	close_delay = msecs_to_jiffies(ss->close_delay * 10);
@@ -914,19 +915,24 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 			ASYNC_CLOSING_WAIT_NONE :
 			msecs_to_jiffies(ss->closing_wait * 10);
 
+	/* we must redo the rounding here, so that the values match */
+	old_close_delay	= jiffies_to_msecs(acm->port.close_delay) / 10;
+	old_closing_wait = acm->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
+				ASYNC_CLOSING_WAIT_NONE :
+				jiffies_to_msecs(acm->port.closing_wait) / 10;
+
 	mutex_lock(&acm->port.mutex);
 
-	if (!capable(CAP_SYS_ADMIN)) {
-		if ((close_delay != acm->port.close_delay) ||
-		    (closing_wait != acm->port.closing_wait))
+	if ((ss->close_delay != old_close_delay) ||
+            (ss->closing_wait != old_closing_wait)) {
+		if (!capable(CAP_SYS_ADMIN))
 			retval = -EPERM;
-		else
-			retval = -EOPNOTSUPP;
-	} else {
-		acm->port.close_delay  = close_delay;
-		acm->port.closing_wait = closing_wait;
-	}
+		else {
+			acm->port.close_delay  = close_delay;
+			acm->port.closing_wait = closing_wait;
+		}
+	} else
+		retval = -EOPNOTSUPP;
 
 	mutex_unlock(&acm->port.mutex);
 	return retval;
-- 
2.17.1

