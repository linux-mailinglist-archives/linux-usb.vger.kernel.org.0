Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1055FD166C
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 19:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732383AbfJIR34 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 13:29:56 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51574 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732459AbfJIR3u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 13:29:50 -0400
Received: (qmail 5516 invoked by uid 2102); 9 Oct 2019 13:29:49 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Oct 2019 13:29:49 -0400
Date:   Wed, 9 Oct 2019 13:29:49 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 3/5] USB: Implement usb_device_match_id()
In-Reply-To: <2bbaeba7abb332aaf9fb521602f7199ba1e77273.camel@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1910091328120.1603-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 9 Oct 2019, Bastien Nocera wrote:

> > This would be better if you allowed matching against just the
> > idVendor 
> > field rather than matching against both.  That would make it a lot 
> > simpler to match all Apple devices, for instance.
> 
> That should already be possible. The matching code is the same as for
> the USB interface drivers.
> 
> Something like:
> static const struct usb_device_id apple_match[] = {
>     { .match_flags = USB_DEVICE_ID_MATCH_VENDOR,
>       .idVendor = USB_VENDOR_APPLE
>     },
>     {}
> }
> 
> And I couldn't use it in patch 5/5, as that's a range of product IDs,
> not all of them (which would be quite a lot more).

You can still use it in patch 5/5.  Match any device with Apple's VID;
then have the probe routine return -ENODEV if the PID is outside the
range you want.

Alan Stern

