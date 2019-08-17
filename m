Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2160F90FE2
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 12:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbfHQKAL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 17 Aug 2019 06:00:11 -0400
Received: from vsmx012.vodafonemail.xion.oxcs.net ([153.92.174.90]:26258 "EHLO
        vsmx012.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725840AbfHQKAL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Aug 2019 06:00:11 -0400
X-Greylist: delayed 337 seconds by postgrey-1.27 at vger.kernel.org; Sat, 17 Aug 2019 06:00:04 EDT
Received: from vsmx004.vodafonemail.xion.oxcs.net (unknown [192.168.75.198])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTP id D490DF36F08
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 09:54:25 +0000 (UTC)
Received: from lazy.lzy (unknown [79.214.218.120])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTPA id AD10019AD96
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 09:54:23 +0000 (UTC)
Received: from lazy.lzy (localhost [127.0.0.1])
        by lazy.lzy (8.15.2/8.14.5) with ESMTPS id x7H9sM6T004328
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
        for <linux-usb@vger.kernel.org>; Sat, 17 Aug 2019 11:54:22 +0200
Received: (from red@localhost)
        by lazy.lzy (8.15.2/8.15.2/Submit) id x7H9sMu4004327
        for linux-usb@vger.kernel.org; Sat, 17 Aug 2019 11:54:22 +0200
Date:   Sat, 17 Aug 2019 11:54:22 +0200
From:   Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
To:     linux-usb@vger.kernel.org
Subject: reeze while write on external usb 3.0 hard disk [Bug 204095]
Message-ID: <20190817095422.GA4200@lazy.lzy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
User-Agent: Mutt/1.12.1 (2019-06-15)
X-VADE-STATUS: LEGIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

bug 204095 from bugzilla.kernel.org was closed,
but apparently something is left unfixed.

Ref.: https://bugzilla.kernel.org/show_bug.cgi?id=204095

Below the two last entries I did about the topic:

--- --- ---

I've Fedora 30 and there was an update, from kernel 5.1.20
to 5.2.5, and now I've the logs full of:

ehci-pci 0000:00:13.2: swiotlb buffer is full (sz: 327680 bytes), total 32768 (slots), used 97 (slots)

Or similarly:

ehci-pci 0000:00:13.2: swiotlb buffer is full (sz: 315392 bytes), total 32768 (slots), used 103 (slots)

This happens whenever I access an external USB3.0 drive
connected to a USB2.0 port, I'm not sure if this makes
any difference.

It is enough something like "hdparm -t /dev/sdX" to trigger
the above (and cause a lock-up of the command and 100% CPU
load for "usb-storage").
Nevertheless, it seems that the first access, likely few bytes
read, is successful since the device is recognize by the file
manager.
Anything else, (large) file copy causes the issue.

Could it be the same bug? That is the fix for 5.2.5 does not
fix it completely?

--- --- ---

Some more comments.

I tested a different PC, this does not show any problem, neither
with the "old" 5.1.20 nor with the new 5.2.5 kernel.

Second, the original PC still have problems, here below the log
output at the moment of the "crash" due to "hdparm -t /dev/sdX":

[   47.212609] xhci_hcd 0000:02:00.0: swiotlb buffer is full (sz: 421888 bytes), total 32768 (slots), used 1 (slots)
[   47.212620] xhci_hcd 0000:02:00.0: overflow 0x0000000383a19000+421888 of DMA mask ffffffff bus mask 0
[   47.212646] WARNING: CPU: 0 PID: 454 at kernel/dma/direct.c:43 report_addr+0x33/0x60
[   47.212649] Modules linked in: fuse cfg80211 rfkill nf_log_ipv4 nf_log_common ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack xt_owner xt_LOG iptable_filter nf_conntrack_ftp xt_CT nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_raw hwmon_vid sunrpc dm_crypt dm_cache_smq nvidia_drm(POE) dm_cache nvidia_modeset(POE) dm_persistent_data dm_bio_prison libcrc32c nvidia_uvm(OE) amd64_edac_mod edac_mce_amd kvm_amd ccp kvm snd_hda_codec_hdmi irqbypass joydev crct10dif_pclmul nvidia(POE) crc32_pclmul ghash_clmulni_intel snd_hda_codec_via snd_hda_codec_generic ledtrig_audio snd_hda_intel drm_kms_helper wmi_bmof snd_hda_codec fam15h_power k10temp snd_hda_core sp5100_tco snd_hwdep i2c_piix4 snd_seq snd_seq_device drm snd_pcm snd_timer ipmi_devintf snd ipmi_msghandler asus_atk0110 soundcore pcc_cpufreq acpi_cpufreq vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) binfmt_misc ip_tables firewire_sbp2 raid1 raid10 crc32c_intel firewire_ohci firewire_core serio_raw crc_itu_t r8169 wmi uas
[   47.212719]  usb_storage hid_logitech ff_memless ecryptfs
[   47.212734] CPU: 0 PID: 454 Comm: usb-storage Tainted: P           OE     5.2.6-200.fc30.x86_64 #1
[   47.212738] Hardware name: System manufacturer System Product Name/M5A78L-M/USB3, BIOS 2101    12/02/2014
[   47.212744] RIP: 0010:report_addr+0x33/0x60
[   47.212750] Code: 48 8b 87 28 02 00 00 48 89 34 24 48 85 c0 74 2d 4c 8b 00 b8 fe ff ff ff 49 39 c0 76 14 80 3d a3 ae 41 01 00 0f 84 a9 06 00 00 <0f> 0b 48 83 c4 08 c3 48 83 bf 38 02 00 00 00 74 ef eb e0 80 3d 84
[   47.212754] RSP: 0018:ffffa85941bffbc8 EFLAGS: 00010246
[   47.212758] RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
[   47.212762] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffff9a45af617900
[   47.212765] RBP: ffff9a45accc00b0 R08: ffffa85941bff92d R09: 00000000000003a3
[   47.212769] R10: ffffffffb6bece08 R11: ffffa85941bff92d R12: 0000000000067000
[   47.212772] R13: 0000000000000002 R14: 0000000000000000 R15: ffff9a45a40502b0
[   47.212777] FS:  0000000000000000(0000) GS:ffff9a45af600000(0000) knlGS:0000000000000000
[   47.212780] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   47.212784] CR2: 000055b215f34c50 CR3: 00000003d622e000 CR4: 00000000000406f0
[   47.212787] Call Trace:
[   47.212797]  dma_direct_map_page+0xdf/0xf0
[   47.212803]  dma_direct_map_sg+0x67/0xb0
[   47.212811]  usb_hcd_map_urb_for_dma+0x343/0x530
[   47.212817]  usb_hcd_submit_urb+0x9a/0xbb0
[   47.212824]  ? schedule_timeout+0x209/0x300
[   47.212829]  ? usb_hcd_submit_urb+0xbf/0xbb0
[   47.212835]  ? __switch_to_asm+0x40/0x70
[   47.212840]  ? __switch_to_asm+0x34/0x70
[   47.212845]  ? _cond_resched+0x15/0x30
[   47.212852]  ? __kmalloc+0x16c/0x210
[   47.212857]  ? _cond_resched+0x15/0x30
[   47.212863]  ? usb_alloc_urb+0x35/0x60
[   47.212867]  usb_sg_wait+0x7e/0x150
[   47.212879]  usb_stor_bulk_transfer_sglist.part.0+0x64/0xb0 [usb_storage]
[   47.212886]  usb_stor_bulk_srb+0x49/0x80 [usb_storage]
[   47.212893]  usb_stor_Bulk_transport+0x163/0x3e0 [usb_storage]
[   47.212898]  ? schedule+0x33/0x90
[   47.212905]  usb_stor_invoke_transport+0x3a/0x500 [usb_storage]
[   47.212910]  ? wait_for_completion_interruptible+0x156/0x1a0
[   47.212915]  ? wake_up_q+0x60/0x60
[   47.212922]  usb_stor_control_thread+0x183/0x280 [usb_storage]
[   47.212928]  kthread+0xfb/0x130
[   47.212934]  ? usb_stor_disconnect+0xb0/0xb0 [usb_storage]
[   47.212938]  ? kthread_park+0x80/0x80
[   47.212943]  ret_from_fork+0x22/0x40
[   47.212948] ---[ end trace 848c6eec31ed7f76 ]---

--- --- ---

More information.

With kernel 5.2.8 (still from Fedora) the problem appears,
but not any more with "hdparm -t /dev/sdX".
It is required or to copy large files, or something like
"dd if=/dev/sdX of=/dev/null bs=1M".

Sometime, with small blocks (bs=4k, for example), it seems
better, but I'll have to test more.

Finally, no difference between USB3.0 or USB2.0 in any
combination of devices.

On other PCs, all with Intel HW, I could not experience
the issue, yet.

If you need more information, please let me know, I'll
try to support as much a I can.

Thanks,

bye,

-- 

piergiorgio
