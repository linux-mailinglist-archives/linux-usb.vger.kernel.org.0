Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB8B26DFB0
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 17:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgIQPbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 11:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbgIQPb3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 11:31:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4476AC061756
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 08:31:19 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 665E429C4E8
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: xhci problem -> general protection fault
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Message-ID: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
Date:   Thu, 17 Sep 2020 17:30:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear All,

I have encountered a problem in xhci which leads to general protection fault.

The problem is triggered by running this program:

https://gitlab.collabora.com/andrzej.p/bulk-cancel.git

$ sudo ./bulk-cancel -D /dev/bus/usb/002/006 -i 1 -b 1

where /dev/bus/usb/002/006 is a Gadget Zero:

$ lsusb -t
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/9p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 1: Dev 4, If 0, Class=Vendor Specific Class, Driver=cp210x, 12M
         |__ Port 2: Dev 6, If 0, Class=Vendor Specific Class, Driver=usbtest, 480M
         |__ Port 4: Dev 7, If 0, Class=Hub, Driver=hub/4p, 480M
     |__ Port 7: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
     |__ Port 7: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
     |__ Port 8: Dev 5, If 0, Class=Video, Driver=uvcvideo, 480M
     |__ Port 8: Dev 5, If 1, Class=Video, Driver=uvcvideo, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/3p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M

[ --- gadget info
the gadget runs on an Odroid U3, with legacy g_zero compiled-in

# ls -l /sys/module/g_zero/
total 0
drwxr-xr-x 2 root root    0 Mar 15 12:23 parameters
--w------- 1 root root 4096 Nov  3  2016 uevent

and running

# uname -r
5.7.0

end of gadget info, back to the USB host --- ]

and iommu is turned on:

$ cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-5.8.0 root=UUID=<UUID> ro intel_iommu=on quiet splash 
vt.handoff=1

$ uname -r
5.8.0

It takes less than a minute until the crash happens.
The DMAR (iommu) errors don't happen always, i.e. there are crashes
when they are not reported in the system log. In either case the

"WARN Cannot submit Set TR Deq Ptr"
"A Set TR Deq Ptr command is pending."
"WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state."

messages do appear.

This is what is in the system log:

xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or 
ep state.

[... tens of occurences ...]

xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or 
ep state.
DMAR: DRHD: handling fault status reg 3
DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr ffe20000 
[fault reason 05] PTE Write access is not set
xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or 
ep state.

[... tens of occurences ...]

xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or 
ep state.
DMAR: DRHD: handling fault status reg 3
DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr ffcf8000 
[fault reason 05] PTE Write access is not set
xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or 
ep state.

[... tens of occurences ...]

xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or 
ep state.
general protection fault, probably for non-canonical address 0x18d159165869aac4: 
0000 [#1] SMP PTI
CPU: 1 PID: 1644 Comm: bulk-cancel Not tainted 5.8.0 #553
Hardware name: LENOVO 20B7S4L800/20B7S4L800, BIOS GJET82WW (2.32 ) 01/09/2015
RIP: 0010:__kmalloc+0x9e/0x270
Code: 7a 01 00 00 4d 8b 01 65 49 8b 50 08 65 4c 03 05 30 ea 95 69 4d 8b 20 4d 85 
e4 0f 84 88 01 00 00 41 8b 41 20 49 8b 39 4c 01 e0 <48> 8b 18 49 33 99 70 01 00 
00 48 89 c1 48 0f c9 4c 89 e0 48 31 cb
RSP: 0018:ffffb584c0f4fd48 EFLAGS: 00010202
RAX: 18d159165869aac4 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 00000000000076f4 RSI: 0000000000000cc0 RDI: 0000000000031120
RBP: ffffb584c0f4fd78 R08: ffff992f16671120 R09: ffff992f15406f40
R10: ffffb584c0f4fd28 R11: ffff992eeb1cf338 R12: 18d159165869aa44
R13: 0000000000000cc0 R14: 0000000000000100 R15: ffff992f15406f40
FS:  00007f664cbf3140(0000) GS:ffff992f16640000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0c14f9e1d8 CR3: 00000001f26e6004 CR4: 00000000001606e0
Call Trace:
  ? proc_do_submiturb+0xc3a/0xe10
  proc_do_submiturb+0xc3a/0xe10
  usbdev_ioctl+0x8fa/0x1480
  ? fput+0x13/0x20
  ? do_timerfd_settime+0x2d5/0x470
  ksys_ioctl+0x98/0xb0
  __x64_sys_ioctl+0x1a/0x20
  do_syscall_64+0x48/0xc0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f664c4f06d7
Code: b3 66 90 48 8b 05 b1 47 2d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 
66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 
48 8b 0d 81 47 2d 00 f7 d8 64 89 01 48
RSP: 002b:00007fffab782528 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000055f16fd78330 RCX: 00007f664c4f06d7
RDX: 000055f16fd6d2b0 RSI: 000000008038550a RDI: 0000000000000003
RBP: 000055f16fd79bf0 R08: 000055f16fd6d2b0 R09: 000055f16fd6f540
R10: 000055f16fd79bf0 R11: 0000000000000246 R12: 0000000000000001
R13: 000055f16fd6d2b0 R14: 0000000000000000 R15: 0000000000000000
Modules linked in: ccm overlay cmac bnep intel_rapl_msr intel_rapl_common 
x86_pkg_temp_thermal intel_powerclamp coretemp snd_hda_codec_hdmi kvm_intel 
snd_hda_codec_realtek kvm snd_hda_codec_generic irqbypass snd_hda_intel 
snd_intel_dspcfg i915 snd_hda_codec crct10dif_pclmul snd_hda_core crc32_pclmul 
snd_hwdep ghash_clmulni_intel snd_pcm uvcvideo aesni_intel cec crypto_simd 
cryptd glue_helper rapl intel_cstate rc_core videobuf2_vmalloc videobuf2_memops 
btusb iwlmvm snd_seq_midi mac80211 snd_seq_midi_event btrtl videobuf2_v4l2 
thinkpad_acpi drm_kms_helper libarc4 btbcm joydev input_leds snd_rawmidi 
videobuf2_common nvram btintel ledtrig_audio wmi_bmof serio_raw cp210x snd_seq 
iwlwifi bluetooth drm videodev cfg80211 usbserial ecdh_generic mc ecc 
snd_seq_device i2c_algo_bit fb_sys_fops usbtest snd_timer syscopyarea 
sysfillrect sysimgblt snd mei_me mei mac_hid soundcore lpc_ich sch_fq_codel 
parport_pc ppdev lp parport ip_tables x_tables autofs4 rtsx_pci_sdmmc psmouse 
ahci libahci
  e1000e rtsx_pci wmi video
---[ end trace 93d969fc4f8e5305 ]---
