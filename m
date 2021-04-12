Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F05C35C72B
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 15:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241874AbhDLNLP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 09:11:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41700 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241682AbhDLNLN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Apr 2021 09:11:13 -0400
Received: from mail-lf1-f72.google.com ([209.85.167.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1lVwL8-0002Ms-Ty
        for linux-usb@vger.kernel.org; Mon, 12 Apr 2021 13:10:55 +0000
Received: by mail-lf1-f72.google.com with SMTP id s16so4577106lfi.17
        for <linux-usb@vger.kernel.org>; Mon, 12 Apr 2021 06:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrLEyIjUJblo7S+sNtRpgmhy7N1VnkqDo/WR8LuV+WE=;
        b=oaAwvLtjR94Kq/YS4SOIBXw4EvVSXis5WBhMjCr/SUouoFNIqUsYmetMyU5f3Nb/5L
         KLUED9appj/QIfYnaGU4hqHyEq6dkkzhKdP0+Ozj/TAlb3ZdC2+7h45om8OZyiMP2iSU
         voPynb4bnWY86lJ2EXzabfSK11lpI/3dsZP72FAjLP+qRmQlQm7zjkibU8kXBFM+fwA6
         Hjg4DK3arAi9Lf8ERqy4nyDA2pR/FUMSrL2U8dRRv60hOssuv61uAGpKqO6b0P3yf5rA
         fNfBUAd0y6saNPxcVtvlzhcDs8ZFm49vn5aa9unRj4Ccgl5JFeZioGvjIknIlzpcXR21
         /JvQ==
X-Gm-Message-State: AOAM5315Yg2g6yFtf0dO01eMW9EZInnzT7J4FqM4NZkT0na+NmQnEBN8
        3KtuJYbndDKYdqMHxBWdy8zX7VIFSLk9SSUq0v1D+yeN1008MPJ9Vqny4jV68jbkaQS+NQRjtey
        b7+fW7dGnlqk7axtLmy/p/1VqHJQtGgB9G5YMvJLPj6f6fQp7W832XA==
X-Received: by 2002:a2e:3013:: with SMTP id w19mr6015216ljw.97.1618233054225;
        Mon, 12 Apr 2021 06:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR6IaQiNoP7RnPnhejo3H1RZrmk1Ll/HnLTHpwJGxLrQRRT95FsAHdmJyp1uD9Y3PpSPQl+1ZnWlUgkJFFsvs=
X-Received: by 2002:a2e:3013:: with SMTP id w19mr6015202ljw.97.1618233053976;
 Mon, 12 Apr 2021 06:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210412130521.782373-1-kai.heng.feng@canonical.com> <YHRGhQ51LeouoWEv@hovoldconsulting.com>
In-Reply-To: <YHRGhQ51LeouoWEv@hovoldconsulting.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Mon, 12 Apr 2021 21:10:41 +0800
Message-ID: <CAAd53p6He-YUh8pUS=bQvfbyQYXWpm+B-6b=Tc_VDy4jMu2rvA@mail.gmail.com>
Subject: Re: [PATCH v2] USB: Add LPM quirk for Lenovo ThinkPad USB-C Dock Gen2 Ethernet
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        penghao <penghao@uniontech.com>,
        Oliver Neukum <oneukum@suse.com>,
        Jonathan Cox <jonathan@jdcox.net>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        =?UTF-8?Q?Tomasz_Meresi=C5=84ski?= <tomasz@meresinski.eu>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 9:09 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Apr 12, 2021 at 09:05:20PM +0800, Kai-Heng Feng wrote:
> > This is another branded 8153 device that doesn't work well with LPM
> > enabled:
> > [ 400.597506] r8152 5-1.1:1.0 enx482ae3a2a6f0: Tx status -71
> >
> > So disable LPM to resolve the issue.
> >
> > BugLink: https://bugs.launchpad.net/bugs/1922651
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> > v2:
> >  - Put the quirk in the right order.
>
> Seriously... You sent the exact same patch again. Still not ordered.

Oops, sorry for that, I mistyped the patch name :(
Will send a correct one.

Kai-Heng

>
> >
> >  drivers/usb/core/quirks.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index 76ac5d6555ae..dfedb51cf832 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -434,6 +434,9 @@ static const struct usb_device_id usb_quirk_list[] = {
> >       { USB_DEVICE(0x1532, 0x0116), .driver_info =
> >                       USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
> >
> > +     /* Lenovo ThinkPad USB-C Dock Gen2 Ethernet (RTL8153 GigE) */
> > +     { USB_DEVICE(0x17ef, 0xa387), .driver_info = USB_QUIRK_NO_LPM },
> > +
> >       /* Lenovo ThinkCenter A630Z TI024Gen3 usb-audio */
> >       { USB_DEVICE(0x17ef, 0xa012), .driver_info =
> >                       USB_QUIRK_DISCONNECT_SUSPEND },
>
> Johan
