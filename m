Return-Path: <linux-usb+bounces-11823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB2191E717
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2024 20:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08EAC1C21BE8
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2024 18:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF8915F40A;
	Mon,  1 Jul 2024 18:05:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E9B58F9DF
	for <linux-usb@vger.kernel.org>; Mon,  1 Jul 2024 18:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719857147; cv=none; b=s6z1Ej5FTuIJwumoZXwROqvh+I0Hwki0NR1EBdtyxro129IwBv7GBXUDn27Oka/HPOr6dnHgaHvAKh5vwGjktPdf75Wd2tkpIKATlXHXU1tzV9JeVkGotG8/AC3yo3U63QVWhFtk3W1J1k+mQ8fAUxs3eul1kdyS1f73Yp0WvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719857147; c=relaxed/simple;
	bh=QF23pLORqxgoiVCNdaY9QAL0PiZh1UC8yw2kYnFKBdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1+3uB1243ZmJzP34CcqveVnzA1pRMxErbA0VLjGH2IR9pyB+jnNsllgifPTAfoR+bx9xYrgNwgDuvnCnXAikuxfDPYylDwXdRlH3xOnh/+ZWcw5zhumlrhi2xwbP9A4SvEtavEjOi0kVSMPbUbQVJgPVwaoMfp30k/GNdVqChg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 864720 invoked by uid 1000); 1 Jul 2024 14:05:37 -0400
Date: Mon, 1 Jul 2024 14:05:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Darrion Ramos <darrionramos@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
  Andrey Konovalov <andreyknvl@gmail.com>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: Remote wake up in gadget drivers
Message-ID: <21f8608d-8df7-47eb-8400-9a5a2165f57e@rowland.harvard.edu>
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
 <20240628211140.va5ghcr65dl6g323@synopsys.com>
 <4539c3c5-61bf-4b4d-9391-a041a2a08b57@rowland.harvard.edu>
 <CAE=33HWobLgdhx3nWrQGqcsVxPBK5zDxO4pL8YAOaPW1wTs09A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=33HWobLgdhx3nWrQGqcsVxPBK5zDxO4pL8YAOaPW1wTs09A@mail.gmail.com>

On Sun, Jun 30, 2024 at 11:22:12PM -0400, Darrion Ramos wrote:
> (resending in plain text) Hello all, thank you for all your
> information. It has been very helpful. I was able to implement the
> usb_gadget_wakeup() call and set the USB_CONFIG_ATT_WAKEUP bit.
> Setting the bit did create the  /sys/bus/usb/devices/.../power wakeup
> files that I noticed were missing. Unfortunately usb_gadget_wakeup()
> calls gadget->ops functions to send the signal and these need to be
> implemented as well. From my understanding I need to translate the
> __dwc3_gadget_wakeup() function in linux/drivers/usb/dwc3/gadget.c
> into raw_gadget.c.

No, that's not right.  All raw_gadget.c has to do is call 
usb_gadget_wakeup().

The dwc3 gadget driver _does_ define a wakeup member of gadget->ops; it 
points to the dwc3_gadget_wakeup() routine, which definitely is 
implemented.

>  I have not been able to properly look through the
> __dwc3_gadget_wakeup() function yet, Andrey is it feasible to write
> that function in the raw_gadget currently or is there something else I
> am missing where I do not need that ops function in raw_gadget?

You're missing something.  Think of it this way: If raw_gadget was 
running on some device other than a Raspberry Pi, with a UDC controller 
that wasn't DWC3, then it certainly would have no need to do anything 
connected with __dwc3_gadget_wakeup().  The same is true when it _is_ 
running on a Raspberry Pi.

Alan Stern

