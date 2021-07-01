Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2B93B9389
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 16:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbhGAOpi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 10:45:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34737 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbhGAOpi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 10:45:38 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lyxuE-0001vL-5Z; Thu, 01 Jul 2021 14:43:06 +0000
From:   Colin King <colin.king@canonical.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: u_serial: remove WARN_ON on null port
Date:   Thu,  1 Jul 2021 15:43:05 +0100
Message-Id: <20210701144305.110078-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Loading and then unloading module g_dpgp on a VM that does not
support the driver currently throws a WARN_ON message because
the port has not been initialized. Removing an unused driver
is a valid use-case and the WARN_ON kernel warning is a bit
excessive, so remove it.

Cleans up:

[27654.638698] ------------[ cut here ]------------
[27654.638705] WARNING: CPU: 6 PID: 2956336 at drivers/usb/gadget/function/u_serial.c:1201 gserial_free_line+0x7c/0x90 [u_serial]
[27654.638728] Modules linked in: g_dbgp(-) u_serial usb_f_tcm target_core_mod libcomposite udc_core vmw_vmci mcb i2c_nforce2 i2c_amd756 nfit cx8800 videobuf2_dma_sg videobuf2_memops videobuf2_v4l2 cx88xx tveeprom videobuf2_common videodev mc ccp hid_generic hid intel_ishtp cros_ec mc13xxx_core vfio_mdev mdev i915 i2c_algo_bit kvm ppdev parport zatm eni suni uPD98402 atm rio_scan binder_linux hwmon_vid video ipmi_devintf ipmi_msghandler zstd nls_utf8 decnet qrtr ns sctp ip6_udp_tunnel udp_tunnel fcrypt pcbc nhc_udp nhc_ipv6 nhc_routing nhc_mobility nhc_hop nhc_dest nhc_fragment 6lowpan ts_kmp dccp_ipv6 dccp_ipv4 dccp snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq_dummy snd_seq snd_seq_device xen_front_pgdir_shbuf binfmt_misc nls_iso8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua intel_rapl_msr intel_rapl_common snd_hda_codec_generic ledtrig_audio snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd rapl soundcore joydev input_leds mac_hid serio_raw efi_pstore
[27654.638880]  qemu_fw_cfg sch_fq_codel msr virtio_rng autofs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath linear qxl drm_ttm_helper crct10dif_pclmul ttm drm_kms_helper syscopyarea sysfillrect sysimgblt virtio_net fb_sys_fops cec net_failover rc_core ahci psmouse drm libahci lpc_ich virtio_blk failover [last unloaded: u_ether]
[27654.638949] CPU: 6 PID: 2956336 Comm: modprobe Tainted: P           O      5.13.0-9-generic #9
[27654.638956] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
[27654.638969] RIP: 0010:gserial_free_line+0x7c/0x90 [u_serial]
[27654.638981] Code: 20 00 00 00 00 e8 74 1a ba c9 4c 89 e7 e8 8c fe ff ff 48 8b 3d 75 3b 00 00 44 89 f6 e8 3d 7c 69 c9 5b 41 5c 41 5d 41 5e 5d c3 <0f> 0b 4c 89 ef e8 4a 1a ba c9 5b 41 5c 41 5d 41 5e 5d c3 90 0f 1f
[27654.638986] RSP: 0018:ffffba0b81403da0 EFLAGS: 00010246
[27654.638992] RAX: 0000000000000000 RBX: ffffffffc0eaf6a0 RCX: 0000000000000000
[27654.638996] RDX: ffff8e21c0cac8c0 RSI: 0000000000000006 RDI: ffffffffc0eaf6a0
[27654.639000] RBP: ffffba0b81403dc0 R08: ffffba0b81403de0 R09: fefefefefefefeff
[27654.639003] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[27654.639006] R13: ffffffffc0eaf6a0 R14: 0000000000000000 R15: 0000000000000000
[27654.639010] FS:  00007faa1935e740(0000) GS:ffff8e223bd80000(0000) knlGS:0000000000000000
[27654.639015] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[27654.639019] CR2: 00007ffc840cd4e8 CR3: 000000000e1ac006 CR4: 0000000000370ee0
[27654.639028] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[27654.639031] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[27654.639035] Call Trace:
[27654.639044]  dbgp_exit+0x1c/0xa1a [g_dbgp]
[27654.639054]  __do_sys_delete_module.constprop.0+0x144/0x260
[27654.639066]  ? call_rcu+0xe/0x10
[27654.639073]  __x64_sys_delete_module+0x12/0x20
[27654.639081]  do_syscall_64+0x61/0xb0
[27654.639092]  ? exit_to_user_mode_loop+0xec/0x160
[27654.639098]  ? exit_to_user_mode_prepare+0x37/0xb0
[27654.639104]  ? syscall_exit_to_user_mode+0x27/0x50
[27654.639110]  ? __x64_sys_close+0x12/0x40
[27654.639119]  ? do_syscall_64+0x6e/0xb0
[27654.639126]  ? exit_to_user_mode_prepare+0x37/0xb0
[27654.639132]  ? syscall_exit_to_user_mode+0x27/0x50
[27654.639137]  ? __x64_sys_newfstatat+0x1e/0x20
[27654.639146]  ? do_syscall_64+0x6e/0xb0
[27654.639154]  ? exc_page_fault+0x8f/0x170
[27654.639159]  ? asm_exc_page_fault+0x8/0x30
[27654.639166]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[27654.639173] RIP: 0033:0x7faa194a4b2b
[27654.639179] Code: 73 01 c3 48 8b 0d 3d 73 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 0d 73 0c 00 f7 d8 64 89 01 48
[27654.639185] RSP: 002b:00007ffc840d0578 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
[27654.639191] RAX: ffffffffffffffda RBX: 000056060f9f4e70 RCX: 00007faa194a4b2b
[27654.639194] RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000056060f9f4ed8
[27654.639197] RBP: 000056060f9f4e70 R08: 0000000000000000 R09: 0000000000000000
[27654.639200] R10: 00007faa1951eac0 R11: 0000000000000206 R12: 000056060f9f4ed8
[27654.639203] R13: 0000000000000000 R14: 000056060f9f4ed8 R15: 00007ffc840d06c8
[27654.639219] ---[ end trace 8dd0ea0bb32ce94a ]---

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/function/u_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 1e59204..83fb82c 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1198,7 +1198,7 @@ void gserial_free_line(unsigned char port_num)
 	struct gs_port	*port;
 
 	mutex_lock(&ports[port_num].lock);
-	if (WARN_ON(!ports[port_num].port)) {
+	if (!ports[port_num].port) {
 		mutex_unlock(&ports[port_num].lock);
 		return;
 	}
-- 
2.7.4

