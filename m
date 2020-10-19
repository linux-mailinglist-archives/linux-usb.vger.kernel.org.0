Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50B82922DB
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 09:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbgJSHO1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 03:14:27 -0400
Received: from static.214.254.202.116.clients.your-server.de ([116.202.254.214]:57232
        "EHLO ciao.gmane.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgJSHO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 03:14:27 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glug-linux-usb@m.gmane-mx.org>)
        id 1kUPNA-000AcW-AJ
        for linux-usb@vger.kernel.org; Mon, 19 Oct 2020 09:14:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-usb@vger.kernel.org
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Date:   Mon, 19 Oct 2020 09:14:19 +0200
Message-ID: <b23536fb-13d4-e1b5-2b61-c8f9d4dbcef8@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Cc:     felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
In-Reply-To: <87a6wig461.fsf@kernel.org>
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Op 19-10-2020 om 07:45 schreef Felipe Balbi:
> 
> Hi Andy,
> 
> Ferry Toth <fntoth@gmail.com> writes:
>> This occurs with edison-arduino board, that has a nifty switch allowing
>> to switch between gadget/host mode. In host mode it boot fine, then
>> crashes when I flip the switch to gadget.
>>
>> The below trace if what I get from the console when booting with gadget
>> mode selected.
>>
>> The last kernel is used where everything is obviously working fine is 5.6.0.
>>
>> The kernel is built specifically for the platform, nothing suspcious
>> going on the the dwc3 area, see
>> https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>>
>> Magic signature found
>>
>> Starting kernel ...
>>
>> [    2.395631] Initramfs unpacking failed: invalid magic at start of
>> compressed archive
>> Scanning for Btrfs filesystems
>> Starting version 243.2+
>> Kernel with acpi enabled detected
>> Loading acpi tables
>> Waiting for root device /dev/mmcblk0p8
>>     10Found device '/run/media/mmcblk0p8'
>>     9Init found, booting...
>> [   10.834272] brcmfmac: brcmf_fw_alloc_request: using
>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>> [   11.179662] brcmfmac: brcmf_fw_alloc_request: using
>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>> [   11.194223] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available
>> (err=-2), device may have limited channels available
>> [   11.234779] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43340/2
>> wl0: Oct 23 2017 08:41:23 version 6.10.190.70 (r674464) FWID 01-98d71006
>> [   12.401620] BUG: unable to handle page fault for address:
>> 0000000100000000
>> [   12.408496] #PF: supervisor instruction fetch in kernel mode
>> [   12.414145] #PF: error_code(0x0010) - not-present page
>> [   12.419276] PGD 0 P4D 0
>> [   12.421817] Oops: 0010 [#1] SMP PTI
>> [   12.425307] CPU: 0 PID: 488 Comm: irq/15-dwc3 Not tainted
>> 5.9.0-edison-acpi-standard #1
>> [   12.433297] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>> BIOS 542 2015.01.21:18.19.48
>> [   12.442075] RIP: 0010:0x100000000
>> [   12.445382] Code: Bad RIP value.
>> [   12.448605] RSP: 0000:ffff9a95403fbbf8 EFLAGS: 00010046
>> [   12.453827] RAX: 0000000100000000 RBX: ffff8ee8bd32f828 RCX:
>> ffff8ee8bacc4000
>> [   12.460950] RDX: 00000000ffffff94 RSI: ffff8ee8bc01a5a0 RDI:
>> ffff8ee887228700
>> [   12.468075] RBP: ffff8ee8bc01a5a0 R08: 0000000000000046 R09:
>> 0000000000000238
>> [   12.475199] R10: 0000000000000004 R11: ffff8ee8ba8ba248 R12:
>> ffff8ee887228700
>> [   12.482322] R13: ffff8ee8bd32f828 R14: 0000000000000002 R15:
>> ffff8ee8bae93200
>> [   12.489449] FS:  0000000000000000(0000) GS:ffff8ee8be200000(0000)
>> knlGS:0000000000000000
>> [   12.497524] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   12.503262] CR2: 0000000100000000 CR3: 000000003c5ae000 CR4:
>> 00000000001006f0
>> [   12.510382] Call Trace:
>> [   12.512841]  ? dwc3_gadget_giveback+0xbf/0x120
>> [   12.517286]  ? __dwc3_gadget_ep_disable+0xc5/0x250
>> [   12.522077]  ? dwc3_gadget_ep_disable+0x3d/0xd0
>> [   12.526608]  ? usb_ep_disable+0x1d/0x80
>> [   12.530451]  ? u_audio_stop_capture+0x87/0x9a [u_audio]
>> [   12.535680]  ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>> [   12.540562]  ? composite_setup+0x20f/0x1b20 [libcomposite]
>> [   12.546053]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>> [   12.552060]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>> [   12.558062]  ? dwc3_ep0_delegate_req+0x24/0x40
>> [   12.562502]  ? dwc3_ep0_interrupt+0x40a/0x9d8
>> [   12.566858]  ? dwc3_thread_interrupt+0x880/0xf70
>> [   12.571475]  ? __schedule+0x3ee/0x640
>> [   12.575143]  ? irq_forced_thread_fn+0x70/0x70
>> [   12.579497]  ? irq_thread_fn+0x1b/0x60
>> [   12.583245]  ? irq_thread+0xd3/0x150
>> [   12.586821]  ? wake_threads_waitq+0x30/0x30
>> [   12.591001]  ? irq_thread_dtor+0x80/0x80
>> [   12.594925]  ? kthread+0xf9/0x130
>> [   12.598238]  ? kthread_park+0x80/0x80
>> [   12.601901]  ? ret_from_fork+0x22/0x30
>> [   12.605644] Modules linked in: spi_pxa2xx_platform dw_dmac usb_f_uac2
>> u_audio usb_f_mass_storage usb_f_eem u_ether usb_f_serial u_serial
>> libcomposite pwm_lpss_pci snd_sof_pci snd_sof_intel_byt pwm_lpss
>> snd_sof_intel_ipc snd_sof_xtensa_dsp intel_mrfld_pwrbtn intel_mrfld_adc
>> snd_sof snd_sof_nocodec snd_soc_acpi spi_pxa2xx_pci brcmfmac brcmutil
>> leds_gpio hci_uart btbcm ti_ads7950 industrialio_triggered_buffer
>> kfifo_buf spidev ledtrig_heartbeat mmc_block extcon_intel_mrfld
>> sdhci_pci cqhci sdhci led_class mmc_core intel_soc_pmic_mrfld btrfs
>> libcrc32c xor zstd_compress zlib_deflate raid6_pq
>> [   12.657416] CR2: 0000000100000000
>> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---
> 
> It this something you can reproduce on your end? Ferry, can you get dwc3
> trace logs when this happens? ftrace_dump_on_oops may help here.
> 
I will do that tonight. Is flipping on ftrace_dump_on_oops sufficient or 
do I need to do more?

BTW after posting this I found in host mode dwc3 is not working properly 
either. No oops, but no driver get loaded on device plug in.

