Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EF133D966
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 17:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhCPQ13 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 12:27:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43265 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236716AbhCPQ0w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 12:26:52 -0400
Received: (qmail 451099 invoked by uid 1000); 16 Mar 2021 12:26:50 -0400
Date:   Tue, 16 Mar 2021 12:26:50 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Schwarzott <zzam@gentoo.org>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp,
        Lennart Poettering <lennart@poettering.net>,
        systemd-devel@lists.freedesktop.org
Subject: Re: [usb-storage] Re: Amazon Kindle disconnect after Synchronize
 Cache
Message-ID: <20210316162650.GB448722@rowland.harvard.edu>
References: <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
 <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 16, 2021 at 06:26:30AM +0100, Matthias Schwarzott wrote:
> I implemented solution 3b. This is the pullrequest for udev (systemd
> repository):
> 
> 	https://github.com/systemd/systemd/pull/19002
> 
> Now Lennart asks if udev is the best place for such hacks/work-arounds?
> 
> Well, I implemented it as suggested by Alan (see above). This was the
> simplest of the considered alternatives. Different quirks in kernel has been
> considered, but are more effort to be implemented.

Lennart probably isn't aware how the usb-storage driver works.  It does 
not create commands on its own; it merely sends the commands that it 
gets from higher SCSI layers.

It may be possible to modify the SCSI core, to make it send a TEST UNIT 
READY command immediately following any SYNCHRONIZE CACHE to a Kindle.

However, there may be an easier solution.  usb-storage does indeed send 
a command of its own, REQUEST SENSE, to get error data when a command 
fails.  The patch below will make it do the same thing whenever it sends 
a SYNCHRONIZE CACHE to a Kindle, failure or not.

The only question is whether the Kindle will regard REQUEST SENSE as a 
sufficient indication that it shouldn't do an eject.  The only way to 
find out is by testing the patch.

Alan Stern



Index: usb-devel/drivers/usb/storage/transport.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/transport.c
+++ usb-devel/drivers/usb/storage/transport.c
@@ -656,6 +656,13 @@ void usb_stor_invoke_transport(struct sc
 		need_auto_sense = 1;
 	}
 
+	/* Some devices (Kindle) require another command after SYNC CACHE */
+	if (us->fflags & US_FL_CHECK_AFTER_SYNC &&
+			srb->cmnd[0] == SYNCHRONIZE_CACHE) {
+		usb_stor_dbg(us, "-- sense after SYNC CACHE\n");
+		need_auto_sense = 1;
+	}
+
 	/*
 	 * If we have a failure, we're going to do a REQUEST_SENSE 
 	 * automatically.  Note that we differentiate between a command
Index: usb-devel/drivers/usb/storage/unusual_devs.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_devs.h
+++ usb-devel/drivers/usb/storage/unusual_devs.h
@@ -2212,6 +2212,18 @@ UNUSUAL_DEV( 0x1908, 0x3335, 0x0200, 0x0
 		US_FL_NO_READ_DISC_INFO ),
 
 /*
+ * Reported by Matthias Schwarzott <zzam@gentoo.org>
+ * The Amazon Kindle treats SYNCHRONIZE CACHE as an indication that
+ * the host may be finished with it, and automatically ejects its
+ * media unless it receives another command within one second.
+ */
+UNUSUAL_DEV( 0x1949, 0x0004, 0x0000, 0x9999,
+		"Amazon",
+		"Kindle",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_CHECK_AFTER_SYNC ),
+
+/*
  * Reported by Oliver Neukum <oneukum@suse.com>
  * This device morphes spontaneously into another device if the access
  * pattern of Windows isn't followed. Thus writable media would be dirty
Index: usb-devel/include/linux/usb_usual.h
===================================================================
--- usb-devel.orig/include/linux/usb_usual.h
+++ usb-devel/include/linux/usb_usual.h
@@ -86,6 +86,8 @@
 		/* lies about caching, so always sync */	\
 	US_FLAG(NO_SAME, 0x40000000)				\
 		/* Cannot handle WRITE_SAME */			\
+	US_FLAG(CHECK_AFTER_SYNC, 0x80000000)			\
+		/* Check sense after SYNCHRONIZE_CACHE */	\
 
 #define US_FLAG(name, value)	US_FL_##name = value ,
 enum { US_DO_ALL_FLAGS };
