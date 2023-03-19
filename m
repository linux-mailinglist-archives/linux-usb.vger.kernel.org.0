Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD116C02F6
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 17:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjCSQEr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 12:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjCSQEp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 12:04:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27821DB90
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 09:04:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 328BBB80882
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 16:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E00C9C433D2
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679241880;
        bh=LncGpPnbsiRA1cUvM+CjriGR81m5eolXmrbHbVLSaOE=;
        h=From:To:Subject:Date:From;
        b=Kkoa/UUvmXwd6hY34iVEPtchh1Xe3dzwkV4H8UO9dbsnlmlMN7VUYjtsOndUeVWej
         SiHXriUbxcUPL7eJJLacvKM+yUpyg6wlwBTBrlqLXXqYcXeCGzkd/mfDhVf6ZhnDm7
         y+9T3hwuOnWbYacZkLhw3OuVtWzcIes2YhRA0XNR/QLK9iWJpMyY6hE0LID11bk51Z
         caCOnDnY3MgP4l/xJ5FQSFpydG4VXi15qwjbDCMEDzxSYNxqB+YT1ofvYEQ1RXFZak
         CFZBpK7jAsV5H9lTl3FUiAbUEYAXC6XjCGp8+NRmkF52uAK8+PaG0RNwG7aRW470Jo
         Q3wLIsU0zWxBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C27D3C43141; Sun, 19 Mar 2023 16:04:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217215] New: Oops removing usb drive
Date:   Sun, 19 Mar 2023 16:04:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edtoml@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217215-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217215

            Bug ID: 217215
           Summary: Oops removing usb drive
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.2.7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: edtoml@gmail.com
        Regression: No

Uinsg 6.2.7.arch1-1 on an up to date Arch install (with just the kernel from
testing) I get and oops doing:

Insert a usb CF drive
(nothing mounted)
Remove the CR drive

Mar 19 11:51:07 grover kernel: usb 3-1.3: new high-speed USB device number =
10
using xhci_hcd
Mar 19 11:51:07 grover kernel: usb 3-1.3: New USB device found, idVendor=3D=
090c,
idProduct=3D1000, bcdDevice=3D11.00
Mar 19 11:51:07 grover kernel: usb 3-1.3: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D3
Mar 19 11:51:07 grover kernel: usb 3-1.3: Product: USB Flash Disk
Mar 19 11:51:07 grover kernel: usb 3-1.3: Manufacturer: General
Mar 19 11:51:07 grover kernel: usb 3-1.3: SerialNumber: 0332120100061752
Mar 19 11:51:07 grover kernel: usb-storage 3-1.3:1.0: USB Mass Storage devi=
ce
detected
Mar 19 11:51:07 grover kernel: scsi host8: usb-storage 3-1.3:1.0
Mar 19 11:51:07 grover mtp-probe[54416]: checking bus 3, device 10:
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-1/3-1.3"
Mar 19 11:51:07 grover mtp-probe[54416]: bus: 3, device: 10 was not an MTP
device
Mar 19 11:51:07 grover mtp-probe[54421]: checking bus 3, device 10:
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-1/3-1.3"
Mar 19 11:51:07 grover mtp-probe[54421]: bus: 3, device: 10 was not an MTP
device
Mar 19 11:51:08 grover kernel: scsi 8:0:0:0: Direct-Access     General  USB
Flash Disk   1100 PQ: 0 ANSI: 4
Mar 19 11:51:08 grover kernel: sd 8:0:0:0: Attached scsi generic sg9 type 0
Mar 19 11:51:08 grover kernel: sd 8:0:0:0: [sdj] 15722496 512-byte logical
blocks: (8.05 GB/7.50 GiB)
Mar 19 11:51:08 grover kernel: sd 8:0:0:0: [sdj] Write Protect is off
Mar 19 11:51:08 grover kernel: sd 8:0:0:0: [sdj] Mode Sense: 43 00 00 00
Mar 19 11:51:08 grover kernel: sd 8:0:0:0: [sdj] No Caching mode page found
Mar 19 11:51:08 grover kernel: sd 8:0:0:0: [sdj] Assuming drive cache: write
through
Mar 19 11:51:08 grover kernel:  sdj: sdj1 sdj2
Mar 19 11:51:08 grover kernel: sd 8:0:0:0: [sdj] Attached SCSI removable di=
sk
Mar 19 11:51:08 grover dbus-daemon[544]: [system] Activating service
name=3D'org.kde.kded.smart' requested by ':1.96' (uid=3D1000 pid=3D32581
comm=3D"/usr/bin/kded5") (using servicehelper)
Mar 19 11:51:08 grover dbus-daemon[544]: [system] Successfully activated
service 'org.kde.kded.smart'
Mar 19 11:51:52 grover kernel: usb 3-1.3: USB disconnect, device number 10
Mar 19 11:51:53 grover kernel: ------------[ cut here ]------------
Mar 19 11:51:53 grover kernel: remove_proc_entry: removing non-empty direct=
ory
'scsi/usb-storage', leaking at least '6'
Mar 19 11:51:53 grover kernel: WARNING: CPU: 5 PID: 44705 at
fs/proc/generic.c:718 remove_proc_entry+0x199/0x1b0
Mar 19 11:51:53 grover kernel: Modules linked in: rfcomm snd_seq_dummy
snd_hrtimer snd_seq tls iptable_nat xt_MASQUERADE nf_nat wireguard
curve25519_x86_64 libchacha20poly1305 chacha_x86_64 poly1305_x86_64
libcurve25519_generic libchacha ip6_udp_tunnel udp_tunnel snd_usb_audio
snd_usbmidi_lib snd_rawmidi uvcvideo snd_seq_device hid_logitech_hidpp mous=
edev
cmac algif_hash algif_skcipher af_alg bnep nct6775 nct6775_core hwmon_vid
hid_logitech_dj joydev btusb btrtl btbcm btintel btmtk usbhid uas usb_stora=
ge
nls_iso8859_1 vfat fat intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel kvm snd_hda_codec_realtek
snd_hda_codec_generic irqbypass ip6t_REJECT ledtrig_audio nf_reject_ipv6
snd_hda_codec_hdmi crct10dif_pclmul crc32_pclmul snd_hda_intel polyval_clmu=
lni
polyval_generic snd_intel_dspcfg gf128mul snd_intel_sdw_acpi xt_hl
snd_hda_codec ghash_clmulni_intel sha512_ssse3 ip6t_rt snd_hda_core aesni_i=
ntel
snd_hwdep snd_pcm crypto_simd mei_hdcp cryptd mei_pxp at24 snd_timer
Mar 19 11:51:53 grover kernel:  ipt_REJECT rapl mei_me intel_cstate i2c_i801
nf_reject_ipv4 snd xt_recent cfg80211 intel_uncore e1000e mei pcspkr soundc=
ore
i2c_smbus xt_limit mac_hid xt_addrtype xt_tcpudp xt_conntrack nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 ip6table_filter ip6_tables iptable_filter xt_=
LOG
nf_log_syslog ath3k bluetooth ecdh_generic rfkill gspca_pac7311 gspca_ov519
gspca_main videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videodev
videobuf2_common mc acpi_power_meter acpi_pad acpi_ipmi ipmi_devintf
ipmi_msghandler dm_multipath sg crypto_user fuse dm_mod loop bpf_preload
ip_tables x_tables ext4 crc16 mbcache jbd2 serio_raw atkbd libps2 vivaldi_f=
map
xhci_pci i8042 xhci_pci_renesas serio gpio_exar 8250_exar amdgpu drm_ttm_he=
lper
ttm video wmi drm_buddy gpu_sched drm_display_helper cec btrfs blake2b_gene=
ric
xor raid6_pq libcrc32c crc32c_generic crc32c_intel
Mar 19 11:51:53 grover kernel: CPU: 5 PID: 44705 Comm: kworker/5:2 Not tain=
ted
6.2.7-arch1-1 #1 d0ef1d2ba4aa7f22be04df39dde66a4c3cc73dc4
Mar 19 11:51:53 grover kernel: Hardware name: To Be Filled By O.E.M. To Be
Filled By O.E.M./Z87E-ITX, BIOS P2.50 07/11/2014
Mar 19 11:51:53 grover kernel: Workqueue: usb_hub_wq hub_event
Mar 19 11:51:53 grover kernel: RIP: 0010:remove_proc_entry+0x199/0x1b0
Mar 19 11:51:53 grover kernel: Code: c7 38 48 44 9a 48 85 c0 48 8d 90 78 ff=
 ff
ff 48 0f 45 c2 48 8b 53 78 4c 8b 80 a0 00 00 00 48 8b 92 a0 00 00 00 e8 d7 =
25
c2 ff <0f> 0b e9 41 ff ff ff e8 bb cb 8a 00 66 66 2e 0f 1f 84 00 00 00 00
Mar 19 11:51:53 grover kernel: RSP: 0018:ffffa3eb63387b50 EFLAGS: 00010286
Mar 19 11:51:53 grover kernel: RAX: 0000000000000000 RBX: ffff8bc2d47f2840 =
RCX:
0000000000000027
Mar 19 11:51:53 grover kernel: RDX: ffff8bc5ced61648 RSI: 0000000000000001 =
RDI:
ffff8bc5ced61640
Mar 19 11:51:53 grover kernel: RBP: ffff8bc2d47f28c0 R08: 0000000000000000 =
R09:
ffffa3eb633879e0
Mar 19 11:51:53 grover kernel: R10: 0000000000000003 R11: ffffffff9acc9a68 =
R12:
ffff8bc2c0eb2480
Mar 19 11:51:53 grover kernel: R13: ffff8bc2e3a948a0 R14: 0000000000000000 =
R15:
ffff8bc409e03c30
Mar 19 11:51:53 grover kernel: FS:  0000000000000000(0000)
GS:ffff8bc5ced40000(0000) knlGS:0000000000000000
Mar 19 11:51:53 grover kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Mar 19 11:51:53 grover kernel: CR2: 0000561b3bf07a18 CR3: 000000006a610001 =
CR4:
00000000001706e0
Mar 19 11:51:53 grover kernel: Call Trace:
Mar 19 11:51:53 grover kernel:  <TASK>
Mar 19 11:51:53 grover kernel:  scsi_proc_hostdir_rm+0x79/0xc0
Mar 19 11:51:53 grover kernel:  scsi_host_dev_release+0x3a/0xe0
Mar 19 11:51:53 grover kernel:  device_release+0x37/0x90
Mar 19 11:51:53 grover kernel:  kobject_put+0x8e/0x1d0
Mar 19 11:51:53 grover kernel:  usb_unbind_interface+0x93/0x270
Mar 19 11:51:53 grover kernel:  device_release_driver_internal+0x1b6/0x230
Mar 19 11:51:53 grover kernel:  bus_remove_device+0xdc/0x150
Mar 19 11:51:53 grover kernel:  device_del+0x18f/0x410
Mar 19 11:51:53 grover kernel:  ? kobject_put+0xa0/0x1d0
Mar 19 11:51:53 grover kernel:  usb_disable_device+0xbb/0x1e0
Mar 19 11:51:53 grover kernel:  usb_disconnect+0xe3/0x2d0
Mar 19 11:51:53 grover kernel:  hub_event+0xa39/0x1c60
Mar 19 11:51:53 grover kernel:  ? __schedule+0x3d0/0x12e0
Mar 19 11:51:53 grover kernel:  process_one_work+0x1c8/0x3c0
Mar 19 11:51:53 grover kernel:  worker_thread+0x51/0x390
Mar 19 11:51:53 grover kernel:  ? __pfx_worker_thread+0x10/0x10
Mar 19 11:51:53 grover kernel:  kthread+0xde/0x110
Mar 19 11:51:53 grover kernel:  ? __pfx_kthread+0x10/0x10
Mar 19 11:51:53 grover kernel:  ret_from_fork+0x2c/0x50
Mar 19 11:51:53 grover kernel:  </TASK>
Mar 19 11:51:53 grover kernel: ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
