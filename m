Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D470D8FA7E
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 07:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfHPFwJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 01:52:09 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44545 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfHPFwJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Aug 2019 01:52:09 -0400
Received: by mail-ed1-f65.google.com with SMTP id a21so4122675edt.11
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 22:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc;
        bh=VK1O0SmaDaa73e4B9F4jAJsqBGQQuXkVt/6JtPL7I8o=;
        b=BcHz1CHN/m+fu/Tyn8vXXD7vVRb5h66GmnKYkrtVzdkC+QnRwL11eaqQt1IVD+Vnd2
         BpMk0RMKI62zLDN5NsiJJKxHArzlNM6HS7kEgsoA6GSQmQ3jp8SYIgeNlcmRerJXJm1t
         0+c2aeOoSxfen7OciX4B/DbcAoYgnKwbR+Lyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc;
        bh=VK1O0SmaDaa73e4B9F4jAJsqBGQQuXkVt/6JtPL7I8o=;
        b=F7+FapptMG0eHq9WlOvu1P2yI5fFSLfQqmhMj0aEWyzz7wl5wUsFzfXf0tzzuI7xRt
         GZ7AEIY3EH4nRT59EijlvppvYLM3Qkh0KL7wLz0NXzfRUKT8Kiouv+ToGuzg1nxbrQlT
         LyEJCZEMT/wgbCuSsuVJ2nOmchdDD395zzYZ235XXPq9CAaJeaX/bD4nhEllSvDO+t1U
         7ebwGcTS8iTQ7CyRihDWoTlCnLHJ5HxzUCLQF4OfWwiQzL6OP7tE8XNgVi2/gHlErRLh
         6YeBDMMId0APlJcoNyk8bYviz7zZ4pXRHf/CVpMlHebEWLwpEMUD3dA9FreFBfLTGwGp
         WVOQ==
X-Gm-Message-State: APjAAAWSnLGxOxkPn+NQ86VCnYkrT2ucCcf0Z/i8Y/gI/tcs1dbyo133
        6DchgHH6YRohWMxLOYijve12e45gPzI=
X-Google-Smtp-Source: APXvYqyILFvey5G1rT2eBavoEEQ61JohXeV9lRVvtsJKflWQ3sQgEIoXX/YNzMbkOy/uOm1yVvAcvQ==
X-Received: by 2002:a17:906:11d6:: with SMTP id o22mr7827388eja.60.1565934727645;
        Thu, 15 Aug 2019 22:52:07 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id r3sm917347edm.6.2019.08.15.22.52.06
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 22:52:06 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id f22so4159441edt.4
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 22:52:06 -0700 (PDT)
X-Received: by 2002:a17:906:fc06:: with SMTP id ov6mr7619647ejb.226.1565934725966;
 Thu, 15 Aug 2019 22:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190814212924.10381-1-gavinli@thegavinli.com> <20190815125314.GA24270@kroah.com>
In-Reply-To: <20190815125314.GA24270@kroah.com>
From:   Gavin Li <gavinli@thegavinli.com>
Date:   Thu, 15 Aug 2019 22:51:54 -0700
X-Gmail-Original-Message-ID: <CA+GxvY5+uyDrNM=XcfyhBXYvREf52YTfVb7FfcZa82jh_v08Dw@mail.gmail.com>
Message-ID: <CA+GxvY5+uyDrNM=XcfyhBXYvREf52YTfVb7FfcZa82jh_v08Dw@mail.gmail.com>
Subject: Re: [PATCH] usb: usbfs: only account once for mmap()'ed usb memory usage
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Gavin Li <git@thegavinli.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is done in usbdev_mmap(); it calls usbfs_increase_memory_usage() to
account for the buffer it allocates. No additional memory (other than
for the control structures) is needed when actually submitting the
URB.

On Thu, Aug 15, 2019 at 5:53 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Aug 14, 2019 at 02:29:24PM -0700, gavinli@thegavinli.com wrote:
> > From: Gavin Li <git@thegavinli.com>
> >
> > Memory usage for USB memory allocated via mmap() is already accounted
> > for at mmap() time; no need to account for it again at submiturb time.
> >
> > Signed-off-by: Gavin Li <git@thegavinli.com>
> > ---
> >  drivers/usb/core/devio.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> What commit does this fix?  What issue does this fix, is it something
> that is user-visable?
>
> >
> > diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> > index bbe9c2edd3e7..9681dd55473b 100644
> > --- a/drivers/usb/core/devio.c
> > +++ b/drivers/usb/core/devio.c
> > @@ -1603,7 +1603,8 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
> >       if (as->usbm)
> >               num_sgs = 0;
> >
> > -     u += sizeof(struct async) + sizeof(struct urb) + uurb->buffer_length +
> > +     u += sizeof(struct async) + sizeof(struct urb) +
> > +          (as->usbm ? 0 : uurb->buffer_length) +
> >            num_sgs * sizeof(struct scatterlist);
>
> Are you sure?  Where is the buffer_length being added to the size here?
> What am I missing?
>
> thanks,
>
> greg k-h
