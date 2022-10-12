Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58BBD5FC990
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 18:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiJLQy4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 12:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiJLQyu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 12:54:50 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4292419002
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 09:54:45 -0700 (PDT)
Received: (qmail 1000483 invoked by uid 1000); 12 Oct 2022 12:54:44 -0400
Date:   Wed, 12 Oct 2022 12:54:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thilo =?iso-8859-1?Q?R=F6rig?= <thilo.roerig@googlemail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Receiving report multiple times when changing cpu
Message-ID: <Y0bxVHsE0bFOFj+7@rowland.harvard.edu>
References: <CAFfCzSuUce=W349CnvtOFs8mYnyevNdXjKJ61eyhE0jpvH8b8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFfCzSuUce=W349CnvtOFs8mYnyevNdXjKJ61eyhE0jpvH8b8g@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 12, 2022 at 04:35:52PM +0200, Thilo R�rig wrote:
> Dear maintainer, dear community,
> 
> I'm new to looking into the linux kernel, but am hoping that this is the
> right spot to address my problem.
> Otherwise I would be very thankful, if you could point me in the right
> direction.
> 
> I have a problem with a custom usb device on a raspberry pi running a
> buildroot 64bit linux with a v5.19.14 kernel.
> I ran into a problem reading data from a custom usb hid device using
> interrupt transfers. I'm using
> the python hidapi library (https://pypi.org/project/hidapi/) with the
> libusb backend. After sending
> a custom command to the device, the driver changes from usbhid to usbfs.
> The device starts sending
> reports of size 1023 bytes to endpoint 0x83. `usb-devices` yields the
> following output:
> 
> T:  Bus=3D01 Lev=3D03 Prnt=3D13 Port=3D00 Cnt=3D01 Dev#=3D 14 Spd=3D480 MxC=
> h=3D 0
> D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
> C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=3D500mA
> I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
> =3Dusbfs
> E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D1024 Ivl=3D125us
> 
> The reports are numbered by an increasing report id and are available via
> interrupt transfer approx. every
> 230 microseconds (1.85 microframes). The device does not retain any old
> reports.
> 
> Initially, I get all reports in the correct order, but after some time I
> start getting reports that I have already
> received previously. The report ids start to include a shift after a
> certain number of reports and
> schematically they look like the following:
> 
> ... 1,2,...,578,  238,239,...,816,  476,477,...,1054, and so on
> 
> So there is approximately the same number of consecutive "forward" reports
> followed by a jump "backwards"
> by approximately the same number of reports. I snooped the transferred data
> using the `usbcore.usbfs_snoop` kernel
> parameter but this slowed things down, so that I started missing reports
> and could not reproduce the problem.

As Greg mentioned, usbmon is a better way to snoop the data transfers.

> Then I traced the `xhci-hcd` events and observed that the pattern started
> to occur, when my python process was
> rescheduled from one cpu-core to another

How on earth do you know when your python process is rescheduled from 
one CPU core to another?  That information certainly is not part of the 
xhci-hcd trace output.

> ...
>           python-22331   [000] ..... 174497.068723: xhci_urb_enqueue:
> ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length 0/1024
> sgs 0/0 stream 0 flags 00010200
>           python-22331   [000] d.... 174497.068727: xhci_queue_trb:
> INTR: Buffer 00000004669c9800 length 1024 TD size 0 intr 0 type
> 'Normal' flags b:i:I:c:s:I:e:c
>           python-22331   [000] d.... 174497.068728: xhci_inc_enq: INTR
> 000000006122f915: enq 0x00000004526bf8f0(0x00000004526bf000) deq
> 0x00000004526bf8e0(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> bounce 1024 cycle 1
>           python-22331   [000] d.... 174497.068729:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
>           <idle>-0       [000] d.h.. 174497.068811: xhci_handle_event:
> EVENT: TRB 00000004526bf8e0 status 'Short Packet' len 1 slot 3 ep 7
> type 'Transfer Event' flags e:c
>           <idle>-0       [000] d.h.. 174497.068814:
> xhci_handle_transfer: INTR: Buffer 00000004669c9800 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
>           <idle>-0       [000] d.h.. 174497.068820: xhci_inc_deq: INTR
> 000000006122f915: enq 0x00000004526bf8f0(0x00000004526bf000) deq
> 0x00000004526bf8f0(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> bounce 1024 cycle 1
>           <idle>-0       [000] d.h.. 174497.068822: xhci_urb_giveback:
> ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length
> 1023/1024 sgs 0/0 stream 0 flags 00010200
>           <idle>-0       [000] d.h.. 174497.068824: xhci_inc_deq:
> EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> 0x0000000440f9f620(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> bounce 0 cycle 0
>           python-22331   [000] ..... 174497.068894: xhci_urb_enqueue:
> ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length 0/1024
> sgs 0/0 stream 0 flags 00010200
>           python-22331   [000] d.... 174497.068899: xhci_queue_trb:
> INTR: Buffer 00000004669c9800 length 1024 TD size 0 intr 0 type
> 'Normal' flags b:i:I:c:s:I:e:c
>           python-22331   [000] d.... 174497.068900: xhci_inc_enq: INTR
> 000000006122f915: enq 0x00000004526bf900(0x00000004526bf000) deq
> 0x00000004526bf8f0(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> bounce 1024 cycle 1
>           python-22331   [000] d.... 174497.068901:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
>           <idle>-0       [000] d.h.. 174497.069954: xhci_handle_event:
> EVENT: TRB 00000004526bf8f0 status 'Short Packet' len 1 slot 3 ep 7
> type 'Transfer Event' flags e:c
>           <idle>-0       [000] d.h.. 174497.069957:
> xhci_handle_transfer: INTR: Buffer 00000004669c9800 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
>           <idle>-0       [000] d.h.. 174497.069959: xhci_inc_deq: INTR
> 000000006122f915: enq 0x00000004526bf900(0x00000004526bf000) deq
> 0x00000004526bf900(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> bounce 1024 cycle 1
>           <idle>-0       [000] d.h.. 174497.069961: xhci_urb_giveback:
> ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length
> 1023/1024 sgs 0/0 stream 0 flags 00010200
>           <idle>-0       [000] d.h.. 174497.069962: xhci_inc_deq:
> EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> 0x0000000440f9f630(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> bounce 0 cycle 0
>           python-22331   [003] ..... 174497.070160: xhci_urb_enqueue:
> ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length 0/1024
> sgs 0/0 stream 0 flags 00010200
>           python-22331   [003] d.... 174497.070171: xhci_queue_trb:
> INTR: Buffer 00000004799b0000 length 1024 TD size 0 intr 0 type
> 'Normal' flags b:i:I:c:s:I:e:c
>           python-22331   [003] d.... 174497.070172: xhci_inc_enq: INTR
> 000000006122f915: enq 0x00000004526bf910(0x00000004526bf000) deq
> 0x00000004526bf900(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> bounce 1024 cycle 1
>           python-22331   [003] d.... 174497.070174:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
>           <idle>-0       [000] d.h.. 174497.071201: xhci_handle_event:
> EVENT: TRB 00000004526bf900 status 'Short Packet' len 1 slot 3 ep 7
> type 'Transfer Event' flags e:c
>           <idle>-0       [000] d.h.. 174497.071204:
> xhci_handle_transfer: INTR: Buffer 00000004799b0000 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
>           <idle>-0       [000] d.h.. 174497.071206: xhci_inc_deq: INTR
> 000000006122f915: enq 0x00000004526bf910(0x00000004526bf000) deq
> 0x00000004526bf910(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> bounce 1024 cycle 1
>           <idle>-0       [000] d.h.. 174497.071208: xhci_urb_giveback:
> ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length
> 1023/1024 sgs 0/0 stream 0 flags 00010200
>           <idle>-0       [000] d.h.. 174497.071210: xhci_inc_deq:
> EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> 0x0000000440f9f640(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> bounce 0 cycle 0
>           python-22331   [003] ..... 174497.071269: xhci_urb_enqueue:
> ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length 0/1024
> sgs 0/0 stream 0 flags 00010200
>           python-22331   [003] d.... 174497.071272: xhci_queue_trb:
> INTR: Buffer 00000004799b0000 length 1024 TD size 0 intr 0 type
> 'Normal' flags b:i:I:c:s:I:e:c
>           python-22331   [003] d.... 174497.071273: xhci_inc_enq: INTR
> 000000006122f915: enq 0x00000004526bf920(0x00000004526bf000) deq
> 0x00000004526bf910(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> bounce 1024 cycle 1
>           python-22331   [003] d.... 174497.071274:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
>           <idle>-0       [000] d.h.. 174497.072330: xhci_handle_event:
> EVENT: TRB 00000004526bf910 status 'Short Packet' len 1 slot 3 ep 7
> type 'Transfer Event' flags e:c
>           <idle>-0       [000] d.h.. 174497.072331:
> xhci_handle_transfer: INTR: Buffer 00000004799b0000 length 1024 TD
> size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
>           <idle>-0       [000] d.h.. 174497.072332: xhci_inc_deq: INTR
> 000000006122f915: enq 0x00000004526bf920(0x00000004526bf000) deq
> 0x00000004526bf920(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> bounce 1024 cycle 1
>           <idle>-0       [000] d.h.. 174497.072334: xhci_urb_giveback:
> ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length
> 1023/1024 sgs 0/0 stream 0 flags 00010200
>           <idle>-0       [000] d.h.. 174497.072334: xhci_inc_deq:
> EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> 0x0000000440f9f650(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> bounce 0 cycle 0
> ...
> 
> Unfortunately, I do not understand the details of the linux usb stack in
> depth and the details of
> this log enough to know where to look any further. I am hoping to get some
> help or pointers to
> how to attack my problem. I have tried using different libraries (hidapi C,
> libusb), linux systems
> (raspberry pi OS, ubuntu), but the problem persisted.
> 
> Thank you very much for taking the time for reading about my problem and
> thank you in advance
> for any advice.

The most important thing you should do, to ensure that reports do not 
get lost, is submit a large queue of interrupt transfers in advance.  
Each time a transfer completes, add another submission to the queue.

That way, even if your process loses control of the CPU for some period 
of time, the transfers will continue (unless the period is so long that 
your entire queue gets consumed before the process is able to submit 
more requests).

The fact that reports get lost if you don't retrieve them every 230 
microseconds may indicate that your custom device should not be using 
the HID protocol at all, but rather should use isochronous transfers.
Isochronous is meant for real-time applications where data is simply 
lost if it's not transferred within a fixed interval of time.

Alan Stern
