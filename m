Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BE939F7EB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 15:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbhFHNjw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 09:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhFHNjv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 09:39:51 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40934C061574
        for <linux-usb@vger.kernel.org>; Tue,  8 Jun 2021 06:37:47 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id k5so11957136pjj.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Jun 2021 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SkTu7pE/CrNbC48QBK3gieHSiHgaKRykdCCKu+9utRE=;
        b=fx78us4wPjaQFZeC4kQxK88VfOcaZnSJQkivCjFLUbPqmO9uMiJSkZkkSO2LclThWe
         icbqBnY6U74y4ELwCi1yVeJqcEV2mW4WkKOYAuXVags70brSJ6E1/CgNX9Ki03JHupfU
         QIXf4bfOdiopYJ6/Q2BYxStLAr0mVBDLgeDZTG6528hcqxY8OnaguQ3V++DMsPHJdfva
         V9jQMBLMBLvV28SZnPrFimn1mW4sUSfFywjdyzIysn7Sjw7HJRYSqTneClybvX/cLStc
         F0D30a91rGuQb0cFHLKbWas4rLhSJEdCrpkYvvU2XcjDYKVtD+GDrlRK0k/yfzoNq8KU
         OyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SkTu7pE/CrNbC48QBK3gieHSiHgaKRykdCCKu+9utRE=;
        b=eXtYGx29AMvOiuKsq000ETwR74K67rjhM5WTdg7WjCjjh1OHRe+HrtPkkMuaVqppZR
         T5Y5YL6YcAnp5Wt+sHvbzyhnQpsf3Xq+7KOGTdaLAziOcFFPxmP5AkzXttpcJf5rzs+w
         W+eL4obeuXbv4X3UaNQqr+poZ+R1aeCY2fcbv5J528BOKWC8FyiaPvAjvuheeLvJTfDk
         8ae42vqEnKVglUvnOXwO9jNNsnJFPkKYGeQKWp+1KjEkVkxdCnIWKWdcd00MxGhaEmNW
         28lkKHnYxzVF65ADbUHBu+apYviAnWvRMiGz4MaBKH44s6/hiG/Qr3EVGsT3VWRSr9AG
         6Hvg==
X-Gm-Message-State: AOAM532xD59K1hNTanTsI+F9IhpzrtkuStbEbbo7KiXl1tdvuNoieuXZ
        BoFm5rwvGFdIOyiq6qU4m1uqE2Ow3sH7DmAcDh4=
X-Google-Smtp-Source: ABdhPJxSKZfe9MTHN5FsfrAFqgMMN450bD+DEfmQj7vw2t/lnoA0FY7Qc2/5tRH1l+Ue6MjIlfKZtMpnnBw52X87JMI=
X-Received: by 2002:a17:90b:818:: with SMTP id bk24mr1032713pjb.228.1623159466518;
 Tue, 08 Jun 2021 06:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210608105656.10795-1-peter.chen@kernel.org>
In-Reply-To: <20210608105656.10795-1-peter.chen@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Jun 2021 16:37:30 +0300
Message-ID: <CAHp75VeRXDeJu+JXhDk9cDjuROx-xQa_MhYm6KkNkqM3TxSTvw@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>, USB <linux-usb@vger.kernel.org>,
        Jack Pham <jackp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 8, 2021 at 2:01 PM Peter Chen <peter.chen@kernel.org> wrote:
>
> When do system reboot, it calls dwc3_shutdown and the whole debugfs
> for dwc3 has removed first, when the gadget tries to do deinit, and
> remove debugfs for its endpoints, it meets NULL pointer dereference
> issue when call debugfs_lookup. Fix it by removing the whole dwc3
> debugfs later than dwc3_drd_exit.

Usually we refer to the function() like this.

> [ 2924.958838] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000002
> ....

It's a bad habit to provide very noisy tracebacks, please consider to
shrink this to ~3-4 most significant lines.

> [ 2925.030994] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
> [ 2925.037005] pc : inode_permission+0x2c/0x198
> [ 2925.041281] lr : lookup_one_len_common+0xb0/0xf8
> [ 2925.045903] sp : ffff80001276ba70
> [ 2925.049218] x29: ffff80001276ba70 x28: ffff0000c01f0000 x27: 0000000000000000
> [ 2925.056364] x26: ffff800011791e70 x25: 0000000000000008 x24: dead000000000100
> [ 2925.063510] x23: dead000000000122 x22: 0000000000000000 x21: 0000000000000001
> [ 2925.070652] x20: ffff8000122c6188 x19: 0000000000000000 x18: 0000000000000000
> [ 2925.077797] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000004
> [ 2925.084943] x14: ffffffffffffffff x13: 0000000000000000 x12: 0000000000000030
> [ 2925.092087] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f x9 : ffff8000102b2420
> [ 2925.099232] x8 : 7f7f7f7f7f7f7f7f x7 : feff73746e2f6f64 x6 : 0000000000008080
> [ 2925.106378] x5 : 61c8864680b583eb x4 : 209e6ec2d263dbb7 x3 : 000074756f307065
> [ 2925.113523] x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffff8000122c6188
> [ 2925.120671] Call trace:
> [ 2925.123119]  inode_permission+0x2c/0x198
> [ 2925.127042]  lookup_one_len_common+0xb0/0xf8
> [ 2925.131315]  lookup_one_len_unlocked+0x34/0xb0
> [ 2925.135764]  lookup_positive_unlocked+0x14/0x50
> [ 2925.140296]  debugfs_lookup+0x68/0xa0
> [ 2925.143964]  dwc3_gadget_free_endpoints+0x84/0xb0
> [ 2925.148675]  dwc3_gadget_exit+0x28/0x78
> [ 2925.152518]  dwc3_drd_exit+0x100/0x1f8
> [ 2925.156267]  dwc3_remove+0x11c/0x120
> [ 2925.159851]  dwc3_shutdown+0x14/0x20
> [ 2925.163432]  platform_shutdown+0x28/0x38
> [ 2925.167360]  device_shutdown+0x15c/0x378
> [ 2925.171291]  kernel_restart_prepare+0x3c/0x48
> [ 2925.175650]  kernel_restart+0x1c/0x68
> [ 2925.179316]  __do_sys_reboot+0x218/0x240
> [ 2925.183247]  __arm64_sys_reboot+0x28/0x30
> [ 2925.187262]  invoke_syscall+0x48/0x100
> [ 2925.191017]  el0_svc_common.constprop.0+0x48/0xc8
> [ 2925.195726]  do_el0_svc+0x28/0x88
> [ 2925.199045]  el0_svc+0x20/0x30
> [ 2925.202104]  el0_sync_handler+0xa8/0xb0
> [ 2925.205942]  el0_sync+0x148/0x180
> [ 2925.209270] Code: a9025bf5 2a0203f5 121f0056 370802b5 (79400660)
> [ 2925.215372] ---[ end trace 124254d8e485a58b ]---
> [ 2925.220012] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [ 2925.227676] Kernel Offset: disabled
> [ 2925.231164] CPU features: 0x00001001,20000846
> [ 2925.235521] Memory Limit: none
> [ 2925.238580] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

-- 
With Best Regards,
Andy Shevchenko
