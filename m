Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260A7202621
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jun 2020 21:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbgFTTWy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jun 2020 15:22:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38096 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgFTTWx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jun 2020 15:22:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id f185so12095470wmf.3
        for <linux-usb@vger.kernel.org>; Sat, 20 Jun 2020 12:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=QUIfvm1HGnDuLD5hZ4u/pZPXV6C62z/iUQR6xq2Qf6g=;
        b=WYnNtU0oRzX1ZDk1wGv8nXJpvwu+odpw3UB5w3/4xSdN26arAhaw81CdPTO7mZJNmz
         unwTnNbtC4b0aJmVmh8sTc2FGl8uekZ2Gjm+gAvPfMQMwPDyOyZcZE2/g1DKv3HGkNMF
         HzHYZvTZZfHPndJ7kSOLAurMhqG5dRHhGP83VXLYm+XKZ/DLUGwCofCGOJWmqP2egINK
         ZEx7aKQinae6iqQSShm89zWCINFQsOOn29owGR+9gMUDhgMV2MM3mwyDwIDKv8Hy1aII
         LtnymiNyTI04ZbH3wLP5o/lqKYbIp351sZRFbf9dc1jgrjzuoBqBN+AmWibTeSp47G6y
         umdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=QUIfvm1HGnDuLD5hZ4u/pZPXV6C62z/iUQR6xq2Qf6g=;
        b=qyPuWwvxRLsMLnpLo2/P3IazAk2TAGPLS4cWaWMiz+8r+04lqHqr8ufg2T87S1MYhn
         4XTUIl1iP1whQqc/DDQPhIFur65K4pyCBqd10snJk9shaDOWWONPAnecLYUilVzOQlWS
         1xo4RDgW2YUPGrGJjC9lNNYMZ0LoB8iQxbDHlsXRREYyClDYrrYqvr7A9OiYZ5M0Cjl9
         kp0aKsHFUaEsNBmxi2LydLZBtVUHEHzGMFlkWuA97cwuGJr5OdS7NGtifWGowfAcUnPJ
         JixEwtCXP2qFyC5VnMmCCAWQlSQjIdwdP9J80osnHJ8Z0zitDJr0m9yMA4hImA1W/0OI
         rUTQ==
X-Gm-Message-State: AOAM530gHux3wiCH1MiI6vizO/3p20EixzcZe0pGtaO9Vgngaaa5wx2g
        UxjpIt+sLrWvO1pHevN0WMWWKflDIUw=
X-Google-Smtp-Source: ABdhPJyl9MK4rrNrkT+oAXXnhc0dAA2KgwgQe2FkN/oU7JkeWonut9m5VyqIk3HdzERuUySm1T2yrQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr10443186wmc.56.1592680908280;
        Sat, 20 Jun 2020 12:21:48 -0700 (PDT)
Received: from ping (x4dbf8150.dyn.telefonica.de. [77.191.129.80])
        by smtp.gmail.com with ESMTPSA id p7sm11455756wro.26.2020.06.20.12.21.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 12:21:47 -0700 (PDT)
Date:   Sat, 20 Jun 2020 21:19:13 +0200
From:   Fabian Melzow <fabian.melzow@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4
 comp_code 1
Message-ID: <20200620211913.1535bac0@ping>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks!

I have got a Canon LiDE 20 flatbed scanner (
ID 04a9:220d Canon, Inc. CanoScan N670U/N676U/LiDE 20).

When I power up my PC and plug it in everything is fine, until I try to
access it, and if it is only a "scanimage -L".

To demonstrate the bug, I wrote a shell script (scandebug.sh) using
some debugging hints from
https://bugzilla.kernel.org/show_bug.cgi?id=202541
which seems related to this bug.

#! /bin/bash
echo 'module xhci_* =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo Plug in scanner...
sleep 20
echo Now doing first scanimage -L ...
logger "Now doing first scanimage -L ..."
time scanimage -L
dmesg >/root/dmesg1.txt
cp /sys/kernel/debug/tracing/trace /root/trace1.txt
echo Now doing second scanimage -L ...
logger "Now doing second scanimage -L ..."
time scanimage -L
dmesg >/root/dmesg2.txt
cp /sys/kernel/debug/tracing/trace /root/trace2.txt
lsusb -v >/root/lsusb.txt
echo "module * =_" > /sys/kernel/debug/dynamic_debug/control
echo 0 > /sys/kernel/debug/tracing/events/xhci-hcd/enable

When it runs it outputs:

[root@ping ~]# ./scandebug.sh
Plug in scanner...
Now doing first scanimage -L ...
device `plustek:libusb:001:002' is a Canon CanoScan N670U/N676U/LiDE20
flatbed scanner

real    0m45,313s
user    0m0,036s
sys     0m0,067s
Now doing second scanimage -L ...
device `plustek:libusb:001:002' is a Canon CanoScan N670U/N676U/LiDE20
flatbed scanner

real    0m4,165s
user    0m0,044s
sys     0m0,070s

As you can see, the first scanimage takes very long, in other tries it
takes at least 25 seconds, while the second and any further always take
around 4 s.

After running the first scanimage I get the following errors/warnings:

Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: // Ding dong!
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: Successful Set TR Deq Ptr cmd, deq = @d7615080
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: // Ding dong!
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: Set TR Deq Ptr cmd, new deq seg = 00000000de74ec7f (0xd7615000 dma), new deq ptr = 00000000ff17b5e1 (0xd7615080 dma), new cycle = 1
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: New dequeue pointer = 0xd7615080 (DMA)
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: New dequeue segment = 00000000de74ec7f (virtual)
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: Cycle state = 0x1
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: Finding endpoint context
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: Removing canceled TD starting at 0xd7615070 (dma).
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: Stopped on Transfer TRB for slot 1 ep 4
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: // Ding dong!
Jun 20 19:42:15 ping kernel: xhci_hcd 0000:01:00.0: Cancel URB 00000000fa372bb8, dev 3, ep 0x82, starting at offset 0xd7615070
Jun 20 19:41:55 ping kernel: xhci_hcd 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000d address=0xdc707028 flags=0x0020]
Jun 20 19:41:55 ping kernel: xhci_hcd 0000:01:00.0: Looking for event-dma 00000000d7615060 trb-start 00000000d7615070 trb-end 00000000d7615070 seg-start 00000000d7615000 seg-end 00000000d7615ff0
Jun 20 19:41:55 ping kernel: xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 4 comp_code 1
Jun 20 19:41:55 ping kernel: xhci_hcd 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000d address=0xc9b4c730 flags=0x0020]
Jun 20 19:41:55 ping kernel: xhci_hcd 0000:01:00.0: ep 0x82 - asked for 1 bytes, 0 bytes untransferred
Jun 20 19:41:55 ping kernel: xhci_hcd 0000:01:00.0: WARN Successful completion on short TX
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: // Ding dong!
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: // Ding dong!
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: Slot state = 3, EP state = 2
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: // Ding dong!
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: Set TR Deq Ptr cmd, new deq seg = 00000000de74ec7f (0xd7615000 dma), new deq ptr = 00000000f035f701 (0xd7615060 dma), new cycle = 1
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: New dequeue pointer = 0xd7615060 (DMA)
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: New dequeue segment = 00000000de74ec7f (virtual)
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: Cycle state = 0x1
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: Finding endpoint context
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: Removing canceled TD starting at 0xd7615050 (dma).
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: // Ding dong!
Jun 20 19:41:54 ping kernel: xhci_hcd 0000:01:00.0: Cancel URB 000000002fee127b, dev 3, ep 0x82, starting at offset 0xd7615050


After the second scanimage -L I got no errors or warnings:

Jun 20 19:42:33 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jun 20 19:42:33 ping kernel: xhci_hcd 0000:09:00.3: Cancel URB 00000000e5885748, dev 2, ep 0x0, starting at offset 0xfedf51c0
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq Ptr cmd, deq = @fedf51c0
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new deq seg = 00000000fcf95654 (0xfedf5000 dma), new deq ptr = 000000001c042f08 (0xfedf51c0 dma), new cycle = 1
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer = 0xfedf51c0 (DMA)
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment = 00000000fcf95654 (virtual)
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: Cycle state = 0x1
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: Removing canceled TD starting at 0xfedf5190 (dma).
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: Stopped on Transfer TRB for slot 1 ep 0
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jun 20 19:42:28 ping kernel: xhci_hcd 0000:09:00.3: Cancel URB 00000000e5885748, dev 2, ep 0x0, starting at offset 0xfedf5190
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq Ptr cmd, deq = @fede7830
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep completion code of 1
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 00000000e5885748, len = 0, expected = 4, status = -32
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new deq seg = 0000000035cbb6da (0xfede7000 dma), new deq ptr = 00000000c7b3bb41 (0xfede7830 dma), new cycle = 1
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue state
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer = 0xfede7830 (DMA)
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment = 0000000035cbb6da (virtual)
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Cycle state = 0x1
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled endpoint ring
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for slot 2 ep 0
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Successful Set TR Deq Ptr cmd, deq = @fede7800
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Ignoring reset ep completion code of 1
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Giveback URB 00000000e5885748, len = 0, expected = 10, status = -32
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: // Ding dong!
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Set TR Deq Ptr cmd, new deq seg = 0000000035cbb6da (0xfede7000 dma), new deq ptr = 0000000025e70308 (0xfede7800 dma), new cycle = 1
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Queueing new dequeue state
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: New dequeue pointer = 0xfede7800 (DMA)
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: New dequeue segment = 0000000035cbb6da (virtual)
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Cycle state = 0x1
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Finding endpoint context
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Cleaning up stalled endpoint ring
Jun 20 19:42:23 ping kernel: xhci_hcd 0000:09:00.3: Stalled endpoint for slot 2 ep 0

I got no warnings after startup related to IOMMU or AMD-Vi:

[fabi@ping ~]$ dmesg|grep IOMMU
[    0.404420] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
[    0.408184] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    0.409389] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
[    0.424729] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[fabi@ping ~]$ dmesg|grep AMD-Vi
[    0.404420] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
[    0.408184] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    0.408185] pci 0000:00:00.2: AMD-Vi: Extended features (0xf77ef22294ada):
[    0.408187] AMD-Vi: Interrupt remapping enabled
[    0.408188] AMD-Vi: Virtual APIC enabled
[    0.408283] AMD-Vi: Lazy IO/TLB flushing enabled
[    0.424729] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>

Output of awk -f scripts/ver_linux:

Linux ping 5.7.4 #1 SMP PREEMPT Sat Jun 20 14:34:20 CEST 2020 x86_64 GNU/Linux

GNU C                   10.1.0
GNU Make                4.3
Binutils                2.34.0
Util-linux              2.35.2
Mount                   2.35.2
Module-init-tools       27
E2fsprogs               1.45.6
Jfsutils                1.1.15
Reiserfsprogs           3.6.27
Xfsprogs                5.6.0
PPP                     2.4.7
Bison                   3.6.3
Flex                    2.6.4
Linux C++ Library       6.0.28
Linux C Library         2.31
Dynamic linker (ldd)    2.31
Procps                  3.3.16
Net-tools               2.10
Kbd                     2.2.0
Console-tools           2.2.0
Sh-utils                8.32
Udev                    245
Modules Loaded          8021q acpi_cpufreq aesni_intel agpgart amdgpu asus_wmi battery ccp cdrom cec crc16 crc32c_generic crc32c_intel crc32_pclmul crct10dif_pclmul cryptd crypto_simd crypto_user dca drm drm_kms_helper edac_mce_amd eeepc_wmi evdev ext4 fat fb_sys_fops garp ghash_clmulni_intel glue_helper gpio_amdpt gpu_sched hid hid_generic hid_logitech_dj hid_logitech_hidpp i2c_algo_bit i2c_piix4 igb input_leds ip_tables irqbypass jbd2 joydev k10temp kvm kvm_amd ledtrig_audio libcrc32c llc mac_hid mbcache mousedev mrp mxm_wmi nf_conntrack nf_defrag_ipv4 nf_defrag_ipv6 nfnetlink nf_reject_ipv4 nf_reject_ipv6 nf_tables nft_ct nft_reject nft_reject_inet nls_cp437 nls_iso8859_1 pcspkr pinctrl_amd rc_core rfkill rng_core sg snd snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_core snd_hda_intel snd_hwdep snd_intel_dspcfg snd_pcm snd_timer soundcore sp5100_tco sparse_keymap sr_mod stp syscopyarea sysfillrect sysimgblt tpm tpm_crb tpm_tis tpm_tis_core ttm usbhid usbip_core usbip_host vfat wmi wmi_bmof xhci_hcd xhci_pci x_tables

CPU: AMD Ryzen 7 2700X Eight-Core Processor

The complete output of the above script along lspci -vvv, lsusb -v
and filtered journal (kernel messages and script markings) can be
downloaded from

http://fabi.bplaced.net/debuglogs1.tar.xz

Greats
Fabian Melzow
