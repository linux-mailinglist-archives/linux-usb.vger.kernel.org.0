Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A10397093
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 11:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhFAJwR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 05:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbhFAJwQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Jun 2021 05:52:16 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D73C061574
        for <linux-usb@vger.kernel.org>; Tue,  1 Jun 2021 02:50:35 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x73so3747627pfc.8
        for <linux-usb@vger.kernel.org>; Tue, 01 Jun 2021 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=C2YMnRwhPb1+ghMS2A6SpwcuKC4CKGxnt2SYwuFXxWw=;
        b=kCTjp8/6gQtfBelQJ9MWtkZpnil4Nl+ycq/sd4JkQiYbfkL3P2AbxSKMvjLW0kXU9e
         96em53W/LHxuXNdjlUPgtLU/kivqyW4si3BJspkDbBuk3npurMLfWMTDXqixI7zvLTK1
         eecPu6Z5IyJdfhqRpVPwSnpQosAvjRxvsWEcNWh9eYwnGEax3vdpKaJuFGGHlvc//YTR
         RAh+AM0vIzPqdDAuRSzqZdsiex/rYs6MvZa/l3HNw3bamXwKfz8tI12mAvSY3vAT2LRr
         frapNxY32zVwJnv8loRGBDyNL0oFo/9izufDujxRnd6SlRwJzKsmXx0OWPae/VfMMOxA
         Bizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=C2YMnRwhPb1+ghMS2A6SpwcuKC4CKGxnt2SYwuFXxWw=;
        b=FxPQsyORw1NNiOgCmQWJ6ZrY5TaQQTaLROjRSUsT5nQGN+hjblPYuH+pmqXu5g1ZGI
         aGXekoIIsj4gUfFrUhEzbjSJODYEiErdWC9jlxCZlVCgdHNc2qxFFEIwS0rX67jOp4bI
         3nPPX9MzmnARTiW6XOjJu4Kf0U1T4dGYfUQ4zyORpGQgspHmMwG1sUpQyZXUT6iRsP1H
         cDlQg+L3AnJTN1VZVNw29E3d03A7Tmf464Yxl8wo6Z78PCPnmioLUVrPvMNtwaMMWu3V
         dqY6TFx08esuY2yJWSnQBcTnU8jD84JDfGLbBdPzFHxxbsyAO2ftQT34A5iD8ctiBJBw
         pMXA==
X-Gm-Message-State: AOAM532yD9zzoJEBB45b9MsdtV1XyHP4IjzMzFiLk2cpvvJPT5qUwA3R
        3Sy5ZLWeVgh2qz81/B0IzY7JRSJpAxun1bLE7S3AwL3Fxtacgw==
X-Google-Smtp-Source: ABdhPJxSUyEvQz8/6r+dcFPaXusBpPhAQ0ttMT/Xxe7yz812nWE7zl/ziLngLT2QwhybJiibTL+vocgqf+P9YvHeUf4=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr21402615pfh.73.1622541034422; Tue, 01
 Jun 2021 02:50:34 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 1 Jun 2021 12:50:18 +0300
Message-ID: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
Subject: DWC3 (PCI) software node double free on shutdown
To:     "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Cc:     USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From time to time I see this on shutdown.
I suspect this happens due to the device core trying to remove
software nodes when it should not.


[  238.266524] ------------[ cut here ]------------
[  238.271357] kernfs: can not remove 'dwc3.0.auto.ulpi', no directory
[  238.277919] WARNING: CPU: 1 PID: 257 at fs/kernfs/dir.c:1508
kernfs_remove_by_name_ns+0x74/0x80
[  238.286970] Modules linked in: usb_f_eem u_ether libcomposite
spi_dln2 i2c_dln2 gpio_dln2 dln2 brcmfmac brcmut
il mmc_block pwm_lpss_pci pwm_lpss spi_pxa2xx_platform
snd_sof_pci_intel_tng snd_sof_pci snd_sof_acpi_intel_byt s
nd_sof_intel_ipc snd_sof_acpi snd_sof snd_sof_xtensa_dsp
extcon_intel_mrfld spi_pxa2xx_pci intel_mrfld_adc sdhci_
pci cqhci sdhci intel_mrfld_pwrbtn mmc_core intel_soc_pmic_mrfld
hci_uart btbcm btintel
[  238.325715] CPU: 1 PID: 257 Comm: init Not tainted 5.13.0-rc4+ #215
[  238.332254] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
BIOS 542 2015.01.21:18.19.48
[  238.341363] RIP: 0010:kernfs_remove_by_name_ns+0x74/0x80
[  238.346922] Code: 69 a3 00 31 c0 5d 41 5c 41 5d c3 48 c7 c7 80 91
b8 b2 e8 0f 69 a3 00 b8 fe ff ff ff eb e7 48
c7 c7 f8 d5 7e b2 e8 3b f4 9c 00 <0f> 0b b8 fe ff ff ff eb d2 0f 1f 00
0f 1f 44 00 00 41 57 41 56 41
[  238.366284] RSP: 0000:ffffb2be40293cf8 EFLAGS: 00010282
[  238.371752] RAX: 0000000000000000 RBX: ffff8ca40ad78440 RCX: 00000000ffffdfff
[  238.379164] RDX: 00000000ffffdfff RSI: 00000000ffffffea RDI: 0000000000000000
[  238.386628] RBP: ffff8ca40ad76018 R08: ffffffffb2b517a8 R09: 0000000000009ffb
[  238.394061] R10: 00000000ffffe000 R11: 3fffffffffffffff R12: ffff8ca402cecb80
[  238.401480] R13: ffff8ca40ad78400 R14: 0000000000000000 R15: 0000000000000000
[  238.408894] FS:  0000000000000000(0000) GS:ffff8ca43e300000(0063)
knlGS:00000000f7f9a690
[  238.417296] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  238.423284] CR2: 0000000056a400dc CR3: 0000000002f36000 CR4: 00000000001006e0
[  238.430698] Call Trace:
[  238.433316]  software_node_notify+0x7d/0x110
[  238.437828]  device_platform_notify+0x2c/0x70
[  238.442422]  device_del+0x1a9/0x3e0
[  238.446140]  device_unregister+0x16/0x60
[  238.450279]  dwc3_ulpi_exit+0x1a/0x30
[  238.454155]  dwc3_remove+0x6a/0x140
[  238.457920]  device_shutdown+0x15d/0x1c0
[  238.462070]  __do_sys_reboot.cold+0x2f/0x5b
[  238.466495]  ? __free_one_page+0xc6/0x330
[  238.470749]  ? __lock_acquire.constprop.0+0x27d/0x550
[  238.476067]  ? find_held_lock+0x2b/0x80
[  238.480124]  ? switch_fpu_return+0x48/0xf0
[  238.484464]  do_int80_syscall_32+0x4e/0x90
[  238.488785]  entry_INT80_compat+0x85/0x8a
[  238.493008] RIP: 0023:0xf7f17d74
[  238.496422] Code: 08 89 d8 5b 5e c3 53 b8 ad de e1 fe 8b 54 24 08
b9 69 19 12 28 e8 50 d5 ff ff 81 c3 10 af 06
00 53 89 c3 b8 58 00 00 00 cd 80 <5b> 3d 00 f0 ff ff 76 0e 8b 93 b4 02
00 00 f7 d8 65 89 02 83 c8 ff
[  238.515809] RSP: 002b:00000000ff92fa64 EFLAGS: 00000286 ORIG_RAX:
0000000000000058
[  238.523763] RAX: ffffffffffffffda RBX: 00000000fee1dead RCX: 0000000028121969
[  238.531228] RDX: 0000000001234567 RSI: 000000000000000f RDI: 00000000566701a0
[  238.538642] RBP: 00000000566701a0 R08: 0000000000000000 R09: 0000000000000000
[  238.546055] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  238.553464] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  238.560952] ---[ end trace 1339144ac23765f6 ]---
[  238.566393] ------------[ cut here ]------------
[  238.571290] refcount_t: underflow; use-after-free.
[  238.576360] WARNING: CPU: 0 PID: 257 at lib/refcount.c:28
refcount_warn_saturate+0xa6/0xf0
...

-- 
With Best Regards,
Andy Shevchenko
