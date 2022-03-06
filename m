Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21FE64CE9F6
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 08:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbiCFH7A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 02:59:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbiCFH64 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 02:58:56 -0500
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCF92FFEB
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 23:58:03 -0800 (PST)
Received: from localhost.localdomain ([106.133.32.90])
        by smtp.orange.fr with ESMTPA
        id Qljkni9jQu3WEQlm9nB80G; Sun, 06 Mar 2022 08:58:01 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: MDU0YmViZGZmMDIzYiBlMiM2NTczNTRjNWZkZTMwOGRiOGQ4ODf3NWI1ZTMyMzdiODlhOQ==
X-ME-Date: Sun, 06 Mar 2022 08:58:01 +0100
X-ME-IP: 106.133.32.90
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Duncan Sands <duncan.sands@free.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Olav Kongas <ok@artecdesign.ee>,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 08/10] usb: remove third argument of usb_maxpacket()
Date:   Sun,  6 Mar 2022 16:55:22 +0900
Message-Id: <20220306075524.706660-9-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The third argument of usb_maxpacket(): in_out has been deprecated
because it could be derived from the second argument (e.g. using
usb_pipeout(pipe)).

N.B. function usb_maxpacket() was made variadic to accommodate the
transition from the old prototype with three arguments to the new one
with only two arguments (so that no renaming is needed). The variadic
argument is to be removed once all users of usb_maxpacket() get
migrated.

CC: Duncan Sands <duncan.sands@free.fr>
CC: Alan Stern <stern@rowland.harvard.edu>
CC: Olav Kongas <ok@artecdesign.ee>
CC: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/usb/atm/usbatm.c          |  2 +-
 drivers/usb/c67x00/c67x00-sched.c |  4 ++--
 drivers/usb/core/hub.c            |  2 +-
 drivers/usb/host/ehci-q.c         |  4 ++--
 drivers/usb/host/fhci-hcd.c       |  3 +--
 drivers/usb/host/fotg210-hcd.c    |  2 +-
 drivers/usb/host/isp116x-hcd.c    |  5 ++---
 drivers/usb/host/isp1362-hcd.c    |  6 +++---
 drivers/usb/host/max3421-hcd.c    |  6 +++---
 drivers/usb/host/ohci-hcd.c       |  3 +--
 drivers/usb/host/oxu210hp-hcd.c   |  4 ++--
 drivers/usb/host/r8a66597-hcd.c   |  3 +--
 drivers/usb/host/sl811-hcd.c      |  6 +++---
 drivers/usb/isp1760/isp1760-hcd.c |  6 ++----
 drivers/usb/misc/ftdi-elan.c      | 15 +++++----------
 drivers/usb/misc/lvstest.c        |  2 +-
 drivers/usb/storage/onetouch.c    |  2 +-
 drivers/usb/storage/transport.c   |  2 +-
 18 files changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index e3a49d837609..362217189ef3 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -1091,7 +1091,7 @@ int usbatm_usb_probe(struct usb_interface *intf, const struct usb_device_id *id,
 			snd_buf_bytes - (snd_buf_bytes % instance->tx_channel.stride));
 
 	/* rx buffer size must be a positive multiple of the endpoint maxpacket */
-	maxpacket = usb_maxpacket(usb_dev, instance->rx_channel.endpoint, 0);
+	maxpacket = usb_maxpacket(usb_dev, instance->rx_channel.endpoint);
 
 	if ((maxpacket < 1) || (maxpacket > UDSL_MAX_BUF_SIZE)) {
 		dev_err(dev, "%s: invalid endpoint %02x!\n", __func__,
diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
index c7d3e907be81..a09fa68a6ce7 100644
--- a/drivers/usb/c67x00/c67x00-sched.c
+++ b/drivers/usb/c67x00/c67x00-sched.c
@@ -655,7 +655,7 @@ static int c67x00_add_data_urb(struct c67x00_hcd *c67x00, struct urb *urb)
 			       usb_pipeout(urb->pipe));
 	remaining = urb->transfer_buffer_length - urb->actual_length;
 
-	maxps = usb_maxpacket(urb->dev, urb->pipe, usb_pipeout(urb->pipe));
+	maxps = usb_maxpacket(urb->dev, urb->pipe);
 
 	need_empty = (urb->transfer_flags & URB_ZERO_PACKET) &&
 	    usb_pipeout(urb->pipe) && !(remaining % maxps);
@@ -866,7 +866,7 @@ static inline int c67x00_end_of_data(struct c67x00_td *td)
 	if (unlikely(!act_bytes))
 		return 1;	/* This was an empty packet */
 
-	maxps = usb_maxpacket(td_udev(td), td->pipe, usb_pipeout(td->pipe));
+	maxps = usb_maxpacket(td_udev(td), td->pipe);
 
 	if (unlikely(act_bytes < maxps))
 		return 1;	/* Smaller then full packet */
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1460857026e0..7781b2d31473 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1635,7 +1635,7 @@ static int hub_configure(struct usb_hub *hub,
 	 * maxpktsize is defined in hcd.c's fake endpoint descriptors
 	 * to be big enough for at least USB_MAXCHILDREN ports. */
 	pipe = usb_rcvintpipe(hdev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(hdev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(hdev, pipe);
 
 	if (maxp > sizeof(*hub->buffer))
 		maxp = sizeof(*hub->buffer);
diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index a2a5c2996350..1163af6fad77 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -645,7 +645,7 @@ qh_urb_transaction (
 		token |= (1 /* "in" */ << 8);
 	/* else it's already initted to "out" pid (0 << 8) */
 
-	maxpacket = usb_maxpacket(urb->dev, urb->pipe, !is_input);
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
@@ -1218,7 +1218,7 @@ static int ehci_submit_single_step_set_feature(
 
 	token |= (1 /* "in" */ << 8);  /*This is IN stage*/
 
-	maxpacket = usb_maxpacket(urb->dev, urb->pipe, 0);
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	qtd_fill(ehci, qtd, buf, len, token, maxpacket);
 
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index a8e1048278d0..2ba09c3fbc2f 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -408,8 +408,7 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 			size++;
 		else if ((urb->transfer_flags & URB_ZERO_PACKET) != 0
 			 && (urb->transfer_buffer_length
-			     % usb_maxpacket(urb->dev, pipe,
-					     usb_pipeout(pipe))) != 0)
+			     % usb_maxpacket(urb->dev, pipe)) != 0)
 			size++;
 		break;
 	case PIPE_ISOCHRONOUS:
diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index c3fd375b4778..f8c111e08a0d 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -2596,7 +2596,7 @@ static struct list_head *qh_urb_transaction(struct fotg210_hcd *fotg210,
 		token |= (1 /* "in" */ << 8);
 	/* else it's already initted to "out" pid (0 << 8) */
 
-	maxpacket = usb_maxpacket(urb->dev, urb->pipe, !is_input);
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 8835f6bd528e..70ce03d01435 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -726,7 +726,7 @@ static int isp116x_urb_enqueue(struct usb_hcd *hcd,
 		INIT_LIST_HEAD(&ep->schedule);
 		ep->udev = udev;
 		ep->epnum = epnum;
-		ep->maxpacket = usb_maxpacket(udev, urb->pipe, is_out);
+		ep->maxpacket = usb_maxpacket(udev, urb->pipe);
 		usb_settoggle(udev, epnum, is_out, 0);
 
 		if (type == PIPE_CONTROL) {
@@ -757,8 +757,7 @@ static int isp116x_urb_enqueue(struct usb_hcd *hcd,
 			ep->load = usb_calc_bus_time(udev->speed,
 						     !is_out,
 						     (type == PIPE_ISOCHRONOUS),
-						     usb_maxpacket(udev, pipe,
-								   is_out)) /
+						     usb_maxpacket(udev, pipe)) /
 			    1000;
 		}
 		hep->hcpriv = ep;
diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index d8610ce8f2ec..0e14d1d07709 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -1279,7 +1279,7 @@ static int isp1362_urb_enqueue(struct usb_hcd *hcd,
 		ep->udev = usb_get_dev(udev);
 		ep->hep = hep;
 		ep->epnum = epnum;
-		ep->maxpacket = usb_maxpacket(udev, urb->pipe, is_out);
+		ep->maxpacket = usb_maxpacket(udev, urb->pipe);
 		ep->ptd_offset = -EINVAL;
 		ep->ptd_index = -EINVAL;
 		usb_settoggle(udev, epnum, is_out, 0);
@@ -1299,8 +1299,8 @@ static int isp1362_urb_enqueue(struct usb_hcd *hcd,
 			ep->interval = urb->interval;
 			ep->branch = PERIODIC_SIZE;
 			ep->load = usb_calc_bus_time(udev->speed, !is_out,
-						     (type == PIPE_ISOCHRONOUS),
-						     usb_maxpacket(udev, pipe, is_out)) / 1000;
+						     type == PIPE_ISOCHRONOUS,
+						     usb_maxpacket(udev, pipe)) / 1000;
 			break;
 		}
 		hep->hcpriv = ep;
diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 30de85a707fe..3a48f544dcdf 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -546,7 +546,7 @@ max3421_transfer_out(struct usb_hcd *hcd, struct urb *urb, int fast_retransmit)
 		return MAX3421_HXFR_BULK_OUT(epnum);
 	}
 
-	max_packet = usb_maxpacket(urb->dev, urb->pipe, 1);
+	max_packet = usb_maxpacket(urb->dev, urb->pipe);
 
 	if (max_packet > MAX3421_FIFO_SIZE) {
 		/*
@@ -952,7 +952,7 @@ max3421_transfer_in_done(struct usb_hcd *hcd, struct urb *urb)
 	 * USB 2.0 Section 5.3.2 Pipes: packets must be full size
 	 * except for last one.
 	 */
-	max_packet = usb_maxpacket(urb->dev, urb->pipe, 0);
+	max_packet = usb_maxpacket(urb->dev, urb->pipe);
 	if (max_packet > MAX3421_FIFO_SIZE) {
 		/*
 		 * We do not support isochronous transfers at this
@@ -998,7 +998,7 @@ max3421_transfer_out_done(struct usb_hcd *hcd, struct urb *urb)
 		 * max_packet as an indicator that the end of the
 		 * packet has been reached).
 		 */
-		u32 max_packet = usb_maxpacket(urb->dev, urb->pipe, 1);
+		u32 max_packet = usb_maxpacket(urb->dev, urb->pipe);
 
 		if (max3421_hcd->curr_len == max_packet)
 			return 0;
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 666b1c665188..c4c821c2288c 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -181,8 +181,7 @@ static int ohci_urb_enqueue (
 				size++;
 			else if ((urb->transfer_flags & URB_ZERO_PACKET) != 0
 				&& (urb->transfer_buffer_length
-					% usb_maxpacket (urb->dev, pipe,
-						usb_pipeout (pipe))) == 0)
+					% usb_maxpacket(urb->dev, pipe)) == 0)
 				size++;
 			break;
 		case PIPE_ISOCHRONOUS: /* number of packets from URB */
diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index b741670525e3..aaedf55d3c62 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -1685,7 +1685,7 @@ static struct list_head *qh_urb_transaction(struct oxu_hcd *oxu,
 		token |= (1 /* "in" */ << 8);
 	/* else it's already initted to "out" pid (0 << 8) */
 
-	maxpacket = usb_maxpacket(urb->dev, urb->pipe, !is_input);
+	maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
@@ -1796,7 +1796,7 @@ static struct ehci_qh *qh_make(struct oxu_hcd *oxu,
 
 	is_input = usb_pipein(urb->pipe);
 	type = usb_pipetype(urb->pipe);
-	maxp = usb_maxpacket(urb->dev, urb->pipe, !is_input);
+	maxp = usb_maxpacket(urb->dev, urb->pipe);
 
 	/* Compute interrupt scheduling parameters just once, and save.
 	 * - allowing for high bandwidth, how many nsec/uframe are used?
diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 63719cdf6a4e..abb88dd40d4e 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -1867,8 +1867,7 @@ static struct r8a66597_td *r8a66597_make_td(struct r8a66597 *r8a66597,
 	td->pipe = hep->hcpriv;
 	td->urb = urb;
 	td->address = get_urb_to_r8a66597_addr(r8a66597, urb);
-	td->maxpacket = usb_maxpacket(urb->dev, urb->pipe,
-				      !usb_pipein(urb->pipe));
+	td->maxpacket = usb_maxpacket(urb->dev, urb->pipe);
 	if (usb_pipecontrol(urb->pipe))
 		td->type = USB_PID_SETUP;
 	else if (usb_pipein(urb->pipe))
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 85623731a516..d206bd95c7bb 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -842,7 +842,7 @@ static int sl811h_urb_enqueue(
 		INIT_LIST_HEAD(&ep->schedule);
 		ep->udev = udev;
 		ep->epnum = epnum;
-		ep->maxpacket = usb_maxpacket(udev, urb->pipe, is_out);
+		ep->maxpacket = usb_maxpacket(udev, urb->pipe);
 		ep->defctrl = SL11H_HCTLMASK_ARM | SL11H_HCTLMASK_ENABLE;
 		usb_settoggle(udev, epnum, is_out, 0);
 
@@ -878,8 +878,8 @@ static int sl811h_urb_enqueue(
 			if (type == PIPE_ISOCHRONOUS)
 				ep->defctrl |= SL11H_HCTLMASK_ISOCH;
 			ep->load = usb_calc_bus_time(udev->speed, !is_out,
-				(type == PIPE_ISOCHRONOUS),
-				usb_maxpacket(udev, pipe, is_out))
+						     type == PIPE_ISOCHRONOUS,
+						     usb_maxpacket(udev, pipe))
 					/ 1000;
 			break;
 		}
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 893becb077d3..76862ba40f35 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -825,8 +825,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
 	memset(ptd, 0, sizeof(*ptd));
 
 	/* according to 3.6.2, max packet len can not be > 0x400 */
-	maxpacket = usb_maxpacket(qtd->urb->dev, qtd->urb->pipe,
-						usb_pipeout(qtd->urb->pipe));
+	maxpacket = usb_maxpacket(qtd->urb->dev, qtd->urb->pipe);
 	multi =  1 + ((maxpacket >> 11) & 0x3);
 	maxpacket &= 0x7ff;
 
@@ -1808,8 +1807,7 @@ static void packetize_urb(struct usb_hcd *hcd,
 			packet_type = IN_PID;
 	}
 
-	maxpacketsize = usb_maxpacket(urb->dev, urb->pipe,
-				      usb_pipeout(urb->pipe));
+	maxpacketsize = usb_maxpacket(urb->dev, urb->pipe);
 
 	/*
 	 * buffer gets wrapped in one or more qtds;
diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index 6c38c62d29b2..b2f980409d0b 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -1449,8 +1449,7 @@ wait:if (ftdi->disconnected > 0) {
 			command->length = 0x8007;
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 8;
 			command->value = 0;
 			command->buffer = urb->setup_packet;
@@ -1514,8 +1513,7 @@ wait:if (ftdi->disconnected > 0) {
 							    1);
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 0;
 			command->value = 0;
 			command->buffer = NULL;
@@ -1571,8 +1569,7 @@ wait:if (ftdi->disconnected > 0) {
 			command->length = 0x0000;
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 0;
 			command->value = 0;
 			command->buffer = NULL;
@@ -1634,8 +1631,7 @@ wait:if (ftdi->disconnected > 0) {
 			command->header = 0x81 | (ed << 5);
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = min_t(u32, 1024,
 						 urb->transfer_buffer_length -
 						 urb->actual_length);
@@ -1715,8 +1711,7 @@ wait:if (ftdi->disconnected > 0) {
 							    1);
 			command->address = (toggle_bits << 6) | (ep_number << 2)
 				| (address << 0);
-			command->width = usb_maxpacket(urb->dev, urb->pipe,
-						       usb_pipeout(urb->pipe));
+			command->width = usb_maxpacket(urb->dev, urb->pipe);
 			command->follows = 0;
 			command->value = 0;
 			command->buffer = NULL;
diff --git a/drivers/usb/misc/lvstest.c b/drivers/usb/misc/lvstest.c
index f8686139d6f3..25ec5666a75e 100644
--- a/drivers/usb/misc/lvstest.c
+++ b/drivers/usb/misc/lvstest.c
@@ -437,7 +437,7 @@ static int lvs_rh_probe(struct usb_interface *intf,
 	INIT_WORK(&lvs->rh_work, lvs_rh_work);
 
 	pipe = usb_rcvintpipe(hdev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(hdev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(hdev, pipe);
 	usb_fill_int_urb(lvs->urb, hdev, pipe, &lvs->buffer[0], maxp,
 			lvs_rh_irq, lvs, endpoint->bInterval);
 
diff --git a/drivers/usb/storage/onetouch.c b/drivers/usb/storage/onetouch.c
index a989fe930e21..1db2eefeea22 100644
--- a/drivers/usb/storage/onetouch.c
+++ b/drivers/usb/storage/onetouch.c
@@ -180,7 +180,7 @@ static int onetouch_connect_input(struct us_data *ss)
 		return -ENODEV;
 
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
-	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(udev, pipe);
 	maxp = min(maxp, ONETOUCH_PKT_LEN);
 
 	onetouch = kzalloc(sizeof(struct usb_onetouch), GFP_KERNEL);
diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 1928b3918242..64d96d210e02 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -363,7 +363,7 @@ static int usb_stor_intr_transfer(struct us_data *us, void *buf,
 	usb_stor_dbg(us, "xfer %u bytes\n", length);
 
 	/* calculate the max packet size */
-	maxp = usb_maxpacket(us->pusb_dev, pipe, usb_pipeout(pipe));
+	maxp = usb_maxpacket(us->pusb_dev, pipe);
 	if (maxp > length)
 		maxp = length;
 
-- 
2.34.1

