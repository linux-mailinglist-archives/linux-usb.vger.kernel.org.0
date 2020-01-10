Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8611373FF
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2020 17:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgAJQq2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jan 2020 11:46:28 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54808 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728640AbgAJQq2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jan 2020 11:46:28 -0500
Received: from mail-ot1-f69.google.com ([209.85.210.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1ipxQX-0001iZ-Hd
        for linux-usb@vger.kernel.org; Fri, 10 Jan 2020 16:46:25 +0000
Received: by mail-ot1-f69.google.com with SMTP id l13so1313573otn.18
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2020 08:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQVWx4QNhRD4TIH8ouCI9fTYbhvOJqvf6CUY9/jji4k=;
        b=HNY9yvpp33Wp5K2IQbhtxHPFTAuTKSb0Eh2wIkhrY9uM/ULYTP9qqhAPqZEQnycp6p
         gRns4+5h7A75uIzmXI5QHmXLhethB+InrPaZh7XUvmDmjEnhjSm+g5CImsxhykH00UHx
         unUFN0gvkOHcg2x/L5S26uMNBgipAdLA80I5AfhAzXxWh0cqHa+WmmG96NDZ8isoZHCc
         JBw9tGKTTZJJfOQsSCAICu9GOtsAmdi9Fsk4+sHkPoKR/uTU+NTEAr0VK7wBQlYL0Ok8
         fnAr4+mT8B8fGeZyoT2emuIYDNlhd1VImdI8jPj2Y3xTf6/wCZQoJNmfkTcDnEUXFDXT
         lgMQ==
X-Gm-Message-State: APjAAAVijocdtANQAjoF4dxPQ1MukZJAHeshso0hB+KJtRJSScQprlbI
        bZMxmMRHxEU8mgu6/wA9EbEDxDfKcXEVQfPCeQgOIIB5cTvkTJ+jorLVpq1tmd7E0pwKjc9q+nb
        mXquM7mEvzDbTn0jYDcQ8NkbxDB3BOVzZincgVMjSe9nj3OnmP+O05Q==
X-Received: by 2002:a05:6808:aba:: with SMTP id r26mr2799667oij.4.1578674784192;
        Fri, 10 Jan 2020 08:46:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzq1MqosWbF4CVhTlVU69vywCAnfgPQvC6kJVir/1da8ItWsx4qTVXuRYH/TzuJwTcRxPDk7Sm9MfunFZqb4Eo=
X-Received: by 2002:a05:6808:aba:: with SMTP id r26mr2799650oij.4.1578674783906;
 Fri, 10 Jan 2020 08:46:23 -0800 (PST)
MIME-Version: 1.0
References: <CAAd53p56QynOLJPi3kKiQB1iScrDxj3X1FiycuVF7tP75yPD8A@mail.gmail.com>
 <Pine.LNX.4.44L0.2001101135450.1467-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001101135450.1467-100000@iolanthe.rowland.org>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Sat, 11 Jan 2020 00:46:13 +0800
Message-ID: <CAAd53p7aFKEgic+48EsN=vMjtoyDhVP7HkOMQic20-o9mAY0Ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] USB: Disable LPM on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 11, 2020 at 12:36 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 10 Jan 2020, Kai-Heng Feng wrote:
>
> > On Fri, Jan 10, 2020 at 11:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, 10 Jan 2020, Kai-Heng Feng wrote:
> > >
> > > > Realtek Hub (0bda:0x0487) used in Dell Dock WD19 sometimes drops off the
> > > > bus when bringing underlying ports from U3 to U0.
> > > >
> > > > Disabling LPM on the hub during setting link state is not enough, so
> > > > let's disable LPM completely for this hub.
> > > >
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > ---
> > > >  drivers/usb/core/quirks.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > > > index 6b6413073584..2fb7c1602280 100644
> > > > --- a/drivers/usb/core/quirks.c
> > > > +++ b/drivers/usb/core/quirks.c
> > > > @@ -371,6 +371,9 @@ static const struct usb_device_id usb_quirk_list[] = {
> > > >       { USB_DEVICE(0x0b05, 0x17e0), .driver_info =
> > > >                       USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> > > >
> > > > +     /* Realtek hub in Dell WD19 (Type-C) */
> > > > +     { USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
> > > > +
> > > >       /* Action Semiconductor flash disk */
> > > >       { USB_DEVICE(0x10d6, 0x2200), .driver_info =
> > > >                       USB_QUIRK_STRING_FETCH_255 },
> > > >
> > >
> > > This is a very partial patch.  There were four hunks in the original
> > > version but there's only one hunk in V2.
> >
> > Because the original approach is insufficient, it significantly
> > reduced the fail rate but the issue is still there.
> > USB_QUIRK_NO_LPM is used instead so no other parts are needed.
>
> Oh, all right.  This change looks okay to me.  Has AceLan Kao tested
> it?

He didn't test it. I have physical access to the hardware and I've
thoroughly tested it.

Kai-Heng

>
> Alan Stern
>
