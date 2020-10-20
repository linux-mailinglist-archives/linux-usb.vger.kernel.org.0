Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F663293BBA
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 14:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406216AbgJTMfR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 08:35:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406091AbgJTMfQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 08:35:16 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C6DC222C8;
        Tue, 20 Oct 2020 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603197315;
        bh=H5CFiU9RpT16KatgEvD8smYvAamH6xc5ZcoMYmzh5Sg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=0wS19iuMPtbzhSdBiPRNPl6v1NAzMgy6GupAmThWkpIRojLzwuDxsKStVFFIX63qE
         uexfQK9HQTnBK1yTupn67emZulWJJUPLw7IA0dJVp2/8Ouc3qNgWJlFb3ePX36+M+z
         si5cOmxJK5QigZxJlwCpKFC38nmCDoaX+2Pc6RGg=
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>, linux-usb@vger.kernel.org
Cc:     felipe.balbi-VuQAYsv1563Yd54FQh9/CA-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
In-Reply-To: <a45db8d2-6902-7ec7-cab2-1436209a15a6@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org>
 <b23536fb-13d4-e1b5-2b61-c8f9d4dbcef8@gmail.com>
 <a45db8d2-6902-7ec7-cab2-1436209a15a6@gmail.com>
Date:   Tue, 20 Oct 2020 15:35:08 +0300
Message-ID: <871rhtf537.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ferry Toth <fntoth@gmail.com> writes:

Hi,

> Op 19-10-2020 om 09:14 schreef Ferry Toth:
>> Op 19-10-2020 om 07:45 schreef Felipe Balbi:
>>>
>>> Hi Andy,
>>>
>>> Ferry Toth <fntoth@gmail.com> writes:
>>>> This occurs with edison-arduino board, that has a nifty switch allowing
>>>> to switch between gadget/host mode. In host mode it boot fine, then
>>>> crashes when I flip the switch to gadget.
>>>>
>>>> The below trace if what I get from the console when booting with gadget
>>>> mode selected.
>>>>
>>>> The last kernel is used where everything is obviously working fine is=
=20
>>>> 5.6.0.
>>>>
>>>> The kernel is built specifically for the platform, nothing suspcious
>>>> going on the the dwc3 area, see
>>>> https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>>>>
>>>> Magic signature found
>>>>
>>>> Starting kernel ...
>>>>
>>>> [=C2=A0=C2=A0=C2=A0 2.395631] Initramfs unpacking failed: invalid magi=
c at start of
>>>> compressed archive
>>>> Scanning for Btrfs filesystems
>>>> Starting version 243.2+
>>>> Kernel with acpi enabled detected
>>>> Loading acpi tables
>>>> Waiting for root device /dev/mmcblk0p8
>>>> =C2=A0=C2=A0=C2=A0 10Found device '/run/media/mmcblk0p8'
>>>> =C2=A0=C2=A0=C2=A0 9Init found, booting...
>>>> [=C2=A0=C2=A0 10.834272] brcmfmac: brcmf_fw_alloc_request: using
>>>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>>>> [=C2=A0=C2=A0 11.179662] brcmfmac: brcmf_fw_alloc_request: using
>>>> brcm/brcmfmac43340-sdio for chip BCM43340/2
>>>> [=C2=A0=C2=A0 11.194223] brcmfmac: brcmf_c_process_clm_blob: no clm_bl=
ob available
>>>> (err=3D-2), device may have limited channels available
>>>> [=C2=A0=C2=A0 11.234779] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BC=
M43340/2
>>>> wl0: Oct 23 2017 08:41:23 version 6.10.190.70 (r674464) FWID 01-98d710=
06
>>>> [=C2=A0=C2=A0 12.401620] BUG: unable to handle page fault for address:
>>>> 0000000100000000
>>>> [=C2=A0=C2=A0 12.408496] #PF: supervisor instruction fetch in kernel m=
ode
>>>> [=C2=A0=C2=A0 12.414145] #PF: error_code(0x0010) - not-present page
>>>> [=C2=A0=C2=A0 12.419276] PGD 0 P4D 0
>>>> [=C2=A0=C2=A0 12.421817] Oops: 0010 [#1] SMP PTI
>>>> [=C2=A0=C2=A0 12.425307] CPU: 0 PID: 488 Comm: irq/15-dwc3 Not tainted
>>>> 5.9.0-edison-acpi-standard #1
>>>> [=C2=A0=C2=A0 12.433297] Hardware name: Intel Corporation Merrifield/B=
ODEGA BAY,
>>>> BIOS 542 2015.01.21:18.19.48
>>>> [=C2=A0=C2=A0 12.442075] RIP: 0010:0x100000000
>>>> [=C2=A0=C2=A0 12.445382] Code: Bad RIP value.
>>>> [=C2=A0=C2=A0 12.448605] RSP: 0000:ffff9a95403fbbf8 EFLAGS: 00010046
>>>> [=C2=A0=C2=A0 12.453827] RAX: 0000000100000000 RBX: ffff8ee8bd32f828 R=
CX:
>>>> ffff8ee8bacc4000
>>>> [=C2=A0=C2=A0 12.460950] RDX: 00000000ffffff94 RSI: ffff8ee8bc01a5a0 R=
DI:
>>>> ffff8ee887228700
>>>> [=C2=A0=C2=A0 12.468075] RBP: ffff8ee8bc01a5a0 R08: 0000000000000046 R=
09:
>>>> 0000000000000238
>>>> [=C2=A0=C2=A0 12.475199] R10: 0000000000000004 R11: ffff8ee8ba8ba248 R=
12:
>>>> ffff8ee887228700
>>>> [=C2=A0=C2=A0 12.482322] R13: ffff8ee8bd32f828 R14: 0000000000000002 R=
15:
>>>> ffff8ee8bae93200
>>>> [=C2=A0=C2=A0 12.489449] FS:=C2=A0 0000000000000000(0000) GS:ffff8ee8b=
e200000(0000)
>>>> knlGS:0000000000000000
>>>> [=C2=A0=C2=A0 12.497524] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>>>> [=C2=A0=C2=A0 12.503262] CR2: 0000000100000000 CR3: 000000003c5ae000 C=
R4:
>>>> 00000000001006f0
>>>> [=C2=A0=C2=A0 12.510382] Call Trace:
>>>> [=C2=A0=C2=A0 12.512841]=C2=A0 ? dwc3_gadget_giveback+0xbf/0x120
>>>> [=C2=A0=C2=A0 12.517286]=C2=A0 ? __dwc3_gadget_ep_disable+0xc5/0x250
>>>> [=C2=A0=C2=A0 12.522077]=C2=A0 ? dwc3_gadget_ep_disable+0x3d/0xd0
>>>> [=C2=A0=C2=A0 12.526608]=C2=A0 ? usb_ep_disable+0x1d/0x80
>>>> [=C2=A0=C2=A0 12.530451]=C2=A0 ? u_audio_stop_capture+0x87/0x9a [u_aud=
io]
>>>> [=C2=A0=C2=A0 12.535680]=C2=A0 ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>>> [=C2=A0=C2=A0 12.540562]=C2=A0 ? composite_setup+0x20f/0x1b20 [libcomp=
osite]
>>>> [=C2=A0=C2=A0 12.546053]=C2=A0 ? configfs_composite_setup+0x6b/0x90 [l=
ibcomposite]
>>>> [=C2=A0=C2=A0 12.552060]=C2=A0 ? configfs_composite_setup+0x6b/0x90 [l=
ibcomposite]
>>>> [=C2=A0=C2=A0 12.558062]=C2=A0 ? dwc3_ep0_delegate_req+0x24/0x40
>>>> [=C2=A0=C2=A0 12.562502]=C2=A0 ? dwc3_ep0_interrupt+0x40a/0x9d8
>>>> [=C2=A0=C2=A0 12.566858]=C2=A0 ? dwc3_thread_interrupt+0x880/0xf70
>>>> [=C2=A0=C2=A0 12.571475]=C2=A0 ? __schedule+0x3ee/0x640
>>>> [=C2=A0=C2=A0 12.575143]=C2=A0 ? irq_forced_thread_fn+0x70/0x70
>>>> [=C2=A0=C2=A0 12.579497]=C2=A0 ? irq_thread_fn+0x1b/0x60
>>>> [=C2=A0=C2=A0 12.583245]=C2=A0 ? irq_thread+0xd3/0x150
>>>> [=C2=A0=C2=A0 12.586821]=C2=A0 ? wake_threads_waitq+0x30/0x30
>>>> [=C2=A0=C2=A0 12.591001]=C2=A0 ? irq_thread_dtor+0x80/0x80
>>>> [=C2=A0=C2=A0 12.594925]=C2=A0 ? kthread+0xf9/0x130
>>>> [=C2=A0=C2=A0 12.598238]=C2=A0 ? kthread_park+0x80/0x80
>>>> [=C2=A0=C2=A0 12.601901]=C2=A0 ? ret_from_fork+0x22/0x30
>>>> [=C2=A0=C2=A0 12.605644] Modules linked in: spi_pxa2xx_platform dw_dma=
c usb_f_uac2
>>>> u_audio usb_f_mass_storage usb_f_eem u_ether usb_f_serial u_serial
>>>> libcomposite pwm_lpss_pci snd_sof_pci snd_sof_intel_byt pwm_lpss
>>>> snd_sof_intel_ipc snd_sof_xtensa_dsp intel_mrfld_pwrbtn intel_mrfld_adc
>>>> snd_sof snd_sof_nocodec snd_soc_acpi spi_pxa2xx_pci brcmfmac brcmutil
>>>> leds_gpio hci_uart btbcm ti_ads7950 industrialio_triggered_buffer
>>>> kfifo_buf spidev ledtrig_heartbeat mmc_block extcon_intel_mrfld
>>>> sdhci_pci cqhci sdhci led_class mmc_core intel_soc_pmic_mrfld btrfs
>>>> libcrc32c xor zstd_compress zlib_deflate raid6_pq
>>>> [=C2=A0=C2=A0 12.657416] CR2: 0000000100000000
>>>> [=C2=A0=C2=A0 12.660729] ---[ end trace 9b92dea6da33c71e ]---
>>>
>>> It this something you can reproduce on your end? Ferry, can you get dwc3
>>> trace logs when this happens? ftrace_dump_on_oops may help here.
>>>
>> I will do that tonight. Is flipping on ftrace_dump_on_oops sufficient or=
=20
>> do I need to do more?
>>=20
>> BTW after posting this I found in host mode dwc3 is not working properly=
=20
>> either. No oops, but no driver get loaded on device plug in.
>>=20
> Not sure if this is what you are looking for (otherwise let me know):
>
> root@edison:/proc/sys/kernel# echo 1 > ftrace_dump_on_oops
> ## flip the switch from host to gadget
> root@edison:/proc/sys/kernel# [  515.866590] BUG: kernel NULL pointer=20
> dereference, address: 0000000000000000
> [  515.873553] #PF: supervisor read access in kernel mode
> [  515.878682] #PF: error_code(0x0000) - not-present page
> [  515.883814] PGD 0 P4D 0
> [  515.886352] Oops: 0000 [#1] SMP PTI
> [  515.889844] CPU: 0 PID: 490 Comm: irq/15-dwc3 Not tainted=20
> 5.9.0-edison-acpi-standard #1
> [  515.897836] Hardware name: Intel Corporation Merrifield/BODEGA BAY,=20
> BIOS 542 2015.01.21:18.19.48
> [  515.906621] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0

what do you get with:

$ gdb vmlinux
(gdb) l *(dwc3_gadget_ep_dequeue+0x41)

??

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+O2XwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ6UA//UVkDS6o3y7JKUFMBkwBmuz7FS+Hj3ARk
r5hC5fe3iXaqVE6IFQtJPiRzp9448N39G9hzMrJGB4d+lyQCqY8M8hsftbg+cKCX
hBMxUJFKler7ZHNHEx+e2RWh0gBnUhfbxsU1B1FlMniPP2IwIbt9cUsPlFlbnd4c
UYGfBazylFUFWs8QNqFwUZyELpU3GHUkfE1ozXYEw7qLQ/PHyLC/OzOc8Qp4BNFo
hOp7G2hfvlU8Rz0rHXmi3RdyoD+p//kLrF1WedXpHWvMEe/4LuvpnOrmaHs8siJi
yhhm7cRa91FgQfUHiawLbNKuYAyndu8JSSvBnfYCaeFZq941EGbdVxYz/sgr6P8z
+IbMqlWw7jQ8Sqsr44pdJ045+AJaQojVRKU3df8uf5kgMftRCZ+2H6IHoBWtonWu
0RG72DgEaVWt17idiJpCYs1R0Ce4hCeZxbNOgAC0y+ItFTESs0hSycCfC1Bkv41k
pJkTgseoanbIACvFvsK/IId4tYPxfdFHlL19gI2FBYU79Yl0+A4bmTInvL5xoc7B
Jv8jeCs6Py1/rgAF6Ks4sWy65mSwGdKRnGQMENrDfv+KA2TPMNdCFLbXxsDMq6/u
KLjB4JJ2TuM1GfUybEHQPtxZwLX5buqpRvB/05BWHt3/NOxjWHn5WF/KwLU6Ut08
zrMKi19/cS4=
=IFwX
-----END PGP SIGNATURE-----
--=-=-=--
