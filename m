Return-Path: <linux-usb+bounces-11372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD690B69B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 18:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E797B37C7F
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 15:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B5D13AA37;
	Mon, 17 Jun 2024 15:02:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CD6E813AA2A
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636559; cv=none; b=WM0Vm8s30iLXDK/zSlQZJxYL6skY3WZEwEMSGdiTOlJIWQVW3B5xE2Vfqh5Ydr9H+enm17N905VqltMbexA66nUoiSBRWj1IlqslTnfrz31xw5IRcBIiCNXUAv0ze2FK+6NNp3PHwOmN7Y6E/AKgCi17v8T12UDZ+kh0sVnTwFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636559; c=relaxed/simple;
	bh=Ro9fb2wcUc1hJnJZ7EzdIaHRfvi69H+iMMCNglY/YJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM1DfdTzly3XGfTwAt2nGqiY4E9xSZICczyYK0iP8vbGj/Zq9fQZGVaj60elsIfzFLGrdfG6BbVLrsaRVBiPdlksIrfxy7U/FIz/cPmpFj37Vi3gegU0rDGn9/rQSHUsn7jo+gq4pJXf+Vh1BUIDXl2NhABeBEFzUSwQse0nciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 395005 invoked by uid 1000); 17 Jun 2024 11:02:30 -0400
Date: Mon, 17 Jun 2024 11:02:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <greg@kroah.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
  USB list <linux-usb@vger.kernel.org>,
  Paul Elder <paul.elder@ideasonboard.com>
Subject: Partial isochronous support for dummy-hcd [was: Re: Stalling
 non-0-length OUT control requests in Raw Gadget/GadgetFS]
Message-ID: <82b983a3-7ed5-4800-8a3d-1615c381d115@rowland.harvard.edu>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
 <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
 <CA+fCnZetfWWhO+Fufg_Q=MOFtyN+g6nBrLJ29HGrGc0znsQTGQ@mail.gmail.com>
 <762b8751-16d5-4ce5-8504-efcb6440585c@rowland.harvard.edu>
 <2024061736-bagginess-raffle-7e1e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024061736-bagginess-raffle-7e1e@gregkh>

On Mon, Jun 17, 2024 at 08:29:12AM +0200, Greg KH wrote:
> On Sun, Jun 16, 2024 at 10:10:33PM -0400, Alan Stern wrote:
> > However, it's another thing I have lost track of.  It may have been 
> > posted to linux-usb at one point, but that would have been quite some 
> > time ago.  Probably before well lore.kernel.org existed.  (I vaguely 
> > remember working on it before moving to my current home, which means 
> > in 2008 or earlier.)
> 
> I think lore is populated with all of the linux-usb mailing list
> archives, but we might have missed from before when there was -user and
> -devel versions of the list.
> 
> If needed, I can try to dig up my older archives from cold storage and
> get Konstantin to import them.

No need -- I found a copy of it on an old backup drive.  It probably got 
left behind when I switched my system over from using 32-bit userspace 
to 64 bits.

For the record, the patch is appended below.  The file on the backup 
drive was dated May 2006 (before the 2.6.17 kernel was released!); the 
original work may have been even earlier.

Alan Stern



Index: usb/drivers/usb/gadget/dummy_hcd.c
===================================================================
--- usb.orig/drivers/usb/gadget/dummy_hcd.c
+++ usb/drivers/usb/gadget/dummy_hcd.c
@@ -84,6 +84,9 @@ struct dummy_ep {
 	struct usb_gadget		*gadget;
 	const struct usb_endpoint_descriptor *desc;
 	struct usb_ep			ep;
+	int				iso_desc_num;
+	int				iso_status;
+	int				interval_left;
 	unsigned			halted : 1;
 	unsigned			already_seen : 1;
 	unsigned			setup_stage : 1;
@@ -808,6 +811,7 @@ usb_gadget_register_driver (struct usb_g
 
 	dum->gadget.ep0 = &dum->ep [0].ep;
 	dum->ep [0].ep.maxpacket = 64;
+	dum->ep [0].setup_stage = 1;
 	list_del_init (&dum->ep [0].ep.ep_list);
 	INIT_LIST_HEAD(&dum->fifo_req.queue);
 
@@ -1017,8 +1021,7 @@ static int dummy_urb_enqueue (
 
 	list_add_tail (&urbp->urbp_list, &dum->urbp_list);
 	urb->hcpriv = urbp;
-	if (usb_pipetype (urb->pipe) == PIPE_CONTROL)
-		urb->error_count = 1;		/* mark as a new urb */
+	urb->error_count = 0;
 
 	/* kick the scheduler, it'll do the rest */
 	if (!timer_pending (&dum->timer))
@@ -1056,13 +1059,44 @@ static int
 transfer (struct dummy *dum, struct urb *urb, struct dummy_ep *ep, int limit)
 {
 	struct dummy_request	*req;
+	struct usb_iso_packet_descriptor *iso;
+	int			to_host;
+
+	to_host = usb_pipein (urb->pipe);
+	iso = NULL;
+	if (usb_pipetype (urb->pipe) == PIPE_ISOCHRONOUS)
+		iso = &urb->iso_frame_desc [ep->iso_desc_num];
 
 top:
+	/* isochronous transfers go through even without a responder */
+	if (iso && list_empty (&ep->queue)) {
+		int		limit2 = limit;
+		int		maxlen = ep->ep.maxpacket;
+
+		while (maxlen <= limit2) {
+			limit2 -= maxlen;
+			if (to_host)
+				ep->iso_status = iso->status = -EPROTO;
+			else {
+				iso->status = 0;
+				iso->actual_length = iso->length;
+				urb->actual_length += iso->length;
+			}
+			++iso;
+			if (++ep->iso_desc_num >= urb->number_of_packets) {
+				maybe_set_status (urb, ep->iso_status);
+				break;
+			}
+		}
+		return limit;
+	}
+
 	/* if there's no request queued, the device is NAKing; return */
 	list_for_each_entry (req, &ep->queue, queue) {
 		unsigned	host_len, dev_len, len;
-		int		is_short, to_host;
+		int		is_short;
 		int		rescan = 0;
+		int		ustatus;
 
 		/* 1..N packets of ep->ep.maxpacket each ... the last one
 		 * may be short (including zero length).
@@ -1071,24 +1105,22 @@ top:
 		 * (length mod maxpacket zero, and 'zero' flag); they always
 		 * terminate reads.
 		 */
-		host_len = urb->transfer_buffer_length - urb->actual_length;
+		host_len = (iso ? iso->length : urb->transfer_buffer_length -
+				urb->actual_length);
 		dev_len = req->req.length - req->req.actual;
 		len = min (host_len, dev_len);
 
 		/* FIXME update emulated data toggle too */
 
-		to_host = usb_pipein (urb->pipe);
 		if (unlikely (len == 0))
 			is_short = 1;
 		else {
 			char		*ubuf, *rbuf;
 
 			/* not enough bandwidth left? */
-			if (limit < ep->ep.maxpacket && limit < len)
+			if (limit < ep->ep.maxpacket && limit < host_len)
 				break;
 			len = min (len, (unsigned) limit);
-			if (len == 0)
-				break;
 
 			/* use an extra pass for the final short packet */
 			if (len > ep->ep.maxpacket) {
@@ -1098,15 +1130,15 @@ top:
 			is_short = (len % ep->ep.maxpacket) != 0;
 
 			/* else transfer packet(s) */
-			ubuf = urb->transfer_buffer + urb->actual_length;
+			ubuf = urb->transfer_buffer + (iso ?
+					iso->offset : urb->actual_length);
 			rbuf = req->req.buf + req->req.actual;
 			if (to_host)
 				memcpy (ubuf, rbuf, len);
 			else
 				memcpy (rbuf, ubuf, len);
-			ep->last_io = jiffies;
 
-			limit -= len;
+			limit -= (iso ? ep->ep.maxpacket : len);
 			urb->actual_length += len;
 			req->req.actual += len;
 		}
@@ -1119,21 +1151,18 @@ top:
 		 * need to emulate such data-in-flight.  so we only show part
 		 * of the URB_SHORT_NOT_OK effect: completion status.
 		 */
+		ustatus = 0;
 		if (is_short) {
 			if (host_len == dev_len) {
 				req->req.status = 0;
-				maybe_set_status (urb, 0);
 			} else if (to_host) {
 				req->req.status = 0;
 				if (dev_len > host_len)
-					maybe_set_status (urb, -EOVERFLOW);
-				else
-					maybe_set_status (urb,
-						(urb->transfer_flags
-							& URB_SHORT_NOT_OK)
-						? -EREMOTEIO : 0);
-			} else if (!to_host) {
-				maybe_set_status (urb, 0);
+					ustatus = -EOVERFLOW;
+				else if (urb->transfer_flags &
+						URB_SHORT_NOT_OK)
+					ustatus = -EREMOTEIO;
+			} else {
 				if (host_len > dev_len)
 					req->req.status = -EOVERFLOW;
 				else
@@ -1147,10 +1176,25 @@ top:
 				req->req.status = 0;
 			if (urb->transfer_buffer_length == urb->actual_length
 					&& !(urb->transfer_flags
-						& URB_ZERO_PACKET)) {
-				maybe_set_status (urb, 0);
+						& URB_ZERO_PACKET))
+				;		/* URB is done */
+			else if (!iso)
+				ustatus = 1;	/* URB continues */
+		}
+
+		if (iso) {
+			iso->actual_length = len;
+			iso->status = ustatus;
+			if (ustatus) {
+				ep->iso_status = ustatus;
+				++urb->error_count;
 			}
+			++iso;
+			if (++ep->iso_desc_num >= urb->number_of_packets)
+				maybe_set_status (urb, ep->iso_status);
 		}
+		else if (ustatus <= 0)
+			maybe_set_status (urb, ustatus);
 
 		/* device side completion --> continuable */
 		if (req->req.status != -EINPROGRESS) {
@@ -1309,10 +1353,6 @@ restart:
 		if (ep->already_seen)
 			continue;
 		ep->already_seen = 1;
-		if (ep == &dum->ep [0] && urb->error_count) {
-			ep->setup_stage = 1;	/* a new urb */
-			urb->error_count = 0;
-		}
 		if (ep->halted && !ep->setup_stage) {
 			/* NOTE: must not be iso! */
 			dev_dbg (dummy_dev(dum), "ep %s halted, urb %p\n",
@@ -1323,7 +1363,7 @@ restart:
 		/* FIXME make sure both ends agree on maxpacket */
 
 		/* handle control requests */
-		if (ep == &dum->ep [0] && ep->setup_stage) {
+		if (ep->setup_stage) {
 			struct usb_ctrlrequest		setup;
 			int				value = 1;
 			struct dummy_ep			*ep2;
@@ -1483,7 +1523,7 @@ restart:
 				if (value >= 0) {
 					/* no delays (max 64KB data stage) */
 					limit = 64*1024;
-					goto treat_control_like_bulk;
+					goto treat_like_bulk;
 				}
 				/* error, see below */
 			}
@@ -1504,25 +1544,24 @@ restart:
 		limit = total;
 		switch (usb_pipetype (urb->pipe)) {
 		case PIPE_ISOCHRONOUS:
-			/* FIXME is it urb->interval since the last xfer?
-			 * use urb->iso_frame_desc[i].
-			 * complete whether or not ep has requests queued.
-			 * report random errors, to debug drivers.
+			/* FIXME: report random errors, to debug drivers.
 			 */
+			if (--ep->interval_left > 0)
+				break;
+			ep->interval_left = urb->interval;
 			limit = max (limit, periodic_bytes (dum, ep));
-			maybe_set_status (urb, -ENOSYS);
-			break;
+			goto treat_like_bulk;
 
 		case PIPE_INTERRUPT:
-			/* FIXME is it urb->interval since the last xfer?
-			 * this almost certainly polls too fast.
-			 */
+			if (--ep->interval_left > 0)
+				break;
+			ep->interval_left = urb->interval;
 			limit = max (limit, periodic_bytes (dum, ep));
 			/* FALLTHROUGH */
 
 		// case PIPE_BULK:  case PIPE_CONTROL:
 		default:
-		treat_control_like_bulk:
+		treat_like_bulk:
 			ep->last_io = jiffies;
 			total = transfer (dum, urb, ep, limit);
 			break;
@@ -1536,8 +1575,13 @@ return_urb:
 		urb->hcpriv = NULL;
 		list_del (&urbp->urbp_list);
 		kfree (urbp);
-		if (ep)
-			ep->already_seen = ep->setup_stage = 0;
+		if (ep) {
+			ep->already_seen = 0;
+			ep->iso_desc_num = 0;
+			ep->iso_status = 0;
+			if (ep == &dum->ep [0])
+				ep->setup_stage = 1;
+		}
 
 		spin_unlock (&dum->lock);
 		usb_hcd_giveback_urb (dummy_to_hcd(dum), urb, NULL);


