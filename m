Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B737A187C5
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 11:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfEIJbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 05:31:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:59324 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726491AbfEIJbf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 05:31:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F05F7AB7D;
        Thu,  9 May 2019 09:31:33 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     miquel@df.uba.ar, gregKH@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3 4/4] USB: rio500: update Documentation
Date:   Thu,  9 May 2019 11:31:01 +0200
Message-Id: <20190509093101.11450-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190509093101.11450-1-oneukum@suse.com>
References: <20190509093101.11450-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added the newly added limit and updated the text a bit

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 Documentation/usb/rio.txt | 66 ++++++++++-------------------------------------
 1 file changed, 13 insertions(+), 53 deletions(-)

diff --git a/Documentation/usb/rio.txt b/Documentation/usb/rio.txt
index ca9adcf56355..ea73475471db 100644
--- a/Documentation/usb/rio.txt
+++ b/Documentation/usb/rio.txt
@@ -76,70 +76,30 @@ Additional Information and userspace tools
 Requirements
 ============
 
-A host with a USB port.  Ideally, either a UHCI (Intel) or OHCI
-(Compaq and others) hardware port should work.
+A host with a USB port running a Linux kernel with RIO 500 support enabled.
 
-A Linux development kernel (2.3.x) with USB support enabled or a
-backported version to linux-2.2.x.  See http://www.linux-usb.org for
-more information on accomplishing this.
+The driver is a module called rio500, which should be automatically loaded
+as you plug in your device. If that fails you can manually load it with
 
-A Linux kernel with RIO 500 support enabled.
+  modprobe rio500
 
-'lspci' which is only needed to determine the type of USB hardware
-available in your machine.
-
-Configuration
-
-Using `lspci -v`, determine the type of USB hardware available.
-
-  If you see something like::
-
-    USB Controller: ......
-    Flags: .....
-    I/O ports at ....
-
-  Then you have a UHCI based controller.
-
-  If you see something like::
-
-     USB Controller: .....
-     Flags: ....
-     Memory at .....
-
-  Then you have a OHCI based controller.
-
-Using `make menuconfig` or your preferred method for configuring the
-kernel, select 'Support for USB', 'OHCI/UHCI' depending on your
-hardware (determined from the steps above), 'USB Diamond Rio500 support', and
-'Preliminary USB device filesystem'.  Compile and install the modules
-(you may need to execute `depmod -a` to update the module
-dependencies).
-
-Add a device for the USB rio500::
+Udev should automatically create a device node as soon as plug in your device.
+If that fails, you can manually add a device for the USB rio500::
 
   mknod /dev/usb/rio500 c 180 64
 
-Set appropriate permissions for /dev/usb/rio500 (don't forget about
-group and world permissions).  Both read and write permissions are
+In that case, set appropriate permissions for /dev/usb/rio500 (don't forget
+about group and world permissions).  Both read and write permissions are
 required for proper operation.
 
-Load the appropriate modules (if compiled as modules):
-
-  OHCI::
-
-    modprobe usbcore
-    modprobe usb-ohci
-    modprobe rio500
-
-  UHCI::
-
-    modprobe usbcore
-    modprobe usb-uhci  (or uhci)
-    modprobe rio500
-
 That's it.  The Rio500 Utils at: http://rio500.sourceforge.net should
 be able to access the rio500.
 
+Limits
+======
+
+You can use only a single rio500 device at a time with your computer.
+
 Bugs
 ====
 
-- 
2.16.4

