Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD7F29442E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 23:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438621AbgJTVCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 17:02:00 -0400
Received: from static.214.254.202.116.clients.your-server.de ([116.202.254.214]:39372
        "EHLO ciao.gmane.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409706AbgJTVCA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 17:02:00 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glug-linux-usb@m.gmane-mx.org>)
        id 1kUylZ-0007XG-PW
        for linux-usb@vger.kernel.org; Tue, 20 Oct 2020 23:01:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-usb@vger.kernel.org
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Date:   Tue, 20 Oct 2020 23:01:49 +0200
Message-ID: <13201a47-e0d0-015e-e537-7310d41811a2@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <b23536fb-13d4-e1b5-2b61-c8f9d4dbcef8@gmail.com>
 <a45db8d2-6902-7ec7-cab2-1436209a15a6@gmail.com> <871rhtf537.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Cc:     felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
In-Reply-To: <871rhtf537.fsf@kernel.org>
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Op 20-10-2020 om 14:35 schreef Felipe Balbi:
> Ferry Toth <fntoth@gmail.com> writes:
> 
> Hi,
> 
>> Op 19-10-2020 om 09:14 schreef Ferry Toth:
>>> Op 19-10-2020 om 07:45 schreef Felipe Balbi:
>>>>
>>>> Hi Andy,
>>>>
>>>> Ferry Toth <fntoth@gmail.com> writes:
>>>>> This occurs with edison-arduino board, that has a nifty switch allowing
>>>>> to switch between gadget/host mode. In host mode it boot fine, then
>>>>> crashes when I flip the switch to gadget.
>>>>>
>>>>> The below trace if what I get from the console when booting with gadget
>>>>> mode selected.
>>>>>
>>>>> The last kernel is used where everything is obviously working fine is
>>>>> 5.6.0.
>>>>>
>>>>> The kernel is built specifically for the platform, nothing suspcious
>>>>> going on the the dwc3 area, see
>>>>> https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>>>>>
>>>>> Magic signature found
>>>>>
>>>>> Starting kernel ...
>>>>>
>>>>> [    2.395631] Initramfs unpacking failed: invalid magic at start of
>>>>> compressed archive
>>>>> Scanning for Btrfs filesystems
>>>>> Starting version 243.2+
>>>>> Kernel with acpi enabled detected
>>>>> Loading acpi tables
>>>>> Waiting for root device /dev/mmcblk0p8
>>>>>      10Found device '/run/media/mmcblk0p8'
>>>>>      9Init found, booting...
>>>>> [   10.834272] brcmfmac: brcmf_fw_alloc_request: using
>>>>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>>>>> [   11.179662] brcmfmac: brcmf_fw_alloc_request: using
>>>>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>>>>> [   11.194223] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available
>>>>> (err=-2), device may have limited channels available
>>>>> [   11.234779] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43340/2
>>>>> wl0: Oct 23 2017 08:41:23 version 6.10.190.70 (r674464) FWID 01-98d71006
>>>>> [   12.401620] BUG: unable to handle page fault for address:
>>>>> 0000000100000000
>>>>> [   12.408496] #PF: supervisor instruction fetch in kernel mode
>>>>> [   12.414145] #PF: error_code(0x0010) - not-present page
>>>>> [   12.419276] PGD 0 P4D 0
>>>>> [   12.421817] Oops: 0010 [#1] SMP PTI
>>>>> [   12.425307] CPU: 0 PID: 488 Comm: irq/15-dwc3 Not tainted
>>>>> 5.9.0-edison-acpi-standard #1
>>>>> [   12.433297] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>>>>> BIOS 542 2015.01.21:18.19.48
>>>>> [   12.442075] RIP: 0010:0x100000000
>>>>> [   12.445382] Code: Bad RIP value.
>>>>> [   12.448605] RSP: 0000:ffff9a95403fbbf8 EFLAGS: 00010046
>>>>> [   12.453827] RAX: 0000000100000000 RBX: ffff8ee8bd32f828 RCX:
>>>>> ffff8ee8bacc4000
>>>>> [   12.460950] RDX: 00000000ffffff94 RSI: ffff8ee8bc01a5a0 RDI:
>>>>> ffff8ee887228700
>>>>> [   12.468075] RBP: ffff8ee8bc01a5a0 R08: 0000000000000046 R09:
>>>>> 0000000000000238
>>>>> [   12.475199] R10: 0000000000000004 R11: ffff8ee8ba8ba248 R12:
>>>>> ffff8ee887228700
>>>>> [   12.482322] R13: ffff8ee8bd32f828 R14: 0000000000000002 R15:
>>>>> ffff8ee8bae93200
>>>>> [   12.489449] FS:  0000000000000000(0000) GS:ffff8ee8be200000(0000)
>>>>> knlGS:0000000000000000
>>>>> [   12.497524] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>> [   12.503262] CR2: 0000000100000000 CR3: 000000003c5ae000 CR4:
>>>>> 00000000001006f0
>>>>> [   12.510382] Call Trace:
>>>>> [   12.512841]  ? dwc3_gadget_giveback+0xbf/0x120
>>>>> [   12.517286]  ? __dwc3_gadget_ep_disable+0xc5/0x250
>>>>> [   12.522077]  ? dwc3_gadget_ep_disable+0x3d/0xd0
>>>>> [   12.526608]  ? usb_ep_disable+0x1d/0x80
>>>>> [   12.530451]  ? u_audio_stop_capture+0x87/0x9a [u_audio]
>>>>> [   12.535680]  ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>>>> [   12.540562]  ? composite_setup+0x20f/0x1b20 [libcomposite]
>>>>> [   12.546053]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>> [   12.552060]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>> [   12.558062]  ? dwc3_ep0_delegate_req+0x24/0x40
>>>>> [   12.562502]  ? dwc3_ep0_interrupt+0x40a/0x9d8
>>>>> [   12.566858]  ? dwc3_thread_interrupt+0x880/0xf70
>>>>> [   12.571475]  ? __schedule+0x3ee/0x640
>>>>> [   12.575143]  ? irq_forced_thread_fn+0x70/0x70
>>>>> [   12.579497]  ? irq_thread_fn+0x1b/0x60
>>>>> [   12.583245]  ? irq_thread+0xd3/0x150
>>>>> [   12.586821]  ? wake_threads_waitq+0x30/0x30
>>>>> [   12.591001]  ? irq_thread_dtor+0x80/0x80
>>>>> [   12.594925]  ? kthread+0xf9/0x130
>>>>> [   12.598238]  ? kthread_park+0x80/0x80
>>>>> [   12.601901]  ? ret_from_fork+0x22/0x30
>>>>> [   12.605644] Modules linked in: spi_pxa2xx_platform dw_dmac usb_f_uac2
>>>>> u_audio usb_f_mass_storage usb_f_eem u_ether usb_f_serial u_serial
>>>>> libcomposite pwm_lpss_pci snd_sof_pci snd_sof_intel_byt pwm_lpss
>>>>> snd_sof_intel_ipc snd_sof_xtensa_dsp intel_mrfld_pwrbtn intel_mrfld_adc
>>>>> snd_sof snd_sof_nocodec snd_soc_acpi spi_pxa2xx_pci brcmfmac brcmutil
>>>>> leds_gpio hci_uart btbcm ti_ads7950 industrialio_triggered_buffer
>>>>> kfifo_buf spidev ledtrig_heartbeat mmc_block extcon_intel_mrfld
>>>>> sdhci_pci cqhci sdhci led_class mmc_core intel_soc_pmic_mrfld btrfs
>>>>> libcrc32c xor zstd_compress zlib_deflate raid6_pq
>>>>> [   12.657416] CR2: 0000000100000000
>>>>> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---
>>>>
>>>> It this something you can reproduce on your end? Ferry, can you get dwc3
>>>> trace logs when this happens? ftrace_dump_on_oops may help here.
>>>>
>>> I will do that tonight. Is flipping on ftrace_dump_on_oops sufficient or
>>> do I need to do more?
>>>
>>> BTW after posting this I found in host mode dwc3 is not working properly
>>> either. No oops, but no driver get loaded on device plug in.
>>>
>> Not sure if this is what you are looking for (otherwise let me know):
>>
>> root@edison:/proc/sys/kernel# echo 1 > ftrace_dump_on_oops
>> ## flip the switch from host to gadget
>> root@edison:/proc/sys/kernel# [  515.866590] BUG: kernel NULL pointer
>> dereference, address: 0000000000000000
>> [  515.873553] #PF: supervisor read access in kernel mode
>> [  515.878682] #PF: error_code(0x0000) - not-present page
>> [  515.883814] PGD 0 P4D 0
>> [  515.886352] Oops: 0000 [#1] SMP PTI
>> [  515.889844] CPU: 0 PID: 490 Comm: irq/15-dwc3 Not tainted
>> 5.9.0-edison-acpi-standard #1
>> [  515.897836] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>> BIOS 542 2015.01.21:18.19.48
>> [  515.906621] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0
> 
> what do you get with:
> 
> $ gdb vmlinux
> (gdb) l *(dwc3_gadget_ep_dequeue+0x41)
> 
> ??
> 
Unfortunately no debug symbols, but I can disassem:
Dump of assembler code for function dwc3_gadget_ep_dequeue:
    0xffffffff8177afe0 <+0>:     push   %r15
    0xffffffff8177afe2 <+2>:     push   %r14
    0xffffffff8177afe4 <+4>:     mov    %rdi,%r14
    0xffffffff8177afe7 <+7>:     push   %r13
    0xffffffff8177afe9 <+9>:     push   %r12
    0xffffffff8177afeb <+11>:    push   %rbp
    0xffffffff8177afec <+12>:    mov    %rsi,%rbp
    0xffffffff8177afef <+15>:    push   %rbx
    0xffffffff8177aff0 <+16>:    mov    0x90(%rdi),%rbx
    0xffffffff8177aff7 <+23>:    nopl   0x0(%rax,%rax,1)
    0xffffffff8177affc <+28>:    lea    0x130(%rbx),%r12
    0xffffffff8177b003 <+35>:    mov    %r12,%rdi
    0xffffffff8177b006 <+38>:    callq  0xffffffff81ba9620 
<_raw_spin_lock_irqsave>
# list_for_each_entry(r, &dep->cancelled_list, list) {
    0xffffffff8177b00b <+43>:    mov    0x48(%r14),%rcx
    0xffffffff8177b00f <+47>:    mov    %rax,%r13
    0xffffffff8177b012 <+50>:    lea    0x48(%r14),%rax
    0xffffffff8177b016 <+54>:    lea    -0x60(%rcx),%rdx
    0xffffffff8177b01a <+58>:    cmp    %rcx,%rax
    0xffffffff8177b01d <+61>:    jne    0xffffffff8177b02e 
<dwc3_gadget_ep_dequeue+78>
    0xffffffff8177b01f <+63>:    jmp    0xffffffff8177b04f 
<dwc3_gadget_ep_dequeue+111>
# crash
    0xffffffff8177b021 <+65>:    mov    0x60(%rdx),%rcx
    0xffffffff8177b025 <+69>:    lea    -0x60(%rcx),%rdx
    0xffffffff8177b029 <+73>:    cmp    %rcx,%rax
    0xffffffff8177b02c <+76>:    je     0xffffffff8177b04f 
<dwc3_gadget_ep_dequeue+111>

    0xffffffff8177b02e <+78>:    cmp    %rdx,%rbp
    0xffffffff8177b031 <+81>:    jne    0xffffffff8177b021 
<dwc3_gadget_ep_dequeue+65>
# }
# out:
    0xffffffff8177b033 <+83>:    xor    %r14d,%r14d
    0xffffffff8177b036 <+86>:    mov    %r13,%rsi
    0xffffffff8177b039 <+89>:    mov    %r12,%rdi
    0xffffffff8177b03c <+92>:    callq  0xffffffff81ba9450 
<_raw_spin_unlock_irqrestore>
    0xffffffff8177b041 <+97>:    mov    %r14d,%eax
    0xffffffff8177b044 <+100>:   pop    %rbx
    0xffffffff8177b045 <+101>:   pop    %rbp
    0xffffffff8177b046 <+102>:   pop    %r12
    0xffffffff8177b048 <+104>:   pop    %r13
    0xffffffff8177b04a <+106>:   pop    %r14
    0xffffffff8177b04c <+108>:   pop    %r15
    0xffffffff8177b04e <+110>:   retq
# list_for_each_entry(r, &dep->pending_list, list) {


