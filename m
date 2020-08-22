Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EFA24E98B
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 22:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHVUBK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 16:01:10 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52097 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725932AbgHVUBJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 16:01:09 -0400
Received: (qmail 288684 invoked by uid 1000); 22 Aug 2020 16:01:07 -0400
Date:   Sat, 22 Aug 2020 16:01:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     yunhua li <yunhual@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: XCHI bulk transaction latency, data lost, NAK stats
Message-ID: <20200822200107.GA288350@rowland.harvard.edu>
References: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 22, 2020 at 11:02:16AM -0700, yunhua li wrote:
> Hello all
> For USB Bulk transaction,
> 1. If there are NAK, and retransmit happens on a physical layer, does
> XHCI provide any statistical counter, e.g. how many retries for that
> URB, how can I get those counters or enable it for that TRB?

I'm not an expert on xHCI.  Still, as far as I know, there are no such 
counters.

> 2. If Data is lost, XHCI have to resend URB request?  how long it will
> take before it resend URB request?  Is that a configurable timeout on
> XHCI spec?

I believe it is not configurable.  It will depend on how much other 
traffic there is on the bus.  If the bus is only lightly loaded then the 
retry time should be much less than 1 ms, probably something like 10 us 
or so.  Maybe even smaller.

> The following are some  background of my question.
> I have a XHCI USB Host controller, there are 4 ports. I only connect
> one port to a USB 3.0 camera.  and running program keep reading data
> from device, guvcview -d /dev/video0,
> the camera keeps sending 30 frames/second, normal within each frame,

What is the communication speed of the camera?  480 Mb/s (USB-2), 5000 
Mb/s (USB-3) or something else?  And how much data does the camera send 
for each frame?

> XHCI driver sends URB request -> Device response URB, response time is
> about 10 ~ 200ms.
> Some times, the response time takes 20 000 ~ 200 000 ms, as a result,
> the image gets corrupted.

20 - 200 seconds?  That's an awfully long latency.  Much longer than you 
would expect from random fuctuations; it indicates that something is 
going badly wrong.

> From the USB device(Camera) firmware debugging tool, I can see that
> the Device actually did submit DMA in time, when this big latency
> happens firmware will complain, DMA buffer overflow.
> looks software works correctly on both sides.
> I'm trying to understand why the latency is not consistent?

It sounds like you need to use a USB bus analyzer to measure the 
packets on the wire.

> 3. I have 4 USB ports on the XHCI host controller, but only 1 device
> connects,  does other 3 empty port take any USB bandwidth?

They do not.

>  is there
> anything related to bandwidth allocation I should look at it?

It depends on what other devices are attached to the USB bus.  They may 
or may not require some reserved bandwidth.

> 4. anything related PCIe I should look at? I enabled PCIe error
> reporting, No error found?

It's hard to imagine that your long latencies are caused by PCIe.

Alan Stern
