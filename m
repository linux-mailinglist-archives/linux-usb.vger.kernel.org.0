Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 244B0EE31F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 16:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDPIC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 10:08:02 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44216 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDPIC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 10:08:02 -0500
Received: by mail-il1-f196.google.com with SMTP id w1so6258316ilq.11;
        Mon, 04 Nov 2019 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6SASj1MjRkcVN0UtvCsAsSXDuWUUEhoDsgh9LyhPOU=;
        b=cYHRxA3NhnaxyAdFiSqjpx5I5Pb/fiOUaGM4A8hw4GwGLhajOMYGtx7AVPGGFKR1EE
         MDXDgktbU2+cnBEYSdcAb8iu5tcQZ8xg7wOSmEIX6KXVmN6e9yxVoil6TMa/LOstghjg
         shZe7Imz5VERMF/dFGnKCf3m+AotjaWING51MBsQaepK2B+UBb8ERJlPnYFQuEzboOEg
         Fi3CwdkUKgHwRUwGnd7Ce7PCXwCk09RUcnMETVV7A1ZuhTKHEa3uMrjvo+Q85gxbDsCM
         nej8AjheVLYp8deaRiAa1OAwWt1ZM4KAAY2x+hYQU3juJJHzRj2gk1jIa6u8FotMOhts
         gpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6SASj1MjRkcVN0UtvCsAsSXDuWUUEhoDsgh9LyhPOU=;
        b=UjkZeP7KyUBphGEGSWc3ZSvNZ1Sf63vDK360TFnSKKTeqHVSioWsEfll17MbSAi3qn
         qmmAkQ2GkJsCVmUEC6//qHENCI4vUITsY+yOR3Q9H2EBVx/UBLjypwWWyyO6DCf0TTer
         nGPorCQkMt5IkpeYbKZncQyfSASEZoYEoiSiPiNuon6aMAuwQ8KscVL48QtFNIW8V7Lq
         v/WBSUu1n0h86nGPnBv77h+FiZu+7QVtuiT5X3s6M7xWqZc6lBAEazJkRU4qBtlUeFFs
         kRm5YZzqk+qGhKvyUGUVh6nKdi58TFMwFtDseFc65bK8m299A30zaJHUloq8ZjFo2Mld
         MnxA==
X-Gm-Message-State: APjAAAUrekBDK7SzkHuQdngXvQtDtqvKi81BH5+oM1r+mHh+FsUOpTdU
        uIuN0Br47HYlh84FRFZ8Y4rDpSPTxc2ilS+Y3UA=
X-Google-Smtp-Source: APXvYqwzA43pJ75xWdjZr/1FxJLgzCvjriHqFgeeCxpqvzGMwwIY68EPdaUrsAWEDnx2kn/bRktHLku73m9Xww4ptsY=
X-Received: by 2002:a92:9cce:: with SMTP id x75mr28964336ill.31.1572880079371;
 Mon, 04 Nov 2019 07:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20191102172606.26934-1-pbrobinson@gmail.com> <20191104145656.GA2210975@kroah.com>
In-Reply-To: <20191104145656.GA2210975@kroah.com>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Mon, 4 Nov 2019 15:07:48 +0000
Message-ID: <CALeDE9PJVLnRvCDTNQcC9jNKGZL0Vo9d0xRrMzcSP8TEaNcS8w@mail.gmail.com>
Subject: Re: [PATCH] usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 4, 2019 at 2:57 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Nov 02, 2019 at 05:26:06PM +0000, Peter Robinson wrote:
> > Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
> > ensures the firmware is available at the appropriate time such as in
> > the initrd, else if the firmware is unavailable the driver fails with
> > the following errors:
> >
> > tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin failed with error -2
> > tegra-xusb 3530000.usb: failed to request firmware: -2
> > tegra-xusb 3530000.usb: failed to load firmware: -2
> > tegra-xusb: probe of 3530000.usb failed with error -2
> >
> > Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
> > Fixes: 488a04d4bb2f ("arm64: tegra: Enable XUSB host controller on Jetson TX2")
>
> There is no such git id in Linus's tree :(

Tha'ts in the tegra tree for 5.5.

> This also doesn't apply cleanly to the usb tree, so I don't know where
> you want it to go, sorry.

Where is that? I can rebase against it, I'm guessing the tegra194 bits landed.
