Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C5273777
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 21:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbfGXTJ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 15:09:58 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]:36851 "EHLO
        mail-qk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfGXTJ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jul 2019 15:09:58 -0400
Received: by mail-qk1-f177.google.com with SMTP id g18so34575703qkl.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2019 12:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=H0pPV5jXCJMc/MGBJ6WnDMR0GKQBRuHzVsCkflsYsYQ=;
        b=Uv7lL66zeUIg0DQ/K7ZdYt2v0Z0Wckz5AiRS8sy2p8vEmQcjbI5LSJn5kbBRVq9KSf
         js4W7mi6fmim34h0gAVEQ/vaRJL5w6hKeMMNz0xkpo2WwJ4e6bEZsI7G0q7otL6e3t9p
         wdt7zJqRzrDqbKTwqVHYK8oBWNFyg3FhJnnnX4KL5j/rVdEUwsBlZOJ1bZJqG35MMbYx
         Oe3kGkthuMTtow6dYm4bCIVCvhk6pt+C3PmAmDmYy+wIBn2nVvKBgsUbxi+5nlOSLbvC
         HZHR9nlPREv/n/1dze/AbADzItNXlcZAXg5UMlCqzLIE9hHpze/9tRk2xfBErPO757Pp
         MVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=H0pPV5jXCJMc/MGBJ6WnDMR0GKQBRuHzVsCkflsYsYQ=;
        b=JnKQrQ2xWsVnQ08x/PHL4mXGHc8+bda5t5Pc8t5Qg0do0IH8D38qNacowoB7MLbv3e
         NQ7nf34R0UU9pwtLo9NSrmiJ9YzCf5dt3rUFRzXsGJ1meZ1f7ZrMTXZbTZgz/mANa2DY
         c7+89EpwEoNfI6773SeSBuH/fQL6UtNWO9CBPW/aaPelh6A6EuoXsDkXoQM+8cQuFESX
         /U9OIfbwsulnNEoSdrONKqXcyygvTdIFbUjnJs2A/IJpFaiQHGhQsj27E51nRQ2IUWU3
         dmvgJazJMzAlauOn1BRiqmy4se7iH9B0aLt40zZnj5of2hDtAEWpmuzRkY94OCEuxJ+R
         Pp7g==
X-Gm-Message-State: APjAAAVa1sb7C+OxaXWIh5KsxLUVUhYNpbA6F0flvt3aP6fQ3MYGKSvy
        w4YDTr6Me4JLANCiW+1IXSAwMDmmh5umdYcf2sqNicKarTc=
X-Google-Smtp-Source: APXvYqxWezeeNgnerE9uf3H3KeUMXO9yHPhsx7tfpCiDd0MCVwVEBF9by5PK2aPa0qqmxJiNuDDRPAjeId9ONN9Qr/w=
X-Received: by 2002:a37:7082:: with SMTP id l124mr50096139qkc.377.1563995396480;
 Wed, 24 Jul 2019 12:09:56 -0700 (PDT)
MIME-Version: 1.0
From:   Daniele Palmas <dnlplm@gmail.com>
Date:   Wed, 24 Jul 2019 21:09:45 +0200
Message-ID: <CAGRyCJGg8Z6PO1tuWJr9NgXgVEVgxC5jsbN_qSdEDT-t+pHehA@mail.gmail.com>
Subject: xhci-hcd errors with Qualcomm based modem and Asmedia ASM1042A
To:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

I've a system with kernel 4.14.127 that is showing unexpected xhci-hcd
(ASM1042A) errors with a Qualcomm based modem, when running the
following test:

- signal strength qmi requests looping every few seconds on
/dev/cdc-wdm (driver qmi_wwan)
- iperf tcp data connection test on the modem network interface

The issue is showing also with kernel 5.0

The issues is showing in three different ways:

First one:

2019-07-24 15:17:45.495293 kern.err kernel:xhci_hcd 0000:03:00.0:
ERROR Transfer event TRB DMA ptr not part of current TD ep_index 28
comp_code 13
2019-07-24 15:17:45.495392 kern.warning kernel:xhci_hcd 0000:03:00.0:
Looking for event-dma 000000007725b420 trb-start 000000007725b400
trb-end 000000007725b400 seg-start 000000007725b000 seg-end
000000007725bff0

The full kernel log is available at
https://drive.google.com/open?id=1FBjGhnc65vYks4MeOjliwmxA3FmCNbKw

usb devices list is availabe at
https://drive.google.com/open?id=1UgtwOaxGBcMc71CeOrlhxzPiHIADu1Cr

Second one:

2019-07-24 17:24:09.588826 kern.debug kernel:xhci_hcd 0000:03:00.0:
Set TR Deq Ptr cmd, new deq seg = ffff95c865e4e340 (0x77729000 dma),
new deq ptr = ffff95c877729fc0 (0x77729fc0 dma), new cycle = 0
2019-07-24 17:24:09.588838 kern.warning kernel:xhci_hcd 0000:03:00.0:
WARN Cannot submit Set TR Deq Ptr
2019-07-24 17:24:09.588847 kern.warning kernel:xhci_hcd 0000:03:00.0:
A Set TR Deq Ptr command is pending.
2019-07-24 17:24:09.588855 kern.debug kernel:xhci_hcd 0000:03:00.0: //
Ding dong!
2019-07-24 17:24:09.588863 kern.debug kernel:xhci_hcd 0000:03:00.0:
Giveback URB ffff95c84f01e900, len = 0, expected = 1500, status = -71
2019-07-24 17:24:09.650800 kern.debug kernel:xhci_hcd 0000:03:00.0:
WARN halted endpoint, queueing URB anyway.
2019-07-24 17:24:09.650861 kern.debug kernel:xhci_hcd 0000:03:00.0:
WARN halted endpoint, queueing URB anyway.
2019-07-24 17:24:09.653715 kern.debug kernel:xhci_hcd 0000:03:00.0:
Transfer error for slot 3 ep 29 on endpoint
2019-07-24 17:24:09.653774 kern.debug kernel:xhci_hcd 0000:03:00.0:
Cleaning up stalled endpoint ring
2019-07-24 17:24:09.653786 kern.debug kernel:xhci_hcd 0000:03:00.0:
Finding endpoint context
2019-07-24 17:24:09.653794 kern.debug kernel:xhci_hcd 0000:03:00.0:
Cycle state = 0x0
2019-07-24 17:24:09.653802 kern.debug kernel:xhci_hcd 0000:03:00.0:
New dequeue segment = ffff95c865e4e340 (virtual)
2019-07-24 17:24:09.653812 kern.debug kernel:xhci_hcd 0000:03:00.0:
New dequeue pointer = 0x77729fd0 (DMA)
2019-07-24 17:24:09.653822 kern.debug kernel:xhci_hcd 0000:03:00.0:
Queueing new dequeue state
2019-07-24 17:24:09.653863 kern.debug kernel:xhci_hcd 0000:03:00.0:
Set TR Deq Ptr cmd, new deq seg = ffff95c865e4e340 (0x77729000 dma),
new deq ptr = ffff95c877729fd0 (0x77729fd0 dma), new cycle = 0

The full kernel log is available at
https://drive.google.com/open?id=1zNQa-nGLA3F_5yka8c0-syUBcTe4L8W2

usb devices list is availabe at
https://drive.google.com/open?id=19bfAUfgF-jtiF--7eHgTo00mfwnLWMyf

Third one:

2019-07-24 17:41:45.233364 kern.debug kernel:xhci_hcd 0000:03:00.0: //
Ding dong!
2019-07-24 17:41:45.233372 kern.debug kernel:xhci_hcd 0000:03:00.0:
Giveback URB ffff95c84d46ce40, len = 0, expected = 1514, status = -71
2019-07-24 17:41:45.234647 kern.debug kernel:xhci_hcd 0000:03:00.0:
Ignoring reset ep completion code of 1
2019-07-24 17:41:45.237145 kern.debug kernel:xhci_hcd 0000:03:00.0:
Successful Set TR Deq Ptr cmd, deq = @777e7350
2019-07-24 17:41:45.242662 kern.debug kernel:xhci_hcd 0000:03:00.0:
Transfer error for slot 3 ep 28 on endpoint
2019-07-24 17:41:45.242698 kern.debug kernel:xhci_hcd 0000:03:00.0:
Cleaning up stalled endpoint ring
2019-07-24 17:41:45.242705 kern.debug kernel:xhci_hcd 0000:03:00.0:
Finding endpoint context
2019-07-24 17:41:45.242709 kern.debug kernel:xhci_hcd 0000:03:00.0:
Cycle state = 0x1
2019-07-24 17:41:45.242712 kern.debug kernel:xhci_hcd 0000:03:00.0:
New dequeue segment = ffff95c84f01dcc0 (virtual)
2019-07-24 17:41:45.242717 kern.debug kernel:xhci_hcd 0000:03:00.0:
New dequeue pointer = 0x777e7360 (DMA)
2019-07-24 17:41:45.242721 kern.debug kernel:xhci_hcd 0000:03:00.0:
Queueing new dequeue state
2019-07-24 17:41:45.242726 kern.debug kernel:xhci_hcd 0000:03:00.0:
Set TR Deq Ptr cmd, new deq seg = ffff95c84f01dcc0 (0x777e7000 dma),
new deq ptr = ffff95c8777e7360 (0x777e7360 dma), new cycle = 1

The full kernel log is available at
https://drive.google.com/file/d/1r4lyF6mcXJXwaAKb2dxIptMTsWCbxALg/view?usp=sharing

I'm not expert enough to understand if this is an xhci host issue or a
device one. Can someone help on this?

Thanks in advance,
Daniele
