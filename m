Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A077F2FAD0C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 23:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387607AbhARWDH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 17:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387561AbhARWCz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 17:02:55 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FDBC061786
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 14:02:14 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id h18so10015809vsg.8
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 14:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cgYXXKDGBW6a/Ay3lvFyQRjl1IFnWA6SVXMh0iaCM6U=;
        b=eyMgvEKMYxzdZvh8xGdzUCAR5CvGMETl+M8cnoeriJLzg1OfILsdm/eOp6Oaln9s6b
         LqD8nFm7Hyk93ADZ6I0mplNmUXPSB1rzRSsY6lN2MnOBnviqDkrwT7cyQqoxHkWKKM+F
         To7ReuUilxRCUbWz4ER8OvSGYi0offyr/Audg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgYXXKDGBW6a/Ay3lvFyQRjl1IFnWA6SVXMh0iaCM6U=;
        b=UxbeHCp09sMyRxuy5nR/ojTAUxepBU//L544R2wx3+oZKLntXhtzW8LEJ/K+VTTkyK
         FFqrybG3DVjX+C0l/Jej6Hyp/zVYe4VvuzUqejrAMAe8Cw86XKOeEPGkj27V7IWWosiw
         wPUD/OrmDoN+nlPCao8GUeHMGOJHD/2K6R7S/VpXwyJgHBBlVRUskwFjudMfwtxrBmMm
         ZQc2Nm4HkrC5yOqUvEXc50Y5Fe10F07vkttvA96nQZAEexjFtGPNfwFC4T+SzI9/vWgx
         bHP3pb7M5WfZKWQRIT7bEGmGEc79Hd5xZe2hKLBkKl5HW5eSLzjOZBhYiXTathEFTAX8
         8JwQ==
X-Gm-Message-State: AOAM531hGDxJPOeSsSnxYEDyqS9LFrrI6idWt4uhy/M39MdHix4FAeqP
        oWekYdjqb5gvtBgYlbIAAiGpALWSmjweXR8oJv9ZwA==
X-Google-Smtp-Source: ABdhPJw+WCZE+eqHFzYlyDXhJA7chMXL2acKBGbLe9K3xWLbgbv5eSfb0jaPF08HUSLDtSOy898Z4m5uM/9x+cJn3io=
X-Received: by 2002:a67:2a46:: with SMTP id q67mr1070098vsq.40.1611007333852;
 Mon, 18 Jan 2021 14:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20210116052623.3196274-1-grundler@chromium.org> <20210116052623.3196274-2-grundler@chromium.org>
In-Reply-To: <20210116052623.3196274-2-grundler@chromium.org>
From:   Grant Grundler <grundler@chromium.org>
Date:   Mon, 18 Jan 2021 22:02:02 +0000
Message-ID: <CANEJEGsAfz1QSDOQK3vvSGStnXm4XS6Ah_fV4iv7Hgh2MWSjGQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] net: usb: log errors to dmesg/syslog
To:     Grant Grundler <grundler@chromium.org>,
        nic_swsd <nic_swsd@realtek.com>
Cc:     Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+nic_swsd [adding per Realtek developer team request]

On Sat, Jan 16, 2021 at 5:27 AM Grant Grundler <grundler@chromium.org> wrote:
>
> Errors in protocol should be logged when the driver aborts operations.
> If the driver can carry on and "humor" the device, then emitting
> the message as debug output level is fine.
>
> Signed-off-by: Grant Grundler <grundler@chromium.org>
> ---
>  drivers/net/usb/usbnet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index 1447da1d5729..bc7b93399bd5 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -887,7 +887,7 @@ int usbnet_open (struct net_device *net)
>
>         // insist peer be connected
>         if (info->check_connect && (retval = info->check_connect (dev)) < 0) {
> -               netif_dbg(dev, ifup, dev->net, "can't open; %d\n", retval);
> +               netif_err(dev, ifup, dev->net, "can't open; %d\n", retval);
>                 goto done;
>         }
>
> --
> 2.29.2
>
