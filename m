Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448DF519A22
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 10:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346553AbiEDIqI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 04:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346532AbiEDIqA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 04:46:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765AA24599
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 01:42:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D17BB822B7
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 08:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 996CAC385A5
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651653741;
        bh=MvfVRPUaPxXs/ezxgAVKs39otrTmSo59SrYCx9FyE2o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YU6+veLIksu2oTf4BhnlM97LMiEjlTYyzMVX/dds0BaDRYAEhkkPR9Ed290p+H0aH
         ppMmMOyq033sHyNDhyNpcvFQC6URny+JVtxAONsCo7OCADogC235Xrl0d5qA/6KL8q
         1AweI5fZvHiN6GGO3GwBb/h5v2fK+T96715Tg/1Sdjz3FXsVles49B6cOTxUIxoLC4
         Mts02Cbbpn1/vbFQzsVv23WG7++Mirm6Q688fE1NiwuaPWuI1ljZVbaGftcfXqSb7y
         J3/W9DsRB8/Ea0F0rhClH/2zlqX4B5rP8aWGwfGkNwaALpWvOaurn+NzQZHQ3VH646
         P5lEPqOr82MpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7D7F9C05FF5; Wed,  4 May 2022 08:42:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Wed, 04 May 2022 08:42:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-CpAnzP95Nj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Hi, this is your Linux kernel regression tracker.

Linux-Input developers, do you have any idea what might be causing the
problem outline below? It's a post 5.17 regression in mainline that was
reported to bugzilla.kernel.org about a week ago, but didn't even get a
single reply. Might be some other subsystem that is causing it, not sure.

On 27.04.22 00:42, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D215890
>=20
>             Bug ID: 215890
>            Summary: Regression in 5.18: bcm5974 trackpad causes error:
>                     xhci_hcd rejecting DMA map of vmalloc memory
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.18-rc4
>           Hardware: Intel
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: high
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: satadru@umich.edu
>         Regression: No
>=20
> The Apple BCM5974 trackpad & keyboard show up in sudo libinput list-devic=
es
> when booted into 5.17.4.
>=20
> In 5.18-rc4, the keyboard works, but the trackpad does not. libinput
> list-devices shows the keyboard, but not the trackpad.
>=20
> This error shows up in dmesg:
>=20
> [    7.144632] ------------[ cut here ]------------
> [    7.144635] xhci_hcd 0000:00:14.0: rejecting DMA map of vmalloc memory
> [    7.144648] WARNING: CPU: 6 PID: 969 at include/linux/dma-mapping.h:326
> usb_hcd_map_urb_for_dma+0x4c0/0x4f0
> [    7.144656] Modules linked in: mei_hdcp x86_pkg_temp_thermal
> intel_powerclamp snd_hda_codec_cirrus snd_hda_codec_generic ledtrig_audio
> snd_hda_codec_hdmi btusb btrtl wl(POE) kvm_intel btbcm snd_seq_midi
> snd_hda_intel btintel snd_seq_midi_event btmtk kvm bluetooth snd_intel_ds=
pcfg
> snd_intel_sdw_acpi rapl applesmc snd_rawmidi ecdh_generic snd_hda_codec
> intel_cstate ecc joydev mei_me bcm5974 snd_hda_core input_leds cfg80211
> efi_pstore(+) snd_hwdep apple_mfi_fastcharge snd_seq snd_pcm mei
> snd_seq_device
> snd_timer snd sbs(+) soundcore acpi_als industrialio_triggered_buffer sbs=
hc
> kfifo_buf apple_gmux industrialio mac_hid apple_bl facetimehd(OE)
> videobuf2_dma_sg videobuf2_memops videobuf2_v4l2 videobuf2_common videode=
v mc
> coretemp ipmi_devintf ipmi_msghandler msr parport_pc ppdev lp parport
> ip_tables
> x_tables autofs4 zfs(POE) zunicode(POE) zzstd(OE) zlua(OE) zavl(POE) icp(=
POE)
> zcommon(POE) znvpair(POE) spl(OE) z3fold lz4 lz4_compress hid_logitech_hi=
dpp
> hid_apple hid_logitech_dj hid_generic
> [    7.144716]  usbhid hid i915 nouveau mxm_wmi wmi drm_buddy i2c_algo_bit
> drm_ttm_helper ttm drm_dp_helper cec rc_core drm_kms_helper uas syscopyar=
ea
> usb_storage sysfillrect crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
> sysimgblt fb_sys_fops aesni_intel nvme crypto_simd i2c_i801 cryptd drm
> nvme_core thunderbolt lpc_ich i2c_smbus xhci_pci xhci_pci_renesas video
> [    7.144742] CPU: 6 PID: 969 Comm: systemd-udevd Tainted: P           O=
E=20=20=20=20
> 5.18.0-rc4 #1
> [    7.144745] Hardware name: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE1=
663,
> BIOS 432.60.3.0.0 10/27/2021
> [    7.144746] RIP: 0010:usb_hcd_map_urb_for_dma+0x4c0/0x4f0
> [    7.144752] Code: 50 c6 05 dd fd 8a 01 01 4d 85 f6 75 03 4d 8b 32 4c 8=
9 d7
> e8 42 6f ef ff 4c 89 f2 48 c7 c7 e8 3d 43 96 48 89 c6 e8 0f f7 36 00 <0f>=
 0b
> e9
> 58 ff ff ff 48 8b 35 32 e9 4a 01 e9 ae fe ff ff 48 8b 35
> [    7.144754] RSP: 0018:ffffb4494abd7978 EFLAGS: 00010286
> [    7.144756] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> ffffa0ae6f3a05a8
> [    7.144757] RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI:
> ffffa0ae6f3a05a0
> [    7.144759] RBP: ffffb4494abd79b0 R08: 0000000000000003 R09:
> 0000000000000001
> [    7.144760] R10: ffffffffffffffff R11: 0000000000000001 R12:
> ffffa0ab16e42900
> [    7.144761] R13: ffffa0ab1e092000 R14: ffffa0ab0155cec0 R15:
> 00000000000001de
> [    7.144762] FS:  00007f7696c778c0(0000) GS:ffffa0ae6f380000(0000)
> knlGS:0000000000000000
> [    7.144764] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    7.144766] CR2: 00007f76975c1f06 CR3: 000000011eda6005 CR4:
> 00000000001706e0
> [    7.144767] Call Trace:
> [    7.144771]  <TASK>
> [    7.144774]  xhci_map_urb_for_dma+0x14c/0x2b0
> [    7.144783]  usb_hcd_submit_urb+0x98/0xc70
> [    7.144785]  ? __slab_free+0xbf/0x310
> [    7.144789]  ? usb_control_msg+0xfc/0x140
> [    7.144792]  usb_submit_urb+0x24f/0x6c0
> [    7.144797]  bcm5974_start_traffic+0x4c/0xa0 [bcm5974]
> [    7.144801]  bcm5974_open+0x44/0x90 [bcm5974]
> [    7.144803]  input_open_device+0x8d/0xe0
> [    7.144806]  evdev_open+0x1cc/0x200
> [    7.144809]  chrdev_open+0xc4/0x240
> [    7.144813]  ? cdev_device_add+0x90/0x90
> [    7.144815]  do_dentry_open+0x157/0x380
> [    7.144819]  vfs_open+0x2d/0x30
> [    7.144823]  path_openat+0xb5b/0x12b0
> [    7.144826]  ? page_add_file_rmap+0x81/0x300
> [    7.144829]  ? filemap_map_pages+0x148/0x7a0
> [    7.144833]  do_filp_open+0xb6/0x160
> [    7.144836]  ? __check_object_size+0x128/0x160
> [    7.144840]  do_sys_openat2+0x9b/0x160
> [    7.144842]  __x64_sys_openat+0x56/0x90
> [    7.144844]  do_syscall_64+0x59/0x80
> [    7.144848]  ? irqentry_exit_to_user_mode+0x9/0x20
> [    7.144850]  ? irqentry_exit+0x33/0x40
> [    7.144852]  ? exc_page_fault+0x87/0x170
> [    7.144854]  ? asm_exc_page_fault+0x8/0x30
> [    7.144858]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [    7.144861] RIP: 0033:0x7f76974096eb
> [    7.144864] Code: 25 00 00 41 00 3d 00 00 41 00 74 4b 64 8b 04 25 18 0=
0 00
> 00 85 c0 75 67 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48>=
 3d
> 00
> f0 ff ff 0f 87 91 00 00 00 48 8b 54 24 28 64 48 2b 14 25
> [    7.144866] RSP: 002b:00007ffff8b30d00 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000101
> [    7.144868] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
> 00007f76974096eb
> [    7.144870] RDX: 0000000000080902 RSI: 0000558ac9a4b030 RDI:
> 00000000ffffff9c
> [    7.144871] RBP: 0000558ac9a4b030 R08: 0000000000000000 R09:
> 0000000000000000
> [    7.144872] R10: 0000000000000000 R11: 0000000000000246 R12:
> 0000000000080902
> [    7.144873] R13: 00007ffff8b30da0 R14: 0000558ac9925570 R15:
> 0000558ac992557a
> [    7.144875]  </TASK>
> [    7.144876] ---[ end trace 0000000000000000 ]---

For more details check this thread or the bugzilla ticket, it has a
second comment already from the reporter.

Anyway, to get this tracked:

#regzbot introduced: v5.17..v5.18-rc4
#regzbot from: Satadru Pramanik <satadru@umich.edu>
#regzbot title: input/usb/???: bcm5974 trackpad causes error: xhci_hcd
rejecting DMA map of vmalloc memory
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
