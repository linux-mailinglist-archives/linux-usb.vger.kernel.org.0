Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94083847A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 08:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfFGGh7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 02:37:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:57977 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727061AbfFGGh7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 02:37:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 23:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,562,1557212400"; 
   d="scan'208";a="182572433"
Received: from intel.iind.intel.com ([10.66.245.146])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2019 23:37:56 -0700
From:   Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@intel.com, rajaram.regupathy@intel.com,
        abhilash.k.v@intel.com, prabhat.chand.pandey@intel.com,
        m.balaji@intel.com
Subject: [PATCH 5/5] usb: xhci: dbc: Document describe about dbc raw interface
Date:   Fri,  7 Jun 2019 12:03:06 +0530
Message-Id: <20190607063306.5612-6-prabhat.chand.pandey@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch have explaination about the new DBC interface called
dbc raw interface. This cover the capability, target setup and
use case info.

Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
---
 Documentation/usb/dbc_raw.rst | 136 ++++++++++++++++++++++++++++++++++
 Documentation/usb/index.rst   |  16 ++++
 2 files changed, 152 insertions(+)
 create mode 100644 Documentation/usb/dbc_raw.rst
 create mode 100644 Documentation/usb/index.rst

diff --git a/Documentation/usb/dbc_raw.rst b/Documentation/usb/dbc_raw.rst
new file mode 100644
index 000000000000..b7d472a478f5
--- /dev/null
+++ b/Documentation/usb/dbc_raw.rst
@@ -0,0 +1,136 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+======================================
+This described about DBC RAW Interface
+======================================
+
+:Author: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
+
+Content
+========
+
+- DBC Overview
+- Motivation
+- DBC RAW Capabilities
+- Target Build Setup
+- Target Test Setup
+- Host Target Connection
+- Experiment Test Result
+- DBC TTY Use Cases
+- DBC RAW Use Cases
+- Conclusion
+
+DBC Overview
+-------------
+xDBC stands for the USB Debug capability provided extensible Host Controller
+Interface. Universal Serial Bus is a host controlled Bus. Host Controller is
+a hardware whose functionality is to manage usb bus and usb host ports. It is
+responsible for initiating and managing all usb transfers. Extensible Host
+Controller Interface (xHCI) is a register-level interface which provides a
+mechanism by which the host controller (xHC) can communicate with the Operating
+System of the host computer. In addition to exposing register interfaces
+essential for proper functioning of the xHC it also supports many extended
+capabilities which can optionally be implemented by xHC.
+
+It includes Extended Power Management Capability, I/O Virtualization capability
+USB Legacy support capability among many others. USB Debug Capability is one of
+the main extended capabilities supported by xHCI.
+
+This functionality enables low-level system debug over USB. The xHCI debug
+capabilities (xDBC) provides a means of connecting two systems where the system
+is a Debug Host and the other is a Debug target. This is achieved through
+emulating a debug device by using xDBC on the debug target. The debug device
+presented by the debug target can be used by debug host for low level system
+debugging of target.
+
+Motivation
+-----------
+In this patch-set we learn the requirement of new DBC interface called DBC RAW,
+which can be used for platform debugging, large data transfer with comparatively
+10x faster data rate than DBC TTY and it have all the USB specific error handling
+mechanism enabled which DBC TTY doesn't have.
+
+DBC RAW Capabilities
+---------------------
+* Current transfer rate of up to 25.4 MB/s from host to target (using Blocking APIs).
+* Current transfer rate of up to 28.8 MB/s from target to host (using Blocking APIs).
+* Have further scope of improvement in transfer rate of up to USB 3.x speed.
+* This interface can bind with multiple target xHCI (i.e. /dev/dbc_raw0, raw1 etc).
+* It helps to render the target as an usb debug class device on host and establish
+  an usb connection by providing two bulk endpoints.
+* It has support to handle halt bit and send STALL packet.
+
+Target Build Setup
+-------------------
+* Make sure to use Kernel of version >= 4.13.
+* Enable USB_XHCI_DBGCAP in Kernel menuconfig.
+	Device Drivers  ---> USB support  ---> xHCI support for debug capability [Y]
+* Enable DBC RAW in kernel menuconfig.
+	Device Drivers  ---> USB support  ---> Select function for debug capability
+							(xHCI DbC raw driver support)
+* Build Image.
+
+Target Test Setup
+------------------
+* Flash binary with above changes in the target board.
+* Cross check the current DBC function interface, it should be RAW in this case
+  otherwise TTY, below is the sysfs entry for the dbc_function (it's a read only file,
+  switching b/w RAW and TTY is only possible at build time):
+	root@target:/ # cat /sys/bus/pci/devices/0000\:00\:14.0/dbc_function
+	RWA
+* Enable DBC with the following command:
+	root@target:/ # echo enable > /sys/bus/pci/devices/0000\:00\:14.0/dbc
+
+Host Target Connection
+-----------------------
+* Connect Type A to Type A cable between Target and Host.
+* Make sure it is an usb 3.0 cable.
+* At this point debug device should be enumerated on Host side.
+* On Target side dbc sysfs attribute should change to configured state and
+  dbc_raw0 character device should appear under dev directory.
+
+	On Target-:
+		root@target:/ # cat /sys/bus/pci/devices/0000\:00\:14.0/dbc
+		configured
+
+	Target dmesg-:
+		[   32.420018] xhci_hcd 0000:00:14.0: DbC connected
+		[   32.676014] xhci_hcd 0000:00:14.0: DbC configured
+
+	Host dmesg-:
+		[3613626.064257] usb 2-1: new SuperSpeed USB device number 46 using xhci_hcd
+		[3613626.084391] usb 2-1: LPM exit latency is zeroed, disabling LPM.
+		[3613626.084642] usb 2-1: New USB device found, idVendor=1d6b, idProduct=0010
+		[3613626.084647] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
+		[3613626.084651] usb 2-1: Product: Linux USB Debug Target
+		[3613626.084655] usb 2-1: Manufacturer: Linux Foundation
+		[3613626.084658] usb 2-1: SerialNumber: 0001
+
+Experiment Test Result
+-----------------------
+* Transferred 32MB data from host to target with packet size 16KB using blocking
+  APIs and achieved 25.4 MB/s with no data loss.
+* Transferred 32MB data from target to host with packet size 16KB using blocking
+  APIs and achieved 28.8 MB/s with no data loss.
+
+DBC TTY Use Cases
+------------------
+* Used for platform debugging via USB interface, in the absence of serial port.
+* It replace the need of using external serial-to-USB device for console access
+  or for low level debugging.
+* Used to send/receive data between platforms with the limited bandwidth.
+
+DBC RAW Use Cases
+------------------
+* Used at different platform (i.e. Linux, Android, Chrome etc.) for debugging
+  via USB interface.
+* It replace the need of using external serial-to-USB device for console access
+  or for low level debugging.
+* Transfer data with high data rate between platforms via DBC RAW without using
+  USB device controller.
+
+Conclusion
+-----------
+DBC RAW interface transfer data with 10x time faster than DBC TTY. And handle
+all the USB specific error like STALL packet, when the endpoint has had an error
+and its halt bit has been set.
diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
new file mode 100644
index 000000000000..d30b1057996b
--- /dev/null
+++ b/Documentation/usb/index.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+===============================
+Welcome to USB's documentation!
+===============================
+
+.. toctree::
+
+   dbc_raw
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.21.0

