Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF4532324
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jun 2019 13:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfFBLY4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Jun 2019 07:24:56 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:42781 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfFBLYz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Jun 2019 07:24:55 -0400
Received: by mail-pf1-f180.google.com with SMTP id r22so8900346pfh.9
        for <linux-usb@vger.kernel.org>; Sun, 02 Jun 2019 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=oLCVyrrw3I2LnOVaNFmw/VQW/3G2HPl9W6jf4PU0u4w=;
        b=bC7akSM8R7jrlFXrBFqxCyXsiTaZ5e9S5zGAtyNKl0vjL+1qO5f82fZY/VtOnSTSct
         DvbK0XzzumlQAtcidXXIMYono2VRaeNdpZz4QXFamSqjQIFxQabl7nfnGP47A2nk8qGS
         r4BrfAjAhUOfTkiPWhle9EZff0aKvjuzXzP4eFtmAtXfE0eH9yJL6qbyuGJlzxNjXY56
         jLj3N9HbRE9TUkozoHETdpNkX1j1uv+bAakLXMZ8PLYURRdSrosF8TZVW+74Od294wZY
         mR1+TCBxmkrDknJE3tT/eVUNgdni4K3UzI4S2FBmuUFPoT1+JNDasTRNpcnGmZwT8yR0
         2g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oLCVyrrw3I2LnOVaNFmw/VQW/3G2HPl9W6jf4PU0u4w=;
        b=icnqczGHheMCSeKg3wBeuwoXeZ6vVeKOy87uGZbkN4Z0KbRZUyTVo4NFTAk8xw3Hhy
         845JoaUnafOcCx0UQUfft/CsPs12rQ0MfppK8Zv2xIWrJewxcP5UA1qXpds4J3PMLI3Y
         Hcsmf+lOKyrEVDTSEWSAJ6Pd/A/o+vmIFBkC+tVDVA2C+k8D8jEiPAlDqDLWV5Dz6B+h
         yJ6GP5KQU99J+ROcOpEeXtYqBUTh/HVGAqvxFibCr/r2hcsOy1ONJQWtW32GevNBc9eQ
         HSzPqRSoitm5nvs+Q9SsrUUSlBCG7YKbIXsY23VMR4ibnSPussvPgozTLVZyhP+rtWJR
         7hOw==
X-Gm-Message-State: APjAAAVNsk4LqOxfOBdq7sTRAjiQ4Cry6qPpEtzGOYKuAvnNFt/AElEC
        r9c389672GWXbn7G4VcVPOO8IwB9CfmZjQbaW1w+wegvEVI=
X-Google-Smtp-Source: APXvYqymFAkF/cNgzqWynCxmEfJf/pgezmQ4toyP+iWAVv4PJ5SVgu1r3kpg8o0K3kGoNIVEjSJf93ucA3umX6snmZc=
X-Received: by 2002:a17:90a:730b:: with SMTP id m11mr22041836pjk.89.1559474694515;
 Sun, 02 Jun 2019 04:24:54 -0700 (PDT)
MIME-Version: 1.0
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Sun, 2 Jun 2019 21:24:43 +1000
Message-ID: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
Subject: kernel NULL pointer dereference, ucsi bug
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Good day,

There's a problem with ucsi starting from 5.2-rc1 (maybe earlier
versions of 5.2 are affected too).
Recently I've tried these versions of rc3 (commits), all have this issue:
3ab4436f688c2d2f221793953cd05435ca84261c (05/31)
3ea3091f1bd8586125848c62be295910e9802af0
cd6c84d8f0cdc911df435bb075ba22ce3c605b07 (rc2)

These are lines from journal logs (more in the attachment):
Jun 01 16:17:27 kernel: BUG: kernel NULL pointer dereference, address:
0000000000000368
Jun 01 16:17:27 kernel: #PF: supervisor read access in kernel mode
Jun 01 16:17:27 kernel: #PF: error_code(0x0000) - not-present page
Jun 01 16:17:27 kernel: Oops: 0000 [#1] PREEMPT SMP PTI
Jun 01 16:17:27 kernel: CPU: 7 PID: 252 Comm: kworker/7:2 Tainted: G
  U     OE     5.2.0-1-MANJARO #1
Jun 01 16:17:27 kernel: Hardware name: Timi TM1701/TM1701, BIOS
XMAKB5R0P0906 10/23/2018
Jun 01 16:17:27 kernel: Workqueue: events_long ucsi_init [typec_ucsi]
Jun 01 16:17:27 kernel: RIP: 0010:typec_altmode_get_partner+0x5/0x20 [typec]
Jun 01 16:17:27 kernel: Code: 85 c0 74 08 e9 3c 8a 78 e2 31 c0 c3 b8
a1 ff ff ff c3 b8 ed ff ff ff c3 66 66 2e 0f 1f 84 00 00 00 00 00 66
90 0f 1f 44 00 00 <48> 8b 87 68 03 00 00 48 83 c0 08 c3 66 66 2e 0f 1f
84 00 00 00 00
Jun 01 16:17:27 kernel: RSP: 0018:ffffa67542123e00 EFLAGS: 00010293
Jun 01 16:17:27 kernel: RAX: 0000000000000000 RBX: ffff8e9485a56800
RCX: 0000000000000000
Jun 01 16:17:27 kernel: RDX: 0000000000000000 RSI: 0000000000000246
RDI: 0000000000000000
Jun 01 16:17:27 kernel: RBP: 0000000000000000 R08: ffff8e949ebdbdc0
R09: 0000000000000000
Jun 01 16:17:27 kernel: R10: 0000000000000000 R11: 0000000000000000
R12: 0000000000000000
Jun 01 16:17:27 kernel: R13: ffff8e9499237540 R14: ffff8e9485a56ac0
R15: ffff8e9485a56800
Jun 01 16:17:27 kernel: FS:  0000000000000000(0000)
GS:ffff8e949ebc0000(0000) knlGS:0000000000000000
Jun 01 16:17:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 01 16:17:27 kernel: CR2: 0000000000000368 CR3: 00000001c8a0a003
CR4: 00000000003606e0
Jun 01 16:17:27 kernel: Call Trace:
Jun 01 16:17:27 kernel:  ucsi_altmode_update_active+0x85/0x100 [typec_ucsi]
Jun 01 16:17:27 kernel:  ucsi_init+0x398/0x590 [typec_ucsi]
Jun 01 16:17:27 kernel:  process_one_work+0x1eb/0x410
Jun 01 16:17:27 kernel:  worker_thread+0x2d/0x3d0
Jun 01 16:17:27 kernel:  ? process_one_work+0x410/0x410
Jun 01 16:17:27 kernel:  kthread+0x112/0x130
Jun 01 16:17:27 kernel:  ? kthread_park+0x80/0x80
Jun 01 16:17:27 kernel:  ret_from_fork+0x35/0x40
Jun 01 16:17:27 kernel: Modules linked in: bnep arc4 sunrpc iwlmvm
rtsx_usb_ms btusb memstick btrtl cdc_ether btbcm usbnet btintel
uvcvideo r8152 bluetooth mii snd_hda_codec_hdmi mac80211
videobuf2_vmalloc videobuf2_memops snd_soc_skl intel_rapl
videobuf2_v4l2 snd_soc_hdac_hda videobuf2_common x86_pkg_temp_thermal
intel_powerclamp videodev snd_hda_ext_core snd_soc_skl_ipc
snd_soc_sst_ipc coretemp ecdh_generic media ecc snd_hda_codec_realtek
kvm_intel snd_soc_sst_dsp snd_soc_acpi_intel_match joydev snd_soc_acpi
snd_hda_codec_generic snd_soc_core fuse iwlwifi mousedev ledtrig_audio
mei_hdcp kvm snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel
iTCO_wdt iTCO_vendor_support cfg80211 snd_hda_codec snd_hda_core
snd_hwdep hid_multitouch snd_pcm irqbypass snd_timer intel_cstate
intel_uncore snd idma64 intel_rapl_perf psmouse mei_me ucsi_acpi
typec_ucsi pcspkr input_leds intel_wmi_thunderbolt intel_lpss_pci mei
intel_xhci_usb_role_switch soundcore rfkill i2c_i801 wmi_bmof
intel_pch_thermal intel_lpss roles
Jun 01 16:17:27 kernel:  typec i2c_hid intel_hid battery sparse_keymap
ac evdev mac_hid pcc_cpufreq nf_log_ipv6 ip6t_REJECT nf_reject_ipv6
xt_hl ip6t_rt nf_log_ipv4 nf_log_common ipt_REJECT nf_reject_ipv4
xt_LOG xt_multiport xt_CT iptable_raw xt_limit xt_addrtype xt_tcpudp
xt_conntrack ip6table_filter ip6_tables nf_conntrack_netbios_ns
nf_conntrack_broadcast nf_nat_ftp nf_nat nf_conntrack_ftp nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_filter vboxnetflt(OE)
vboxnetadp(OE) vboxpci(OE) vboxdrv(OE) vboxvideo ttm vboxsf(OE)
vboxguest uinput sg crypto_user acpi_call(OE) ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 algif_skcipher af_alg hid_apple
hid_generic usbhid hid rtsx_usb_sdmmc mmc_core rtsx_usb uas
usb_storage dm_crypt dm_mod nls_iso8859_1 nls_cp437 sd_mod
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel serio_raw atkbd
libps2 aesni_intel ahci libahci libata aes_x86_64 xhci_pci crypto_simd
cryptd glue_helper xhci_hcd scsi_mod i8042 tpm_crb serio tpm_tis wmi
tpm_tis_core
Jun 01 16:17:27 kernel:  crc32c_intel vfat fat tpm rng_core i915
i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops drm intel_agp intel_gtt agpgart
Jun 01 16:17:27 kernel: CR2: 0000000000000368
Jun 01 16:17:27 kernel: ---[ end trace 05c2c0e558309d1c ]---
Jun 01 16:17:27 kernel: RIP: 0010:typec_altmode_get_partner+0x5/0x20 [typec]
Jun 01 16:17:27 kernel: Code: 85 c0 74 08 e9 3c 8a 78 e2 31 c0 c3 b8
a1 ff ff ff c3 b8 ed ff ff ff c3 66 66 2e 0f 1f 84 00 00 00 00 00 66
90 0f 1f 44 00 00 <48> 8b 87 68 03 00 00 48 83 c0 08 c3 66 66 2e 0f 1f
84 00 00 00 00
Jun 01 16:17:27 kernel: RSP: 0018:ffffa67542123e00 EFLAGS: 00010293
Jun 01 16:17:27 kernel: RAX: 0000000000000000 RBX: ffff8e9485a56800
RCX: 0000000000000000
Jun 01 16:17:27 kernel: RDX: 0000000000000000 RSI: 0000000000000246
RDI: 0000000000000000
Jun 01 16:17:27 kernel: RBP: 0000000000000000 R08: ffff8e949ebdbdc0
R09: 0000000000000000
Jun 01 16:17:27 kernel: R10: 0000000000000000 R11: 0000000000000000
R12: 0000000000000000
Jun 01 16:17:27 kernel: R13: ffff8e9499237540 R14: ffff8e9485a56ac0
R15: ffff8e9485a56800
Jun 01 16:17:27 kernel: FS:  0000000000000000(0000)
GS:ffff8e949ebc0000(0000) knlGS:0000000000000000
Jun 01 16:17:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 01 16:17:27 kernel: CR2: 0000000000000368 CR3: 00000001c8a0a003
CR4: 00000000003606e0
inxi -Fxz
----------------------------------------------------------------------------------------------------------

System:    Host: <HOSTNAME> Kernel: 5.1.5-1-MANJARO x86_64 bits: 64
compiler: gcc v: 8.3.0
           Desktop: KDE Plasma 5.15.5 Distro: Manjaro Linux
Machine:   Type: Laptop System: Timi product: TM1701 v: N/A serial: <filter>
           Mobo: Timi model: TM1701 v: MP serial: <filter> UEFI:
INSYDE v: XMAKB5R0P0906
           date: 10/23/2018
Battery:   ID-1: BAT0 charge: 54.3 Wh condition: 54.3/60.0 Wh (90%)
model: SUNWODA R15B01W
           status: Full
CPU:       Topology: Quad Core model: Intel Core i7-8550U bits: 64
type: MT MCP arch: Kaby Lake
           rev: A L2 cache: 8192 KiB
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 ssse3
vmx bogomips: 31880
           Speed: 3034 MHz min/max: 400/4000 MHz Core speeds (MHz): 1:
2700 2: 2700 3: 2700
           4: 2700 5: 2700 6: 2700 7: 2700 8: 2700
Graphics:  Device-1: Intel UHD Graphics 620 vendor: Xiaomi driver:
i915 v: kernel bus ID: 00:02.0
           Device-2: NVIDIA GP108M [GeForce MX150] driver: N/A bus ID: 01:00.0
           Display: x11 server: X.Org 1.20.4 driver: intel
           resolution: 1920x1080~60Hz, 1920x1080~60Hz
           OpenGL: renderer: Mesa DRI Intel UHD Graphics 620 (Kabylake
GT2) v: 4.5 Mesa 19.0.5
           direct render: Yes
Audio:     Device-1: Intel Sunrise Point-LP HD Audio vendor: Xiaomi
driver: snd_hda_intel
           v: kernel bus ID: 00:1f.3
           Sound Server: ALSA v: k5.1.5-1-MANJARO
Network:   Device-1: Intel Wireless 8265 / 8275 driver: iwlwifi v:
kernel port: 4040
           bus ID: 02:00.0
           IF: wlp2s0 state: up mac: <filter>
           Device-2: Realtek RTL8153 Gigabit Ethernet Adapter type:
USB driver: r8152
           bus ID: 2-1.1:3

-- 
----
Best regards,
Vladimir Yerilov
