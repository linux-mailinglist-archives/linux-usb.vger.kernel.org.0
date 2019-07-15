Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF5DD694AB
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2019 16:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391989AbfGOOxP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jul 2019 10:53:15 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37325 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391606AbfGOO3s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jul 2019 10:29:48 -0400
Received: by mail-io1-f65.google.com with SMTP id q22so34387038iog.4
        for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2019 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:openpgp:autocrypt:message-id:date:user-agent
         :mime-version:content-language;
        bh=7hB00gm0sXpE/mjToVW4FujCGkhYoIFZc4y7fvipPl8=;
        b=NERaW9hlpPvcc08+0YApzAAvYFngBilCWyHMQfBXg/O8oHuutwD4eFTEv40wWgB+Q8
         P15CRkJ54dHMvOzG8M0oBiEG2nElqXUPHQvK5ajXG7VLecTE4YBtKTAV34W6YYOfTbkB
         SVlXK/4vQ4ktO1WpDSzOhfq9RIvqnmga65PCyR8/Gx7dNxOtFqQPkcUz8cJ3mDuYFdkM
         5bkfki6R+DHmBDcx9bJv5+mfK3IlBJvWh3RAs9ILoSK2Ugln4K2mD25v4fZGaVEFwEZj
         KmbNinkNJL6wHa3M0D6OPhhdXF6vP1m4dCW91CMmw4C6HjOc247yRlaVZB+R7yF1llRa
         AfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:content-language;
        bh=7hB00gm0sXpE/mjToVW4FujCGkhYoIFZc4y7fvipPl8=;
        b=FxMAmSm6mtC41MoEB48GtArdoOgekuvHk2IAXCRKgD2B0tPdIxwyaUzC4eNZZmSQdx
         zF7PO3koYcR6qNvmwVpHll8QAIgsZHsuFP3JBWDc+yxQ9dDUXKzgCiEU8a/ZsNBJxwPy
         U7ksLtMBCMBhXF0WKWovYbSlcPezMOErFI8lo9MxP/mn4Ccd0wiI7UmntVNEWXVDRXkn
         ESZQ4w+TCMnHqmPruT+fEFs7xO5ZPqX2kqzLe2qYQhLM02y0prahhlUYNnUxCk3tO5ue
         OcaAEqYfvkBI1Ps07LqMoZIZ32bgLM7HCuW3TbLDXDS3WGW59GOLpR6goZ6t3pDm896h
         pFWw==
X-Gm-Message-State: APjAAAW2mxMgPm6saCYFwfxrfpkKh/praF6T8Ze+481vILR+cj3bkUwC
        /ZtF6ZVLpMcEwPuKtYxciMZ2rO7f
X-Google-Smtp-Source: APXvYqxktZ2Hxy+0AlxydXNRWNORgTn1PWNvvCYPyY7BEv0dH9SR5/Jo9NnWKy3JvblA8kSjeuDJhA==
X-Received: by 2002:a02:bb08:: with SMTP id y8mr28229308jan.51.1563200987313;
        Mon, 15 Jul 2019 07:29:47 -0700 (PDT)
Received: from [192.168.0.2] (24.115.222.54.res-cmts.sha2.ptd.net. [24.115.222.54])
        by smtp.gmail.com with ESMTPSA id j25sm21388008ioj.67.2019.07.15.07.29.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 07:29:46 -0700 (PDT)
From:   John Yost <alleytrotter@gmail.com>
X-Google-Original-From: John Yost <AlleyTrotter@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: External USB write error
Openpgp: preference=signencrypt
Autocrypt: addr=AlleyTrotter@gmail.com; prefer-encrypt=mutual; keydata=
 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
 hNM2gsEMEXJSarliig==
Message-ID: <e51e0b53-9052-0033-4996-82775e0c2ceb@gmail.com>
Date:   Mon, 15 Jul 2019 10:29:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------3A31252486D23C49EAA7F72F"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------3A31252486D23C49EAA7F72F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I am encountering the following bug in 5.2.0 and 5.2.1 when trying to
write to

an external USB-3.0 disk.


The terminal locks and is only recoverable with the reset button





Jul 12 11:16:12 NVMe kernel: [  123.758841] xhci_hcd 0000:07:00.0:
swiotlb buffer is full (sz: 348160 bytes), total 32768 (slots), used 1
(slots)
Jul 12 11:16:12 NVMe kernel: [  123.758845] xhci_hcd 0000:07:00.0:
overflow 0x00000007c67ab000+348160 of DMA mask ffffffff bus mask 0

Jul 12 11:16:12 NVMe kernel: [  123.758856] WARNING: CPU: 0 PID: 924 at
kernel/dma/direct.c:43 report_addr+0x2f/0x90

Jul 12 11:16:12 NVMe kernel: [  123.758857] Modules linked in: ipv6
xt_limit xt_pkttype ipt_REJECT nf_reject_ipv4 xt_tcpudp nf_log_ipv4
nf_log_common xt_LOG xt_conntrack iptable_mangle iptable_nat
iptable_filter nf_conntrack_irc nf_nat_ftp nf_conntrack_ftp nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_tables x_tables cfg80211
rfkill hid_generic usbhid hid fuse uas usb_storage snd_hda_codec_hdmi
coretemp intel_rapl x86_pkg_temp_thermal intel_powerclamp
snd_hda_codec_realtek kvm_intel snd_hda_codec_generic ledtrig_audio kvm
irqbypass i2c_dev mxm_wmi crct10dif_pclmul crc32_pclmul i915
crc32c_intel cec rc_core drm_kms_helper ghash_clmulni_intel
snd_hda_intel drm snd_hda_codec intel_cstate snd_hda_core intel_gtt
snd_hwdep intel_rapl_perf snd_pcm snd_timer evdev agpgart i2c_algo_bit
serio_raw fb_sys_fops snd syscopyarea sysfillrect tg3 sysimgblt i2c_i801
xhci_pci soundcore mei_me xhci_hcd lpc_ich i2c_core ehci_pci libphy mei
ehci_hcd ie31200_edac hwmon wmi video pcc_cpufreq intel_smartconnect
button loop
Jul 12 11:16:12 NVMe kernel: [  123.758903] CPU: 0 PID: 924 Comm:
usb-storage Not tainted 5.2.0 #3

Jul 12 11:16:12 NVMe kernel: [  123.758904] Hardware name: To Be Filled
By O.E.M. To Be Filled By O.E.M./Z77 Extreme4, BIOS P2.90 07/11/2013

Jul 12 11:16:12 NVMe kernel: [  123.758907] RIP:
0010:report_addr+0x2f/0x90

Jul 12 11:16:12 NVMe kernel: [  123.758909] Code: 48 83 ec 08 48 8b 87
28 02 00 00 48 89 34 24 48 85 c0 74 29 4c 8b 00 b8 fe ff ff ff 49 39 c0
76 10 80 3d 43 cf a7 01 00 74 31 <0f> 0b 48 83 c4 08 c3 48 83 bf 38 02
00 00 00 75 e6 eb ed 80 3d 28

Jul 12 11:16:12 NVMe kernel: [  123.758911] RSP: 0018:ffffa46203ef7bc8
EFLAGS: 00010282

Jul 12 11:16:12 NVMe kernel: [  123.758912] RAX: 0000000000000000 RBX:
ffff90f1fb5b30b0 RCX: 0000000000000006

Jul 12 11:16:12 NVMe kernel: [  123.758913] RDX: 0000000000000000 RSI:
0000000000000082 RDI: ffff90f1ff4164c0

Jul 12 11:16:12 NVMe kernel: [  123.758914] RBP: 0000000000055000 R08:
000000000001279c R09: 0000000000000384

Jul 12 11:16:12 NVMe kernel: [  123.758915] R10: 0000000000000000 R11:
0000000000000384 R12: ffff90f1fb5b30b0

Jul 12 11:16:12 NVMe kernel: [  123.758916] R13: 0000000000000001 R14:
0000000000000000 R15: ffff90f1f13102b0

Jul 12 11:16:12 NVMe kernel: [  123.758918] FS:  0000000000000000(0000)
GS:ffff90f1ff400000(0000) knlGS:0000000000000000

Jul 12 11:16:12 NVMe kernel: [  123.758919] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033

Jul 12 11:16:12 NVMe kernel: [  123.758921] CR2: 000000000189b000 CR3:
0000000320a0a005 CR4: 00000000001606f0

Jul 12 11:16:12 NVMe kernel: [  123.758921] Call Trace:
Jul 12 11:16:12 NVMe kernel: [  123.758927]  dma_direct_map_page+0xd9/0xf0
Jul 12 11:16:12 NVMe kernel: [  123.758930]  dma_direct_map_sg+0x64/0xb0
Jul 12 11:16:12 NVMe kernel: [  123.758934]
usb_hcd_map_urb_for_dma+0x3d1/0x540
Jul 12 11:16:12 NVMe kernel: [  123.758937]  usb_hcd_submit_urb+0x84/0xa00
Jul 12 11:16:12 NVMe kernel: [  123.758941]  ? schedule_timeout+0x1dc/0x2f0
Jul 12 11:16:12 NVMe kernel: [  123.758943]  ? usb_hcd_submit_urb+0xa9/0xa00
Jul 12 11:16:12 NVMe kernel: [  123.758946]  ? __switch_to_asm+0x40/0x70
Jul 12 11:16:12 NVMe kernel: [  123.758948]  ? _cond_resched+0x16/0x40
Jul 12 11:16:12 NVMe kernel: [  123.758951]  ? __kmalloc+0x5d/0x200
Jul 12 11:16:12 NVMe kernel: [  123.758954]  ? usb_alloc_urb+0x24/0x60
Jul 12 11:16:12 NVMe kernel: [  123.758956]  usb_sg_wait+0x64/0x110
Jul 12 11:16:12 NVMe kernel: [  123.758963]
usb_stor_bulk_transfer_sglist.part.4+0x69/0xc0 [usb_storage]
Jul 12 11:16:12 NVMe kernel: [  123.758967]  usb_stor_bulk_srb+0x68/0x80
[usb_storage]
Jul 12 11:16:12 NVMe kernel: [  123.758971]
usb_stor_Bulk_transport+0x184/0x3e0 [usb_storage]
Jul 12 11:16:12 NVMe kernel: [  123.758973]  ? schedule+0x33/0x90
Jul 12 11:16:12 NVMe kernel: [  123.758976]
usb_stor_invoke_transport+0x3a/0x4e0 [usb_storage]
Jul 12 11:16:12 NVMe kernel: [  123.758979]  ?
wait_for_completion_interruptible+0xaf/0x170
Jul 12 11:16:12 NVMe kernel: [  123.758983]  ? wake_up_q+0x80/0x80
Jul 12 11:16:12 NVMe kernel: [  123.758986]
usb_stor_control_thread+0x165/0x270 [usb_storage]
Jul 12 11:16:12 NVMe kernel: [  123.758990]  ?
fill_inquiry_response+0x20/0x20 [usb_storage]
Jul 12 11:16:12 NVMe kernel: [  123.758993]  kthread+0xf8/0x130
Jul 12 11:16:12 NVMe kernel: [  123.758996]  ?
kthread_destroy_worker+0x40/0x40
Jul 12 11:16:12 NVMe kernel: [  123.758999]  ret_from_fork+0x35/0x40
Jul 12 11:16:12 NVMe kernel: [  123.759001] ---[ end trace
10d0ae5c82ba2fb9 ]---
Jul 12 11:16:12 NVMe kernel: [  123.759072] xhci_hcd 0000:07:00.0:
swiotlb buffer is full (sz: 348160 bytes), total 32768 (slots), used 1
(slots)
Jul 12 11:16:12 NVMe kernel: [  123.759141] xhci_hcd 0000:07:00.0:
swiotlb buffer is full (sz: 348160 bytes), total 32768 (slots), used 1
(slots)
Jul 12 11:16:12 NVMe kernel: [  123.759210] xhci_hcd 0000:07:00.0:
swiotlb buffer is full (sz: 348160 bytes), total 32768 (slots), used 1
(slots)
Jul 12 11:16:12 NVMe kernel: [  123.759278] xhci_hcd 0000:07:00.0:
swiotlb buffer is full (sz: 348160 bytes), total 32768 (slots), used 1
(slots)
Jul 12 11:16:12 NVMe kernel: [  123.759363] xhci_hcd 0000:07:00.0:
swiotlb buffer is full (sz: 348160 bytes), total 32768 (slots), used 1
(slots)
Jul 12 11:16:12 NVMe kernel: [  123.759433] xhci_hcd 0000:07:00.0:
swiotlb buffer is full (sz: 348160 bytes), total 32768 (slots), used 1
(slots)

The following is output from lsusb

Bus 006 Device 003: ID 045e:0040 Microsoft Corp. Wheel Mouse Optical
Bus 006 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 006 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 003: ID 0480:0212 Toshiba America Inc
Bus 005 Device 002: ID 0480:a200 Toshiba America Inc
Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 002: ID 03f0:5711 Hewlett-Packard PhotoSmart C4100 series
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root

-- 
John David Yost
AlleyTrotter
pub   2048D/F3BDEB55 2014-05-23 [expires: Never]

--------------3A31252486D23C49EAA7F72F
Content-Type: application/pgp-keys;
 name="0x2C7AF6BEF3BDEB55.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0x2C7AF6BEF3BDEB55.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
ig==
=DM0Z
-----END PGP PUBLIC KEY BLOCK-----

--------------3A31252486D23C49EAA7F72F--
