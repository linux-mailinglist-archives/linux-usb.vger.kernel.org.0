Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12837250DCD
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 02:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgHYAsq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 20:48:46 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37641 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726090AbgHYAsq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 20:48:46 -0400
Received: (qmail 351048 invoked by uid 1000); 24 Aug 2020 20:48:45 -0400
Date:   Mon, 24 Aug 2020 20:48:45 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jean-Christophe Barnoud <jcbarnoud@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Duplicate endpoint : Sound Devices MixPre-D (sound interface)
Message-ID: <20200825004845.GC350601@rowland.harvard.edu>
References: <a8e7a061-e788-9c57-59fc-243d0daae851@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8e7a061-e788-9c57-59fc-243d0daae851@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 06:48:37PM +0200, Jean-Christophe Barnoud wrote:
> Hello.
> 
> The team at libusb says that this is a kernel issue so here it is.
> Device : Sound Devices MixPre-D
> This is an external audio interface that worked simultaneously as input and
> output with older kernels and libusb versions (see far below with fedora 26,
> kernel 4.13.13-200, libusb 0.1.5-8 from an older mothballed machine).
> With newer versions of the kernel and libusb it works only as output (see
> just below with a current fedora 32, kernel 5.7.15-200, libusb-0.1.5-16).
> 
> An online search shows that the dmesg output "duplicate endpoint" is
> identical to the one referenced in this permalink :
> http://archive.lwn.net:8080/linux-kernel/20200201105829.5682c887@acme7.acmenet/
> So I guess that the solution is the same, adding in
> drivers/usb/core/quirks.c (adapted to the specific hardware identification)
> :
> +    /* Sound Devices MixPre-D */
> +    { USB_DEVICE(0x0926, 0x0208), .driver_info =
> USB_QUIRK_ENDPOINT_BLACKLIST },

More than just this entry is needed; there also has to be an entry 
listing the endpoints to be ignored.  But that's straightforward to add.

> +
> Would it be possible to add this exception to quirks.c ?
> Thanks
> 
> 
> Fedora 32
> 
> [jcb@localhost ~]$ dmesg
> [181470.940975] usb 3-9: new high-speed USB device number 6 using xhci_hcd
> [181471.067606] usb 3-9: config 1 interface 2 altsetting 1 has a duplicate
> endpoint with address 0x85, skipping
> [181471.067609] usb 3-9: config 1 interface 2 altsetting 2 has a duplicate
> endpoint with address 0x85, skipping

Can you provide the output from "lsusb -v" for this device?  We'd like 
to know exactly what's being added to the ignore list and why, before 
doing it.

Alan Stern
