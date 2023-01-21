Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6174F6763A7
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 05:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjAUELL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 23:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjAUELK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 23:11:10 -0500
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 20 Jan 2023 20:11:07 PST
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com [136.143.188.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B779573AFC
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 20:11:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674273360; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=mIGeqKvcWZ/hEVaRIDLaTucsh1gwCwG/mCFVSbiRfsC9z6woRI4vVNn54n2vNwzPXaMIieErwgq8UOBGJUBMvRyZQ4zsoW2Ym779zjMoaZIkDuAq/EbaqLpjAZd5QWRvWykaY+3ggl9f51mywUT+BQaRmfLBRYsnrKAdqcbTf18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1674273360; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=kWY58hGvxLadTfAVYc3SlnA+/FN1tzRNXgKTbqvumzM=; 
        b=YVfUcutUA5t1Pm2+fx7M0jCxRCqMsZR4tAejWAbxWAYsR8/JZNginIg9Bm/ePXR2tSeoyvev0zIehd/pTpRTFUpONwEwnWcD2Ep+bB2J4XcdPxGKEfI2ghaFzV7jCe+GdH75OUY1yANXL5WSbz2qqVYFfmR9yQE2ZVytEfI9ces=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=brennan.io;
        spf=pass  smtp.mailfrom=stephen@brennan.io;
        dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674273360;
        s=selector01; d=brennan.io; i=stephen@brennan.io;
        h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
        bh=kWY58hGvxLadTfAVYc3SlnA+/FN1tzRNXgKTbqvumzM=;
        b=NVZdCZlYRK64IJe8inYn1kNT8/99XuYbUXzmf3nUURWuzJlaJbEfi9InyDWAN8lD
        /+ZetQe+j8kFHG/busnRe7oBRbSrcZarJiPqQQgt1yJg//JRQRXP9cpn1hUnQkNc/2+
        +V+FBc/rEN6P+VMDSrPQzKZd74FUL+CFP+mhHsXQ=
Received: from localhost (136-24-52-195.cab.webpass.net [136.24.52.195]) by mx.zohomail.com
        with SMTPS id 1674273358441950.004981598312; Fri, 20 Jan 2023 19:55:58 -0800 (PST)
From:   stephen@brennan.io
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Page fault in process_bulk_intr_td()
Date:   Fri, 20 Jan 2023 19:55:59 -0800
Message-ID: <878rhwczhs.fsf@brennan.io>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

Today on my desktop running 6.1.6-arch1, I encountered the following
page fault. I looked for recent commits since then which may be related
but didn't find too much. I know it's a distro kernel, but it's recent
enough that I thought I'd share.

[242632.503611] BUG: unable to handle page fault for address: 000000008a49c504
[242632.510560] #PF: supervisor write access in kernel mode
[242632.515864] #PF: error_code(0x0002) - not-present page
[242632.521077] PGD 16d54b067 P4D 16d54b067 PUD 0
[242632.525599] Oops: 0002 [#1] PREEMPT SMP NOPTI
[242632.530039] CPU: 4 PID: 252721 Comm: cc1 Kdump: loaded Tainted: G           OE      6.1.6-arch1-3-stephen #1 cca7bc1605c8162784590202a8c158ac5b4faea6
[242632.543478] Hardware name: ASUS System Product Name/TUF GAMING X570-PRO (WI-FI), BIOS 3603 03/20/2021
[242632.552757] RIP: 0010:xhci_irq+0x16fe/0x1fc0
[242632.557114] Code: 4c 8b 54 24 18 e9 c3 f5 ff ff 8d 45 e6 83 f8 01 0f 86 5e ff ff ff e9 4e ff ff ff 48 8b 44 24 18 44 89 c2 44 29 ca 48 8b 40 28 <89> 90 84 00 00 00 e9 ab f2 ff ff 49 8b 95 60 02 00 00 44 89 c9 48
[242632.575907] RSP: 0000:ffffa8061cf43df8 EFLAGS: 00010082
[242632.581206] RAX: 000000008a49c480 RBX: ffffa80600131730 RCX: 000000000000000d
[242632.588411] RDX: 00000000d313edc4 RSI: ffff957d86596460 RDI: ffff957d80efc260
[242632.595617] RBP: 000000000000000d R08: 0000000000000040 R09: 0000000000000039
[242632.602820] R10: 0000000000000000 R11: ffff957d865a7000 R12: ffff957d80f76140
[242632.610024] R13: ffff957d80efc000 R14: 0000000000000081 R15: ffffa80600131730
[242632.617227] FS:  00007ff4bfa38ac0(0000) GS:ffff958c6e900000(0000) knlGS:0000000000000000
[242632.625383] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[242632.631203] CR2: 000000008a49c504 CR3: 0000000405c38000 CR4: 0000000000750ee0
[242632.638411] PKRU: 55555554
[242632.641202] Call Trace:
[242632.643735]  <TASK>
[242632.645924]  __handle_irq_event_percpu+0x4d/0x190
[242632.650715]  handle_irq_event+0x3b/0x80
[242632.654641]  handle_edge_irq+0x9a/0x260
[242632.658569]  __common_interrupt+0x46/0xa0
[242632.662668]  common_interrupt+0x43/0xa0
[242632.666593]  asm_common_interrupt+0x26/0x40
[242632.670866] RIP: 0033:0x636540
[242632.674027] Code: 05 dd 56 1e 02 0f b6 40 2c d0 e8 83 e0 01 c3 66 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 8b 05 bd 56 1e 02 80 48 2b 10 c3 <f3> 0f 1e fa 48 8b 0d ad 56 1e 02 48 85 c9 75 10 eb 6e 66 0f 1f 44
[242632.692825] RSP: 002b:00007ffe2144df78 EFLAGS: 00000246
[242632.698133] RAX: 0000000000000006 RBX: 00007ff4ba906400 RCX: 00007ff4bed2ded0
[242632.705336] RDX: 0000000000000001 RSI: 0000000000000006 RDI: 0000000000000000
[242632.712541] RBP: 000000007ff231ad R08: 0000000000000001 R09: 0000000000000072
[242632.719747] R10: 0000000000000000 R11: 2675089da1f1c2c7 R12: 000000007ff231ad
[242632.726949] R13: 7ff231ad7ff231ad R14: 00007ff4bee11cf0 R15: 00007ff4bee11cf0
[242632.734161]  </TASK>
[242632.736440] Modules linked in: uinput nls_utf8 cifs cifs_arc4 cifs_md4 dns_resolver fscache netfs rfcomm hid_logitech_hidpp mousedev joydev uvcvideo videobuf2_vmalloc videobuf2_memops snd_usb_audio videobuf2_v4l2 videobuf2_common snd_usbmidi_lib snd_rawmidi videodev vfat snd_seq_device fat hid_plantronics mc hid_logitech_dj cmac algif_hash algif_skcipher nct6775 af_alg nct6775_core hwmon_vid bnep intel_rapl_msr intel_rapl_common edac_mce_amd iwlmvm kvm_amd ccp snd_hda_codec_realtek snd_hda_codec_generic mac80211 snd_hda_codec_hdmi libarc4 kvm snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi irqbypass btusb snd_hda_codec crct10dif_pclmul crc32_pclmul btrtl polyval_clmulni snd_hda_core polyval_generic btbcm snd_hwdep gf128mul iwlwifi btintel ghash_clmulni_intel snd_pcm btmtk sha512_ssse3 eeepc_wmi asus_wmi bluetooth aesni_intel snd_timer cfg80211 crypto_simd ledtrig[242632.503611] BUG: unable to handle page fault for address: 000000008a49c504
[242632.510560] #PF: supervisor write access in kernel mode
[242632.515864] #PF: error_code(0x0002) - not-present page
[242632.521077] PGD 16d54b067 P4D 16d54b067 PUD 0
[242632.525599] Oops: 0002 [#1] PREEMPT SMP NOPTI
[242632.530039] CPU: 4 PID: 252721 Comm: cc1 Kdump: loaded Tainted: G           OE      6.1.6-arch1-3-stephen #1 cca7bc1605c8162784590202a8c158ac5b4faea6_audio snd cryptd uas sparse_keymap sp5100_tco zenpower(OE) platform_profile rapl usb_storage pcspkr ecdh_generic wmi_bmof
[242632.736509]  soundcore i2c_piix4 igc rfkill acpi_cpufreq mac_hid dm_multipath dm_mod crypto_user fuse bpf_preload ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 usbhid nvme sr_mod nvme_core crc32c_intel cdrom xhci_pci nvme_common xhci_pci_renesas amdgpu drm_ttm_helper ttm video wmi gpu_sched drm_buddy drm_display_helper cec
[242632.853084] CR2: 000000008a49c504

I used drgn (https://github.com/osandov/drgn) to get a nicer stack
trace:

    #0  process_bulk_intr_td (drivers/usb/host/xhci-ring.c:2502:38)
    #1  handle_tx_event (drivers/usb/host/xhci-ring.c:2867:4)
    #2  xhci_handle_event (drivers/usb/host/xhci-ring.c:2946:9)
    #3  xhci_irq (drivers/usb/host/xhci-ring.c:3080:9)
    #4  __handle_irq_event_percpu (kernel/irq/handle.c:158:9)
    #5  handle_irq_event_percpu (kernel/irq/handle.c:193:11)
    #6  handle_irq_event (kernel/irq/handle.c:210:8)
    #7  handle_edge_irq (kernel/irq/chip.c:819:3)
    #8  generic_handle_irq_desc (./include/linux/irqdesc.h:158:2)
    #9  handle_irq (arch/x86/kernel/irq.c:231:3)
    #10 __common_interrupt (arch/x86/kernel/irq.c:250:3)
    #11 common_interrupt (arch/x86/kernel/irq.c:240:1)
    #12 asm_common_interrupt+0x26/0x2b (./arch/x86/include/asm/idtentry.h:640)

The code in question:

    static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
    		struct xhci_ring *ep_ring, struct xhci_td *td,
    		union xhci_trb *ep_trb, struct xhci_transfer_event *event)
    {
    	/* many lines omitted */
    	if (ep_trb == td->last_trb)
    		td->urb->actual_length = requested - remaining;

I was able to use crash and some disassembly to confirm that RAX was the
register being dereferenced, and it has a value 000000008a49c504 which
was recorded in the page fault output. However, working backwards, I
found that the td and td->urb pointers were both valid. So I'm assuming
there's a race here somewhere. With crash, I found two other stacks on
CPU which seemed suspicious:

    PID: 252783   TASK: ffff9586455a0000  CPU: 13   COMMAND: "cc1"
     #0 [fffffe000030ce60] crash_nmi_callback at ffffffff84e657c6
     #1 [fffffe000030ce68] nmi_handle at ffffffff84e321e1
     #2 [fffffe000030ceb0] default_do_nmi at ffffffff85a1ee40
     #3 [fffffe000030ced0] exc_nmi at ffffffff85a1f066
     #4 [fffffe000030cef0] end_repeat_nmi at ffffffff85c01e3e
        [exception RIP: native_queued_spin_lock_slowpath+109]
        RIP: ffffffff85a3519d  RSP: ffffa8061cffbc60  RFLAGS: 00000002
        RAX: 0000000000000101  RBX: ffffffff874c25ec  RCX: ffff957d8004c808
        RDX: 0000000000000000  RSI: 0000000000000001  RDI: ffffffff874c25ec
        RBP: 0000000000000046   R8: 0000000000000000   R9: 0000000000000000
        R10: 0000000000000000  R11: 0000000000000000  R12: ffffa8061cffbd48
        R13: 0000000000000002  R14: 0000000000000000  R15: 0000000000000000
        ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0000
    --- <NMI exception stack> ---
     #5 [ffffa8061cffbc60] native_queued_spin_lock_slowpath at ffffffff85a3519d
     #6 [ffffa8061cffbc80] oops_begin at ffffffff84e31c9c
     #7 [ffffa8061cffbc98] page_fault_oops at ffffffff84e81ec1
     #8 [ffffa8061cffbd18] exc_page_fault at ffffffff85a21774
     #9 [ffffa8061cffbd40] asm_exc_page_fault at ffffffff85c01266
        [exception RIP: xhci_irq+5886]
        RIP: ffffffff856cd58e  RSP: ffffa8061cffbdf8  RFLAGS: 00010003
        RAX: 00000000edf2e780  RBX: ffffa80600209ca0  RCX: 000000000000000d
        RDX: 0000000036bd10c4  RSI: ffff957d87169ae0  RDI: ffff957d9ebae260
        RBP: 000000000000000d   R8: 0000000000000020   R9: 0000000000000011
        R10: 0000000000000000  R11: ffff957e7ccf5880  R12: ffff957e11552380
        R13: ffff957d9ebae000  R14: 0000000000000081  R15: ffffa80600209ca0
        ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0000
    #10 [ffffa8061cffbe98] __handle_irq_event_percpu at ffffffff84f1fdbd
    #11 [ffffa8061cffbec8] handle_irq_event at ffffffff84f1ff8b
    #12 [ffffa8061cffbee8] handle_edge_irq at ffffffff84f24afa
    #13 [ffffa8061cffbf08] __common_interrupt at ffffffff84e30556
    #14 [ffffa8061cffbf30] common_interrupt at ffffffff85a1e9b3
    #15 [ffffa8061cffbf50] asm_common_interrupt at ffffffff85c014e6
        RIP: 000000000082ce8d  RSP: 00007ffc76405600  RFLAGS: 00000296
        RAX: 000000000000006c  RBX: 00007fe2941b88c0  RCX: 00000000038ef8d7
        RDX: 00000000a0d7e714  RSI: 0000000000000011  RDI: 00000000038ef8d0
        RBP: 00007fe2941b88c0   R8: 00000000257c7983   R9: 000000007ff3facb
        R10: 00007fe29837c000  R11: 00000000257c7983  R12: 00000000ae574838
        R13: 00007fe297708c90  R14: 00007ffc76405800  R15: 00000000038ef8d0
        ORIG_RAX: ffffffffffffffff  CS: 0033  SS: 002b
    
    PID: 640      TASK: ffff957d9e924180  CPU: 31   COMMAND: "usb-storage"
     #0 [fffffe0000732e60] crash_nmi_callback at ffffffff84e657c6
     #1 [fffffe0000732e68] nmi_handle at ffffffff84e321e1
     #2 [fffffe0000732eb0] default_do_nmi at ffffffff85a1ee40
     #3 [fffffe0000732ed0] exc_nmi at ffffffff85a1f066
     #4 [fffffe0000732ef0] end_repeat_nmi at ffffffff85c01e3e
        [exception RIP: native_queued_spin_lock_slowpath+111]
        RIP: ffffffff85a3519f  RSP: ffffa8060142bc00  RFLAGS: 00000002
        RAX: 0000000000000101  RBX: ffff957d80efc2ac  RCX: 0000000000000001
        RDX: 0000000000000000  RSI: 0000000000000001  RDI: ffff957d80efc2ac
        RBP: 0000000000000001   R8: 0000000000000001   R9: ffff957dbff46980
        R10: 000000000000001f  R11: ffff957d86617a40  R12: ffff957d80efc2ac
        R13: ffff957d81dae840  R14: ffff957dbff46980  R15: ffff957d80efc010
        ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
    --- <NMI exception stack> ---
     #5 [ffffa8060142bc00] native_queued_spin_lock_slowpath at ffffffff85a3519f
     #6 [ffffa8060142bc20] _raw_spin_lock_irqsave at ffffffff85a34a8d
     #7 [ffffa8060142bc30] xhci_urb_enqueue at ffffffff856c2e89
     #8 [ffffa8060142bc90] usb_hcd_submit_urb at ffffffff8568e7e4
     #9 [ffffa8060142bd50] usb_stor_msg_common at ffffffffc13912ee [usb_storage]
    #10 [ffffa8060142bd90] usb_stor_bulk_transfer_buf at ffffffffc1391685 [usb_storage]
    #11 [ffffa8060142bdb8] usb_stor_Bulk_transport at ffffffffc1392089 [usb_storage]
    #12 [ffffa8060142be00] usb_stor_invoke_transport at ffffffffc1392563 [usb_storage]
    #13 [ffffa8060142beb8] usb_stor_control_thread at ffffffffc139332c [usb_storage]
    #14 [ffffa8060142bf18] kthread at ffffffff84ec73ce
    #15 [ffffa8060142bf50] ret_from_fork at ffffffff84e03572

CPU 13 had the exact same page fault at the same instruction, but with a
different RAX value. CPU 31 has a suspicious looking stack (given that
we faulted on a field td->urb), but I don't know anything in this
subsystem very well.

I have the core dump and kernel info and would be happy to fetch more
information if yo uwanted. I don't think it's (easily) reproducible.
I just wanted to share in case this catches anyone's eye. I admit
between some amdgpu crashes and this, my desktop hasn't been as stable
as I'd like, so I'll be reporting any other crashes if they happen.

Thanks,
Stephen
