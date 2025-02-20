Return-Path: <linux-usb+bounces-20871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F28A3DC3C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 15:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C20916A872
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 14:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917081DE4FF;
	Thu, 20 Feb 2025 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqBevdIG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B250282F5
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060779; cv=none; b=D6ojlbGqcgoPanZ9kYTS5cuMYiPvaJTfXbyLMT76Het+oK0FtpBNbuecJy4HcGtBJL6+odINAWZpexXraQ0Gi6vXA/4gn4U66oaRftOqR2ywCFD2n78fa78G5q1CwhJMwaYxp5DNUwJcMkuFuR/BL/v3H4kabc+OtYk2qKguk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060779; c=relaxed/simple;
	bh=CI7kvZN+Ry1UF2jBKtt1t/bKrIGP2UKk64gLfWVTEYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o6EwqOGNpdwp+bGk3nFwLebnk8OVWl5oapIt5znPKRI0dAJF0H16ChuEAaMXM0rpiYoJH67eCZo2osZzz+ATX7Q5X88SSxQ0tYk3qTWHWe/SD/UM7gJURWBlorP36R5KOCKUaN1m0HSGlrPPghmzHmJe52uQ8uWcoyEDXFi6A9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqBevdIG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740060778; x=1771596778;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CI7kvZN+Ry1UF2jBKtt1t/bKrIGP2UKk64gLfWVTEYI=;
  b=XqBevdIG3QN0aGqJPsGhDyDXpCGVuNykUSI2HUxkWYUig3t0OwTBhU6T
   KgAI9tvEThKoJ2eMMTpEJN5aKGjXT4dZFyTqHpuxwhQW3+QC3D4xRhIqT
   HODbIF5kZ06oloDTl/WNhMTW2Q8g4duljcaJXTnNg45mgagHEyAOglk0e
   aPjGtDA5+Y49c2vUhEMfqctCSK8MnD+0VflTNaMm7d57F35VOhovUdljY
   c2hNKgwtImLxDbTWXDPpWbRFb+vJxoEt+nclgPDdx+sPJIYG8THa3F1ME
   MXxM/S1OvQFKORMoGwMMhUnFlZ9gYbO8ZVxF+xiDRLnhHe59rBj9zGsUj
   w==;
X-CSE-ConnectionGUID: Fw60az7MSf6tX/ZUdybV9w==
X-CSE-MsgGUID: k0tzBEeTTcO4HUuLtDRQJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40708636"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40708636"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:12:57 -0800
X-CSE-ConnectionGUID: k5nktLVSSWSBl2t6fK4I0A==
X-CSE-MsgGUID: W5seEqUYR+umTPWfOHzc+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152244824"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa001.jf.intel.com with ESMTP; 20 Feb 2025 06:12:54 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Kannappan R <r.kannappan@intel.com>,
	Amardeep Rai <amardeep.rai@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH] USB: core: Add eUSB2 descriptor and parsing in USB core
Date: Thu, 20 Feb 2025 16:13:39 +0200
Message-ID: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kannappan R <r.kannappan@intel.com>

Add support for the 'eUSB2 Isochronous Endpoint Companion Descriptor'
introduced in the recent USB 2.0 specification 'USB 2.0 Double Isochronous
IN Bandwidth' ECN.

It allows embedded USB2 (eUSB2) devices to report and use higher bandwidths
for isochronous IN transfers in order to support higher camera resolutions
on the lid of laptops and tablets with minimal change to the USB2 protocol.

The motivation for expanding USB 2.0 is further clarified in an additional
Embedded USB2 version 2.0 (eUSB2v2) supplement to the USB 2.0
specification. It points out this is optimized for performance, power and
cost by using the USB 2.0 low-voltage, power efficient PHY and half-duplex
link for the asymmetric camera bandwidth needs, avoiding the costly and
complex full-duplex USB 3.x symmetric link and gigabit receivers.

eUSB2 devices that support the higher isochronous IN bandwidth and the new
descriptor can be identified by their device descriptor bcdUSB value of
0x0220

Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
Signed-off-by: Kannappan R <r.kannappan@intel.com>
Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/core/config.c    | 51 ++++++++++++++++++++++++++++++++----
 include/linux/usb.h          |  8 +++---
 include/uapi/linux/usb/ch9.h | 15 +++++++++++
 3 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index f7bf8d1de3ad..13bd4ec4ea5f 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -64,6 +64,37 @@ static void usb_parse_ssp_isoc_endpoint_companion(struct device *ddev,
 	memcpy(&ep->ssp_isoc_ep_comp, desc, USB_DT_SSP_ISOC_EP_COMP_SIZE);
 }
 
+static void usb_parse_eusb2_isoc_endpoint_companion(struct device *ddev,
+		int cfgno, int inum, int asnum, struct usb_host_endpoint *ep,
+		unsigned char *buffer, int size)
+{
+	struct usb_eusb2_isoc_ep_comp_descriptor *desc;
+	struct usb_descriptor_header *h;
+
+	/*
+	 * eUSB2 isochronous endpoint companion descriptor for this endpoint
+	 * shall be declared before the next endpoint or interface descriptor
+	 */
+	while (size >= USB_DT_EUSB2_ISOC_EP_COMP_SIZE) {
+		h = (struct usb_descriptor_header *)buffer;
+
+		if (h->bDescriptorType == USB_DT_EUSB2_ISOC_ENDPOINT_COMP) {
+			desc = (struct usb_eusb2_isoc_ep_comp_descriptor *)buffer;
+			ep->eusb2_isoc_ep_comp = *desc;
+			return;
+		}
+		if (h->bDescriptorType == USB_DT_ENDPOINT ||
+		    h->bDescriptorType == USB_DT_INTERFACE)
+			break;
+
+		buffer += h->bLength;
+		size -= h->bLength;
+	}
+
+	dev_notice(ddev, "No eUSB2 isoc ep %d companion for config %d interface %d altsetting %d\n",
+		   ep->desc.bEndpointAddress, cfgno, inum, asnum);
+}
+
 static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 		int inum, int asnum, struct usb_host_endpoint *ep,
 		unsigned char *buffer, int size)
@@ -258,8 +289,10 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	int n, i, j, retval;
 	unsigned int maxp;
 	const unsigned short *maxpacket_maxes;
+	u16 bcdUSB;
 
 	d = (struct usb_endpoint_descriptor *) buffer;
+	bcdUSB = le16_to_cpu(udev->descriptor.bcdUSB);
 	buffer += d->bLength;
 	size -= d->bLength;
 
@@ -409,15 +442,17 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 
 	/*
 	 * Validate the wMaxPacketSize field.
-	 * Some devices have isochronous endpoints in altsetting 0;
-	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
-	 * (see the end of section 5.6.3), so don't warn about them.
+	 * eUSB2 devices (see USB 2.0 Double Isochronous IN ECN 9.6.6 Endpoint)
+	 * and devices with isochronous endpoints in altsetting 0 (see USB 2.0
+	 * end of section 5.6.3) have wMaxPacketSize = 0.
+	 * So don't warn about those.
 	 */
 	maxp = le16_to_cpu(endpoint->desc.wMaxPacketSize);
-	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
+
+	if (maxp == 0 && bcdUSB != 0x0220 &&
+	    !(usb_endpoint_xfer_isoc(d) && asnum == 0))
 		dev_notice(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
-	}
 
 	/* Find the highest legal maxpacket size for this endpoint */
 	i = 0;		/* additional transactions per microframe */
@@ -465,6 +500,12 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 				maxp);
 	}
 
+	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
+	if (bcdUSB == 0x0220 && d->wMaxPacketSize == 0 &&
+	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
+		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
+							endpoint, buffer, size);
+
 	/* Parse a possible SuperSpeed endpoint companion descriptor */
 	if (udev->speed >= USB_SPEED_SUPER)
 		usb_parse_ss_endpoint_companion(ddev, cfgno,
diff --git a/include/linux/usb.h b/include/linux/usb.h
index cfa8005e24f9..b46738701f8d 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -51,6 +51,7 @@ struct ep_device;
  * @desc: descriptor for this endpoint, wMaxPacketSize in native byteorder
  * @ss_ep_comp: SuperSpeed companion descriptor for this endpoint
  * @ssp_isoc_ep_comp: SuperSpeedPlus isoc companion descriptor for this endpoint
+ * @eusb2_isoc_ep_comp: eUSB2 isoc companion descriptor for this endpoint
  * @urb_list: urbs queued to this endpoint; maintained by usbcore
  * @hcpriv: for use by HCD; typically holds hardware dma queue head (QH)
  *	with one or more transfer descriptors (TDs) per urb
@@ -64,9 +65,10 @@ struct ep_device;
  * descriptor within an active interface in a given USB configuration.
  */
 struct usb_host_endpoint {
-	struct usb_endpoint_descriptor		desc;
-	struct usb_ss_ep_comp_descriptor	ss_ep_comp;
-	struct usb_ssp_isoc_ep_comp_descriptor	ssp_isoc_ep_comp;
+	struct usb_endpoint_descriptor			desc;
+	struct usb_ss_ep_comp_descriptor		ss_ep_comp;
+	struct usb_ssp_isoc_ep_comp_descriptor		ssp_isoc_ep_comp;
+	struct usb_eusb2_isoc_ep_comp_descriptor	eusb2_isoc_ep_comp;
 	struct list_head		urb_list;
 	void				*hcpriv;
 	struct ep_device		*ep_dev;	/* For sysfs info */
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 91f0f7e214a5..475af9358173 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -253,6 +253,9 @@ struct usb_ctrlrequest {
 #define USB_DT_BOS			0x0f
 #define USB_DT_DEVICE_CAPABILITY	0x10
 #define USB_DT_WIRELESS_ENDPOINT_COMP	0x11
+/* From the eUSB2 spec */
+#define USB_DT_EUSB2_ISOC_ENDPOINT_COMP	0x12
+/* From Wireless USB spec */
 #define USB_DT_WIRE_ADAPTER		0x21
 /* From USB Device Firmware Upgrade Specification, Revision 1.1 */
 #define USB_DT_DFU_FUNCTIONAL		0x21
@@ -675,6 +678,18 @@ static inline int usb_endpoint_interrupt_type(
 
 /*-------------------------------------------------------------------------*/
 
+/* USB_DT_EUSB2_ISOC_ENDPOINT_COMP: eUSB2 Isoch Endpoint Companion descriptor */
+struct usb_eusb2_isoc_ep_comp_descriptor {
+	__u8	bLength;
+	__u8	bDescriptorType;
+	__le16	wMaxPacketSize;
+	__le32	dwBytesPerInterval;
+} __attribute__ ((packed));
+
+#define USB_DT_EUSB2_ISOC_EP_COMP_SIZE	8
+
+/*-------------------------------------------------------------------------*/
+
 /* USB_DT_SSP_ISOC_ENDPOINT_COMP: SuperSpeedPlus Isochronous Endpoint Companion
  * descriptor
  */
-- 
2.43.0


