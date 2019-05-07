Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E318915E5C
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 09:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfEGHjI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 03:39:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:57326 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726922AbfEGHjG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 May 2019 03:39:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4B3C5AF58;
        Tue,  7 May 2019 07:39:05 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, miquel@df.uba.ar,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 4/4] USB: rio500: update Documentation
Date:   Tue,  7 May 2019 09:38:37 +0200
Message-Id: <20190507073837.19234-4-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190507073837.19234-1-oneukum@suse.com>
References: <20190507073837.19234-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added the newly added limit and updated the text a bit

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 Documentation/usb/rio.txt | 54 +++++++++++++----------------------------------
 1 file changed, 15 insertions(+), 39 deletions(-)

diff --git a/Documentation/usb/rio.txt b/Documentation/usb/rio.txt
index ca9adcf56355..63adb030e0e9 100644
--- a/Documentation/usb/rio.txt
+++ b/Documentation/usb/rio.txt
@@ -76,54 +76,25 @@ Additional Information and userspace tools
 Requirements
 ============
 
-A host with a USB port.  Ideally, either a UHCI (Intel) or OHCI
-(Compaq and others) hardware port should work.
+A host with a USB port running a Linux kernel with RIO 500 support enabled.
 
-A Linux development kernel (2.3.x) with USB support enabled or a
-backported version to linux-2.2.x.  See http://www.linux-usb.org for
-more information on accomplishing this.
+The driver is a module called rio500, which should be automatically loaded
+as you plug in your device.
+If that fails you can manually load it with
 
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
+In that case,
+set appropriate permissions for /dev/usb/rio500 (don't forget about
 group and world permissions).  Both read and write permissions are
 required for proper operation.
 
-Load the appropriate modules (if compiled as modules):
+Load the appropriate modules (if ddcompiled as modules):
 
   OHCI::
 
@@ -140,6 +111,11 @@ Load the appropriate modules (if compiled as modules):
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

