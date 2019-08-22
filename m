Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A715298ACA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 07:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbfHVFOy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 01:14:54 -0400
Received: from gate.crashing.org ([63.228.1.57]:55349 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbfHVFOy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 01:14:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7M5EeLF023357;
        Thu, 22 Aug 2019 00:14:41 -0500
Message-ID: <4c8a9941fb54dffd823335c9f4bc01f3158fb1d5.camel@kernel.crashing.org>
Subject: Re: f_mass_storage vs drivers/target
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Thu, 22 Aug 2019 15:14:39 +1000
In-Reply-To: <cc5030dcc06868fe93af4899be004c5a802d783b.camel@kernel.crashing.org>
References: <Pine.LNX.4.44L0.1908211024380.1816-100000@iolanthe.rowland.org>
         <9c7090713374e80b6c26a9dabb753c5b35b9c93d.camel@kernel.crashing.org>
         <cc5030dcc06868fe93af4899be004c5a802d783b.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-08-22 at 14:58 +1000, Benjamin Herrenschmidt wrote:
> 
> Ah lovely ... the 338x fails in EP autoconf with f_tcm, digging...
> 
> While digging I found this gem:
> 
> 	/* USB3380: use same address for usb and hardware endpoints */
> 	snprintf(name, sizeof(name), "ep%d%s", usb_endpoint_num(desc),
> 			usb_endpoint_dir_in(desc) ? "in" : "out");
> 	ep = gadget_find_ep_by_name(_gadget, name);
> 	if (ep && usb_gadget_ep_match_desc(_gadget, ep, desc, ep_comp))
> 		return ep;
> 
> Any idea what's that supposed to achieve ?
> 
> When ep_match is called, usb_endpoint_num() hasn't been set yet so
> it's always 0 and always fails... or am I missing something ?

Two problems:

 - net2280.c doesn't set a max EP size, so autoconfig fails since
f_tcm specifies one. What about this ?

--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -940,12 +940,14 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
        if (usb_endpoint_dir_out(desc) && !ep->caps.dir_out)
                return 0;
 
-       if (max > ep->maxpacket_limit)
+       if (ep->maxpacket_limit && max > ep->maxpacket_limit)
                return 0;

(ie assume that ep->maxpacket_limit 0 means the UDC supports any
legal size)

 - No UDC driver other than dummy sets max_streams, and f_tcm requires 4,
so f_tcm will fail with *any* superspeed UDC driver as far as I can tell.

Was it ever tested with USB 3 ?

I'm not sure what the right fix here yet is as I yet have to learn about
what those USB3 streams are :-) For now I've commented things out.

It's still not working yet as configuring f_tcm seems to be a black art
with no useful documentation or examples anywhere (the device shows up on
the host but doesn't bind to any mass storage driver ... yet).

Cheers,
Ben.


