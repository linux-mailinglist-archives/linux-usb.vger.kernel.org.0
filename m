Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0C4214D45
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jul 2020 17:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgGEPCg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 11:02:36 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38675 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726826AbgGEPCf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jul 2020 11:02:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 9B2EE5C007E;
        Sun,  5 Jul 2020 11:02:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 05 Jul 2020 11:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm2; bh=iwAkEF1nR4UQQM8btRAYzwEsxs
        PjGAgdCycEAYGaYkk=; b=JpJ8b+VtK/UolhftBWAp4gGWuPvJLrqgBnR0kJp5yK
        2QtTVTguELQ+DF5ptlePW6EzUxydrkEBAy3uYWpn4nBMqIF8IDKsrWFXWJhM8ee6
        DqK1mB1ftyIjCTMU85TRZW48bBW2BRRbiXIu00Jk9HEShT2fD+W7sE61K86A9Bki
        pCcPVkyoSN56cKMN5ATGr2/4q6gWY7qr+pwtHQeEua270OeUFd4eozlBjPwqIUhC
        qTiq9WfqJHC9vSAzE7iSVzDk4rjHIbqlv5/7Pzqd7hZSuUH6W40JP6FyvCwGUWe6
        d9QCjO7NAg690rlqkJK2kYPXOvFEDXsuy8MLmiRtpffA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iwAkEF
        1nR4UQQM8btRAYzwEsxsPjGAgdCycEAYGaYkk=; b=Pxs4/DKvc0E8kIhimsArPx
        KGsEZeZ7ntwU7hJ80ghc7z0YQnWL1TVnY/j8fBpp90sssWq9Y82Ywrvfw/b5qKfn
        tTWJ1dyHFrtACBN0WqwI3I9Ujsn87iTtgul5CrEOklfVViKn22HPreXxSeECLfi8
        1zaq4l9O1kb7rJJtK1QdjQImVfEz5Fg9DEbB3N5SMhFgj/GUCwdYzYhjeA5Qf7IH
        R8gS3SlMZYx0Rh6PZIXTXXETOVST78EJ1+0lM+pwhNopz19XakP0kt5WPVLtxh1a
        bVSUpWFPPB8uMh2FYlVz7XIhm7oybCkyRRxZTgCO0OE3kivL6h5w7d0Vop8nnkHA
        ==
X-ME-Sender: <xms:iOsBXyg-OwbiwNaaf0wNOuWSDNhfo-q89uM6tAsRet7WHSksksFISQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddugdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffihgvghhoucfg
    lhhiohcurfgvthhtvghnjpcuoehflhgrmhgvvgihvghssehflhgrmhgvvgihvghsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeelkefgkefhleelveekhfejjeeikeekvdfhvdeiueej
    ffefffefhfekvdfhfeegheenucfkphepkeekrdelkedrvdefkedrudeftdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhgrmhgvvgihvghs
    sehflhgrmhgvvgihvghsrdgtohhm
X-ME-Proxy: <xmx:iOsBXzCD5yVqiLQbhrDZnEplAOCsMX1jEuoWNYvOrpHpOUf7EVwQYQ>
    <xmx:iOsBX6FTEKugR9GQYy_kz9LvcAcktVuf0W6tysHRRTX-DNOZ4y4GxA>
    <xmx:iOsBX7StZXzF0lUOM8sfRkC3Smx2_s5j8pyFHOq-ngWheOEbzgW39g>
    <xmx:iesBX69CX-zMRdYKao7iKkEKGv7eWGEU55MwvU2jsTpMA_uRqOPdIw>
Received: from localhost.localdomain (unknown [88.98.238.130])
        by mail.messagingengine.com (Postfix) with ESMTPA id EB90A328006A;
        Sun,  5 Jul 2020 11:02:31 -0400 (EDT)
From:   =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>,
        Pete Zaitcev <zaitcev@redhat.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH] usbmon: expose the usbmon structures and constants as an UAPI header.
Date:   Sun,  5 Jul 2020 16:02:25 +0100
Message-Id: <20200705150225.21500-1-flameeyes@flameeyes.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previously any application wanting to implement the usbmon binary
interfaces needed to re-declare the structures and constants, leading to
structure duplication and confusion over whether these structures fall into
the system call exception or not.

Also update Paolo's address to match `net/core/dst_cache.c` as the previous
one bounces.

Cc: linux-usb@vger.kernel.org
Cc: Pete Zaitcev <zaitcev@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Kris Katterjohn <katterjohn@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>
---
 Documentation/usb/usbmon.rst |  12 ++---
 drivers/usb/mon/mon_bin.c    |  94 ++------------------------------
 include/uapi/linux/usb/mon.h | 102 +++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 97 deletions(-)
 create mode 100644 include/uapi/linux/usb/mon.h

diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
index b0bd51080799..cf98ea553ba1 100644
--- a/Documentation/usb/usbmon.rst
+++ b/Documentation/usb/usbmon.rst
@@ -211,11 +211,13 @@ Bulk wrapper to a storage device at address 5::
 Raw binary format and API
 =========================
 
-The overall architecture of the API is about the same as the one above,
-only the events are delivered in binary format. Each event is sent in
-the following structure (its name is made up, so that we can refer to it)::
+The overall architecture of the API is about the same as the one above, only the
+events are delivered in binary format. The structures and constants are defined
+in linux/usb/mon.h.
 
-  struct usbmon_packet {
+Each event is sent in the following structure::
+
+  struct mon_bin_hdr {
 	u64 id;			/*  0: URB ID - from submission to callback */
 	unsigned char type;	/*  8: Same as text; extensible. */
 	unsigned char xfer_type; /*    ISO (0), Intr, Control, Bulk (3) */
@@ -346,8 +348,6 @@ be polled with select(2) and poll(2). But lseek(2) does not work.
 
 * Memory-mapped access of the kernel buffer for the binary API
 
-The basic idea is simple:
-
 To prepare, map the buffer by getting the current size, then using mmap(2).
 Then, execute a loop similar to the one written in pseudo-code below::
 
diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index f48a23adbc35..e914fd8d039e 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -4,8 +4,8 @@
  *
  * This is a binary format reader.
  *
- * Copyright (C) 2006 Paolo Abeni (paolo.abeni@email.it)
- * Copyright (C) 2006,2007 Pete Zaitcev (zaitcev@redhat.com)
+ * Copyright (C) 2006 Paolo Abeni <pabeni@redhat.com>
+ * Copyright (C) 2006,2007 Pete Zaitcev <zaitcev@redhat.com>
  */
 
 #include <linux/kernel.h>
@@ -23,34 +23,10 @@
 #include <linux/time64.h>
 
 #include <linux/uaccess.h>
+#include <linux/usb/mon.h>
 
 #include "usb_mon.h"
 
-/*
- * Defined by USB 2.0 clause 9.3, table 9.2.
- */
-#define SETUP_LEN  8
-
-/* ioctl macros */
-#define MON_IOC_MAGIC 0x92
-
-#define MON_IOCQ_URB_LEN _IO(MON_IOC_MAGIC, 1)
-/* #2 used to be MON_IOCX_URB, removed before it got into Linus tree */
-#define MON_IOCG_STATS _IOR(MON_IOC_MAGIC, 3, struct mon_bin_stats)
-#define MON_IOCT_RING_SIZE _IO(MON_IOC_MAGIC, 4)
-#define MON_IOCQ_RING_SIZE _IO(MON_IOC_MAGIC, 5)
-#define MON_IOCX_GET   _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get)
-#define MON_IOCX_MFETCH _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch)
-#define MON_IOCH_MFLUSH _IO(MON_IOC_MAGIC, 8)
-/* #9 was MON_IOCT_SETAPI */
-#define MON_IOCX_GETX   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get)
-
-#ifdef CONFIG_COMPAT
-#define MON_IOCX_GET32 _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get32)
-#define MON_IOCX_MFETCH32 _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch32)
-#define MON_IOCX_GETX32   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get32)
-#endif
-
 /*
  * Some architectures have enormous basic pages (16KB for ia64, 64KB for ppc).
  * But it's all right. Just use a simple way to make sure the chunk is never
@@ -81,38 +57,6 @@
 #define BUFF_DFL   CHUNK_ALIGN(300*1024)
 #define BUFF_MIN     CHUNK_ALIGN(8*1024)
 
-/*
- * The per-event API header (2 per URB).
- *
- * This structure is seen in userland as defined by the documentation.
- */
-struct mon_bin_hdr {
-	u64 id;			/* URB ID - from submission to callback */
-	unsigned char type;	/* Same as in text API; extensible. */
-	unsigned char xfer_type;	/* ISO, Intr, Control, Bulk */
-	unsigned char epnum;	/* Endpoint number and transfer direction */
-	unsigned char devnum;	/* Device address */
-	unsigned short busnum;	/* Bus number */
-	char flag_setup;
-	char flag_data;
-	s64 ts_sec;		/* ktime_get_real_ts64 */
-	s32 ts_usec;		/* ktime_get_real_ts64 */
-	int status;
-	unsigned int len_urb;	/* Length of data (submitted or actual) */
-	unsigned int len_cap;	/* Delivered length */
-	union {
-		unsigned char setup[SETUP_LEN];	/* Only for Control S-type */
-		struct iso_rec {
-			int error_count;
-			int numdesc;
-		} iso;
-	} s;
-	int interval;
-	int start_frame;
-	unsigned int xfer_flags;
-	unsigned int ndesc;	/* Actual number of ISO descriptors */
-};
-
 /*
  * ISO vector, packed into the head of data stream.
  * This has to take 16 bytes to make sure that the end of buffer
@@ -125,38 +69,6 @@ struct mon_bin_isodesc {
 	u32 _pad;
 };
 
-/* per file statistic */
-struct mon_bin_stats {
-	u32 queued;
-	u32 dropped;
-};
-
-struct mon_bin_get {
-	struct mon_bin_hdr __user *hdr;	/* Can be 48 bytes or 64. */
-	void __user *data;
-	size_t alloc;		/* Length of data (can be zero) */
-};
-
-struct mon_bin_mfetch {
-	u32 __user *offvec;	/* Vector of events fetched */
-	u32 nfetch;		/* Number of events to fetch (out: fetched) */
-	u32 nflush;		/* Number of events to flush */
-};
-
-#ifdef CONFIG_COMPAT
-struct mon_bin_get32 {
-	u32 hdr32;
-	u32 data32;
-	u32 alloc32;
-};
-
-struct mon_bin_mfetch32 {
-        u32 offvec32;
-        u32 nfetch32;
-        u32 nflush32;
-};
-#endif
-
 /* Having these two values same prevents wrapping of the mon_bin_hdr */
 #define PKT_ALIGN   64
 #define PKT_SIZE    64
diff --git a/include/uapi/linux/usb/mon.h b/include/uapi/linux/usb/mon.h
new file mode 100644
index 000000000000..265e0169e2ef
--- /dev/null
+++ b/include/uapi/linux/usb/mon.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * USB Monitoring (usbmon) definitions
+ */
+
+#ifndef __UAPI_LINUX_USB_MON_H
+#define __UAPI_LINUX_USB_MON_H
+
+/* ioctl macros */
+#define MON_IOC_MAGIC 0x92
+
+#define MON_IOCQ_URB_LEN _IO(MON_IOC_MAGIC, 1)
+/* #2 used to be MON_IOCX_URB, removed before it got into Linus tree */
+#define MON_IOCG_STATS _IOR(MON_IOC_MAGIC, 3, struct mon_bin_stats)
+#define MON_IOCT_RING_SIZE _IO(MON_IOC_MAGIC, 4)
+#define MON_IOCQ_RING_SIZE _IO(MON_IOC_MAGIC, 5)
+#define MON_IOCX_GET   _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get)
+#define MON_IOCX_MFETCH _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch)
+#define MON_IOCH_MFLUSH _IO(MON_IOC_MAGIC, 8)
+/* #9 was MON_IOCT_SETAPI */
+#define MON_IOCX_GETX   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get)
+
+#ifdef CONFIG_COMPAT
+#define MON_IOCX_GET32 _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get32)
+#define MON_IOCX_MFETCH32 _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch32)
+#define MON_IOCX_GETX32   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get32)
+#endif
+
+/* ioctl structures */
+
+/* per file statistic */
+struct mon_bin_stats {
+	u32 queued;
+	u32 dropped;
+};
+
+struct mon_bin_get {
+	struct mon_bin_hdr __user *hdr;	/* Can be 48 bytes or 64. */
+	void __user *data;
+	size_t alloc;		/* Length of data (can be zero) */
+};
+
+struct mon_bin_mfetch {
+	u32 __user *offvec;	/* Vector of events fetched */
+	u32 nfetch;		/* Number of events to fetch (out: fetched) */
+	u32 nflush;		/* Number of events to flush */
+};
+
+#ifdef CONFIG_COMPAT
+struct mon_bin_get32 {
+	u32 hdr32;
+	u32 data32;
+	u32 alloc32;
+};
+
+struct mon_bin_mfetch32 {
+	u32 offvec32;
+	u32 nfetch32;
+	u32 nflush32;
+};
+#endif
+
+/* Data format */
+
+/*
+ * Defined by USB 2.0 clause 9.3, table 9.2.
+ */
+#define SETUP_LEN  8
+
+/*
+ * The per-event API header (2 per URB).
+ *
+ * This structure is seen in userland as defined by the documentation.
+ */
+struct mon_bin_hdr {
+	u64 id;			/* URB ID - from submission to callback */
+	unsigned char type;	/* Same as in text API; extensible. */
+	unsigned char xfer_type;	/* ISO, Intr, Control, Bulk */
+	unsigned char epnum;	/* Endpoint number and transfer direction */
+	unsigned char devnum;	/* Device address */
+	unsigned short busnum;	/* Bus number */
+	char flag_setup;
+	char flag_data;
+	s64 ts_sec;		/* ktime_get_real_ts64 */
+	s32 ts_usec;		/* ktime_get_real_ts64 */
+	int status;
+	unsigned int len_urb;	/* Length of data (submitted or actual) */
+	unsigned int len_cap;	/* Delivered length */
+	union {
+		unsigned char setup[SETUP_LEN];	/* Only for Control S-type */
+		struct iso_rec {
+			int error_count;
+			int numdesc;
+		} iso;
+	} s;
+	int interval;
+	int start_frame;
+	unsigned int xfer_flags;
+	unsigned int ndesc;	/* Actual number of ISO descriptors */
+};
+
+#endif /* __UAPI_LINUX_USB_MON_H */
-- 
2.27.0

