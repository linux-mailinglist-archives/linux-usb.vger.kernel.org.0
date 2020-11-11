Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD382AF73E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 18:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgKKRON (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 12:14:13 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:35219 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgKKROM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 12:14:12 -0500
Received: (qmail 18611 invoked by uid 484); 11 Nov 2020 17:07:29 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.44 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.39234 secs); 11 Nov 2020 17:07:29 -0000
Received: from unknown (HELO ingpc2.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <balbi@kernel.org>; 11 Nov 2020 17:07:28 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 2/2] usb: gadget: ffs: tools: test applications for user URBs.
Date:   Wed, 11 Nov 2020 18:07:18 +0100
Message-Id: <20201111170718.3381-3-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
References: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

An echo test applications for USB Linux Host and USB Linux Device, to
test ioctls FUNCTIONFS_SUBMITBULKURB and FUNCTIONFS_REAPBULKURB.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 .../device_app/usb_func_echo.c                | 474 ++++++++++++++++++
 .../ffs-urb-example/device_app/usb_gadget_mk  |  79 +++
 .../ffs-urb-example/host_app/usb_test_echo.c  | 370 ++++++++++++++
 3 files changed, 923 insertions(+)
 create mode 100644 tools/usb/ffs-urb-example/device_app/usb_func_echo.c
 create mode 100644 tools/usb/ffs-urb-example/device_app/usb_gadget_mk
 create mode 100644 tools/usb/ffs-urb-example/host_app/usb_test_echo.c

diff --git a/tools/usb/ffs-urb-example/device_app/usb_func_echo.c b/tools/usb/ffs-urb-example/device_app/usb_func_echo.c
new file mode 100644
index 000000000000..a8197b840c05
--- /dev/null
+++ b/tools/usb/ffs-urb-example/device_app/usb_func_echo.c
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: MIT
+
+/*
+ * This sample code implements a USB function with 2 bulk endpoints,
+ * employing two IOCTLs:
+ *     FUNCTIONFS_SUBMITBULKURB
+ *     FUNCTIONFS_REAPBULKURB
+ *
+ * The two bulk endpoints are used for:
+ *  - IN  EP  transfer  device -> host  this code: write direction
+ *  - OUT EP  transfer  host -> device  this code: read direction
+ *
+ * The code waits to receive up to 0x3FFC bytes on the OUT EP.
+ * It then modifies the data and sends it back (see modify_data()).
+ * The idea here is, that the host always uses USB transaction sizes,
+ * which are NOT a multiple of MaxPacketSize.
+ *
+ * This means the end of each USB transaction is marked by a short
+ * packet.
+ *
+ * TL;DR   This implements a simple echo test function on a USB device
+ */
+
+#define _BSD_SOURCE /* for endian.h */
+
+#include <endian.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <string.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <poll.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <linux/usb/functionfs.h>
+
+#define DBG_PRINTF(...) do { \
+	printf("%s : ", __func__); \
+	printf(__VA_ARGS__); \
+	fflush(stdout); \
+} while ((0))
+
+struct tst_descriptors {
+	struct usb_functionfs_descs_head_v2 header;
+	__le32 fs_count;
+	__le32 hs_count;
+	__le32 ss_count;
+	struct {
+		struct usb_interface_descriptor intf;
+		struct usb_endpoint_descriptor_no_audio sink;
+		struct usb_endpoint_descriptor_no_audio source;
+	} __attribute__((packed)) fs_descs, hs_descs;
+	struct {
+		struct usb_interface_descriptor intf;
+		struct usb_endpoint_descriptor_no_audio sink;
+		struct usb_ss_ep_comp_descriptor sink_comp;
+		struct usb_endpoint_descriptor_no_audio source;
+		struct usb_ss_ep_comp_descriptor source_comp;
+	} ss_descs;
+} __attribute__((packed));
+
+static struct tst_descriptors gSetupFFS = {
+	.header = {
+		.magic = htole32(FUNCTIONFS_DESCRIPTORS_MAGIC_V2),
+		.flags = htole32(
+			FUNCTIONFS_HAS_FS_DESC |
+			FUNCTIONFS_HAS_HS_DESC |
+			FUNCTIONFS_HAS_SS_DESC
+		),
+		.length = htole32(sizeof(gSetupFFS))
+	},
+	.fs_count = htole32(3),
+	.fs_descs = {
+		.intf = {
+			.bLength = sizeof(gSetupFFS.fs_descs.intf),
+			.bDescriptorType = USB_DT_INTERFACE,
+			.bNumEndpoints = 2,
+			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
+			.iInterface = 1,
+		},
+		.sink = {
+			.bLength = sizeof(gSetupFFS.fs_descs.sink),
+			.bDescriptorType = USB_DT_ENDPOINT,
+			.bEndpointAddress = 1 | USB_DIR_IN,
+			.bmAttributes = USB_ENDPOINT_XFER_BULK,
+			/* .wMaxPacketSize = autoconfiguration (kernel) */
+		},
+		.source = {
+			.bLength = sizeof(gSetupFFS.fs_descs.source),
+			.bDescriptorType = USB_DT_ENDPOINT,
+			.bEndpointAddress = 2 | USB_DIR_OUT,
+			.bmAttributes = USB_ENDPOINT_XFER_BULK,
+			/* .wMaxPacketSize = autoconfiguration (kernel) */
+		},
+	},
+	.hs_count = htole32(3),
+	.hs_descs = {
+		.intf = {
+			.bLength = sizeof(gSetupFFS.hs_descs.intf),
+			.bDescriptorType = USB_DT_INTERFACE,
+			.bNumEndpoints = 2,
+			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
+			.iInterface = 1,
+		},
+		.sink = {
+			.bLength = sizeof(gSetupFFS.hs_descs.sink),
+			.bDescriptorType = USB_DT_ENDPOINT,
+			.bEndpointAddress = 1 | USB_DIR_IN,
+			.bmAttributes = USB_ENDPOINT_XFER_BULK,
+			.wMaxPacketSize = htole16(512),
+		},
+		.source = {
+			.bLength = sizeof(gSetupFFS.hs_descs.source),
+			.bDescriptorType = USB_DT_ENDPOINT,
+			.bEndpointAddress = 2 | USB_DIR_OUT,
+			.bmAttributes = USB_ENDPOINT_XFER_BULK,
+			.wMaxPacketSize = htole16(512),
+			.bInterval = 1, /* NAK every 1 uframe */
+		},
+	},
+	.ss_count = htole32(5),
+	.ss_descs = {
+		.intf = {
+			.bLength = sizeof(gSetupFFS.ss_descs.intf),
+			.bDescriptorType = USB_DT_INTERFACE,
+			.bNumEndpoints = 2,
+			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
+			.iInterface = 1,
+		},
+		.sink = {
+			.bLength = sizeof(gSetupFFS.ss_descs.sink),
+			.bDescriptorType = USB_DT_ENDPOINT,
+			.bEndpointAddress = 1 | USB_DIR_IN,
+			.bmAttributes = USB_ENDPOINT_XFER_BULK,
+			.wMaxPacketSize = htole16(1024),
+		},
+		.sink_comp = {
+			.bLength = USB_DT_SS_EP_COMP_SIZE,
+			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
+			.bMaxBurst = 0,
+			.bmAttributes = 0,
+			.wBytesPerInterval = 0,
+		},
+		.source = {
+			.bLength = sizeof(gSetupFFS.ss_descs.source),
+			.bDescriptorType = USB_DT_ENDPOINT,
+			.bEndpointAddress = 2 | USB_DIR_OUT,
+			.bmAttributes = USB_ENDPOINT_XFER_BULK,
+			.wMaxPacketSize = htole16(1024),
+			.bInterval = 1, /* NAK every 1 uframe */
+		},
+		.source_comp = {
+			.bLength = USB_DT_SS_EP_COMP_SIZE,
+			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
+			.bMaxBurst = 0,
+			.bmAttributes = 0,
+			.wBytesPerInterval = 0,
+		},
+	},
+};
+
+#define STR_INTERFACE_ "ECHO GADGET"
+struct tst_usb_strings {
+	struct usb_functionfs_strings_head header;
+	struct {
+		__le16 code;
+		const char str1[sizeof(STR_INTERFACE_)];
+	} __attribute__((packed)) lang0;
+} __attribute__((packed));
+
+static struct tst_usb_strings gStrings = {
+	.header = {
+		.magic = FUNCTIONFS_STRINGS_MAGIC,
+		.length = sizeof(struct tst_usb_strings),
+		.str_count = 1,
+		.lang_count = 1,
+	},
+	.lang0 = {
+		0x0409, /* en-us */
+		STR_INTERFACE_,
+	},
+};
+#define STR_INTERFACE gStrings.lang0.str1
+
+// define number of URBs used in total
+// MUST be a power of 2
+#define URB_NR 8
+static struct {
+	int ep0fd;
+
+	int ep_in_fd;     // WRITE: device -> host     ( IN EP)
+	int ep_out_fd;    // READ:  host   -> device   (OUT EP)
+
+	uint8_t dataBufSpace[0x4000*URB_NR + 0x2000];
+	uint8_t *dataBuf;
+
+	int rdUrbWrIdx;
+	int rdUrbRdIdx;
+	int rdPending;
+	struct usb_functionfs_bulkurb rdUrb[URB_NR];
+
+	int wrUrbWrIdx;
+	int wrUrbRdIdx;
+	int wrPending;
+	struct usb_functionfs_bulkurb wrUrb[URB_NR];
+} gs;
+#define URB_NEXT_IDX(idx_) do { \
+	idx_ = ((idx_)+1)&(URB_NR-1); \
+} while ((0))
+
+static void display_event(struct usb_functionfs_event *event)
+{
+	static const char *const names[] = {
+		[FUNCTIONFS_BIND] = "BIND",
+		[FUNCTIONFS_UNBIND] = "UNBIND",
+		[FUNCTIONFS_ENABLE] = "ENABLE",
+		[FUNCTIONFS_DISABLE] = "DISABLE",
+		[FUNCTIONFS_SETUP] = "SETUP",
+		[FUNCTIONFS_SUSPEND] = "SUSPEND",
+		[FUNCTIONFS_RESUME] = "RESUME",
+	};
+	switch (event->type) {
+	case FUNCTIONFS_BIND:
+	case FUNCTIONFS_UNBIND:
+	case FUNCTIONFS_ENABLE:
+	case FUNCTIONFS_DISABLE:
+	case FUNCTIONFS_SETUP:
+	case FUNCTIONFS_SUSPEND:
+	case FUNCTIONFS_RESUME:
+		printf("Event %s\n", names[event->type]);
+	default:
+		break;
+	}
+}
+
+static void handle_ep0(void)
+{
+	struct usb_functionfs_event event;
+	int ret;
+
+	ret = read(gs.ep0fd, &event, sizeof(event));
+	if (!ret) {
+		perror("unable to read event from ep0");
+		return;
+	}
+	display_event(&event);
+	switch (event.type) {
+	case FUNCTIONFS_SETUP:
+		if (event.u.setup.bRequestType & USB_DIR_IN)
+			write(gs.ep0fd, NULL, 0);
+		else
+			read(gs.ep0fd, NULL, 0);
+		break;
+	default:
+		break;
+	}
+}
+
+static void modify_data(uint32_t *buffer, int byteLen)
+{
+	// modify received data
+	// to be fast, this transformation is not depenent on endianness
+	while (byteLen > 0) {
+		*buffer = *buffer ^ 0xAAAAAAAA;
+		buffer++;
+		byteLen -= 4;
+	}
+}
+
+// simple echo test + modification of received data
+static void start_in_ep(struct usb_functionfs_bulkurb *rdUrb)
+{
+	struct usb_functionfs_bulkurb *wrUrb;
+	int err;
+
+	if (rdUrb->actual_length <= 0)
+		return;
+	modify_data(rdUrb->buffer, rdUrb->actual_length);
+	// send back to USB host
+	wrUrb = &(gs.wrUrb[gs.wrUrbWrIdx]);
+	memset(wrUrb, 0, sizeof(struct usb_functionfs_bulkurb));
+	wrUrb->buffer = rdUrb->buffer;
+	wrUrb->buffer_length = rdUrb->actual_length;
+	err = ioctl(gs.ep_in_fd, FUNCTIONFS_SUBMITBULKURB, wrUrb);
+	if (err) {
+		DBG_PRINTF("error FUNCTIONFS_SUBMITBULKURB\n");
+		printf("    err == %d, errno == %d\n", err, errno);
+		exit(1);
+	}
+	gs.wrPending++;
+	URB_NEXT_IDX(gs.wrUrbWrIdx);
+}
+
+// write request finished == device->host USB transfer finished
+// Sanity check and keep tally what has happened so far.
+static void complete_in_ep(void)
+{
+	struct usb_functionfs_bulkurb *urb;
+	struct usb_functionfs_bulkurb *wrUrb;
+	int err;
+
+	if (!gs.wrPending) {
+		DBG_PRINTF("no write pending\n");
+		exit(1);
+	}
+	err = ioctl(gs.ep_in_fd, FUNCTIONFS_REAPBULKURB, &urb);
+	if (err) {
+		DBG_PRINTF("error FUNCTIONFS_REAPBULKURB\n");
+		printf("    err == %d, errno == %d\n", err, errno);
+		exit(1);
+	}
+	wrUrb = &(gs.wrUrb[gs.wrUrbRdIdx]);
+	if (urb != wrUrb) {
+		DBG_PRINTF("unexpected WRITE URB\n");
+		printf("   urb == %p, should == %p\n", urb, wrUrb);
+		exit(1);
+	}
+	if (urb->status) {
+		// will be -ESHUTDOWN, when device is
+		// disconnected from host or UDC is unbound,
+		// while write is in progress
+		DBG_PRINTF("WRITE error: %d\n", urb->status);
+	} else if (urb->actual_length != urb->buffer_length) {
+		DBG_PRINTF("length mismatch\n");
+		printf("   requestd %d bytes, wrote %d bytes\n",
+			urb->buffer_length, urb->actual_length
+		);
+	}
+	URB_NEXT_IDX(gs.wrUrbRdIdx);
+}
+
+// start read requests for host->device transfers
+// we can start these requests even before
+// the UDC is bound or the USB device is connected
+static void start_out_ep(void)
+{
+	struct usb_functionfs_bulkurb *rdUrb;
+	int err;
+
+	while (gs.rdPending < 2) {
+		rdUrb = &(gs.rdUrb[gs.rdUrbWrIdx]);
+		memset(rdUrb, 0, sizeof(struct usb_functionfs_bulkurb));
+		rdUrb->buffer_length = 0x4000;
+		rdUrb->buffer = gs.dataBuf + (gs.rdUrbWrIdx * 0x4000);
+		err = ioctl(
+			gs.ep_out_fd, FUNCTIONFS_SUBMITBULKURB, rdUrb
+		);
+		if (err) {
+			DBG_PRINTF("Error FUNCTIONFS_SUBMITBULKURB\n");
+			printf("    err == %d, errno == %d\n", err, errno);
+			exit(1);
+		}
+		URB_NEXT_IDX(gs.rdUrbWrIdx);
+		gs.rdPending++;
+	}
+}
+
+// read finished == host->device USB transfer finished
+// handle received data (simple echo)
+static void complete_out_ep(void)
+{
+	struct usb_functionfs_bulkurb *urb;
+	struct usb_functionfs_bulkurb *rdUrb;
+	int err;
+
+	err = ioctl(gs.ep_out_fd, FUNCTIONFS_REAPBULKURB, &urb);
+	if (err) {
+		DBG_PRINTF("FUNCTIONFS_REAPBULKURB\n");
+		printf("    err == %d, errno == %d\n", err, errno);
+		exit(1);
+	}
+	rdUrb = &(gs.rdUrb[gs.rdUrbRdIdx]);
+	if (urb != rdUrb) {
+		DBG_PRINTF("unexpected READ URB\n");
+		printf("   urb == %p, should == %p\n", urb, rdUrb);
+		exit(1);
+	}
+	URB_NEXT_IDX(gs.rdUrbRdIdx);
+	gs.rdPending--;
+
+	// Start new read requests, before echoing data
+	start_out_ep();
+	if (!urb->status)
+		start_in_ep(urb);
+	else {
+		// will be -ESHUTDOWN, when device is
+		// disconnected from host or UDC is unbound,
+		// while read is in progress
+		DBG_PRINTF("READ error: %d\n", urb->status);
+	}
+}
+
+static uint8_t *alignTo8K(uint8_t *buf)
+{
+	uintptr_t bufAddr;
+
+	bufAddr  =   (uintptr_t)buf;
+	bufAddr +=   (uintptr_t)0x1FFF;
+	bufAddr &= ~((uintptr_t)0x1FFF);
+	return (uint8_t *)bufAddr;
+}
+
+int main(void)
+{
+	ssize_t ret;
+
+	gs.dataBuf = alignTo8K(gs.dataBufSpace);
+	gs.ep0fd = open("ep0", O_RDWR);
+	if (gs.ep0fd < 0) {
+		printf("Can't open ep0\n");
+		exit(1);
+	}
+	// Tell FunctionFS about descriptors/endpoints
+	ret = write(gs.ep0fd, &gSetupFFS, sizeof(gSetupFFS));
+	if (ret < 0) {
+		printf("Can't setup Interface/Endpoint descriptors\n");
+		exit(1);
+	}
+
+	// Tell function FS about strings
+	ret = write(gs.ep0fd, &gStrings, sizeof(gStrings));
+	if (ret < 0) {
+		printf("Can't setup string descriptors\n");
+		exit(1);
+	}
+
+	// now endpoints should be created and active...
+	gs.ep_in_fd = open("ep1", O_RDWR);
+	if (gs.ep_in_fd < 0) {
+		printf("Can't open ep1\n");
+		exit(1);
+	}
+	gs.ep_out_fd = open("ep2", O_RDWR);
+	if (gs.ep_out_fd < 0) {
+		printf("Can't open ep2\n");
+		exit(1);
+	}
+
+	// We are able to start URBs (USB Request Blocks)
+	// even while the device is disconnected
+	// and/or no UDC is bound to this function
+	start_out_ep();
+	for (;;) {
+		int status;
+		struct pollfd pollfds[3];
+
+		memset(pollfds, 0, sizeof(pollfds));
+		pollfds[0].fd = gs.ep0fd;
+		pollfds[0].events = POLLIN|POLLRDNORM;
+		// URB events are indicated via POLLOUT/POLLWRNORM
+		pollfds[1].fd = gs.ep_in_fd;
+		pollfds[1].events = POLLOUT|POLLWRNORM;
+		pollfds[2].fd = gs.ep_out_fd;
+		pollfds[2].events = POLLOUT|POLLWRNORM;
+		status = poll(pollfds, 3, 1000);
+		if (status == 0) {
+			printf("poll timeout...\n");
+			continue;
+		}
+		if (status < 0) {
+			printf("poll error. errno = %d\n", errno);
+			continue;
+		}
+		if (pollfds[0].revents & (POLLIN|POLLRDNORM))
+			handle_ep0();
+		if (pollfds[1].revents & (POLLOUT|POLLWRNORM))
+			complete_in_ep();
+		if (pollfds[2].revents & (POLLOUT|POLLWRNORM))
+			complete_out_ep();
+	}
+	return 0;
+}
diff --git a/tools/usb/ffs-urb-example/device_app/usb_gadget_mk b/tools/usb/ffs-urb-example/device_app/usb_gadget_mk
new file mode 100644
index 000000000000..95f71d0f7a9d
--- /dev/null
+++ b/tools/usb/ffs-urb-example/device_app/usb_gadget_mk
@@ -0,0 +1,79 @@
+#!/bin/ash
+# SPDX-License-Identifier: MIT
+
+# If you run this in a shell on a USB device, this script might
+# be used to play around with the Linux USB Gadget Driver and FunctionFS
+# This script needs to be run AS ROOT.
+#
+# This script will:
+#  - create the directory /config  and mount ConfigFS on top of it
+#  - modprobe "libcomposite" to get a /config/usb_gadget entry
+#  - create /config/usb_gadget/g1   to configure a USB gadget
+#  - create .../g1/configs/c.1  as USB configuration
+#  - create .../g1/functions/ffs.usb0
+#    and attach it to configuration c.1
+#  - create /usbfunc and mount FunctionFS for "usb0" on to of it
+#
+# After this setup you should be able to use /usbfunc/ep0
+# to configure your function (via software).
+#
+# To bind your gadget to a UDC (USB Device Controller)
+# echo the name of the UDC to /config/usb_gadget/g1/UDC
+
+if [ ! -d /config ] ; then
+	mkdir /config
+	mount -t configfs none /config
+fi
+
+if [ ! -d /config/usb_gadget ] ; then
+	modprobe libcomposite
+fi
+
+cd /config/usb_gadget
+
+if [ ! -d g1 ] ; then
+	mkdir g1
+	cd g1
+else
+	cd g1
+fi
+
+if [ ! -d strings/0x409 ] ; then
+	mkdir strings/0x409
+fi
+
+echo "0x1209"       > idVendor
+echo "0x4567"       > idProduct
+echo "Generic"      > strings/0x409/manufacturer
+echo "Echo Test"    > strings/0x409/product
+echo "112233445566" > strings/0x409/serialnumber
+
+if [ ! -d configs/c.1 ] ; then
+	mkdir configs/c.1
+fi
+
+if [ ! -d configs/c.1/strings/0x409 ] ; then
+	mkdir configs/c.1/strings/0x409
+fi
+
+echo "default" > configs/c.1/strings/0x409/configuration
+
+# The assumption is, that your USB device is self powered
+# If not: Change here
+echo 0 > configs/c.1/MaxPower
+
+if [ ! -d functions/ffs.usb0 ] ; then
+	mkdir functions/ffs.usb0
+	ln -s functions/ffs.usb0 configs/c.1
+fi
+
+if [ ! -d /usbfunc ] ; then
+	mkdir /usbfunc
+	mount -t functionfs usb0 /usbfunc
+fi
+
+echo 'To start function: Example'
+echo '   cd /usbfunc'
+echo '   usb_func_echo &'
+echo 'To bind to a UDC (USB Device Controller): Example'
+echo '   echo "fe200000.dwc3" > /config/usb_gadget/g1/UDC'
diff --git a/tools/usb/ffs-urb-example/host_app/usb_test_echo.c b/tools/usb/ffs-urb-example/host_app/usb_test_echo.c
new file mode 100644
index 000000000000..6de6aabb498e
--- /dev/null
+++ b/tools/usb/ffs-urb-example/host_app/usb_test_echo.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: MIT
+
+/*
+ * This code implements the PC counterpart to usb_func_echo.c
+ *
+ * It sends data to usb_func_echo.c, receives returned data
+ * and checks that the returned data is correct.
+ *
+ * Usage:
+ *   usb_func_echo  <USB device node>
+ *
+ * To find out, which USB device node to use, watch /var/log/messages
+ *
+ * Example, in /var/log/messages you get
+ *   usb 1-9: new high-speed USB device number 13 using xhci_hcd
+ *   usb 1-9: New USB device found, idVendor=1209, idProduct=4567 (...)
+ *   usb 1-9: New USB device strings: Mfr=1, Product=2, SerialNumber=3
+ *   usb 1-9: Product: Echo Test
+ *   usb 1-9: Manufacturer: Generic
+ *   usb 1-9: SerialNumber: 112233445566
+ * Then
+ *    $ cat /sys/bus/usb/devices/1-9/busnum
+ *     1
+ *    $ cat /sys/bus/usb/devices/1-9/devnum
+ *     13
+ * There should be a device node under /dev/bus/usb/001/013
+ * repesenting your USB device. You might now test with
+ *    $ usb_func_echo /dev/bus/usb/001/013
+ * You might need ROOT access to run this test.
+ */
+
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <poll.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <fcntl.h>
+#include <linux/usbdevice_fs.h>
+#include <time.h>
+
+#define DBG_PRINTF(...) do { \
+	printf("%s : ", __func__); \
+	printf(__VA_ARGS__); \
+	fflush(stdout); \
+} while ((0))
+
+#define USB_INTF_EP_OUT 0x01
+#define USB_INTF_EP_IN  0x81
+
+// define number of URBs
+// MUST be a power of 2
+#define URB_NR 8
+
+struct checkT {
+	uint32_t initValue;
+	int byteLen;
+};
+
+static struct {
+	int usbFd;
+
+	int checkTotalBytes;
+	int checkWrIdx;
+	int checkRdIdx;
+	int checkPending;
+	struct checkT checks[URB_NR];
+
+	uint8_t  rdDataBufSpace[0x4000*URB_NR + 0x2000];
+	uint8_t *rdDataBuf;
+	int rdUrbWrIdx;
+	int rdUrbRdIdx;
+	int rdPending;
+	struct usbdevfs_urb rdUrb[URB_NR];
+
+	uint8_t  wrDataBufSpace[0x4000*URB_NR + 0x2000];
+	uint8_t *wrDataBuf;
+	int wrUrbWrIdx;
+	int wrUrbRdIdx;
+	int wrPending;
+	struct usbdevfs_urb wrUrb[URB_NR];
+} gs;
+#define URB_NEXT_IDX(idx_) do { \
+	idx_ = ((idx_)+1)&(URB_NR-1); \
+} while ((0))
+
+static void fill_out_data(uint32_t *data, int byteLen)
+{
+	struct checkT *check;
+	uint32_t v;
+
+	// this ultra simple initialization tries to be fast
+	check = &(gs.checks[gs.checkWrIdx]);
+	v = random();
+	check->initValue = v;
+	check->byteLen = byteLen;
+	while (byteLen > 0) {
+		*data = v;
+		data++;
+		v += 0x5abc8203;
+		byteLen -= 4;
+	}
+	URB_NEXT_IDX(gs.checkWrIdx);
+	gs.checkPending++;
+}
+
+static void start_out_urb(void)
+{
+	struct usbdevfs_urb *outUrb;
+	uint32_t *data;
+	int length;
+	int err;
+
+
+	// make sure:
+	// * 0x10 <= length <= 0x3FFC
+	// * length is a multiple of 4 == sizeof(uint32_t)
+	// * length is NOT a multiple of max packet size
+	length  = random();
+	length &= 0x3FFC;
+	length |= 0x10;
+
+	data = (uint32_t *)(gs.wrDataBuf + (gs.wrUrbWrIdx*0x4000));
+	outUrb = &(gs.wrUrb[gs.wrUrbWrIdx]);
+	fill_out_data(data, length);
+
+retry:
+	memset(outUrb, 0, sizeof(struct usbdevfs_urb));
+	outUrb->type     = USBDEVFS_URB_TYPE_BULK;
+	outUrb->endpoint = USB_INTF_EP_OUT;
+	outUrb->buffer   = data;
+	outUrb->buffer_length = length;
+	err = ioctl(gs.usbFd, USBDEVFS_SUBMITURB, outUrb);
+	if (err < 0) {
+		int errnoValue;
+
+		errnoValue = errno;
+		if (errnoValue == EINTR)
+			goto retry;
+		DBG_PRINTF("ioctl error: errno = %d\n", errnoValue);
+		exit(1);
+	}
+	URB_NEXT_IDX(gs.wrUrbWrIdx);
+	gs.wrPending++;
+}
+
+static void complete_out_urb(struct usbdevfs_urb *urb)
+{
+	struct usbdevfs_urb *outUrb;
+
+	if (!gs.wrPending) {
+		DBG_PRINTF("No write pending\n");
+		exit(1);
+	}
+	outUrb = &(gs.wrUrb[gs.wrUrbRdIdx]);
+	if (urb != outUrb) {
+		DBG_PRINTF("Unexpected URB\n");
+		exit(1);
+	}
+	if (urb->actual_length != urb->buffer_length) {
+		DBG_PRINTF("Wrong length:\n");
+		printf("    is     %d\n", urb->actual_length);
+		printf("    should %d\n", urb->buffer_length);
+		exit(1);
+	}
+	URB_NEXT_IDX(gs.wrUrbRdIdx);
+	gs.wrPending--;
+}
+
+static void start_in_urb(void)
+{
+	struct usbdevfs_urb *inUrb;
+	uint32_t *data;
+	int err;
+
+	data = (uint32_t *)(gs.rdDataBuf + (gs.rdUrbWrIdx*0x4000));
+	inUrb = &(gs.rdUrb[gs.rdUrbWrIdx]);
+
+retry:
+	memset(inUrb, 0, sizeof(struct usbdevfs_urb));
+	inUrb->type     = USBDEVFS_URB_TYPE_BULK;
+	inUrb->endpoint = USB_INTF_EP_IN;
+	inUrb->buffer   = data;
+	inUrb->buffer_length = 0x4000;
+	err = ioctl(gs.usbFd, USBDEVFS_SUBMITURB, inUrb);
+	if (err < 0) {
+		int errnoValue;
+
+		errnoValue = errno;
+		if (errnoValue == EINTR)
+			goto retry;
+		DBG_PRINTF("ioctl error: errno = %d\n", errnoValue);
+		exit(1);
+	}
+	URB_NEXT_IDX(gs.rdUrbWrIdx);
+	gs.rdPending++;
+}
+
+static void check_in_data(struct usbdevfs_urb *urb)
+{
+	struct checkT *check;
+	uint32_t v, c, *data;
+	int byteLen;
+
+	check = &(gs.checks[gs.checkRdIdx]);
+	v = check->initValue;
+	byteLen = check->byteLen;
+	if (urb->actual_length != byteLen) {
+		DBG_PRINTF("unexpected length:\n");
+		printf("    is     %d\n", urb->actual_length);
+		printf("    should %d\n", byteLen);
+		exit(1);
+	}
+	gs.checkTotalBytes += byteLen;
+	data = (uint32_t *)urb->buffer;
+	while (byteLen > 0) {
+		c = *data;
+		data++;
+		if (c != (v^0xAAAAAAAA)) {
+			DBG_PRINTF("unexpected data:\n");
+			printf("    is     0x%08x\n", c);
+			printf("    should 0x%08x\n", v^0xAAAAAAAA);
+			exit(1);
+		}
+		v += 0x5abc8203;
+		byteLen -= 4;
+	}
+	URB_NEXT_IDX(gs.checkRdIdx);
+	gs.checkPending--;
+}
+
+static void complete_in_urb(struct usbdevfs_urb *urb)
+{
+	struct usbdevfs_urb *inUrb;
+
+	if (!gs.rdPending) {
+		DBG_PRINTF("no reads pending\n");
+		exit(1);
+	}
+	inUrb = &(gs.rdUrb[gs.rdUrbRdIdx]);
+	if (urb != inUrb) {
+		DBG_PRINTF("unexpected urb\n");
+		exit(1);
+	}
+	if (urb->actual_length <= 0) {
+		DBG_PRINTF("illegal length: %d\n", urb->actual_length);
+		exit(1);
+	}
+	check_in_data(urb);
+	URB_NEXT_IDX(gs.rdUrbRdIdx);
+	gs.rdPending--;
+}
+
+static uint8_t *alignTo8K(uint8_t *buf)
+{
+	uintptr_t bufAddr;
+
+	bufAddr  =   (uintptr_t)buf;
+	bufAddr +=   (uintptr_t)0x1FFF;
+	bufAddr &= ~((uintptr_t)0x1FFF);
+	return (uint8_t *)bufAddr;
+}
+
+#define ECHO_TEST_TRANSFERS 10000
+static void do_echo_test(void)
+{
+	int status;
+	struct pollfd pollfds[1];
+	struct usbdevfs_urb *urb;
+	int checksSend;
+	int checksRecv;
+
+	checksSend = 0;
+	checksRecv = 0;
+	for (;;) {
+
+		while (
+			checksSend < ECHO_TEST_TRANSFERS &&
+			gs.checkPending < 2 &&
+			gs.wrPending < 2
+		) {
+			checksSend++;
+			start_out_urb();
+		}
+		while (
+			checksRecv < ECHO_TEST_TRANSFERS &&
+			gs.rdPending < 2
+		) {
+			checksRecv++;
+			start_in_urb();
+		}
+		if (gs.wrPending == 0 && gs.rdPending == 0)
+			break;
+		memset(pollfds, 0, sizeof(pollfds));
+		pollfds[0].fd = gs.usbFd;
+		pollfds[0].events = POLLOUT|POLLWRNORM;
+		status = poll(pollfds, 1, 1000);
+		if (status == 0) {
+			printf("poll timeout...\n");
+			continue;
+		}
+		if (status < 0)
+			continue;
+		if (!pollfds[0].revents)
+			continue;
+		status = ioctl(gs.usbFd, USBDEVFS_REAPURB, &urb);
+		if (status < 0) {
+			printf("USBDEVFS_REAPURB error\n");
+			exit(1);
+		}
+		if (urb->endpoint == USB_INTF_EP_OUT)
+			complete_out_urb(urb);
+		else if (urb->endpoint == USB_INTF_EP_IN)
+			complete_in_urb(urb);
+	}
+}
+
+int main(int argc, char **argv)
+{
+	int intf, err;
+	struct timespec tp_start, tp_stop;
+	int64_t tDiff;
+
+	if (argc < 2) {
+		printf("Usage:\n");
+		printf("    usb_test_echo <usb device node>\n");
+		return 1;
+	}
+	gs.usbFd = open(argv[1], O_RDWR);
+	if (gs.usbFd < 0) {
+		printf("Can't open %s\nAborting.\n", argv[1]);
+		return 2;
+	}
+
+	intf = 0;
+	err = ioctl(gs.usbFd, USBDEVFS_CLAIMINTERFACE, &intf);
+	if (err) {
+		printf("Can't claim interface 0. Aborting\n");
+		return 3;
+	}
+	printf("Claimed interface 0...\n");
+
+	gs.rdDataBuf = alignTo8K(gs.rdDataBufSpace);
+	gs.wrDataBuf = alignTo8K(gs.wrDataBufSpace);
+
+
+
+	clock_gettime(CLOCK_MONOTONIC_RAW, &tp_start);
+	do_echo_test();
+	clock_gettime(CLOCK_MONOTONIC_RAW, &tp_stop);
+	tDiff  = (int64_t)(tp_stop.tv_sec)*(int64_t)1000000000;
+	tDiff += (int64_t)(tp_stop.tv_nsec);
+	tDiff -= (int64_t)(tp_start.tv_sec)*(int64_t)1000000000;
+	tDiff -= (int64_t)(tp_start.tv_nsec);
+	tDiff /= 1000;
+	printf("transferred %d bytes back and forth\n", gs.checkTotalBytes);
+	printf("%d iterations took %ld usec\n", ECHO_TEST_TRANSFERS, tDiff);
+
+	intf = 0;
+	err = ioctl(gs.usbFd, USBDEVFS_RELEASEINTERFACE, &intf);
+	if (err) {
+		printf("Can't release interface 0. Aborting\n");
+		return 4;
+	}
+	printf("Released interface 0...\n");
+	return 0;
+}
-- 
2.17.1

