Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681E22161AA
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 00:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgGFWo1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 18:44:27 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33335 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726898AbgGFWo0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 18:44:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 46448B81;
        Mon,  6 Jul 2020 18:44:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 06 Jul 2020 18:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        9WukcVHCaidzxEEwfI+GK5KajGXkKW3qmxGBLn9OJ2M=; b=fFAzSl18bn8RyHNC
        rw/ojUwr2nDgJ3Rp9Tma5wuDbkepOf+XWeKC56uVmBNuzvfaCbFRCd/NusAvYvru
        6q+HEopc9KEaQCpGOkyOXQvQNepwdhkur3NYxfiae+6yRQUv2XynxZ/j/ybUDXmB
        z4aY+IYxZWKAf+TwbvcooTmdDSRs7DbknuJ5rCARdIjoJHGrWWXghHOvvM9DXkGz
        p4evz0z8BEl5BSVWqGWKaF4DRtk/Yesqx9rMZuNb8ADX+xithGqySHmlpbhqcJ3P
        npBpFdDOJXgi4dToqWPoNyAZVSpzqA1CCcqFqEGW4kIzjG3aKBPirxk6b7+NQYoQ
        UPj7Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=9WukcVHCaidzxEEwfI+GK5KajGXkKW3qmxGBLn9OJ
        2M=; b=UI6AwMctQw4PAZ8ewbxQW8D7MqzXMHzsJA5nKmICFYH8VTnSYG3E4KMAx
        lYHzCfGATgBVVJ+dG0r0FRqb/sbkrABUrPkdYMdVklNLAN3K9PQUvKdXkacmynCg
        2Plm3JTa5cJVl62RMTiGqHBHchQAKNxrmxbv8HWaE9w3/1w3qujvGqhn/oUhrnnC
        jlct6meUfah01oDalqf7NCSwC2XTIi2FYyRXDvjwveuEIpw+OlBt63hoomBv6flt
        X8n1NzoKBmhphS/xF+TEbwFugAay+ozNcEPPBbAQkuIjkD94dYpAPINBiZcKfi0X
        QpJS6vbHO1r6wAXBdLA3HanMhzQyQ==
X-ME-Sender: <xms:SKkDXx8u32_SgLeyahCDbSSVZvCsOWeV8NSmtjdMaZy8MF6PX9gYLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeggddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffihgvghho
    ucfglhhiohcurfgvthhtvghnjpcuoehflhgrmhgvvgihvghssehflhgrmhgvvgihvghsrd
    gtohhmqeenucggtffrrghtthgvrhhnpeeljefgtdeufefhieetgfeuvedvtddvieefgeeh
    vdfgvdelleekleekveevhfduueenucfkphepkeekrdelkedrvdefkedrudeftdenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhgrmhgvvgih
    vghssehflhgrmhgvvgihvghsrdgtohhm
X-ME-Proxy: <xmx:SKkDX1uZANRBgC0MzBA-OMzUES2Dy1tawZFXfAqJjptzDlk-DYUoHA>
    <xmx:SKkDX_BlTQ-5jowSwAHVblG59rWSuJKmJJRJWkCIfW1Unj2-V1JyVA>
    <xmx:SKkDX1dzrWsWb6zcRzu0NaL6HX3FgNPMCi9Yp1wpCjmpb6z3ZjtYSQ>
    <xmx:SKkDX_bgwN1t5lfleutCleQVtk4JJSH_DzhTpBKFnWe-ua5aD0mmBw>
Received: from localhost.localdomain (unknown [88.98.238.130])
        by mail.messagingengine.com (Postfix) with ESMTPA id 121463280067;
        Mon,  6 Jul 2020 18:44:23 -0400 (EDT)
From:   =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>,
        Pete Zaitcev <zaitcev@redhat.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v4 2/2] usbmon: expose the usbmon structures and constants as an UAPI header.
Date:   Mon,  6 Jul 2020 23:44:15 +0100
Message-Id: <20200706224415.2854-2-flameeyes@flameeyes.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706224415.2854-1-flameeyes@flameeyes.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706224415.2854-1-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This allows applications to use the usbmon ioctl() without declaring the
constants.

Update the documentation to reflect the new header.

Cc: linux-usb@vger.kernel.org
Cc: Pete Zaitcev <zaitcev@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Kris Katterjohn <katterjohn@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>
---
 Documentation/usb/usbmon.rst |  70 ++++++++++++-----------
 drivers/usb/mon/mon_bin.c    |  92 +-----------------------------
 include/uapi/linux/usb/mon.h | 107 +++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+), 124 deletions(-)
 create mode 100644 include/uapi/linux/usb/mon.h

diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
index e9ec7e40b3bf..31c14b38fd03 100644
--- a/Documentation/usb/usbmon.rst
+++ b/Documentation/usb/usbmon.rst
@@ -211,35 +211,37 @@ Bulk wrapper to a storage device at address 5::
 Raw binary format and API
 =========================
 
-The overall architecture of the API is about the same as the one above,
-only the events are delivered in binary format. Each event is sent in
-the following structure (its name is made up, so that we can refer to it)::
-
-  struct usbmon_packet {
-	u64 id;			/*  0: URB ID - from submission to callback */
-	unsigned char type;	/*  8: Same as text; extensible. */
-	unsigned char xfer_type; /*    ISO (0), Intr, Control, Bulk (3) */
-	unsigned char epnum;	/*     Endpoint number and transfer direction */
-	unsigned char devnum;	/*     Device address */
-	u16 busnum;		/* 12: Bus number */
-	char flag_setup;	/* 14: Same as text */
-	char flag_data;		/* 15: Same as text; Binary zero is OK. */
-	s64 ts_sec;		/* 16: gettimeofday */
-	s32 ts_usec;		/* 24: gettimeofday */
-	int status;		/* 28: */
-	unsigned int length;	/* 32: Length of data (submitted or actual) */
-	unsigned int len_cap;	/* 36: Delivered length */
+The overall architecture of the API is about the same as the one above, only the
+events are delivered in binary format. The structures and constants are defined
+in include/uapi/linux/usb/mon.h.
+
+Each event is sent in the following structure::
+
+  struct mon_bin_hdr {
+	__u64 id;		/*  0: URB ID - from submission to callback */
+	__u8 type;		/*  8: Same as text; extensible. */
+	__u8 xfer_type;		/*    ISO (0), Intr, Control, Bulk (3) */
+	__u8 epnum;		/*     Endpoint number and transfer direction */
+	__u8 devnum;		/*     Device address */
+	__u16 busnum;		/* 12: Bus number */
+	__s8 flag_setup;	/* 14: Same as text */
+	__s8 flag_data;		/* 15: Same as text; Binary zero is OK. */
+	__s64 ts_sec;		/* 16: gettimeofday */
+	__s32 ts_usec;		/* 24: gettimeofday */
+	__s32 status;		/* 28: */
+	__u32 length;		/* 32: Length of data (submitted or actual) */
+	__u32 len_cap;		/* 36: Delivered length */
 	union {			/* 40: */
-		unsigned char setup[SETUP_LEN];	/* Only for Control S-type */
+		__u8 setup[MON_USB_SETUP_LEN];	/* Only for Control S-type */
 		struct iso_rec {		/* Only for ISO */
-			int error_count;
-			int numdesc;
+			__s32 error_count;
+			__s32 numdesc;
 		} iso;
 	} s;
-	int interval;		/* 48: Only for Interrupt and ISO */
-	int start_frame;	/* 52: For ISO */
-	unsigned int xfer_flags; /* 56: copy of URB's transfer_flags */
-	unsigned int ndesc;	/* 60: Actual number of ISO descriptors */
+	__s32 interval;		/* 48: Only for Interrupt and ISO */
+	__s32 start_frame;	/* 52: For ISO */
+	__u32 xfer_flags;	/* 56: copy of URB's transfer_flags */
+	__u32 ndesc;		/* 60: Actual number of ISO descriptors */
   };				/* 64 total length */
 
 These events can be received from a character device by reading with read(2),
@@ -267,8 +269,8 @@ no events are available.
 The argument is a pointer to the following structure::
 
   struct mon_bin_stats {
-	u32 queued;
-	u32 dropped;
+	__u32 queued;
+	__u32 dropped;
   };
 
 The member "queued" refers to the number of events currently queued in the
@@ -296,9 +298,9 @@ then return the first event. The argument is a pointer to the following
 structure::
 
   struct mon_get_arg {
-	struct usbmon_packet *hdr;
+	struct mon_bin_hdr *hdr;
 	void *data;
-	size_t alloc;		/* Length of data (can be zero) */
+	__kernel_size_t alloc;		/* Length of data (can be zero) */
   };
 
 Before the call, hdr, data, and alloc should be filled. Upon return, the area
@@ -313,9 +315,9 @@ This ioctl is primarily used when the application accesses the buffer
 with mmap(2). Its argument is a pointer to the following structure::
 
   struct mon_mfetch_arg {
-	uint32_t *offvec;	/* Vector of events fetched */
-	uint32_t nfetch;	/* Number of events to fetch (out: fetched) */
-	uint32_t nflush;	/* Number of events to flush */
+	__u32 *offvec;	/* Vector of events fetched */
+	__u32 nfetch;	/* Number of events to fetch (out: fetched) */
+	__u32 nflush;	/* Number of events to flush */
   };
 
 The ioctl operates in 3 stages.
@@ -350,7 +352,7 @@ To prepare, map the buffer by getting the current size, then using mmap(2).
 Then, execute a loop similar to the one written in pseudo-code below::
 
    struct mon_mfetch_arg fetch;
-   struct usbmon_packet *hdr;
+   struct mon_bin_hdr *hdr;
    int nflush = 0;
    for (;;) {
       fetch.offvec = vec; // Has N 32-bit words
@@ -359,7 +361,7 @@ Then, execute a loop similar to the one written in pseudo-code below::
       ioctl(fd, MON_IOCX_MFETCH, &fetch);   // Process errors, too
       nflush = fetch.nfetch;       // This many packets to flush when done
       for (i = 0; i < nflush; i++) {
-         hdr = (struct ubsmon_packet *) &mmap_area[vec[i]];
+         hdr = (struct mon_bin_hdr *) &mmap_area[vec[i]];
          if (hdr->type == '@')     // Filler packet
             continue;
          caddr_t data = &mmap_area[vec[i]] + 64;
diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index f48a23adbc35..e1a7e69a3b0c 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
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
@@ -396,7 +308,7 @@ static inline char mon_bin_get_setup(unsigned char *setupb,
 
 	if (urb->setup_packet == NULL)
 		return 'Z';
-	memcpy(setupb, urb->setup_packet, SETUP_LEN);
+	memcpy(setupb, urb->setup_packet, MON_USB_SETUP_LEN);
 	return 0;
 }
 
diff --git a/include/uapi/linux/usb/mon.h b/include/uapi/linux/usb/mon.h
new file mode 100644
index 000000000000..3557fe6a93e6
--- /dev/null
+++ b/include/uapi/linux/usb/mon.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * USB Monitoring (usbmon) definitions
+ *
+ * See documentation in Documentation/usb/usbmon.rst.
+ *
+ * Copyright (C) 2006 Paolo Abeni (paolo.abeni@email.it)
+ * Copyright (C) 2006,2007 Pete Zaitcev (zaitcev@redhat.com)
+ */
+
+#ifndef __UAPI_LINUX_USB_MON_H
+#define __UAPI_LINUX_USB_MON_H
+
+#include <linux/types.h>
+
+/* ioctl macros */
+#define MON_IOC_MAGIC 0x92
+
+#define MON_IOCQ_URB_LEN	_IO(MON_IOC_MAGIC, 1)
+/* #2 used to be MON_IOCX_URB, removed before it got into Linus tree */
+#define MON_IOCG_STATS		_IOR(MON_IOC_MAGIC, 3, struct mon_bin_stats)
+#define MON_IOCT_RING_SIZE	_IO(MON_IOC_MAGIC, 4)
+#define MON_IOCQ_RING_SIZE	_IO(MON_IOC_MAGIC, 5)
+#define MON_IOCX_GET		_IOW(MON_IOC_MAGIC, 6, struct mon_bin_get)
+#define MON_IOCX_MFETCH		_IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch)
+#define MON_IOCH_MFLUSH		_IO(MON_IOC_MAGIC, 8)
+/* #9 was MON_IOCT_SETAPI */
+#define MON_IOCX_GETX		_IOW(MON_IOC_MAGIC, 10, struct mon_bin_get)
+
+/* ioctl structures */
+
+/* per file statistic */
+struct mon_bin_stats {
+	__u32 queued;
+	__u32 dropped;
+};
+
+struct mon_bin_get {
+	struct mon_bin_hdr __user *hdr;	/* Can be 48 bytes or 64. */
+	void __user *data;
+	size_t alloc;		/* Length of data (can be zero) */
+};
+
+struct mon_bin_mfetch {
+	__u32 __user *offvec;	/* Vector of events fetched */
+	__u32 nfetch;		/* Number of events to fetch (out: fetched) */
+	__u32 nflush;		/* Number of events to flush */
+};
+
+
+/* Only defined with CONFIG_COMPAT */
+#define MON_IOCX_GET32		_IOW(MON_IOC_MAGIC, 6, struct mon_bin_get32)
+#define MON_IOCX_MFETCH32	_IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch32)
+#define MON_IOCX_GETX32		_IOW(MON_IOC_MAGIC, 10, struct mon_bin_get32)
+
+struct mon_bin_get32 {
+	__u32 hdr32;
+	__u32 data32;
+	__u32 alloc32;
+};
+
+struct mon_bin_mfetch32 {
+	__u32 offvec32;
+	__u32 nfetch32;
+	__u32 nflush32;
+};
+
+/* Data format */
+
+/*
+ * Defined by USB 2.0 clause 9.3, table 9.2.
+ */
+#define MON_USB_SETUP_LEN  8
+
+/*
+ * The per-event API header (2 per URB).
+ *
+ * This structure is seen in userland as defined by the documentation.
+ */
+struct mon_bin_hdr {
+	__u64 id;	/* URB ID - from submission to callback */
+	__u8 type;	/* Same as in text API; extensible. */
+	__u8 xfer_type;	/* ISO, Intr, Control, Bulk */
+	__u8 epnum;	/* Endpoint number and transfer direction */
+	__u8 devnum;	/* Device address */
+	__u16 busnum;	/* Bus number */
+	__s8 flag_setup;
+	__s8 flag_data;
+	__s64 ts_sec;	/* ktime_get_real_ts64 */
+	__s32 ts_usec;	/* ktime_get_real_ts64 */
+	__s32 status;
+	__u32 len_urb;	/* Length of data (submitted or actual) */
+	__u32 len_cap;	/* Delivered length */
+	union {
+		__u8 setup[MON_USB_SETUP_LEN];	/* Only for Control S-type */
+		struct iso_rec {
+			__s32 error_count;
+			__s32 numdesc;
+		} iso;
+	} s;
+	__s32 interval;
+	__s32 start_frame;
+	__u32 xfer_flags;
+	__u32 ndesc;	/* Actual number of ISO descriptors */
+};
+
+#endif /* __UAPI_LINUX_USB_MON_H */
-- 
2.27.0

