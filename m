Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676F75FE688
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 03:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJNBVV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 21:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiJNBVT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 21:21:19 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23904189C25
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 18:21:18 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id B7F465C0094;
        Thu, 13 Oct 2022 21:21:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 13 Oct 2022 21:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        invisiblethingslab.com; h=cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1665710475; x=
        1665796875; bh=Q5tnmZT79WeYPCpSzeGik9oRUrz60pozwRvUEpZ/LrM=; b=x
        Kdr8GlmUm23aUZ5TjzFgLZxXGUrVk8PP+NdG77EBLm84LiLc+8Wu3lwkQ8lusIjS
        sN1/sEuqot3wD75k/W/cVF25Anc97Bf1cZoOSg5289gwEmt0VWNWqV5MeimJHnIP
        49tNnqKLYJq9JlTd8TzWDMyieUGoV5HKW+20cGjWayBlZH4FnDat8Rd5PZVFbifd
        DCSXJjDznXY9Pw/9BkZFfDU8Dnp64wVGZKdvVLjbPU+idUt1t7YPB4t6scIoM6kR
        IB13JSXZppBWWxHbhhZMs5/D3Ntk7HMkQZ5aSjPBJ4gkLKqkMW2udjqRfFKRIcWk
        UOlqQn4Ksw/vbOgG7e2cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665710475; x=1665796875; bh=Q5tnmZT79WeYPCpSzeGik9oRUrz6
        0pozwRvUEpZ/LrM=; b=FygXvcIDema2roNeqCd2WIviY1/Ks17R8QKqpNbR7reo
        m2PwsMEpNUpKd4EDhit80RBom267OGlwk9c40VrFndu41iPP2xUANgJL6R5lIj5S
        NW29DMPIBleBpWEXTEXOBhGyIXF5hCocuoecXNppym8t515QC/zRYDRT9ZYsEnU7
        T0lUJ4vdYbhAjc/nRvJedJW5bxvh4qDlTemvAadhyYsBl88cNC+PQtmvzTJCWMvF
        J/NzkA5NAUPnMEH75mw7bClLxBtR+LAZh2luKkmq0vKqmapbn+jAE8ZrjoJPzajQ
        drKr6fbMyakVUEVCd8M9YqElUh60u1F0ib1WOSrVRg==
X-ME-Sender: <xms:i7lIY_y3MgsleAwBPKhE07_RjU76yj87tCGp_n44H-AxHpRoM3SKLg>
    <xme:i7lIY3TaKsIcyQmzbTgRXvwTxhq0dtnES-wGlDD0Fp7NNcjPhH3nw1nOVASDVgsBd
    Pr_8noKSISrgA>
X-ME-Received: <xmr:i7lIY5WT0x4puXpG8ic0SVrNql78KnGW0m-4Ton0uuaw8WsxKqK5JwNkoSfx71i0sn22Z6EMQFdkb-B0PF11Wk6PbeHoLEl7ewUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekuddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekgedt
    gfdvieehhfehtddvleeiieeuteevheetffejjeejvdeijeevhfeufeefgeenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:i7lIY5gg7b51qGyowamqAT8kDodNnANEANIpCtp0tROO2dqf3cDuZw>
    <xmx:i7lIYxA1o25I9DlGi1g6sXMsWqPpwbAu40VWpAVpPz62ruakDMPh6Q>
    <xmx:i7lIYyKU0AiDOxDNxpNmhylDt5gnCO_amNM2AdVGGTeifiunSm97VQ>
    <xmx:i7lIY89nvLP7Qmxlh36bpWJ_3aDc2VsUxtD7We5uy-_X_jz3xAnctQ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 21:21:14 -0400 (EDT)
Date:   Fri, 14 Oct 2022 03:21:10 +0200
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind
Message-ID: <Y0i5h9Tx/1mxvh9A@mail-itl>
References: <Yw6r7FxMCCYSzfTk@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WH2MxWp6fPQ9u09x"
Content-Disposition: inline
In-Reply-To: <Yw6r7FxMCCYSzfTk@mail-itl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--WH2MxWp6fPQ9u09x
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Oct 2022 03:21:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind

On Wed, Aug 31, 2022 at 02:31:23AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hello,
>=20
> I hit a kernel crash when unbinding xhci-pci from the PCI device (via
> sysfs write). I can trigger the issue at least on 5.19.2 and 6.0-rc3.
> Interestingly, the same kernel does not crash on another machine while
> doing the same, so it might depends on specific devices being connected.

I did some more digging, and the issue is definitely much older, I can
see it in 5.10.112 too. It simply happen to be found with
init_on_free=3D1, which I changed about the same time (and forgot about
it).

> The specific message I get is this:
>=20
>   ehci-pci 0000:00:06.0: remove, state 1
>   usb usb4: USB disconnect, device number 1
>   usb 4-1: USB disconnect, device number 2
>   usb 4-1.5: USB disconnect, device number 3
>   ehci-pci 0000:00:06.0: USB bus 4 deregistered
>   ehci-pci 0000:00:07.0: remove, state 1
>   usb usb5: USB disconnect, device number 1
>   usb 5-1: USB disconnect, device number 2
>   usb 5-1.2: USB disconnect, device number 3
>   usb 5-1.4: USB disconnect, device number 4
>   usb 5-1.5: USB disconnect, device number 5
>   usb 5-1.6: USB disconnect, device number 6
>   ehci-pci 0000:00:07.0: USB bus 5 deregistered
>   xhci_hcd 0000:00:08.0: remove, state 4
>   usb usb3: USB disconnect, device number 1
>   xhci_hcd 0000:00:08.0: USB bus 3 deregistered
>   xhci_hcd 0000:00:08.0: remove, state 1
>   usb usb2: USB disconnect, device number 1
>   usb 2-4: USB disconnect, device number 2
>   cdc_mbim 2-4:1.6 wws8u4i6: unregister 'cdc_mbim' usb-0000:00:08.0-4, CD=
C MBIM
>   xhci_hcd 0000:00:08.0: Slot 1 endpoint 8 not removed from BW list!
>   xhci_hcd 0000:00:08.0: Slot 1 endpoint 12 not removed from BW list!
>   xhci_hcd 0000:00:08.0: Slot 1 endpoint 14 not removed from BW list!
>   xhci_hcd 0000:00:08.0: Slot 1 endpoint 16 not removed from BW list!
>   xhci_hcd 0000:00:08.0: Slot 1 endpoint 18 not removed from BW list!
>   xhci_hcd 0000:00:08.0: Slot 1 endpoint 20 not removed from BW list!

This seems to be highly related. The related code is
(drivers/usb/host/xhci-mem.c):

 860 void xhci_free_virt_device(struct xhci_hcd *xhci, int slot_id)
 861 {
(...)
 870     dev =3D xhci->devs[slot_id];
(...)
 892         if (!list_empty(&dev->eps[i].bw_endpoint_list))
 893             xhci_warn(xhci, "Slot %u endpoint %u "
 894                     "not removed from BW list!\n",
 895                     slot_id, i);
(...)
 909     kfree(xhci->devs[slot_id]);
 910     xhci->devs[slot_id] =3D NULL;
 911 }

So, it does kfree() a list that is connected somewhere.

I can trigger the issue by unbinding xhci_hcd from just this device.
This is an USB controller to which internal WWAN adapter is connected,
and nothing else. I can still trigger the crash, if I prevent relevant
driver(s) from ever loading, so the issue is clearly somewhere in xhci
core. Adding XHCI maintainer to the recipients.

BTW, the call trace to the above warning is (collected on different
kernel version than the other one...):

  usb_disconnect+0x212/0x290
  usb_disconnect+0xc8/0x290
  usb_remove_hcd+0xdf/0x1d3
  usb_hcd_pci_remove+0x74/0x100
  pci_device_remove+0x3b/0xa0
  __device_release_driver+0x181/0x250
  device_driver_detach+0x3c/0xa0
  unbind_store+0xd8/0x100
  kernfs_fop_write_iter+0x11a/0x1f0
  new_sync_write+0x150/0x1e0
  vfs_write+0x1d0/0x260
  ksys_write+0x6b/0xe0
  do_syscall_64+0x33/0x40
  entry_SYSCALL_64_after_hwframe+0x44/0xa9


>   list_del corruption, ffff935804028758->next is NULL
>   ------------[ cut here ]------------
>   kernel BUG at lib/list_debug.c:49!
>   invalid opcode: 0000 [#1] PREEMPT SMP PTI
>   CPU: 1 PID: 1211 Comm: prepare-suspend Not tainted 6.0.0-rc3-1.51.fc32.=
qubes.x86_64 #248
>   Hardware name: Xen HVM domU, BIOS 4.14.5 08/24/2022
>   RIP: 0010:__list_del_entry_valid.cold+0xf/0x6f
>   Code: c7 c7 38 de 8c ae e8 22 d2 fd ff 0f 0b 48 c7 c7 10 de 8c ae e8 14=
 d2 fd ff 0f 0b 48 89 fe 48 c7 c7 20 df 8c ae e8 03 d2 fd ff <0f> 0b 48 89 =
d1 48 c7 c7 40 e0 8c ae 4c 89 c2 e8 ef d1 fd ff 0f 0b
>   RSP: 0000:ffffb7ef817e7cd0 EFLAGS: 00010246
>   RAX: 0000000000000033 RBX: ffff935803460900 RCX: 0000000000000000
>   RDX: 0000000000000000 RSI: ffffffffae8b45a7 RDI: 00000000ffffffff
>   RBP: 0000000000000006 R08: 0000000000000000 R09: 00000000ffffdfff
>   R10: ffffb7ef817e7b78 R11: ffffffffaed46088 R12: ffff935803466260
>   R13: ffff935803460810 R14: ffff935804028758 R15: ffff935803460928
>   FS:  000076820cccd740(0000) GS:ffff935810700000(0000) knlGS:00000000000=
00000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 000075bb7d654d70 CR3: 000000000066a003 CR4: 00000000001706e0
>   Call Trace:
>    <TASK>
>    xhci_mem_cleanup+0x14c/0x520 [xhci_hcd]

This indeed iterates over
xhci->rh_bw[i].bw_table.interval_bw[j].endpoints and tries to
list_del_init() every entry.
I guess it should happen before the above xhci_free_virt_device(), but
for some reason happens after.

>    xhci_stop+0x12d/0x1b0 [xhci_hcd]
>    usb_stop_hcd+0x3b/0x57
>    usb_remove_hcd.cold+0xd0/0x159
>    usb_hcd_pci_remove+0x76/0x110
>    pci_device_remove+0x36/0xa0
>    device_release_driver_internal+0x1aa/0x230
>    unbind_store+0x11f/0x130
>    kernfs_fop_write_iter+0x124/0x1b0
>    vfs_write+0x2ff/0x400
>    ksys_write+0x67/0xe0
>    do_syscall_64+0x3b/0x90
>    entry_SYSCALL_64_after_hwframe+0x63/0xcd
>   RIP: 0033:0x76820cb3e807
>   Code: 0b 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e=
 fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 =
ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
>   RSP: 002b:00007ffe4cddb668 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>   RAX: ffffffffffffffda RBX: 000000000000000d RCX: 000076820cb3e807
>   RDX: 000000000000000d RSI: 00005b61eff10ec0 RDI: 0000000000000001
>   RBP: 00005b61eff10ec0 R08: 0000000000000000 R09: 000076820cbb14e0
>   R10: 000076820cbb13e0 R11: 0000000000000246 R12: 000000000000000d
>   R13: 000076820cbfb780 R14: 000000000000000d R15: 000076820cbf69e0
>    </TASK>
>   Modules linked in: nft_ct bnep uvcvideo videobuf2_vmalloc videobuf2_mem=
ops ath3k btusb btrtl btbcm btintel btmtk bluetooth videobuf2_v4l2 videobuf=
2_common videodev ecdh_generic rfkill mc cdc_mbim cdc_ncm cdc_ether usbnet =
mii cdc_wdm cdc_acm ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack nft_cha=
in_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_=
compat intel_rapl_msr intel_rapl_common nf_tables joydev crct10dif_pclmul n=
fnetlink crc32_pclmul ghash_clmulni_intel xhci_pci pcspkr xhci_pci_renesas =
ehci_pci xhci_hcd drm_vram_helper ehci_hcd serio_raw drm_ttm_helper ttm ata=
_generic pata_acpi i2c_piix4 floppy xen_scsiback xen_netback xen_privcmd xe=
n_gntdev xen_gntalloc xen_blkback xen_evtchn ipmi_devintf ipmi_msghandler f=
use ip_tables overlay xen_blkfront
>   ---[ end trace 0000000000000000 ]---
>   RIP: 0010:__list_del_entry_valid.cold+0xf/0x6f
>   Code: c7 c7 38 de 8c ae e8 22 d2 fd ff 0f 0b 48 c7 c7 10 de 8c ae e8 14=
 d2 fd ff 0f 0b 48 89 fe 48 c7 c7 20 df 8c ae e8 03 d2 fd ff <0f> 0b 48 89 =
d1 48 c7 c7 40 e0 8c ae 4c 89 c2 e8 ef d1 fd ff 0f 0b
>   RSP: 0000:ffffb7ef817e7cd0 EFLAGS: 00010246
>   RAX: 0000000000000033 RBX: ffff935803460900 RCX: 0000000000000000
>   RDX: 0000000000000000 RSI: ffffffffae8b45a7 RDI: 00000000ffffffff
>   RBP: 0000000000000006 R08: 0000000000000000 R09: 00000000ffffdfff
>   R10: ffffb7ef817e7b78 R11: ffffffffaed46088 R12: ffff935803466260
>   R13: ffff935803460810 R14: ffff935804028758 R15: ffff935803460928
>   FS:  000076820cccd740(0000) GS:ffff935810700000(0000) knlGS:00000000000=
00000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 000075bb7d654d70 CR3: 000000000066a003 CR4: 00000000001706e0
>   Kernel panic - not syncing: Fatal exception
>   Kernel Offset: 0x2c000000 from 0xffffffff81000000 (relocation range: 0x=
ffffffff80000000-0xffffffffbfffffff)
>=20
> USB devices present in the system:
>=20
> /:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 5000M
> /:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
>     |__ Port 4: Dev 2, If 0, Class=3DCommunications, Driver=3D, 480M
>     |__ Port 4: Dev 2, If 1, Class=3DCommunications, Driver=3Dcdc_acm, 48=
0M
>     |__ Port 4: Dev 2, If 2, Class=3DCDC Data, Driver=3Dcdc_acm, 480M
>     |__ Port 4: Dev 2, If 3, Class=3DCommunications, Driver=3Dcdc_acm, 48=
0M
>     |__ Port 4: Dev 2, If 4, Class=3DCDC Data, Driver=3Dcdc_acm, 480M
>     |__ Port 4: Dev 2, If 5, Class=3DCommunications, Driver=3Dcdc_wdm, 48=
0M
>     |__ Port 4: Dev 2, If 6, Class=3DCommunications, Driver=3Dcdc_mbim, 4=
80M
>     |__ Port 4: Dev 2, If 7, Class=3DCDC Data, Driver=3Dcdc_mbim, 480M
>     |__ Port 4: Dev 2, If 8, Class=3DCommunications, Driver=3Dcdc_wdm, 48=
0M
>     |__ Port 4: Dev 2, If 9, Class=3DCommunications, Driver=3Dcdc_acm, 48=
0M
>     |__ Port 4: Dev 2, If 10, Class=3DCDC Data, Driver=3Dcdc_acm, 480M
> /:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/6p, 480M
>         |__ Port 2: Dev 3, If 1, Class=3DChip/SmartCard, Driver=3D, 12M
>         |__ Port 2: Dev 3, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 12M
>         |__ Port 4: Dev 4, If 2, Class=3DVendor Specific Class, Driver=3D=
btusb, 12M
>         |__ Port 4: Dev 4, If 0, Class=3DVendor Specific Class, Driver=3D=
btusb, 12M
>         |__ Port 4: Dev 4, If 3, Class=3DApplication Specific Interface, =
Driver=3D, 12M
>         |__ Port 4: Dev 4, If 1, Class=3DVendor Specific Class, Driver=3D=
btusb, 12M
>         |__ Port 5: Dev 5, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
>         |__ Port 5: Dev 5, If 0, Class=3DWireless, Driver=3Dbtusb, 12M
>         |__ Port 6: Dev 6, If 0, Class=3DVideo, Driver=3Duvcvideo, 480M
>         |__ Port 6: Dev 6, If 1, Class=3DVideo, Driver=3Duvcvideo, 480M
> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/3p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
>         |__ Port 5: Dev 3, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 480M
>         |__ Port 5: Dev 3, If 1, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 480M
> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/6p, 480M
>     |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, Driver=3Dusb=
hid, 480M

lsusb -v of relevant devices can be seen here: https://gist.github.com/marm=
arek/fe87a1e7339acb60a40d1ef5f598736d

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WH2MxWp6fPQ9u09x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNIuYcACgkQ24/THMrX
1yxXswf/RsN+OuOlggyC1QkDhjEt9P1OrFGwi1wIyPUjXOrVc21PCtgA+k8RmF1l
Wx7ZEZYx0DdwpUSjS84O6Q6lpmEJUgqaUMwxzHIWq6m6AYUiwVcAWkGfB6Z/B9vR
4l0T48Qu+R+j5aoQlVqlN3Y5IrnX8+TGs5f2EABmtEQFD9KRiqQ3da7TLkea0y6e
bTcedxhxD14UI4nFXobhtpSCi5hPrCpMrOQAfY9nOVTATOGWXzyW5eNYiVZKXT2L
qiVvvM3RyNr03XI4dGXxBLp+3b3n3YUoYpFbUd8WW/95niCpI9Wu8PhcTu4D9cO4
XG7HkVQF/jmra5PIzZDfngNWE3D2UQ==
=JsF4
-----END PGP SIGNATURE-----

--WH2MxWp6fPQ9u09x--
