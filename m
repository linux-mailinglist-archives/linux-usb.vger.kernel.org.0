Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B22824E9D3
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 22:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgHVUlI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 16:41:08 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45447 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726036AbgHVUlI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 16:41:08 -0400
Received: (qmail 289679 invoked by uid 1000); 22 Aug 2020 16:41:07 -0400
Date:   Sat, 22 Aug 2020 16:41:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     yunhua li <yunhual@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: XCHI bulk transaction latency, data lost, NAK stats
Message-ID: <20200822204107.GC288350@rowland.harvard.edu>
References: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
 <20200822200107.GA288350@rowland.harvard.edu>
 <CAMqbrUiRfk7uy+oPwwsvjL+CZNGEFGonGRx5LMGyQ7UTwrPA8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMqbrUiRfk7uy+oPwwsvjL+CZNGEFGonGRx5LMGyQ7UTwrPA8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 22, 2020 at 01:35:28PM -0700, yunhua li wrote:
> HI Alan Thanks for your response.
> > What is the communication speed of the camera?  480 Mb/s (USB-2), 5000
> Mb/s (USB-3) or something else?  And how much data does the camera send
> for each frame?
> It is 5000Mb/s (USB 3.0),  each video frame is about 2880000, 30 fps.

So at 500 MB/s, and with less than 5 MB/frame, the expected transfer 
time for each frame is under 10 ms.  30 frames per second should be 
fine.

> > 20 - 200 seconds?  That's an awfully long latency.  Much longer than you
> would expect from random fuctuations; it indicates that something is
> going badly wrong.
> Sorry it is 0.02 ~ 0.2 seconds delay,  when image got corrupted,

Okay, that's more like what one might expect.

> > It depends on what other devices are attached to the USB bus.  They may
> or may not require some reserved bandwidth.
> There is no other USB device connected to the system.
> if no other USB device, and no  Isochronous transaction, Bulk
> transaction (This camera) should be able to use all bandwidth, am I
> correct?

Yes, that's right.

Alan Stern
