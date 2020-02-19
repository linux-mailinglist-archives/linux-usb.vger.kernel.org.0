Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE2C516433B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 12:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgBSLWF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 06:22:05 -0500
Received: from laas.laas.fr ([140.93.0.15]:31630 "EHLO laas.laas.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbgBSLWE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 06:22:04 -0500
Received: from beetle.laas.fr (beetle.laas.fr [IPv6:2001:660:6602:4:4a4d:7eff:fee1:650a])
        by laas.laas.fr (8.16.0.21/8.16.0.29) with SMTP id 01JBLtwu072752;
        Wed, 19 Feb 2020 12:21:55 +0100 (CET)
Received: by beetle.laas.fr (sSMTP sendmail emulation); Wed, 19 Feb 2020 12:21:55 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
         boundary="0h8JoARjji"
Content-Transfer-Encoding: 7bit
Message-ID: <24141.6739.313167.448875@beetle.laas.fr>
Date:   Wed, 19 Feb 2020 12:21:55 +0100
From:   Anthony Mallet <anthony.mallet@laas.fr>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
In-Reply-To: <1582106185.9787.9.camel@suse.com>
References: <24140.5498.228141.264272@beetle.laas.fr>
        <1582106185.9787.9.camel@suse.com>
X-Mailer: VM 8.2.0b under 25.2.2 (x86_64-pc-linux-gnu)
Organization: LAAS/CNRS - Toulouse - France
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--0h8JoARjji
Content-Type: text/plain; charset=us-ascii
Content-Description: message body text
Content-Transfer-Encoding: 7bit

On Wednesday 19 Feb 2020, at 10:56, Oliver Neukum wrote:
> thank you for the detailed report about an unusual bug. Could you
> test the attached patch?

I did not actually run it yet, but at first sight it seems that it will
mishandle the ASYNC_CLOSING_WAIT_NONE case.

I attach patch 0002 which should handle all cases. I also inverted the
logic of the CAP_SYS_ADMIN test, so that the delays are changed only
if the rounded values (in 1/100th of seconds) are actually changed.

While I was there, I checked what other drivers do (it seems that many
have the same issue). Something I also noticed is that the units are
also maybe mishandled: internally the values seem to be in 'jiffies',
not in msecs. See for instance:
https://github.com/torvalds/linux/blob/701a9c8092ddf299d7f90ab2d66b19b4526d1186/drivers/tty/serial/serial_core.c#L780

So I added patch 0001 that uses the jiffies conversion functions. If
you prefer to discuss this in a separate thread please tell me, I will
redo just patch 0002 without this change.


> I have taken the liberty of presuming to add your 'Reported-and-tested-by'.

Yes, no problem. Thank you.
I hope my patches follow the required format, I'm not sure about all
the details.

Regards,
Anthony


--0h8JoARjji
Content-Type: text/x-patch;
	 name="0001-USB-cdc-acm-fix-close_delay-and-closing_wait-units-i.patch"
Content-Disposition: inline;
	 filename="0001-USB-cdc-acm-fix-close_delay-and-closing_wait-units-i.patch"
Content-Transfer-Encoding: 7bit

From 3bc102eaa325fec8c181a51853ce3168dd89befa Mon Sep 17 00:00:00 2001
From: Anthony Mallet <anthony.mallet@laas.fr>
Date: Wed, 19 Feb 2020 11:39:12 +0100
Subject: [PATCH 1/2] USB: cdc-acm: fix close_delay and closing_wait units in
 TIOCSSERIAL

close_delay and closing_wait are specified in hundredth of a second but stored
internally in jiffies. Use the jiffies_to_msecs() and msecs_to_jiffies()
functions to convert from each other.

Reported-and-tested-by: Anthony Mallet <anthony.mallet@laas.fr>
---
 drivers/usb/class/cdc-acm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 62f4fb9b3..da619176d 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -896,10 +896,10 @@ static int get_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 
 	ss->xmit_fifo_size = acm->writesize;
 	ss->baud_base = le32_to_cpu(acm->line.dwDTERate);
-	ss->close_delay	= acm->port.close_delay / 10;
+	ss->close_delay	= jiffies_to_msecs(acm->port.close_delay) / 10;
 	ss->closing_wait = acm->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 				ASYNC_CLOSING_WAIT_NONE :
-				acm->port.closing_wait / 10;
+				jiffies_to_msecs(acm->port.closing_wait) / 10;
 	return 0;
 }
 
@@ -909,9 +909,10 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 	unsigned int closing_wait, close_delay;
 	int retval = 0;
 
-	close_delay = ss->close_delay * 10;
+	close_delay = msecs_to_jiffies(ss->close_delay * 10);
 	closing_wait = ss->closing_wait == ASYNC_CLOSING_WAIT_NONE ?
-			ASYNC_CLOSING_WAIT_NONE : ss->closing_wait * 10;
+			ASYNC_CLOSING_WAIT_NONE :
+			msecs_to_jiffies(ss->closing_wait * 10);
 
 	mutex_lock(&acm->port.mutex);
 
-- 
2.17.1


--0h8JoARjji
Content-Type: text/x-patch;
	 name="0002-USB-cdc-acm-fix-rounding-error-in-TIOCSSERIAL.patch"
Content-Disposition: inline;
	 filename="0002-USB-cdc-acm-fix-rounding-error-in-TIOCSSERIAL.patch"
Content-Transfer-Encoding: 7bit

From 448f387419a5970021b096248aa8650d8c03392d Mon Sep 17 00:00:00 2001
From: Anthony Mallet <anthony.mallet@laas.fr>
Date: Wed, 19 Feb 2020 11:47:03 +0100
Subject: [PATCH 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL

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

Reported-and-tested-by: Anthony Mallet <anthony.mallet@laas.fr>
Fixes: ba2d8ce9db0a6 ("cdc-acm: implement TIOCSSERIAL to avoid blocking close(2)")
---
 drivers/usb/class/cdc-acm.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index da619176d..b43820fb2 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -907,6 +907,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 {
 	struct acm *acm = tty->driver_data;
 	unsigned int closing_wait, close_delay;
+	unsigned int old_closing_wait, old_close_delay;
 	int retval = 0;
 
 	close_delay = msecs_to_jiffies(ss->close_delay * 10);
@@ -914,18 +915,24 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
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
+		if (!capable(CAP_SYS_ADMIN)) {
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
@@ -969,7 +976,7 @@ static int wait_serial_change(struct acm *acm, unsigned long arg)
 		}
 	} while (!rv);
 
-	
+
 
 	return rv;
 }
-- 
2.17.1


--0h8JoARjji--
