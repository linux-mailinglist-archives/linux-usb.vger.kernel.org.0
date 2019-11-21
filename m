Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17197105751
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 17:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfKUQno convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 21 Nov 2019 11:43:44 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:56490 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfKUQnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 11:43:43 -0500
Received: from mail-pj1-f71.google.com ([209.85.216.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iXpYP-0001o2-09
        for linux-usb@vger.kernel.org; Thu, 21 Nov 2019 16:43:37 +0000
Received: by mail-pj1-f71.google.com with SMTP id d21so1507615pjs.21
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2019 08:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=wxqbh4eA00RwHvuYfVxIB4536m4sL6pivdS1HeUKKKk=;
        b=YxtjqTqM7JNHjy2ANkld30dsnBMJlluJmVTXTUtQonTfVGYLSVYh+kaJJZkTFkei3+
         cEk8Vq+Tt8D8wZJaRXpRtRyts5XeSrsKm7GmGZEW5arlg5NoJAFtwyVqXtXl2/4N4AUG
         TfxLhnRW1C9MFuD0VkmoCvcq7oMmOyxcFXhWx38fkGI0aO/7imnjWD7heULAvCbcxRtn
         I6hUZALMM6fZTg93ETS2gtDM9MPYosLXgBgEUJcRP0HwYuzNVQEu0PBmy+dwkSqXZmjT
         Z+IJdEALzsSEC9XumBKCOnl4LiGMrudCi0PVhIp6W0WkSiiev5eoBhWLVOh4WYj5MmWF
         4+PQ==
X-Gm-Message-State: APjAAAX2URvOOY9OpCwS2InLCF5kvbaZGRcWv0xWdhDXv7RNbq+JF+9m
        Mhl5qdOwly66XmFAAK62r9H6JZu4gYMtD6wC+2Az3QEgsb20FCBqv5nyJwsbaN16R82tIcv/7Jw
        ynjQHfPNWxBWA5CIDvLTgBwETLEbXoJfNuusoIQ==
X-Received: by 2002:a65:6803:: with SMTP id l3mr10465128pgt.293.1574354615247;
        Thu, 21 Nov 2019 08:43:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqztAAD9ockmR5hq9n0LbA7RIzG4IQKd7D/Q/Y1MKFcvPi3T78GYSpuc5AmNf84VjCuMW+Fs6A==
X-Received: by 2002:a65:6803:: with SMTP id l3mr10465041pgt.293.1574354614139;
        Thu, 21 Nov 2019 08:43:34 -0800 (PST)
Received: from 2001-b011-380f-3c42-fdb3-9820-72e8-2639.dynamic-ip6.hinet.net (2001-b011-380f-3c42-fdb3-9820-72e8-2639.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:fdb3:9820:72e8:2639])
        by smtp.gmail.com with ESMTPSA id r13sm4255538pfg.3.2019.11.21.08.43.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 08:43:33 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <4552b779-4b5a-7e81-39ec-0a4229b5d84d@linux.intel.com>
Date:   Fri, 22 Nov 2019 00:43:28 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <871B8184-D636-4F02-B9E9-B13A8BE078E8@canonical.com>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
 <4552b779-4b5a-7e81-39ec-0a4229b5d84d@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 21, 2019, at 19:48, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> On 21.11.2019 9.38, Kai-Heng Feng wrote:
>> Hi,
>> Currently there are two quirks for Dell TB16 to workaround an issue:
>> "xhci: Bad Ethernet performance plugged in ASM1042A host", and
>> "r8152: disable RX aggregation on Dell TB16 dock".
>> However, the issue wasn't analyzed and root caused. I'd like to understand what's really going on here.
>> Reverting those two patches, and as soon as doing TX/RX over the ethernet on TB16, xhci_hcd errors out:
>> [   69.803804] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.803807] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1010 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.803900] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.803901] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1020 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.803998] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.803999] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1030 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.804096] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.804099] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1040 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.955830] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.955847] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1050 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.956704] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.956718] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1060 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   69.963802] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   69.963819] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1070 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> [   70.112302] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
>> [   70.112321] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1080 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
>> So, under what circumstances the DMA pointer can be out of the TD?
> 
> When the TRB pointer field of the transfer event doesn't point to a TRB
> in the TD the xhci driver was expecting next.
> In your case xhci driver expects an event for a TD (TRB) at 0x47c4b0fe0
> 
> Looks like driver didn't get that event, or didn't handle it properly.
> Hardware continues processing TRBs in the ring, sending events for later TDs.
> 
> Your case looks something like this:
> endpoint ring segment 1: 256 TRBs (47c047c4b0000 -47c4b0ff0)
> 000000047c4b0000  1st TRB
> 000000047c4b0010  2nd TRB
> ....
> 000000047c4b0fd0  TRB that driver has handled
> 000000047c4b0fe0  TRB driver expect an event for
> 000000047c4b0ff0  LINK TRB, Last TRB of this segment, points to next segment. (probably pointing to 000000047c4b1000
> endpoint ring segment 2: 256 TRBs (probably 47c047c4b1000 -47c4b1ff0)
> 000000047c4b1000  TRB (Log donsn't cover this, probably hw competed?)
> 000000047c4b1010  TRB hardware has completed (short packet 13)
> 000000047c4b1020  TRB hardware has completed (short packet 13)
> 000000047c4b1030  TRB hardware has completed (short packet 13)
> 000000047c4b1040  TRB hardware has completed (short packet 13)
> 000000047c4b1050  TRB hardware has completed (short packet 13)
> 000000047c4b1060  TRB hardware has completed (short packet 13)
> 000000047c4b1070  TRB hardware has completed (short packet 13)
> 000000047c4b1080  TRB hardware has completed (short packet 13), hardware handling is here while software still waiting for an event for TRB at 47c4b0fe0
> 
> If you can get xhci traces, dmesg and a snapshot of the xhci event and transfer ring
> ring after this, we could see if hardware ever wrote the missing event to the event ring,
> or if driver just failed to handle it properly.

[  112.224838] rfkill: input handler disabled
[  434.653968] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32392 bytes untransferred
[  438.461323] xhci_hcd 0000:3f:00.0: Cancel URB 00000000c8b2b6a0, dev 1.5, ep 0x7, starting at offset 0x47ccc97b0
[  438.461338] xhci_hcd 0000:3f:00.0: // Ding dong!
[  438.461356] xhci_hcd 0000:3f:00.0: Cancel URB 00000000fb7b60a7, dev 1.5, ep 0x7, starting at offset 0x47ccc96f0
[  438.461367] xhci_hcd 0000:3f:00.0: Cancel URB 0000000008bbc1d8, dev 1.5, ep 0x7, starting at offset 0x47ccc9750
[  438.461988] xhci_hcd 0000:3f:00.0: Stopped on Transfer TRB for slot 4 ep 13
[  438.462000] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97b0 (dma).
[  438.462006] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97c0 (dma).
[  438.462009] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97d0 (dma).
[  438.462013] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97e0 (dma).
[  438.462017] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97f0 (dma).
[  438.462020] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9800 (dma).
[  438.462024] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9730 (dma).
[  438.462028] xhci_hcd 0000:3f:00.0: Finding endpoint context
[  438.462032] xhci_hcd 0000:3f:00.0: Cycle state = 0x0
[  438.462037] xhci_hcd 0000:3f:00.0: New dequeue segment = 000000002f634d54 (virtual)
[  438.462041] xhci_hcd 0000:3f:00.0: New dequeue pointer = 0x47ccc9740 (DMA)
[  438.462045] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9740 (dma).
[  438.462049] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9750 (dma).
[  438.462053] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9760 (dma).
[  438.462056] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9770 (dma).
[  438.462060] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9780 (dma).
[  438.462063] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc9790 (dma).
[  438.462067] xhci_hcd 0000:3f:00.0: Removing canceled TD starting at 0x47ccc97a0 (dma).
[  438.462074] xhci_hcd 0000:3f:00.0: Set TR Deq Ptr cmd, new deq seg = 000000002f634d54 (0x47ccc9000 dma), new deq ptr = 00000000872eb19e (0x47ccc9740 dma), new cycle = 0
[  438.462080] xhci_hcd 0000:3f:00.0: // Ding dong!
[  438.462304] xhci_hcd 0000:3f:00.0: Successful Set TR Deq Ptr cmd, deq = @47ccc9740
[  438.467571] xhci_hcd 0000:3f:00.0: xhci_drop_endpoint called for udev 0000000097a7fbc6
[  438.467613] xhci_hcd 0000:3f:00.0: drop ep 0x7, slot id 4, new drop flags = 0x4000, new add flags = 0x0
[  438.467621] xhci_hcd 0000:3f:00.0: xhci_check_bandwidth called for udev 0000000097a7fbc6
[  438.467633] xhci_hcd 0000:3f:00.0: // Ding dong!
[  438.468374] xhci_hcd 0000:3f:00.0: Successful Endpoint Configure command
[  443.093658] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32392 bytes untransferred
[  446.365530] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32656 bytes untransferred
[  446.366192] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 32480 bytes untransferred
...
[  447.067231] xhci_hcd 0000:3f:00.0: ep 0x81 - asked for 32768 bytes, 25048 bytes untransferred
[  447.067544] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.067553] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d010 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
[  447.076669] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.076682] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d020 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
[  447.175990] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.176009] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d030 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
[  447.189334] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.189350] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d040 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
[  447.375676] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.375690] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d050 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
[  447.376920] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.376930] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d060 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
[  447.386611] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.386628] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d070 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0
[  447.488879] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[  447.488891] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000049522d080 trb-start 000000049522cfe0 trb-end 000000049522cfe0 seg-start 000000049522c000 seg-end 000000049522cff0


> 
> I don't have a nice way of triggering ring dumping at some specific instance, but there
> is generic debugfs ring dump code in xhci-debugfs.c
> 
> (cat /sys/kernel/debug/usb/xhci/0000:3f:00.0/event-ring/trbs for sample output)

0x0000000498764000: TRB 0000000499941730 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764010: TRB 0000000499941740 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764020: TRB 0000000499941750 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764030: TRB 0000000499941760 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764040: TRB 0000000499941770 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764050: TRB 0000000499941780 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764060: TRB 0000000499941790 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764070: TRB 00000004999417a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764080: TRB 00000004999417b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764090: TRB 00000004999417c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987640a0: TRB 00000004999417d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987640b0: TRB 00000004999417e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987640c0: TRB 00000004999417f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987640d0: TRB 0000000499941800 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987640e0: TRB 0000000499941810 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987640f0: TRB 0000000499941820 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764100: TRB 0000000499941830 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764110: TRB 0000000499941840 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764120: TRB 0000000499941850 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764130: TRB 0000000499941860 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764140: TRB 0000000499941870 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764150: TRB 0000000499941880 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764160: TRB 0000000499941890 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764170: TRB 00000004999418a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764180: TRB 00000004999418b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764190: TRB 00000004999418c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987641a0: TRB 00000004999418d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987641b0: TRB 00000004999418e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987641c0: TRB 00000004999418f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987641d0: TRB 0000000499941900 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987641e0: TRB 0000000499941910 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987641f0: TRB 0000000499941920 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764200: TRB 0000000499941930 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764210: TRB 0000000499941940 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764220: TRB 0000000499941950 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764230: TRB 0000000499941960 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764240: TRB 0000000499941970 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764250: TRB 0000000499941980 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764260: TRB 0000000499941990 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764270: TRB 00000004999419a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764280: TRB 00000004999419b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764290: TRB 00000004999419c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987642a0: TRB 00000004999419d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987642b0: TRB 00000004999419e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987642c0: TRB 00000004999419f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987642d0: TRB 0000000499941a00 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987642e0: TRB 0000000499941a10 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987642f0: TRB 0000000499941a20 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764300: TRB 0000000499941a30 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764310: TRB 0000000499941a40 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764320: TRB 0000000499941a50 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764330: TRB 0000000499941a60 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764340: TRB 0000000499941a70 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764350: TRB 0000000499941a80 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764360: TRB 0000000499941a90 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764370: TRB 0000000499941aa0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764380: TRB 0000000499941ab0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764390: TRB 0000000499941ac0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987643a0: TRB 0000000499941ad0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987643b0: TRB 0000000499941ae0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987643c0: TRB 0000000499941af0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987643d0: TRB 0000000499941b00 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987643e0: TRB 0000000499941b10 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987643f0: TRB 0000000499941b20 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764400: TRB 0000000499941b30 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764410: TRB 0000000499941b40 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764420: TRB 0000000499941b50 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764430: TRB 0000000499941b60 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764440: TRB 0000000499941b70 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764450: TRB 0000000499941b80 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764460: TRB 0000000499941b90 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764470: TRB 0000000499941ba0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764480: TRB 0000000499941bb0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764490: TRB 0000000499941bc0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987644a0: TRB 0000000499941bd0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987644b0: TRB 0000000499941be0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987644c0: TRB 0000000499941bf0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987644d0: TRB 0000000499941c00 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987644e0: TRB 0000000499941c10 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987644f0: TRB 0000000499941c20 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764500: TRB 0000000499941c30 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764510: TRB 0000000499941c40 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764520: TRB 0000000499941c50 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764530: TRB 0000000499941c60 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764540: TRB 0000000499941c70 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764550: TRB 0000000499941c80 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764560: TRB 0000000499941c90 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764570: TRB 0000000499941ca0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764580: TRB 0000000499941cb0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764590: TRB 0000000499941cc0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987645a0: TRB 0000000499941cd0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987645b0: TRB 0000000499941ce0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987645c0: TRB 0000000499941cf0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987645d0: TRB 0000000499941d00 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987645e0: TRB 0000000499941d10 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987645f0: TRB 0000000499941d20 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764600: TRB 0000000499941d30 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764610: TRB 0000000499941d40 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764620: TRB 0000000499941d50 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764630: TRB 0000000499941d60 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764640: TRB 0000000499941d70 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764650: TRB 0000000499941d80 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764660: TRB 0000000499941d90 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764670: TRB 0000000499941da0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764680: TRB 0000000499941db0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764690: TRB 0000000499941dc0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987646a0: TRB 0000000499941dd0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987646b0: TRB 0000000499941de0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987646c0: TRB 0000000499941df0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987646d0: TRB 0000000499941e00 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987646e0: TRB 0000000499941e10 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987646f0: TRB 0000000499941e20 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764700: TRB 0000000499941e30 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764710: TRB 0000000499941e40 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764720: TRB 0000000499941e50 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764730: TRB 0000000499941e60 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764740: TRB 0000000499941e70 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764750: TRB 0000000499941e80 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764760: TRB 0000000499941e90 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764770: TRB 0000000499941ea0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764780: TRB 0000000499941eb0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764790: TRB 0000000499941ec0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987647a0: TRB 0000000499941ed0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987647b0: TRB 0000000499941ee0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987647c0: TRB 0000000499941ef0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987647d0: TRB 0000000499941f00 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987647e0: TRB 0000000499941f10 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x00000004987647f0: TRB 0000000499941f20 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764800: TRB 0000000499941f30 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764810: TRB 0000000499941f40 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764820: TRB 0000000499941f50 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764830: TRB 0000000499941f60 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764840: TRB 0000000499941f70 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764850: TRB 0000000499941f80 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764860: TRB 0000000499941f90 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:C
0x0000000498764870: TRB 0000000499940f90 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764880: TRB 0000000499940fa0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764890: TRB 0000000499940fb0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987648a0: TRB 0000000499940fc0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987648b0: TRB 0000000499940fd0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987648c0: TRB 0000000499940fe0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987648d0: TRB 0000000499941000 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987648e0: TRB 0000000499941010 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987648f0: TRB 0000000499941020 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764900: TRB 0000000499941030 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764910: TRB 0000000499941040 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764920: TRB 0000000499941050 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764930: TRB 0000000499941060 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764940: TRB 0000000499941070 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764950: TRB 0000000499941080 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764960: TRB 0000000499941090 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764970: TRB 00000004999410a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764980: TRB 00000004999410b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764990: TRB 00000004999410c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987649a0: TRB 00000004999410d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987649b0: TRB 00000004999410e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987649c0: TRB 00000004999410f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987649d0: TRB 0000000499941100 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987649e0: TRB 0000000499941110 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x00000004987649f0: TRB 0000000499941120 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a00: TRB 0000000499941130 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a10: TRB 0000000499941140 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a20: TRB 0000000499941150 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a30: TRB 0000000499941160 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a40: TRB 0000000499941170 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a50: TRB 0000000499941180 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a60: TRB 0000000499941190 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a70: TRB 00000004999411a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a80: TRB 00000004999411b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764a90: TRB 00000004999411c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764aa0: TRB 00000004999411d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ab0: TRB 00000004999411e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ac0: TRB 00000004999411f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ad0: TRB 0000000499941200 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ae0: TRB 0000000499941210 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764af0: TRB 0000000499941220 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b00: TRB 0000000499941230 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b10: TRB 0000000499941240 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b20: TRB 0000000499941250 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b30: TRB 0000000499941260 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b40: TRB 0000000499941270 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b50: TRB 0000000499941280 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b60: TRB 0000000499941290 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b70: TRB 00000004999412a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b80: TRB 00000004999412b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764b90: TRB 00000004999412c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ba0: TRB 00000004999412d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764bb0: TRB 00000004999412e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764bc0: TRB 00000004999412f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764bd0: TRB 0000000499941300 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764be0: TRB 0000000499941310 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764bf0: TRB 0000000499941320 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c00: TRB 0000000499941330 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c10: TRB 0000000499941340 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c20: TRB 0000000499941350 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c30: TRB 0000000499941360 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c40: TRB 0000000499941370 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c50: TRB 0000000499941380 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c60: TRB 0000000499941390 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c70: TRB 00000004999413a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c80: TRB 00000004999413b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764c90: TRB 00000004999413c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ca0: TRB 00000004999413d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764cb0: TRB 00000004999413e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764cc0: TRB 00000004999413f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764cd0: TRB 0000000499941400 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ce0: TRB 0000000499941410 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764cf0: TRB 0000000499941420 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d00: TRB 0000000499941430 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d10: TRB 0000000499941440 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d20: TRB 0000000499941450 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d30: TRB 0000000499941460 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d40: TRB 0000000499941470 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d50: TRB 0000000499941480 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d60: TRB 0000000499941490 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d70: TRB 00000004999414a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d80: TRB 00000004999414b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764d90: TRB 00000004999414c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764da0: TRB 00000004999414d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764db0: TRB 00000004999414e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764dc0: TRB 00000004999414f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764dd0: TRB 0000000499941500 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764de0: TRB 0000000499941510 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764df0: TRB 0000000499941520 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e00: TRB 0000000499941530 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e10: TRB 0000000499941540 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e20: TRB 0000000499941550 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e30: TRB 0000000499941560 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e40: TRB 0000000499941570 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e50: TRB 0000000499941580 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e60: TRB 0000000499941590 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e70: TRB 00000004999415a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e80: TRB 00000004999415b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764e90: TRB 00000004999415c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ea0: TRB 00000004999415d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764eb0: TRB 00000004999415e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ec0: TRB 00000004999415f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ed0: TRB 0000000499941600 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ee0: TRB 0000000499941610 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ef0: TRB 0000000499941620 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f00: TRB 0000000499941630 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f10: TRB 0000000499941640 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f20: TRB 0000000499941650 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f30: TRB 0000000499941660 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f40: TRB 0000000499941670 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f50: TRB 0000000499941680 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f60: TRB 0000000499941690 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f70: TRB 00000004999416a0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f80: TRB 00000004999416b0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764f90: TRB 00000004999416c0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764fa0: TRB 00000004999416d0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764fb0: TRB 00000004999416e0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764fc0: TRB 00000004999416f0 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764fd0: TRB 0000000499941700 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764fe0: TRB 0000000499941710 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c
0x0000000498764ff0: TRB 0000000499941720 status 'Success' len 0 slot 3 ep 7 type 'Transfer Event' flags e:c


> -Mathias

