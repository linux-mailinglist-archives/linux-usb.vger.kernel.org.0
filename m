Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F6016B2FC
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 22:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgBXVnJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 16:43:09 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:53541 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgBXVnJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 16:43:09 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so317552pjc.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2020 13:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f4i1Oi5gvnAT7W5MjdBiXsrt20m/drKTjt6b50/GmPk=;
        b=L7SG/xfX1nYfYR47lHZ/EU0bNdSkhTKLbKcDJ/0L4JsRZcNcDOwhFktZmAfS9XsEIb
         Eg4CWq2HuCVTvqoUK5NOUuVL7lhPfJG40VnuzY1tIcjUT7c+r1/jVyw1+gZVdVfaJAcM
         7Oqb/WvCaX08H6RatY4KlDnmebPamywqyhtN5cDyAcuK24daaFV75HsmTVlStqGr8xvD
         DtxBS46FVZ63h6pu17YHdQegTTHPEi6m4iEMqQ+6HpMnVbcFX3+Ea4HwCvhRQRDfSUza
         RHwop0L14gPlk5dnkyDk1/RTel8oW5xep+mKhfWXfAEMFN8EvOqxZHssMAtcazIX9JFM
         QCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f4i1Oi5gvnAT7W5MjdBiXsrt20m/drKTjt6b50/GmPk=;
        b=tsGuSVz9b+d9ITvDOnF8FWaBNSeiJfmLfY8VSuLh2YMYyiwaFuG5MlkSurkZScLRuh
         FYefZQaCmOTKmFRea2U2tHhbLO3bsvBYbEx0i1JdwHbTGIk334cQEAKJHxlSb8kYYN3Q
         oIhsQnumRwtIiTqTwbIrmN5X69L67Q+2QKreCIWZS2Im4ykBTwDlaj697XXRGPhBkV1y
         qWRxhkazjs33M5CWlSn2CZSuxVi2kBzaVDb/WhTxLyBcuQExTYq39q0i8FkHAX/AIAXh
         51DrEPtRZN9AnHDnSM+sQEfABfT4HoetYN80T4YM5i2mItV7rtt8bLBVIkwZqLbWJiBo
         EImg==
X-Gm-Message-State: APjAAAVyNOyw3onWZP50hU7qgA7R/lhpClNgncRp/khD4Y2f2QO7fzyb
        VJaOWfrAEknArAkbiClwJMYdw77DEbSl4mj/CJpBuQ==
X-Google-Smtp-Source: APXvYqx5PDmpmRkn5e1Czz8bTwU/PYLt2gbRo8nyFaCfXHR8fdccOtxwzqqR/+IBZX4HgL76XY/OS0FsqY1hOMTMEC8=
X-Received: by 2002:a17:902:760e:: with SMTP id k14mr49231805pll.119.1582580588273;
 Mon, 24 Feb 2020 13:43:08 -0800 (PST)
MIME-Version: 1.0
References: <20191023002014.22571-1-natechancellor@gmail.com> <20200221045740.GA43417@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200221045740.GA43417@ubuntu-m2-xlarge-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 24 Feb 2020 13:42:57 -0800
Message-ID: <CAKwvOdku24UV8J4uSKFFc7gmwOP28-8K352BJepb_z-octFoPw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: bdc: Remove unnecessary NULL checks in bdc_req_complete
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Ashwini Pahuja <ashwini.linux@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 20, 2020 at 8:57 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> I know it has been a while but ping?

Sorry! Too many bugs...barely treading water! Send help!

>
> On Tue, Oct 22, 2019 at 05:20:15PM -0700, Nathan Chancellor wrote:
> > When building with Clang + -Wtautological-pointer-compare:
> >
> > drivers/usb/gadget/udc/bdc/bdc_ep.c:543:28: warning: comparison of
> > address of 'req->queue' equal to a null pointer is always false
> > [-Wtautological-pointer-compare]
> >         if (req == NULL  || &req->queue == NULL || &req->usb_req == NULL)
> >                              ~~~~~^~~~~    ~~~~
> > drivers/usb/gadget/udc/bdc/bdc_ep.c:543:51: warning: comparison of
> > address of 'req->usb_req' equal to a null pointer is always false
> > [-Wtautological-pointer-compare]
> >         if (req == NULL  || &req->queue == NULL || &req->usb_req == NULL)
> >                                                     ~~~~~^~~~~~~    ~~~~
> > 2 warnings generated.
> >
> > As it notes, these statements will always evaluate to false so remove
> > them.

`req` is an instance of a `struct bdc_req` defined in
drivers/usb/gadget/udc/bdc/bdc.h as:
333 struct bdc_req {
334   struct usb_request  usb_req;
335   struct list_head  queue;
336   struct bdc_ep   *ep;
337   /* only one Transfer per request */
338   struct bd_transfer bd_xfr;
339   int epnum;
340 };

So indeed the non-pointer, struct members can never be NULL.

I think the second check that was removed should be
`req->usb_req.complete == NULL`, since otherwise `&req->usb_req` may
be passed to usb_gadget_giveback_request which tries to invoke the
`complete` member as a callback.  There are numerous places in
drivers/usb/gadget/udc/bdc/bdc_ep.c that assign `complete = NULL`.

Can the maintainers clarify?

> >
> > Fixes: efed421a94e6 ("usb: gadget: Add UDC driver for Broadcom USB3.0 device controller IP BDC")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/749
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > Note: I am not sure if these checks were intended to check if the
> > contents of these arrays were NULL or if there should be some other
> > checks in lieu of these; I am not familiar with the USB subsystem to
> > answer this but I will happily respin the patch if this is not correct.
> >
> >  drivers/usb/gadget/udc/bdc/bdc_ep.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
> > index a4d9b5e1e50e..d49c6dc1082d 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
> > @@ -540,7 +540,7 @@ static void bdc_req_complete(struct bdc_ep *ep, struct bdc_req *req,
> >  {
> >       struct bdc *bdc = ep->bdc;
> >
> > -     if (req == NULL  || &req->queue == NULL || &req->usb_req == NULL)
> > +     if (req == NULL)
> >               return;
> >
> >       dev_dbg(bdc->dev, "%s ep:%s status:%d\n", __func__, ep->name, status);
> > --
> > 2.23.0
> >
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200221045740.GA43417%40ubuntu-m2-xlarge-x86.



-- 
Thanks,
~Nick Desaulniers
