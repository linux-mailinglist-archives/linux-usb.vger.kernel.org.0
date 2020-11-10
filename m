Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51B92AD620
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 13:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729555AbgKJMZH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 07:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgKJMZH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 07:25:07 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D259C0613CF
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 04:25:07 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id y25so13524355lja.9
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2020 04:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=i/r8g7bANlo1IXs+XpCJPWS6l3F943zbwnBLmzEHuok=;
        b=rzmO4ArdqkRPvL/Yuat9rS0fWakfoPP3zPako2eVWQi5WJ9Ul7DwrdUTS/yITgv9qg
         xNhXVa0JQ58NWoQiewXbR0hFYkdvnoB/u2RU9A+nJrrz8mN55yafIZ4iTdT8pRRtwoOA
         aRHYFpkXMyfNVAFWIchAottZudTqQbRbff9KE7OsqVGITjQg++VfSWafFwg/BBKAjiGQ
         dORcqi5PKGggBqLSEvPA0pvauu1LW5FZUPSOpgJaNeQJ0bY0O1FEg6wrEKm5c/Yduz+D
         GNi6g0hqjfeiTsoTmTzIfOb4iZAr2sVjizp1f3GoLQ1hqu9/cqFWa5c1WCBtDus9NhP0
         HwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=i/r8g7bANlo1IXs+XpCJPWS6l3F943zbwnBLmzEHuok=;
        b=fLjx76bXCr1JnWr8dLZCeHaASkGhaDmPWTx3o9LBYLkXZFzVt+dCWabF/PpAhThNy8
         uD0XDWs5sbY2O9akS3+RkOo+XaxoekBsOV+u3Fwgvdta8zTkdZwD9yFG52cbEyJUM0Ga
         HmlfNuTeYcwTQOz5mjeEsUTfEqPNV5yol9+B+bsS7BzoAdXP1KnvRfC72GcjusgFUMgS
         rQMoLOySU8x0o3JTj4H+kWpBRwHc/KG+1GSJ24y3gqueMLI52vPWOQywrnySRUyAyMEn
         YFFUkjviKO6lYg/dqP1DcThXatzmmko8gonPkg2RY2EjZemMxHMvZayACxjy+Xf26M0V
         FbjA==
X-Gm-Message-State: AOAM530W7JTELxS7mb12W/3/qIffvpV0XqTUs1dFPrFfZMswkQN4aYtz
        FuQ2kUQLKe5TES8A/rv0WnKP4pU5ed5nt1r4/uk=
X-Google-Smtp-Source: ABdhPJzTigfg+nr3I4TQYbpLtimsjaHiVGOjnKbYzM15GyixYVd4oTlUR0inLPrgxX5PxxRpIYBKd+0bYRUL6vdxooQ=
X-Received: by 2002:a2e:9450:: with SMTP id o16mr1849391ljh.178.1605011105494;
 Tue, 10 Nov 2020 04:25:05 -0800 (PST)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 10 Nov 2020 09:24:54 -0300
Message-ID: <CAOMZO5AMuRv5AZ2HOEgqzaPcbLeNXWajpTB40Dejs7gcsL=BhQ@mail.gmail.com>
Subject: chip idea: Crash on i.MX27
To:     Peter Chen <peter.chen@nxp.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On a imx27-pdk board I see the following error.

Any suggestions?

Thanks,

Fabio Estevam

imx_usb 10024000.usb: No over current polarity defined
8<--- cut here ---
Unhandled fault: external abort on non-linefetch (0x808) at 0xf4424184
pgd = (ptrval)
[f4424184] *pgd=10000452(bad)
Internal error: : 808 [#1] PREEMPT ARM
Modules linked in:
CPU: 0 PID: 27 Comm: kworker/0:1 Not tainted
5.10.0-rc2-next-20201109-00002-g4bce163a428-dirty #135
Hardware name: Freescale i.MX27 (Device Tree Support)
Workqueue: events deferred_probe_work_func
PC is at hw_phymode_configure+0x4c/0x120
LR is at 0x80000000
pc : [<c0523108>]    lr : [<80000000>]    psr: 60000013
sp : c1185c70  ip : 00000000  fp : c0950638
r10: 3f888caf  r9 : c196e038  r8 : c196e08c
r7 : c11b1a20  r6 : c18fb200  r5 : c196f020  r4 : 40000000
r3 : 00000000  r2 : 8c000c04  r1 : 00000000  r0 : f4424184
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 0005317f  Table: a0004000  DAC: 00000053
Process kworker/0:1 (pid: 27, stack limit = 0x(ptrval))
Stack: (0xc1185c70 to 0xc1186000)
5c60:                                     c196e020 c0523f74 c12feb58 c12feb58
5c80: c18f5d68 c18f7160 c12fa280 c18fb210 00000000 c18fb210 00000000 c09b7814
5ca0: c09b7814 00000001 00000000 c09aae28 c0950638 c04359e0 c18fb210 c09f9a84
5cc0: 00000000 c043371c c18fb210 c09b7814 c0433b40 c0949028 00000001 00000000
5ce0: c09aae28 c0433a30 00000000 c1185d24 c0433b40 c04318ec 20000013 c10c9f5c
5d00: c12eb574 4da732e0 c0950638 c18fb210 c18fb254 c0949028 c0949028 c0433478
5d20: c12d2000 c18fb210 00000001 4da732e0 c18fb210 c09ab3f0 c18fb210 c0949028
5d40: 00000000 c043280c c18fb210 c10f6810 00000000 c042f5b0 c18fb210 c0398468
5d60: c094e9fc c0021038 c094e9fc 4da732e0 c12fa2a0 00000002 c18fb200 c18fb210
5d80: c094e9fc c094e9dc 00000000 c0435798 c1185dd8 00000000 c18fb200 c10b1f40
5da0: 00000002 00000000 c18faca0 c0523ad8 00000000 60000013 c18faca0 c10f6810
5dc0: c10f6800 c0949028 c7ef88a8 00000000 c18faca0 c052a2f4 c10f4420 00000100
5de0: 00000000 00000000 c11b1a20 00000003 0000000a 00000003 c0529924 00000000
5e00: 01010000 00000000 00000001 00000000 00000000 00000000 00000000 ffffffed
5e20: 00000000 c0524684 00000000 00000000 00000000 ffffffed 00000000 c0524684
5e40: 00000000 00000000 00000000 c12fa500 c12ffea0 00000000 00000000 4da732e0
5e60: c10f6810 00000000 c09b7990 c09b7990 00000001 00000000 c09ab198 c04359e0
5e80: c10f6810 c09f9a84 00000000 c043371c c10f6810 c09b7990 c0433b40 c0949028
5ea0: 00000001 00000000 c09ab198 c0433a30 00000000 c1185eec c0433b40 c04318ec
5ec0: 20000013 c10c9f5c c12eb454 4da732e0 c0950638 c10f6810 c10f6854 c0949028
5ee0: c09ab184 c0433478 c10f6810 c10f6810 00000001 4da732e0 c10f6810 c09ab3f0
5f00: c10f6810 c09ab184 00000000 c043280c c10f6810 c09ab178 c09ab178 c0432cbc
5f20: c09ab194 c1004920 c09d64a0 c7ee9400 00000000 c0036110 ffffe000 c095064c
5f40: c1004920 c0950638 c1004934 ffffe000 c095064c c0965940 00000008 c0036748
5f60: 00000000 c114a100 c114e2c0 c1184000 00000000 c109dec0 c00364ac c1004920
5f80: c114a120 c003d5c8 00000000 c114e2c0 c003d480 00000000 00000000 00000000
5fa0: 00000000 00000000 00000000 c0008568 00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[<c0523108>] (hw_phymode_configure) from [<c0523f74>]
(ci_hdrc_probe+0x35c/0x8f8)
[<c0523f74>] (ci_hdrc_probe) from [<c04359e0>] (platform_drv_probe+0x4c/0xa0)
[<c04359e0>] (platform_drv_probe) from [<c043371c>] (really_probe+0x228/0x3d0)
[<c043371c>] (really_probe) from [<c0433a30>] (driver_probe_device+0x54/0xb0)
[<c0433a30>] (driver_probe_device) from [<c04318ec>]
(bus_for_each_drv+0x58/0xc0)
[<c04318ec>] (bus_for_each_drv) from [<c0433478>] (__device_attach+0xd8/0x14c)
[<c0433478>] (__device_attach) from [<c043280c>] (bus_probe_device+0x8c/0x94)
[<c043280c>] (bus_probe_device) from [<c042f5b0>] (device_add+0x3b0/0x764)
[<c042f5b0>] (device_add) from [<c0435798>] (platform_device_add+0x100/0x208)
[<c0435798>] (platform_device_add) from [<c0523ad8>]
(ci_hdrc_add_device+0x414/0x4e0)
[<c0523ad8>] (ci_hdrc_add_device) from [<c052a2f4>]
(ci_hdrc_imx_probe+0x2fc/0x5ec)
[<c052a2f4>] (ci_hdrc_imx_probe) from [<c04359e0>]
(platform_drv_probe+0x4c/0xa0)
[<c04359e0>] (platform_drv_probe) from [<c043371c>] (really_probe+0x228/0x3d0)
[<c043371c>] (really_probe) from [<c0433a30>] (driver_probe_device+0x54/0xb0)
[<c0433a30>] (driver_probe_device) from [<c04318ec>]
(bus_for_each_drv+0x58/0xc0)
[<c04318ec>] (bus_for_each_drv) from [<c0433478>] (__device_attach+0xd8/0x14c)
[<c0433478>] (__device_attach) from [<c043280c>] (bus_probe_device+0x8c/0x94)
[<c043280c>] (bus_probe_device) from [<c0432cbc>]
(deferred_probe_work_func+0x60/0x90)
[<c0432cbc>] (deferred_probe_work_func) from [<c0036110>]
(process_one_work+0x210/0x5ac)
[<c0036110>] (process_one_work) from [<c0036748>] (worker_thread+0x29c/0x608)
[<c0036748>] (worker_thread) from [<c003d5c8>] (kthread+0x148/0x170)
[<c003d5c8>] (kthread) from [<c0008568>] (ret_from_fork+0x14/0x2c)
Exception stack(0xc1185fb0 to 0xc1185ff8)
5fa0:                                     00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e3530000 1a000002 e3c224d2 e182200e (e5802000)
---[ end trace 5e6eafe484314edc ]---
