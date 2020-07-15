Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAB9220A95
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 12:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731339AbgGOK5T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 06:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731340AbgGOK5S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 06:57:18 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C58C061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 03:57:18 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so5276621wmo.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidgf-net.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lD/1/eJL7BeGaassgoDCVeptYAk1TZ36MHCsp1wI7RU=;
        b=gQoZ7hnS/pvEg/L6d6vRzpJIGvvrWK0snJ8nU1LupGA77BC3GZJTN92+WMf/GEWZNA
         sPq4NAL71C4V1gW/OtFVTWnXF/UBLZ/hJxmVO0GtgFUVFPXq+ofK9WqmlAqHQsPTYRzi
         aKPL68LRt1KvBftjv4sDKabuuwLpN4gYiNfdFc9XjZtYivahi8Kjcq/2VCAA8aA9g7G5
         SyH45H320fQkt3OdxL/fcPTIhuvLEgqD2gxa4PrsnRIgqLZl1ThvixxmGeCRhU13f/dW
         Rr/fJvoC0TR6wi84Hk0/0GkWfmuL0G6262ElZ0M2xfAluZ4uhLzs2Re5AdNxpTQ4j4L7
         RmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lD/1/eJL7BeGaassgoDCVeptYAk1TZ36MHCsp1wI7RU=;
        b=bVMq4+rlh7K60qIBQUorx0yFjHO83cfOeEXvt0R83NRZHrm5FWqzIQokxabpbWpShf
         quLPvFqDnMJQ+tJRuGjbGj4rwuPb74YcKGls/3agod5EvDYT1PeUJafb/+D1xH889ggS
         r1L7KZ1iSaRqP59bW29vm2wKWFPrI0yrioFF8a+9aYWQrFU2KqygpMnDGy2FlC/P0aCo
         qr1z1zG4Ugr9G5Tl8EnPf3tu1GJoCUBBACRBfm70GEbSrdcMvR3AsJ5vbm8yqky17zIL
         ww9eP2G+hXiWLn81pI+ApZwwQt6DYxwV0uiu8rWii28HxvuAMQBmfyXHEQagiTVNkFxK
         +WZA==
X-Gm-Message-State: AOAM533we6nkJviN2GR1BBbHrQlmkYobVmolBsLjEfYB0wZFYut/Wrcm
        /1rPW8D5FeFzpHnSoO5uSRQATesEKcLj
X-Google-Smtp-Source: ABdhPJw/ljdrXFwxl960aTKjvjfvvhmeqvlK8JiSg+eFhQ7slzWFvXVJIM7vA3XArM0CsAE4cWyGoQ==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr7889070wmc.72.1594810636725;
        Wed, 15 Jul 2020 03:57:16 -0700 (PDT)
Received: from linux-2.fritz.box (85-195-242-113.fiber7.init7.net. [85.195.242.113])
        by smtp.gmail.com with ESMTPSA id h2sm2833275wrw.62.2020.07.15.03.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 03:57:15 -0700 (PDT)
Message-ID: <956ec3169eec6b121339ed6c1aedd0f7ca08db43.camel@davidgf.net>
Subject: Re: System crash/lockup after plugging CDC ACM device
From:   David Guillen Fandos <david@davidgf.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 15 Jul 2020 12:57:14 +0200
In-Reply-To: <20200715105034.GB2880893@kroah.com>
References: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
         <20200715093029.GB2759174@kroah.com>
         <867592c41350b09a0cb67e9a3924f8a2f758d79a.camel@davidgf.net>
         <20200715105034.GB2880893@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-07-15 at 12:50 +0200, Greg KH wrote:
> On Wed, Jul 15, 2020 at 12:31:42PM +0200, David Guillen Fandos wrote:
> > On Wed, 2020-07-15 at 11:30 +0200, Greg KH wrote:
> > > On Wed, Jul 15, 2020 at 10:58:03AM +0200, David Guillen Fandos
> > > wrote:
> > > > Hello linux-usb,
> > > > 
> > > > I think I might have found a kernel bug related to the USB
> > > > subsystem
> > > > (cdc_acm perhaps).
> > > > 
> > > > Context: I was playing around with a device I'm creating,
> > > > essentially a
> > > > USB quad modem device that exposes four modems to the host
> > > > system.
> > > > This
> > > > device is still a prototype so there's a few bugs here and
> > > > there,
> > > > most
> > > > likely in the USB descriptors and control requests.
> > > > 
> > > > What happens: After plugging the device the system starts
> > > > spitting
> > > > warnings and BUGs and it locks up. Most of the time some CPUs
> > > > get
> > > > into
> > > > some spinloop and never comes back (you can see it being
> > > > detected
> > > > by
> > > > the watchdog after a few seconds). Generally after that the USB
> > > > devices
> > > > stop working completely and at some point the machine freezes
> > > > completely. In a couple of ocasions I managed to see a bug in
> > > > dmesg
> > > > saying "unable to handle page fault for address XXX" and
> > > > "Supervisor
> > > > read access in kernel mode" "error code (0x0000) not present
> > > > page".
> > > > I
> > > > could not get a trace for that one since the kernel died
> > > > completely
> > > > and
> > > > my log files were truncated/lost.
> > > > 
> > > > Since it is happening to my two machines (both Intel but rather
> > > > different controllers, Sunrise Point-LP USB 3.0 vs 8
> > > > Series/C220)
> > > > and
> > > > with different kernel versions I suspect this might be a bug in
> > > > the
> > > > kernel.
> > > > 
> > > > I have 4 logs that I collected, they are sort of long-ish, not
> > > > sure
> > > > how
> > > > to best send them to the list.
> > > 
> > > Send the crashes with the callback list, that should be quite
> > > small,
> > > right?  We don't need the full log.
> > > 
> > > The first crash is the most important, the others can be from the
> > > first
> > > one and are not reliable.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Ok then, here comes one of the logs, I selected some bits only
> > 
> > [  147.302016] WARNING: CPU: 3 PID: 134 at kernel/workqueue.c:1473
> > __queue_work+0x364/0x410
> > [...]
> > [  147.302322] Call Trace:
> > [  147.302329]  <IRQ>
> > [  147.302342]  queue_work_on+0x36/0x40
> > [  147.302353]  __usb_hcd_giveback_urb+0x9c/0x110
> > [  147.302362]  usb_giveback_urb_bh+0xa0/0xf0
> > [  147.302372]  tasklet_action_common.constprop.0+0x66/0x100
> > [  147.302382]  __do_softirq+0xe9/0x2dc
> > [  147.302391]  irq_exit+0xcf/0x110
> > [  147.302397]  do_IRQ+0x55/0xe0
> > [  147.302408]  common_interrupt+0xf/0xf
> > [  147.302413]  </IRQ>
> > [...]
> > [  184.771172] watchdog: BUG: soft lockup - CPU#3 stuck for 23s!
> > [kworker/3:2:134]
> 
> That was the first message?
> 
> Ok, we need some more logs, how about the 30 lines right before the
> above?
> 
> And what kernel version are you using?
> 
> thanks,
> 
> greg k-h

Heh I assumed you would find the 3rd stack more interesting since it
involves more subsystems but anyway, here we got, the first one with
more context. The trigger as you can see is me connecting the USB
device:

[  141.445367] usb 1-1: new full-speed USB device number 5 using
xhci_hcd
[  141.573592] usb 1-1: New USB device found, idVendor=0483,
idProduct=5740, bcdDevice= 2.00
[  141.573597] usb 1-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  141.573601] usb 1-1: Product: Quad-UART serial USB device
[  141.573603] usb 1-1: Manufacturer: davidgf.net
[  141.573605] usb 1-1: SerialNumber: serialno
[  142.375007] cdc_acm 1-1:1.0: ttyACM0: USB ACM device
[  142.376623] cdc_acm 1-1:1.2: ttyACM1: USB ACM device
[  142.378350] cdc_acm 1-1:1.4: ttyACM2: USB ACM device
[  142.379637] cdc_acm 1-1:1.6: ttyACM3: USB ACM device
[  142.382473] usbcore: registered new interface driver cdc_acm
[  142.382476] cdc_acm: USB Abstract Control Model driver for USB
modems and ISDN adapters
[  147.301997] ------------[ cut here ]------------
[  147.302016] WARNING: CPU: 3 PID: 134 at kernel/workqueue.c:1473
__queue_work+0x364/0x410
[  147.302019] Modules linked in: cdc_acm rfcomm ccm wireguard
curve25519_x86_64 libchacha20poly1305 chacha_x86_64 poly1305_x86_64
libblake2s blake2s_x86_64 ip6_udp_tunnel udp_tunnel
libcurve25519_generic libchacha libblake2s_generic nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat ip6table_nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle
iptable_raw iptable_security ip_set nf_tables nfnetlink ip6table_filter
ip6_tables iptable_filter cmac vboxnetadp(OE) vboxnetflt(OE) bnep
vboxdrv(OE) sunrpc vfat fat uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_v4l2 videobuf2_common videodev btusb btrtl btbcm btintel mc
bluetooth ecdh_generic ecc iTCO_wdt iTCO_vendor_support mei_hdcp
intel_rapl_msr dell_laptop x86_pkg_temp_thermal intel_powerclamp
coretemp kvm_intel kvm irqbypass intel_cstate intel_uncore
intel_rapl_perf iwlmvm
[  147.302121]  snd_hda_codec_hdmi mac80211 snd_soc_skl snd_soc_sst_ipc
snd_soc_sst_dsp dell_wmi snd_hda_ext_core dell_smbios
snd_hda_codec_realtek dcdbas libarc4 wmi_bmof dell_wmi_descriptor
snd_soc_acpi_intel_match snd_soc_acpi intel_wmi_thunderbolt
snd_hda_codec_generic snd_soc_core ledtrig_audio iwlwifi pcspkr
snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg
snd_hda_codec cfg80211 snd_hda_core snd_hwdep snd_seq snd_seq_device
joydev snd_pcm rfkill snd_timer snd i2c_i801 soundcore idma64
int3403_thermal intel_hid int3400_thermal sparse_keymap
acpi_thermal_rel mei_me intel_xhci_usb_role_switch acpi_pad roles mei
intel_pch_thermal processor_thermal_device intel_rapl_common
int340x_thermal_zone intel_soc_dts_iosf binfmt_misc ip_tables dm_crypt
i915 rtsx_pci_sdmmc mmc_core crct10dif_pclmul crc32_pclmul i2c_algo_bit
cec crc32c_intel drm_kms_helper nvme ghash_clmulni_intel drm nvme_core
serio_raw rtsx_pci hid_multitouch wmi i2c_hid video
pinctrl_sunrisepoint pinctrl_intel
[  147.302218]  fuse
[  147.302230] CPU: 3 PID: 134 Comm: kworker/3:2 Tainted:
G          IOE     5.7.7-200.fc32.x86_64 #1
[  147.302233] Hardware name: Dell Inc. XPS 13 9350/0PWNCR, BIOS 1.12.2
12/15/2019
[  147.302260] Workqueue:  0x0 (mm_percpu_wq)
[  147.302275] RIP: 0010:__queue_work+0x364/0x410
[  147.302282] Code: e0 f1 69 a9 00 01 1f 00 75 0f 65 48 8b 3c 25 c0 8b
01 00 f6 47 24 20 75 25 0f 0b 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f
c3 <0f> 0b e9 78 fe ff ff 41 83 cc 02 49 8d 57 60 e9 5d fe ff ff e8 53
[  147.302286] RSP: 0018:ffffbab980154e68 EFLAGS: 00010002
[  147.302292] RAX: ffff8f551b333790 RBX: 0000000000000048 RCX:
0000000000000000
[  147.302295] RDX: ffff8f551b333798 RSI: ffff8f5575803718 RDI:
ffff8f5576daa840
[  147.302299] RBP: ffff8f551b333790 R08: ffffffff97856cb0 R09:
0000000000000000
[  147.302302] R10: 0000000000000000 R11: ffffffff97856cb8 R12:
0000000000000003
[  147.302306] R13: 0000000000002000 R14: ffff8f5575c14e00 R15:
ffff8f5576db0700
[  147.302311] FS:  0000000000000000(0000) GS:ffff8f5576d80000(0000)
knlGS:0000000000000000
[  147.302315] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  147.302319] CR2: 00000000000000b0 CR3: 0000000267774004 CR4:
00000000003606e0
[  147.302322] Call Trace:
[  147.302329]  <IRQ>
[  147.302342]  queue_work_on+0x36/0x40
[  147.302353]  __usb_hcd_giveback_urb+0x9c/0x110
[  147.302362]  usb_giveback_urb_bh+0xa0/0xf0
[  147.302372]  tasklet_action_common.constprop.0+0x66/0x100
[  147.302382]  __do_softirq+0xe9/0x2dc
[  147.302391]  irq_exit+0xcf/0x110
[  147.302397]  do_IRQ+0x55/0xe0
[  147.302408]  common_interrupt+0xf/0xf
[  147.302413]  </IRQ>
[  147.302422] RIP: 0010:finish_task_switch+0x80/0x2a0
[  147.302428] Code: 8b 1c 25 c0 8b 01 00 0f 1f 44 00 00 0f 1f 44 00 00
41 c7 45 38 00 00 00 00 4c 89 e7 c6 07 00 0f 1f 40 00 fb 66 0f 1f 44 00
00 <65> 48 8b 04 25 c0 8b 01 00 0f 1f 44 00 00 4d 85 f6 74 21 65 48 8b
[  147.302431] RSP: 0018:ffffbab9802dfe30 EFLAGS: 00000246 ORIG_RAX:
ffffffffffffffdc
[  147.302438] RAX: ffff8f55676aa700 RBX: ffff8f556ec70000 RCX:
0000000000000000
[  147.302441] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
ffff8f5576daaec0
[  147.302444] RBP: ffffbab9802dfe58 R08: 0000000000000000 R09:
0000000000000000
[  147.302447] R10: 0000000000000001 R11: 0000000000000000 R12:
ffff8f5576daaec0
[  147.302450] R13: ffff8f55676aa700 R14: 0000000000000000 R15:
0000000000000000
[  147.302466]  __schedule+0x279/0x770
[  147.302474]  schedule+0x4a/0xb0
[  147.302484]  worker_thread+0xd1/0x3e0
[  147.302491]  ? process_one_work+0x380/0x380
[  147.302498]  kthread+0x115/0x140
[  147.302504]  ? __kthread_bind_mask+0x60/0x60
[  147.302514]  ret_from_fork+0x35/0x40
[  147.302524] ---[ end trace c3bd1c322016ab56 ]---
[  147.302618] ------------[ cut here ]------------

Thanks
David

