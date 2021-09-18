Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732C54104C7
	for <lists+linux-usb@lfdr.de>; Sat, 18 Sep 2021 09:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240528AbhIRHbj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Sep 2021 03:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhIRHbi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Sep 2021 03:31:38 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92427C061574
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 00:30:15 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id n27so17359832oij.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 00:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IkWeWxKG6OBCkae7TqsDelS8z6inBTXQYbU716bT8Z8=;
        b=lyKbSTfedsCK9BvIw0m7Fw/29KvoCIiBetHUsMcr0i/mQoQJZeUF1+h4ATvkDyC26V
         ahBvAnjNv63W6RMa7CHFLmuk8s7+QSX6Rq31UBngGoxy72+xWH4Lx/r+dxF60HyALbQb
         qMl7JhakBnNZOMz14zTq6+dlvvcp/H13bj2m2hUsA6IAI4GZ/o/6NtHL3wpwBWpvTxhs
         iVKTCrW0MOaA/lnWPpmjan6mEX+UPPKqSSoB15DWI/t32Nhu6DxiervX3KNORIm/aiyW
         G7HgezeUxc+PUaP2eLIFKrFx/6fzwJdTITtBCYE4HV8/E2scJ/BwJbikQx0innBARt6z
         oaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IkWeWxKG6OBCkae7TqsDelS8z6inBTXQYbU716bT8Z8=;
        b=0SPkV9wRL8jUjWe6CvRQ4Zw/I5+il645lLSqJobB9qZXva363GHT1eETRP2nrPmGte
         P+7o7duXCR2r0m+qlQ4PsVhqaR+8v3Bs3CdKxj6miQT6rOQv+qelF7UtZE/iYIFQRPx/
         uWHs9ZPyaJ6rjI0YX5sP5eGZFgOknX/XY3ahAsAaf9e8MJfSdv7G5FWJoG8utKIb5rUj
         BZWRXwvlUJsDYhSdIofvI0IV5sLiLUbTU7D99x4CWuaDBSKko9UaGjb1b3l/zmHdTLO0
         5Ev8O43Mkmf3HsJ33P9YtWYc7jki1IFEE1MCaRtRmyPumlws6uKlOCNJCu5WIUEzs/C9
         +mMA==
X-Gm-Message-State: AOAM533YRkcO5Ouffqw2hND7QUSS+9+0ZAir6dmkFGtOAK6os1KA1ZN8
        TTmk/tX959jjO7qhjypbJ7bSU4csuSOfWDJDqhpHSnhXBMA=
X-Google-Smtp-Source: ABdhPJxpqptPMj49kHzl0S1jr8kVgQv7d0+UhYWi9x2N6taO2LoVd5pPtxKHhR+CoZ50q9jdZdDLRC042o5dIeqev5Q=
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr6765999oic.91.1631950214923;
 Sat, 18 Sep 2021 00:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHP4M8Vc+0eChmJDnLLa3ibuzGLOnc5hJ1Nk09794RHEJ7tEPw@mail.gmail.com>
 <CE84D77A-93F8-43B2-A952-896D6BED2E6D@msweet.org> <CAHP4M8VYhUDzvXO35=urBsz0suTA+0eMQ34f6-v9D0zE9fvDgQ@mail.gmail.com>
 <CAHP4M8W-z_L3r0kDbW943A6hm9y3gXzYJd=ZOpi+w9okS1zaaQ@mail.gmail.com>
 <3C27F76A-CE48-49E3-9078-CBE02B4E287E@msweet.org> <CAHP4M8WB3_Vf6p6=-yoA2MXa2Zun46DWL05MPra_VbOe6-uj5A@mail.gmail.com>
In-Reply-To: <CAHP4M8WB3_Vf6p6=-yoA2MXa2Zun46DWL05MPra_VbOe6-uj5A@mail.gmail.com>
From:   Ajay Garg <ajaygargnsit@gmail.com>
Date:   Sat, 18 Sep 2021 13:00:02 +0530
Message-ID: <CAHP4M8ViwcqAbgySFzoG10SqpJSP9MMn37tt_Gc8umx7eZp_jg@mail.gmail.com>
Subject: Re: How to register a new "function" in configfs?
To:     Michael Sweet <msweet@msweet.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I just had a hunch, and I checked the libusbgx code.
There it was found that there are function-specific checks, and *gser*
works because it is present here.

All in all, I need to add my function *ajaytest* in libusbgx (which I
will do locally).

I am sorry for the noise, and thanks everyone (especially Michael for
taking his time out).


Thanks and Regards,
Ajay

On Fri, Sep 17, 2021 at 8:55 PM Ajay Garg <ajaygargnsit@gmail.com> wrote:
>
> Hi Michael, thanks for the reply.
>
> My gadget-driver is actually an almost copy of
> drivers/usb/gadget/function/f_serial.c, except that the above
> TTY-layer has been removed. I wrote this driver for my learning, to
> learn simply sending/receiving of bytes using a host-driver as the
> peer.
>
> This test-driver of mine loads/works/communicates fine if
>
> * I load my test-driver, exposing *gser* function.
> * I load the gadget using *gser* function.
>
> However, if
>
> * I change the exposed function to something like *ajaytest* in my test-d=
river.
> * Then load the driver (successfully).
> * Then try loading the gadget using *ajaytest* function, the gadget
> fails to load, saying "Function not found".
>
>
> Let me see if I can post my code, probably on github, for a better public=
-view.
>
> On Fri, Sep 17, 2021 at 7:47 PM Michael Sweet <msweet@msweet.org> wrote:
> >
> > Ajay,
> >
> > It is really hard to help further without seeing source code...
> >
> > I assume you've verified that your gadget driver module is loaded?
> >
> > And in your code:
> >
> > - Did you use the MODULE_LICENSE, MODULE_AUTHOR, and MODULE_DESCRIPTION=
 macros to define your driver metadata?
> > - Did you use the module_init and module_exit macros?
> >
> >
> > > On Sep 15, 2021, at 9:51 AM, Ajay Garg <ajaygargnsit@gmail.com> wrote=
:
> > >
> > > Any pointers, please?
> > >
> > > On Sat, 11 Sep 2021, 20:28 Ajay Garg, <ajaygargnsit@gmail.com> wrote:
> > > Hi Michael,
> > >
> > > Thanks for the reply.
> > >
> > > I am a bit of old-school, and would prefer things in one place only
> > > (in the kernel) :)
> > > Thus :
> > >
> > > a)
> > > I wish to have all the endpoints configuration/management in the
> > > kernel only (like done in drivers/usb/gadget/function/f_serial.c,
> > > drivers/usb/gadget/function/u_serial.c).
> > >
> > > b)
> > > Only the attributes like vendorId/productId would be in configfs, to
> > > help setup the device.
> > >
> > > c)
> > > No user-space management of kernel objects.
> > >
> > >
> > > Either-way, I think that my issue of "function exposure" would remain
> > > the same, irrespective of whether we use configfs for managing the
> > > kernel-objects (please correct me if I am wrong).
> > >
> > >
> > > Thanks again for your time, look forward to listening back !
> > >
> > >
> > > Thanks and Regards,
> > > Ajay
> > >
> > > On Sat, Sep 11, 2021 at 8:01 PM Michael Sweet <msweet@msweet.org> wro=
te:
> > > >
> > > > Ajay,
> > > >
> > > > Quick question (as someone who has been down this road), do you nee=
d to do a kernel driver or could you just use the functionfs support to imp=
lement everything in userspace?  I found that path to be much easier and le=
ss error-prone (and one of these days I'm going to be contributing some doc=
umentation changes to make some things clearer...) and I was able to get my=
 IPP-USB implementation up and running very quickly.
> > > >
> > > >
> > > > > On Sep 11, 2021, at 1:43 AM, Ajay Garg <ajaygargnsit@gmail.com> w=
rote:
> > > > >
> > > > > Hi All.
> > > > >
> > > > > As a first step, I have been able to load a gadget on configfs, w=
hich
> > > > > binds to the function "gser" (thus loading up the usb_f_serial mo=
dule
> > > > > when the gadget mounts). Things work well till here.
> > > > >
> > > > > Now, I have written a brand-new gadget-side device-driver, trying=
 to
> > > > > create a new function "gusb", via DECLARE_USB_FUNCTION_INIT.
> > > > > However, now when I try to load the gadget for binding to "gusb",=
 I
> > > > > get the error that the function cannot be found.
> > > > >
> > > > > Seems that firing up a new gadget-side driver, that registers a n=
ew
> > > > > function via DECLARE_USB_FUNCTION_INIT, is not enough to make the=
 new
> > > > > function visible across the kernel.
> > > > >
> > > > > Kindly let know what I am missing.
> > > > > Will be grateful for pointers.
> > > > >
> > > > >
> > > > > Thanks and Regards,
> > > > > Ajay
> > > > >
> > > >
> > > > ________________________
> > > > Michael Sweet
> > > >
> > > >
> > > >
> >
> > ________________________
> > Michael Sweet
> >
> >
> >
