Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538B826FFAF
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 16:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgIROUp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 10:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIROUp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 10:20:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A80BC0613CE
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 07:20:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id E7A2D28D45C
Subject: Re: xhci problem -> general protection fault
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "kernel@collabora.com" <kernel@collabora.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
Date:   Fri, 18 Sep 2020 16:20:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

W dniu 18.09.2020 o 12:50, Mathias Nyman pisze:
> On 17.9.2020 18.30, Andrzej Pietrasiewicz wrote:
>> Dear All,
>>
>> I have encountered a problem in xhci which leads to general protection fault.
>>
>> The problem is triggered by running this program:
>>
>> https://gitlab.collabora.com/andrzej.p/bulk-cancel.git
>>
>> $ sudo ./bulk-cancel -D /dev/bus/usb/002/006 -i 1 -b 1
>>
>> where /dev/bus/usb/002/006 is a Gadget Zero:
>>
>> It takes less than a minute until the crash happens.
>> The DMAR (iommu) errors don't happen always, i.e. there are crashes
>> when they are not reported in the system log. In either case the
>>
>> "WARN Cannot submit Set TR Deq Ptr"
>> "A Set TR Deq Ptr command is pending."
>> "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state."
>>
>> messages do appear.
>>
> 
> Nice testcase and report, thanks.
> 
> I started looking at issues in this area some time ago, and wrote a couple patches but
> it was left hanging. The two patches (now rebased on 5.9-rc3) can be found in my tree in the
> fix_invalid_context_at_stop_endpoint branch
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_invalid_context_at_stop_endpoint
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_invalid_context_at_stop_endpoint
> 
> If you could give those a try and see if they help I'd be grateful.

No, it doesn't help, albeit the errors are slightly different:

xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
dmar_fault: 44 callbacks suppressed
DRHD: handling fault status reg 3
DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr ffcda000 
[fault reason 05] PTE Write access is not set
DMAR: DRHD: handling fault status reg 3
DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr ffee8000 
[fault reason 05] PTE Write access is not set
xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is pending.
DMAR: DRHD: handling fault status reg 3
DMAR: [DMA Write] Request device [00:14.0] PASID ffffffff fault addr fff8b000 
[fault reason 05] PTE Write access is not set
DMAR: DRHD: handling fault status reg 3
xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD 
ep_index 2 comp_code 3
xhci_hcd 0000:00:14.0: Looking for event-dma 00000000fff49dd0 trb-start 
00000000fff49e00 trb-end 00000000fff49e10 seg-start 00000000fff49000 seg-end 
00000000fff49ff0
xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD 
ep_index 2 comp_code 3
xhci_hcd 0000:00:14.0: Looking for event-dma 00000000fff49dd0 trb-start 
00000000fff49e00 trb-end 00000000fff49e20 seg-start 00000000fff49000 seg-end

> 
> also, if possible, can you add xhci dynamic debug and traces to show in more detail what is going on.
> 
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> < Run the testcase >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace
> 

For 5.9-rc3 _without_ your patches:

xhci_hcd 0000:00:14.0: Babble error for slot 5 ep 2 on endpoint
xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
xhci_hcd 0000:00:14.0: Finding endpoint context
xhci_hcd 0000:00:14.0: Cycle state = 0x1
xhci_hcd 0000:00:14.0: New dequeue segment = 000000000a108eaa (virtual)
xhci_hcd 0000:00:14.0: New dequeue pointer = 0xfff4b010 (DMA)
xhci_hcd 0000:00:14.0: Queueing new dequeue state
xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 000000000a108eaa 
(0xfff4b000 dma), new deq ptr = 000000006e3d8c35 (0xfff4b010 dma), new cycle = 1
xhci_hcd 0000:00:14.0: // Ding dong!
xhci_hcd 0000:00:14.0: Giveback URB 000000008b374ed9, len = 0, expected = 256, 
status = -75
xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @fff4b010
xhci_hcd 0000:00:14.0: Babble error for slot 5 ep 2 on endpoint
xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
xhci_hcd 0000:00:14.0: Finding endpoint context
xhci_hcd 0000:00:14.0: Cycle state = 0x1
xhci_hcd 0000:00:14.0: New dequeue segment = 000000000a108eaa (virtual)
xhci_hcd 0000:00:14.0: New dequeue pointer = 0xfff4b020 (DMA)
xhci_hcd 0000:00:14.0: Queueing new dequeue state
xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 000000000a108eaa 
(0xfff4b000 dma), new deq ptr = 00000000355aae2b (0xfff4b020 dma), new cycle = 1
xhci_hcd 0000:00:14.0: // Ding dong!
xhci_hcd 0000:00:14.0: Giveback URB 0000000014c841b0, len = 0, expected = 256, 
status = -75
xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @fff4b020
xhci_hcd 0000:00:14.0: Babble error for slot 5 ep 2 on endpoint
xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
xhci_hcd 0000:00:14.0: Finding endpoint context
xhci_hcd 0000:00:14.0: Cycle state = 0x1
xhci_hcd 0000:00:14.0: New dequeue segment = 000000000a108eaa (virtual)
xhci_hcd 0000:00:14.0: New dequeue pointer = 0xfff4b030 (DMA)
xhci_hcd 0000:00:14.0: Queueing new dequeue state
xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 000000000a108eaa 
(0xfff4b000 dma), new deq ptr = 00000000ce04ba9f (0xfff4b030 dma), new cycle = 1
xhci_hcd 0000:00:14.0: // Ding dong!
xhci_hcd 0000:00:14.0: Giveback URB 000000008b374ed9, len = 0, expected = 256, 
status = -75


[above blocks repeat a gazillion times]

xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @fff4bd10
xhci_hcd 0000:00:14.0: Babble error for slot 5 ep 2 on endpoint
xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
xhci_hcd 0000:00:14.0: Finding endpoint context
xhci_hcd 0000:00:14.0: Cycle state = 0x0
xhci_hcd 0000:00:14.0: New dequeue segment = 000000000a108eaa (virtual)
xhci_hcd 0000:00:14.0: New dequeue pointer = 0xfff4bd20 (DMA)
xhci_hcd 0000:00:14.0: Queueing new dequeue state
xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 000000000a108eaa 
(0xfff4b000 dma), new deq ptr = 00000000e2b08aa6 (0xfff4bd20 dma), new cycle = 0
xhci_hcd 0000:00:14.0: // Ding dong!
xhci_hcd 0000:00:14.0: Giveback URB 00000000ea1584be, len = 0, expected = 256, 
status = -75
xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @fff4bd20
xhci_hcd 0000:00:14.0: Babble error for slot 5 ep 2 on endpoint
xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
xhci_hcd 0000:00:14.0: Finding endpoint context
xhci_hcd 0000:00:14.0: Cycle state = 0x0
xhci_hcd 0000:00:14.0: New dequeue segment = 000000000a108eaa (virtual)
xhci_hcd 0000:00:14.0: New dequeue pointer = 0xfff4bd30 (DMA)
xhci_hcd 0000:00:14.0: Queueing new dequeue state
xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 000000000a108eaa 
(0xfff4b000 dma), new deq ptr = 00000000d04439dd (0xfff4bd30 dma), new cycle = 0
xhci_hcd 0000:00:14.0: // Ding dong!
xhci_hcd 0000:00:14.0: Giveback URB 000000007e94171c, len = 0, expected = 256, 
status = -75
xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @fff4bd30
xhci_hcd 0000:00:14.0: Babble error for slot 5 ep 2 on endpoint
xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
xhci_hcd 0000:00:14.0: Finding endpoint context
xhci_hcd 0000:00:14.0: Cycle state = 0x0
xhci_hcd 0000:00:14.0: New dequeue segment = 000000000a108eaa (virtual)
xhci_hcd 0000:00:14.0: New dequeue pointer = 0xfff4bd40 (DMA)
xhci_hcd 0000:00:14.0: Queueing new dequeue state
xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 000000000a108eaa 
(0xfff4b000 dma), new deq ptr = 000000007a585f64 (0xfff4bd40 dma), new cycle = 0
xhci_hcd 0000:00:14.0: // Ding dong!
xhci_hcd 0000:00:14.0: Giveback URB 000000000c30ab36, len = 0, expected = 256, 
status = -75
xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @fff4bd40
xhci_hcd 0000:00:14.0: Babble error for slot 5 ep 2 on endpoint
xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
xhci_hcd 0000:00:14.0: Finding endpoint context
xhci_hcd 0000:00:14.0: Cycle state = 0x0
xhci_hcd 0000:00:14.0: New dequeue segment = 000000000a108eaa (virtual)
xhci_hcd 0000:00:14.0: New dequeue pointer = 0xfff4bd50 (DMA)
xhci_hcd 0000:00:14.0: Queueing new dequeue state
xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 000000000a108eaa 
(0xfff4b000 dma), new deq ptr = 00000000bbfef907 (0xfff4bd50 dma), new cycle = 0
xhci_hcd 0000:00:14.0: // Ding dong!
xhci_hcd 0000:00:14.0: Giveback URB 0000000042fc26fe, len = 0, expected = 256, 
status = -75
xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @fff4bd50
general protection fault: 0000 [#2] SMP PTI
CPU: 3 PID: 1061 Comm: gnome-shell Tainted: G      D           5.4.0-47-generic 
#51~18.04.1-Ubuntu
Hardware name: LENOVO 20B7S4L800/20B7S4L800, BIOS GJET82WW (2.32 ) 01/09/2015
RIP: 0010:kmem_cache_alloc_trace+0x7e/0x220
Code: b9 01 00 00 4d 8b 01 65 49 8b 50 08 65 4c 03 05 50 8e b6 6e 4d 8b 30 4d 85 
f6 0f 84 56 01 00 00 41 8b 41 20 49 8b 39 4c 01 f0 <48> 8b 18 49 33 99 70 01 00 
00 48 89 c1 48 0f c9 4c 89 f0 48 31 cb
RSP: 0018:ffffa3a640bfbeb8 EFLAGS: 00010206
RAX: 56329a4a4f062eb2 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 000000000000053b RSI: 0000000000000dc0 RDI: 000000000002f120
RBP: ffffa3a640bfbef0 R08: ffff9563164ef120 R09: ffff956315406f40
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000dc0
R13: ffff956315406f40 R14: 56329a4a4f062eb2 R15: ffffffff9153683c
FS:  00007fefcba2dac0(0000) GS:ffff9563164c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00001d94d9640000 CR3: 00000001ec1ec006 CR4: 00000000001606e0
Call Trace:
  __x64_sys_timerfd_create+0x6c/0x1a0
  do_syscall_64+0x57/0x190
  entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fefc8af6757
Code: 73 01 c3 48 8b 0d 31 87 2c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 
00 00 00 00 00 0f 1f 44 00 00 b8 1b 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 
48 8b 0d 01 87 2c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffee678ad78 EFLAGS: 00000246 ORIG_RAX: 000000000000011b
RAX: ffffffffffffffda RBX: 0000555750f80560 RCX: 00007fefc8af6757
RDX: 0000000ed6f808b0 RSI: 0000000000080000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000555750f80560 R09: 00007fefc8dbfc40
R10: 0000000000000007 R11: 0000000000000246 R12: 000000005f64c06c
R13: 000000005f64c030 R14: 0000000000000000 R15: 0000000000000000
Modules linked in: ccm aufs overlay cmac bnep intel_rapl_msr mei_hdcp 
intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm 
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_hda_codec_hdmi 
snd_hda_codec_realtek snd_hda_codec_generic aesni_intel crypto_simd cryptd 
glue_helper snd_hda_intel rapl snd_intel_dspcfg snd_hda_codec iwlmvm 
snd_hda_core snd_hwdep mac80211 uvcvideo intel_cstate videobuf2_vmalloc libarc4 
videobuf2_memops videobuf2_v4l2 videobuf2_common snd_pcm cp210x joydev usbtest 
usbserial videodev input_leds rtsx_pci_ms iwlwifi serio_raw mc wmi_bmof memstick 
i915 snd_seq_midi snd_seq_midi_event btusb btrtl btbcm btintel bluetooth 
thinkpad_acpi snd_rawmidi ecdh_generic cfg80211 ecc nvram ledtrig_audio snd_seq 
drm_kms_helper snd_seq_device drm snd_timer snd i2c_algo_bit fb_sys_fops 
syscopyarea mac_hid sysfillrect sysimgblt mei_me lpc_ich mei soundcore 
sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4 
rtsx_pci_sdmmc psmouse
  ahci libahci rtsx_pci e1000e wmi video
---[ end trace ac9831e33eee8ef0 ]---
RIP: 0010:__kmalloc+0x9e/0x270
Code: 7f 01 00 00 4d 8b 01 65 49 8b 50 08 65 4c 03 05 70 84 b6 6e 4d 8b 20 4d 85 
e4 0f 84 8d 01 00 00 41 8b 41 20 49 8b 39 4c 01 e0 <48> 8b 18 49 33 99 70 01 00 
00 48 89 c1 48 0f c9 4c 89 e0 48 31 cb
RSP: 0018:ffffa3a640577ca8 EFLAGS: 00010206
RAX: 56329a4a4f062eb2 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 000000000000053b RSI: 0000000000000cc0 RDI: 000000000002f120
RBP: ffffa3a640577cd8 R08: ffff9563164ef120 R09: ffff956315406f40
R10: ffff95630af85598 R11: ffff9562ed344338 R12: 56329a4a4f062eb2
R13: 0000000000000cc0 R14: 0000000000000100 R15: ffff956315406f40
FS:  00007fefcba2dac0(0000) GS:ffff9563164c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00001d94d9640000 CR3: 00000001ec1ec006 CR4: 00000000001606e0


# cat /sys/kernel/debug/tracing/trace
# tracer: nop
#
# entries-in-buffer/entries-written: 0/0   #P:8
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |

[empty contents!]

Andrzej
