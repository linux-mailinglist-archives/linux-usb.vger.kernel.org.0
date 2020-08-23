Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79EE24EA95
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 02:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgHWAnR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 20:43:17 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55479 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726075AbgHWAnR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 20:43:17 -0400
Received: (qmail 292605 invoked by uid 1000); 22 Aug 2020 20:43:16 -0400
Date:   Sat, 22 Aug 2020 20:43:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     yunhua li <yunhual@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: XCHI bulk transaction latency, data lost, NAK stats
Message-ID: <20200823004316.GA292576@rowland.harvard.edu>
References: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
 <20200822200107.GA288350@rowland.harvard.edu>
 <CAMqbrUiRfk7uy+oPwwsvjL+CZNGEFGonGRx5LMGyQ7UTwrPA8A@mail.gmail.com>
 <20200822204107.GC288350@rowland.harvard.edu>
 <CAMqbrUhtoZxg--Gp0un=sKYBWfmtmNMYR+8rvyRHxdKsjWY73w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMqbrUhtoZxg--Gp0un=sKYBWfmtmNMYR+8rvyRHxdKsjWY73w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 22, 2020 at 02:03:02PM -0700, yunhua li wrote:
> Thanks, Alan, your answers are really helpful.
> one more question:
> > It depends on what other devices are attached to the USB bus.  They may
> > or may not require some reserved bandwidth.
> Is there any tool/method I can dump reserved or allocated bandwidth
> info of each  USB device?

You can run "lsusb -v" and you can examine the contents of 
/sys/kernel/debug/usb/devices.  There's more information available 
under /sys/kernel/debug/usb/xhci/* but I don't know what the format is 
or if it includes bandwidth reservations.

Alan Stern
