Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D82791DC2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Sep 2023 21:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbjIDTlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Sep 2023 15:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbjIDTlo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Sep 2023 15:41:44 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D643BB4
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 12:41:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D08E6CE0EA6
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 19:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 238EEC433C8
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693856497;
        bh=an+7dMuefPMqijVFq36QSkFfgBVscWxisqmHZpSB6Go=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uaZv3xvf+qmzgfKodpopkThCvb308eC9vwsRo2DmG1Pqb03iKdJ+uWbFC256M8iYt
         yys8oRDo3bdSuCiYck7jrIyHvzHIRYxTrxkWuF5PVFLdWvZjKi4aU9fQbvpJak9KxC
         w131OtBDKBNO2gQpUCMhAQBAWKbxy966LNKmd7hj+s4PLcp8WvZ4Ryns2qoZSmCC98
         smAb46DM6EWvzipiyWTvcKX9LoTcaulMArrBmNX13jOMx+zQKJhHd5k5AoLaTSYz/u
         1EsidPzY6whT1DvK/Fe9Vq3lXZkf3qrUkIUuUOMrvrSLSohKyEGw1vNAg/ODPphU4h
         oNhD+H1xuTGTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EEC90C4332E; Mon,  4 Sep 2023 19:41:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Mon, 04 Sep 2023 19:41:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-0MUfEtFBKM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #5 from pawlick3r@proton.me ---
(In reply to Alan Stern from comment #4)
> Created attachment 305027 [details]
> Fix IO buffer on stack in alauda subdriver
>=20
> Try the attached patch.  It should fix all the other instances of I/O done
> to a buffer on the stack in the alauda driver.

It fixes that error, but not the deference error:

[   63.134053] usb 1-1.2: new full-speed USB device number 6 using ehci-pci
[   63.260694] usb 1-1.2: New USB device found, idVendor=3D0584, idProduct=
=3D0008,
bcdDevice=3D 1.02
[   63.260715] usb 1-1.2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[   63.260721] usb 1-1.2: Product: USB SmartMedia Adapter
[   63.260726] usb 1-1.2: Manufacturer: YAMAICHI ELECTRONICS Co.,Ltd.
[   63.341974] usbcore: registered new interface driver usb-storage
[   63.348722] ums-alauda 1-1.2:1.0: USB Mass Storage device detected
[   63.348926] scsi host6: usb-storage 1-1.2:1.0
[   63.349032] usbcore: registered new interface driver ums-alauda
[   64.355307] scsi 6:0:0:0: Direct-Access     Fujifilm DPC-R1 (Alauda)  01=
02
PQ: 0 ANSI: 0 CCS
[   64.355494] scsi 6:0:0:1: Direct-Access     Fujifilm DPC-R1 (Alauda)  01=
02
PQ: 0 ANSI: 0 CCS
[   64.356335] sd 6:0:0:0: Attached scsi generic sg1 type 0
[   64.356814] sd 6:0:0:0: [sdb] Media removed, stopped polling
[   64.356970] sd 6:0:0:1: Attached scsi generic sg2 type 0
[   64.357651] sd 6:0:0:0: [sdb] Attached SCSI removable disk
[   95.571120] usb 1-1.2: reset full-speed USB device number 6 using ehci-p=
ci
[   95.686034] sd 6:0:0:1: [sdc] 16000 512-byte logical blocks: (8.19 MB/7.=
81
MiB)
[   95.686147] sd 6:0:0:1: [sdc] Test WP failed, assume Write Enabled
[   95.686243] sd 6:0:0:1: [sdc] Asking for cache data failed
[   95.686260] sd 6:0:0:1: [sdc] Assuming drive cache: write through
[  126.209261] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[  126.209295] #PF: supervisor read access in kernel mode
[  126.209306] #PF: error_code(0x0000) - not-present page
[  126.209453] PGD 0 P4D 0=20
[  126.209474] Oops: 0000 [#1] PREEMPT SMP PTI
[  126.209491] CPU: 3 PID: 2777 Comm: usb-storage Not tainted 6.5.1-custom =
#3
[  126.209507] Hardware name: LENOVO 42872VU/42872VU, BIOS 8DET54WW (1.24 )
10/18/2011
[  126.209513] RIP: 0010:alauda_transport+0x4e6/0x12e2 [ums_alauda]
[  126.209538] Code: 0f 4c 8b b1 98 00 00 00 49 83 fe 01 0f 87 6f 0a 00 00 =
4b
8d 0c 76 44 89 e8 44 8b 6d a8 48 c1 e1 04 48 8b 4c 0b 20 48 8b 04 c1 <42> 0=
f b7
04 68 66 83 f8 ff 0f 84 18 ff ff ff 44 0f b7 f8 49 83 fe
[  126.209546] RSP: 0018:ffffa17ac0bb3cd0 EFLAGS: 00010206
[  126.209555] RAX: 0000000000000000 RBX: ffff8ab097457a80 RCX:
ffff8ab1913c6ac8
[  126.209561] RDX: 00000000019c2003 RSI: ffffd88bc0000000 RDI:
0000000000000000
[  126.209567] RBP: ffffa17ac0bb3db0 R08: 0000000000000000 R09:
0000000000000000
[  126.209573] R10: 0000000000000001 R11: 0000000000000000 R12:
ffff8ab08121c000
[  126.209578] R13: 0000000000000000 R14: 0000000000000001 R15:
ffff8ab081915138
[  126.209584] FS:  0000000000000000(0000) GS:ffff8ab19a2c0000(0000)
knlGS:0000000000000000
[  126.209591] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  126.209597] CR2: 0000000000000000 CR3: 000000008e03c006 CR4:
00000000000606e0
[  126.209604] Call Trace:
[  126.209610]  <TASK>
[  126.209618]  ? show_regs+0x6e/0x80
[  126.209632]  ? __die+0x29/0x70
[  126.209641]  ? page_fault_oops+0x154/0x4a0
[  126.209654]  ? alauda_transport+0x4e6/0x12e2 [ums_alauda]
[  126.209671]  ? search_exception_tables+0x65/0x70
[  126.209686]  ? kernelmode_fixup_or_oops+0xa2/0x120
[  126.209697]  ? __bad_area_nosemaphore+0x179/0x280
[  126.209712]  ? bad_area_nosemaphore+0x16/0x20
[  126.209725]  ? do_user_addr_fault+0x2ce/0x6b0
[  126.209741]  ? exc_page_fault+0x7d/0x190
[  126.209755]  ? asm_exc_page_fault+0x2b/0x30
[  126.209774]  ? alauda_transport+0x4e6/0x12e2 [ums_alauda]
[  126.209799]  ? __schedule+0x3cb/0x15d0
[  126.209825]  usb_stor_invoke_transport+0x45/0x520 [usb_storage]
[  126.209856]  ? __wait_for_common+0x15b/0x190
[  126.209868]  ? __pfx_schedule_timeout+0x10/0x10
[  126.209881]  usb_stor_transparent_scsi_command+0x12/0x20 [usb_storage]
[  126.209905]  usb_stor_control_thread+0x20b/0x2d0 [usb_storage]
[  126.209931]  ? __pfx_usb_stor_control_thread+0x10/0x10 [usb_storage]
[  126.209955]  kthread+0xfb/0x130
[  126.209967]  ? __pfx_kthread+0x10/0x10
[  126.209978]  ret_from_fork+0x40/0x60
[  126.209988]  ? __pfx_kthread+0x10/0x10
[  126.209998]  ret_from_fork_asm+0x1b/0x30
[  126.210016]  </TASK>
[  126.210020] Modules linked in: ums_alauda usb_storage rfcomm ccm bnep
intel_rapl_msr mei_hdcp snd_hda_codec_hdmi snd_ctl_led snd_hda_codec_conexa=
nt
snd_hda_codec_generic uvcvideo videobuf2_vmalloc uvc snd_hda_intel btusb
snd_intel_dspcfg btrtl snd_intel_sdw_acpi videobuf2_memops btbcm btintel bt=
mtk
videobuf2_v4l2 bluetooth snd_hda_codec videodev videobuf2_common mc
ecdh_generic intel_rapl_common x86_pkg_temp_thermal intel_powerclamp corete=
mp
binfmt_misc snd_hda_core rapl snd_hwdep intel_cstate iwldvm snd_pcm
nls_iso8859_1 think_lmi input_leds joydev mac80211 at24 serio_raw
firmware_attributes_class wmi_bmof libarc4 snd_seq_midi snd_seq_midi_event
iwlwifi snd_rawmidi thinkpad_acpi snd_seq snd_seq_device nvram snd_timer
ledtrig_audio mei_me platform_profile cfg80211 snd mei soundcore mac_hid
sch_fq_codel msr parport_pc ppdev lp pstore_blk parport ramoops pstore_zone
reed_solomon efi_pstore ip_tables x_tables autofs4 i915 drm_buddy i2c_algo_=
bit
ttm crct10dif_pclmul drm_display_helper crc32_pclmul ghash_clmulni_intel cec
[  126.210212]  sha512_ssse3 rc_core aesni_intel sdhci_pci crypto_simd
drm_kms_helper ahci cryptd cqhci psmouse i2c_i801 libahci drm i2c_smbus lpc=
_ich
e1000e sdhci video wmi
[  126.210262] CR2: 0000000000000000
[  126.210270] ---[ end trace 0000000000000000 ]---
[  126.974625] RIP: 0010:alauda_transport+0x4e6/0x12e2 [ums_alauda]
[  126.974660] Code: 0f 4c 8b b1 98 00 00 00 49 83 fe 01 0f 87 6f 0a 00 00 =
4b
8d 0c 76 44 89 e8 44 8b 6d a8 48 c1 e1 04 48 8b 4c 0b 20 48 8b 04 c1 <42> 0=
f b7
04 68 66 83 f8 ff 0f 84 18 ff ff ff 44 0f b7 f8 49 83 fe
[  126.974670] RSP: 0018:ffffa17ac0bb3cd0 EFLAGS: 00010206
[  126.974680] RAX: 0000000000000000 RBX: ffff8ab097457a80 RCX:
ffff8ab1913c6ac8
[  126.974687] RDX: 00000000019c2003 RSI: ffffd88bc0000000 RDI:
0000000000000000
[  126.974693] RBP: ffffa17ac0bb3db0 R08: 0000000000000000 R09:
0000000000000000
[  126.974698] R10: 0000000000000001 R11: 0000000000000000 R12:
ffff8ab08121c000
[  126.974703] R13: 0000000000000000 R14: 0000000000000001 R15:
ffff8ab081915138
[  126.974709] FS:  0000000000000000(0000) GS:ffff8ab19a2c0000(0000)
knlGS:0000000000000000
[  126.974716] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  126.974722] CR2: 0000000000000000 CR3: 0000000113a8a005 CR4:
00000000000606e0
[  126.974729] note: usb-storage[2777] exited with irqs disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
