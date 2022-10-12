Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A776E5FC778
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 16:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiJLOgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 10:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiJLOgH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 10:36:07 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42167E03B
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 07:36:05 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso1351071wmb.5
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D54Nl7CHWXEn6gvb8f5Rqi+gPtua1r3tUpmQaR9Tyug=;
        b=q4qZ+vXd+Yaxl+oDMzus70uhXgKvB7rLnkdsHhj57UlZZ0DQGxooCq+Z3hbJKn1W4i
         i2hgvJ7pMLh0en1QXa9HAKzy15cfV83vzx7cD64ccr7oQw6/kPT8hJjCQibCe3lSYZEK
         deRIhlIh2I8KV44czwTTdvvg1iCHmdxgg4OL4LiWbtZtoqgo/zUESJYyzydPq/cK/N3R
         nPf7WbkdJKCflSGqBf4bGwrq9llW+QtIiB8hofVZ9ewXW0uNaNSwh85B8ACb5yT6MgPh
         HDBjIDPUIgmahsLgeIyA+cyUfMpkO9XbfmD935cj01kJxeSd3dRG1Nv/wNyB9vmT35yE
         cBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D54Nl7CHWXEn6gvb8f5Rqi+gPtua1r3tUpmQaR9Tyug=;
        b=BDN8SopXHptnVTySwI3NAmHvGkPQiPesoW7ybTocMrkb9i9qQaICRa/BE0AvAuBVB3
         Dxc9y7h9d46obAJE9lOXKIvtkCCT35H1vp7rp8BZcMH8V/hMnXlhm4//sB8ARZLvcugG
         2EtK/Bk/OvjFoTiOp7SQNKIjebGwg3F8uBbsl3yB8oiZVIJadt3GJEJ1ZvwiHKjm3pRa
         1GluVvWmabmOzWidV0g7GyA6AS/O75zhbEGGZDhgekHDOxaFdfGWIEf+57KB+DcdDum+
         0wTFcjesDYW0Dl/kpHxl55y2/Pqv2t6mljLTL3leLzb0+hp8Fnlas9r4dxoff0VTehad
         6TDQ==
X-Gm-Message-State: ACrzQf09FzWTweT440+Q9ZReMGNWHkyU3oCtSwrR4YmTU4a+DXaKB6ys
        AtebYgVmIk4aTbHDb2SsA4IAMBv0HmkDZbYaGZqvs/+RAQ==
X-Google-Smtp-Source: AMsMyM72Df5GO0eEQUEqWOCWvegy1tMb7/vYKBM6SmvZKytxTqBWQSO3QSj/0kODbznbLCND7Y1uAVPsO7REKmGYtVA=
X-Received: by 2002:a05:600c:490f:b0:3c6:2c21:97f6 with SMTP id
 f15-20020a05600c490f00b003c62c2197f6mr2975207wmp.177.1665585363248; Wed, 12
 Oct 2022 07:36:03 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?VGhpbG8gUsO2cmln?= <thilo.roerig@googlemail.com>
Date:   Wed, 12 Oct 2022 16:35:52 +0200
Message-ID: <CAFfCzSuUce=W349CnvtOFs8mYnyevNdXjKJ61eyhE0jpvH8b8g@mail.gmail.com>
Subject: Receiving report multiple times when changing cpu
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear maintainer, dear community,

I'm new to looking into the linux kernel, but am hoping that this is the
right spot to address my problem.
Otherwise I would be very thankful, if you could point me in the right
direction.

I have a problem with a custom usb device on a raspberry pi running a
buildroot 64bit linux with a v5.19.14 kernel.
I ran into a problem reading data from a custom usb hid device using
interrupt transfers. I'm using
the python hidapi library (https://pypi.org/project/hidapi/) with the
libusb backend. After sending
a custom command to the device, the driver changes from usbhid to usbfs.
The device starts sending
reports of size 1023 bytes to endpoint 0x83. `usb-devices` yields the
following output:

T:  Bus=3D3D01 Lev=3D3D03 Prnt=3D3D13 Port=3D3D00 Cnt=3D3D01 Dev#=3D3D 14 S=
pd=3D3D480 MxC=3D
h=3D3D 0
D:  Ver=3D3D 2.00 Cls=3D3D00(>ifc ) Sub=3D3D00 Prot=3D3D00 MxPS=3D3D64 #Cfg=
s=3D3D  1
C:  #Ifs=3D3D 1 Cfg#=3D3D 1 Atr=3D3D80 MxPwr=3D3D500mA
I:  If#=3D3D 0 Alt=3D3D 0 #EPs=3D3D 1 Cls=3D3D03(HID  ) Sub=3D3D00 Prot=3D3=
D00 Driver=3D
=3D3Dusbfs
E:  Ad=3D3D83(I) Atr=3D3D03(Int.) MxPS=3D3D1024 Ivl=3D3D125us

The reports are numbered by an increasing report id and are available via
interrupt transfer approx. every
230 microseconds (1.85 microframes). The device does not retain any old
reports.

Initially, I get all reports in the correct order, but after some time I
start getting reports that I have already
received previously. The report ids start to include a shift after a
certain number of reports and
schematically they look like the following:

... 1,2,...,578,  238,239,...,816,  476,477,...,1054, and so on

So there is approximately the same number of consecutive "forward" reports
followed by a jump "backwards"
by approximately the same number of reports. I snooped the transferred data
using the `usbcore.usbfs_snoop` kernel
parameter but this slowed things down, so that I started missing reports
and could not reproduce the problem.
Then I traced the `xhci-hcd` events and observed that the pattern started
to occur, when my python process was
rescheduled from one cpu-core to another

...
          python-22331   [000] ..... 174497.068723: xhci_urb_enqueue:
ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length 0/1024
sgs 0/0 stream 0 flags 00010200
          python-22331   [000] d.... 174497.068727: xhci_queue_trb:
INTR: Buffer 00000004669c9800 length 1024 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:c
          python-22331   [000] d.... 174497.068728: xhci_inc_enq: INTR
000000006122f915: enq 0x00000004526bf8f0(0x00000004526bf000) deq
0x00000004526bf8e0(0x00000004526bf000) segs 2 stream 0 free_trbs 500
bounce 1024 cycle 1
          python-22331   [000] d.... 174497.068729:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
          <idle>-0       [000] d.h.. 174497.068811: xhci_handle_event:
EVENT: TRB 00000004526bf8e0 status 'Short Packet' len 1 slot 3 ep 7
type 'Transfer Event' flags e:c
          <idle>-0       [000] d.h.. 174497.068814:
xhci_handle_transfer: INTR: Buffer 00000004669c9800 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
          <idle>-0       [000] d.h.. 174497.068820: xhci_inc_deq: INTR
000000006122f915: enq 0x00000004526bf8f0(0x00000004526bf000) deq
0x00000004526bf8f0(0x00000004526bf000) segs 2 stream 0 free_trbs 501
bounce 1024 cycle 1
          <idle>-0       [000] d.h.. 174497.068822: xhci_urb_giveback:
ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length
1023/1024 sgs 0/0 stream 0 flags 00010200
          <idle>-0       [000] d.h.. 174497.068824: xhci_inc_deq:
EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
0x0000000440f9f620(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
bounce 0 cycle 0
          python-22331   [000] ..... 174497.068894: xhci_urb_enqueue:
ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length 0/1024
sgs 0/0 stream 0 flags 00010200
          python-22331   [000] d.... 174497.068899: xhci_queue_trb:
INTR: Buffer 00000004669c9800 length 1024 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:c
          python-22331   [000] d.... 174497.068900: xhci_inc_enq: INTR
000000006122f915: enq 0x00000004526bf900(0x00000004526bf000) deq
0x00000004526bf8f0(0x00000004526bf000) segs 2 stream 0 free_trbs 500
bounce 1024 cycle 1
          python-22331   [000] d.... 174497.068901:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
          <idle>-0       [000] d.h.. 174497.069954: xhci_handle_event:
EVENT: TRB 00000004526bf8f0 status 'Short Packet' len 1 slot 3 ep 7
type 'Transfer Event' flags e:c
          <idle>-0       [000] d.h.. 174497.069957:
xhci_handle_transfer: INTR: Buffer 00000004669c9800 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
          <idle>-0       [000] d.h.. 174497.069959: xhci_inc_deq: INTR
000000006122f915: enq 0x00000004526bf900(0x00000004526bf000) deq
0x00000004526bf900(0x00000004526bf000) segs 2 stream 0 free_trbs 501
bounce 1024 cycle 1
          <idle>-0       [000] d.h.. 174497.069961: xhci_urb_giveback:
ep3in-intr: urb 0000000070a812bc pipe 1073852544 slot 3 length
1023/1024 sgs 0/0 stream 0 flags 00010200
          <idle>-0       [000] d.h.. 174497.069962: xhci_inc_deq:
EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
0x0000000440f9f630(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
bounce 0 cycle 0
          python-22331   [003] ..... 174497.070160: xhci_urb_enqueue:
ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length 0/1024
sgs 0/0 stream 0 flags 00010200
          python-22331   [003] d.... 174497.070171: xhci_queue_trb:
INTR: Buffer 00000004799b0000 length 1024 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:c
          python-22331   [003] d.... 174497.070172: xhci_inc_enq: INTR
000000006122f915: enq 0x00000004526bf910(0x00000004526bf000) deq
0x00000004526bf900(0x00000004526bf000) segs 2 stream 0 free_trbs 500
bounce 1024 cycle 1
          python-22331   [003] d.... 174497.070174:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
          <idle>-0       [000] d.h.. 174497.071201: xhci_handle_event:
EVENT: TRB 00000004526bf900 status 'Short Packet' len 1 slot 3 ep 7
type 'Transfer Event' flags e:c
          <idle>-0       [000] d.h.. 174497.071204:
xhci_handle_transfer: INTR: Buffer 00000004799b0000 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
          <idle>-0       [000] d.h.. 174497.071206: xhci_inc_deq: INTR
000000006122f915: enq 0x00000004526bf910(0x00000004526bf000) deq
0x00000004526bf910(0x00000004526bf000) segs 2 stream 0 free_trbs 501
bounce 1024 cycle 1
          <idle>-0       [000] d.h.. 174497.071208: xhci_urb_giveback:
ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length
1023/1024 sgs 0/0 stream 0 flags 00010200
          <idle>-0       [000] d.h.. 174497.071210: xhci_inc_deq:
EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
0x0000000440f9f640(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
bounce 0 cycle 0
          python-22331   [003] ..... 174497.071269: xhci_urb_enqueue:
ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length 0/1024
sgs 0/0 stream 0 flags 00010200
          python-22331   [003] d.... 174497.071272: xhci_queue_trb:
INTR: Buffer 00000004799b0000 length 1024 TD size 0 intr 0 type
'Normal' flags b:i:I:c:s:I:e:c
          python-22331   [003] d.... 174497.071273: xhci_inc_enq: INTR
000000006122f915: enq 0x00000004526bf920(0x00000004526bf000) deq
0x00000004526bf910(0x00000004526bf000) segs 2 stream 0 free_trbs 500
bounce 1024 cycle 1
          python-22331   [003] d.... 174497.071274:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep3in
          <idle>-0       [000] d.h.. 174497.072330: xhci_handle_event:
EVENT: TRB 00000004526bf910 status 'Short Packet' len 1 slot 3 ep 7
type 'Transfer Event' flags e:c
          <idle>-0       [000] d.h.. 174497.072331:
xhci_handle_transfer: INTR: Buffer 00000004799b0000 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:C
          <idle>-0       [000] d.h.. 174497.072332: xhci_inc_deq: INTR
000000006122f915: enq 0x00000004526bf920(0x00000004526bf000) deq
0x00000004526bf920(0x00000004526bf000) segs 2 stream 0 free_trbs 501
bounce 1024 cycle 1
          <idle>-0       [000] d.h.. 174497.072334: xhci_urb_giveback:
ep3in-intr: urb 00000000a553f707 pipe 1073852544 slot 3 length
1023/1024 sgs 0/0 stream 0 flags 00010200
          <idle>-0       [000] d.h.. 174497.072334: xhci_inc_deq:
EVENT 000000002a1d7c0b: enq 0x0000000440f9c000(0x0000000440f9c000) deq
0x0000000440f9f650(0x0000000440f9f000) segs 8 stream 0 free_trbs 2039
bounce 0 cycle 0
...

Unfortunately, I do not understand the details of the linux usb stack in
depth and the details of
this log enough to know where to look any further. I am hoping to get some
help or pointers to
how to attack my problem. I have tried using different libraries (hidapi C,
libusb), linux systems
(raspberry pi OS, ubuntu), but the problem persisted.

Thank you very much for taking the time for reading about my problem and
thank you in advance
for any advice.

Best
Thilo R=C3=B6rig
