Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17ED12513C2
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 10:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgHYIBA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 04:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgHYIA6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 04:00:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9FCC061574
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 01:00:58 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i14so3837027lfl.12
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ar+xSVopawtRt/fvj5oyKOYbiH55iJ5OtYW5vm8WfBk=;
        b=UHmXMBVUx7BkFy/tsAbJjFhWpy8/2SZo4MrqaEWLqzVnC0KWU29aZuiEWvbsIGwP6p
         slbKt9TDV287BJv218DlsOomEnn1G5ZJf5mO3qj6iqFvCq69hEgnX+oi8dn6RjMn07LK
         Za22+7fTs2sC/EHwq0eaxAeYeQelq7VQE7I7YiDhl2gwRMbd1CIGvZEINJYyU2kk5FmF
         UqYEIvCbybEkZqJYK3NdMFoGvodTojBTNvJfK/oMe93iPTHypUuEo6YzMM9JI7CYOUmC
         aZdNJZK/5gd8nyyJKhVTlVGspdZ6Ha5pgQEMBKXesu5GCYxHmSTpXpL4gKOsY41aw9Sv
         /81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ar+xSVopawtRt/fvj5oyKOYbiH55iJ5OtYW5vm8WfBk=;
        b=sPddu9BiNB4j/9MEuO+gfO3x4FGjHwZ8onKnsJX4SvPhmESLh/MF1HkNEb9osTldAO
         QsozAZHeKXVqWxd2GzSarOIxvtXSAZKke2aX1qhf95AG8ORbjmmOFRUNBNDeqECdmHPf
         /dH2cBlrr4h2bQZC25FJnCrQbOVLFeR8GCJ+ZFhbq99tj3JyGIYVoa97o/9uJmqnl+QZ
         nqu5bJlfeoSutk/mDql+wN0c+AFOGcy2cWprfyiLGPoPQ4BkkuOo3NK64jX3smghXYxh
         /KsTcZ1rgcSgfX4iUV6rR/CDv7vKp3EJoAVXkUdm8ZOZlhqAJMSwXUSYmKdcQmgRy2g5
         S7CQ==
X-Gm-Message-State: AOAM532XTZzVLJ0Gw6K2i18r8/dTyJjVlFfED9sRvFGwRi+jBl/PcA06
        9OUFiRmk0DAaUkhPSF6KiCufDPJ9u6fhKnxKz1NMPtkRlWPQww==
X-Google-Smtp-Source: ABdhPJxrGN8p2TDYCRduaCbh28Fk8BZ7fxsSNANBoKJ7NzIrP1rqWYPWqYDxY8AEv056Bezct2C7MR6K4e7Qlqphock=
X-Received: by 2002:ac2:592d:: with SMTP id v13mr544200lfi.213.1598342452820;
 Tue, 25 Aug 2020 01:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu> <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu> <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com> <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
In-Reply-To: <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
From:   Martin Thierer <mthierer@gmail.com>
Date:   Tue, 25 Aug 2020 10:00:36 +0200
Message-ID: <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Can you try the code below? It should force dropping and adding the endpoints
> for the intrface(s) of that configuration, and xhci should reset the toggles.
>
> Completely untested, it compiles :)

Sorry, no, that doesn't work:

xhci_hcd 0000:00:14.0: Trying to add endpoint 0x83 without dropping it.
BUG: kernel NULL pointer dereference, address: 0000000000000010
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
CPU: 6 PID: 1192 Comm: python Tainted: P           OE
5.8.3-arch1-1-custom #2
Hardware name: Gigabyte Technology Co., Ltd. To be filled by
O.E.M./Z77-DS3H, BIOS F11a 11/13/2013
RIP: 0010:usb_altnum_to_altsetting+0x5/0x40
Code: 00 eb 09 48 83 c0 08 48 39 c8 74 12 4c 8b 00 49 8b 10 0f b6 52
02 39 f2 75 e9 4c 89 c0 c3 45 31 c0 4c 89 c0 c3 0f 1f 44 00 00 <8b> 4f
10 85 c9 74 26 48 8b 3f 31 c0 eb 07 83 c0 01 39 c8 74 18 48
RSP: 0018:ffffa0a0c0733e00 EFLAGS: 00010246
RAX: ffff97086414a000 RBX: ffff97086414a110 RCX: 0000000000000000
RDX: 0000000000000020 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff97086e0ed000 R08: 0000000000000001 R09: ffffffffc0360290
R10: 0000000000000000 R11: 0000000000000001 R12: ffff97088c95c000
R13: ffff97086414a090 R14: 00000000ffffffea R15: 0000000000000000
FS:  00007ff728371740(0000) GS:ffff97088ed80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000010 CR3: 00000003d9666001 CR4: 00000000001606e0
Call Trace:
 usb_reset_configuration+0x1da/0x240
 usbdev_ioctl+0x1276/0x1300
 ? do_sys_openat2+0xa6/0x170
 ? kmem_cache_free+0xa4/0x1d0
 ksys_ioctl+0x82/0xc0
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x44/0x70
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7ff72896ef6b
Code: 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b5 e8 1c ff ff ff 85 c0
78 ba 4c 89 e0 5b 5d 41 5c c3 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 8b 0d d5 ae 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007fff7efdce08 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000055bf1081bab0 RCX: 00007ff72896ef6b
RDX: 00007fff7efdce1c RSI: 0000000080045505 RDI: 0000000000000009
RBP: 000055bf10827040 R08: 00007fff7efdcd40 R09: 00007ff727e96470
R10: 00007fff7efdcd40 R11: 0000000000000202 R12: 0000000000000000
R13: 00007fff7efdcef0 R14: 00007fff7efdcf60 R15: 00007fff7efdceec
Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs
lockd grace sunrpc fscache fuse ip6table_filter ip6_tables xt_nat
iptable_nat nf_nat nf_log_ipv4 nf_log_common xt_set xt_multiport
xt_state xt_conntrac>
 snd_hda_codec ghash_clmulni_intel aesni_intel snd_hda_core
crypto_simd uas cryptd snd_hwdep iTCO_wdt glue_helper mei_hdcp
intel_pmc_bxt rapl usb_storage at24 drm_kms_helper iTCO_vendor_support
snd_pcm intel_cstate cec in>
CR2: 0000000000000010
---[ end trace 86a221d52d129373 ]---
RIP: 0010:usb_altnum_to_altsetting+0x5/0x40
Code: 00 eb 09 48 83 c0 08 48 39 c8 74 12 4c 8b 00 49 8b 10 0f b6 52
02 39 f2 75 e9 4c 89 c0 c3 45 31 c0 4c 89 c0 c3 0f 1f 44 00 00 <8b> 4f
10 85 c9 74 26 48 8b 3f 31 c0 eb 07 83 c0 01 39 c8 74 18 48
RSP: 0018:ffffa0a0c0733e00 EFLAGS: 00010246
RAX: ffff97086414a000 RBX: ffff97086414a110 RCX: 0000000000000000
RDX: 0000000000000020 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff97086e0ed000 R08: 0000000000000001 R09: ffffffffc0360290
R10: 0000000000000000 R11: 0000000000000001 R12: ffff97088c95c000
R13: ffff97086414a090 R14: 00000000ffffffea R15: 0000000000000000
FS:  00007ff728371740(0000) GS:ffff97088ed80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000010 CR3: 00000003d9666001 CR4: 00000000001606e0
