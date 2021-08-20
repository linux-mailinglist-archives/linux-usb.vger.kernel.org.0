Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC2B3F2E2F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 16:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240879AbhHTOhC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 10:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240819AbhHTOhC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Aug 2021 10:37:02 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E98C061756
        for <linux-usb@vger.kernel.org>; Fri, 20 Aug 2021 07:36:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso9264272wmc.5
        for <linux-usb@vger.kernel.org>; Fri, 20 Aug 2021 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=VVH5cjbejgdKr2IOUs76t8Kb6I7GHF6NXDSy37N+NBk=;
        b=aAgNJkDJftUIGTTNJBfe1LWoyvL3jbUJ6hpHavTd1gw3/O03m2NZdz7T8Ase/K9lBl
         zc1I3QkpHLT0rlVzUfhLKkIvWlNVjDfroeNt00uGpQIXDP8ce3GCK/vWCf071s9QRWTd
         7LfpAasFawFGzl6/8EUs524nLGCRgdB0v27eKu7PnkqJLaDeMJ8oCvzivYnryh4uuJu6
         r0ZcMDHVj8MRSBKAS/xbK/2DaEIenf61trDZY534uRpC4fj9aEPSAHn+lOvOa7UgUOE5
         auBP+kQAmukKFDPOm0pHEn2dVSP20BdH7qjxq15r7gf6vBWGzUVYwk712CdgUHcsu88Y
         22Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=VVH5cjbejgdKr2IOUs76t8Kb6I7GHF6NXDSy37N+NBk=;
        b=s5JYGKVyOS3r/WRU4UGPee7l3PYbSLMnWlFrGydKmmyy7/3ugRd3xMQXg/AlJEmOXz
         3CyQp+b6yu3XkQmTwoLH9lx581k1awR+hCtsb24OrBA1N6yhebe6fUVE1U8lahGOdt/J
         khu04ot0GI8SNaiaDRWM8XzArZeFi2GhrzSNIEQSABo7H+/iEB1vqIBVQJpxga0jmQeP
         8irNQApCW9Co4bBGyaIb2vAzneRGg/4pEuNlPckt4eF+HP+Jk3uWH8fTSmyMkqRvhh3x
         PCtI03v8eaz1YASOPUdwEqJc7Unhof+gjT3gkBRbScag+fKKzaZI/UtS8tdVSjJih8ec
         wmHQ==
X-Gm-Message-State: AOAM531vsyGNnW2a1QIOf6hu4hmNHi0iGiZDJwbCOv8UHGbR6BApDg9z
        Mkdnm0eEFFbErVsepzfi8mqiXQ==
X-Google-Smtp-Source: ABdhPJx2Gwy428ggXkCEjHyctr7/pRb7S8/XrMM0hN3pZToLlOcJqbh/KwHkVF8vC2J0UTAWD0c3mg==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr4312068wme.158.1629470182754;
        Fri, 20 Aug 2021 07:36:22 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id s17sm10727273wmj.12.2021.08.20.07.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 07:36:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 20 Aug 2021 15:36:21 +0100
Message-Id: <CDOEYZ9OFK75.NCZ1WGVTMSVK@arch-thunder>
Cc:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] usb: isp1760: move to regmap for register access
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Dietmar Eggemann" <deggeman@gmx.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Sebastian Siewior" <bigeasy@linutronix.de>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Rob Herring" <robh+dt@kernel.org>
References: <20210513084717.2487366-1-rui.silva@linaro.org>
 <20210513084717.2487366-3-rui.silva@linaro.org>
 <11ed5458-4b88-ad72-4497-89ff9346a40b@gmx.de>
In-Reply-To: <11ed5458-4b88-ad72-4497-89ff9346a40b@gmx.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey Dietmar,
On Fri Aug 20, 2021 at 2:30 PM WEST, Dietmar Eggemann wrote:

> Hi Rui,
>
> On 13/05/2021 10:47, Rui Miguel Silva wrote:
> > Rework access to registers and memory to use regmap framework.
> > No change in current feature or way of work is intended with this
> > change.
> >
> > This will allow to reuse this driver with other IP of this family,
> > for example isp1763, with little changes and effort.
> >
>
> 1da9e1c06873 - usb: isp1760: move to regmap for register access
>
> Starting from this patch, our Arm TC2 platform (multi_v7_defconfig,
> vexpress-v2p-ca15_a7.dts) doesn't boot anymore.

:( sorry about that

> We discovered this in our v5.14-rc1 based task scheduler test build.
>
> With 1da9e1c06873^1 :
>
> # lsusb
> Bus 001 Device 001: ID 1d6b:0002 <-- NXP ISP1760 USB Host Controller
> Bus 001 Device 002: ID 0471:3526
> Bus 001 Device 003: ID 0781:5591
>
> # dmesg | grep -i isp
> [    4.014307] isp1760 1b000000.usb: bus width: 32, oc: digital
> [    4.014442] isp1760 1b000000.usb: NXP ISP1760 USB Host Controller
> [    4.014715] isp1760 1b000000.usb: new USB bus registered, assigned bus=
 number 1
> [    4.025076] isp1760 1b000000.usb: irq 32, io mem 0x1b000000
> [    4.025288] isp1760 1b000000.usb: USB ISP 1761 HW rev. 1 started

Never managed to get my hands in a board with  1761, I will try to get
one of this.

> [    4.055802] ISP1760 USB device initialised
> [    4.257911] isp1760 1b000000.usb: port 1 high speed
> [    4.325662] usb 1-1: new high-speed USB device number 2 using isp1760
> [    4.475670] isp1760 1b000000.usb: port 1 high speed
> [   14.320372] usb 1-1.2: new high-speed USB device number 3 using isp176=
0
>
> With v5.14-rc1 :
>
> there is no boot output at all, but I debugged it a little bit and the
> system seems to hang here:
>
> [    1.847494] [<c0cac46c>] (isp1760_udc_register) from [<c0ca668c>] (isp=
1760_register+0x5d0/0x5f0)
> [    1.847527] [<c0ca668c>] (isp1760_register) from [<c0ca6b7c>] (isp1760=
_plat_probe+0x150/0x1b0)
> [    1.847557] [<c0ca6b7c>] (isp1760_plat_probe) from [<c0a46ef0>] (platf=
orm_probe+0x5c/0xb8)
> [    1.847589] [<c0a46ef0>] (platform_probe) from [<c0a44924>] (really_pr=
obe.part.0+0x9c/0x32c)
> ...
>
>     isp1760_udc_register()->isp1760_udc_init()
>
>         ....
>         /* Reset the device controller. */
>         isp1760_udc_set(udc, DC_SFRESET); <-- hangs here !!!

Thanks for the hint, I will take a better look here, to find if some
register or mapping is wrongly set.

------
Cheers,
     Rui
>         usleep_range(10000, 11000);
>         isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
>         usleep_range(10000, 11000);
>
> [...]



