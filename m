Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9B72857E6
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 06:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgJGEqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 00:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJGEqI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 00:46:08 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCEAC061755
        for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2020 21:46:08 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 16so1103423oix.9
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2020 21:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:references:to:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1ieVKfTG/SQcsiF+8AYscunTd+lLxMLVbkTpXsVjLwY=;
        b=wP324l6PckSNwg21ZB9kDwgn6Ld7JZUc4TPZJIq4hub6o2XmzE5K/0w3vohbzOYbIk
         RUL04/W9JEuW8l7ypYC9jcW6RYhu+qqz2VWsSWu8OP+gxbA2jCKk+/hWRkUC+/NOkMY8
         VMqhlA9CNyaJXkCcztlH7g1z1PYtB2ogbAaYRBCBL6fF/BLbNzw+EXNUmKqaGBr9KrwQ
         i9SIpVT4i+4UCxATlXztjOKxIhObtkBU4WbcqGLctqruIHU7L/OdsYITk8+f1yv+ju8f
         X8k/oDY9QpY0Z5ohbemoa3oQu2cNkZ/FUsjfBQgGfTv8ETvL1mxifUksyb4VXDAonDNL
         eoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1ieVKfTG/SQcsiF+8AYscunTd+lLxMLVbkTpXsVjLwY=;
        b=MaKYX9PfWrKX9KNFuE3G1O+pLfhmyQlcNv6yH0V7J06KZ3E9g2ALMj+fCoN2vkOwOx
         DB22Xdks+hTU2QUiKeZrRVgcU0TlKn8WvwR4dqwGcqS15u5IIBPwKbByhdMfK9AJnI+J
         e10B8LL1P5fryPdkQJY5MDwD+6CWtkB380DZ/EdJsmoQx7ktO570pbMqakSLo3cXWgo4
         7qkdBlJGNVmo7sGGsuJGJkl29yLgPaHvF4kVIsHp4bVUlNgU4HCdyweBXuuD8yZSRCZ3
         SEnEd75BUQaNwQ0us3kcW/7oGLSv9BSTL9IN4LGJPrBsv0CwUmOwOm0INuU8viQPHYez
         B+0Q==
X-Gm-Message-State: AOAM533QoEM9M7IWDFsw8NqsIEr3GNNl40EgwrAIkxhTQaYKNIYRNgbz
        FYMIU7dPOeIGweEzcmtvQHpflEesV6MorkgQ
X-Google-Smtp-Source: ABdhPJwY5Ed0QdwrEwYM3H4ww45C7cA3Qa4vQ9NUVW2llCnbuazw4BgDt24RPwoPNMRed3HSm4qIgA==
X-Received: by 2002:aca:4bcd:: with SMTP id y196mr873243oia.151.1602045967025;
        Tue, 06 Oct 2020 21:46:07 -0700 (PDT)
Received: from ?IPv6:2607:fb90:5e94:f372:6680:99ff:fe6f:cb54? ([2607:fb90:5e94:f372:6680:99ff:fe6f:cb54])
        by smtp.gmail.com with ESMTPSA id t20sm1136087oot.22.2020.10.06.21.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 21:46:06 -0700 (PDT)
Subject: USB panic on one machine, hang on another.
References: <6A0F5F09-112C-4BB0-9ECF-16395A9D27F1@coresemi.io>
To:     linux-usb@vger.kernel.org
Cc:     "D. Jeff Dionne" <jeff@coresemi.io>, johan@kernel.org,
        gregkh@linuxfoundation.org
From:   Rob Landley <rob@landley.net>
X-Forwarded-Message-Id: <6A0F5F09-112C-4BB0-9ECF-16395A9D27F1@coresemi.io>
Message-ID: <fdae51af-8f0a-f9c6-2dfa-d6ecade04128@landley.net>
Date:   Tue, 6 Oct 2020 23:56:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6A0F5F09-112C-4BB0-9ECF-16395A9D27F1@coresemi.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We've been implementing a new USB device (starting by adapting the Joris example
CDC-ACM VHDL to a new I/O chip, although we're more interested in EEM), and
attempting to talk to the result makes Linux VERY unhappy.

On one machine it panics the kernel, on another it makes the USB subsystem fork
off multiple kernel threads stuck eating 100% CPU until a reboot, and also not
notice when we physically unplug the device afterwards.

I'm aware our device is wrong (haven't figured out HOW it's wrong yet), but...
Linux's USB stack should not be doing that? MacOS instead times something out
and disables the device. (Which again doesn't help us debug it, but at least
doesn't require a reboot afterwards.)

We finally got a good packet capture, alas from a windows GUI tool we had to
take screenshots of, which totals 6 megabytes so I threw the files in a
temporary directory on my web server. (I apologize in advance for dreamhost:
it's cheap.)

  https://landley.net/isb_usb_weallsb

Here are two emails about it, the first is an earlier message with the kernel
panic dump and the second is yesterday's packet capture. Does anybody understand
what's going on here?

Thanks,

Rob

-------- Forwarded Message --------
Subject: 	VPN Hat works... sorta.
Date: 	Mon, 22 Jun 2020 07:21:18 +0900
From: 	D. Jeff Dionne <jeff@coresemi.io>

See below the kernel bug caused by the High Speed USB hat with Joris CDC-ACM
RTL.  It doesn’t panic Mac OS but it also doesn’t work, except to enumerate and
load the correct driver.  Some part of CDC-ACM is likely not implemented
(correctly), but of course this should never cause a kernel bug ;^)

---

Yay, the Joris RTL on Turtle enumerates... then something goes sideways

un 22 06:54:53 JeffNB kernel: [  199.904818] usb 1-3: new high-speed USB device
number 5 using xhci_hcd
Jun 22 06:54:54 JeffNB kernel: [  200.052985] usb 1-3: New USB device found,
idVendor=fb9a, idProduct=fb9a, bcdDevice= 0.31
Jun 22 06:54:54 JeffNB kernel: [  200.052993] usb 1-3: New USB device strings:
Mfr=0, Product=0, SerialNumber=0
Jun 22 06:54:54 JeffNB kernel: [  200.066539] cdc_acm 1-3:1.0: ttyACM0: USB ACM
device
Jun 22 06:54:54 JeffNB kernel: [  200.066836] usbcore: registered new interface
driver cdc_acm
Jun 22 06:54:54 JeffNB kernel: [  200.066837] cdc_acm: USB Abstract Control
Model driver for USB modems and ISDN adapters
Jun 22 06:55:02 JeffNB kernel: [  208.004640] ------------[ cut here ]------------
Jun 22 06:55:02 JeffNB kernel: [  208.004663] WARNING: CPU: 1 PID: 695 at
/build/linux-hwe-pGQy9q/linux-hwe-5.3.0/kernel/workqueue.c:1476
__queue_work+0x36b/0x400
Jun 22 06:55:02 JeffNB kernel: [  208.004665] Modules linked in: cdc_acm rfcomm
snd_hda_codec_hdmi dummy cmac snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio bnep snd_hda_intel snd_intel_dspcfg snd_hda_codec
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_core snd_hwdep kvm_intel
joydev 8250_dw spi_pxa2xx_platform dw_dmac dw_dmac_core kvm snd_pcm irqbypass
snd_seq_midi snd_seq_midi_event mei_hdcp snd_rawmidi crct10dif_pclmul
intel_rapl_msr crc32_pclmul ghash_clmulni_intel snd_seq snd_seq_device snd_timer
aesni_intel aes_x86_64 crypto_simd iwlmvm mac80211 snd libarc4 cryptd
glue_helper intel_cstate iwlwifi intel_rapl_perf nls_iso8859_1 btusb soundcore
cfg80211 btrtl btbcm btintel uvcvideo bluetooth v4l2_common videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common mei_me mei videodev idma64
virt_dma input_leds mc intel_lpss_pci ecdh_generic intel_lpss ecc
intel_pch_thermal processor_thermal_device intel_rapl_common
intel_xhci_usb_role_switch roles intel_soc_dts_iosf goodix int3403_thermal
Jun 22 06:55:02 JeffNB kernel: [  208.004743]  int340x_thermal_zone intel_hid
sparse_keymap mac_hid acpi_pad int3400_thermal acpi_thermal_rel sch_fq_codel
parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs xor zstd_compress
raid6_pq libcrc32c hid_generic usbhid hid i915 i2c_algo_bit drm_kms_helper
syscopyarea sysfillrect nvme sysimgblt fb_sys_fops drm nvme_core
pinctrl_sunrisepoint video pinctrl_intel
Jun 22 06:55:02 JeffNB kernel: [  208.004781] CPU: 1 PID: 695 Comm: ModemManager
Not tainted 5.3.0-59-generic #53~18.04.1-Ubuntu
Jun 22 06:55:02 JeffNB kernel: [  208.004783] Hardware name: GPD P2 MAX/P2 MAX,
BIOS 0.24 09/19/2019
Jun 22 06:55:02 JeffNB kernel: [  208.004790] RIP: 0010:__queue_work+0x36b/0x400
Jun 22 06:55:02 JeffNB kernel: [  208.004796] Code: 4b 91 00 00 48 85 c0 74 0e
48 8b 40 20 48 3b 58 08 0f 84 d7 fc ff ff 0f 0b e9 f7 fd ff ff 48 c7 c7 c0 57 f0
ae e8 48 2d 05 00 <0f> 0b e9 da fd ff ff 41 83 cc 02 49 8d 57 60 e9 bf fd ff ff
80 3d
Jun 22 06:55:02 JeffNB kernel: [  208.004799] RSP: 0018:ffff9c84c003ca30 EFLAGS:
00010086
Jun 22 06:55:02 JeffNB kernel: [  208.004803] RAX: 0000000000000024 RBX:
ffff8f271cc0ae00 RCX: 0000000000000000
Jun 22 06:55:02 JeffNB kernel: [  208.004805] RDX: 0000000000000000 RSI:
ffff8f271ea97448 RDI: ffff8f271ea97448
Jun 22 06:55:02 JeffNB kernel: [  208.004808] RBP: ffff9c84c003ca68 R08:
0000000000000355 R09: 0000000000000004
Jun 22 06:55:02 JeffNB kernel: [  208.004810] R10: 0000000000000000 R11:
0000000000000001 R12: 0000000000000001
Jun 22 06:55:02 JeffNB kernel: [  208.004813] R13: 0000000000002000 R14:
ffff8f2711a77790 R15: ffff8f271eaaf700
Jun 22 06:55:02 JeffNB kernel: [  208.004817] FS:  00007f47183b7900(0000)
GS:ffff8f271ea80000(0000) knlGS:0000000000000000
Jun 22 06:55:02 JeffNB kernel: [  208.004820] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 22 06:55:02 JeffNB kernel: [  208.004822] CR2: 00007fc07664f000 CR3:
0000000458580003 CR4: 00000000003606e0
Jun 22 06:55:02 JeffNB kernel: [  208.004824] Call Trace:
Jun 22 06:55:02 JeffNB kernel: [  208.004828]  <IRQ>
Jun 22 06:55:02 JeffNB kernel: [  208.004838]  queue_work_on+0x39/0x40
Jun 22 06:55:02 JeffNB kernel: [  208.004848]  acm_write_bulk+0x70/0x80 [cdc_acm]
Jun 22 06:55:02 JeffNB kernel: [  208.004856]  __usb_hcd_giveback_urb+0x93/0x120
Jun 22 06:55:02 JeffNB kernel: [  208.004862]  usb_hcd_giveback_urb+0xb8/0xe0
Jun 22 06:55:02 JeffNB kernel: [  208.004867]
 xhci_giveback_urb_in_irq.isra.46+0x84/0xf0
Jun 22 06:55:02 JeffNB kernel: [  208.004872]  xhci_td_cleanup+0xe2/0x180
Jun 22 06:55:02 JeffNB kernel: [  208.004877]  finish_td+0x13f/0x180
Jun 22 06:55:02 JeffNB kernel: [  208.004883]  handle_tx_event+0x49f/0x1580
Jun 22 06:55:02 JeffNB kernel: [  208.004889]  xhci_irq+0x284/0x450
Jun 22 06:55:02 JeffNB kernel: [  208.004896]  ? enqueue_entity+0x123/0x690
Jun 22 06:55:02 JeffNB kernel: [  208.004900]  xhci_msi_irq+0x11/0x20
Jun 22 06:55:02 JeffNB kernel: [  208.004907]  __handle_irq_event_percpu+0x44/0x1a0
Jun 22 06:55:02 JeffNB kernel: [  208.004912]  handle_irq_event_percpu+0x32/0x80
Jun 22 06:55:02 JeffNB kernel: [  208.004917]  handle_irq_event+0x3b/0x60
Jun 22 06:55:02 JeffNB kernel: [  208.004924]  handle_edge_irq+0x83/0x1a0
Jun 22 06:55:02 JeffNB kernel: [  208.004932]  handle_irq+0x20/0x30
Jun 22 06:55:02 JeffNB kernel: [  208.004937]  do_IRQ+0x50/0xe0
Jun 22 06:55:02 JeffNB kernel: [  208.004944]  common_interrupt+0xf/0xf
Jun 22 06:55:02 JeffNB kernel: [  208.004952] RIP:
0010:run_timer_softirq+0x24e/0x470
Jun 22 06:55:02 JeffNB kernel: [  208.004957] Code: 48 fa ff ff 48 89 df e8 30
1d 97 00 e9 23 ff ff ff 48 c7 43 08 00 00 00 00 48 89 df c6 07 00 0f 1f 40 00 fb
66 0f 1f 44 00 00 <48> 8b 45 d0 65 48 33 04 25 28 00 00 00 0f 85 fd 01 00 00 48
83 c4
Jun 22 06:55:02 JeffNB kernel: [  208.004959] RSP: 0018:ffff9c84c003cec0 EFLAGS:
00000297 ORIG_RAX: ffffffffffffffdd
Jun 22 06:55:02 JeffNB kernel: [  208.004964] RAX: 00000000ffffa60b RBX:
ffff8f271ea9c880 RCX: 0000000000000000
Jun 22 06:55:02 JeffNB kernel: [  208.004966] RDX: 00000000ffffa60a RSI:
ffff9c84c003ced0 RDI: ffff8f271ea9c880
Jun 22 06:55:02 JeffNB kernel: [  208.004968] RBP: ffff9c84c003cf50 R08:
ffffffffaec3b4e0 R09: 0000000000000000
Jun 22 06:55:02 JeffNB kernel: [  208.004971] R10: ffff9c84c003cc68 R11:
0000000000000022 R12: ffff9c84c003ced0
Jun 22 06:55:02 JeffNB kernel: [  208.004973] R13: ffffffffaf205108 R14:
dead000000000122 R15: ffffffffaf3f2ca8
Jun 22 06:55:02 JeffNB kernel: [  208.004979]  ? common_interrupt+0xa/0xf
Jun 22 06:55:02 JeffNB kernel: [  208.004989]  ? ktime_get+0x43/0xb0
Jun 22 06:55:02 JeffNB kernel: [  208.004997]  ? lapic_next_deadline+0x26/0x30
Jun 22 06:55:02 JeffNB kernel: [  208.005001]  __do_softirq+0xe4/0x2da
Jun 22 06:55:02 JeffNB kernel: [  208.005009]  irq_exit+0xae/0xb0
Jun 22 06:55:02 JeffNB kernel: [  208.005013]  smp_apic_timer_interrupt+0x79/0x130
Jun 22 06:55:02 JeffNB kernel: [  208.005020]  apic_timer_interrupt+0xf/0x20
Jun 22 06:55:02 JeffNB kernel: [  208.005022]  </IRQ>
Jun 22 06:55:02 JeffNB kernel: [  208.005028] RIP:
0010:_raw_spin_unlock_irqrestore+0x15/0x20
Jun 22 06:55:02 JeffNB kernel: [  208.005033] Code: 3d 00 e9 7c ff ff ff 90 90
90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 c6 07 00 0f 1f 40
00 48 89 f7 57 9d <0f> 1f 44 00 00 5d c3 0f 1f 40 00 0f 1f 44 00 00 55 48 89 e5
c6 07
Jun 22 06:55:02 JeffNB kernel: [  208.005035] RSP: 0018:ffff9c84c06bbd50 EFLAGS:
00000206 ORIG_RAX: ffffffffffffff13
Jun 22 06:55:02 JeffNB kernel: [  208.005039] RAX: 0000000000000000 RBX:
0000000000000000 RCX: 0000000000000000
Jun 22 06:55:02 JeffNB kernel: [  208.005041] RDX: 0000000000000002 RSI:
0000000000000206 RDI: 0000000000000206
Jun 22 06:55:02 JeffNB kernel: [  208.005044] RBP: ffff9c84c06bbd50 R08:
0000000000000000 R09: 0000000000000000
Jun 22 06:55:02 JeffNB kernel: [  208.005046] R10: ffff8f270f7a4260 R11:
0000000000000420 R12: ffff8f2711a7774c
Jun 22 06:55:02 JeffNB kernel: [  208.005048] R13: ffff8f2711a77000 R14:
ffff8f2711a77000 R15: 0000000000000003
Jun 22 06:55:02 JeffNB kernel: [  208.005058]  acm_tty_write+0xf9/0x190 [cdc_acm]
Jun 22 06:55:02 JeffNB kernel: [  208.005065]  n_tty_write+0x3ec/0x490
Jun 22 06:55:02 JeffNB kernel: [  208.005071]  ? do_wait_intr_irq+0x90/0x90
Jun 22 06:55:02 JeffNB kernel: [  208.005076]  tty_write+0x1c0/0x360
Jun 22 06:55:02 JeffNB kernel: [  208.005081]  ? process_echoes+0x70/0x70
Jun 22 06:55:02 JeffNB kernel: [  208.005087]  __vfs_write+0x1b/0x40
Jun 22 06:55:02 JeffNB kernel: [  208.005091]  vfs_write+0xb1/0x1a0
Jun 22 06:55:02 JeffNB kernel: [  208.005096]  ksys_write+0xa7/0xe0
Jun 22 06:55:02 JeffNB kernel: [  208.005101]  __x64_sys_write+0x1a/0x20
Jun 22 06:55:02 JeffNB kernel: [  208.005108]  do_syscall_64+0x5a/0x130
Jun 22 06:55:02 JeffNB kernel: [  208.005114]
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jun 22 06:55:02 JeffNB kernel: [  208.005119] RIP: 0033:0x7f47164752b7
Jun 22 06:55:02 JeffNB kernel: [  208.005124] Code: 44 00 00 41 54 55 49 89 d4
53 48 89 f5 89 fb 48 83 ec 10 e8 5b fd ff ff 4c 89 e2 41 89 c0 48 89 ee 89 df b8
01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 48 89 44 24 08 e8 94 fd ff
ff 48
Jun 22 06:55:02 JeffNB kernel: [  208.005126] RSP: 002b:00007ffcb47c05e0 EFLAGS:
00000293 ORIG_RAX: 0000000000000001
Jun 22 06:55:02 JeffNB kernel: [  208.005130] RAX: ffffffffffffffda RBX:
0000000000000009 RCX: 00007f47164752b7
Jun 22 06:55:02 JeffNB kernel: [  208.005132] RDX: 0000000000000003 RSI:
0000561fcc1c0c20 RDI: 0000000000000009
Jun 22 06:55:02 JeffNB kernel: [  208.005134] RBP: 0000561fcc1c0c20 R08:
0000000000000000 R09: 0000000000000003
Jun 22 06:55:02 JeffNB kernel: [  208.005136] R10: 0000561fcc1ae380 R11:
0000000000000293 R12: 0000000000000003
Jun 22 06:55:02 JeffNB kernel: [  208.005138] R13: 0000561fcc1c0c20 R14:
0000561fcc19fb60 R15: 00007ffcb47c0710
Jun 22 06:55:02 JeffNB kernel: [  208.005144] ---[ end trace f2ce247425b7e989 ]---
Jun 22 06:55:05 JeffNB kernel: [  211.004742] ------------[ cut here ]------------
Jun 22 06:55:05 JeffNB kernel: [  211.004746] URB 0000000000000000 submitted
while active
Jun 22 06:55:05 JeffNB kernel: [  211.004763] WARNING: CPU: 1 PID: 695 at
/build/linux-hwe-pGQy9q/linux-hwe-5.3.0/drivers/usb/core/urb.c:363
usb_submit_urb+0x432/0x5d0
Jun 22 06:55:05 JeffNB kernel: [  211.004764] Modules linked in: cdc_acm rfcomm
snd_hda_codec_hdmi dummy cmac snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio bnep snd_hda_intel snd_intel_dspcfg snd_hda_codec
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_core snd_hwdep kvm_intel
joydev 8250_dw spi_pxa2xx_platform dw_dmac dw_dmac_core kvm snd_pcm irqbypass
snd_seq_midi snd_seq_midi_event mei_hdcp snd_rawmidi crct10dif_pclmul
intel_rapl_msr crc32_pclmul ghash_clmulni_intel snd_seq snd_seq_device snd_timer
aesni_intel aes_x86_64 crypto_simd iwlmvm mac80211 snd libarc4 cryptd
glue_helper intel_cstate iwlwifi intel_rapl_perf nls_iso8859_1 btusb soundcore
cfg80211 btrtl btbcm btintel uvcvideo bluetooth v4l2_common videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common mei_me mei videodev idma64
virt_dma input_leds mc intel_lpss_pci ecdh_generic intel_lpss ecc
intel_pch_thermal processor_thermal_device intel_rapl_common
intel_xhci_usb_role_switch roles intel_soc_dts_iosf goodix int3403_thermal
Jun 22 06:55:05 JeffNB kernel: [  211.004803]  int340x_thermal_zone intel_hid
sparse_keymap mac_hid acpi_pad int3400_thermal acpi_thermal_rel sch_fq_codel
parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs xor zstd_compress
raid6_pq libcrc32c hid_generic usbhid hid i915 i2c_algo_bit drm_kms_helper
syscopyarea sysfillrect nvme sysimgblt fb_sys_fops drm nvme_core
pinctrl_sunrisepoint video pinctrl_intel
Jun 22 06:55:05 JeffNB kernel: [  211.004823] CPU: 1 PID: 695 Comm: ModemManager
Tainted: G        W         5.3.0-59-generic #53~18.04.1-Ubuntu
Jun 22 06:55:05 JeffNB kernel: [  211.004824] Hardware name: GPD P2 MAX/P2 MAX,
BIOS 0.24 09/19/2019
Jun 22 06:55:05 JeffNB kernel: [  211.004827] RIP: 0010:usb_submit_urb+0x432/0x5d0
Jun 22 06:55:05 JeffNB kernel: [  211.004829] Code: ff ff 0f 1f 44 00 00 b8 a6
ff ff ff e9 33 fc ff ff 48 89 fe 48 c7 c7 c0 af fc ae 89 45 d4 c6 05 12 15 04 01
01 e8 3e 47 8d ff <0f> 0b 8b 45 d4 e9 10 fc ff ff 66 83 79 06 00 0f 84 28 ff ff
ff 80
Jun 22 06:55:05 JeffNB kernel: [  211.004831] RSP: 0018:ffff9c84c06bbaa0 EFLAGS:
00010286
Jun 22 06:55:05 JeffNB kernel: [  211.004833] RAX: 0000000000000000 RBX:
ffff8f270fb30000 RCX: 0000000000000006
Jun 22 06:55:05 JeffNB kernel: [  211.004834] RDX: 0000000000000007 RSI:
0000000000000082 RDI: ffff8f271ea97440
Jun 22 06:55:05 JeffNB kernel: [  211.004835] RBP: ffff9c84c06bbae0 R08:
00000000000003a7 R09: 0000000000000004
Jun 22 06:55:05 JeffNB kernel: [  211.004836] R10: ffff8f270f7a4260 R11:
0000000000000001 R12: 0000000000000009
Jun 22 06:55:05 JeffNB kernel: [  211.004836] R13: 0000000000000cc0 R14:
ffff8f2711a77000 R15: 0000000000000009
Jun 22 06:55:05 JeffNB kernel: [  211.004838] FS:  00007f47183b7900(0000)
GS:ffff8f271ea80000(0000) knlGS:0000000000000000
Jun 22 06:55:05 JeffNB kernel: [  211.004839] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 22 06:55:05 JeffNB kernel: [  211.004841] CR2: 0000561fcb6dd000 CR3:
0000000458580005 CR4: 00000000003606e0
Jun 22 06:55:05 JeffNB kernel: [  211.004842] Call Trace:
Jun 22 06:55:05 JeffNB kernel: [  211.004850]  acm_submit_read_urb+0x42/0x90
[cdc_acm]
Jun 22 06:55:05 JeffNB kernel: [  211.004853]  acm_port_activate+0x102/0x190
[cdc_acm]
Jun 22 06:55:05 JeffNB kernel: [  211.004858]  tty_port_open+0x8d/0xe0
Jun 22 06:55:05 JeffNB kernel: [  211.004860]  ? tty_ldisc_unlock+0x22/0x30
Jun 22 06:55:05 JeffNB kernel: [  211.004863]  acm_tty_open+0x22/0x30 [cdc_acm]
Jun 22 06:55:05 JeffNB kernel: [  211.004865]  tty_open+0xf9/0x470
Jun 22 06:55:05 JeffNB kernel: [  211.004869]  chrdev_open+0xc4/0x1b0
Jun 22 06:55:05 JeffNB kernel: [  211.004872]  ? cdev_put.part.2+0x20/0x20
Jun 22 06:55:05 JeffNB kernel: [  211.004876]  do_dentry_open+0x1f8/0x3a0
Jun 22 06:55:05 JeffNB kernel: [  211.004879]  vfs_open+0x2f/0x40
Jun 22 06:55:05 JeffNB kernel: [  211.004881]  path_openat+0x2fb/0x1700
Jun 22 06:55:05 JeffNB kernel: [  211.004885]  ? unlock_page_memcg+0x12/0x20
Jun 22 06:55:05 JeffNB kernel: [  211.004888]  ? page_add_file_rmap+0x5e/0x150
Jun 22 06:55:05 JeffNB kernel: [  211.004891]  ? filemap_map_pages+0x18f/0x380
Jun 22 06:55:05 JeffNB kernel: [  211.004893]  do_filp_open+0x9b/0x110
Jun 22 06:55:05 JeffNB kernel: [  211.004896]  ? __check_object_size+0xdb/0x1b0
Jun 22 06:55:05 JeffNB kernel: [  211.004899]  ? __alloc_fd+0x46/0x170
Jun 22 06:55:05 JeffNB kernel: [  211.004902]  do_sys_open+0x1ba/0x2e0
Jun 22 06:55:05 JeffNB kernel: [  211.004904]  ? do_sys_open+0x1ba/0x2e0
Jun 22 06:55:05 JeffNB kernel: [  211.004907]  __x64_sys_openat+0x20/0x30
Jun 22 06:55:05 JeffNB kernel: [  211.004910]  do_syscall_64+0x5a/0x130
Jun 22 06:55:05 JeffNB kernel: [  211.004914]
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jun 22 06:55:05 JeffNB kernel: [  211.004916] RIP: 0033:0x7f4716475dae
Jun 22 06:55:05 JeffNB kernel: [  211.004918] Code: 89 54 24 08 e8 73 f2 ff ff
8b 74 24 0c 48 8b 3c 24 41 89 c0 44 8b 54 24 08 b8 01 01 00 00 89 f2 48 89 fe bf
9c ff ff ff 0f 05 <48> 3d 00 f0 ff ff 77 30 44 89 c7 89 44 24 08 e8 9e f2 ff ff
8b 44
Jun 22 06:55:05 JeffNB kernel: [  211.004919] RSP: 002b:00007ffcb47c05d0 EFLAGS:
00000293 ORIG_RAX: 0000000000000101
Jun 22 06:55:05 JeffNB kernel: [  211.004921] RAX: ffffffffffffffda RBX:
0000561fcc14a340 RCX: 00007f4716475dae
Jun 22 06:55:05 JeffNB kernel: [  211.004922] RDX: 0000000000000982 RSI:
0000561fcc148660 RDI: 00000000ffffff9c
Jun 22 06:55:05 JeffNB kernel: [  211.004923] RBP: 0000561fcc148640 R08:
0000000000000000 R09: 0000000000000007
Jun 22 06:55:05 JeffNB kernel: [  211.004924] R10: 0000000000000000 R11:
0000000000000293 R12: 00007ffcb47c0710
Jun 22 06:55:05 JeffNB kernel: [  211.004925] R13: 0000000000000000 R14:
0000561fcc14a280 R15: 0000561fcc148660
Jun 22 06:55:05 JeffNB kernel: [  211.004927] ---[ end trace f2ce247425b7e98a ]---
Jun 22 06:55:05 JeffNB kernel: [  211.004944] cdc_acm 1-3:1.1: urb 9 failed
submission with -16
Jun 22 06:55:10 JeffNB kernel: [  216.063925] usb 1-3: USB disconnect, device
number 5
Jun 22 06:55:34 JeffNB kernel: [  240.152585] watchdog: BUG: soft lockup - CPU#1
stuck for 22s! [kworker/1:1:139]
Jun 22 06:55:34 JeffNB kernel: [  240.152588] Modules linked in: cdc_acm rfcomm
snd_hda_codec_hdmi dummy cmac snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio bnep snd_hda_intel snd_intel_dspcfg snd_hda_codec
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_core snd_hwdep kvm_intel
joydev 8250_dw spi_pxa2xx_platform dw_dmac dw_dmac_core kvm snd_pcm irqbypass
snd_seq_midi snd_seq_midi_event mei_hdcp snd_rawmidi crct10dif_pclmul
intel_rapl_msr crc32_pclmul ghash_clmulni_intel snd_seq snd_seq_device snd_timer
aesni_intel aes_x86_64 crypto_simd iwlmvm mac80211 snd libarc4 cryptd
glue_helper intel_cstate iwlwifi intel_rapl_perf nls_iso8859_1 btusb soundcore
cfg80211 btrtl btbcm btintel uvcvideo bluetooth v4l2_common videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common mei_me mei videodev idma64
virt_dma input_leds mc intel_lpss_pci ecdh_generic intel_lpss ecc
intel_pch_thermal processor_thermal_device intel_rapl_common
intel_xhci_usb_role_switch roles intel_soc_dts_iosf goodix int3403_thermal
Jun 22 06:55:34 JeffNB kernel: [  240.152636]  int340x_thermal_zone intel_hid
sparse_keymap mac_hid acpi_pad int3400_thermal acpi_thermal_rel sch_fq_codel
parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs xor zstd_compress
raid6_pq libcrc32c hid_generic usbhid hid i915 i2c_algo_bit drm_kms_helper
syscopyarea sysfillrect nvme sysimgblt fb_sys_fops drm nvme_core
pinctrl_sunrisepoint video pinctrl_intel
Jun 22 06:55:34 JeffNB kernel: [  240.152650] CPU: 1 PID: 139 Comm: kworker/1:1
Tainted: G        W         5.3.0-59-generic #53~18.04.1-Ubuntu
Jun 22 06:55:34 JeffNB kernel: [  240.152650] Hardware name: GPD P2 MAX/P2 MAX,
BIOS 0.24 09/19/2019
Jun 22 06:55:34 JeffNB kernel: [  240.152655] Workqueue: usb_hub_wq hub_event
Jun 22 06:55:34 JeffNB kernel: [  240.152660] RIP:
0010:try_to_grab_pending+0xf2/0x150
Jun 22 06:55:34 JeffNB kernel: [  240.152661] Code: 83 c8 01 4c 89 ef 48 89 03
c6 07 00 0f 1f 40 00 b8 01 00 00 00 e9 5c ff ff ff 4c 89 ef c6 07 00 0f 1f 40 00
49 8b 3c 24 57 9d <0f> 1f 44 00 00 48 8b 13 b8 fe ff ff ff 83 e2 14 48 83 fa 10
0f 84
Jun 22 06:55:34 JeffNB kernel: [  240.152662] RSP: 0018:ffff9c84c01ffa70 EFLAGS:
00000286 ORIG_RAX: ffffffffffffff13
Jun 22 06:55:34 JeffNB kernel: [  240.152663] RAX: 0000000000000000 RBX:
ffff8f2711a77790 RCX: 0000000000000000
Jun 22 06:55:34 JeffNB kernel: [  240.152664] RDX: 0000000000000001 RSI:
0000000000000002 RDI: 0000000000000286
Jun 22 06:55:34 JeffNB kernel: [  240.152664] RBP: ffff9c84c01ffa90 R08:
ffff8f271c800ff8 R09: ffff8f271c801030
Jun 22 06:55:34 JeffNB kernel: [  240.152665] R10: 0000000000000000 R11:
ffffffffaf25d4f8 R12: ffff9c84c01ffaa0
Jun 22 06:55:34 JeffNB kernel: [  240.152682] R13: ffff8f271eaaa100 R14:
ffff9c84c01ffac0 R15: ffffffffadcb93e0
Jun 22 06:55:34 JeffNB kernel: [  240.152683] FS:  0000000000000000(0000)
GS:ffff8f271ea80000(0000) knlGS:0000000000000000
Jun 22 06:55:34 JeffNB kernel: [  240.152684] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 22 06:55:34 JeffNB kernel: [  240.152684] CR2: 00007f1a28024158 CR3:
000000019080a003 CR4: 00000000003606e0
Jun 22 06:55:34 JeffNB kernel: [  240.152685] Call Trace:
Jun 22 06:55:34 JeffNB kernel: [  240.152688]  __cancel_work_timer+0x4a/0x1b0
Jun 22 06:55:34 JeffNB kernel: [  240.152689]  ? usb_kill_urb+0x50/0xc0
Jun 22 06:55:34 JeffNB kernel: [  240.152692]  cancel_work_sync+0x10/0x20
Jun 22 06:55:34 JeffNB kernel: [  240.152694]  acm_disconnect+0x110/0x200 [cdc_acm]
Jun 22 06:55:34 JeffNB kernel: [  240.152695]  usb_unbind_interface+0x7f/0x260
Jun 22 06:55:34 JeffNB kernel: [  240.152698]
 device_release_driver_internal+0xe0/0x1b0
Jun 22 06:55:34 JeffNB kernel: [  240.152699]  device_release_driver+0x12/0x20
Jun 22 06:55:34 JeffNB kernel: [  240.152700]  bus_remove_device+0xe1/0x150
Jun 22 06:55:34 JeffNB kernel: [  240.152702]  device_del+0x16a/0x3a0
Jun 22 06:55:34 JeffNB kernel: [  240.152703]  ? usb_remove_ep_devs+0x1f/0x30
Jun 22 06:55:34 JeffNB kernel: [  240.152704]  usb_disable_device+0x9f/0x250
Jun 22 06:55:34 JeffNB kernel: [  240.152705]  usb_disconnect+0xc6/0x270
Jun 22 06:55:34 JeffNB kernel: [  240.152706]  hub_port_connect+0x81/0x990
Jun 22 06:55:34 JeffNB kernel: [  240.152707]  port_event+0x67a/0x7e0
Jun 22 06:55:34 JeffNB kernel: [  240.152709]  ? __switch_to_asm+0x40/0x70
Jun 22 06:55:34 JeffNB kernel: [  240.152711]  hub_event+0x21e/0x3b0
Jun 22 06:55:34 JeffNB kernel: [  240.152712]  process_one_work+0x1fd/0x3f0
Jun 22 06:55:34 JeffNB kernel: [  240.152713]  worker_thread+0x34/0x410
Jun 22 06:55:34 JeffNB kernel: [  240.152714]  kthread+0x121/0x140
Jun 22 06:55:34 JeffNB kernel: [  240.152715]  ? process_one_work+0x3f0/0x3f0
Jun 22 06:55:34 JeffNB kernel: [  240.152716]  ? kthread_park+0xb0/0xb0
Jun 22 06:55:34 JeffNB kernel: [  240.152717]  ret_from_fork+0x35/0x40
Jun 22 06:56:02 JeffNB kernel: [  268.152587] watchdog: BUG: soft lockup - CPU#1
stuck for 22s! [kworker/1:1:139]
Jun 22 06:56:02 JeffNB kernel: [  268.152609] Modules linked in: cdc_acm rfcomm
snd_hda_codec_hdmi dummy cmac snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio bnep snd_hda_intel snd_intel_dspcfg snd_hda_codec
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_core snd_hwdep kvm_intel
joydev 8250_dw spi_pxa2xx_platform dw_dmac dw_dmac_core kvm snd_pcm irqbypass
snd_seq_midi snd_seq_midi_event mei_hdcp snd_rawmidi crct10dif_pclmul
intel_rapl_msr crc32_pclmul ghash_clmulni_intel snd_seq snd_seq_device snd_timer
aesni_intel aes_x86_64 crypto_simd iwlmvm mac80211 snd libarc4 cryptd
glue_helper intel_cstate iwlwifi intel_rapl_perf nls_iso8859_1 btusb soundcore
cfg80211 btrtl btbcm btintel uvcvideo bluetooth v4l2_common videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common mei_me mei videodev idma64
virt_dma input_leds mc intel_lpss_pci ecdh_generic intel_lpss ecc
intel_pch_thermal processor_thermal_device intel_rapl_common
intel_xhci_usb_role_switch roles intel_soc_dts_iosf goodix int3403_thermal
Jun 22 06:56:02 JeffNB kernel: [  268.152635]  int340x_thermal_zone intel_hid
sparse_keymap mac_hid acpi_pad int3400_thermal acpi_thermal_rel sch_fq_codel
parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs xor zstd_compress
raid6_pq libcrc32c hid_generic usbhid hid i915 i2c_algo_bit drm_kms_helper
syscopyarea sysfillrect nvme sysimgblt fb_sys_fops drm nvme_core
pinctrl_sunrisepoint video pinctrl_intel
Jun 22 06:56:02 JeffNB kernel: [  268.152648] CPU: 1 PID: 139 Comm: kworker/1:1
Tainted: G        W    L    5.3.0-59-generic #53~18.04.1-Ubuntu
Jun 22 06:56:02 JeffNB kernel: [  268.152649] Hardware name: GPD P2 MAX/P2 MAX,
BIOS 0.24 09/19/2019
Jun 22 06:56:02 JeffNB kernel: [  268.152669] Workqueue: usb_hub_wq hub_event
Jun 22 06:56:02 JeffNB kernel: [  268.152672] RIP:
0010:try_to_grab_pending+0xf2/0x150
Jun 22 06:56:02 JeffNB kernel: [  268.152673] Code: 83 c8 01 4c 89 ef 48 89 03
c6 07 00 0f 1f 40 00 b8 01 00 00 00 e9 5c ff ff ff 4c 89 ef c6 07 00 0f 1f 40 00
49 8b 3c 24 57 9d <0f> 1f 44 00 00 48 8b 13 b8 fe ff ff ff 83 e2 14 48 83 fa 10
0f 84
Jun 22 06:56:02 JeffNB kernel: [  268.152674] RSP: 0018:ffff9c84c01ffa70 EFLAGS:
00000286 ORIG_RAX: ffffffffffffff13
Jun 22 06:56:02 JeffNB kernel: [  268.152675] RAX: 0000000000000000 RBX:
ffff8f2711a77790 RCX: 0000000000000000
Jun 22 06:56:02 JeffNB kernel: [  268.152675] RDX: 0000000000000001 RSI:
0000000000000002 RDI: 0000000000000286
Jun 22 06:56:02 JeffNB kernel: [  268.152676] RBP: ffff9c84c01ffa90 R08:
ffff8f271c800ff8 R09: ffff8f271c801030
Jun 22 06:56:02 JeffNB kernel: [  268.152676] R10: 0000000000000000 R11:
ffffffffaf25d4f8 R12: ffff9c84c01ffaa0
Jun 22 06:56:02 JeffNB kernel: [  268.152677] R13: ffff8f271eaaa100 R14:
ffff9c84c01ffac0 R15: ffffffffadcb93e0
Jun 22 06:56:02 JeffNB kernel: [  268.152677] FS:  0000000000000000(0000)
GS:ffff8f271ea80000(0000) knlGS:0000000000000000
Jun 22 06:56:02 JeffNB kernel: [  268.152678] CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 22 06:56:02 JeffNB kernel: [  268.152679] CR2: 00007f1a28024158 CR3:
000000019080a003 CR4: 00000000003606e0
Jun 22 06:56:02 JeffNB kernel: [  268.152679] Call Trace:
Jun 22 06:56:02 JeffNB kernel: [  268.152682]  __cancel_work_timer+0x4a/0x1b0
Jun 22 06:56:02 JeffNB kernel: [  268.152684]  ? usb_kill_urb+0x50/0xc0
Jun 22 06:56:02 JeffNB kernel: [  268.152686]  cancel_work_sync+0x10/0x20
Jun 22 06:56:02 JeffNB kernel: [  268.152688]  acm_disconnect+0x110/0x200 [cdc_acm]
Jun 22 06:56:02 JeffNB kernel: [  268.152689]  usb_unbind_interface+0x7f/0x260
Jun 22 06:56:02 JeffNB kernel: [  268.152691]
 device_release_driver_internal+0xe0/0x1b0
Jun 22 06:56:02 JeffNB kernel: [  268.152692]  device_release_driver+0x12/0x20
Jun 22 06:56:02 JeffNB kernel: [  268.152693]  bus_remove_device+0xe1/0x150
Jun 22 06:56:02 JeffNB kernel: [  268.152695]  device_del+0x16a/0x3a0
Jun 22 06:56:02 JeffNB kernel: [  268.152696]  ? usb_remove_ep_devs+0x1f/0x30
Jun 22 06:56:02 JeffNB kernel: [  268.152697]  usb_disable_device+0x9f/0x250
Jun 22 06:56:02 JeffNB kernel: [  268.152698]  usb_disconnect+0xc6/0x270
Jun 22 06:56:02 JeffNB kernel: [  268.152699]  hub_port_connect+0x81/0x990
Jun 22 06:56:02 JeffNB kernel: [  268.152700]  port_event+0x67a/0x7e0
Jun 22 06:56:02 JeffNB kernel: [  268.152703]  ? __switch_to_asm+0x40/0x70
Jun 22 06:56:02 JeffNB kernel: [  268.152704]  hub_event+0x21e/0x3b0
Jun 22 06:56:02 JeffNB kernel: [  268.152705]  process_one_work+0x1fd/0x3f0
Jun 22 06:56:02 JeffNB kernel: [  268.152707]  worker_thread+0x34/0x410
Jun 22 06:56:02 JeffNB kernel: [  268.152708]  kthread+0x121/0x140
Jun 22 06:56:02 JeffNB kernel: [  268.152709]  ? process_one_work+0x3f0/0x3f0
Jun 22 06:56:02 JeffNB kernel: [  268.152709]  ? kthread_park+0xb0/0xb0
Jun 22 06:56:02 JeffNB kernel: [  268.152711]  ret_from_fork+0x35/0x40
Jun 22 06:56:10 JeffNB kernel: [  276.068585] rcu: INFO: rcu_sched self-detected
stall on CPU
Jun 22 06:56:10 JeffNB kernel: [  276.068591] rcu: 1-....: (14999 ticks this GP)
idle=8d6/1/0x4000000000000002 softirq=15405/15405 fqs=7496
Jun 22 06:56:10 JeffNB kernel: [  276.068593] (t=15000 jiffies g=23385 q=2185)
Jun 22 06:56:10 JeffNB kernel: [  276.068594] NMI backtrace for cpu 1
Jun 22 06:56:10 JeffNB kernel: [  276.068596] CPU: 1 PID: 139 Comm: kworker/1:1
Tainted: G        W    L    5.3.0-59-generic #53~18.04.1-Ubuntu
Jun 22 06:56:10 JeffNB kernel: [  276.068597] Hardware name: GPD P2 MAX/P2 MAX,
BIOS 0.24 09/19/2019
Jun 22 06:56:10 JeffNB kernel: [  276.068601] Workqueue: usb_hub_wq hub_event
Jun 22 06:56:10 JeffNB kernel: [  276.068602] Call Trace:
Jun 22 06:56:10 JeffNB kernel: [  276.068604]  <IRQ>
Jun 22 06:56:10 JeffNB kernel: [  276.068608]  dump_stack+0x6d/0x95
Jun 22 06:56:10 JeffNB kernel: [  276.068610]  nmi_cpu_backtrace+0x94/0xa0
Jun 22 06:56:10 JeffNB kernel: [  276.068612]  ? lapic_can_unplug_cpu+0xb0/0xb0
Jun 22 06:56:10 JeffNB kernel: [  276.068614]
 nmi_trigger_cpumask_backtrace+0xe7/0x130
Jun 22 06:56:10 JeffNB kernel: [  276.068615]
 arch_trigger_cpumask_backtrace+0x19/0x20
Jun 22 06:56:10 JeffNB kernel: [  276.068617]  rcu_dump_cpu_stacks+0x9e/0xdd
Jun 22 06:56:10 JeffNB kernel: [  276.068618]  rcu_sched_clock_irq+0x5e3/0x710
Jun 22 06:56:10 JeffNB kernel: [  276.068621]  ? tick_sched_do_timer+0x60/0x60
Jun 22 06:56:10 JeffNB kernel: [  276.068623]  update_process_times+0x2f/0x60
Jun 22 06:56:10 JeffNB kernel: [  276.068624]  tick_sched_handle+0x25/0x70
Jun 22 06:56:10 JeffNB kernel: [  276.068626]  ? tick_sched_do_timer+0x58/0x60
Jun 22 06:56:10 JeffNB kernel: [  276.068627]  tick_sched_timer+0x3c/0x80
Jun 22 06:56:10 JeffNB kernel: [  276.068629]  __hrtimer_run_queues+0x10f/0x280
Jun 22 06:56:10 JeffNB kernel: [  276.068631]  hrtimer_interrupt+0xe7/0x240
Jun 22 06:56:10 JeffNB kernel: [  276.068632]  smp_apic_timer_interrupt+0x6f/0x130
Jun 22 06:56:10 JeffNB kernel: [  276.068634]  apic_timer_interrupt+0xf/0x20
Jun 22 06:56:10 JeffNB kernel: [  276.068635]  </IRQ>
Jun 22 06:56:10 JeffNB kernel: [  276.068638] RIP:
0010:try_to_grab_pending+0xf2/0x150
Jun 22 06:56:10 JeffNB kernel: [  276.068639] Code: 83 c8 01 4c 89 ef 48 89 03
c6 07 00 0f 1f 40 00 b8 01 00 00 00 e9 5c ff ff ff 4c 89 ef c6 07 00 0f 1f 40 00
49 8b 3c 24 57 9d <0f> 1f 44 00 00 48 8b 13 b8 fe ff ff ff 83 e2 14 48 83 fa 10
0f 84
Jun 22 06:56:10 JeffNB kernel: [  276.068640] RSP: 0018:ffff9c84c01ffa70 EFLAGS:
00000286 ORIG_RAX: ffffffffffffff13
Jun 22 06:56:10 JeffNB kernel: [  276.068641] RAX: 0000000000000000 RBX:
ffff8f2711a77790 RCX: 0000000000000000
Jun 22 06:56:10 JeffNB kernel: [  276.068642] RDX: 0000000000000001 RSI:
0000000000000002 RDI: 0000000000000286
Jun 22 06:56:10 JeffNB kernel: [  276.068642] RBP: ffff9c84c01ffa90 R08:
ffff8f271c800ff8 R09: ffff8f271c801030
Jun 22 06:56:10 JeffNB kernel: [  276.068643] R10: 0000000000000000 R11:
ffffffffaf25d4f8 R12: ffff9c84c01ffaa0
Jun 22 06:56:10 JeffNB kernel: [  276.068643] R13: ffff8f271eaaa100 R14:
ffff9c84c01ffac0 R15: ffffffffadcb93e0
Jun 22 06:56:10 JeffNB kernel: [  276.068645]  ? work_busy+0x90/0x90
Jun 22 06:56:10 JeffNB kernel: [  276.068647]  __cancel_work_timer+0x4a/0x1b0
Jun 22 06:56:10 JeffNB kernel: [  276.068649]  ? usb_kill_urb+0x50/0xc0
Jun 22 06:56:10 JeffNB kernel: [  276.068652]  cancel_work_sync+0x10/0x20
Jun 22 06:56:10 JeffNB kernel: [  276.068655]  acm_disconnect+0x110/0x200 [cdc_acm]
Jun 22 06:56:10 JeffNB kernel: [  276.068657]  usb_unbind_interface+0x7f/0x260
Jun 22 06:56:10 JeffNB kernel: [  276.068659]
 device_release_driver_internal+0xe0/0x1b0
Jun 22 06:56:10 JeffNB kernel: [  276.068660]  device_release_driver+0x12/0x20
Jun 22 06:56:10 JeffNB kernel: [  276.068661]  bus_remove_device+0xe1/0x150
Jun 22 06:56:10 JeffNB kernel: [  276.068663]  device_del+0x16a/0x3a0
Jun 22 06:56:10 JeffNB kernel: [  276.068665]  ? usb_remove_ep_devs+0x1f/0x30
Jun 22 06:56:10 JeffNB kernel: [  276.068666]  usb_disable_device+0x9f/0x250
Jun 22 06:56:10 JeffNB kernel: [  276.068668]  usb_disconnect+0xc6/0x270
Jun 22 06:56:10 JeffNB kernel: [  276.068669]  hub_port_connect+0x81/0x990
Jun 22 06:56:10 JeffNB kernel: [  276.068670]  port_event+0x67a/0x7e0
Jun 22 06:56:10 JeffNB kernel: [  276.068672]  ? __switch_to_asm+0x40/0x70
Jun 22 06:56:10 JeffNB kernel: [  276.068673]  hub_event+0x21e/0x3b0
Jun 22 06:56:10 JeffNB kernel: [  276.068675]  process_one_work+0x1fd/0x3f0
Jun 22 06:56:10 JeffNB kernel: [  276.068677]  worker_thread+0x34/0x410
Jun 22 06:56:10 JeffNB kernel: [  276.068678]  kthread+0x121/0x140
Jun 22 06:56:10 JeffNB kernel: [  276.068679]  ? process_one_work+0x3f0/0x3f0
Jun 22 06:56:10 JeffNB kernel: [  276.068680]  ? kthread_park+0xb0/0xb0
Jun 22 06:56:10 JeffNB kernel: [  276.068682]  ret_from_fork+0x35/0x40


-------- Forwarded Message --------
Subject: USB capture.
Date: Tue, 6 Oct 2020 20:36:52 +0900
From: D. Jeff Dionne <jeff@coresemi.io>

Ok and FWIW, I can get capture to work, using a windows PC of the turtle board
talking to the Linux bench PC through the BugBlat.  I got it to downgrade to
12Mbps, and still pass data so that this could be done.

On the bench PC, the Joris CDC-ACM doesn't hang the kernel, it 'just' hangs the
USB stack.  But I got a good capture of what packets flow.

Unfortunately, the BugBlat software doesn't have a print or export function, so
I need to I guess take screen caps.

Their sw doesn’t know CDC-ACM, so we need to decode these packets by hand.  I’ve
only taken pics -after- the device resets, and successfully requests all the
descriptors (including the text description descriptors).

You can see it selecting the configuration in Transfer 11, and then it starts to
make ACM specific requests from Transfer 12 - 15.

The test host machine kernel stops taking at Transfer 15.  Unplugging the USB
does -not- remove the device from lsusb, and worker threads are stuck.  The
machine has to be powered off.

J.


