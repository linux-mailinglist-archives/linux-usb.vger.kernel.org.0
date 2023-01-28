Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340FF67FA44
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jan 2023 19:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjA1SxW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Jan 2023 13:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjA1SxU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Jan 2023 13:53:20 -0500
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com [136.143.188.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2404316301
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 10:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674931989; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Np1fpLyHMcwbhkpt0bbA9RJzIgPr0IYHxnWIp3kVQbyEoKeAEpbV5l12zrFF76T2U+mlDLWVDSsFrzUyZXgE65ezaatqbaCMRtlRCt7mb/GAQ4Bs29/yJ/l1SddUCZcW1hCrGdGWiePE5H9R8hDcJfA5XY1eTAiTvaXjWR+TKzs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1674931989; h=Content-Type:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=gngDh4ZTKp7HsukjYedYKVORFnuXeQYtUXD1riA3BYc=; 
        b=KWfN9FDP2KUJlLLEsaPrnyA2uweuGVBdGtzFTW7gs3nlEzeyLNuQP6ZlftXUgRgrk95OdyyqkouxwmudLIpMqZbc8X9tEptt/QHbQYBapCgZ+OgT8/iHsKimLOUILHAUIlvORsRdcFx8o1+44zg7gS/Gzqr85Ycy1nU+4rtur6I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=brennan.io;
        spf=pass  smtp.mailfrom=stephen@brennan.io;
        dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674931989;
        s=selector01; d=brennan.io; i=stephen@brennan.io;
        h=From:From:To:To:Subject:Subject:In-Reply-To:References:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
        bh=gngDh4ZTKp7HsukjYedYKVORFnuXeQYtUXD1riA3BYc=;
        b=RefCPuIXgVjnr4HjXoW0f874Zhq5iTFXjrrARMOiJfiDA6DCv1hUVwXLHcxSnv0t
        ghBfaRNfAUpZTgUO6WdOE9lSBDSjsgIgzqJCdPQU56Ez33QhfaNotxp2H984EPg7EOz
        PVxMdxz5UxAE4R4GR9ua9JrW8c5ZpNEiiyYjS5R4=
Received: from localhost (136-24-52-195.cab.webpass.net [136.24.52.195]) by mx.zohomail.com
        with SMTPS id 167493198377730.446969158634943; Sat, 28 Jan 2023 10:53:03 -0800 (PST)
From:   Stephen Brennan <stephen@brennan.io>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: Page fault in process_bulk_intr_td()
In-Reply-To: <d4c5960a-6c5b-5aa8-6a49-6bad2e1c6e76@linux.intel.com>
References: <878rhwczhs.fsf@brennan.io>
 <d4c5960a-6c5b-5aa8-6a49-6bad2e1c6e76@linux.intel.com>
Date:   Sat, 28 Jan 2023 10:53:02 -0800
Message-ID: <874jsacwz5.fsf@brennan.io>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mathias Nyman <mathias.nyman@linux.intel.com> writes:
> On 21.1.2023 5.55, stephen@brennan.io wrote:
>> Hi all,
>> 
>> Today on my desktop running 6.1.6-arch1, I encountered the following
>> page fault. I looked for recent commits since then which may be related
>> but didn't find too much. I know it's a distro kernel, but it's recent
>> enough that I thought I'd share.
>> 
>> [242632.503611] BUG: unable to handle page fault for address: 000000008a49c504
>> [242632.510560] #PF: supervisor write access in kernel mode
>> [242632.515864] #PF: error_code(0x0002) - not-present page
>> [242632.521077] PGD 16d54b067 P4D 16d54b067 PUD 0
>> [242632.525599] Oops: 0002 [#1] PREEMPT SMP NOPTI
>> [242632.530039] CPU: 4 PID: 252721 Comm: cc1 Kdump: loaded Tainted: G           OE      6.1.6-arch1-3-stephen #1 cca7bc1605c8162784590202a8c158ac5b4faea6
>> [242632.543478] Hardware name: ASUS System Product Name/TUF GAMING X570-PRO (WI-FI), BIOS 3603 03/20/2021
>> [242632.552757] RIP: 0010:xhci_irq+0x16fe/0x1fc0
>> [242632.557114] Code: 4c 8b 54 24 18 e9 c3 f5 ff ff 8d 45 e6 83 f8 01 0f 86 5e ff ff ff e9 4e ff ff ff 48 8b 44 24 18 44 89 c2 44 29 ca 48 8b 40 28 <89> 90 84 00 00 00 e9 ab f2 ff ff 49 8b 95 60 02 00 00 44 89 c9 48
>> [242632.575907] RSP: 0000:ffffa8061cf43df8 EFLAGS: 00010082
>> [242632.581206] RAX: 000000008a49c480 RBX: ffffa80600131730 RCX: 000000000000000d
>> [242632.588411] RDX: 00000000d313edc4 RSI: ffff957d86596460 RDI: ffff957d80efc260
>> [242632.595617] RBP: 000000000000000d R08: 0000000000000040 R09: 0000000000000039
>> [242632.602820] R10: 0000000000000000 R11: ffff957d865a7000 R12: ffff957d80f76140
>> [242632.610024] R13: ffff957d80efc000 R14: 0000000000000081 R15: ffffa80600131730
>> [242632.617227] FS:  00007ff4bfa38ac0(0000) GS:ffff958c6e900000(0000) knlGS:0000000000000000
>> [242632.625383] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [242632.631203] CR2: 000000008a49c504 CR3: 0000000405c38000 CR4: 0000000000750ee0
>> [242632.638411] PKRU: 55555554
>> [242632.641202] Call Trace:
>> [242632.643735]  <TASK>
>> [242632.645924]  __handle_irq_event_percpu+0x4d/0x190
>> [242632.650715]  handle_irq_event+0x3b/0x80
>> [242632.654641]  handle_edge_irq+0x9a/0x260
>> [242632.658569]  __common_interrupt+0x46/0xa0
>> [242632.662668]  common_interrupt+0x43/0xa0
>> [242632.666593]  asm_common_interrupt+0x26/0x40
>> [242632.670866] RIP: 0033:0x636540
>> [242632.674027] Code: 05 dd 56 1e 02 0f b6 40 2c d0 e8 83 e0 01 c3 66 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 8b 05 bd 56 1e 02 80 48 2b 10 c3 <f3> 0f 1e fa 48 8b 0d ad 56 1e 02 48 85 c9 75 10 eb 6e 66 0f 1f 44
>> [242632.692825] RSP: 002b:00007ffe2144df78 EFLAGS: 00000246
>> [242632.698133] RAX: 0000000000000006 RBX: 00007ff4ba906400 RCX: 00007ff4bed2ded0
>> [242632.705336] RDX: 0000000000000001 RSI: 0000000000000006 RDI: 0000000000000000
>> [242632.712541] RBP: 000000007ff231ad R08: 0000000000000001 R09: 0000000000000072
>> [242632.719747] R10: 0000000000000000 R11: 2675089da1f1c2c7 R12: 000000007ff231ad
>> [242632.726949] R13: 7ff231ad7ff231ad R14: 00007ff4bee11cf0 R15: 00007ff4bee11cf0
>> [242632.734161]  </TASK>
>> [242632.736440] Modules linked in: uinput nls_utf8 cifs cifs_arc4 cifs_md4 dns_resolver fscache netfs rfcomm hid_logitech_hidpp mousedev joydev uvcvideo videobuf2_vmalloc videobuf2_memops snd_usb_audio videobuf2_v4l2 videobuf2_common snd_usbmidi_lib snd_rawmidi videodev vfat snd_seq_device fat hid_plantronics mc hid_logitech_dj cmac algif_hash algif_skcipher nct6775 af_alg nct6775_core hwmon_vid bnep intel_rapl_msr intel_rapl_common edac_mce_amd iwlmvm kvm_amd ccp snd_hda_codec_realtek snd_hda_codec_generic mac80211 snd_hda_codec_hdmi libarc4 kvm snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi irqbypass btusb snd_hda_codec crct10dif_pclmul crc32_pclmul btrtl polyval_clmulni snd_hda_core polyval_generic btbcm snd_hwdep gf128mul iwlwifi btintel ghash_clmulni_intel snd_pcm btmtk sha512_ssse3 eeepc_wmi asus_wmi bluetooth aesni_intel snd_timer cfg80211 crypto_simd ledtrig[242632.503611] BUG: unable to handle page fault for address: 000000008a49c504
>> [242632.510560] #PF: supervisor write access in kernel mode
>> [242632.515864] #PF: error_code(0x0002) - not-present page
>> [242632.521077] PGD 16d54b067 P4D 16d54b067 PUD 0
>> [242632.525599] Oops: 0002 [#1] PREEMPT SMP NOPTI
>> [242632.530039] CPU: 4 PID: 252721 Comm: cc1 Kdump: loaded Tainted: G           OE      6.1.6-arch1-3-stephen #1 cca7bc1605c8162784590202a8c158ac5b4faea6_audio snd cryptd uas sparse_keymap sp5100_tco zenpower(OE) platform_profile rapl usb_storage pcspkr ecdh_generic wmi_bmof
>> [242632.736509]  soundcore i2c_piix4 igc rfkill acpi_cpufreq mac_hid dm_multipath dm_mod crypto_user fuse bpf_preload ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 usbhid nvme sr_mod nvme_core crc32c_intel cdrom xhci_pci nvme_common xhci_pci_renesas amdgpu drm_ttm_helper ttm video wmi gpu_sched drm_buddy drm_display_helper cec
>> [242632.853084] CR2: 000000008a49c504
>> 
>> I used drgn (https://github.com/osandov/drgn) to get a nicer stack
>> trace:
>> 
>>      #0  process_bulk_intr_td (drivers/usb/host/xhci-ring.c:2502:38)
>>      #1  handle_tx_event (drivers/usb/host/xhci-ring.c:2867:4)
>>      #2  xhci_handle_event (drivers/usb/host/xhci-ring.c:2946:9)
>>      #3  xhci_irq (drivers/usb/host/xhci-ring.c:3080:9)
>>      #4  __handle_irq_event_percpu (kernel/irq/handle.c:158:9)
>>      #5  handle_irq_event_percpu (kernel/irq/handle.c:193:11)
>>      #6  handle_irq_event (kernel/irq/handle.c:210:8)
>>      #7  handle_edge_irq (kernel/irq/chip.c:819:3)
>>      #8  generic_handle_irq_desc (./include/linux/irqdesc.h:158:2)
>>      #9  handle_irq (arch/x86/kernel/irq.c:231:3)
>>      #10 __common_interrupt (arch/x86/kernel/irq.c:250:3)
>>      #11 common_interrupt (arch/x86/kernel/irq.c:240:1)
>>      #12 asm_common_interrupt+0x26/0x2b (./arch/x86/include/asm/idtentry.h:640)
>> 
>> The code in question:
>> 
>>      static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
>>      		struct xhci_ring *ep_ring, struct xhci_td *td,
>>      		union xhci_trb *ep_trb, struct xhci_transfer_event *event)
>>      {
>>      	/* many lines omitted */
>>      	if (ep_trb == td->last_trb)
>>      		td->urb->actual_length = requested - remaining;
>> 
>> I was able to use crash and some disassembly to confirm that RAX was the
>> register being dereferenced, and it has a value 000000008a49c504 which
>> was recorded in the page fault output. However, working backwards, I
>> found that the td and td->urb pointers were both valid. So I'm assuming
>> there's a race here somewhere. With crash, I found two other stacks on
>> CPU which seemed suspicious:
>> 
>>      PID: 252783   TASK: ffff9586455a0000  CPU: 13   COMMAND: "cc1"
>>       #0 [fffffe000030ce60] crash_nmi_callback at ffffffff84e657c6
>>       #1 [fffffe000030ce68] nmi_handle at ffffffff84e321e1
>>       #2 [fffffe000030ceb0] default_do_nmi at ffffffff85a1ee40
>>       #3 [fffffe000030ced0] exc_nmi at ffffffff85a1f066
>>       #4 [fffffe000030cef0] end_repeat_nmi at ffffffff85c01e3e
>>          [exception RIP: native_queued_spin_lock_slowpath+109]
>>          RIP: ffffffff85a3519d  RSP: ffffa8061cffbc60  RFLAGS: 00000002
>>          RAX: 0000000000000101  RBX: ffffffff874c25ec  RCX: ffff957d8004c808
>>          RDX: 0000000000000000  RSI: 0000000000000001  RDI: ffffffff874c25ec
>>          RBP: 0000000000000046   R8: 0000000000000000   R9: 0000000000000000
>>          R10: 0000000000000000  R11: 0000000000000000  R12: ffffa8061cffbd48
>>          R13: 0000000000000002  R14: 0000000000000000  R15: 0000000000000000
>>          ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0000
>>      --- <NMI exception stack> ---
>>       #5 [ffffa8061cffbc60] native_queued_spin_lock_slowpath at ffffffff85a3519d
>>       #6 [ffffa8061cffbc80] oops_begin at ffffffff84e31c9c
>>       #7 [ffffa8061cffbc98] page_fault_oops at ffffffff84e81ec1
>>       #8 [ffffa8061cffbd18] exc_page_fault at ffffffff85a21774
>>       #9 [ffffa8061cffbd40] asm_exc_page_fault at ffffffff85c01266
>>          [exception RIP: xhci_irq+5886]
>>          RIP: ffffffff856cd58e  RSP: ffffa8061cffbdf8  RFLAGS: 00010003
>>          RAX: 00000000edf2e780  RBX: ffffa80600209ca0  RCX: 000000000000000d
>>          RDX: 0000000036bd10c4  RSI: ffff957d87169ae0  RDI: ffff957d9ebae260
>>          RBP: 000000000000000d   R8: 0000000000000020   R9: 0000000000000011
>>          R10: 0000000000000000  R11: ffff957e7ccf5880  R12: ffff957e11552380
>>          R13: ffff957d9ebae000  R14: 0000000000000081  R15: ffffa80600209ca0
>>          ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0000
>>      #10 [ffffa8061cffbe98] __handle_irq_event_percpu at ffffffff84f1fdbd
>>      #11 [ffffa8061cffbec8] handle_irq_event at ffffffff84f1ff8b
>>      #12 [ffffa8061cffbee8] handle_edge_irq at ffffffff84f24afa
>>      #13 [ffffa8061cffbf08] __common_interrupt at ffffffff84e30556
>>      #14 [ffffa8061cffbf30] common_interrupt at ffffffff85a1e9b3
>>      #15 [ffffa8061cffbf50] asm_common_interrupt at ffffffff85c014e6
>>          RIP: 000000000082ce8d  RSP: 00007ffc76405600  RFLAGS: 00000296
>>          RAX: 000000000000006c  RBX: 00007fe2941b88c0  RCX: 00000000038ef8d7
>>          RDX: 00000000a0d7e714  RSI: 0000000000000011  RDI: 00000000038ef8d0
>>          RBP: 00007fe2941b88c0   R8: 00000000257c7983   R9: 000000007ff3facb
>>          R10: 00007fe29837c000  R11: 00000000257c7983  R12: 00000000ae574838
>>          R13: 00007fe297708c90  R14: 00007ffc76405800  R15: 00000000038ef8d0
>>          ORIG_RAX: ffffffffffffffff  CS: 0033  SS: 002b
>>      
>>      PID: 640      TASK: ffff957d9e924180  CPU: 31   COMMAND: "usb-storage"
>>       #0 [fffffe0000732e60] crash_nmi_callback at ffffffff84e657c6
>>       #1 [fffffe0000732e68] nmi_handle at ffffffff84e321e1
>>       #2 [fffffe0000732eb0] default_do_nmi at ffffffff85a1ee40
>>       #3 [fffffe0000732ed0] exc_nmi at ffffffff85a1f066
>>       #4 [fffffe0000732ef0] end_repeat_nmi at ffffffff85c01e3e
>>          [exception RIP: native_queued_spin_lock_slowpath+111]
>>          RIP: ffffffff85a3519f  RSP: ffffa8060142bc00  RFLAGS: 00000002
>>          RAX: 0000000000000101  RBX: ffff957d80efc2ac  RCX: 0000000000000001
>>          RDX: 0000000000000000  RSI: 0000000000000001  RDI: ffff957d80efc2ac
>>          RBP: 0000000000000001   R8: 0000000000000001   R9: ffff957dbff46980
>>          R10: 000000000000001f  R11: ffff957d86617a40  R12: ffff957d80efc2ac
>>          R13: ffff957d81dae840  R14: ffff957dbff46980  R15: ffff957d80efc010
>>          ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
>>      --- <NMI exception stack> ---
>>       #5 [ffffa8060142bc00] native_queued_spin_lock_slowpath at ffffffff85a3519f
>>       #6 [ffffa8060142bc20] _raw_spin_lock_irqsave at ffffffff85a34a8d
>>       #7 [ffffa8060142bc30] xhci_urb_enqueue at ffffffff856c2e89
>>       #8 [ffffa8060142bc90] usb_hcd_submit_urb at ffffffff8568e7e4
>>       #9 [ffffa8060142bd50] usb_stor_msg_common at ffffffffc13912ee [usb_storage]
>>      #10 [ffffa8060142bd90] usb_stor_bulk_transfer_buf at ffffffffc1391685 [usb_storage]
>>      #11 [ffffa8060142bdb8] usb_stor_Bulk_transport at ffffffffc1392089 [usb_storage]
>>      #12 [ffffa8060142be00] usb_stor_invoke_transport at ffffffffc1392563 [usb_storage]
>>      #13 [ffffa8060142beb8] usb_stor_control_thread at ffffffffc139332c [usb_storage]
>>      #14 [ffffa8060142bf18] kthread at ffffffff84ec73ce
>>      #15 [ffffa8060142bf50] ret_from_fork at ffffffff84e03572
>> 
>> CPU 13 had the exact same page fault at the same instruction, but with a
>> different RAX value. CPU 31 has a suspicious looking stack (given that
>> we faulted on a field td->urb), but I don't know anything in this
>> subsystem very well.
>> 
>> I have the core dump and kernel info and would be happy to fetch more
>> information if yo uwanted. I don't think it's (easily) reproducible.
>> I just wanted to share in case this catches anyone's eye. I admit
>> between some amdgpu crashes and this, my desktop hasn't been as stable
>> as I'd like, so I'll be reporting any other crashes if they happen.
>
> Thanks for this report.
>
> In normal cases the URB should not be altered until xhci driver gives it back,
> and this normally happens after xHC handled the last transfer block (TRB) of this URB.
>
> In some special cases (short transfer or error on multi TRB URB) I think we might give
> back the URB before the last TRB is handled, but TD should be removed from list
> of queued TDs, so event handling shouldn't reach process_intr_bulk_td() and dereference
> td->urb. Unless there's a bug.
>
> Were there any usb related error messages in dmesg before this?

Hi Mathias,

Sorry I took a few days to reply!

There were no USB log messages within a few seconds of the panic.
However, if I go back quite a while, there's some logs, mostly just
related to USB connect/disconnect. 

Here's an annotation for timestamps in the below log.

long before: 2+ days before panic
  Disconnected laptop from dock, USB devices removed
242125: (8:27 before panic)
  I reconnect (or wake? uncertain) my laptop to dock, which also happens
  to have a USB KVM switch attached to it, and a variety of devices.
242214: (6:58 before panic)
  Plug in Yubikey to sign new kernel. I started our favorite workload, a
  kernel build, at this time.
242314: (5:18 before panic)
  Started Just Cause 4 game, which is running under Proton. You can see
  a variety of errors on /dev/sr0, which is unfortunately the result of
  Wine making some async I/O requests to my empty CD drive. It's
  harmless, if annoying.
242632:
  Panic happens.

So no errors and nothing right beforehand. I'm pasting the full log
below. I may play around with the vmcore more today if I have some free
time.

Thanks,
Stephen

[242125.454377] usb 5-2: new high-speed USB device number 7 using xhci_hcd
[242125.606006] usb 5-2: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice= 4.02
[242125.606013] usb 5-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[242125.606015] usb 5-2: Product: USB2.0 Hub
[242125.606016] usb 5-2: Manufacturer: GenesysLogic
[242125.658535] hub 5-2:1.0: USB hub found
[242125.659649] hub 5-2:1.0: 4 ports detected
[242125.721703] usb 6-2: new SuperSpeed USB device number 3 using xhci_hcd
[242125.741702] usb 6-2: New USB device found, idVendor=05e3, idProduct=0616, bcdDevice= 4.02
[242125.741708] usb 6-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[242125.741710] usb 6-2: Product: USB3.0 Hub
[242125.741711] usb 6-2: Manufacturer: GenesysLogic
[242125.770457] hub 6-2:1.0: USB hub found
[242125.770879] hub 6-2:1.0: 4 ports detected
[242126.021038] usb 5-2.1: new full-speed USB device number 8 using xhci_hcd
[242126.142048] usb 5-2.1: New USB device found, idVendor=047f, idProduct=02ee, bcdDevice=16.15
[242126.142053] usb 5-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[242126.142055] usb 5-2.1: Product: Plantronics BT600
[242126.142057] usb 5-2.1: Manufacturer: Plantronics
[242126.142058] usb 5-2.1: SerialNumber: b2cf5897f301f949bda518270ce79e12
[242126.921387] input: Plantronics Plantronics BT600 as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.1/5-2.1:1.3/0003:047F:02EE.000B/input/input44
[242126.977854] plantronics 0003:047F:02EE.000B: input,hiddev97,hidraw1: USB HID v1.11 Device [Plantronics Plantronics BT600] on usb-0000:0d:00.3-2.1/input3
[242127.054056] usb 5-2.2: new full-speed USB device number 9 using xhci_hcd
[242127.164049] usb 5-2.2: New USB device found, idVendor=046d, idProduct=c52b, bcdDevice=12.11
[242127.164054] usb 5-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[242127.164056] usb 5-2.2: Product: USB Receiver
[242127.164057] usb 5-2.2: Manufacturer: Logitech
[242127.307265] logitech-djreceiver 0003:046D:C52B.000E: hiddev98,hidraw2: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:0d:00.3-2.2/input2
[242127.433371] input: Logitech K750 as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.2/5-2.2:1.2/0003:046D:C52B.000E/0003:046D:4002.000F/input/input45
[242127.433526] logitech-hidpp-device 0003:046D:4002.000F: input,hidraw3: USB HID v1.11 Keyboard [Logitech K750] on usb-0000:0d:00.3-2.2/input2:1
[242127.441284] input: Logitech M705 as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.2/5-2.2:1.2/0003:046D:C52B.000E/0003:046D:101B.0010/input/input46
[242127.441367] logitech-hidpp-device 0003:046D:101B.0010: input,hidraw4: USB HID v1.11 Mouse [Logitech M705] on usb-0000:0d:00.3-2.2/input2:2
[242127.451352] input: Logitech MX Master as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.2/5-2.2:1.2/0003:046D:C52B.000E/0003:046D:4060.0011/input/input47
[242127.451497] logitech-hidpp-device 0003:046D:4060.0011: input,hidraw5: USB HID v1.11 Keyboard [Logitech MX Master] on usb-0000:0d:00.3-2.2/input2:3
[242127.494349] usb 5-2.3: new low-speed USB device number 10 using xhci_hcd
[242127.602107] usb 5-2.3: New USB device found, idVendor=0c45, idProduct=0133, bcdDevice= 2.00
[242127.602111] usb 5-2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[242127.602113] usb 5-2.3: Product: USB Keyboard
[242127.602114] usb 5-2.3: Manufacturer: SONiX
[242127.680601] input: SONiX USB Keyboard as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.3/5-2.3:1.0/0003:0C45:0133.0012/input/input48
[242127.734549] hid-generic 0003:0C45:0133.0012: input,hidraw6: USB HID v1.00 Keyboard [SONiX USB Keyboard] on usb-0000:0d:00.3-2.3/input0
[242127.739291] input: SONiX USB Keyboard Consumer Control as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.3/5-2.3:1.1/0003:0C45:0133.0013/input/input49
[242127.794435] input: SONiX USB Keyboard System Control as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.3/5-2.3:1.1/0003:0C45:0133.0013/input/input50
[242127.794486] hid-generic 0003:0C45:0133.0013: input,hidraw7: USB HID v1.00 Device [SONiX USB Keyboard] on usb-0000:0d:00.3-2.3/input1
[242127.874348] usb 5-2.4: new high-speed USB device number 11 using xhci_hcd
[242130.304171] usb 5-2.4: New USB device found, idVendor=046d, idProduct=082d, bcdDevice= 0.11
[242130.304178] usb 5-2.4: New USB device strings: Mfr=0, Product=2, SerialNumber=1
[242130.304180] usb 5-2.4: Product: HD Pro Webcam C920
[242130.304182] usb 5-2.4: SerialNumber: B5F3973F
[242130.361223] usb 5-2.4: Found UVC 1.00 device HD Pro Webcam C920 (046d:082d)
[242130.369017] input: HD Pro Webcam C920 as /devices/pci0000:00/0000:00:08.1/0000:0d:00.3/usb5/5-2/5-2.4/5-2.4:1.0/input/input51
[242132.425255] logitech-hidpp-device 0003:046D:4060.0011: HID++ 4.5 device connected.
[242139.570553] audit: type=1101 audit(1674267785.715:161): pid=16519 uid=1000 auid=1000 ses=3 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="stephen" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 res=success
'
[242139.570870] audit: type=1110 audit(1674267785.719:162): pid=16519 uid=1000 auid=1000 ses=3 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 r
es=success'
[242139.571953] audit: type=1105 audit(1674267785.719:163): pid=16519 uid=1000 auid=1000 ses=3 msg='op=PAM:session_open grantors=pam_systemd_home,pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev
/pts/2 res=success'
[242168.175624] systemd-fstab-generator[18142]: Checking was requested for "//10.232.231.76/stephensdir", but it is not a device.
[242168.242659] audit: type=1334 audit(1674267814.389:164): prog-id=57 op=LOAD
[242168.242664] audit: type=1334 audit(1674267814.389:165): prog-id=0 op=UNLOAD
[242168.242700] audit: type=1334 audit(1674267814.389:166): prog-id=58 op=LOAD
[242168.242713] audit: type=1334 audit(1674267814.389:167): prog-id=59 op=LOAD
[242168.242720] audit: type=1334 audit(1674267814.389:168): prog-id=0 op=UNLOAD
[242168.242722] audit: type=1334 audit(1674267814.389:169): prog-id=0 op=UNLOAD
[242168.242880] audit: type=1334 audit(1674267814.389:170): prog-id=60 op=LOAD
[242168.242888] audit: type=1334 audit(1674267814.389:171): prog-id=0 op=UNLOAD
[242168.243105] audit: type=1334 audit(1674267814.389:172): prog-id=61 op=LOAD
[242168.243114] audit: type=1334 audit(1674267814.389:173): prog-id=0 op=UNLOAD
[242175.784163] kauditd_printk_skb: 14 callbacks suppressed
[242175.784165] audit: type=1106 audit(1674267821.932:188): pid=16519 uid=1000 auid=1000 ses=3 msg='op=PAM:session_close grantors=pam_systemd_home,pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/de
v/pts/2 res=success'
[242175.789471] audit: type=1104 audit(1674267821.932:189): pid=16519 uid=1000 auid=1000 ses=3 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 r
es=success'
[242213.893540] usb 3-1: new full-speed USB device number 7 using xhci_hcd
[242214.056230] usb 3-1: New USB device found, idVendor=1050, idProduct=0407, bcdDevice= 5.43
[242214.056235] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[242214.056237] usb 3-1: Product: YubiKey OTP+FIDO+CCID
[242214.056238] usb 3-1: Manufacturer: Yubico
[242214.211734] input: Yubico YubiKey OTP+FIDO+CCID as /devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:08.0/0000:06:00.3/usb3/3-1/3-1:1.0/0003:1050:0407.0014/input/input52
[242214.266864] hid-generic 0003:1050:0407.0014: input,hidraw8: USB HID v1.10 Keyboard [Yubico YubiKey OTP+FIDO+CCID] on usb-0000:06:00.3-1/input0
[242214.270458] hid-generic 0003:1050:0407.0015: hiddev99,hidraw9: USB HID v1.10 Device [Yubico YubiKey OTP+FIDO+CCID] on usb-0000:06:00.3-1/input1
[242243.855834] audit: type=1101 audit(1674267890.003:190): pid=31146 uid=1000 auid=1000 ses=3 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="stephen" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 res=success
'
[242243.856063] audit: type=1110 audit(1674267890.003:191): pid=31146 uid=1000 auid=1000 ses=3 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 r
es=success'
[242243.857061] audit: type=1105 audit(1674267890.006:192): pid=31146 uid=1000 auid=1000 ses=3 msg='op=PAM:session_open grantors=pam_systemd_home,pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev
/pts/2 res=success'
[242244.010711] audit: type=1106 audit(1674267890.160:193): pid=31146 uid=1000 auid=1000 ses=3 msg='op=PAM:session_close grantors=pam_systemd_home,pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/de
v/pts/2 res=success'
[242244.010731] audit: type=1104 audit(1674267890.160:194): pid=31146 uid=1000 auid=1000 ses=3 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 r
es=success'
[242256.966042] audit: type=1101 audit(1674267903.113:195): pid=34197 uid=1000 auid=1000 ses=3 msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="stephen" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 res=success
'
[242256.966333] audit: type=1110 audit(1674267903.117:196): pid=34197 uid=1000 auid=1000 ses=3 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 r
es=success'
[242256.967312] audit: type=1105 audit(1674267903.117:197): pid=34197 uid=1000 auid=1000 ses=3 msg='op=PAM:session_open grantors=pam_systemd_home,pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev
/pts/2 res=success'
[242258.018637] audit: type=1106 audit(1674267904.167:198): pid=34197 uid=1000 auid=1000 ses=3 msg='op=PAM:session_close grantors=pam_systemd_home,pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/de
v/pts/2 res=success'
[242258.018651] audit: type=1104 audit(1674267904.167:199): pid=34197 uid=1000 auid=1000 ses=3 msg='op=PAM:setcred grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/2 r
es=success'
[242314.843794] sr 3:0:0:0: [sr0] tag#20 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
[242314.843798] sr 3:0:0:0: [sr0] tag#20 Sense Key : Not Ready [current]
[242314.843799] sr 3:0:0:0: [sr0] tag#20 Add. Sense: Medium not present - tray closed
[242314.843801] sr 3:0:0:0: [sr0] tag#20 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00
[242314.843802] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 2
[242315.043819] sr 3:0:0:0: [sr0] tag#23 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
[242315.043825] sr 3:0:0:0: [sr0] tag#23 Sense Key : Not Ready [current]
[242315.043827] sr 3:0:0:0: [sr0] tag#23 Add. Sense: Medium not present - tray closed
[242315.043830] sr 3:0:0:0: [sr0] tag#23 CDB: Read(10) 28 00 00 00 00 00 00 00 02 00
[242315.043831] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 8 prio class 2
[242315.052034] Buffer I/O error on dev sr0, logical block 0, async page read
[242315.059117] Buffer I/O error on dev sr0, logical block 1, async page read
[242315.066094] Buffer I/O error on dev sr0, logical block 2, async page read
[242315.073023] Buffer I/O error on dev sr0, logical block 3, async page read
[242315.073028] Buffer I/O error on dev sr0, logical block 4, async page read
[242315.086937] Buffer I/O error on dev sr0, logical block 5, async page read
[242315.086940] Buffer I/O error on dev sr0, logical block 6, async page read
[242315.086942] Buffer I/O error on dev sr0, logical block 7, async page read
[242315.086992] sr 3:0:0:0: [sr0] tag#9 unaligned transfer
[242315.107611] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[242315.115816] Buffer I/O error on dev sr0, logical block 0, async page read
[242315.220530] sr 3:0:0:0: [sr0] tag#0 unaligned transfer
[242315.220535] I/O error, dev sr0, sector 1 op 0x0:(READ) flags 0x0 phys_seg 7 prio class 2
[242315.228893] Buffer I/O error on dev sr0, logical block 1, async page read
[242317.241129] usb 5-2.4: reset high-speed USB device number 11 using xhci_hcd
[242323.320399] sr 3:0:0:0: [sr0] tag#7 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
[242323.320408] sr 3:0:0:0: [sr0] tag#7 Sense Key : Not Ready [current]
[242323.320411] sr 3:0:0:0: [sr0] tag#7 Add. Sense: Medium not present - tray closed
[242323.320415] sr 3:0:0:0: [sr0] tag#7 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00
[242323.320417] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 2
[242323.329847] sr 3:0:0:0: [sr0] tag#11 unaligned transfer
[242323.329852] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[242323.338036] buffer_io_error: 6 callbacks suppressed
[242323.338038] Buffer I/O error on dev sr0, logical block 0, async page read
[242323.349888] sr 3:0:0:0: [sr0] tag#12 unaligned transfer
[242323.349892] I/O error, dev sr0, sector 1 op 0x0:(READ) flags 0x0 phys_seg 7 prio class 2
[242323.358066] Buffer I/O error on dev sr0, logical block 1, async page read
[242323.364939] Buffer I/O error on dev sr0, logical block 2, async page read
[242323.371816] Buffer I/O error on dev sr0, logical block 3, async page read
[242323.378690] Buffer I/O error on dev sr0, logical block 4, async page read
[242323.385585] Buffer I/O error on dev sr0, logical block 5, async page read
[242323.392456] Buffer I/O error on dev sr0, logical block 6, async page read
[242323.399332] Buffer I/O error on dev sr0, logical block 7, async page read
[242329.347042] sr 3:0:0:0: [sr0] tag#6 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
[242329.347047] sr 3:0:0:0: [sr0] tag#6 Sense Key : Not Ready [current]
[242329.347049] sr 3:0:0:0: [sr0] tag#6 Add. Sense: Medium not present - tray closed
[242329.347051] sr 3:0:0:0: [sr0] tag#6 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00
[242329.347051] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 2
[242329.356223] sr 3:0:0:0: [sr0] tag#7 unaligned transfer
[242329.356228] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[242329.364417] Buffer I/O error on dev sr0, logical block 0, async page read
[242329.371321] sr 3:0:0:0: [sr0] tag#13 unaligned transfer
[242329.371326] I/O error, dev sr0, sector 1 op 0x0:(READ) flags 0x0 phys_seg 7 prio class 2
[242329.379502] Buffer I/O error on dev sr0, logical block 1, async page read
[242329.386382] Buffer I/O error on dev sr0, logical block 2, async page read
[242329.393258] Buffer I/O error on dev sr0, logical block 3, async page read
[242329.400134] Buffer I/O error on dev sr0, logical block 4, async page read
[242329.407014] Buffer I/O error on dev sr0, logical block 5, async page read
[242329.413893] Buffer I/O error on dev sr0, logical block 6, async page read
[242329.420775] Buffer I/O error on dev sr0, logical block 7, async page read
[242337.440253] sr 3:0:0:0: [sr0] tag#18 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
[242337.440260] sr 3:0:0:0: [sr0] tag#18 Sense Key : Not Ready [current]
[242337.440263] sr 3:0:0:0: [sr0] tag#18 Add. Sense: Medium not present - tray closed
[242337.440265] sr 3:0:0:0: [sr0] tag#18 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00
[242337.440267] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 2
[242337.449780] sr 3:0:0:0: [sr0] tag#20 unaligned transfer
[242337.449785] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[242337.457983] Buffer I/O error on dev sr0, logical block 0, async page read
[242337.464903] sr 3:0:0:0: [sr0] tag#21 unaligned transfer
[242337.464906] I/O error, dev sr0, sector 1 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[242337.473080] Buffer I/O error on dev sr0, logical block 1, async page read
[242337.479967] sr 3:0:0:0: [sr0] tag#23 unaligned transfer
[242337.479971] I/O error, dev sr0, sector 2 op 0x0:(READ) flags 0x0 phys_seg 6 prio class 2
[242337.488174] Buffer I/O error on dev sr0, logical block 2, async page read
[242337.495047] Buffer I/O error on dev sr0, logical block 3, async page read
[242337.501925] Buffer I/O error on dev sr0, logical block 4, async page read
[242337.508804] Buffer I/O error on dev sr0, logical block 5, async page read
[242337.515688] Buffer I/O error on dev sr0, logical block 6, async page read
[242337.522571] Buffer I/O error on dev sr0, logical block 7, async page read
[242395.089741] sr 3:0:0:0: [sr0] tag#31 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
[242395.089748] sr 3:0:0:0: [sr0] tag#31 Sense Key : Not Ready [current]
[242395.089751] sr 3:0:0:0: [sr0] tag#31 Add. Sense: Medium not present - tray closed
[242395.089754] sr 3:0:0:0: [sr0] tag#31 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00
[242395.089756] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 2
[242395.098441] sr 3:0:0:0: [sr0] tag#6 unaligned transfer
[242395.098447] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[242395.106635] Buffer I/O error on dev sr0, logical block 0, async page read
[242395.113605] sr 3:0:0:0: [sr0] tag#7 unaligned transfer
[242395.113610] I/O error, dev sr0, sector 1 op 0x0:(READ) flags 0x0 phys_seg 7 prio class 2
[242395.121780] Buffer I/O error on dev sr0, logical block 1, async page read
[242395.129024] Buffer I/O error on dev sr0, logical block 2, async page read
[242395.135901] Buffer I/O error on dev sr0, logical block 3, async page read
[242395.142791] Buffer I/O error on dev sr0, logical block 4, async page read
[242395.149668] Buffer I/O error on dev sr0, logical block 5, async page read
[242395.156549] Buffer I/O error on dev sr0, logical block 6, async page read
[242395.163434] Buffer I/O error on dev sr0, logical block 7, async page read
[242414.082858] sr 3:0:0:0: [sr0] tag#20 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
[242414.082869] sr 3:0:0:0: [sr0] tag#20 Sense Key : Not Ready [current]
[242414.082872] sr 3:0:0:0: [sr0] tag#20 Add. Sense: Medium not present - tray closed
[242414.082875] sr 3:0:0:0: [sr0] tag#20 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00
[242414.082877] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 2
[242414.091493] sr 3:0:0:0: [sr0] tag#5 unaligned transfer
[242414.091500] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[242414.099702] Buffer I/O error on dev sr0, logical block 0, async page read
[242414.099722] sr 3:0:0:0: [sr0] tag#6 unaligned transfer
[242414.106594] I/O error, dev sr0, sector 1 op 0x0:(READ) flags 0x0 phys_seg 7 prio class 2
[242414.114773] Buffer I/O error on dev sr0, logical block 1, async page read
[242414.121658] Buffer I/O error on dev sr0, logical block 2, async page read
[242414.121662] Buffer I/O error on dev sr0, logical block 3, async page read
[242414.121663] Buffer I/O error on dev sr0, logical block 4, async page read
[242414.142286] Buffer I/O error on dev sr0, logical block 5, async page read
[242414.149161] Buffer I/O error on dev sr0, logical block 6, async page read
[242414.149164] Buffer I/O error on dev sr0, logical block 7, async page read
[242415.560799] umip: JustCause4.exe[114187] ip:14f509700 sp:117238: SGDT instruction cannot be used by applications.
[242415.560806] umip: JustCause4.exe[114187] ip:14f509700 sp:117238: For now, expensive software emulation returns the result.
[242417.098404] umip: JustCause4.exe[114187] ip:149f8bb7b sp:10f618: SGDT instruction cannot be used by applications.
[242417.098412] umip: JustCause4.exe[114187] ip:149f8bb7b sp:10f618: For now, expensive software emulation returns the result.
[242418.425154] umip: JustCause4.exe[114187] ip:14b7898f3 sp:11db78: SGDT instruction cannot be used by applications.
[242632.503611] BUG: unable to handle page fault for address: 000000008a49c504
