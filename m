Return-Path: <linux-usb+bounces-2379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FC7DC5CC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 06:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A60B2814FA
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 05:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95472D271;
	Tue, 31 Oct 2023 05:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D0ECA68
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:17:44 +0000 (UTC)
X-Greylist: delayed 3451 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Oct 2023 22:17:42 PDT
Received: from msr17.hinet.net (msr17.hinet.net [IPv6:2001:b000:1c9:10:168:95:4:117])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AF8D8
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 22:17:41 -0700 (PDT)
Received: from initramfs.io (2001-b011-4002-3b71-0000-0000-0000-000a.dynamic-ip6.hinet.net [IPv6:2001:b011:4002:3b71:0:0:0:a])
	by msr17.hinet.net (8.15.2/8.15.2) with ESMTPS id 39V4K8Jr021716
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 12:20:08 +0800
Received: from howl.home.internal.initramfs.io ([10.0.96.176])
	by initramfs.io with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <initramfs@initramfs.io>)
	id 1qxgEa-0001Er-JB
	for linux-usb@vger.kernel.org; Tue, 31 Oct 2023 04:20:08 +0000
Message-ID: <2fd4b2b0-0526-4946-ad05-058366f3127a@initramfs.io>
Date: Tue, 31 Oct 2023 12:20:08 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: initramfs <initramfs@initramfs.io>
Subject: ASMedia 2464PD-based SSD enclosure hotplug failure
Autocrypt: addr=initramfs@initramfs.io; keydata=
 xjMEXU2jtxYJKwYBBAHaRw8BAQdA32TNgwBRB8zKTUDw+OD3EMHH6l7/9BctyPJZg7flyZrN
 JEFtaXQgQWduYW5pIDxpbml0cmFtZnNAaW5pdHJhbWZzLmlvPsKxBBMWCgBZAhsDBAsJCAcF
 FQoJCAsFFgIDAQACHgECF4ACGQEFCQomf3UWIQTmBUi9vIJeEJq2Q9jQE1WLzz4A7QUCXX/Y
 XBgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQ0BNVi88+AO2eqgEAhxrvCxHqcWYCjEl3
 RtK1uMI5Vl78ADXimnIO3Zx2ZygBAK7SL/m0A87AZOj1x/xMjFqYOfSMfe6a8Up//XB0av8M
 zjgEXU2k1BIKKwYBBAGXVQEFAQEHQEnBKEjJUS59EzqqgBWZE3/2Q0BIXmGqreBXzeDMizs+
 AwEIB8J+BBgWCgAmAhsMFiEE5gVIvbyCXhCatkPY0BNVi88+AO0FAl/QqPQFCQomJKAACgkQ
 0BNVi88+AO2kRQEAiznrjgTNzeNfudqZz8MzyQqPEj3F0XeiloYOCbsrm8sA/jwF56ff7aRi
 HfhNFwJQJWzduZL3kmlkCrPxf9EGcvIP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=YqrK+6UX c=1 sm=1 tr=0 ts=65408079
	a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=Br9LfDWDAAAA:8
	a=LRk9riVR5MzU9P2ol8IA:9 a=duj9LQwQeY0GMJFp:21 a=QEXdDO2ut3YA:10
	a=TRW-o2S9CEoA:10 a=Bg5cootq7XEA:10 a=gR_RJRYUad_6_ruzA8cR:22

Hi all,

I own a ZikeDrive USB4 NVMe SSD enclosure and noticed that upon
hotplugging the enclosure I receive the following kernel oops (6.6.0):

    [  138.597027] thunderbolt 0-0:1.1: new retimer found, vendor=0x8087
    device=0x15ee
    [  138.626031] thunderbolt 0-1: new device found, vendor=0x187
    device=0xd666
    [  138.626046] thunderbolt 0-1: Gopod Group Limited. USB4 SSD Drive
    Enclosure
    [  138.736546] thunderbolt 0000:00:0d.2: 1:1: failed to enable lane
    bonding
    [  138.736888] thunderbolt 0000:00:0d.2: 1: failed to enable CL states
    [  138.737874] thunderbolt 0000:00:0d.2: 1: failed to enable TMU
    [  138.739417] thunderbolt 0000:00:0d.2: 1:1: hop deactivation
    failed for hop 1, index 8
    [  138.739421] ------------[ cut here ]------------
    [  138.739422] thunderbolt 0000:00:0d.2: path activation failed
    [  138.739462] WARNING: CPU: 6 PID: 3845 at
    drivers/thunderbolt/path.c:573 tb_path_activate+0x10f/0x480
    [thunderbolt]
    [  138.739495] Modules linked in: ccm rfcomm snd_seq_dummy
    snd_hrtimer snd_seq snd_seq_device cmac algif_hash algif_skcipher
    af_alg nft_ct nf_conntrack nf_defrag_ipv4 nf_defrag_ipv6 bnep
    nf_tables nfnetlink ntfs3 snd_sof_pci_intel_tgl
    snd_sof_intel_hda_common soundwire_intel snd_sof_intel_hda_mlink
    soundwire_cadence snd_sof_intel_hda snd_sof_pci snd_sof_xtensa_dsp
    snd_sof snd_sof_utils snd_soc_hdac_hda snd_hda_ext_core
    snd_soc_acpi_intel_match snd_soc_acpi soundwire_generic_allocation
    soundwire_bus iwlmvm intel_uncore_frequency snd_soc_core
    intel_uncore_frequency_common intel_tcc_cooling snd_compress
    snd_hda_codec_realtek ac97_bus x86_pkg_temp_thermal intel_powerclamp
    snd_hda_codec_generic snd_hda_codec_hdmi snd_pcm_dmaengine coretemp
    mac80211 snd_hda_intel hid_multitouch kvm_intel snd_intel_dspcfg
    snd_intel_sdw_acpi libarc4 mei_pxp kvm btusb uvcvideo mei_hdcp
    snd_hda_codec btrtl uvc processor_thermal_device_pci videobuf2_v4l2
    btbcm irqbypass snd_hda_core iTCO_wdt processor_thermal_device
    dm_zero btintel videodev btmtk
    [  138.739535]  iTCO_vendor_support processor_thermal_rapl snd_hwdep
    r8169 rapl ucsi_acpi intel_pmc_bxt intel_rapl_msr iwlwifi bluetooth
    realtek videobuf2_vmalloc pmt_telemetry typec_ucsi snd_pcm spi_nor
    intel_cstate vfat mei_me intel_rapl_common intel_lpss_pci
    mdio_devres videobuf2_memops pmt_class snd_timer videobuf2_common
    i2c_i801 intel_lpss intel_uncore wmi_bmof asus_nb_wmi pcspkr typec
    ecdh_generic cfg80211 libphy mtd fat processor_thermal_rfim mc mei
    idma64 i2c_smbus snd thunderbolt crc16 roles i2c_hid_acpi soundcore
    intel_vsec processor_thermal_mbox igen6_edac i2c_hid int3403_thermal
    int340x_thermal_zone int3400_thermal acpi_thermal_rel acpi_tad
    mousedev acpi_pad joydev mac_hid pkcs8_key_parser dm_multipath
    i2c_dev crypto_user fuse loop ip_tables x_tables btrfs
    blake2b_generic libcrc32c crc32c_generic xor raid6_pq dm_crypt cbc
    encrypted_keys trusted tee asn1_encoder hid_asus asus_wmi
    ledtrig_audio sparse_keymap rfkill platform_profile usbhid i915
    crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni
    [  138.739592]  polyval_generic gf128mul serio_raw
    ghash_clmulni_intel drm_buddy dm_mod sha512_ssse3 intel_gtt atkbd
    ttm sdhci_pci vivaldi_fmap aesni_intel libps2 i2c_algo_bit cqhci
    nvme sdhci crypto_simd drm_display_helper nvme_core xhci_pci cryptd
    spi_intel_pci mmc_core xhci_pci_renesas nvme_common spi_intel cec
    video i8042 serio wmi
    [  138.739610] CPU: 6 PID: 3845 Comm: pool-/usr/lib/b Tainted: G
    S                 6.6.0-1-mainline #1
    a243c5e3c83e72fc2b2243b5ea465e514d6c24c1
    [  138.739614] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus M16
    GU603ZW_GU603ZW/GU603ZW, BIOS GU603ZW.311 12/22/2022
    [  138.739615] RIP: 0010:tb_path_activate+0x10f/0x480 [thunderbolt]
    [  138.739637] Code: 01 00 00 48 85 ed 0f 84 d7 00 00 00 48 81 c7 c0
    00 00 00 e8 93 24 7b f8 48 89 ea 48 c7 c7 20 95 db c0 48 89 c6 e8 f1
    78 f4 f7 <0f> 0b 48 8b 44 24 08 65 48 2b 04 25 28 00 00 00 0f 85 54
    03 00 00
    [  138.739639] RSP: 0018:ffffc90005937d30 EFLAGS: 00010282
    [  138.739641] RAX: 0000000000000000 RBX: 00000000ffffff95 RCX:
    0000000000000027
    [  138.739642] RDX: ffff88886b3a1708 RSI: 0000000000000001 RDI:
    ffff88886b3a1700
    [  138.739644] RBP: ffff88810310edc0 R08: 0000000000000000 R09:
    ffffc90005937bb8
    [  138.739644] R10: 0000000000000003 R11: ffff88888b7aac28 R12:
    0000000000000028
    [  138.739645] R13: ffff88813ebc9100 R14: ffff888103fe5800 R15:
    ffff8881701d8fe0
    [  138.739647] FS:  00007fd6231fe6c0(0000) GS:ffff88886b380000(0000)
    knlGS:0000000000000000
    [  138.739648] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  138.739650] CR2: 000055d0bbfe6610 CR3: 0000000141210000 CR4:
    0000000000f50ee0
    [  138.739651] PKRU: 55555554
    [  138.739652] Call Trace:
    [  138.739654]  <TASK>
    [  138.739655]  ? tb_path_activate+0x10f/0x480 [thunderbolt
    c85481cfb2695e02347db36bb54248816593d261]
    [  138.739676]  ? __warn+0x81/0x130
    [  138.739681]  ? tb_path_activate+0x10f/0x480 [thunderbolt
    c85481cfb2695e02347db36bb54248816593d261]
    [  138.739702]  ? report_bug+0x171/0x1a0
    [  138.739706]  ? console_unlock+0x78/0x120
    [  138.739710]  ? handle_bug+0x3c/0x80
    [  138.739718]  ? exc_invalid_op+0x17/0x70
    [  138.739721]  ? asm_exc_invalid_op+0x1a/0x20
    [  138.739725]  ? tb_path_activate+0x10f/0x480 [thunderbolt
    c85481cfb2695e02347db36bb54248816593d261]
    [  138.739746]  tb_tunnel_restart+0xb3/0x220 [thunderbolt
    c85481cfb2695e02347db36bb54248816593d261]
    [  138.739767]  tb_tunnel_pci+0x1b2/0x480 [thunderbolt
    c85481cfb2695e02347db36bb54248816593d261]
    [  138.739787]  authorized_store+0x289/0x2d0 [thunderbolt
    c85481cfb2695e02347db36bb54248816593d261]
    [  138.739806]  kernfs_fop_write_iter+0x133/0x1d0
    [  138.739810]  vfs_write+0x23b/0x420
    [  138.739815]  ksys_write+0x6f/0xf0
    [  138.739818]  do_syscall_64+0x5d/0x90
    [  138.739820]  ? syscall_exit_to_user_mode+0x2b/0x40
    [  138.739824]  ? do_syscall_64+0x6c/0x90
    [  138.739826]  ? do_syscall_64+0x6c/0x90
    [  138.739828]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
    [  138.739830] RIP: 0033:0x7fd628ec406f
    [  138.739876] Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 19 4d
    f8 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00
    00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 6c 4d
    f8 ff 48
    [  138.739877] RSP: 002b:00007fd6231fdc90 EFLAGS: 00000293 ORIG_RAX:
    0000000000000001
    [  138.739880] RAX: ffffffffffffffda RBX: 00007fd614008c40 RCX:
    00007fd628ec406f
    [  138.739881] RDX: 0000000000000001 RSI: 00007fd6231fdd30 RDI:
    000000000000000a
    [  138.739882] RBP: 00007fd6231fdd70 R08: 0000000000000000 R09:
    00007fd6231fdba0
    [  138.739883] R10: 0000000000000000 R11: 0000000000000293 R12:
    00007fd614002e20
    [  138.739884] R13: 000000000000000a R14: 0000000000000000 R15:
    00007fd6231fdd28
    [  138.739886]  </TASK>
    [  138.739887] ---[ end trace 0000000000000000 ]---
    [  138.739888] thunderbolt 0000:00:0d.2: 0:8 <-> 1:3 (PCI):
    activation failed
    [  138.740586] thunderbolt 0000:00:0d.2: 1:3: PCIe tunnel activation
    failed, aborting
    [  138.740697] thunderbolt 0-0:1.1: retimer disconnected
    [  138.740791] thunderbolt 0-1: device disconnected

the device is then rediscovered and the kernel oops reoccurs ad
infinitum (device remaining non-functional the whole time).

If the device was plugged in during system boot, no such error occurs
and the device is fully functional.
If the device is then unplugged/replugged, the above kernel oops appears
and the device remains unusable.

I have also tried enrolling the device prior to connect as well as
enabling auto-authorization via udev rules as described in the "USB4 and
Thunderbolt" admin guide, both to no avail.

The system under test is an Asus ROG Zephyrus M16 GU603ZW (Intel
i9-12900H [Alder Lake]) loaded with Arch Linux (tested under
6.5.2-arch1-1, 6.5.3-arch1-1, and 6.6.0-1-mainline [vanilla]).

The external enclosure is fully functional with the same kernel on a
system with a TB3-only port (Intel i7-8750H [Coffee Lake] + Intel® HM370
chipset), including hotplugging support.
The external enclosure is also fully functional on the test system
described above booted into Windows 11 x64.

The bug was first reported to the Arch Linux forums with no response
(https://bbs.archlinux.org/viewtopic.php?id=288731), more details can be
found there too.


