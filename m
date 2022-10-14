Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C4D5FED24
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 13:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJNLVJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 07:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiJNLVI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 07:21:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25257185417
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 04:21:01 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id m15so6365498edb.13
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAFKFkci+Bplz/7J8WysEb/w8Pe3h3jkJGvaN/wiUa4=;
        b=LhGyuzO0bTDA1GUiYIPeYTwEsXDqiofOAL/dnhI9qisIPSBpyPhMCis9tzrM1KZZOj
         DoRRqrnp7BgejbagdTpwMwiXeuCyIO0oF7kuOEDqhcAK9W4I53PkGgj2cPpeQoiXjwKN
         QQrPc+7rv0cjPGt3Cjc/Lb1J6UHTx0UZxsc3aQrF4cbQrFE62+l5HWDaL80y5vGznkVv
         vnpaDHzYsIFChA5lZeoD3hwaBLQgc9+qLjP8f9LN5cwHHML3dVtSPg80yTGXzGJojxBn
         R/SK/+Xa1UMbPDyRdU+CysM5PIPBt9ocC6qbmvg3j3fRG6kUcjmJ3z0quU3PG2EZO9wy
         lPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAFKFkci+Bplz/7J8WysEb/w8Pe3h3jkJGvaN/wiUa4=;
        b=hlN4JKu71O363mA9RCI9zTiA9LrbZVm0HqZhbF/EbQ7y93yrg9OUxWDpYJhrHIXQEw
         BSbrxy6QLqQj2HzI2mbHk2FFKWB1N7kEq5h2cxbir9eO+ZjVTjwWKUxonBf31f/CX1Vo
         8W7GGZuxFOyjm5Vqddp8U5F94rkKrePPSQr6qKSnTh+kIyzvx+2CwBUS4Y7kHVdtMxyz
         5WKI3SmtWXYrbHeVPdq1r2xykaaMKrpRqgGy5/CoMNY6utmQulqsE5FY5wVaJv4w38p8
         RdFABImzoFlDcuwVutODsU9DHR5Cgrh6pWoiotHkXXhEF5pfllWD+/At7QMFa23aoWnq
         MP6w==
X-Gm-Message-State: ACrzQf3X0gIXXIqGoi2GCUKdS4yrb013WGrl7jFHhRilX16IMUnDw9Hd
        bJ0yMBTiWKbrnF7kdP2C4g==
X-Google-Smtp-Source: AMsMyM7jSyIYYGOqupoog4msizoEazuuSfvicLn26QIqaqtvxq9ZCVOhCVZPHCOD9CImKxDmeEcMdw==
X-Received: by 2002:a05:6402:520d:b0:45a:31cb:f5bd with SMTP id s13-20020a056402520d00b0045a31cbf5bdmr3877197edd.119.1665746459484;
        Fri, 14 Oct 2022 04:20:59 -0700 (PDT)
Received: from IAS-200827.ad.werk5.local (p4ffdedec.dip0.t-ipconnect.de. [79.253.237.236])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b00773c60c2129sm1370936ejb.141.2022.10.14.04.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 04:20:59 -0700 (PDT)
From:   Thilo Roerig <thilo.roerig@googlemail.com>
X-Google-Original-From: Thilo Roerig <roerig@interactive-scape.com>
To:     stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, thilo.roerig@googlemail.com
Subject: Re: Receiving report multiple times when changing cpu
Date:   Fri, 14 Oct 2022 13:20:49 +0200
Message-Id: <20221014112049.2456-1-roerig@interactive-scape.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y0bxVHsE0bFOFj+7@rowland.harvard.edu>
References: <Y0bxVHsE0bFOFj+7@rowland.harvard.edu>
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
> > 
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
> > 
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
> As Greg mentioned, usbmon is a better way to snoop the data transfers.

I have continued to investigate the issue using usbmon, but unfortunately, I
could not find any other irregularity, but the jumps in the report id pattern.

> > Then I traced the `xhci-hcd` events and observed that the pattern started
> > to occur, when my python process was
> > rescheduled from one cpu-core to another
> 
> How on earth do you know when your python process is rescheduled from 
> one CPU core to another?  That information certainly is not part of the 
> xhci-hcd trace output.
> 

Sorry for the messed up output of the xhci_hcd trace. Maybe I am not
interpreting the information in the log correctly as it is the first time that
I'm looking at kernel traces. To get a better view I have reformatted the log:

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

In the middle, the python-22331 process changes from CPU# 000 to CPU# 003. 
This is the reason for my statement in the original question. I first observed
in htop that the irregularities in the report pattern started, when the cpu
usage changed. So maybe I am also only seeing what I want to see here and 
this might no trigger my problem.

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
> > 
> > Unfortunately, I do not understand the details of the linux usb stack in
> > depth and the details of
> > this log enough to know where to look any further. I am hoping to get some
> > help or pointers to
> > how to attack my problem. I have tried using different libraries (hidapi C,
> > libusb), linux systems
> > (raspberry pi OS, ubuntu), but the problem persisted.
> > 
> > Thank you very much for taking the time for reading about my problem and
> > thank you in advance
> > for any advice.
> 
> The most important thing you should do, to ensure that reports do not 
> get lost, is submit a large queue of interrupt transfers in advance.  
> Each time a transfer completes, add another submission to the queue.
>
> That way, even if your process loses control of the CPU for some period 
> of time, the transfers will continue (unless the period is so long that 
> your entire queue gets consumed before the process is able to submit 
> more requests).

Thank you for your help! Initially, I was submitting 4 transfers only.
I'll try to submit more transfers once I start loosing reports. Currently
I am able to get all reports using only 4 transfers. I'm loosing reports
only if I'm debugging with `usbfs_snoop`. In this case, I tried submitting
more transfers, but I was still loosing some reports, so I decided, that 
I will try to find another debugging possibility iother then usbfs_snoop.

> The fact that reports get lost if you don't retrieve them every 230 
> microseconds may indicate that your custom device should not be using 
> the HID protocol at all, but rather should use isochronous transfers.
> Isochronous is meant for real-time applications where data is simply 
> lost if it's not transferred within a fixed interval of time.

Thank you very much for your comments and pointers. I will look into the
possibility to work with isochronous transfers. Due to the regularity
of the wrong report pattern, I'm suspecting that there is some ring
buffer involved, where dequeue and enqueue pointers are getting out of
sync. Unfortunately, I could not find a suspicious buffer looking at
the usbfs driver or libusb. 

Thank you very much again for your time and help.

Best
Thilo

