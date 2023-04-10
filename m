Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531D96DCBAB
	for <lists+linux-usb@lfdr.de>; Mon, 10 Apr 2023 21:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjDJThM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Apr 2023 15:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjDJThL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Apr 2023 15:37:11 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 13F4D1BD9
        for <linux-usb@vger.kernel.org>; Mon, 10 Apr 2023 12:37:07 -0700 (PDT)
Received: (qmail 147776 invoked by uid 1000); 10 Apr 2023 15:37:07 -0400
Date:   Mon, 10 Apr 2023 15:37:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 1/3] USB: core: Add routines for endpoint checks in old
 drivers
Message-ID: <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
 <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
 <2023040148-aground-cornbread-84e2@gregkh>
 <f764a19d-858e-408c-a5f5-d6fe7306c4cb@rowland.harvard.edu>
 <2023040544-cuddly-glancing-f577@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023040544-cuddly-glancing-f577@gregkh>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Many of the older USB drivers in the Linux USB stack were written
based simply on a vendor's device specification.  They use the
endpoint information in the spec and assume these endpoints will
always be present, with the properties listed, in any device matching
the given vendor and product IDs.

While that may have been true back then, with spoofing and fuzzing it
is not true any more.  More and more we are finding that those old
drivers need to perform at least a minimum of checking before they try
to use any endpoint other than ep0.

To make this checking as simple as possible, we now add a couple of
utility routines to the USB core.  usb_check_bulk_endpoints() and
usb_check_int_endpoints() take an interface pointer together with a
list of endpoint addresses (numbers and directions).  They check that
the interface's current alternate setting includes endpoints with
those addresses and that each of these endpoints has the right type:
bulk or interrupt, respectively.

Although we already have usb_find_common_endpoints() and related
routines meant for a similar purpose, they are not well suited for
this kind of checking.  Those routines find endpoints of various
kinds, but only one (either the first or the last) of each kind, and
they don't verify that the endpoints' addresses agree with what the
caller expects.

In theory the new routines could be more general: They could take a
particular altsetting as their argument instead of always using the
interface's current altsetting.  In practice I think this won't matter
too much; multiple altsettings tend to be used for transferring media
(audio or visual) over isochronous endpoints, not bulk or interrupt.
Drivers for such devices will generally require more sophisticated
checking than these simplistic routines provide.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

This patch and the one for the radio-shark drivers have changed since
Hans reviewed them, so I'm not including his Reviewed-by: tag.


[as1992]


 drivers/usb/core/usb.c |   76 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    |    5 +++
 2 files changed, 81 insertions(+)

Index: usb-devel/drivers/usb/core/usb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/usb.c
+++ usb-devel/drivers/usb/core/usb.c
@@ -207,6 +207,82 @@ int usb_find_common_endpoints_reverse(st
 EXPORT_SYMBOL_GPL(usb_find_common_endpoints_reverse);
 
 /**
+ * usb_find_endpoint() - Given an endpoint address, search for the endpoint's
+ * usb_host_endpoint structure in an interface's current altsetting.
+ * @intf: the interface whose current altsetting should be searched
+ * @ep_addr: the endpoint address (number and direction) to find
+ *
+ * Search the altsetting's list of endpoints for one with the specified address.
+ *
+ * Return: Pointer to the usb_host_endpoint if found, %NULL otherwise.
+ */
+static const struct usb_host_endpoint *usb_find_endpoint(
+		const struct usb_interface *intf, unsigned int ep_addr)
+{
+	int n;
+	const struct usb_host_endpoint *ep;
+
+	n = intf->cur_altsetting->desc.bNumEndpoints;
+	ep = intf->cur_altsetting->endpoint;
+	for (; n > 0; (--n, ++ep)) {
+		if (ep->desc.bEndpointAddress == ep_addr)
+			return ep;
+	}
+	return NULL;
+}
+
+/**
+ * usb_check_bulk_endpoints - Check whether an interface's current altsetting
+ * contains a set of bulk endpoints with the given addresses.
+ * @intf: the interface whose current altsetting should be searched
+ * @ep_addrs: 0-terminated array of the endpoint addresses (number and
+ * direction) to look for
+ *
+ * Search for endpoints with the specified addresses and check their types.
+ *
+ * Return: %true if all the endpoints are found and are bulk, %false otherwise.
+ */
+bool usb_check_bulk_endpoints(
+		const struct usb_interface *intf, const u8 *ep_addrs)
+{
+	const struct usb_host_endpoint *ep;
+
+	for (; *ep_addrs; ++ep_addrs) {
+		ep = usb_find_endpoint(intf, *ep_addrs);
+		if (!ep || !usb_endpoint_xfer_bulk(&ep->desc))
+			return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(usb_check_bulk_endpoints);
+
+/**
+ * usb_check_int_endpoints - Check whether an interface's current altsetting
+ * contains a set of interrupt endpoints with the given addresses.
+ * @intf: the interface whose current altsetting should be searched
+ * @ep_addrs: 0-terminated array of the endpoint addresses (number and
+ * direction) to look for
+ *
+ * Search for endpoints with the specified addresses and check their types.
+ *
+ * Return: %true if all the endpoints are found and are interrupt,
+ * %false otherwise.
+ */
+bool usb_check_int_endpoints(
+		const struct usb_interface *intf, const u8 *ep_addrs)
+{
+	const struct usb_host_endpoint *ep;
+
+	for (; *ep_addrs; ++ep_addrs) {
+		ep = usb_find_endpoint(intf, *ep_addrs);
+		if (!ep || !usb_endpoint_xfer_int(&ep->desc))
+			return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(usb_check_int_endpoints);
+
+/**
  * usb_find_alt_setting() - Given a configuration, find the alternate setting
  * for the given interface.
  * @config: the configuration to search (not necessarily the current config).
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -292,6 +292,11 @@ void usb_put_intf(struct usb_interface *
 #define USB_MAXINTERFACES	32
 #define USB_MAXIADS		(USB_MAXINTERFACES/2)
 
+bool usb_check_bulk_endpoints(
+		const struct usb_interface *intf, const u8 *ep_addrs);
+bool usb_check_int_endpoints(
+		const struct usb_interface *intf, const u8 *ep_addrs);
+
 /*
  * USB Resume Timer: Every Host controller driver should drive the resume
  * signalling on the bus for the amount of time defined by this macro.

