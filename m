Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7362394C84
	for <lists+linux-usb@lfdr.de>; Sat, 29 May 2021 16:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhE2Occ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 May 2021 10:32:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50983 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229681AbhE2Ocb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 May 2021 10:32:31 -0400
Received: (qmail 1502612 invoked by uid 1000); 29 May 2021 10:30:54 -0400
Date:   Sat, 29 May 2021 10:30:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eero <fin4478@hotmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: USB: core: WARN if pipe direction != setup packet direction
Message-ID: <20210529143054.GA1502498@rowland.harvard.edu>
References: <HE1PR0602MB327635A49DB939C8255FB1CCA1219@HE1PR0602MB3276.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR0602MB327635A49DB939C8255FB1CCA1219@HE1PR0602MB3276.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Messages like this should always be sent to the linux-usb mailing list 
so that all the developers can see them.

On Sat, May 29, 2021 at 01:15:25PM +0300, Eero wrote:
> Hi,
> 
> I tested the 5.13.0-rc3-next-20210528 kernel from kernel.org and there
> is this warning at boot. My usb devices work fine.
> 
> [    3.142879] ------------[ cut here ]------------
> [    3.142881] usb 1-1: BOGUS control dir, pipe 80000280 doesn't match
> bRequestType c0 [    3.142896] WARNING: CPU: 11 PID: 1444 at
> drivers/usb/core/urb.c:410 usb_submit_urb+0x60e/0x650 [    3.142904]
> Modules linked in: dvb_usb_rtl28xxu(+) videobuf2_vmalloc
> videobuf2_memops dvb_usb_v2 videobuf2_v4l2 videobuf2_common dvb_core
> videodev input_leds snd_seq_midi snd_seq_midi_event snd_usb_audio
> snd_hwdep snd_usbmidi_lib snd_rawmidi mc iptable_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle
> iptable_filter bluetooth ecdh_generic ecc amdgpu snd_hda_codec_realtek
> kvm_amd snd_hda_codec_generic snd_hda_codec_hdmi kvm snd_hda_intel
> snd_intel_dspcfg snd_hda_codec irqbypass mfd_core iommu_v2 gpu_sched
> snd_hda_core snd_pcm k10temp acpi_cpufreq processor efivarfs ip_tables
> x_tables ipv6 efivars i2c_piix4 r8169 realtek xhci_pci nvme xhci_hcd
> nvme_core [    3.142924] CPU: 11 PID: 1444 Comm: systemd-udevd Tainted:
> G        W         5.13.0-rc3-next-20210528 #1 [    3.142926] Hardware
> name: System manufacturer System Product Name/PRIME B450M-K, BIOS 3002
> 03/11/2021 [    3.142927] RIP: 0010:usb_submit_urb+0x60e/0x650 [
> 3.142930] Code: 89 44 24 10 89 4c 24 08 e8 2f a5 f4 ff 44 8b 44 24 10
> 8b 4c 24 08 48 c7 c7 a0 36 07 82 48 8b 54 24 18 48 89 c6 e8 d4 15 1d 00
> <0f> 0b 8b 45 5c 25 ff fd 80 ff 45 85 f6 0f 85 36 ff ff ff 80 cc 02 [
>  3.142932] RSP: 0018:ffff888104807ac0 EFLAGS: 00010282 [    3.142935]
> RAX: 0000000000000047 RBX: 0000000000000000 RCX: 0000000000000000 [
> 3.142936] RDX: ffff88841eade380 RSI: ffff88841ead7510 RDI:
> ffff88841ead7510 [    3.142937] RBP: ffff888117043d80 R08:
> ffffffff82305068 R09: 0000000000009ffb [    3.142938] R10:
> 00000000ffffe000 R11: 3fffffffffffffff R12: ffff888102265000 [
> 3.142938] R13: 0000000000000000 R14: 0000000000000001 R15:
> ffff888102265058 [    3.142939] FS:  00007f24b42f58c0(0000)
> GS:ffff88841eac0000(0000) knlGS:0000000000000000 [    3.142941] CS:
> 0010 DS: 0000 ES: 0000 CR0: 0000000080050033 [    3.142942] CR2:
> 000055b6d7d7c040 CR3: 0000000105fe3000 CR4: 00000000003506e0 [
> 3.142943] Call Trace: [    3.142945]  usb_start_wait_urb+0x50/0xd0 [
> 3.142947]  usb_control_msg+0xbd/0x110 [    3.142951]
> rtl28xxu_ctrl_msg+0x62/0x160 [dvb_usb_rtl28xxu] [    3.142956]
> rtl28xxu_identify_state+0x32/0x70 [dvb_usb_rtl28xxu] [    3.142960]
> dvb_usbv2_probe+0x10f/0x180 [dvb_usb_v2] [    3.142963]  ?
> pm_runtime_enable+0x16/0xb0 [    3.142966]  ?
> __pm_runtime_set_status+0x145/0x2a0 [    3.142968]
> usb_probe_interface+0xd0/0x250 [    3.142970]  really_probe+0xe5/0x450
> [    3.142973]  driver_probe_device+0x51/0xb0 [    3.142975]
> device_driver_attach+0x9c/0xb0 [    3.142976]
> __driver_attach+0x7c/0x110 [    3.142978]  ?
> device_driver_attach+0xb0/0xb0 [    3.142979]
> bus_for_each_dev+0x5c/0x90 [    3.142982]  bus_add_driver+0x101/0x1b0 [
>    3.142984]  driver_register+0x86/0xd0 [    3.142986]
> usb_register_driver+0x7f/0x120 [    3.142987]  ? 0xffffffffa0436000 [
>  3.142989]  do_one_initcall+0x34/0x140 [    3.142992]  ?
> __cond_resched+0x11/0x40 [    3.142995]  ? kmem_cache_alloc+0x35/0x150
> [    3.142999]  do_init_module+0x51/0x230 [    3.143001]
> __do_sys_finit_module+0x8f/0xc0 [    3.143003]  do_syscall_64+0x34/0x90
> [    3.143005]  entry_SYSCALL_64_after_hwframe+0x44/0xae [    3.143007]
> RIP: 0033:0x7f24b47ae9b9 [    3.143008] Code: 00 c3 66 2e 0f 1f 84 00
> 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2
> 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7
> 54 0c 00 f7 d8 64 89 01 48 [    3.143009] RSP: 002b:00007ffed1ac02e8
> EFLAGS: 00000246 ORIG_RAX: 0000000000000139 [    3.143011] RAX:
> ffffffffffffffda RBX: 000055b6d7e8b070 RCX: 00007f24b47ae9b9 [
> 3.143012] RDX: 0000000000000000 RSI: 00007f24b4939e2d RDI:
> 0000000000000010 [    3.143013] RBP: 0000000000020000 R08:
> 0000000000000000 R09: 000055b6d7e770a0 [    3.143013] R10:
> 0000000000000010 R11: 0000000000000246 R12: 00007f24b4939e2d [
> 3.143014] R13: 0000000000000000 R14: 000055b6d7e8c070 R15:
> 000055b6d7e8b070 [    3.143015] ---[ end trace 74ad8cc11087d2a8 ]---

This should be fixed by:

https://lore.kernel.org/r/20210524110920.24599-4-johan@kernel.org

Alan Stern
