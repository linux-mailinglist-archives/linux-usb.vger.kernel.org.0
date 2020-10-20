Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FC92943F6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 22:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409555AbgJTUh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 16:37:28 -0400
Received: from static.214.254.202.116.clients.your-server.de ([116.202.254.214]:49182
        "EHLO ciao.gmane.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409553AbgJTUh1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 16:37:27 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glug-linux-usb@m.gmane-mx.org>)
        id 1kUyNp-0000jQ-EI
        for linux-usb@vger.kernel.org; Tue, 20 Oct 2020 22:37:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-usb@vger.kernel.org
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Date:   Tue, 20 Oct 2020 22:37:19 +0200
Message-ID: <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Cc:     felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
In-Reply-To: <874kmpf583.fsf@kernel.org>
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Op 20-10-2020 om 14:32 schreef Felipe Balbi:
> 
> Hi,
> 
> Ferry Toth <fntoth@gmail.com> writes:
> 
> 8< snip
> 
>>>> [   12.657416] CR2: 0000000100000000
>>>> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---
>>>
>>> It this something you can reproduce on your end? Ferry, can you get dwc3
>>> trace logs when this happens? ftrace_dump_on_oops may help here.
>> I will do that tonight. Is flipping on ftrace_dump_on_oops sufficient or
>> do I need to do more?
> 
> you'd have to enable dwc3 trace events first ;-)
> 
>> BTW after posting this I found in host mode dwc3 is not working properly
>> either. No oops, but no driver get loaded on device plug in.
> 
> okay
> 
Ehem, you maybe only me to enable /dwc3/dwc3_ep_dequeue/enable:

root@edison:/boot# uname -a
Linux edison 5.9.0-edison-acpi-standard #1 SMP Mon Oct 19 20:17:04 UTC 
2020 x86_64 x86_64 x86_64 GNU/Linux
root@edison:/boot# echo 1 > 
/sys/kernel/debug/tracing/events/dwc3/dwc3_ep_dequeue/enable
root@edison:/boot# echo 1 > /proc/sys/kernel/ftrace_dump_on_oops
root@edison:/boot#
root@edison:/boot# [ 2608.585323] BUG: kernel NULL pointer dereference, 
address: 0000000000000000
[ 2608.592288] #PF: supervisor read access in kernel mode
[ 2608.597419] #PF: error_code(0x0000) - not-present page
[ 2608.602549] PGD 0 P4D 0
[ 2608.605090] Oops: 0000 [#1] SMP PTI
[ 2608.608580] CPU: 1 PID: 733 Comm: irq/15-dwc3 Not tainted 
5.9.0-edison-acpi-standard #1
[ 2608.616571] Hardware name: Intel Corporation Merrifield/BODEGA BAY, 
BIOS 542 2015.01.21:18.19.48
[ 2608.625356] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0
[ 2608.630580] Code: e9 51 01 00 00 4c 8d a3 30 01 00 00 4c 89 e7 e8 15 
e6 42 00 49 8b 4e 48 49 89 c5 49 8d 46 48 48 8d 51 a0 48 39 c8 75 0f eb 
2e <48> 8b 4a 60 48 8d 51 a0 48 39 c8 74 21 48 39 d5 75 ee 45 31 f6 4c
[ 2608.649320] RSP: 0018:ffffa838002a7c40 EFLAGS: 00010087
[ 2608.654543] RAX: ffff9a5f4609c048 RBX: ffff9a5f46f48028 RCX: 
0000000000000000
[ 2608.661666] RDX: ffffffffffffffa0 RSI: 0000000000000008 RDI: 
ffff9a5f46f48158
[ 2608.668790] RBP: ffff9a5f7bd09b40 R08: 00000000000002d8 R09: 
ffff9a5f7dd6a000
[ 2608.675913] R10: ffffa838002a7d90 R11: ffff9a5f46f48300 R12: 
ffff9a5f46f48158
[ 2608.683039] R13: 0000000000000046 R14: ffff9a5f4609c000 R15: 
ffff9a5f7ad77e00
[ 2608.690165] FS:  0000000000000000(0000) GS:ffff9a5f7e300000(0000) 
knlGS:0000000000000000
[ 2608.698244] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2608.703980] CR2: 0000000000000000 CR3: 000000003780a000 CR4: 
00000000001006e0
[ 2608.711102] Call Trace:
[ 2608.713561]  usb_ep_dequeue+0x19/0x80
[ 2608.717234]  u_audio_stop_capture+0x54/0x9a [u_audio]
[ 2608.722289]  afunc_set_alt+0x73/0x80 [usb_f_uac2]
[ 2608.727003]  composite_setup+0x20f/0x1b20 [libcomposite]
[ 2608.732324]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
[ 2608.738332]  configfs_composite_setup+0x6b/0x90 [libcomposite]
[ 2608.744163]  dwc3_ep0_delegate_req+0x24/0x40
[ 2608.748435]  dwc3_ep0_interrupt+0x40a/0x9d8
[ 2608.752620]  dwc3_thread_interrupt+0x880/0xf70
[ 2608.757069]  ? __schedule+0x3ee/0x640
[ 2608.760734]  ? irq_forced_thread_fn+0x70/0x70
[ 2608.765089]  irq_thread_fn+0x1b/0x60
[ 2608.768666]  irq_thread+0xd3/0x150
[ 2608.772068]  ? wake_threads_waitq+0x30/0x30
[ 2608.776248]  ? irq_thread_dtor+0x80/0x80
[ 2608.780170]  kthread+0xf9/0x130
[ 2608.783312]  ? kthread_park+0x80/0x80
[ 2608.786975]  ret_from_fork+0x22/0x30
[ 2608.790546] Modules linked in: usb_f_uac2 u_audio usb_f_mass_storage 
usb_f_eem u_ether usb_f_serial u_serial libcomposite rfcomm iptable_nat 
bnep spi_pxa2xx_platform dw_dmac pwm_lpss_pci pwm_lpss snd_sof_pci 
intel_mrfld_adc snd_sof_intel_byt intel_mrfld_pwrbtn snd_sof_intel_ipc 
snd_sof_xtensa_dsp snd_sof snd_sof_nocodec snd_soc_acpi spi_pxa2xx_pci 
brcmfmac brcmutil hci_uart leds_gpio btbcm ti_ads7950 spidev 
industrialio_triggered_buffer kfifo_buf ledtrig_heartbeat mmc_block 
extcon_intel_mrfld sdhci_pci cqhci sdhci led_class intel_soc_pmic_mrfld 
mmc_core btrfs libcrc32c xor zstd_compress zlib_deflate raid6_pq
[ 2608.844407] Dumping ftrace buffer:
[ 2608.847805] ---------------------------------
[ 2608.852198] irq/15-d-733       1d... 2608518943us : dwc3_ep_dequeue: 
ep4out: req 00000000a40fdf40 length 0/256 zsI ==> -115
[ 2608.863334] irq/15-d-733       1d... 2608518954us : dwc3_ep_dequeue: 
ep4out: req 00000000545565de length 0/256 zsI ==> -115
[ 2608.874467] irq/15-d-733       1d... 2608520323us : dwc3_ep_dequeue: 
ep5in: req 00000000545565de length 0/192 zsI ==> -115
[ 2608.885513] irq/15-d-733       1d... 2608520331us : dwc3_ep_dequeue: 
ep5in: req 00000000a5936556 length 0/192 zsI ==> -115
[ 2608.896558] irq/15-d-733       1d... 2608578454us : dwc3_ep_dequeue: 
ep5in: req 00000000545565de length 0/192 zsI ==> -115
[ 2608.907603] irq/15-d-733       1d... 2608578464us : dwc3_ep_dequeue: 
ep5in: req 0000000036de95f5 length 0/192 zsI ==> -115
[ 2608.918650] irq/15-d-733       1d... 2608580113us : dwc3_ep_dequeue: 
ep5in: req 0000000036de95f5 length 0/192 zsI ==> -115
[ 2608.929694] irq/15-d-733       1d... 2608580124us : dwc3_ep_dequeue: 
ep5in: req 00000000545565de length 0/192 zsI ==> -115
[ 2608.940739] irq/15-d-733       1d... 2608582968us : dwc3_ep_dequeue: 
ep5in: req 00000000aa8c59ad length 0/192 zsI ==> -115
[ 2608.951787] irq/15-d-733       1d... 2608582976us : dwc3_ep_dequeue: 
ep5in: req 00000000a40fdf40 length 0/192 zsI ==> -115
[ 2608.962832] irq/15-d-733       1d... 2608590151us : dwc3_ep_dequeue: 
ep4out: req 00000000545565de length 0/256 zsI ==> -115
[ 2608.973963] irq/15-d-733       1d... 2608590164us : dwc3_ep_dequeue: 
ep4out: req 0000000036de95f5 length 0/256 zsI ==> -115
[ 2608.985074] ---------------------------------
[ 2608.989425] CR2: 0000000000000000
[ 2608.992740] ---[ end trace b72f9adf1da68308 ]---


