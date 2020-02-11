Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 017AE159317
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 16:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgBKPYe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 10:24:34 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:33778 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727862AbgBKPYe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 10:24:34 -0500
Received: (qmail 3788 invoked by uid 2102); 11 Feb 2020 10:24:33 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 11 Feb 2020 10:24:33 -0500
Date:   Tue, 11 Feb 2020 10:24:33 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     linux-usb@vger.kernel.org, <john453@faraday-tech.com>
Subject: Re: [bug report] usb: host: Faraday fotg210-hcd driver
In-Reply-To: <20200211150308.rqjujcicbx5obxd2@kili.mountain>
Message-ID: <Pine.LNX.4.44L0.2002111021330.1574-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 11 Feb 2020, Dan Carpenter wrote:

> Hello USB devs,
> 
> The patch 7d50195f6c50: "usb: host: Faraday fotg210-hcd driver" from
> Jul 29, 2013, leads to the following static checker warning:
> 
> 	drivers/usb/host/fotg210-hcd.c:3945 iso_stream_init()
> 	warn: mask and shift to zero
> 
> drivers/usb/host/fotg210-hcd.c
>   3922  static void iso_stream_init(struct fotg210_hcd *fotg210,
>   3923                  struct fotg210_iso_stream *stream, struct usb_device *dev,
>   3924                  int pipe, unsigned interval)
>   3925  {
>   3926          u32 buf1;
>   3927          unsigned epnum, maxp;
>   3928          int is_input;
>   3929          long bandwidth;
>   3930          unsigned multi;
>   3931  
>   3932          /*
>   3933           * this might be a "high bandwidth" highspeed endpoint,
>   3934           * as encoded in the ep descriptor's wMaxPacket field
>   3935           */
>   3936          epnum = usb_pipeendpoint(pipe);
>   3937          is_input = usb_pipein(pipe) ? USB_DIR_IN : 0;
>   3938          maxp = usb_maxpacket(dev, pipe, !is_input);
>   3939          if (is_input)
>   3940                  buf1 = (1 << 11);
>   3941          else
>   3942                  buf1 = 0;
>   3943  
>   3944          maxp = max_packet(maxp);
>   3945          multi = hb_mult(maxp);
>   3946          buf1 |= maxp;
>   3947          maxp *= multi;

This is pretty clearly a case of mistaken reuse of a local variable.  
The argument to hb_mult() should be the output from usb_maxpacket(), 
not the result of the max_packet() calculation.

>   3948  
>   3949          stream->buf0 = cpu_to_hc32(fotg210, (epnum << 8) | dev->devnum);
>   3950          stream->buf1 = cpu_to_hc32(fotg210, buf1);
>   3951          stream->buf2 = cpu_to_hc32(fotg210, multi);
> 
> The problem is these two defines:
> 
> #define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
> #define hb_mult(wMaxPacketSize) (1 + (((wMaxPacketSize) >> 11) & 0x03))
> 
> 0x07ff >> 11 is always zero so multi is always 1.
> 
> Should we pass the original value that usb_maxpacket() returned instead
> of the masked value?

Yes.  I suggest introducing a new local variable and using it in place
of maxp in lines 3938, 3944 (the second occurrence), and 3945.

Alan Stern

> regards,
> dan carpenter

