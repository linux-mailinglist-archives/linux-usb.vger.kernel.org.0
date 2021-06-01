Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF1639716A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 12:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhFAK37 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 06:29:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:5229 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230170AbhFAK37 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 06:29:59 -0400
IronPort-SDR: pOBGN6DY+hrJA2TJ/zbP0p3E7ukRmZobDDuvVW7psREhjMEfE5iaxOE5ZbbX9GXutd+TklRttL
 VzeK0uwET9Fw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203323852"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="203323852"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 03:28:18 -0700
IronPort-SDR: NZFYa7VIGEKb1cX9HkEYjG8/nSLk7j4oVQNUJI53p0+ROejWRqEuyXXKfn5i+tqNok47ypFzCH
 jd69rXqL3/ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="549688474"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 01 Jun 2021 03:28:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jun 2021 13:28:15 +0300
Date:   Tue, 1 Jun 2021 13:28:15 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     USB <linux-usb@vger.kernel.org>
Subject: Re: DWC3 (PCI) software node double free on shutdown
Message-ID: <YLYLv+ozHCHhkfUM@kuha.fi.intel.com>
References: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 01, 2021 at 12:50:18PM +0300, Andy Shevchenko wrote:
> >From time to time I see this on shutdown.
> I suspect this happens due to the device core trying to remove
> software nodes when it should not.

Yes, this is caused by the device_remove_properties() call in
device_del(). We can't remove that quite yet unfortunately.

Can you test if this fixes the problem:

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index ce5e6f6711f79..f96630bd7a169 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -298,6 +298,7 @@ EXPORT_SYMBOL_GPL(ulpi_register_interface);
  */
 void ulpi_unregister_interface(struct ulpi *ulpi)
 {
+       ACPI_COMPANION_SET(&ulpi->dev, NULL);
        of_node_put(ulpi->dev.of_node);
        device_unregister(&ulpi->dev);
 }


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
> [  238.371752] RAX: 0000000000000000 RBX: ffff8ca40ad78440 RCX: 00000000ffffdfff
> [  238.379164] RDX: 00000000ffffdfff RSI: 00000000ffffffea RDI: 0000000000000000
> [  238.386628] RBP: ffff8ca40ad76018 R08: ffffffffb2b517a8 R09: 0000000000009ffb
> [  238.394061] R10: 00000000ffffe000 R11: 3fffffffffffffff R12: ffff8ca402cecb80
> [  238.401480] R13: ffff8ca40ad78400 R14: 0000000000000000 R15: 0000000000000000
> [  238.408894] FS:  0000000000000000(0000) GS:ffff8ca43e300000(0063)
> knlGS:00000000f7f9a690
> [  238.417296] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [  238.423284] CR2: 0000000056a400dc CR3: 0000000002f36000 CR4: 00000000001006e0
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
> [  238.523763] RAX: ffffffffffffffda RBX: 00000000fee1dead RCX: 0000000028121969
> [  238.531228] RDX: 0000000001234567 RSI: 000000000000000f RDI: 00000000566701a0
> [  238.538642] RBP: 00000000566701a0 R08: 0000000000000000 R09: 0000000000000000
> [  238.546055] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [  238.553464] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [  238.560952] ---[ end trace 1339144ac23765f6 ]---
> [  238.566393] ------------[ cut here ]------------
> [  238.571290] refcount_t: underflow; use-after-free.
> [  238.576360] WARNING: CPU: 0 PID: 257 at lib/refcount.c:28
> refcount_warn_saturate+0xa6/0xf0
> ...
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
heikki
