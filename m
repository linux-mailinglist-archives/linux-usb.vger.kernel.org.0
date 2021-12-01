Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCCF4643E7
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 01:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345674AbhLAAXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 19:23:07 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50824
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345660AbhLAAXG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 19:23:06 -0500
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E0C1F3F1C0
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 00:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638317983;
        bh=01pw2XK9Km906IXwU+bmXOrKNJsVY6W8/67XHtM+5hg=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=efYXkEdh1nKDsXUpUjFbiVw3zKbZ2TAIp/J67qjg6sDQDVrhCQOQA12cMfRL/LJoE
         6GDxTnwVRL9o+fUS/qJ798ItGvANv8oFeaCpqwVN2ft+IVlCm2ix+bP4Rb6Df9KY+7
         yZwSSVVdlsVxXopVo7hDHMQsv53RIguhhsZMkOVS0l7ac+vuBCAOIafxtgqYF5gFUj
         XBjZkxReq8cRPmZ3g12EI3sJ/YMfYl3X2Z9zvKX0bbtOBssBTS1GhX5iXpbX+Tty9Q
         P97TQIxZZ+5myIvrco9NSb1oHRJOuDS2caUB+HKbizASZZLx8nW1Q4HeDUkgBFa/5t
         a21CkMGKorSJQ==
Received: by mail-oi1-f198.google.com with SMTP id k124-20020acaba82000000b002a7401b177cso15048295oif.8
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 16:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01pw2XK9Km906IXwU+bmXOrKNJsVY6W8/67XHtM+5hg=;
        b=4LbmCxPNtbMqwaYhJp5KLPZx5U8Ji3HsmbubwRlSyq5chGn7WjuOE9v4+1eujQoKdZ
         t6gw0djM7tP1iZsgPSezVLBEEIRIqe20hVonxTnCk56OQ4zHOsa3WXkFkOsEbZUC33Yw
         R1ht6tnezZwhUOoWyPaUVBMHaO2f050tzN+8l1GrVdVZZklN37+Hw2PpNzaeM0UsrHDN
         dorcdm1/MD83CcesNfBtRVRvWu8KIwU4EQbnA9q5XGuMc3bVbqM5XIbiPxtjUn4REkwL
         XyvaOaJvmkxAXfoorJTP/xMXoycGPY286IPOfJB5F6DL3UEp0oQca+1+eRl1nt5s/Jve
         m4qQ==
X-Gm-Message-State: AOAM533+S/wfeqYQPy7gJZPyci4Tl7cqJR+NbZht8KdvtyM15vfi+RSK
        YBm57mWzUC/FNscvx4jQG6AmmKjWvC+FzWqSf2oSdrZfoyeFUvo/T8hpaa9zbUz68cYEam9Kn4S
        pXJXymB8gbafDcDXJk9xoxBplGCkuUoD8gCeQetW9LGudKSrM9kEBjg==
X-Received: by 2002:a05:6830:1d87:: with SMTP id y7mr2456761oti.269.1638317982816;
        Tue, 30 Nov 2021 16:19:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxPQ6CRshyoOaCaMBhQD/v7gSUzGCZdm4VmA5TtZCiYMZC/ZPvenHXjQ3iqrT8oFQPHC1KquzJl67OnvcNyYM=
X-Received: by 2002:a05:6830:1d87:: with SMTP id y7mr2456736oti.269.1638317982543;
 Tue, 30 Nov 2021 16:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20211119092628.677935-1-kai.heng.feng@canonical.com>
In-Reply-To: <20211119092628.677935-1-kai.heng.feng@canonical.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Wed, 1 Dec 2021 08:19:31 +0800
Message-ID: <CAAd53p4CpEQR0Y5XDN5E7xZ-iw2GG=gGMSm2Vd=V_M1LLEuuCA@mail.gmail.com>
Subject: Re: [PATCH] xhci: Remove CONFIG_USB_DEFAULT_PERSIST to prevent xHCI
 from runtime suspending
To:     mathias.nyman@intel.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 19, 2021 at 5:27 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> When the xHCI is quirked with XHCI_RESET_ON_RESUME, runtime resume
> routine also resets the controller.
>
> This is bad for USB drivers without reset_resume callback, because
> there's no subsequent call of usb_dev_complete() ->
> usb_resume_complete() to force rebinding the driver to the device. For
> instance, btusb device stops working after xHCI controller is runtime
> resumed, if the controlled is quirked with XHCI_RESET_ON_RESUME.
>
> So always take XHCI_RESET_ON_RESUME into account to solve the issue.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

A gentle ping...

> ---
>  drivers/usb/host/xhci.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 902f410874e8e..af92a9f8ed670 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -3934,7 +3934,6 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
>         struct xhci_slot_ctx *slot_ctx;
>         int i, ret;
>
> -#ifndef CONFIG_USB_DEFAULT_PERSIST
>         /*
>          * We called pm_runtime_get_noresume when the device was attached.
>          * Decrement the counter here to allow controller to runtime suspend
> @@ -3942,7 +3941,6 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
>          */
>         if (xhci->quirks & XHCI_RESET_ON_RESUME)
>                 pm_runtime_put_noidle(hcd->self.controller);
> -#endif
>
>         ret = xhci_check_args(hcd, udev, NULL, 0, true, __func__);
>         /* If the host is halted due to driver unload, we still need to free the
> @@ -4094,14 +4092,12 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
>
>         xhci_debugfs_create_slot(xhci, slot_id);
>
> -#ifndef CONFIG_USB_DEFAULT_PERSIST
>         /*
>          * If resetting upon resume, we can't put the controller into runtime
>          * suspend if there is a device attached.
>          */
>         if (xhci->quirks & XHCI_RESET_ON_RESUME)
>                 pm_runtime_get_noresume(hcd->self.controller);
> -#endif
>
>         /* Is this a LS or FS device under a HS hub? */
>         /* Hub or peripherial? */
> --
> 2.32.0
>
