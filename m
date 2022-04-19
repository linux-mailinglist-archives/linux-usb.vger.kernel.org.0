Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1945507A84
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 21:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356257AbiDSTxO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 15:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356314AbiDSTxM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 15:53:12 -0400
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49E221E1F
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 12:50:26 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 45D7F20DE4E5
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: core: devices: use scnprintf() instead of sprintf()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <ebfd7a94-34d2-6259-fa0c-4a5dcc649d2b@omp.ru>
Date:   Tue, 19 Apr 2022 22:50:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB device dump code uses the sprintf() calls with a 2-page buffer,
leaving 256 bytes at the end of that buffer to prevent buffer overflow.
Using scnprntf() instead eliminates the very possibility of the buffer
overflow, while also simplifying the code. This however is achieved at
the expense of not printing the "(truncated)" line anymore when the end
of that buffer is actually reached; instead a possible partial line at
the end of buffer (not ending with '\n') is now not printed.

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo,
plus the patch removing some dead code I posted yesterday -- there's no
context dependency, only a single hunk's offset though...

 drivers/usb/core/devices.c |  138 +++++++++++++++++----------------------------
 1 file changed, 54 insertions(+), 84 deletions(-)

Index: usb/drivers/usb/core/devices.c
===================================================================
--- usb.orig/drivers/usb/core/devices.c
+++ usb/drivers/usb/core/devices.c
@@ -145,9 +145,6 @@ static char *usb_dump_endpoint_descripto
 	char dir, unit, *type;
 	unsigned interval, bandwidth = 1;
 
-	if (start > end)
-		return start;
-
 	dir = usb_endpoint_dir_in(desc) ? 'I' : 'O';
 
 	if (speed == USB_SPEED_HIGH)
@@ -180,11 +177,11 @@ static char *usb_dump_endpoint_descripto
 		interval /= 1000;
 	}
 
-	start += sprintf(start, format_endpt, desc->bEndpointAddress, dir,
-			 desc->bmAttributes, type,
-			 usb_endpoint_maxp(desc) *
-			 bandwidth,
-			 interval, unit);
+	start += scnprintf(start, end - start, format_endpt,
+			   desc->bEndpointAddress, dir,
+			   desc->bmAttributes, type,
+			   usb_endpoint_maxp(desc) * bandwidth,
+			   interval, unit);
 	return start;
 }
 
@@ -197,8 +194,6 @@ static char *usb_dump_interface_descript
 	const char *driver_name = "";
 	int active = 0;
 
-	if (start > end)
-		return start;
 	desc = &intfc->altsetting[setno].desc;
 	if (iface) {
 		driver_name = (iface->dev.driver
@@ -206,16 +201,16 @@ static char *usb_dump_interface_descript
 				: "(none)");
 		active = (desc == &iface->cur_altsetting->desc);
 	}
-	start += sprintf(start, format_iface,
-			 active ? '*' : ' ',	/* mark active altsetting */
-			 desc->bInterfaceNumber,
-			 desc->bAlternateSetting,
-			 desc->bNumEndpoints,
-			 desc->bInterfaceClass,
-			 class_decode(desc->bInterfaceClass),
-			 desc->bInterfaceSubClass,
-			 desc->bInterfaceProtocol,
-			 driver_name);
+	start += scnprintf(start, end - start, format_iface,
+			   active ? '*' : ' ',	/* mark active altsetting */
+			   desc->bInterfaceNumber,
+			   desc->bAlternateSetting,
+			   desc->bNumEndpoints,
+			   desc->bInterfaceClass,
+			   class_decode(desc->bInterfaceClass),
+			   desc->bInterfaceSubClass,
+			   desc->bInterfaceProtocol,
+			   driver_name);
 	return start;
 }
 
@@ -228,8 +223,6 @@ static char *usb_dump_interface(int spee
 
 	start = usb_dump_interface_descriptor(start, end, intfc, iface, setno);
 	for (i = 0; i < desc->desc.bNumEndpoints; i++) {
-		if (start > end)
-			return start;
 		start = usb_dump_endpoint_descriptor(speed,
 				start, end, &desc->endpoint[i].desc);
 	}
@@ -239,15 +232,13 @@ static char *usb_dump_interface(int spee
 static char *usb_dump_iad_descriptor(char *start, char *end,
 			const struct usb_interface_assoc_descriptor *iad)
 {
-	if (start > end)
-		return start;
-	start += sprintf(start, format_iad,
-			 iad->bFirstInterface,
-			 iad->bInterfaceCount,
-			 iad->bFunctionClass,
-			 class_decode(iad->bFunctionClass),
-			 iad->bFunctionSubClass,
-			 iad->bFunctionProtocol);
+	start += scnprintf(start, end - start, format_iad,
+			   iad->bFirstInterface,
+			   iad->bInterfaceCount,
+			   iad->bFunctionClass,
+			   class_decode(iad->bFunctionClass),
+			   iad->bFunctionSubClass,
+			   iad->bFunctionProtocol);
 	return start;
 }
 
@@ -262,19 +253,17 @@ static char *usb_dump_config_descriptor(
 {
 	int mul;
 
-	if (start > end)
-		return start;
 	if (speed >= USB_SPEED_SUPER)
 		mul = 8;
 	else
 		mul = 2;
-	start += sprintf(start, format_config,
-			 /* mark active/actual/current cfg. */
-			 active ? '*' : ' ',
-			 desc->bNumInterfaces,
-			 desc->bConfigurationValue,
-			 desc->bmAttributes,
-			 desc->bMaxPower * mul);
+	start += scnprintf(start, end - start, format_config,
+			   /* mark active/actual/current cfg. */
+			   active ? '*' : ' ',
+			   desc->bNumInterfaces,
+			   desc->bConfigurationValue,
+			   desc->bmAttributes,
+			   desc->bMaxPower * mul);
 	return start;
 }
 
@@ -285,11 +274,9 @@ static char *usb_dump_config(int speed,
 	struct usb_interface_cache *intfc;
 	struct usb_interface *interface;
 
-	if (start > end)
-		return start;
 	if (!config)
 		/* getting these some in 2.3.7; none in 2.3.6 */
-		return start + sprintf(start, "(null Cfg. desc.)\n");
+		return start + scnprintf(start, end - start, "(null Cfg. desc.)\n");
 	start = usb_dump_config_descriptor(start, end, &config->desc, active,
 			speed);
 	for (i = 0; i < USB_MAXIADS; i++) {
@@ -302,8 +289,6 @@ static char *usb_dump_config(int speed,
 		intfc = config->intf_cache[i];
 		interface = config->interface[i];
 		for (j = 0; j < intfc->num_altsetting; j++) {
-			if (start > end)
-				return start;
 			start = usb_dump_interface(speed,
 				start, end, intfc, interface, j);
 		}
@@ -320,22 +305,18 @@ static char *usb_dump_device_descriptor(
 	u16 bcdUSB = le16_to_cpu(desc->bcdUSB);
 	u16 bcdDevice = le16_to_cpu(desc->bcdDevice);
 
-	if (start > end)
-		return start;
-	start += sprintf(start, format_device1,
-			  bcdUSB >> 8, bcdUSB & 0xff,
-			  desc->bDeviceClass,
-			  class_decode(desc->bDeviceClass),
-			  desc->bDeviceSubClass,
-			  desc->bDeviceProtocol,
-			  desc->bMaxPacketSize0,
-			  desc->bNumConfigurations);
-	if (start > end)
-		return start;
-	start += sprintf(start, format_device2,
-			 le16_to_cpu(desc->idVendor),
-			 le16_to_cpu(desc->idProduct),
-			 bcdDevice >> 8, bcdDevice & 0xff);
+	start += scnprintf(start, end - start, format_device1,
+			   bcdUSB >> 8, bcdUSB & 0xff,
+			   desc->bDeviceClass,
+			   class_decode(desc->bDeviceClass),
+			   desc->bDeviceSubClass,
+			   desc->bDeviceProtocol,
+			   desc->bMaxPacketSize0,
+			   desc->bNumConfigurations);
+	start += scnprintf(start, end - start, format_device2,
+			   le16_to_cpu(desc->idVendor),
+			   le16_to_cpu(desc->idProduct),
+			   bcdDevice >> 8, bcdDevice & 0xff);
 	return start;
 }
 
@@ -345,23 +326,17 @@ static char *usb_dump_device_descriptor(
 static char *usb_dump_device_strings(char *start, char *end,
 				     struct usb_device *dev)
 {
-	if (start > end)
-		return start;
 	if (dev->manufacturer)
-		start += sprintf(start, format_string_manufacturer,
+		start += scnprintf(start, end - start, format_string_manufacturer,
 				 dev->manufacturer);
-	if (start > end)
-		goto out;
 	if (dev->product)
-		start += sprintf(start, format_string_product, dev->product);
-	if (start > end)
-		goto out;
+		start += scnprintf(start, end - start, format_string_product,
+				   dev->product);
 #ifdef ALLOW_SERIAL_NUMBER
 	if (dev->serial)
-		start += sprintf(start, format_string_serialnumber,
-				 dev->serial);
+		start += scnprintf(start, end - start, format_string_serialnumber,
+				   dev->serial);
 #endif
- out:
 	return start;
 }
 
@@ -369,19 +344,11 @@ static char *usb_dump_desc(char *start,
 {
 	int i;
 
-	if (start > end)
-		return start;
-
 	start = usb_dump_device_descriptor(start, end, &dev->descriptor);
 
-	if (start > end)
-		return start;
-
 	start = usb_dump_device_strings(start, end, dev);
 
 	for (i = 0; i < dev->descriptor.bNumConfigurations; i++) {
-		if (start > end)
-			return start;
 		start = usb_dump_config(dev->speed,
 				start, end, dev->config + i,
 				/* active ? */
@@ -479,11 +446,14 @@ static ssize_t usb_device_dump(char __us
 				bus->bandwidth_isoc_reqs);
 
 	}
-	data_end = usb_dump_desc(data_end, pages_start + (2 * PAGE_SIZE) - 256,
-				 usbdev);
+	data_end = usb_dump_desc(data_end, pages_start + 2 * PAGE_SIZE, usbdev);
 
-	if (data_end > (pages_start + (2 * PAGE_SIZE) - 256))
-		data_end += sprintf(data_end, "(truncated)\n");
+	/*
+	 * Iff our buffer is full, roll back a possibly truncated line at
+	 * the end; strrchr() call below can not ever return NULL...
+	 */
+	if (data_end >= pages_start + 2 * PAGE_SIZE - 1)
+		data_end = strrchr(pages_start, '\n') + 1;
 
 	length = data_end - pages_start;
 	/* if we can start copying some data to the user */
