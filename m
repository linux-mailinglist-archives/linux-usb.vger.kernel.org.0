Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00682616BCA
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 19:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiKBSO3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 14:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKBSO2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 14:14:28 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 24AD4636A
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 11:14:27 -0700 (PDT)
Received: (qmail 278457 invoked by uid 1000); 2 Nov 2022 14:13:19 -0400
Date:   Wed, 2 Nov 2022 14:13:19 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "Artem S. Tashkinov" <aros@gmx.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Change configuration warnings to notices
Message-ID: <Y2KzPx0h6z1jXCuN@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It has been pointed out that the kernel log messages warning about
problems in USB configuration and related descriptors are vexing for
users.  The warning log level has a fairly high priority, but the user
can do nothing to fix the underlying errors in the device's firmware.

To reduce the amount of useless information produced by tools that
filter high-priority log messages, we can change these warnings to
notices, i.e., change dev_warn() to dev_notice().  The same holds for
a few messages that currently use dev_err(): Unless they indicate a
failure that might make a device unusable (such as inability to
transfer a config descriptor), change them to dev_notice() also.

Suggested-by: Artem S. Tashkinov <aros@gmx.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216630

---


[as1988]


 drivers/usb/core/config.c |   82 +++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -61,7 +61,7 @@ static void usb_parse_ssp_isoc_endpoint_
 	desc = (struct usb_ssp_isoc_ep_comp_descriptor *) buffer;
 	if (desc->bDescriptorType != USB_DT_SSP_ISOC_ENDPOINT_COMP ||
 	    size < USB_DT_SSP_ISOC_EP_COMP_SIZE) {
-		dev_warn(ddev, "Invalid SuperSpeedPlus isoc endpoint companion"
+		dev_notice(ddev, "Invalid SuperSpeedPlus isoc endpoint companion"
 			 "for config %d interface %d altsetting %d ep %d.\n",
 			 cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		return;
@@ -83,7 +83,7 @@ static void usb_parse_ss_endpoint_compan
 
 	if (desc->bDescriptorType != USB_DT_SS_ENDPOINT_COMP ||
 			size < USB_DT_SS_EP_COMP_SIZE) {
-		dev_warn(ddev, "No SuperSpeed endpoint companion for config %d "
+		dev_notice(ddev, "No SuperSpeed endpoint companion for config %d "
 				" interface %d altsetting %d ep %d: "
 				"using minimum values\n",
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
@@ -109,13 +109,13 @@ static void usb_parse_ss_endpoint_compan
 
 	/* Check the various values */
 	if (usb_endpoint_xfer_control(&ep->desc) && desc->bMaxBurst != 0) {
-		dev_warn(ddev, "Control endpoint with bMaxBurst = %d in "
+		dev_notice(ddev, "Control endpoint with bMaxBurst = %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to zero\n", desc->bMaxBurst,
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bMaxBurst = 0;
 	} else if (desc->bMaxBurst > 15) {
-		dev_warn(ddev, "Endpoint with bMaxBurst = %d in "
+		dev_notice(ddev, "Endpoint with bMaxBurst = %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to 15\n", desc->bMaxBurst,
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
@@ -125,7 +125,7 @@ static void usb_parse_ss_endpoint_compan
 	if ((usb_endpoint_xfer_control(&ep->desc) ||
 			usb_endpoint_xfer_int(&ep->desc)) &&
 				desc->bmAttributes != 0) {
-		dev_warn(ddev, "%s endpoint with bmAttributes = %d in "
+		dev_notice(ddev, "%s endpoint with bmAttributes = %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to zero\n",
 				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Bulk",
@@ -134,7 +134,7 @@ static void usb_parse_ss_endpoint_compan
 		ep->ss_ep_comp.bmAttributes = 0;
 	} else if (usb_endpoint_xfer_bulk(&ep->desc) &&
 			desc->bmAttributes > 16) {
-		dev_warn(ddev, "Bulk endpoint with more than 65536 streams in "
+		dev_notice(ddev, "Bulk endpoint with more than 65536 streams in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to max\n",
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
@@ -142,7 +142,7 @@ static void usb_parse_ss_endpoint_compan
 	} else if (usb_endpoint_xfer_isoc(&ep->desc) &&
 		   !USB_SS_SSP_ISOC_COMP(desc->bmAttributes) &&
 		   USB_SS_MULT(desc->bmAttributes) > 3) {
-		dev_warn(ddev, "Isoc endpoint has Mult of %d in "
+		dev_notice(ddev, "Isoc endpoint has Mult of %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to 3\n",
 				USB_SS_MULT(desc->bmAttributes),
@@ -160,7 +160,7 @@ static void usb_parse_ss_endpoint_compan
 	else
 		max_tx = 999999;
 	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx) {
-		dev_warn(ddev, "%s endpoint with wBytesPerInterval of %d in "
+		dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to %d\n",
 				usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
@@ -273,7 +273,7 @@ static int usb_parse_endpoint(struct dev
 	else if (d->bLength >= USB_DT_ENDPOINT_SIZE)
 		n = USB_DT_ENDPOINT_SIZE;
 	else {
-		dev_warn(ddev, "config %d interface %d altsetting %d has an "
+		dev_notice(ddev, "config %d interface %d altsetting %d has an "
 		    "invalid endpoint descriptor of length %d, skipping\n",
 		    cfgno, inum, asnum, d->bLength);
 		goto skip_to_next_endpoint_or_interface_descriptor;
@@ -281,7 +281,7 @@ static int usb_parse_endpoint(struct dev
 
 	i = d->bEndpointAddress & ~USB_ENDPOINT_DIR_MASK;
 	if (i >= 16 || i == 0) {
-		dev_warn(ddev, "config %d interface %d altsetting %d has an "
+		dev_notice(ddev, "config %d interface %d altsetting %d has an "
 		    "invalid endpoint with address 0x%X, skipping\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
 		goto skip_to_next_endpoint_or_interface_descriptor;
@@ -293,7 +293,7 @@ static int usb_parse_endpoint(struct dev
 
 	/* Check for duplicate endpoint addresses */
 	if (config_endpoint_is_duplicate(config, inum, asnum, d)) {
-		dev_warn(ddev, "config %d interface %d altsetting %d has a duplicate endpoint with address 0x%X, skipping\n",
+		dev_notice(ddev, "config %d interface %d altsetting %d has a duplicate endpoint with address 0x%X, skipping\n",
 				cfgno, inum, asnum, d->bEndpointAddress);
 		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
@@ -301,7 +301,7 @@ static int usb_parse_endpoint(struct dev
 	/* Ignore some endpoints */
 	if (udev->quirks & USB_QUIRK_ENDPOINT_IGNORE) {
 		if (usb_endpoint_is_ignored(udev, ifp, d)) {
-			dev_warn(ddev, "config %d interface %d altsetting %d has an ignored endpoint with address 0x%X, skipping\n",
+			dev_notice(ddev, "config %d interface %d altsetting %d has an ignored endpoint with address 0x%X, skipping\n",
 					cfgno, inum, asnum,
 					d->bEndpointAddress);
 			goto skip_to_next_endpoint_or_interface_descriptor;
@@ -378,7 +378,7 @@ static int usb_parse_endpoint(struct dev
 		}
 	}
 	if (d->bInterval < i || d->bInterval > j) {
-		dev_warn(ddev, "config %d interface %d altsetting %d "
+		dev_notice(ddev, "config %d interface %d altsetting %d "
 		    "endpoint 0x%X has an invalid bInterval %d, "
 		    "changing to %d\n",
 		    cfgno, inum, asnum,
@@ -391,7 +391,7 @@ static int usb_parse_endpoint(struct dev
 	 * them usable, we will try treating them as Interrupt endpoints.
 	 */
 	if (udev->speed == USB_SPEED_LOW && usb_endpoint_xfer_bulk(d)) {
-		dev_warn(ddev, "config %d interface %d altsetting %d "
+		dev_notice(ddev, "config %d interface %d altsetting %d "
 		    "endpoint 0x%X is Bulk; changing to Interrupt\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
 		endpoint->desc.bmAttributes = USB_ENDPOINT_XFER_INT;
@@ -408,7 +408,7 @@ static int usb_parse_endpoint(struct dev
 	 */
 	maxp = le16_to_cpu(endpoint->desc.wMaxPacketSize);
 	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
-		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
+		dev_notice(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
 	}
 
@@ -439,7 +439,7 @@ static int usb_parse_endpoint(struct dev
 	j = maxpacket_maxes[usb_endpoint_type(&endpoint->desc)];
 
 	if (maxp > j) {
-		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid maxpacket %d, setting to %d\n",
+		dev_notice(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid maxpacket %d, setting to %d\n",
 		    cfgno, inum, asnum, d->bEndpointAddress, maxp, j);
 		maxp = j;
 		endpoint->desc.wMaxPacketSize = cpu_to_le16(i | maxp);
@@ -452,7 +452,7 @@ static int usb_parse_endpoint(struct dev
 	 */
 	if (udev->speed == USB_SPEED_HIGH && usb_endpoint_xfer_bulk(d)) {
 		if (maxp != 512)
-			dev_warn(ddev, "config %d interface %d altsetting %d "
+			dev_notice(ddev, "config %d interface %d altsetting %d "
 				"bulk endpoint 0x%X has invalid maxpacket %d\n",
 				cfgno, inum, asnum, d->bEndpointAddress,
 				maxp);
@@ -533,7 +533,7 @@ static int usb_parse_interface(struct de
 	      i < intfc->num_altsetting;
 	     (++i, ++alt)) {
 		if (alt->desc.bAlternateSetting == asnum) {
-			dev_warn(ddev, "Duplicate descriptor for config %d "
+			dev_notice(ddev, "Duplicate descriptor for config %d "
 			    "interface %d altsetting %d, skipping\n",
 			    cfgno, inum, asnum);
 			goto skip_to_next_interface_descriptor;
@@ -559,7 +559,7 @@ static int usb_parse_interface(struct de
 	num_ep = num_ep_orig = alt->desc.bNumEndpoints;
 	alt->desc.bNumEndpoints = 0;		/* Use as a counter */
 	if (num_ep > USB_MAXENDPOINTS) {
-		dev_warn(ddev, "too many endpoints for config %d interface %d "
+		dev_notice(ddev, "too many endpoints for config %d interface %d "
 		    "altsetting %d: %d, using maximum allowed: %d\n",
 		    cfgno, inum, asnum, num_ep, USB_MAXENDPOINTS);
 		num_ep = USB_MAXENDPOINTS;
@@ -590,7 +590,7 @@ static int usb_parse_interface(struct de
 	}
 
 	if (n != num_ep_orig)
-		dev_warn(ddev, "config %d interface %d altsetting %d has %d "
+		dev_notice(ddev, "config %d interface %d altsetting %d has %d "
 		    "endpoint descriptor%s, different from the interface "
 		    "descriptor's value: %d\n",
 		    cfgno, inum, asnum, n, plural(n), num_ep_orig);
@@ -625,7 +625,7 @@ static int usb_parse_configuration(struc
 	if (config->desc.bDescriptorType != USB_DT_CONFIG ||
 	    config->desc.bLength < USB_DT_CONFIG_SIZE ||
 	    config->desc.bLength > size) {
-		dev_err(ddev, "invalid descriptor for config index %d: "
+		dev_notice(ddev, "invalid descriptor for config index %d: "
 		    "type = 0x%X, length = %d\n", cfgidx,
 		    config->desc.bDescriptorType, config->desc.bLength);
 		return -EINVAL;
@@ -636,7 +636,7 @@ static int usb_parse_configuration(struc
 	size -= config->desc.bLength;
 
 	if (nintf > USB_MAXINTERFACES) {
-		dev_warn(ddev, "config %d has too many interfaces: %d, "
+		dev_notice(ddev, "config %d has too many interfaces: %d, "
 		    "using maximum allowed: %d\n",
 		    cfgno, nintf, USB_MAXINTERFACES);
 		nintf = USB_MAXINTERFACES;
@@ -650,7 +650,7 @@ static int usb_parse_configuration(struc
 	     (buffer2 += header->bLength, size2 -= header->bLength)) {
 
 		if (size2 < sizeof(struct usb_descriptor_header)) {
-			dev_warn(ddev, "config %d descriptor has %d excess "
+			dev_notice(ddev, "config %d descriptor has %d excess "
 			    "byte%s, ignoring\n",
 			    cfgno, size2, plural(size2));
 			break;
@@ -658,7 +658,7 @@ static int usb_parse_configuration(struc
 
 		header = (struct usb_descriptor_header *) buffer2;
 		if ((header->bLength > size2) || (header->bLength < 2)) {
-			dev_warn(ddev, "config %d has an invalid descriptor "
+			dev_notice(ddev, "config %d has an invalid descriptor "
 			    "of length %d, skipping remainder of the config\n",
 			    cfgno, header->bLength);
 			break;
@@ -670,7 +670,7 @@ static int usb_parse_configuration(struc
 
 			d = (struct usb_interface_descriptor *) header;
 			if (d->bLength < USB_DT_INTERFACE_SIZE) {
-				dev_warn(ddev, "config %d has an invalid "
+				dev_notice(ddev, "config %d has an invalid "
 				    "interface descriptor of length %d, "
 				    "skipping\n", cfgno, d->bLength);
 				continue;
@@ -680,7 +680,7 @@ static int usb_parse_configuration(struc
 
 			if ((dev->quirks & USB_QUIRK_HONOR_BNUMINTERFACES) &&
 			    n >= nintf_orig) {
-				dev_warn(ddev, "config %d has more interface "
+				dev_notice(ddev, "config %d has more interface "
 				    "descriptors, than it declares in "
 				    "bNumInterfaces, ignoring interface "
 				    "number: %d\n", cfgno, inum);
@@ -688,7 +688,7 @@ static int usb_parse_configuration(struc
 			}
 
 			if (inum >= nintf_orig)
-				dev_warn(ddev, "config %d has an invalid "
+				dev_notice(ddev, "config %d has an invalid "
 				    "interface number: %d but max is %d\n",
 				    cfgno, inum, nintf_orig - 1);
 
@@ -713,14 +713,14 @@ static int usb_parse_configuration(struc
 
 			d = (struct usb_interface_assoc_descriptor *)header;
 			if (d->bLength < USB_DT_INTERFACE_ASSOCIATION_SIZE) {
-				dev_warn(ddev,
+				dev_notice(ddev,
 					 "config %d has an invalid interface association descriptor of length %d, skipping\n",
 					 cfgno, d->bLength);
 				continue;
 			}
 
 			if (iad_num == USB_MAXIADS) {
-				dev_warn(ddev, "found more Interface "
+				dev_notice(ddev, "found more Interface "
 					       "Association Descriptors "
 					       "than allocated for in "
 					       "configuration %d\n", cfgno);
@@ -731,7 +731,7 @@ static int usb_parse_configuration(struc
 
 		} else if (header->bDescriptorType == USB_DT_DEVICE ||
 			    header->bDescriptorType == USB_DT_CONFIG)
-			dev_warn(ddev, "config %d contains an unexpected "
+			dev_notice(ddev, "config %d contains an unexpected "
 			    "descriptor of type 0x%X, skipping\n",
 			    cfgno, header->bDescriptorType);
 
@@ -740,11 +740,11 @@ static int usb_parse_configuration(struc
 	config->desc.wTotalLength = cpu_to_le16(buffer2 - buffer0);
 
 	if (n != nintf)
-		dev_warn(ddev, "config %d has %d interface%s, different from "
+		dev_notice(ddev, "config %d has %d interface%s, different from "
 		    "the descriptor's value: %d\n",
 		    cfgno, n, plural(n), nintf_orig);
 	else if (n == 0)
-		dev_warn(ddev, "config %d has no interfaces?\n", cfgno);
+		dev_notice(ddev, "config %d has no interfaces?\n", cfgno);
 	config->desc.bNumInterfaces = nintf = n;
 
 	/* Check for missing interface numbers */
@@ -754,7 +754,7 @@ static int usb_parse_configuration(struc
 				break;
 		}
 		if (j >= nintf)
-			dev_warn(ddev, "config %d has no interface number "
+			dev_notice(ddev, "config %d has no interface number "
 			    "%d\n", cfgno, i);
 	}
 
@@ -762,7 +762,7 @@ static int usb_parse_configuration(struc
 	for (i = 0; i < nintf; ++i) {
 		j = nalts[i];
 		if (j > USB_MAXALTSETTING) {
-			dev_warn(ddev, "too many alternate settings for "
+			dev_notice(ddev, "too many alternate settings for "
 			    "config %d interface %d: %d, "
 			    "using maximum allowed: %d\n",
 			    cfgno, inums[i], j, USB_MAXALTSETTING);
@@ -811,7 +811,7 @@ static int usb_parse_configuration(struc
 					break;
 			}
 			if (n >= intfc->num_altsetting)
-				dev_warn(ddev, "config %d interface %d has no "
+				dev_notice(ddev, "config %d interface %d has no "
 				    "altsetting %d\n", cfgno, inums[i], j);
 		}
 	}
@@ -868,7 +868,7 @@ int usb_get_configuration(struct usb_dev
 	int result;
 
 	if (ncfg > USB_MAXCONFIG) {
-		dev_warn(ddev, "too many configurations: %d, "
+		dev_notice(ddev, "too many configurations: %d, "
 		    "using maximum allowed: %d\n", ncfg, USB_MAXCONFIG);
 		dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
 	}
@@ -902,7 +902,7 @@ int usb_get_configuration(struct usb_dev
 			    "descriptor/%s: %d\n", cfgno, "start", result);
 			if (result != -EPIPE)
 				goto err;
-			dev_err(ddev, "chopping to %d config(s)\n", cfgno);
+			dev_notice(ddev, "chopping to %d config(s)\n", cfgno);
 			dev->descriptor.bNumConfigurations = cfgno;
 			break;
 		} else if (result < 4) {
@@ -934,7 +934,7 @@ int usb_get_configuration(struct usb_dev
 			goto err;
 		}
 		if (result < length) {
-			dev_warn(ddev, "config index %d descriptor too short "
+			dev_notice(ddev, "config index %d descriptor too short "
 			    "(expected %i, got %i)\n", cfgno, length, result);
 			length = result;
 		}
@@ -993,7 +993,7 @@ int usb_get_bos_descriptor(struct usb_de
 	/* Get BOS descriptor */
 	ret = usb_get_descriptor(dev, USB_DT_BOS, 0, bos, USB_DT_BOS_SIZE);
 	if (ret < USB_DT_BOS_SIZE || bos->bLength < USB_DT_BOS_SIZE) {
-		dev_err(ddev, "unable to get BOS descriptor or descriptor too short\n");
+		dev_notice(ddev, "unable to get BOS descriptor or descriptor too short\n");
 		if (ret >= 0)
 			ret = -ENOMSG;
 		kfree(bos);
@@ -1021,7 +1021,7 @@ int usb_get_bos_descriptor(struct usb_de
 
 	ret = usb_get_descriptor(dev, USB_DT_BOS, 0, buffer, total_len);
 	if (ret < total_len) {
-		dev_err(ddev, "unable to get BOS descriptor set\n");
+		dev_notice(ddev, "unable to get BOS descriptor set\n");
 		if (ret >= 0)
 			ret = -ENOMSG;
 		goto err;
@@ -1046,7 +1046,7 @@ int usb_get_bos_descriptor(struct usb_de
 		}
 
 		if (cap->bDescriptorType != USB_DT_DEVICE_CAPABILITY) {
-			dev_warn(ddev, "descriptor type invalid, skip\n");
+			dev_notice(ddev, "descriptor type invalid, skip\n");
 			continue;
 		}
 
