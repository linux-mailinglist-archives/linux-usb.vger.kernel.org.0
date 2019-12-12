Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3332711C388
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfLLCtI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:49:08 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41508 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727884AbfLLCtI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:08 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93A58404D4;
        Thu, 12 Dec 2019 02:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118947; bh=t/deAuAbMnYnljhGvDGBxXW1JNZ/lwC4NZxE3brn1NM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=gplUub9BLipr1LShihOF1dY969/r5ytmxJxg8NlCRrEVnLyBpwznzT97Ts5S4RpXK
         GaATAMalkKC/lSBBEcL9fr7qL1lMSO3duXft9Xt2qjpjScnRIWcImqUpgPv6SeWKoM
         Zmfz5leWmKKQcFlQR8Crk0yCgSQW8SRjz7tYWW0NpibkvU88uiPgabs6QvP9kRqB6F
         ff3WN2gejB1cqR9E3gX/WIV848heDUqE1lsN2UCmoRhNvzV8hBwFulVs0Y76ntRMqa
         4oEQPnl/Kzc6w+/1US1W4fhHMrN6uBJYm/y4OTibCSSJ+jNEjb/G8prurlOcTlsKGR
         NfN3YuJXhfRog==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 26CA6A007B;
        Thu, 12 Dec 2019 02:49:05 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:05 -0800
Date:   Wed, 11 Dec 2019 18:49:05 -0800
Message-Id: <0b9de46d828c4bbd2f1a2e961fcfa6e446bcc60a.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 01/14] usb: gadget: Add lane count and lsm
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB 3.2 specification supports dual-lane and different transfer
rates. The speed field is not sufficient to describe the device's
sublink. Devices operating in SuperSpeed Plus can refer to gen2x1,
gen1x2, or gen2x2.

The driver may be contrained by a specific sublink attribute. Add max
lane count and lane speed mantissa in Gbps in usb_gadget_driver to
provide more contrains for function drivers that support SuperSpeed
Plus.

Update usb_gadget struct to report the max number of lanes
support and connected lane count. Also, add lane speed mantissa in
Gigabits per second to properly describe the device transfer rate.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 include/linux/usb/composite.h |  4 ++++
 include/linux/usb/gadget.h    | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 8675e145ea8b..ed3fb9a53c4a 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -356,6 +356,8 @@ enum {
  *	are predefined. The first entry that may be used is
  *	USB_GADGET_FIRST_AVAIL_IDX
  * @max_speed: Highest speed the driver supports.
+ * @max_lane_count: maximum number of lanes the driver supports (SSP only).
+ * @max_lsm: maximum lane speed mantissa in Gbps the driver supports (SSP only).
  * @needs_serial: set to 1 if the gadget needs userspace to provide
  * 	a serial number.  If one is not provided, warning will be printed.
  * @bind: (REQUIRED) Used to allocate resources that are shared across the
@@ -387,6 +389,8 @@ struct usb_composite_driver {
 	const struct usb_device_descriptor	*dev;
 	struct usb_gadget_strings		**strings;
 	enum usb_device_speed			max_speed;
+	u8					max_lane_count;
+	u8					max_lsm;
 	unsigned		needs_serial:1;
 
 	int			(*bind)(struct usb_composite_dev *cdev);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 124462d65eac..cb7531a6f784 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -335,6 +335,10 @@ struct usb_gadget_ops {
  * @speed: Speed of current connection to USB host.
  * @max_speed: Maximal speed the UDC can handle.  UDC must support this
  *      and all slower speeds.
+ * @lane_count: number of lanes in use.
+ * @max_lane_count: maximum number of lanes the UDC can handle.
+ * @lsm: current connection lane speed mantissa in Gbps
+ * @max_lsm: maximum lane speed mantissa in Gbps
  * @state: the state we are now (attached, suspended, configured, etc)
  * @name: Identifies the controller hardware type.  Used in diagnostics
  *	and sometimes configuration.
@@ -401,6 +405,10 @@ struct usb_gadget {
 	struct list_head		ep_list;	/* of usb_ep */
 	enum usb_device_speed		speed;
 	enum usb_device_speed		max_speed;
+	unsigned			lane_count;
+	unsigned			max_lane_count;
+	unsigned			lsm;
+	unsigned			max_lsm;
 	enum usb_device_state		state;
 	const char			*name;
 	struct device			dev;
@@ -600,6 +608,8 @@ static inline int usb_gadget_activate(struct usb_gadget *gadget)
  * struct usb_gadget_driver - driver for usb 'slave' devices
  * @function: String describing the gadget's function
  * @max_speed: Highest speed the driver handles.
+ * @max_lane_count: maximum lane count the driver handles (SSP only).
+ * @max_lsm: maximum lane speed mantissa in Gbps the driver handles (SSP only).
  * @setup: Invoked for ep0 control requests that aren't handled by
  *	the hardware level driver. Most calls must be handled by
  *	the gadget driver, including descriptor and configuration
@@ -672,6 +682,8 @@ static inline int usb_gadget_activate(struct usb_gadget *gadget)
 struct usb_gadget_driver {
 	char			*function;
 	enum usb_device_speed	max_speed;
+	u8			max_lane_count;
+	u8			max_lsm;
 	int			(*bind)(struct usb_gadget *gadget,
 					struct usb_gadget_driver *driver);
 	void			(*unbind)(struct usb_gadget *);
-- 
2.11.0

