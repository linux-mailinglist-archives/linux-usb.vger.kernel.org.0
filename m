Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4F239A37F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 16:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhFCOla (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 10:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230365AbhFCOla (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 10:41:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4FE3613F1;
        Thu,  3 Jun 2021 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622731185;
        bh=FLRCeH+wA6+8dvbAZtVroAMqgWmWoiAWdHt6fFzmlBs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kE+fs/yiEDKTbGno3M38uJNadf5a8gvLdIc0NUhQkULTj4ubDrXEXTX/CUzkl2bN7
         ubZ//XIvlPBFinp5uda13VxJI4UDeyDDsjboVtyqJsqCWZUBPaTOu4HoVKYRQHCcOR
         1BYTbvWBvkdS8LdZ8hTZjU5EmCmmzxQe1n5R/sGZ0GteqqWvZw1xCVktktZj+IS5kx
         FMo3L3mhXA2Vq+YYQXaEYHC0Ez0QR6EBo9CfhyW7ml5McBiZX4w/zI3ZKg0XPAZbT4
         OA71Z3sinxd6PI0WyneL7b1VfUMPXzGujt3AhL2t9p4+BsCsGog60YEEflX0pu9GKe
         qPOqmOI/D++mQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Cc:     USB <linux-usb@vger.kernel.org>
Subject: Re: DWC3 (PCI) software node double free on shutdown
In-Reply-To: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
References: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
Date:   Thu, 03 Jun 2021 17:39:37 +0300
Message-ID: <874kefc8ra.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> From time to time I see this on shutdown.
> I suspect this happens due to the device core trying to remove
> software nodes when it should not.
>
>
> [  238.266524] ------------[ cut here ]------------
> [  238.271357] kernfs: can not remove 'dwc3.0.auto.ulpi', no directory
> [  238.277919] WARNING: CPU: 1 PID: 257 at fs/kernfs/dir.c:1508
> kernfs_remove_by_name_ns+0x74/0x80
> [  238.286970] Modules linked in: usb_f_eem u_ether libcomposite
> spi_dln2 i2c_dln2 gpio_dln2 dln2 brcmfmac brcmut
> il mmc_block pwm_lpss_pci pwm_lpss spi_pxa2xx_platform
> snd_sof_pci_intel_tng snd_sof_pci snd_sof_acpi_intel_byt s
> nd_sof_intel_ipc snd_sof_acpi snd_sof snd_sof_xtensa_dsp
> extcon_intel_mrfld spi_pxa2xx_pci intel_mrfld_adc sdhci_
> pci cqhci sdhci intel_mrfld_pwrbtn mmc_core intel_soc_pmic_mrfld
> hci_uart btbcm btintel
> [  238.325715] CPU: 1 PID: 257 Comm: init Not tainted 5.13.0-rc4+ #215
> [  238.332254] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
> BIOS 542 2015.01.21:18.19.48
> [  238.341363] RIP: 0010:kernfs_remove_by_name_ns+0x74/0x80
> [  238.346922] Code: 69 a3 00 31 c0 5d 41 5c 41 5d c3 48 c7 c7 80 91
> b8 b2 e8 0f 69 a3 00 b8 fe ff ff ff eb e7 48
> c7 c7 f8 d5 7e b2 e8 3b f4 9c 00 <0f> 0b b8 fe ff ff ff eb d2 0f 1f 00
> 0f 1f 44 00 00 41 57 41 56 41
> [  238.366284] RSP: 0000:ffffb2be40293cf8 EFLAGS: 00010282
> [  238.371752] RAX: 0000000000000000 RBX: ffff8ca40ad78440 RCX: 00000000f=
fffdfff
> [  238.379164] RDX: 00000000ffffdfff RSI: 00000000ffffffea RDI: 000000000=
0000000
> [  238.386628] RBP: ffff8ca40ad76018 R08: ffffffffb2b517a8 R09: 000000000=
0009ffb
> [  238.394061] R10: 00000000ffffe000 R11: 3fffffffffffffff R12: ffff8ca40=
2cecb80
> [  238.401480] R13: ffff8ca40ad78400 R14: 0000000000000000 R15: 000000000=
0000000
> [  238.408894] FS:  0000000000000000(0000) GS:ffff8ca43e300000(0063)
> knlGS:00000000f7f9a690
> [  238.417296] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [  238.423284] CR2: 0000000056a400dc CR3: 0000000002f36000 CR4: 000000000=
01006e0
> [  238.430698] Call Trace:
> [  238.433316]  software_node_notify+0x7d/0x110
> [  238.437828]  device_platform_notify+0x2c/0x70
> [  238.442422]  device_del+0x1a9/0x3e0
> [  238.446140]  device_unregister+0x16/0x60
> [  238.450279]  dwc3_ulpi_exit+0x1a/0x30
> [  238.454155]  dwc3_remove+0x6a/0x140
> [  238.457920]  device_shutdown+0x15d/0x1c0
> [  238.462070]  __do_sys_reboot.cold+0x2f/0x5b
> [  238.466495]  ? __free_one_page+0xc6/0x330
> [  238.470749]  ? __lock_acquire.constprop.0+0x27d/0x550
> [  238.476067]  ? find_held_lock+0x2b/0x80
> [  238.480124]  ? switch_fpu_return+0x48/0xf0
> [  238.484464]  do_int80_syscall_32+0x4e/0x90
> [  238.488785]  entry_INT80_compat+0x85/0x8a
> [  238.493008] RIP: 0023:0xf7f17d74
> [  238.496422] Code: 08 89 d8 5b 5e c3 53 b8 ad de e1 fe 8b 54 24 08
> b9 69 19 12 28 e8 50 d5 ff ff 81 c3 10 af 06
> 00 53 89 c3 b8 58 00 00 00 cd 80 <5b> 3d 00 f0 ff ff 76 0e 8b 93 b4 02
> 00 00 f7 d8 65 89 02 83 c8 ff
> [  238.515809] RSP: 002b:00000000ff92fa64 EFLAGS: 00000286 ORIG_RAX:
> 0000000000000058
> [  238.523763] RAX: ffffffffffffffda RBX: 00000000fee1dead RCX: 000000002=
8121969
> [  238.531228] RDX: 0000000001234567 RSI: 000000000000000f RDI: 000000005=
66701a0
> [  238.538642] RBP: 00000000566701a0 R08: 0000000000000000 R09: 000000000=
0000000
> [  238.546055] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [  238.553464] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [  238.560952] ---[ end trace 1339144ac23765f6 ]---
> [  238.566393] ------------[ cut here ]------------
> [  238.571290] refcount_t: underflow; use-after-free.
> [  238.576360] WARNING: CPU: 0 PID: 257 at lib/refcount.c:28
> refcount_warn_saturate+0xa6/0xf0
> ...

try removing dwc3_shutdown(). There's a known bug there and a revert of
the offending comming shortly.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC46akRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhkzwf/TF2rbakb/76xrPpCjtMQF2+Kn/95li8y
O93p4Xc7uVvoly9HBM7mnKFMzZy898VgOLdYDLkNodrNYm+UUInOWeEbiAfKk9Kh
yWWvkIavG2jOKRp2hu24sG4JSZK+idzUMmF2BSjftFkmIGHuMsT608NkTBq/gYyi
9T+IUd63exn5ilR9plEzf6M+k/NNW7hGK8URezGTXXE5kRczzFerSk8ihjCu63Pb
fUXLGxiRaBBBiJp+WxQGTSCIXsHAzL9+VmGFSqlFrJMGNiRyCIL5A/6fKbjPjZBm
SZ+UeHw42lgiBQ7HU8bNJpqnb8KA/BpU3KX4HtgAJWCX+YgEsFnmYA==
=E2Et
-----END PGP SIGNATURE-----
--=-=-=--
