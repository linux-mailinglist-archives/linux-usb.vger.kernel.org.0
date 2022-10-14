Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406485FED1F
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 13:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiJNLTI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 07:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiJNLTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 07:19:05 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA251CB508
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 04:19:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id q9so9889060ejd.0
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x65Al7h1TbtFShwnkZj14X3QgBPCylzbuK5ozf/kox4=;
        b=EtfTBDrJQtKc4k2457rbmQMWAPhKLzrePx0OChzd3fEPYb7UHNxbFa829/0CIjJUOL
         rRbhj98QHgubHxVhxWc8j8SiCbmz3HGzRpwQ7qMqOTfkwSrE2jaSnHAZmO4XuSwt1hSl
         +2GhjP+znsos2nFnGyyY8C34aZDaMRu2JACAybbSDvWqglhpeJwaIH0GlIBsFqmc2yib
         5/TnRfZmOBoAM25LUH3llAxoJCS+cxzEK2zVZPo9AVgUXuy45qE6a8GBJzmhAPilafj7
         txx4gCtifPl8ceX1590Vsq4fulhzSKN0XKMrOPfyGySLRZ8qnreRa0PM9YKvZHfxdJIv
         Fuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x65Al7h1TbtFShwnkZj14X3QgBPCylzbuK5ozf/kox4=;
        b=B1KCEsYBY/Iq3hT7kBi+gwgxvIv7kvIKxd6th+qHBrU4DaUYi5lXjq1X05QmYtYfY/
         Z0o21dm0C2IARKrmEJM/2Y6ZE3qCaVj9tYndZV1raMSnw+8IJ2E9ffuTUWJM0m0cQ3dU
         5Vv4/Zuv6zm+ybdrut656jQ3zA4a1JDKuiUkgpv/8PpaYRmb2z1IWtnTAUCAB40TZA7x
         bPY+Kkq9ws1mp7gNQMw6YzJK9WwspuGCWXvvIzTxte1ewIHcfuPwZfnyyKaoF01/KwVl
         YufoHnv0+WcGR4XeGoJGKXoIltVT9bKrrfYMynksI4JAGcfcnYQIK7Stamo6Ye/jHk/w
         rMeQ==
X-Gm-Message-State: ACrzQf3mSIWch+/NTl8zvVuU138M7hIMIcDk2DS5EcMnVZJOWks/iIL0
        jGOp8Dxn723W63AcchBTTQ==
X-Google-Smtp-Source: AMsMyM42i1BkgD71PfVUw3/oyhFNErnoEDGOvqbEa8zlNoUeZ6x8JCm62gBnL0sGV3V7cWnqKVyaVw==
X-Received: by 2002:a17:907:1b0e:b0:72f:9b43:b98c with SMTP id mp14-20020a1709071b0e00b0072f9b43b98cmr3098170ejc.710.1665746338734;
        Fri, 14 Oct 2022 04:18:58 -0700 (PDT)
Received: from IAS-200827.ad.werk5.local (p4ffdedec.dip0.t-ipconnect.de. [79.253.237.236])
        by smtp.gmail.com with ESMTPSA id x2-20020a50ba82000000b0044eb5b922bdsm1648369ede.24.2022.10.14.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 04:18:58 -0700 (PDT)
From:   Thilo Roerig <thilo.roerig@googlemail.com>
X-Google-Original-From: Thilo Roerig <roerig@interactive-scape.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thilo.roerig@googlemail.com
Subject: Re: Receiving report multiple times when changing cpu 
Date:   Fri, 14 Oct 2022 13:18:55 +0200
Message-Id: <20221014111855.2406-1-roerig@interactive-scape.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y0bkpyS8Ayn0q92D@kroah.com>
References: <Y0bkpyS8Ayn0q92D@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Wed, Oct 12, 2022 at 04:35:52PM +0200, Thilo Rörig wrote:
> > Dear maintainer, dear community,
> > 
> > I'm new to looking into the linux kernel, but am hoping that this is the
> > right spot to address my problem.
> > Otherwise I would be very thankful, if you could point me in the right
> > direction.
> > 
> > I have a problem with a custom usb device on a raspberry pi running a
> > buildroot 64bit linux with a v5.19.14 kernel.
> > I ran into a problem reading data from a custom usb hid device using
> > interrupt transfers. I'm using
> > the python hidapi library (https://pypi.org/project/hidapi/) with the
> > libusb backend. After sending
> > a custom command to the device, the driver changes from usbhid to usbfs.
> > The device starts sending
> > reports of size 1023 bytes to endpoint 0x83. `usb-devices` yields the
> > following output:
> 
> USB devices do not "send" anything, they require a request from the host
> to be able to transfer any data.  So you have to ask the device "do you
> have any data?" before it can respond with anything.
> 
> So just wait, don't ask the device if you are not ready for the data to
> be recieved, do not allow the device to continue to flood the data to
> you if you can not recieve it all.

Thank you for pointing this out. I looked into the implementation of the hidapi
library. The library immediately starts submitting transfer when opening the
device. So to get a better grip on the issue, I'm now using libusb and in 
this case I only get the reports, when I'm asking for it.

> > T:  Bus=3D01 Lev=3D03 Prnt=3D13 Port=3D00 Cnt=3D01 Dev#=3D 14 Spd=3D480 MxC=
> > h=3D 0
> > D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
> > C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=3D500mA
> > I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
> > =3Dusbfs
> > E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D1024 Ivl=3D125us
> > 
> > The reports are numbered by an increasing report id and are available via
> > interrupt transfer approx. every
> > 230 microseconds (1.85 microframes). The device does not retain any old
> > reports.
> 
> So is the buffer in the device overflowing because the host is not
> asking for enough data from it, or is the data overflowing in the host
> because you are not reading the buffers fast enough?

The buffer on the device does not buffer reports, that are as old as the
reports I am receiving via libusb. Interestingly, the speed that I can receive
the reports in userspace increases, when the wrong pattern starts to occur.
Initially, I receive ~4350 reports per second (with correct report id and
increasing order), but once the wrong pattern occurs, the speed goes up to
~7650 reports per second, which is approx. 1 microframe. Without having found
any reference in the code, the pattern in the data looks as if some dequeue
pointer is "overtaking" the enqueue pointer in a ring buffer - but this is just
a wild guess. It would maybe explain the pattern in the data and maybe also the
speedup once the ring buffer is not preventing the dequeue from reading once
the enqueue pointer is reached.   
 
> > Initially, I get all reports in the correct order, but after some time I
> > start getting reports that I have already
> > received previously. The report ids start to include a shift after a
> > certain number of reports and
> > schematically they look like the following:
> > 
> > ... 1,2,...,578,  238,239,...,816,  476,477,...,1054, and so on
> > 
> > So there is approximately the same number of consecutive "forward" reports
> > followed by a jump "backwards"
> > by approximately the same number of reports. I snooped the transferred data
> > using the `usbcore.usbfs_snoop` kernel
> > parameter but this slowed things down, so that I started missing reports
> > and could not reproduce the problem.
> 
> Where was the report missed from?  The device or the host?  Does the
> device overflow and not send data if you don't ask for it fast enough?
> 
> What about using usbmon to watch the data flow by?

When I enable `usbcore.usbfs_snoop` I am missing reports on the host, since I
am not asking for the reports fast enough. I can ask the device for data
anytime and it will provide a report with a later report id. 

Thanks for the pointer to usbmon. I have recorded some logs and analyzed them,
but could not spot any irregularities when the jump pattern starts to occur in
the report numbers. Only the regularity of the number of reports of the
backward jumps.

> > Then I traced the `xhci-hcd` events and observed that the pattern started
> > to occur, when my python process was
> > rescheduled from one cpu-core to another
> > 
> > ...
> >           python-22331   [000] ..... 174497.068723: xhci_urb_enqueue:
> > ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length 0/1024
> > sgs 0/0 stream 0 flags 00010200
> >           python-22331   [000] d.... 174497.068727: xhci_queue_trb:
> > INTR: Buffer 00000004669c9800 length 1024 TD size 0 intr 0 type
> > 'Normal' flags b:i:I:c:s:I:e:c
> >           python-22331   [000] d.... 174497.068728: xhci_inc_enq: INTR
> > 000000006122f915: enq 0x00000004526bf8f0(0x00000004526bf000) deq
> > 0x00000004526bf8e0(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> > bounce 1024 cycle 1
> >           python-22331   [000] d.... 174497.068729:
> > xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
> >           <idle>-0       [000] d.h.. 174497.068811: xhci_handle_event:
> > EVENT: TRB 00000004526bf8e0 status 'Short Packet' len 1 slot 3 ep 7
> > type 'Transfer Event' flags e:c
> >           <idle>-0       [000] d.h.. 174497.068814:
> > xhci_handle_transfer: INTR: Buffer 00000004669c9800 length 1024 TD
> > size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> >           <idle>-0       [000] d.h.. 174497.068820: xhci_inc_deq: INTR
> > 000000006122f915: enq 0x00000004526bf8f0(0x00000004526bf000) deq
> > 0x00000004526bf8f0(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> > bounce 1024 cycle 1
> >           <idle>-0       [000] d.h.. 174497.068822: xhci_urb_giveback:
> > ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length
> > 1023/1024 sgs 0/0 stream 0 flags 00010200
> >           <idle>-0       [000] d.h.. 174497.068824: xhci_inc_deq:
> > EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> > 0x0000000440f9f620(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> > bounce 0 cycle 0
> >           python-22331   [000] ..... 174497.068894: xhci_urb_enqueue:
> > ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length 0/1024
> > sgs 0/0 stream 0 flags 00010200
> >           python-22331   [000] d.... 174497.068899: xhci_queue_trb:
> > INTR: Buffer 00000004669c9800 length 1024 TD size 0 intr 0 type
> > 'Normal' flags b:i:I:c:s:I:e:c
> >           python-22331   [000] d.... 174497.068900: xhci_inc_enq: INTR
> > 000000006122f915: enq 0x00000004526bf900(0x00000004526bf000) deq
> > 0x00000004526bf8f0(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> > bounce 1024 cycle 1
> >           python-22331   [000] d.... 174497.068901:
> > xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
> >           <idle>-0       [000] d.h.. 174497.069954: xhci_handle_event:
> > EVENT: TRB 00000004526bf8f0 status 'Short Packet' len 1 slot 3 ep 7
> > type 'Transfer Event' flags e:c
> >           <idle>-0       [000] d.h.. 174497.069957:
> > xhci_handle_transfer: INTR: Buffer 00000004669c9800 length 1024 TD
> > size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> >           <idle>-0       [000] d.h.. 174497.069959: xhci_inc_deq: INTR
> > 000000006122f915: enq 0x00000004526bf900(0x00000004526bf000) deq
> > 0x00000004526bf900(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> > bounce 1024 cycle 1
> >           <idle>-0       [000] d.h.. 174497.069961: xhci_urb_giveback:
> > ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length
> > 1023/1024 sgs 0/0 stream 0 flags 00010200
> >           <idle>-0       [000] d.h.. 174497.069962: xhci_inc_deq:
> > EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> > 0x0000000440f9f630(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> > bounce 0 cycle 0
> >           python-22331   [003] ..... 174497.070160: xhci_urb_enqueue:
> > ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length 0/1024
> > sgs 0/0 stream 0 flags 00010200
> >           python-22331   [003] d.... 174497.070171: xhci_queue_trb:
> > INTR: Buffer 00000004799b0000 length 1024 TD size 0 intr 0 type
> > 'Normal' flags b:i:I:c:s:I:e:c
> >           python-22331   [003] d.... 174497.070172: xhci_inc_enq: INTR
> > 000000006122f915: enq 0x00000004526bf910(0x00000004526bf000) deq
> > 0x00000004526bf900(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> > bounce 1024 cycle 1
> >           python-22331   [003] d.... 174497.070174:
> > xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
> >           <idle>-0       [000] d.h.. 174497.071201: xhci_handle_event:
> > EVENT: TRB 00000004526bf900 status 'Short Packet' len 1 slot 3 ep 7
> > type 'Transfer Event' flags e:c
> >           <idle>-0       [000] d.h.. 174497.071204:
> > xhci_handle_transfer: INTR: Buffer 00000004799b0000 length 1024 TD
> > size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> >           <idle>-0       [000] d.h.. 174497.071206: xhci_inc_deq: INTR
> > 000000006122f915: enq 0x00000004526bf910(0x00000004526bf000) deq
> > 0x00000004526bf910(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> > bounce 1024 cycle 1
> >           <idle>-0       [000] d.h.. 174497.071208: xhci_urb_giveback:
> > ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length
> > 1023/1024 sgs 0/0 stream 0 flags 00010200
> >           <idle>-0       [000] d.h.. 174497.071210: xhci_inc_deq:
> > EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> > 0x0000000440f9f640(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> > bounce 0 cycle 0
> >           python-22331   [003] ..... 174497.071269: xhci_urb_enqueue:
> > ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length 0/1024
> > sgs 0/0 stream 0 flags 00010200
> >           python-22331   [003] d.... 174497.071272: xhci_queue_trb:
> > INTR: Buffer 00000004799b0000 length 1024 TD size 0 intr 0 type
> > 'Normal' flags b:i:I:c:s:I:e:c
> >           python-22331   [003] d.... 174497.071273: xhci_inc_enq: INTR
> > 000000006122f915: enq 0x00000004526bf920(0x00000004526bf000) deq
> > 0x00000004526bf910(0x00000004526bf000) segs 2 stream 0 free_trbs 500
> > bounce 1024 cycle 1
> >           python-22331   [003] d.... 174497.071274:
> > xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
> >           <idle>-0       [000] d.h.. 174497.072330: xhci_handle_event:
> > EVENT: TRB 00000004526bf910 status 'Short Packet' len 1 slot 3 ep 7
> > type 'Transfer Event' flags e:c
> >           <idle>-0       [000] d.h.. 174497.072331:
> > xhci_handle_transfer: INTR: Buffer 00000004799b0000 length 1024 TD
> > size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
> >           <idle>-0       [000] d.h.. 174497.072332: xhci_inc_deq: INTR
> > 000000006122f915: enq 0x00000004526bf920(0x00000004526bf000) deq
> > 0x00000004526bf920(0x00000004526bf000) segs 2 stream 0 free_trbs 501
> > bounce 1024 cycle 1
> >           <idle>-0       [000] d.h.. 174497.072334: xhci_urb_giveback:
> > ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length
> > 1023/1024 sgs 0/0 stream 0 flags 00010200
> >           <idle>-0       [000] d.h.. 174497.072334: xhci_inc_deq:
> > EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
> > 0x0000000440f9f650(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
> > bounce 0 cycle 0
> > ...
> 
> That's a bit hard to read, sorry, I don't know what that means.

Excuse me for the terrible formatting of the log. The interesting part 
of the log, when the problem starts to occur is the following taken
from `/sys/kernel/debug/tracing/trace`:

...

                         _-----=> irqs-off/BH-disabled
                        / _----=> need-resched
                       | / _---=> hardirq/softirq
                       || / _--=> preempt-depth
                       ||| / _-=> migrate-disable
                       |||| /     delay
    TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
       | |         |   |||||     |         |
----------------------------------------------------------------------------
  python-22331   [000] ..... 174497.068723: xhci_urb_enqueue: ep3in-intr: ...
  python-22331   [000] d.... 174497.068727: xhci_queue_trb: ...
  python-22331   [000] d.... 174497.068728: xhci_inc_enq: INTR ...
  python-22331   [000] d.... 174497.068729: xhci_ring_ep_doorbell: ...
  <idle>-0       [000] d.h.. 174497.068814: xhci_handle_transfer: INTR: ...
  <idle>-0       [000] d.h.. 174497.068820: xhci_inc_deq: INTR ...
  <idle>-0       [000] d.h.. 174497.068822: xhci_urb_giveback: ep3in-intr: ...
  python-22331   [000] ..... 174497.068894: xhci_urb_enqueue: ep3in-intr: ...
  python-22331   [000] d.... 174497.068899: xhci_queue_trb: INTR: ...
  python-22331   [000] d.... 174497.068900: xhci_inc_enq: INTR ...
  python-22331   [000] d.... 174497.068901: xhci_ring_ep_doorbell: ...
  <idle>-0       [000] d.h.. 174497.069957: xhci_handle_transfer: INTR: ...
  <idle>-0       [000] d.h.. 174497.069959: xhci_inc_deq: INTR ...
  <idle>-0       [000] d.h.. 174497.069961: xhci_urb_giveback: ep3in-intr: ...
  python-22331   [003] ..... 174497.070160: xhci_urb_enqueue: ep3in-intr: ...
  python-22331   [003] d.... 174497.070171: xhci_queue_trb: INTR: ...
  python-22331   [003] d.... 174497.070172: xhci_inc_enq: INTR ...
  python-22331   [003] d.... 174497.070174: xhci_ring_ep_doorbell: ...
  <idle>-0       [000] d.h.. 174497.071204: xhci_handle_transfer: INTR: ...
  <idle>-0       [000] d.h.. 174497.071206: xhci_inc_deq: INTR ...
  <idle>-0       [000] d.h.. 174497.071208: xhci_urb_giveback: ep3in-intr: ...
  python-22331   [003] ..... 174497.071269: xhci_urb_enqueue: ep3in-intr: ...
  python-22331   [003] d.... 174497.071272: xhci_queue_trb: INTR: ...
  python-22331   [003] d.... 174497.071273: xhci_inc_enq: INTR ...
  python-22331   [003] d.... 174497.071274: xhci_ring_ep_doorbell: ...
  <idle>-0       [000] d.h.. 174497.072331: xhci_handle_transfer: INTR: ...
  <idle>-0       [000] d.h.. 174497.072332: xhci_inc_deq: INTR ...
  <idle>-0       [000] d.h.. 174497.072334: xhci_urb_giveback: ep3in-intr: ...
...

The change I observed, is the change in the CPU# of my python process. In the 
xhci trb enqueue and dequeue pointers I could not spot any irregularities.

> But check your userspace side, only ask for data when you are ready to
> accept it, and then process it and ask for more data.  That might make
> things a lot simpler.

I have reinvestigated my applications side and followed the calls of libusb
to ioctl calls, but could not spot anything on the way. Unfortunately, I 
could not see who is taking care of buffering the reports? Is it libusb or
is this the device driver in the kernel taking care of this?

Thank you very much again for your time and help.

Best
Thilo

