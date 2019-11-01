Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4747EEBF28
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 09:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbfKAIXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Nov 2019 04:23:15 -0400
Received: from outgoing.selfhost.de ([82.98.87.70]:60211 "EHLO
        outgoing.selfhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729942AbfKAIXO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 04:23:14 -0400
Received: (qmail 19994 invoked from network); 1 Nov 2019 08:23:09 -0000
Received: from unknown (HELO mailhost.afaics.de) (postmaster@xqrsonfo.mail.selfhost.de@62.158.107.220)
  by mailout.selfhost.de with ESMTPA; 1 Nov 2019 08:23:09 -0000
Received: from cecil.afaics.de (cecil.afaics.de [10.42.100.186])
        by mailhost.afaics.de (OpenSMTPD) with ESMTP id fe5499e9;
        Fri, 1 Nov 2019 08:23:08 +0000 (UTC)
To:     USB list <linux-usb@vger.kernel.org>
From:   Harald Dunkel <harri@afaics.de>
Subject: 4.19.67 (Debian): unable to handle kernel NULL pointer dereference at
 0000000000000000
Message-ID: <786ecbec-b827-6dff-c423-16bdf9bd6ccd@afaics.de>
Date:   Fri, 1 Nov 2019 09:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

Yesterday I got a kernel dump on switching off my USB disk docking
station (2 slots, 2 different disks were inserted, none active). When
I tried to login this morning the PC became unresponsive. I had to
power-cycle.

Its a Debian kernel (4.19.67-2+deb10u1), but I wonder does this ring
a bell? See https://bugs.debian.org/943939 for the whole kern.log file.


Oct 31 16:26:44 dpcl082 kernel: [22985.418721] usb 6-2: USB disconnect, device number 2
Oct 31 16:26:44 dpcl082 kernel: [22985.420074] BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
Oct 31 16:26:44 dpcl082 kernel: [22985.420084] PGD 0 P4D 0
Oct 31 16:26:44 dpcl082 kernel: [22985.420096] Oops: 0000 [#1] SMP PTI
Oct 31 16:26:44 dpcl082 kernel: [22985.420106] CPU: 6 PID: 115566 Comm: kworker/6:3 Tainted: P           OE     4.19.0-6-amd64 #1 Debian 4.19.67-2+deb10u1
Oct 31 16:26:44 dpcl082 kernel: [22985.420110] Hardware name:  /DH87MC, BIOS MCH8710H.86A.0164.2018.1023.1532 10/23/2018
Oct 31 16:26:44 dpcl082 kernel: [22985.420140] Workqueue: usb_hub_wq hub_event [usbcore]
Oct 31 16:26:44 dpcl082 kernel: [22985.420150] RIP: 0010:strcmp+0x10/0x20
Oct 31 16:26:44 dpcl082 kernel: [22985.420155] Code: 00 48 c7 c0 f9 ff ff ff eb 92 45 31 c0 eb c1 48 c7 c0 f9 ff ff ff c3 0f 1f 00 31 c0 eb 08 48 83 c0 01 84 d2 74 0f 0f b6 14 07 <3a> 14 06 74 ef 19 c0 83 c8 01 c3 3
Oct 31 16:26:44 dpcl082 kernel: [22985.420159] RSP: 0018:ffffc2ee8a5779b0 EFLAGS: 00010246
Oct 31 16:26:44 dpcl082 kernel: [22985.420164] RAX: 0000000000000000 RBX: ffff9ef26fdd1018 RCX: ffffffff8469668f
Oct 31 16:26:44 dpcl082 kernel: [22985.420167] RDX: 0000000000000069 RSI: 0000000000000000 RDI: ffffffff84696687
Oct 31 16:26:44 dpcl082 kernel: [22985.420171] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff83aef500
Oct 31 16:26:44 dpcl082 kernel: [22985.420174] R10: ffff9ef26fdd17f8 R11: 0000000000000001 R12: 0000000074a4fb33
Oct 31 16:26:44 dpcl082 kernel: [22985.420177] R13: ffffffff84696687 R14: ffff9ef26fe3d880 R15: ffff9ef27afe6430
Oct 31 16:26:44 dpcl082 kernel: [22985.420182] FS:  0000000000000000(0000) GS:ffff9ef27eb80000(0000) knlGS:0000000000000000
Oct 31 16:26:44 dpcl082 kernel: [22985.420186] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Oct 31 16:26:44 dpcl082 kernel: [22985.420189] CR2: 0000000000000000 CR3: 000000015ae0a004 CR4: 00000000001606e0
Oct 31 16:26:44 dpcl082 kernel: [22985.420192] Call Trace:
Oct 31 16:26:44 dpcl082 kernel: [22985.420204]  kernfs_find_ns+0x59/0xc0
Oct 31 16:26:44 dpcl082 kernel: [22985.420213]  kernfs_remove_by_name_ns+0x31/0x90
Oct 31 16:26:44 dpcl082 kernel: [22985.420219]  remove_files.isra.1+0x30/0x70
Oct 31 16:26:44 dpcl082 kernel: [22985.420226]  sysfs_remove_group+0x3d/0x80
Oct 31 16:26:44 dpcl082 kernel: [22985.420233]  sysfs_remove_groups+0x29/0x40
Oct 31 16:26:44 dpcl082 kernel: [22985.420244]  device_remove_attrs+0x53/0x80
Oct 31 16:26:44 dpcl082 kernel: [22985.420250]  device_del+0x15c/0x380
Oct 31 16:26:44 dpcl082 kernel: [22985.420257]  del_gendisk+0x23a/0x2e0
Oct 31 16:26:44 dpcl082 kernel: [22985.420268]  sd_remove+0x5d/0xd0 [sd_mod]
Oct 31 16:26:44 dpcl082 kernel: [22985.420277]  device_release_driver_internal+0x183/0x250
Oct 31 16:26:44 dpcl082 kernel: [22985.420283]  bus_remove_device+0xe5/0x150
Oct 31 16:26:44 dpcl082 kernel: [22985.420288]  device_del+0x164/0x380
Oct 31 16:26:44 dpcl082 kernel: [22985.420296]  ? mutex_lock+0xe/0x30
Oct 31 16:26:44 dpcl082 kernel: [22985.420321]  ? ata_tlink_match+0x30/0x30 [libata]
Oct 31 16:26:44 dpcl082 kernel: [22985.420343]  __scsi_remove_device+0x115/0x150 [scsi_mod]
Oct 31 16:26:44 dpcl082 kernel: [22985.420361]  scsi_forget_host+0x57/0x60 [scsi_mod]
Oct 31 16:26:44 dpcl082 kernel: [22985.420376]  scsi_remove_host+0x72/0x100 [scsi_mod]
Oct 31 16:26:44 dpcl082 kernel: [22985.420385]  uas_disconnect+0x80/0xa0 [uas]
Oct 31 16:26:44 dpcl082 kernel: [22985.420406]  usb_unbind_interface+0x78/0x260 [usbcore]
Oct 31 16:26:44 dpcl082 kernel: [22985.420416]  device_release_driver_internal+0x183/0x250
Oct 31 16:26:44 dpcl082 kernel: [22985.420422]  bus_remove_device+0xe5/0x150
Oct 31 16:26:44 dpcl082 kernel: [22985.420426]  device_del+0x164/0x380
Oct 31 16:26:44 dpcl082 kernel: [22985.420448]  usb_disable_device+0x93/0x240 [usbcore]
Oct 31 16:26:44 dpcl082 kernel: [22985.420466]  usb_disconnect+0xbc/0x250 [usbcore]
Oct 31 16:26:44 dpcl082 kernel: [22985.420486]  hub_event+0xc91/0x15b0 [usbcore]
Oct 31 16:26:44 dpcl082 kernel: [22985.420497]  process_one_work+0x1a7/0x3a0
Oct 31 16:26:44 dpcl082 kernel: [22985.420504]  worker_thread+0x30/0x390
Oct 31 16:26:44 dpcl082 kernel: [22985.420511]  ? create_worker+0x1a0/0x1a0
Oct 31 16:26:44 dpcl082 kernel: [22985.420516]  kthread+0x112/0x130
Oct 31 16:26:44 dpcl082 kernel: [22985.420522]  ? kthread_bind+0x30/0x30
Oct 31 16:26:44 dpcl082 kernel: [22985.420529]  ret_from_fork+0x35/0x40
Oct 31 16:26:44 dpcl082 kernel: [22985.420535] Modules linked in: tcp_diag udp_diag inet_diag xt_conntrack devlink pci_stub vboxpci(OE) vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) cpufreq_powersave cpufreq_userspace c
Oct 31 16:26:44 dpcl082 kernel: [22985.420621]  pcc_cpufreq intel_rapl_perf video button squashfs loop nvidia_drm(POE) drm_kms_helper drm dm_mod nvidia_modeset(POE) nvidia(POE) ipmi_devintf ipmi_msghandler xt_recent
Oct 31 16:26:44 dpcl082 kernel: [22985.420722]  libahci sata_sil24 ehci_pci xhci_hcd libata ehci_hcd crc32c_intel aesni_intel scsi_mod usbcore aes_x86_64 e1000e crypto_simd lpc_ich cryptd glue_helper i2c_i801 usb_co
Oct 31 16:26:44 dpcl082 kernel: [22985.420749] CR2: 0000000000000000
Oct 31 16:26:44 dpcl082 kernel: [22985.420755] ---[ end trace d5223c8be8056120 ]---
Oct 31 16:26:44 dpcl082 kernel: [22985.420761] RIP: 0010:strcmp+0x10/0x20
Oct 31 16:26:44 dpcl082 kernel: [22985.420765] Code: 00 48 c7 c0 f9 ff ff ff eb 92 45 31 c0 eb c1 48 c7 c0 f9 ff ff ff c3 0f 1f 00 31 c0 eb 08 48 83 c0 01 84 d2 74 0f 0f b6 14 07 <3a> 14 06 74 ef 19 c0 83 c8 01 c3 3
Oct 31 16:26:44 dpcl082 kernel: [22985.420768] RSP: 0018:ffffc2ee8a5779b0 EFLAGS: 00010246
Oct 31 16:26:44 dpcl082 kernel: [22985.420772] RAX: 0000000000000000 RBX: ffff9ef26fdd1018 RCX: ffffffff8469668f
Oct 31 16:26:44 dpcl082 kernel: [22985.420776] RDX: 0000000000000069 RSI: 0000000000000000 RDI: ffffffff84696687
Oct 31 16:26:44 dpcl082 kernel: [22985.420779] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff83aef500
Oct 31 16:26:44 dpcl082 kernel: [22985.420782] R10: ffff9ef26fdd17f8 R11: 0000000000000001 R12: 0000000074a4fb33
Oct 31 16:26:44 dpcl082 kernel: [22985.420785] R13: ffffffff84696687 R14: ffff9ef26fe3d880 R15: ffff9ef27afe6430
Oct 31 16:26:44 dpcl082 kernel: [22985.420789] FS:  0000000000000000(0000) GS:ffff9ef27eb80000(0000) knlGS:0000000000000000
Oct 31 16:26:44 dpcl082 kernel: [22985.420792] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Oct 31 16:26:44 dpcl082 kernel: [22985.420795] CR2: 0000000000000000 CR3: 000000015ae0a004 CR4: 00000000001606e0
Oct 31 16:26:47 dpcl082 kernel: [22988.491496] usb 2-5: USB disconnect, device number 6
Oct 31 16:34:38 dpcl082 kernel: [23459.024960] sd 7:0:0:1: [sdf] tag#12 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Oct 31 16:34:38 dpcl082 kernel: [23459.024973] sd 7:0:0:1: [sdf] tag#12 CDB: ATA command pass through(16) 85 06 20 00 00 00 00 00 00 00 00 00 00 00 e5 00
Oct 31 16:34:38 dpcl082 kernel: [23459.627631] sd 7:0:0:1: [sdf] tag#26 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Oct 31 16:34:38 dpcl082 kernel: [23459.627640] sd 7:0:0:1: [sdf] tag#26 CDB: ATA command pass through(16) 85 06 2c 00 00 00 00 00 00 00 00 00 00 00 e5 00
Oct 31 17:04:39 dpcl082 kernel: [25260.222715] sd 7:0:0:1: [sdf] tag#25 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
Oct 31 17:04:39 dpcl082 kernel: [25260.222720] sd 7:0:0:1: [sdf] tag#25 CDB: ATA command pass through(16) 85 06 2c 00 00 00 00 00 00 00 00 00 00 00 e5 00


Regards
Harri
