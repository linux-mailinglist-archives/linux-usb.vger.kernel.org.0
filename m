Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E4124C54E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 20:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHTS2B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 14:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgHTS1z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Aug 2020 14:27:55 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD7CC061385
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2020 11:27:54 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id g19so3650978ejc.9
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2020 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=wFU6iehEQRgm6hzdRdz9I3KMLqhTVpwPuMrgKp9w+qk=;
        b=n4v1+3phIsOZUbWt6KG79kSvXkI74RoAHTtRwDLSymbUnK3ebGOnoPeaHkDigI3fCz
         Be+u/NFKo2LHPvOgtbZV7f8jJN+zVPcJNjD136DToUXP8LxsIX8jd+LoC/qp4Ep9Jf6T
         lszR31UVipTHjD6KASH6x3p2GqeaF7yhlQD3gTTingP3UzWORG0afxHk3b0iFrHTVLkh
         EryYWz4M1r+z3HEKbyBDjs3WksmjpNi+ZrH1lTLLjzM/crqLB/ct86s+E83c7NSVlQhy
         LKZLor9PgrGOu/DUbIoXbP4ITaXhV4MvMpEtPw/t00oTLzJkSyAI7qFCKa5IL9DhaWAj
         ZPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=wFU6iehEQRgm6hzdRdz9I3KMLqhTVpwPuMrgKp9w+qk=;
        b=oN3Ve0VbFwXPzcb6y58VFno8EuZbbdlzREIk+3DmiVM8bf0JZR+hBTSqhWie3OIq+p
         0WwMpifY3VeqvNf9L3/aP8lVT90gaxvAqe0xgRKSmJpuflUXTZbz7LUUKMRhF+fI2lHd
         75oWoPLWvEsN3VOubU2cW4eqsW2rcoXqEUgjH+foPpljKWiAMuRbJJD/fGrJ9xqHRSOm
         v6tchfrm8PAqyMqBApT91pfbUMbRQlsIUGfdcwplFaNJUXOJBkXEVeZOmJ3BiVJW7nEZ
         1j2W75SmjiJkQPfFxGjwIE0BGLDJB81nzyfO6kEekjHhujx6hsGOl2coZ94lheh1Hqdt
         wlzQ==
X-Gm-Message-State: AOAM533CQ0Yjxfz4R/HQpKbqFSXM5Q3fpUzNclnmRzKXo6vmGCVtRtQZ
        Sa+0AHAJKyjnAdY6dY/jxmY1Ow==
X-Google-Smtp-Source: ABdhPJzLTCb2qD90CjqOtg7OFn2t40v8DNlLGsKzih5dBf56Esst/PTsmHN/wUwOmlhz9iTzTOkbjA==
X-Received: by 2002:a17:907:2119:: with SMTP id qn25mr4524366ejb.278.1597948072889;
        Thu, 20 Aug 2020 11:27:52 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id b9sm1881881ejz.57.2020.08.20.11.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 11:27:51 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com> <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <7hpn7lci1g.fsf@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <7hpn7lci1g.fsf@baylibre.com>
Date:   Thu, 20 Aug 2020 20:27:50 +0200
Message-ID: <1jy2m9qijd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Thu 20 Aug 2020 at 20:02, Kevin Hilman <khilman@baylibre.com> wrote:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
>>
>>> The reset is a shared reset line, but reset_control_reset is still used
>>> and reset_control_deassert is not guaranteed to have been called before
>>> the first reset_control_assert call. When suspending the following
>>> warning may be seen:
>>
>> And now the same type of warning maybe seen on boot. This is
>> happening for me on the libretech-cc (s905x - gxl).
>>
>> [    1.863469] ------------[ cut here ]------------
>> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
>> [    1.876525] Modules linked in:
>> [    1.879548] CPU: 1 PID: 16 Comm: kworker/1:0 Not tainted 5.9.0-rc1-00167-ga2e4e3a34775 #64
>> [    1.887737] Hardware name: Libre Computer AML-S905X-CC V2 (DT)
>> [    1.893525] Workqueue: events deferred_probe_work_func
>> [    1.898607] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
>> [    1.904126] pc : reset_control_reset+0x130/0x150
>> [    1.908700] lr : phy_meson_gxl_usb2_init+0x24/0x70
>> [    1.913439] sp : ffff8000123ebad0
>> [    1.916717] x29: ffff8000123ebad0 x28: 0000000000000000 
>> [    1.921978] x27: ffff00007c4b1ac8 x26: ffff00007c4b1ab0 
>> [    1.927239] x25: ffff00007fc149b0 x24: ffff00007c4b1ab0 
>> [    1.932500] x23: ffff00007cd03800 x22: ffff800011fb9000 
>> [    1.937761] x21: ffff00007c60db08 x20: ffff00007c468a80 
>> [    1.943023] x19: ffff00007c466b00 x18: ffffffffffffffff 
>> [    1.948284] x17: 0000000000000000 x16: 000000000000000e 
>> [    1.953545] x15: ffff800011fb9948 x14: ffffffffffffffff 
>> [    1.958806] x13: ffffffff00000000 x12: ffffffffffffffff 
>> [    1.964068] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f 
>> [    1.969329] x9 : 78676f2c32617274 x8 : 0000000000000000 
>> [    1.974590] x7 : ffffffffffffffff x6 : 0000000000000000 
>> [    1.979851] x5 : 0000000000000000 x4 : 0000000000000000 
>> [    1.985112] x3 : 0000000000000000 x2 : ffff8000107aa370 
>> [    1.990374] x1 : 0000000000000001 x0 : 0000000000000001 
>> [    1.995636] Call trace:
>> [    1.998054]  reset_control_reset+0x130/0x150
>> [    2.002279]  phy_meson_gxl_usb2_init+0x24/0x70
>> [    2.006677]  phy_init+0x78/0xd0
>> [    2.009784]  dwc3_meson_g12a_probe+0x2c8/0x560
>> [    2.014182]  platform_drv_probe+0x58/0xa8
>> [    2.018149]  really_probe+0x114/0x3d8
>> [    2.021770]  driver_probe_device+0x5c/0xb8
>> [    2.025824]  __device_attach_driver+0x98/0xb8
>> [    2.030138]  bus_for_each_drv+0x74/0xd8
>> [    2.033933]  __device_attach+0xec/0x148
>> [    2.037726]  device_initial_probe+0x24/0x30
>> [    2.041868]  bus_probe_device+0x9c/0xa8
>> [    2.045663]  deferred_probe_work_func+0x7c/0xb8
>> [    2.050150]  process_one_work+0x1f0/0x4b0
>> [    2.054115]  worker_thread+0x210/0x480
>> [    2.057824]  kthread+0x158/0x160
>> [    2.061017]  ret_from_fork+0x10/0x18
>> [    2.064550] ---[ end trace 94d737efe593c6f6 ]---
>> [    2.069158] phy phy-d0078000.phy.0: phy init failed --> -22
>> [    2.074858] dwc3-meson-g12a: probe of d0078080.usb failed with error -22
>>
>> This breaks USB on this device. reverting the change brings it back.
>
> [...]
>
>> In the meantime, I think this change should be reverted. A warning on
>> suspend seems less critical than a regression breaking USB completly.
>
> Fully agree.
>
> Phillip, can you please revert this patch until the right solution is
> found?  Boot failure is much worse than a suspend warning.

I was asking Philip about the reset API suggestion.
I think the maintainer is Felipe for this change :)

>
> Kevin

