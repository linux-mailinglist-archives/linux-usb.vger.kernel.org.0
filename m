Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A721292249
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 07:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgJSFpT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 01:45:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:51824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgJSFpT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 01:45:19 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 156E822243;
        Mon, 19 Oct 2020 05:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603086318;
        bh=tqx8C5QiX1YPuXmAFWwZoM3QwayENyYEjbG+LwEdMcY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XYCkF8j/hr3G6WcB+/l5yYfOvEuCbxP6b50Xx/LbOKTIDmyZYuj1+A9JCIKpdCPbu
         p2zW304A6oEmDy3m2gBknuHnNtYs87XtNG8NyGlfd1MSkTnQ7kRuiZGPmClT2WcKPa
         DvJDG5tXOfTP2OkjgTmRGqTSbBNhacm4ZyvU1s2A=
From:   Felipe Balbi <balbi@kernel.org>
To:     Ferry Toth <fntoth@gmail.com>, linux-usb@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     felipe.balbi@linux.intel.com
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
In-Reply-To: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
Date:   Mon, 19 Oct 2020 08:45:10 +0300
Message-ID: <87a6wig461.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Andy,

Ferry Toth <fntoth@gmail.com> writes:
> This occurs with edison-arduino board, that has a nifty switch allowing=20
> to switch between gadget/host mode. In host mode it boot fine, then=20
> crashes when I flip the switch to gadget.
>
> The below trace if what I get from the console when booting with gadget=20
> mode selected.
>
> The last kernel is used where everything is obviously working fine is 5.6=
.0.
>
> The kernel is built specifically for the platform, nothing suspcious=20
> going on the the dwc3 area, see=20
> https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>
> Magic signature found
>
> Starting kernel ...
>
> [    2.395631] Initramfs unpacking failed: invalid magic at start of=20
> compressed archive
> Scanning for Btrfs filesystems
> Starting version 243.2+
> Kernel with acpi enabled detected
> Loading acpi tables
> Waiting for root device /dev/mmcblk0p8
>    10Found device '/run/media/mmcblk0p8'
>    9Init found, booting...
> [   10.834272] brcmfmac: brcmf_fw_alloc_request: using=20
> brcm/brcmfmac43340-sdio for chip BCM43340/2
> [   11.179662] brcmfmac: brcmf_fw_alloc_request: using=20
> brcm/brcmfmac43340-sdio for chip BCM43340/2
> [   11.194223] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available=
=20
> (err=3D-2), device may have limited channels available
> [   11.234779] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43340/2=20
> wl0: Oct 23 2017 08:41:23 version 6.10.190.70 (r674464) FWID 01-98d71006
> [   12.401620] BUG: unable to handle page fault for address:=20
> 0000000100000000
> [   12.408496] #PF: supervisor instruction fetch in kernel mode
> [   12.414145] #PF: error_code(0x0010) - not-present page
> [   12.419276] PGD 0 P4D 0
> [   12.421817] Oops: 0010 [#1] SMP PTI
> [   12.425307] CPU: 0 PID: 488 Comm: irq/15-dwc3 Not tainted=20
> 5.9.0-edison-acpi-standard #1
> [   12.433297] Hardware name: Intel Corporation Merrifield/BODEGA BAY,=20
> BIOS 542 2015.01.21:18.19.48
> [   12.442075] RIP: 0010:0x100000000
> [   12.445382] Code: Bad RIP value.
> [   12.448605] RSP: 0000:ffff9a95403fbbf8 EFLAGS: 00010046
> [   12.453827] RAX: 0000000100000000 RBX: ffff8ee8bd32f828 RCX:=20
> ffff8ee8bacc4000
> [   12.460950] RDX: 00000000ffffff94 RSI: ffff8ee8bc01a5a0 RDI:=20
> ffff8ee887228700
> [   12.468075] RBP: ffff8ee8bc01a5a0 R08: 0000000000000046 R09:=20
> 0000000000000238
> [   12.475199] R10: 0000000000000004 R11: ffff8ee8ba8ba248 R12:=20
> ffff8ee887228700
> [   12.482322] R13: ffff8ee8bd32f828 R14: 0000000000000002 R15:=20
> ffff8ee8bae93200
> [   12.489449] FS:  0000000000000000(0000) GS:ffff8ee8be200000(0000)=20
> knlGS:0000000000000000
> [   12.497524] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   12.503262] CR2: 0000000100000000 CR3: 000000003c5ae000 CR4:=20
> 00000000001006f0
> [   12.510382] Call Trace:
> [   12.512841]  ? dwc3_gadget_giveback+0xbf/0x120
> [   12.517286]  ? __dwc3_gadget_ep_disable+0xc5/0x250
> [   12.522077]  ? dwc3_gadget_ep_disable+0x3d/0xd0
> [   12.526608]  ? usb_ep_disable+0x1d/0x80
> [   12.530451]  ? u_audio_stop_capture+0x87/0x9a [u_audio]
> [   12.535680]  ? afunc_set_alt+0x73/0x80 [usb_f_uac2]
> [   12.540562]  ? composite_setup+0x20f/0x1b20 [libcomposite]
> [   12.546053]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
> [   12.552060]  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
> [   12.558062]  ? dwc3_ep0_delegate_req+0x24/0x40
> [   12.562502]  ? dwc3_ep0_interrupt+0x40a/0x9d8
> [   12.566858]  ? dwc3_thread_interrupt+0x880/0xf70
> [   12.571475]  ? __schedule+0x3ee/0x640
> [   12.575143]  ? irq_forced_thread_fn+0x70/0x70
> [   12.579497]  ? irq_thread_fn+0x1b/0x60
> [   12.583245]  ? irq_thread+0xd3/0x150
> [   12.586821]  ? wake_threads_waitq+0x30/0x30
> [   12.591001]  ? irq_thread_dtor+0x80/0x80
> [   12.594925]  ? kthread+0xf9/0x130
> [   12.598238]  ? kthread_park+0x80/0x80
> [   12.601901]  ? ret_from_fork+0x22/0x30
> [   12.605644] Modules linked in: spi_pxa2xx_platform dw_dmac usb_f_uac2=
=20
> u_audio usb_f_mass_storage usb_f_eem u_ether usb_f_serial u_serial=20
> libcomposite pwm_lpss_pci snd_sof_pci snd_sof_intel_byt pwm_lpss=20
> snd_sof_intel_ipc snd_sof_xtensa_dsp intel_mrfld_pwrbtn intel_mrfld_adc=20
> snd_sof snd_sof_nocodec snd_soc_acpi spi_pxa2xx_pci brcmfmac brcmutil=20
> leds_gpio hci_uart btbcm ti_ads7950 industrialio_triggered_buffer=20
> kfifo_buf spidev ledtrig_heartbeat mmc_block extcon_intel_mrfld=20
> sdhci_pci cqhci sdhci led_class mmc_core intel_soc_pmic_mrfld btrfs=20
> libcrc32c xor zstd_compress zlib_deflate raid6_pq
> [   12.657416] CR2: 0000000100000000
> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---

It this something you can reproduce on your end? Ferry, can you get dwc3
trace logs when this happens? ftrace_dump_on_oops may help here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+NJ+YRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQajYBAAxSqoYw3eV/NYOiv26iUEJIAJXqeEmgct
OOB6Xd0fX9jZe3/PaMfFC0Y8ZIVQa6i4JEr98LY7K+QKYRk4+/PRX9Shz66GSelF
P7XDImZaKaL5iLRVP+B5T19cQkx9spwjnos1UpZB5HwOHn+/K/2JvKawGG+7KNPH
11bb167CmQPRXetGl7L3wGFZlTMD/SdVo103cJlx/Lnb44DmOHtLtyM6Onyx+YPV
i4p5wSDEDe5Teez0k/QmRvJu0PiIf+tHk0xtWBLrISPdmQ9ALPRWq62jop9PHKiP
pa5n+U+EG0IzTMHXZoN+B9KCSlkqSWjJynnrx14rMSPTt7L04d+QqkD1sgdrtHnQ
vVqDRK3SC3DWrCV/RDvwOb/UT09oa9IS4Nrz/XlBT2r9WtWyRkB1fb+U38caomXJ
2DOELQhwHaPzhM406byc7LYsbqeut17mlZ68vlHFn3J1WI5hJ+32oaflQtdfmO4A
+MuSvfoPLVgfPss+C8N6AdUH06nFmzy7XRO21MkJ9UHrqYe9UTDT4ZxE1dDkV8b3
zq5v+OiU7mwW3oTDjWal83n5NVZmDc6aLu7sMXg7t9xA5PZe91bTXDagMEZ2wMl3
Bxvj8aQIpFdABpNQozfc+urVmHtxt3wQboe4o1TVlZbZOj6ltYgQjdW/ueHvuYGq
8imNrd9DdsE=
=N13A
-----END PGP SIGNATURE-----
--=-=-=--
