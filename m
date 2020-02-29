Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5FF1747D5
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 17:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgB2QCg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 11:02:36 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59143 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727122AbgB2QCf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 11:02:35 -0500
Received: (qmail 16922 invoked by uid 500); 29 Feb 2020 11:02:34 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Feb 2020 11:02:34 -0500
Date:   Sat, 29 Feb 2020 11:02:34 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
cc:     Lee Jones <lee.jones@linaro.org>, <broonie@kernel.org>,
        <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC 2/9] mfd: Add driver for Multifunction USB Device
In-Reply-To: <58bf66ef-d772-83cf-a13c-2a1135e12560@tronnes.org>
Message-ID: <Pine.LNX.4.44L0.2002291053240.16560-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 29 Feb 2020, Noralf Trønnes wrote:

> >> +static void mud_irq_urb_completion(struct urb *urb)
> >> +{
> >> +	struct device *dev = &urb->dev->dev;
> >> +	int ret;
> >> +
> >> +	mdebug("%s: actual_length=%u\n", __func__, urb->actual_length);
> >> +
> >> +	switch (urb->status) {
> >> +	case 0:
> >> +		mud_irq_queue(urb);
> >> +		break;
> >> +	case -EPROTO:	/* FIXME: verify: dwc2 reports this on disconnect */
> > 
> > What does this mean?  Why can't you fix it now?
> 
> I don't know if this is a dwc2 driver problem or if EPROTO is a valid
> disconnect error. I haven't seen it in other gadget drivers, so I need

Note: This is not a gadget driver.  You should be looking in device 
drivers.

> to look more into this or even better if someone from USB can answer this.

See Documentation/driver-api/usb/error-codes.rst.  In short, -EPROTO is
one of several status codes you may get when an URB fails because the
device was disconnected.

> >> +	case -ECONNRESET:
> >> +	case -ENOENT:
> >> +	case -ESHUTDOWN:
> >> +		dev_dbg(dev, "irq urb shutting down with status: %d\n", urb->status);
> > 
> > s/irq/IRQ/ in all comments and prints.
> > 
> > Same with URB?
> > 
> >> +		return;
> >> +	default:
> >> +		dev_dbg(dev, "irq urb failure with status: %d\n", urb->status);
> >> +		break;
> > 
> > So it's failed, but you're going to attempt to submit it anyway?
> 
> Yes, I don't know the reason why it failed, it might succeed the next
> time. But this is also something that someone with real life experience
> with USB failures could weigh in on. Maybe I should send a reset request
> so the device can reset its state machine, I don't know.

USB connections are usually pretty reliable.  Sometimes there are
transient errors, but they are relatively rare.  No one would criticize
a driver for giving up the first time it gets an error (especially if
there was an easy way to reset it) -- but people will get annoyed if a
ton of error messages shows up on the console whenever they unplug the
device.

In general, the overall design of the driver seems to be reasonable.  
I can't judge the interfaces with other subsystems or the other aspects
of their design, but the USB part is okay.  (I haven't gone through it
in detail.)

Alan Stern

