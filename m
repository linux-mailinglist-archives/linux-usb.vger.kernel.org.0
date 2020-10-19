Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05BE292DBD
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 20:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbgJSStX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 14:49:23 -0400
Received: from static.214.254.202.116.clients.your-server.de ([116.202.254.214]:40878
        "EHLO ciao.gmane.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbgJSStX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 14:49:23 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glug-linux-usb@m.gmane-mx.org>)
        id 1kUaDf-0007Mb-O2
        for linux-usb@vger.kernel.org; Mon, 19 Oct 2020 20:49:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-usb@vger.kernel.org
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Date:   Mon, 19 Oct 2020 20:49:13 +0200
Message-ID: <a45db8d2-6902-7ec7-cab2-1436209a15a6@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <b23536fb-13d4-e1b5-2b61-c8f9d4dbcef8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Cc:     felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
In-Reply-To: <b23536fb-13d4-e1b5-2b61-c8f9d4dbcef8@gmail.com>
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Op 19-10-2020 om 09:14 schreef Ferry Toth:
> Op 19-10-2020 om 07:45 schreef Felipe Balbi:
>>
>> Hi Andy,
>>
>> Ferry Toth <fntoth@gmail.com> writes:
>>> This occurs with edison-arduino board, that has a nifty switch allowing
>>> to switch between gadget/host mode. In host mode it boot fine, then
>>> crashes when I flip the switch to gadget.
>>>
>>> The below trace if what I get from the console when booting with gadget
>>> mode selected.
>>>
>>> The last kernel is used where everything is obviously working fine is 
>>> 5.6.0.
>>>
>>> The kernel is built specifically for the platform, nothing suspcious
>>> going on the the dwc3 area, see
>>> https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>>>
>>> Magic signature found
>>>
>>> Starting kernel ...
>>>
>>> [    2.395631] Initramfs unpacking failed: invalid magic at start of
>>> compressed archive
>>> Scanning for Btrfs filesystems
>>> Starting version 243.2+
>>> Kernel with acpi enabled detected
>>> Loading acpi tables
>>> Waiting for root device /dev/mmcblk0p8
>>>     10Found device '/run/media/mmcblk0p8'
>>>     9Init found, booting...
>>> [   10.834272] brcmfmac: brcmf_fw_alloc_request: using
>>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>>> [   11.179662] brcmfmac: brcmf_fw_alloc_request: using
>>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>>> [   11.194223] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available
>>> (err=-2), device may have limited channels available
>>> [   11.234779] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43340/2
>>> wl0: Oct 23 2017 08:41:23 version 6.10.190.70 (r674464) FWID 01-98d71006
>>> [   12.401620] BUG: unable to handle page fault for address:
>>> 0000000100000000
>>> [   12.408496] #PF: supervisor instruction fetch in kernel mode
>>> [   12.414145] #PF: error_code(0x0010) - not-present page
>>> [   12.419276] PGD 0 P4D 0
>>> [   12.421817] Oops: 0010 [#1] SMP PTI
>>> [   12.425307] CPU: 0 PID: 488 Comm: irq/15-dwc3 Not tainted
>>> 5.9.0-edison-acpi-standard #1
>>> [   12.433297] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>>> BIOS 542 2015.01.21:18.19.48
>>> [   12.442075] RIP: 0010:0x100000000
>>> [   12.445382] Code: Bad RIP value.
>>> [   12.448605] RSP: 0000:ffff9a95403fbbf8 EFLAGS: 00010046
>>> [   12.453827] RAX: 0000000100000000 RBX: ffff8ee8bd32f828 RCX:
>>> ffff8ee8bacc4000
>>> [   12.460950] RDX: 00000000ffffff94 RSI: ffff8ee8bc01a5a0 RDI:
>>> ffff8ee887228700
>>> [   12.468075] RBP: ffff8ee8bc01a5a0 R08: 0000000000000046 R09:
>>> 0000000000000238
>>> [   12.475199] R10: 0000000000000004 R11: ffff8ee8ba8ba248 R12:
>>> ffff8ee887228700
>>> [   12.482322] R13: ffff8ee8bd32f828 R14: 0000000000000002 R15:
>>> ffff8ee8bae93200
>>> [   12.489449] FS:  0000000000000000(0000) GS:ffff8ee8be200000(0000)
>>> knlGS:0000000000000000
>>> [   12.497524] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   12.503262] CR2: 0000000100000000 CR3: 000000003c5ae000 CR4:
>>> 00000000001006f0
>>> [   12.510382] Call Trace:
>>> [   12.512841]  ? dwc3_gadget_giveback+0xbf/0x120
>>> [   12.517286]  ? __dwc3_gadget_ep_disable+0xc5/0x250
>>> [   12.522077]  ? dwc3_gadget_ep_disable+0x3d/0xd0
>>> [   12.526608]  ? usb_ep_disable+0x1d/0x80
>>> [   12.530451]  ? u_audio_stop_capture+0x87/0x9a [u_audio]
>>> [   12.535680]  ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>> [   12.540562]  ? composite_setup+0x20f/0x1b20 [libcomposite]
>>> [   12.546053]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>> [   12.552060]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>> [   12.558062]  ? dwc3_ep0_delegate_req+0x24/0x40
>>> [   12.562502]  ? dwc3_ep0_interrupt+0x40a/0x9d8
>>> [   12.566858]  ? dwc3_thread_interrupt+0x880/0xf70
>>> [   12.571475]  ? __schedule+0x3ee/0x640
>>> [   12.575143]  ? irq_forced_thread_fn+0x70/0x70
>>> [   12.579497]  ? irq_thread_fn+0x1b/0x60
>>> [   12.583245]  ? irq_thread+0xd3/0x150
>>> [   12.586821]  ? wake_threads_waitq+0x30/0x30
>>> [   12.591001]  ? irq_thread_dtor+0x80/0x80
>>> [   12.594925]  ? kthread+0xf9/0x130
>>> [   12.598238]  ? kthread_park+0x80/0x80
>>> [   12.601901]  ? ret_from_fork+0x22/0x30
>>> [   12.605644] Modules linked in: spi_pxa2xx_platform dw_dmac usb_f_uac2
>>> u_audio usb_f_mass_storage usb_f_eem u_ether usb_f_serial u_serial
>>> libcomposite pwm_lpss_pci snd_sof_pci snd_sof_intel_byt pwm_lpss
>>> snd_sof_intel_ipc snd_sof_xtensa_dsp intel_mrfld_pwrbtn intel_mrfld_adc
>>> snd_sof snd_sof_nocodec snd_soc_acpi spi_pxa2xx_pci brcmfmac brcmutil
>>> leds_gpio hci_uart btbcm ti_ads7950 industrialio_triggered_buffer
>>> kfifo_buf spidev ledtrig_heartbeat mmc_block extcon_intel_mrfld
>>> sdhci_pci cqhci sdhci led_class mmc_core intel_soc_pmic_mrfld btrfs
>>> libcrc32c xor zstd_compress zlib_deflate raid6_pq
>>> [   12.657416] CR2: 0000000100000000
>>> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---
>>
>> It this something you can reproduce on your end? Ferry, can you get dwc3
>> trace logs when this happens? ftrace_dump_on_oops may help here.
>>
> I will do that tonight. Is flipping on ftrace_dump_on_oops sufficient or 
> do I need to do more?
> 
> BTW after posting this I found in host mode dwc3 is not working properly 
> either. No oops, but no driver get loaded on device plug in.
> 
Not sure if this is what you are looking for (otherwise let me know):

root@edison:/proc/sys/kernel# echo 1 > ftrace_dump_on_oops
## flip the switch from host to gadget
root@edison:/proc/sys/kernel# [  515.866590] BUG: kernel NULL pointer 
dereference, address: 0000000000000000
[  515.873553] #PF: supervisor read access in kernel mode
[  515.878682] #PF: error_code(0x0000) - not-present page
[  515.883814] PGD 0 P4D 0
[  515.886352] Oops: 0000 [#1] SMP PTI
[  515.889844] CPU: 0 PID: 490 Comm: irq/15-dwc3 Not tainted 
5.9.0-edison-acpi-standard #1
[  515.897836] Hardware name: Intel Corporation Merrifield/BODEGA BAY, 
BIOS 542 2015.01.21:18.19.48
[  515.906621] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0
[  515.911842] Code: 0f 1f 44 00 00 4c 8d a3 30 01 00 00 4c 89 e7 e8 05 
e6 42 00 49 8b 4e 48 49 89 c5 49 8d 46 48 48 8d 51 a0 48 39 c8 75 0f eb 
2e <48> 8b 4a 60 48 8d 51 a0 48 39 c8 74 21 48 39 d5 75 ee 45 31 f6 4c
[  515.930581] RSP: 0018:ffff945f8044fc40 EFLAGS: 00010083
[  515.935802] RAX: ffff8a347b2e3c48 RBX: ffff8a347d3af828 RCX: 
0000000000000000
[  515.942926] RDX: ffffffffffffffa0 RSI: ffff8a347dc4ed80 RDI: 
ffff8a347d3af958
[  515.950049] RBP: ffff8a347dc4ed80 R08: ffff8a347b2e3c68 R09: 
00000000dbfbb796
[  515.957173] R10: ffff945f8044fd90 R11: ffff8a347d3afb00 R12: 
ffff8a347d3af958
[  515.964297] R13: 0000000000000082 R14: ffff8a347b2e3c00 R15: 
ffff8a347b103600
[  515.971423] FS:  0000000000000000(0000) GS:ffff8a347e200000(0000) 
knlGS:0000000000000000
[  515.979503] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  515.985240] CR2: 0000000000000000 CR3: 000000002f40a000 CR4: 
00000000001006f0
[  515.992362] Call Trace:
[  515.994823]  usb_ep_dequeue+0x19/0x80
[  515.998499]  u_audio_stop_capture+0x54/0x9a [u_audio]
[  516.003554]  afunc_set_alt+0x73/0x80 [usb_f_uac2]
[  516.008267]  composite_setup+0x20f/0x1b20 [libcomposite]
[  516.013588]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
[  516.019597]  configfs_composite_setup+0x6b/0x90 [libcomposite]
[  516.025432]  dwc3_ep0_delegate_req+0x24/0x40
[  516.029703]  dwc3_ep0_interrupt+0x40a/0x9d8
[  516.033890]  dwc3_thread_interrupt+0x880/0xf70
[  516.038336]  ? __schedule+0x3ee/0x640
[  516.042002]  ? irq_forced_thread_fn+0x70/0x70
[  516.046356]  irq_thread_fn+0x1b/0x60
[  516.049934]  irq_thread+0xd3/0x150
[  516.053335]  ? wake_threads_waitq+0x30/0x30
[  516.057516]  ? irq_thread_dtor+0x80/0x80
[  516.061438]  kthread+0xf9/0x130
[  516.064579]  ? kthread_park+0x80/0x80
[  516.068241]  ret_from_fork+0x22/0x30
[  516.071814] Modules linked in: rfcomm iptable_nat bnep usb_f_uac2 
u_audio usb_f_mass_storage spi_pxa2xx_platform dw_dmac usb_f_eem u_ether 
usb_f_serial u_serial libcomposite pwm_lpss_pci pwm_lpss snd_sof_pci 
snd_sof_intel_byt snd_sof_intel_ipc intel_mrfld_pwrbtn 
snd_sof_xtensa_dsp intel_mrfld_adc snd_sof snd_sof_nocodec snd_soc_acpi 
spi_pxa2xx_pci brcmfmac brcmutil leds_gpio ti_ads7950 hci_uart 
industrialio_triggered_buffer btbcm spidev kfifo_buf ledtrig_heartbeat 
mmc_block extcon_intel_mrfld sdhci_pci cqhci intel_soc_pmic_mrfld sdhci 
led_class mmc_core btrfs libcrc32c xor zstd_compress zlib_deflate raid6_pq
[  516.125674] Dumping ftrace buffer:
[  516.129074]    (ftrace buffer empty)
[  516.132642] CR2: 0000000000000000
[  516.135957] ---[ end trace 2386f834a3643685 ]---
[  516.140574] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0
[  516.145793] Code: 0f 1f 44 00 00 4c 8d a3 30 01 00 00 4c 89 e7 e8 05 
e6 42 00 49 8b 4e 48 49 89 c5 49 8d 46 48 48 8d 51 a0 48 39 c8 75 0f eb 
2e <48> 8b 4a 60 48 8d 51 a0 48 39 c8 74 21 48 39 d5 75 ee 45 31 f6 4c
[  516.164532] RSP: 0018:ffff945f8044fc40 EFLAGS: 00010083
[  516.169749] RAX: ffff8a347b2e3c48 RBX: ffff8a347d3af828 RCX: 
0000000000000000
[  516.176873] RDX: ffffffffffffffa0 RSI: ffff8a347dc4ed80 RDI: 
ffff8a347d3af958
[  516.183998] RBP: ffff8a347dc4ed80 R08: ffff8a347b2e3c68 R09: 
00000000dbfbb796
[  516.191121] R10: ffff945f8044fd90 R11: ffff8a347d3afb00 R12: 
ffff8a347d3af958
[  516.198246] R13: 0000000000000082 R14: ffff8a347b2e3c00 R15: 
ffff8a347b103600
[  516.205371] FS:  0000000000000000(0000) GS:ffff8a347e200000(0000) 
knlGS:0000000000000000
[  516.213447] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  516.219185] CR2: 0000000000000000 CR3: 000000002f40a000 CR4: 
00000000001006f0
[  516.226454] BUG: kernel NULL pointer dereference, address: 
0000000000000000
[  516.233414] #PF: supervisor instruction fetch in kernel mode
[  516.239063] #PF: error_code(0x0010) - not-present page
[  516.244190] PGD 0 P4D 0
[  516.246729] Oops: 0010 [#2] SMP PTI
[  516.250221] CPU: 0 PID: 490 Comm: irq/15-dwc3 Tainted: G      D 
     5.9.0-edison-acpi-standard #1
[  516.259595] Hardware name: Intel Corporation Merrifield/BODEGA BAY, 
BIOS 542 2015.01.21:18.19.48
[  516.268368] RIP: 0010:0x0
[  516.270988] Code: Bad RIP value.
[  516.274212] RSP: 0018:ffff945f8044fec0 EFLAGS: 00010246
[  516.279430] RAX: 0000000000000000 RBX: ffff8a347afa0cc0 RCX: 
0000000000000000
[  516.286555] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 
ffff945f8044fec8
[  516.293679] RBP: ffff8a347afa0cc0 R08: 000000000000000f R09: 
ffffffffac26b701
[  516.300802] R10: ffff8a347c965000 R11: 0000000000000001 R12: 
ffff8a347afa13fc
[  516.307925] R13: 0000000000000000 R14: 0000000000000001 R15: 
0000000000000000
[  516.315053] FS:  0000000000000000(0000) GS:ffff8a347e200000(0000) 
knlGS:0000000000000000
[  516.323132] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  516.328869] CR2: ffffffffffffffd6 CR3: 000000002f40a000 CR4: 
00000000001006f0
[  516.335991] Call Trace:
[  516.338443]  task_work_run+0x5a/0x90
[  516.342022]  do_exit+0x358/0xab0
[  516.345251]  ? kthread+0xf9/0x130
[  516.348566]  rewind_stack_do_exit+0x17/0x20
[  516.352742] RIP: 0000:0x0
[  516.355361] Code: Bad RIP value.
[  516.358587] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 
0000000000000000
[  516.366148] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000000
[  516.373273] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
[  516.380396] RBP: 0000000000000000 R08: 0000000000000000 R09: 
0000000000000000
[  516.387519] R10: 0000000000000000 R11: 0000000000000000 R12: 
0000000000000000
[  516.394644] R13: 0000000000000000 R14: 0000000000000000 R15: 
0000000000000000
[  516.401769] Modules linked in: rfcomm iptable_nat bnep usb_f_uac2 
u_audio usb_f_mass_storage spi_pxa2xx_platform dw_dmac usb_f_eem u_ether 
usb_f_serial u_serial libcomposite pwm_lpss_pci pwm_lpss snd_sof_pci 
snd_sof_intel_byt snd_sof_intel_ipc intel_mrfld_pwrbtn 
snd_sof_xtensa_dsp intel_mrfld_adc snd_sof snd_sof_nocodec snd_soc_acpi 
spi_pxa2xx_pci brcmfmac brcmutil leds_gpio ti_ads7950 hci_uart 
industrialio_triggered_buffer btbcm spidev kfifo_buf ledtrig_heartbeat 
mmc_block extcon_intel_mrfld sdhci_pci cqhci intel_soc_pmic_mrfld sdhci 
led_class mmc_core btrfs libcrc32c xor zstd_compress zlib_deflate raid6_pq
[  516.455620] Dumping ftrace buffer:
[  516.459018]    (ftrace buffer empty)
[  516.462586] CR2: 0000000000000000
[  516.465902] ---[ end trace 2386f834a3643686 ]---
[  516.470520] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0
[  516.475743] Code: 0f 1f 44 00 00 4c 8d a3 30 01 00 00 4c 89 e7 e8 05 
e6 42 00 49 8b 4e 48 49 89 c5 49 8d 46 48 48 8d 51 a0 48 39 c8 75 0f eb 
2e <48> 8b 4a 60 48 8d 51 a0 48 39 c8 74 21 48 39 d5 75 ee 45 31 f6 4c
[  516.494481] RSP: 0018:ffff945f8044fc40 EFLAGS: 00010083
[  516.499703] RAX: ffff8a347b2e3c48 RBX: ffff8a347d3af828 RCX: 
0000000000000000
[  516.506826] RDX: ffffffffffffffa0 RSI: ffff8a347dc4ed80 RDI: 
ffff8a347d3af958
[  516.513950] RBP: ffff8a347dc4ed80 R08: ffff8a347b2e3c68 R09: 
00000000dbfbb796
[  516.521075] R10: ffff945f8044fd90 R11: ffff8a347d3afb00 R12: 
ffff8a347d3af958
[  516.528198] R13: 0000000000000082 R14: ffff8a347b2e3c00 R15: 
ffff8a347b103600
[  516.535324] FS:  0000000000000000(0000) GS:ffff8a347e200000(0000) 
knlGS:0000000000000000
[  516.543406] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  516.549142] CR2: ffffffffffffffd6 CR3: 000000002f40a000 CR4: 
00000000001006f0
[  516.556264] Fixing recursive fault but reboot is needed!
[  544.795126] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  544.801062] rcu: 	0-...0: (2 GPs behind) 
idle=a5a/1/0x4000000000000000 softirq=18432/18432 fqs=5250
[  544.810182] 	(detected by 1, t=21002 jiffies, g=31497, q=9)
[  544.815751] Sending NMI from CPU 1 to CPUs 0:
[  544.821106] NMI backtrace for cpu 0
[  544.821112] CPU: 0 PID: 194 Comm: kworker/0:2H Tainted: G      D 
      5.9.0-edison-acpi-standard #1
[  544.821116] Hardware name: Intel Corporation Merrifield/BODEGA BAY, 
BIOS 542 2015.01.21:18.19.48
[  544.821119] Workqueue:  0x0 (mmc_complete)
[  544.821127] RIP: 0010:queued_spin_lock_slowpath+0x3c/0x1a0
[  544.821135] Code: 41 f0 0f ba 2f 08 0f 92 c0 0f b6 c0 c1 e0 08 89 c2 
8b 07 30 e4 09 d0 a9 00 01 ff ff 75 1b 85 c0 74 0e 8b 07 84 c0 74 08 f3 
90 <8b> 07 84 c0 75 f8 b8 01 00 00 00 66 89 07 c3 f6 c4 01 75 04 c6 47
[  544.821138] RSP: 0018:ffff945f80003af8 EFLAGS: 00000002
[  544.821144] RAX: 0000000000000101 RBX: ffff8a347b2e3e00 RCX: 
0000000000000000
[  544.821148] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffff8a347d3af958
[  544.821152] RBP: ffff8a347b655840 R08: 0000000000000004 R09: 
0000000000000282
[  544.821155] R10: ffff8a347c95a400 R11: 0000000000000002 R12: 
0000000000000202
[  544.821159] R13: ffff8a347b2238e0 R14: ffff8a347b223000 R15: 
ffff8a347b655880
[  544.821163] FS:  0000000000000000(0000) GS:ffff8a347e200000(0000) 
knlGS:0000000000000000
[  544.821166] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  544.821170] CR2: ffffffffffffffd6 CR3: 000000002f40a000 CR4: 
00000000001006f0
[  544.821172] Call Trace:
[  544.821173]  <IRQ>
[  544.821176]  _raw_spin_lock_irqsave+0x20/0x30
[  544.821179]  dwc3_gadget_ep_queue+0x26/0x1a0
[  544.821181]  usb_ep_queue+0x2b/0xa0
[  544.821184]  eth_start_xmit+0x1d5/0x360 [u_ether]
[  544.821186]  dev_hard_start_xmit+0x88/0x1d0
[  544.821189]  sch_direct_xmit+0xe1/0x210
[  544.821191]  __qdisc_run+0x145/0x520
[  544.821194]  __dev_queue_xmit+0x44e/0x6d0
[  544.821196]  ? sock_alloc_send_pskb+0x202/0x220
[  544.821199]  ip6_finish_output2+0x23b/0x550
[  544.821201]  ip6_output+0x6e/0x120
[  544.821204]  ? __ip6_finish_output+0x110/0x110
[  544.821207]  mld_sendpack+0x1b2/0x220
[  544.821209]  mld_ifc_timer_expire+0x191/0x2f0
[  544.821212]  ? ip6_mc_leave_src+0x90/0x90
[  544.821214]  call_timer_fn+0x28/0x120
[  544.821217]  run_timer_softirq+0x395/0x450
[  544.821219]  ? hrtimer_wakeup+0x19/0x20
[  544.821222]  ? __hrtimer_run_queues+0x100/0x260
[  544.821225]  ? recalibrate_cpu_khz+0x10/0x10
[  544.821227]  ? ktime_get+0x33/0x90
[  544.821229]  __do_softirq+0xdb/0x2dc
[  544.821232]  asm_call_irq_on_stack+0x12/0x20
[  544.821234]  </IRQ>
[  544.821236]  do_softirq_own_stack+0x32/0x40
[  544.821239]  irq_exit_rcu+0x92/0xa0
[  544.821241]  sysvec_apic_timer_interrupt+0x2e/0x80
[  544.821244]  asm_sysvec_apic_timer_interrupt+0x12/0x20
[  544.821247] RIP: 0010:finish_task_switch+0x6e/0x200
[  544.821255] Code: 00 00 4d 8b 7d 10 65 48 8b 1c 25 00 6d 01 00 0f 1f 
44 00 00 0f 1f 44 00 00 41 c7 45 2c 00 00 00 00 41 c6 04 24 00 fb 4d 85 
f6 <74> 1d 65 48 8b 04 25 00 6d 01 00 4c 3b b0 e0 03 00 00 74 33 f0 41
[  544.821258] RSP: 0018:ffff945f802cfe18 EFLAGS: 00000246
[  544.821264] RAX: ffff8a347afa0cc0 RBX: ffff8a3446040cc0 RCX: 
0000000000000000
[  544.821267] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
ffff8a347afa0cc0
[  544.821271] RBP: ffff945f802cfe40 R08: 0000000000000368 R09: 
0000000000000009
[  544.821275] R10: 00000000fe6e673f R11: 000000000000013f R12: 
ffff8a347e22a0c0
[  544.821279] R13: ffff8a347afa0cc0 R14: 0000000000000000 R15: 
0000000000000002
[  544.821281]  ? __switch_to_asm+0x36/0x70
[  544.821284]  __schedule+0x3ee/0x640
[  544.821286]  schedule+0x45/0xb0
[  544.821288]  worker_thread+0xb7/0x3b0
[  544.821291]  ? process_one_work+0x380/0x380
[  544.821293]  kthread+0xf9/0x130
[  544.821296]  ? kthread_park+0x80/0x80
[  544.821298]  ret_from_fork+0x22/0x30




