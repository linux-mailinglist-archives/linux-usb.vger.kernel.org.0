Return-Path: <linux-usb+bounces-21489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36215A5613B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 07:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 296BC3A6480
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 06:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECF61A01B9;
	Fri,  7 Mar 2025 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4Vj11Xe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDFF1632D9
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741330478; cv=none; b=r8ZR7ZU7cXRa9RJCmQqESfGApp4xmUbwin019ok6d+3IqMldI7u8UpXV83iKL28uoUnGIFY9uoJRLgTsHqIJpvhhPxSTQmSuZC+MY2zwY9Gjf+qz2wYLD/qoY0wdC1Y38ZU+un7/3K74ibLWA1gSQexn6wr8DWJyhqw9CSmcWco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741330478; c=relaxed/simple;
	bh=AKghzo/remdqLzBtmlDM0OwR+8Oom6OzauCQ2+74DW4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=iUaDqDYlotiOMDDixRMkXrCWmDebZ3HHpTuajWupsyE8CewpORJ+YBdRcFmOmW/pQQtMyEQg3mnfN54mP9y7gQgCiIzUu2MU3xcHEUmu5jZSJUahRT9N5cF7clh9By44/FXUfWq92sqi76Dm0wjikd2yEl705z6+LLzz1g3yF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4Vj11Xe; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2400d1c01so228761466b.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 22:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741330475; x=1741935275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6+rTYATyv2XGgl7JWmxpG4EjK1JvnmpFHAe58ZWswM=;
        b=M4Vj11XedzWnNkFDZc8MYH1yH9Dbg3NHEgvfioYZ5krSx4TT2gUmjqJ0ytZCKp/9Br
         DEc4GCeoZXtEJTUl8X/lqFPhZz11XKP5hXnpbOHy3/hKTyS5C8ks5ar3NblvAieuNZyN
         bPIt8uQg4qq2Fj98f1rLv+TFtty3ohhb3appRoSx2yjemfS+/qFqSKh0Hc883eYpiNLK
         hc/nMxVyYeIgq0bRa6NzgSRaOzPSjwRuJCOisL4+HsTv4gS6MKa3XuZtIS45CuDh+zd7
         vR86fl32jVssFkUkh31nlmjU8mIZvmJ+UmMzQTYbl0YZ8JRhkeCLcrGi86zoCril2qB6
         OtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741330475; x=1741935275;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6+rTYATyv2XGgl7JWmxpG4EjK1JvnmpFHAe58ZWswM=;
        b=wrxqKXDJmd9/PtxIQ98NerFUd4Vua5kqFeg7DB4BXNwhj7BZKUNBcPYttVu/qRAlfB
         NrisrUgZIAXsx3QHItYdy/6WONfzaX4iWfh6V36GDg+3TcdLv4K4gVpVlyPHzjrxvEiZ
         8BjvGmcDFXKM3qDz9IymJhtm6rQBku/lbT1qszdEuUY+iu74Sq/+Z0b4Bp+R/xMHQhs8
         48g8NRIUg1CjtI2WygCW8D0ozF21MuC41W8j4aolmEMrHNVsCJaVjo1bbhxO+eoqqui2
         eHY5EbwJqk4Hh4tDKRcRCSLimWVPi2xNT3f4j2tnRINAqqwzRkDtm/HuzK9rm0Kb2ClL
         bIsg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Lh6ykJuYvRKGuGwNgtr1Yz+l0fSoO9WYoGq/4vfruEBFux6cjc4k3YK+08yvKfVsFKcF/OGPJhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm7QkS5siOpr+oTExGzlgwjsIIaVOX0UeyuAyZZkSGjkNv0F0T
	MksLxY+fSoVW9iq3dntdhnk7aFQrV/kvepoiXShLKmNAre5hwARG
X-Gm-Gg: ASbGncuG4vkCx/OQWKjJqQLbx3rxUV98o0DttUjdrT3WKKuSph0oTzU1ca+DN6CwhOx
	A9k+lu398rXwxBbZgJJGYvA/KyfgdfXJV0lKC8c0gUnIvsSdzGblW1vsL4hQlLH2yfSGCXYaH5n
	q7bG8DuvH9eYEnaMI/nb3iQlIxupz3qgkhbUO4zA64p9ljQOz4MwAxtx2CXFtuhNroXz0y0w48q
	vOm+USL240UvUSbTPC/7pn4XCOv4pKTH1W/i3jlLIep3J8HGycFzJo7H65YM4lNz9wpp0NzSS8S
	5Wz7QnBTsM4eStAjoGX/LExyX8Tyzo5OEOEM5q15ParQiunKuZ/RvqrKJutuyQ==
X-Google-Smtp-Source: AGHT+IEvOusod9PWkPOMmDp4oZ/a0r2KsD+57zluntHiTvEhIUuwuhYlUiO5SQLQ4ki5lRYakRzlTA==
X-Received: by 2002:a17:907:7b03:b0:ac2:5b78:9694 with SMTP id a640c23a62f3a-ac25b78bf03mr108813466b.9.1741330474183;
        Thu, 06 Mar 2025 22:54:34 -0800 (PST)
Received: from foxbook (adts246.neoplus.adsl.tpnet.pl. [79.185.230.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394feddbsm220884366b.76.2025.03.06.22.54.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 06 Mar 2025 22:54:33 -0800 (PST)
Date: Fri, 7 Mar 2025 07:54:29 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 12/15] xhci: Prevent early endpoint restart when
 handling STALL errors.
Message-ID: <20250307075429.5f9d1d4e@foxbook>
In-Reply-To: <20250306144954.3507700-13-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Ensure that an endpoint halted due to device STALL is not
> restarted before a Clear_Feature(ENDPOINT_HALT) request is sent to
> the device.
> 
> The host side of the endpoint may otherwise be started early by the
> 'Set TR Deq' command completion handler which is called if dequeue
> is moved past a cancelled or halted TD.
> 
> Prevent this with a new flag set for bulk and interrupt endpoints
> when a Stall Error is received. Clear it in hcd->endpoint_reset()
> which is called after Clear_Feature(ENDPOINT_HALT) is sent.
> 
> Also add a debug message if a class driver queues a new URB after
> the STALL. Note that class driver might not be aware of the STALL
> yet when it submits the URB as URBs are given back in BH.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sorry for coming this late, but I haven't looked closely at some
of those xhci/for-next patches before.

This one is unfortunately incomplete, as follows:

> drivers/usb/host/xhci-ring.c | 7 +++++--
> drivers/usb/host/xhci.c      | 6 ++++++
> drivers/usb/host/xhci.h      | 3 ++-
> 3 files changed, 13 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>index c2e15a27338b..7643ab9ec3b4 100644
>--- a/drivers/usb/host/xhci-ring.c
>+++ b/drivers/usb/host/xhci-ring.c
>@@ -556,8 +556,8 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
> 	 * pointer command pending because the device can choose to start any
> 	 * stream once the endpoint is on the HW schedule.
> 	 */
>-	if ((ep_state & EP_STOP_CMD_PENDING) || (ep_state & SET_DEQ_PENDING) ||
>-	    (ep_state & EP_HALTED) || (ep_state & EP_CLEARING_TT))
>+	if (ep_state & (EP_STOP_CMD_PENDING | SET_DEQ_PENDING | EP_HALTED |
>+			EP_CLEARING_TT | EP_STALLED))
> 		return;

Any flag added to this list needs to be added to xhci_urb_dequeue() too
so it knowns that the endpoint is held in Stopped state and URBs can be
unlinked without trying to stop it again.

There really should be a helper function used both here and there, but
those Stop EP patches were meant for stable and I strived to make them
small and noninvasive. Then I forgot about this cleanup.

NB: I also forgot about a bunch of low-impact halted EP handling bugs,
I will try to rebase and send them out today or over the weekend.

>  	trace_xhci_ring_ep_doorbell(slot_id, DB_VALUE(ep_index, stream_id));
> @@ -2555,6 +2555,9 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
>  
>  		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
>  		return;
> +	case COMP_STALL_ERROR:
> +		ep->ep_state |= EP_STALLED;
> +		break;
>  	default:
>  		/* do nothing */
>  		break;
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 3f2cd546a7a2..0c22b78358b9 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1604,6 +1604,11 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  		goto free_priv;
>  	}
>  
> +	/* Class driver might not be aware ep halted due to async URB giveback */
> +	if (*ep_state & EP_STALLED)
> +		dev_dbg(&urb->dev->dev, "URB %p queued before clearing halt\n",
> +			urb);
> +
>  	switch (usb_endpoint_type(&urb->ep->desc)) {
>  
>  	case USB_ENDPOINT_XFER_CONTROL:
> @@ -3202,6 +3207,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
>  		return;
>  
>  	ep = &vdev->eps[ep_index];
> +	ep->ep_state &= ~EP_STALLED;

... and clearing any of those flags has always been followed by calling
xhci_ring_ep_doorbell() again, to ensure that the endpoint is restarted
if it has URBs on it but restart was held off due to the flag.

xhci_urb_dequeue() relies on this too, because it looked lke sensible
design: if you have reasons not to run the EP, you set a flag. Reasons
are gone, you clear the flag and it's running again.

> 	/* Bail out if toggle is already being cleared by a endpoint reset */
> 	spin_lock_irqsave(&xhci->lock, flags);
>diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>index cd96e0a8c593..4ee14f651d36 100644
>--- a/drivers/usb/host/xhci.h
>+++ b/drivers/usb/host/xhci.h
>@@ -664,7 +664,7 @@ struct xhci_virt_ep {
> 	unsigned int			err_count;
> 	unsigned int			ep_state;
> #define SET_DEQ_PENDING		(1 << 0)
>-#define EP_HALTED		(1 << 1)	/* For stall handling */
>+#define EP_HALTED		(1 << 1)	/* Halted host ep handling */
> #define EP_STOP_CMD_PENDING	(1 << 2)	/* For URB cancellation */
> /* Transitioning the endpoint to using streams, don't enqueue URBs */
> #define EP_GETTING_STREAMS	(1 << 3)
>@@ -675,6 +675,7 @@ struct xhci_virt_ep {
> #define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
> /* usb_hub_clear_tt_buffer is in progress */
> #define EP_CLEARING_TT		(1 << 8)
>+#define EP_STALLED		(1 << 9)	/* For stall handling */

I guess usage rules of those flags should be documented somewhere here
and helpers added such as:

xhci_ep_cancel_pending()
xhci_ep_held_stopped()

to improve maintainability and prevent similar problems in the future.


I could sit and write something, I still have this stuff quite fresh
in memory after spending a few weeks debugging those crazy HW races.

Regards,
Michal

