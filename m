Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C8C5A7267
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 02:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiHaAbs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 20:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiHaAbr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 20:31:47 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66959A405C
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 17:31:46 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C21B85C00DF
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 20:31:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 30 Aug 2022 20:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        invisiblethingslab.com; h=cc:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1661905903; x=1661992303; bh=+GA6ThCHz0
        WI4X0lnk8TX2bFXyaJSqe42BrAGFLfZ+U=; b=U1meQcn6nfgmNEkKq1hcW9o9uJ
        wJ/1SDrKZJXtts3/Ys4kXHQgogipNnqqwziYcq6HQSP9tzxfbejMseCVi7o1VCaS
        C8PKVjQ0rXMvAqqDFjjmEvekyeZGSp9hJ2JPN4rmEoYxsOJMUahc6bwDwEyz+l7u
        1y5xTRSPkNC/Nzn1nwTCexzKIJH8cMcSGW9GcnNEY6Alvr+GQWuz2/u1OzbhDl0S
        KCF5vGrjVLVdfG+SlW/HLsQf2B0817nwx/CfvLlclDBUaeZsong+88pI6irbMmBq
        kwPkFzH4/9ujPhe5XZ+uu8hFE1ADAeCHNDsy6rkOfuLVrGTY+OeGNkHuwjVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661905903; x=
        1661992303; bh=+GA6ThCHz0WI4X0lnk8TX2bFXyaJSqe42BrAGFLfZ+U=; b=s
        JpKoXsqf010Qngy5z5bjv594O4yOavt1yl/Fw4/Q3puacNqhqRraqCnjNdgUO/3F
        lD3YIUopEzgX4ZvzuSgaCi1AQAaJXp9iJry8fijb6IKOjA3lCvU8l0OlDyBtPwoN
        mqsW4x9ys5KIBeELMGkCaTErqhu7yLmO72+Oi8pxnZN73NzHBvN5mKDU+C/DeBel
        fgWPUgZh6YOyDdlHughw0juzGbW32LdyQfutDr3xSsx8YSRSfbGZl1SWaI2gU3Ke
        qOq8sA1ZwurdzVIl2uPYZnBJ+JE19uyBBAusvKbFVsaCa3a23Q7HvwOEU4HQeoI8
        tBzwoO1OvJQkmlIdM6cmA==
X-ME-Sender: <xms:76sOY7nk2U1aVaU-qiqHdIp2oAlEcsmG2t1g45WNcLMBa3X1EA3tfg>
    <xme:76sOY-20xnkuzgzc3HcdqzFh6680MNV-D2eS9JZQXo_teAaQaxfIhy1eDzydFtfxU
    NH4FdkoXbctxQ>
X-ME-Received: <xmr:76sOYxpPBKi-Xrx3BMz0SHMThnhsyzA0-zsnHnqyYPv3wnDB-v1Vs0k_-XhRZsPc-VAnMO33WqWM-J1n3rw5OxwRAh8YMh-auH3->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekgedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:76sOYzl2wiXOikL1_st1t0yL3FYuCJ7hIwCEMTK-zowUxGFq6hDqqw>
    <xmx:76sOY51Q03Ar4fWDe7RaykWk0RYy49dAMqPRvAjihCdq3cQ1M7l9QQ>
    <xmx:76sOYyv9CNx0A1T8Uen8l2c6giuxIlpZw11CUaag1V7LOQKtcgxYrg>
    <xmx:76sOY6DNMuA5A-tAC0pavRfgQINLM45uAlv6mpRWAKTY8FN7mBkOnw>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 20:31:43 -0400 (EDT)
Date:   Wed, 31 Aug 2022 02:31:23 +0200
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     linux-usb@vger.kernel.org
Subject: list_del corruption (NULL pointer dereference) on xhci-pci unbind
Message-ID: <Yw6r7FxMCCYSzfTk@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IjEwkQeKf7X/fXxX"
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--IjEwkQeKf7X/fXxX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 31 Aug 2022 02:31:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-usb@vger.kernel.org
Subject: list_del corruption (NULL pointer dereference) on xhci-pci unbind

Hello,

I hit a kernel crash when unbinding xhci-pci from the PCI device (via
sysfs write). I can trigger the issue at least on 5.19.2 and 6.0-rc3.
Interestingly, the same kernel does not crash on another machine while
doing the same, so it might depends on specific devices being connected.

The specific message I get is this:

  ehci-pci 0000:00:06.0: remove, state 1
  usb usb4: USB disconnect, device number 1
  usb 4-1: USB disconnect, device number 2
  usb 4-1.5: USB disconnect, device number 3
  ehci-pci 0000:00:06.0: USB bus 4 deregistered
  ehci-pci 0000:00:07.0: remove, state 1
  usb usb5: USB disconnect, device number 1
  usb 5-1: USB disconnect, device number 2
  usb 5-1.2: USB disconnect, device number 3
  usb 5-1.4: USB disconnect, device number 4
  usb 5-1.5: USB disconnect, device number 5
  usb 5-1.6: USB disconnect, device number 6
  ehci-pci 0000:00:07.0: USB bus 5 deregistered
  xhci_hcd 0000:00:08.0: remove, state 4
  usb usb3: USB disconnect, device number 1
  xhci_hcd 0000:00:08.0: USB bus 3 deregistered
  xhci_hcd 0000:00:08.0: remove, state 1
  usb usb2: USB disconnect, device number 1
  usb 2-4: USB disconnect, device number 2
  cdc_mbim 2-4:1.6 wws8u4i6: unregister 'cdc_mbim' usb-0000:00:08.0-4, CDC =
MBIM
  xhci_hcd 0000:00:08.0: Slot 1 endpoint 8 not removed from BW list!
  xhci_hcd 0000:00:08.0: Slot 1 endpoint 12 not removed from BW list!
  xhci_hcd 0000:00:08.0: Slot 1 endpoint 14 not removed from BW list!
  xhci_hcd 0000:00:08.0: Slot 1 endpoint 16 not removed from BW list!
  xhci_hcd 0000:00:08.0: Slot 1 endpoint 18 not removed from BW list!
  xhci_hcd 0000:00:08.0: Slot 1 endpoint 20 not removed from BW list!
  list_del corruption, ffff935804028758->next is NULL
  ------------[ cut here ]------------
  kernel BUG at lib/list_debug.c:49!
  invalid opcode: 0000 [#1] PREEMPT SMP PTI
  CPU: 1 PID: 1211 Comm: prepare-suspend Not tainted 6.0.0-rc3-1.51.fc32.qu=
bes.x86_64 #248
  Hardware name: Xen HVM domU, BIOS 4.14.5 08/24/2022
  RIP: 0010:__list_del_entry_valid.cold+0xf/0x6f
  Code: c7 c7 38 de 8c ae e8 22 d2 fd ff 0f 0b 48 c7 c7 10 de 8c ae e8 14 d=
2 fd ff 0f 0b 48 89 fe 48 c7 c7 20 df 8c ae e8 03 d2 fd ff <0f> 0b 48 89 d1=
 48 c7 c7 40 e0 8c ae 4c 89 c2 e8 ef d1 fd ff 0f 0b
  RSP: 0000:ffffb7ef817e7cd0 EFLAGS: 00010246
  RAX: 0000000000000033 RBX: ffff935803460900 RCX: 0000000000000000
  RDX: 0000000000000000 RSI: ffffffffae8b45a7 RDI: 00000000ffffffff
  RBP: 0000000000000006 R08: 0000000000000000 R09: 00000000ffffdfff
  R10: ffffb7ef817e7b78 R11: ffffffffaed46088 R12: ffff935803466260
  R13: ffff935803460810 R14: ffff935804028758 R15: ffff935803460928
  FS:  000076820cccd740(0000) GS:ffff935810700000(0000) knlGS:0000000000000=
000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 000075bb7d654d70 CR3: 000000000066a003 CR4: 00000000001706e0
  Call Trace:
   <TASK>
   xhci_mem_cleanup+0x14c/0x520 [xhci_hcd]
   xhci_stop+0x12d/0x1b0 [xhci_hcd]
   usb_stop_hcd+0x3b/0x57
   usb_remove_hcd.cold+0xd0/0x159
   usb_hcd_pci_remove+0x76/0x110
   pci_device_remove+0x36/0xa0
   device_release_driver_internal+0x1aa/0x230
   unbind_store+0x11f/0x130
   kernfs_fop_write_iter+0x124/0x1b0
   vfs_write+0x2ff/0x400
   ksys_write+0x67/0xe0
   do_syscall_64+0x3b/0x90
   entry_SYSCALL_64_after_hwframe+0x63/0xcd
  RIP: 0033:0x76820cb3e807
  Code: 0b 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e f=
a 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff=
 ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
  RSP: 002b:00007ffe4cddb668 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
  RAX: ffffffffffffffda RBX: 000000000000000d RCX: 000076820cb3e807
  RDX: 000000000000000d RSI: 00005b61eff10ec0 RDI: 0000000000000001
  RBP: 00005b61eff10ec0 R08: 0000000000000000 R09: 000076820cbb14e0
  R10: 000076820cbb13e0 R11: 0000000000000246 R12: 000000000000000d
  R13: 000076820cbfb780 R14: 000000000000000d R15: 000076820cbf69e0
   </TASK>
  Modules linked in: nft_ct bnep uvcvideo videobuf2_vmalloc videobuf2_memop=
s ath3k btusb btrtl btbcm btintel btmtk bluetooth videobuf2_v4l2 videobuf2_=
common videodev ecdh_generic rfkill mc cdc_mbim cdc_ncm cdc_ether usbnet mi=
i cdc_wdm cdc_acm ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack nft_chain=
_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_co=
mpat intel_rapl_msr intel_rapl_common nf_tables joydev crct10dif_pclmul nfn=
etlink crc32_pclmul ghash_clmulni_intel xhci_pci pcspkr xhci_pci_renesas eh=
ci_pci xhci_hcd drm_vram_helper ehci_hcd serio_raw drm_ttm_helper ttm ata_g=
eneric pata_acpi i2c_piix4 floppy xen_scsiback xen_netback xen_privcmd xen_=
gntdev xen_gntalloc xen_blkback xen_evtchn ipmi_devintf ipmi_msghandler fus=
e ip_tables overlay xen_blkfront
  ---[ end trace 0000000000000000 ]---
  RIP: 0010:__list_del_entry_valid.cold+0xf/0x6f
  Code: c7 c7 38 de 8c ae e8 22 d2 fd ff 0f 0b 48 c7 c7 10 de 8c ae e8 14 d=
2 fd ff 0f 0b 48 89 fe 48 c7 c7 20 df 8c ae e8 03 d2 fd ff <0f> 0b 48 89 d1=
 48 c7 c7 40 e0 8c ae 4c 89 c2 e8 ef d1 fd ff 0f 0b
  RSP: 0000:ffffb7ef817e7cd0 EFLAGS: 00010246
  RAX: 0000000000000033 RBX: ffff935803460900 RCX: 0000000000000000
  RDX: 0000000000000000 RSI: ffffffffae8b45a7 RDI: 00000000ffffffff
  RBP: 0000000000000006 R08: 0000000000000000 R09: 00000000ffffdfff
  R10: ffffb7ef817e7b78 R11: ffffffffaed46088 R12: ffff935803466260
  R13: ffff935803460810 R14: ffff935804028758 R15: ffff935803460928
  FS:  000076820cccd740(0000) GS:ffff935810700000(0000) knlGS:0000000000000=
000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 000075bb7d654d70 CR3: 000000000066a003 CR4: 00000000001706e0
  Kernel panic - not syncing: Fatal exception
  Kernel Offset: 0x2c000000 from 0xffffffff81000000 (relocation range: 0xff=
ffffff80000000-0xffffffffbfffffff)

USB devices present in the system:

/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 5000M
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    |__ Port 4: Dev 2, If 0, Class=3DCommunications, Driver=3D, 480M
    |__ Port 4: Dev 2, If 1, Class=3DCommunications, Driver=3Dcdc_acm, 480M
    |__ Port 4: Dev 2, If 2, Class=3DCDC Data, Driver=3Dcdc_acm, 480M
    |__ Port 4: Dev 2, If 3, Class=3DCommunications, Driver=3Dcdc_acm, 480M
    |__ Port 4: Dev 2, If 4, Class=3DCDC Data, Driver=3Dcdc_acm, 480M
    |__ Port 4: Dev 2, If 5, Class=3DCommunications, Driver=3Dcdc_wdm, 480M
    |__ Port 4: Dev 2, If 6, Class=3DCommunications, Driver=3Dcdc_mbim, 480M
    |__ Port 4: Dev 2, If 7, Class=3DCDC Data, Driver=3Dcdc_mbim, 480M
    |__ Port 4: Dev 2, If 8, Class=3DCommunications, Driver=3Dcdc_wdm, 480M
    |__ Port 4: Dev 2, If 9, Class=3DCommunications, Driver=3Dcdc_acm, 480M
    |__ Port 4: Dev 2, If 10, Class=3DCDC Data, Driver=3Dcdc_acm, 480M
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
        |__ Port 2: Dev 3, If 1, Class=3DChip/SmartCard, Driver=3D, 12M
        |__ Port 2: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        |__ Port 4: Dev 4, If 2, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
        |__ Port 4: Dev 4, If 0, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
        |__ Port 4: Dev 4, If 3, Class=3DApplication Specific Interface, Dr=
iver=3D, 12M
        |__ Port 4: Dev 4, If 1, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
        |__ Port 5: Dev 5, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
        |__ Port 5: Dev 5, If 0, Class=3DWireless, Driver=3Dbtusb, 12M
        |__ Port 6: Dev 6, If 0, Class=3DVideo, Driver=3Duvcvideo, 480M
        |__ Port 6: Dev 6, If 1, Class=3DVideo, Driver=3Duvcvideo, 480M
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
        |__ Port 5: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 480M
        |__ Port 5: Dev 3, If 1, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 480M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/6p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 480M

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IjEwkQeKf7X/fXxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMOq+wACgkQ24/THMrX
1yzWbAf+JdL22uQ+qN2hgo3wKVbNTh2N8mFeD0KI7WuSU464Vcpm3pioz7uNA1eS
7qmjqvzymaOhQzmCkktwCl4MQNHQxcuSV7rPrsG0N4gDdde5Q2nJPRTbluPqM3cN
BGfQeUhXn2c2rNnln0xEh7nwNtY4kxPeRZuEbGPVove1AmMF4+/jlDjBRNs9zyKW
aRgxM0T5YfaTxN4efiVjfUaVt4K3k7RJOAiXM+Y5X28UjfH+b/yGB+rhIYT9SlY7
9rQfaNbXosydmmoEREKv8kXln4plDJ3+yihHqr3wv6zxWgptzN/+A2o5S5Pfae3k
4byCBSKB/A3lv9PuI27BgoxZeiwDRA==
=aVPu
-----END PGP SIGNATURE-----

--IjEwkQeKf7X/fXxX--
