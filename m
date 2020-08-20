Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1D124C4FD
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 20:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgHTSCW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 14:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgHTSCV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Aug 2020 14:02:21 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3B4C061385
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2020 11:02:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so1317733pjb.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2020 11:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=QqW3ZsGK2Vs/RR3KVbYhMk1aAJty7ZnKrbqlbDUEVXU=;
        b=DYZz+mrqZ7MSwwwEC/P/B30GQTdLDWmqS66+3xGVqUQdNB9Vwt+tLMZdDnaP7Hum2P
         jz9AdwxBnubDPS//Zw0N500VNK1V7caEbYdN86N41lTS3M1leojzOqFSKoXHraPU6p1c
         BJub563jUTDyMordAnDbr0GR4WXkp7svGTtn10xQGOBhujuzF2QBqOqghFxKviFCRq9o
         MGloto/UQ0cPbU+YhW2YLkU6yjZRxQzgqlpiCeIIZR8Ed4FGrqQ2uw0IV/wcIcOgxdvU
         sDidvO/LPL0aeep08e22YUsHpK0sWneBLyYskLw7mAGytOV4B2AmMYKsNru4T2tmTBae
         RI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=QqW3ZsGK2Vs/RR3KVbYhMk1aAJty7ZnKrbqlbDUEVXU=;
        b=n8Iy+MIbV/77dvyUZdPjQr8V6m9z/AhKv8DKhs/vodEGP+l5wS0t2ZQWhxZVZnRPcA
         QnlzmJ3mV6VI+d8/QNVyZIklWld6ZK+42+XgsGCabggkJrnCrpN14WGiJIHgIf3fwl+T
         LSqMPBR25DRCQS7FwjRRVUE3HdqINf/On0ak+PR4tkp6WZgni6knefIaL0kpOBkeqV9E
         SbttTYnifWCX+UFQWMwAuF5Nj1dgk7k1rAE7Qirx1TlsUmdetqnYuQWcoAvPQVhBMP5l
         pnX5JKR2YpkotcgkCiZVyi0vmGX99TbIQm3to8m4nnsX5UBxS69lgIMiMkdNlPgZCc/m
         AEWQ==
X-Gm-Message-State: AOAM530Te5R3VqKdDPhKa5xmn4NR+f2Bx+oDfpwrBmYhlzsgSrtmjTU2
        lJICueLgGl+Cdciyrb8TEpRlOw==
X-Google-Smtp-Source: ABdhPJwjgdZb6hVrV+Y4kA9f4yun3yLoRLRq6sWbtlmTiMXLt2GSChf74IzohMLkL7PQlMjzerSfEg==
X-Received: by 2002:a17:90b:3603:: with SMTP id ml3mr3307409pjb.207.1597946540821;
        Thu, 20 Aug 2020 11:02:20 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id w6sm3224669pgr.82.2020.08.20.11.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 11:02:19 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-Reply-To: <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com> <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 20 Aug 2020 11:02:19 -0700
Message-ID: <7hpn7lci1g.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
>
>> The reset is a shared reset line, but reset_control_reset is still used
>> and reset_control_deassert is not guaranteed to have been called before
>> the first reset_control_assert call. When suspending the following
>> warning may be seen:
>
> And now the same type of warning maybe seen on boot. This is
> happening for me on the libretech-cc (s905x - gxl).
>
> [    1.863469] ------------[ cut here ]------------
> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
> [    1.876525] Modules linked in:
> [    1.879548] CPU: 1 PID: 16 Comm: kworker/1:0 Not tainted 5.9.0-rc1-00167-ga2e4e3a34775 #64
> [    1.887737] Hardware name: Libre Computer AML-S905X-CC V2 (DT)
> [    1.893525] Workqueue: events deferred_probe_work_func
> [    1.898607] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
> [    1.904126] pc : reset_control_reset+0x130/0x150
> [    1.908700] lr : phy_meson_gxl_usb2_init+0x24/0x70
> [    1.913439] sp : ffff8000123ebad0
> [    1.916717] x29: ffff8000123ebad0 x28: 0000000000000000 
> [    1.921978] x27: ffff00007c4b1ac8 x26: ffff00007c4b1ab0 
> [    1.927239] x25: ffff00007fc149b0 x24: ffff00007c4b1ab0 
> [    1.932500] x23: ffff00007cd03800 x22: ffff800011fb9000 
> [    1.937761] x21: ffff00007c60db08 x20: ffff00007c468a80 
> [    1.943023] x19: ffff00007c466b00 x18: ffffffffffffffff 
> [    1.948284] x17: 0000000000000000 x16: 000000000000000e 
> [    1.953545] x15: ffff800011fb9948 x14: ffffffffffffffff 
> [    1.958806] x13: ffffffff00000000 x12: ffffffffffffffff 
> [    1.964068] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f 
> [    1.969329] x9 : 78676f2c32617274 x8 : 0000000000000000 
> [    1.974590] x7 : ffffffffffffffff x6 : 0000000000000000 
> [    1.979851] x5 : 0000000000000000 x4 : 0000000000000000 
> [    1.985112] x3 : 0000000000000000 x2 : ffff8000107aa370 
> [    1.990374] x1 : 0000000000000001 x0 : 0000000000000001 
> [    1.995636] Call trace:
> [    1.998054]  reset_control_reset+0x130/0x150
> [    2.002279]  phy_meson_gxl_usb2_init+0x24/0x70
> [    2.006677]  phy_init+0x78/0xd0
> [    2.009784]  dwc3_meson_g12a_probe+0x2c8/0x560
> [    2.014182]  platform_drv_probe+0x58/0xa8
> [    2.018149]  really_probe+0x114/0x3d8
> [    2.021770]  driver_probe_device+0x5c/0xb8
> [    2.025824]  __device_attach_driver+0x98/0xb8
> [    2.030138]  bus_for_each_drv+0x74/0xd8
> [    2.033933]  __device_attach+0xec/0x148
> [    2.037726]  device_initial_probe+0x24/0x30
> [    2.041868]  bus_probe_device+0x9c/0xa8
> [    2.045663]  deferred_probe_work_func+0x7c/0xb8
> [    2.050150]  process_one_work+0x1f0/0x4b0
> [    2.054115]  worker_thread+0x210/0x480
> [    2.057824]  kthread+0x158/0x160
> [    2.061017]  ret_from_fork+0x10/0x18
> [    2.064550] ---[ end trace 94d737efe593c6f6 ]---
> [    2.069158] phy phy-d0078000.phy.0: phy init failed --> -22
> [    2.074858] dwc3-meson-g12a: probe of d0078080.usb failed with error -22
>
> This breaks USB on this device. reverting the change brings it back.

[...]

> In the meantime, I think this change should be reverted. A warning on
> suspend seems less critical than a regression breaking USB completly.

Fully agree.

Phillip, can you please revert this patch until the right solution is
found?  Boot failure is much worse than a suspend warning.

Kevin
