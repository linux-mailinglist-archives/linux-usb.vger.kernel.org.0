Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D106B3789D3
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 13:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236445AbhEJLcX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 07:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbhEJLJ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 07:09:58 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD1BC06175F
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 04:06:01 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g14so18224684edy.6
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0F9bimE8+5EWA3eWwl/8LEBaz81yCMOXbgA6TyW/oLg=;
        b=tzb8l/S32DpuUXobAviyA/LsyMVqU4VX5cd/39E/y5uE0Dw26QO40Sk7eR2uFraGQg
         kOBeLx72xxyP8gyOSrN/20YTeoouE6jUWi6jWe4EBQBPzjrzAZ5uSXm5Mjq/z5AErXUH
         QN2PrzMF+QrBTGvprRMfzIfF1GcrENyF6BmI0ujj8wi5EqR2jjl2oHrdXapdLzUDEZS1
         aUk4PczcIlg8C2UJhZQnOVLHxWUKZ82D4DT8Ah5gOsaB4n/7iC2l+9D8+M9D0IdWaCAl
         lY1Z9Jz3/4ghP2qXKST0qG0vliZevO7FXT9D6L8A6BruvUCfMnLiCIHCSuxhGZ0hdBY1
         mBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0F9bimE8+5EWA3eWwl/8LEBaz81yCMOXbgA6TyW/oLg=;
        b=nzmEZPS4IrHyAzCoOu8oI5lQD4liiU3LYEaha0er7QlGZCtkbcjGvV8dphOU1lSRIz
         dLYVH7VeY6z0gZ6jgIFk1wlga9pS22OTVRZ4UwVUpv6DtdNJcl69bC85tz75IBWcaCdk
         6WH0C7Zulw68qo0kokhiWYjYVm53kr3H0xqvcUTJNCcdhqU27K4w/OVW6tUcBhW09gqn
         ewUe9hBW0+TLoRQBI5ohgg64QtHlIBK/yH8dZL/VNrsu8TyVwxuBSipbCipfZZp06VIM
         oS+5c1gJ2AHBM2zfmZP1GCzMr8tcPsKPkM9GwCrVLS3MNAxmbKCzvNqCpA3N0DCSM0cA
         rX4g==
X-Gm-Message-State: AOAM531Z6h1XtAwOxz8RGvsNHDDRyxYNQY1qwRkhrJsj3uKOkaWDcmcH
        PDtHZG1NyTspSPm+tC6jK11SHX2LihhJzuHBFnXClaKSI5ITBZ1+
X-Google-Smtp-Source: ABdhPJz4pzHKioBq47oVokcL8AdJFYCEpqNrQDVgKPBRT7TU9XuDIhRCrTg1zf5pdfHmEd4/boz8NFY6VRVmGEiIeq0=
X-Received: by 2002:aa7:c15a:: with SMTP id r26mr29236413edp.78.1620644759525;
 Mon, 10 May 2021 04:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtZZoX53PjJ0VV54beMN6COccES9agttNYSzW=FbC=NFg@mail.gmail.com>
 <CA+G9fYvrhB5-Zfh7Xudetsw+rC=LE3JatW6eh8K+mXQHdDKpHQ@mail.gmail.com>
In-Reply-To: <CA+G9fYvrhB5-Zfh7Xudetsw+rC=LE3JatW6eh8K+mXQHdDKpHQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 10 May 2021 16:35:48 +0530
Message-ID: <CA+G9fYu7h+XBKvC=j7AFNr5tTmNUYWfDWoEEHHf34Gm2jcQoxg@mail.gmail.com>
Subject: Re: Unhandled fault: imprecise external abort (0x1406) at 0x00000000
 - PC is at xhci_hub_control
To:     linux-usb@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     peter.chen@kernel.org, jackp@codeaurora.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        mathias.nyman@intel.com, Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 10 May 2021 at 16:22, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Mon, 10 May 2021 at 16:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > The kernel crash reported on arm architecture BeagleBoard-X15 device running
> > Linux next 5.13.0-rc1-next-20210510 while booting the device.
> >
> > [    4.956085] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> > [    4.961639] xhci-hcd xhci-hcd.1.auto: new USB bus registered,
> > assigned bus number 2
> > [    4.969360] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
> > [    4.976165] usb usb2: We don't know the algorithms for LPM for this
> > host, disabling LPM.
> > [    4.985321] hub 2-0:1.0: USB hub found
> > [    4.989196] hub 2-0:1.0: 1 port detected
> > [    5.002197] Waiting for root device
> > PARTUUID=6b10e805-12ad-b44e-88b8-3abf3d5f52ed...
> > [    5.022918] 8<--- cut here ---
> > [    5.026000] Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> > [    5.033root
> > 081] pgd = ff6a1748
> > [    5.035797] [00000000] *pgd=00000000
> > [    5.039398] Internal error: : 1406 [#1] SMP ARM
> > [    5.043975] Modules linked in:
> > [    5.047027] CPU: 0 PID: 22 Comm: kworker/0:1 Not tainted
> > 5.13.0-rc1-next-20210510 #1
> > [    5.054809] Hardware name: Generic DRA74X (Flattened Device Tree)
> > [    5.060943] Workqueue: pm pm_runtime_work
> > [    5.065002] PC is at xhci_hub_control+0xd00/0x248c
> > [    5.069824] LR is at arm_heavy_mb+0x44/0x48
>
> Since, this crash is not easily reproducible I could bisect it.

sorry, i mean i could *not*

Since, this crash is not easily reproducible I could not bisect it.

- Naresh
