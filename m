Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECF67ACC2
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 17:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732536AbfG3Ptz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 11:49:55 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41307 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbfG3Pty (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jul 2019 11:49:54 -0400
Received: by mail-qk1-f195.google.com with SMTP id v22so46966000qkj.8
        for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2019 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q5BR+LTy9Or6GNZcVFmndJaNoPu7CpGa/66lOGz/9mU=;
        b=XWz1uejfNAElAw7jyhifkWnQ3OY/EBOy0OjLXtYnYLBua0tKYF++2FtHhe51Brv4Jq
         3gQ6BxBQXJ09DNquf8Qj0hzYEnAQ0GFq9PwEzse++fqPoSzks5OzQJ3N4Fcy/OZWLXI8
         gc7T1KGjiwtPhTKEAkLl6cKf9rzjKFfwYyfIivAyd5t1mDc4Jf9xA68UlTzHQ+O+S1i/
         WZj4BD+oBrHuQaGTXhHxwcKT9kg7/4I4H/OY81TXmQOEGFhOr67ueFAdFOAW6Oy0yQVJ
         8YBbcNKCJQ+aEzgmyAhHeUlTKp/1Hqus4ns6EpMG0UW3mRuRLx2N67ZvolZcyeNR5o/7
         TrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q5BR+LTy9Or6GNZcVFmndJaNoPu7CpGa/66lOGz/9mU=;
        b=INs+PTgIS6EmSXdkq25hG6hXBBZn3iBVtM7cQrj1LpgtJhE7Vw4MFfvxBZ92biZskI
         ZlxCRCqYWsE+RICxV4fdplm3ychMmoGOShuiUhuRWM1wWSSWcDMhLIlPM73OW/wZaFNR
         vDTnDh2l5oNHDrvMOE/WRbtAwwptrp8/eQ8e4LA+kYuYCkCU24CHLzLN8J3uB+IMgDW+
         kTqm1tcoTNyykykOig8s4SLtucQiI6lgE3ZCoSxti+WQx7pkD4mHfMqdLIojzIeUW1s6
         zpEkTzAsaarGwVWQ+KJNSWjfw00dGhEpnPIs7UbYB5n3DPDu8aGqT7Rwc54BI7sHlQjb
         FqCg==
X-Gm-Message-State: APjAAAWLyOnNOIW80aycuBx0XJwk77CBAi2gzFRuIdEAg9MF99hVWEjX
        4VnCUes420OgogrlSIYt2KWQWpsjbb8C/Tbd5r3QP6ztfe8=
X-Google-Smtp-Source: APXvYqzadyK6DvjEA9/ZbOYpMaGu/RPP1F5uMyqjdSI4BBh2ixXV+syQRLNDkwOtqAwC+27/IzYvwF0wwXqu7PvYGUc=
X-Received: by 2002:a37:4ad7:: with SMTP id x206mr79934072qka.85.1564501793073;
 Tue, 30 Jul 2019 08:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
 <20190727105955.GE458@kroah.com> <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
In-Reply-To: <bd443170-6886-df60-0d05-849fc7229cd7@bellsouth.net>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 30 Jul 2019 17:49:41 +0200
Message-ID: <CAFqH_53kZkH_nYpENO1QvEMpR4S3BP6GUncDt2c7yj_faSujrg@mail.gmail.com>
Subject: Re: Oops in xhci_endpoint_reset
To:     Bob Gleitsmann <rjgleits@bellsouth.net>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Missatge de Bob Gleitsmann <rjgleits@bellsouth.net> del dia ds., 27 de
jul. 2019 a les 23:39:
>
> OK, here's the result of the bisection:
>
> ef513be0a9057cc6baf5d29566aaaefa214ba344 is the first bad commit
> commit ef513be0a9057cc6baf5d29566aaaefa214ba344
> Author: Jim Lin <jilin@nvidia.com>
> Date:???? Mon Jun 3 18:53:44 2019 +0800
>
> ?????? usb: xhci: Add Clear_TT_Buffer

I want to confirm that I get the same oops on a Samsung Chromebook
Plus (rk3399) and that reverting the above commit fixes the issue.

If it helps there is a decoded stacktrace below (I need to gain some
usb knowledge to deal with this), probably others can have a better
idea on what is happening.

[   75.613254] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000030
[   75.623102] Mem abort info:
[   75.626224]   ESR = 0x96000004
[   75.629636]   Exception class = DABT (current EL), IL = 32 bits
[   75.636252]   SET = 0, FnV = 0
[   75.639662]   EA = 0, S1PTW = 0
[   75.643164] Data abort info:
[   75.646381]   ISV = 0, ISS = 0x00000004
[   75.650667]   CM = 0, WnR = 0
[   75.653981] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000e359e000
[   75.661181] [0000000000000030] pgd=0000000000000000
[   75.666633] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   75.672856] Modules linked in: btusb btrtl ...
[   75.751693] CPU: 4 PID: 916 Comm: systemd-sleep Not tainted 5.3.0-rc2+ #103
[   75.759470] Hardware name: Google Kevin (DT)
[   75.764237] pstate: 40000005 (nZcv daif -PAN -UAO)
[   75.769594] pc : xhci_endpoint_reset
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.c:3096)
[   75.774741] lr : xhci_endpoint_reset
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.h:1913
/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.c:3087)
[   75.779797] sp : ffff000011b6b930
[   75.783494] x29: ffff000011b6b930 x28: 00000000ffffff95
[   75.789426] x27: ffff8000ef657e00 x26: 0000000000000000
[   75.795358] x25: ffff8000efafeb80 x24: 0000000000000000
[   75.801289] x23: ffff8000efa4a250 x22: 0000000000000001
[   75.807212] x21: ffff8000efafe800 x20: ffff8000efa4a000
[   75.813143] x19: ffff8000efafe850 x18: 0000000000000000
[   75.819074] x17: 0000000000000000 x16: 0000000000000000
[   75.824997] x15: 0000000000000000 x14: 0000000000000000
[   75.830920] x13: ffff8000ef5ff180 x12: 0000000034d4d91d
[   75.836851] x11: 0000000000000000 x10: 0000000000000990
[   75.842773] x9 : ffff8000efa3d000 x8 : 0000000000000004
[   75.848695] x7 : ffff8000f55b8340 x6 : ffff8000ef65e700
[   75.854618] x5 : ffff8000efe844c0 x4 : 0000000000000000
[   75.860549] x3 : 0000000000000000 x2 : 0000000000000000
[   75.866471] x1 : 0000000000000000 x0 : 0000000000000000
[   75.872394] Call trace:
[   75.875122] xhci_endpoint_reset
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/host/xhci.c:3096)
[   75.879889] usb_hcd_reset_endpoint
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hcd.c:2090)
[   75.884753] usb_enable_endpoint
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/message.c:1294)
[   75.889324] usb_ep0_reinit
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:4423)
[   75.893402] usb_reset_and_verify_device
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:5716)
[   75.898848] usb_port_resume
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:3379
/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/hub.c:3579)
[   75.903217] generic_resume
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/generic.c:277)
[   75.907304] usb_resume_both
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/driver.c:1182
/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/driver.c:1406)
[   75.911584] usb_resume
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/driver.c:1501)
[   75.915281] usb_dev_resume
(/home/eballetbo/Projects/chromebooks/kernel/drivers/usb/core/usb.c:471)
[   75.919361] dpm_run_callback.isra.6
(/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:458)
[   75.924322] device_resume
(/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:999)
[   75.928408] dpm_resume
(/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:1055)
[   75.932203] dpm_resume_end
(/home/eballetbo/Projects/chromebooks/kernel/drivers/base/power/main.c:1171)

Thanks,
~ Enric

> ??????
> ?????? USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
> ?????? processing for full-/low-speed endpoints connected via a TT, the host
> ?????? software must use the Clear_TT_Buffer request to the TT to ensure
> ?????? that the buffer is not in the busy state".
> ??????
> ?????? In our case, a full-speed speaker (ConferenceCam) is behind a high-
> ?????? speed hub (ConferenceCam Connect), sometimes once we get STALL on a
> ?????? request we may continue to get STALL with the folllowing requests,
> ?????? like Set_Interface.
> ??????
> ?????? Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
> ?????? request to the hub of the device for the following Set_Interface
> ?????? requests to the device to get ACK successfully.
> ??????
> ?????? Signed-off-by: Jim Lin <jilin@nvidia.com>
> ?????? Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ?????? Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> ??drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
> ??drivers/usb/host/xhci.c?????????? | 21 +++++++++++++++++++++
> ??drivers/usb/host/xhci.h?????????? |?? 5 +++++
> ??3 files changed, 52 insertions(+), 1 deletion(-)
>
>
> On 7/27/19 6:59 AM, Greg KH wrote:
> > On Fri, Jul 26, 2019 at 11:15:46PM -0400, Bob Gleitsmann wrote:
> >> Hello,
> >>
> >>
> >> I have seen kernel oopses on waking from suspend to memory. I got this
> >> twice, one dmesg with backtrace attached. The other one had the failure
> >> in the same place in the code.
> >>
> >>
> >> This is kernel 5.3.0-rc1, patched for another problem in ethernet PHY
> >> driver. Have not had the problem with earlier kernels. Using Gentoo
> >> linux, amd64, but git kernel.
> > Any chance you can run 'git bisect' to track down the offending commit?
> >
> > thanks,
> >
> > greg k-h
> >
