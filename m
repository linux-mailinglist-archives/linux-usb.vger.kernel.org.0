Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295378490F
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 12:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbfHGKCq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 06:02:46 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:36703 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbfHGKCq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 06:02:46 -0400
Received: by mail-vk1-f196.google.com with SMTP id b69so17940926vkb.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4V0+qD70SOiLiVjOOogYGyECPoNe15I4VmjykgTIIaA=;
        b=rAbowIMMM89jw/szg89P1gzqr5QkjkKxufeNG7xvAcw7/styJXfDgO4lBQT0gbIWCH
         Jssk5aXi756mFFY0MGtBxReXxw99+2JNGHjnopEi19WHOCzwv3EwOZgczWzRDkmOM/Zo
         nAtAVHnY8mh7FUiitQm2/KuVzicrlT4ueNj+KI25G+MmCY1VE1BShCQRRjyt0XGoW3fa
         kx1hjuBjuDr6T02h0DOSc2C8E8/+58jZUzToecCxX1HE4vhh1DGBQZhLa3tGJoWfQzLA
         50SE6iUv3z1VLA1I7XUIoZI/IQ+IWVaihwtGfg8bGYaObYLzn3AkpW9eg2EAdASaYEMe
         ri0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4V0+qD70SOiLiVjOOogYGyECPoNe15I4VmjykgTIIaA=;
        b=DStqh+tJnIZ2NE1wruQIV3SBiUiDiMxMYEpEe3zuojPSl4mT21kalAZahAe7q3B9w5
         X+W0rBjbmmStFbZP/sWNwkc+X5k7mvBCONyeduIR2L6Qqfc+eA+2vVBrRgo7JyvA+IH+
         XOo6RbBCSuR8JIJEq679OciVnHrD0QEEwYqfZkprbUTsH1CQKl50lt4WgucPB2wQs50r
         3O8p6OxLA2L4DXWU9XjcOo3n2eFXMSzXFnOawFCrkfFO2l3kLGNlSMLzQssgU3Da6AmR
         wm6FDK3+C9IgPPeJa/sNNdeI2WBzfZzUc+4WE3dDQxzrzNQwIWmUqE49ClHWkg0G6py/
         agTQ==
X-Gm-Message-State: APjAAAVX2KCLEdC6ZrsVYOR+uBuUvhPmyEBTbVDlvFEVHb/Ca9AkgKXQ
        xIix+G7N14ZO114qxVbIzFWrsJXNBa1rr9wtmx1mnq7oz0M=
X-Google-Smtp-Source: APXvYqzkCC3ZUPOGkz5RGtUwSqv3962JCTik5bClzmnJPqugFVn3653B+clwRnSQUF8BAwmLDI0vJpAPMyxTG40EJwE=
X-Received: by 2002:a1f:b7cf:: with SMTP id h198mr3156306vkf.33.1565172164352;
 Wed, 07 Aug 2019 03:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190806110050.38918-1-tweek@google.com> <20190806113701.GA18582@kroah.com>
In-Reply-To: <20190806113701.GA18582@kroah.com>
From:   =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date:   Wed, 7 Aug 2019 12:02:33 +0200
Message-ID: <CA+zpnLc-+PEMaQoeJwfBmPpPSknxK65kRLNv3aehb=hWqWc40g@mail.gmail.com>
Subject: Re: [PATCH] usb: setup authorized_default using usb_bus_notify
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, it does. Thanks

Thiebaud

On Tue, Aug 6, 2019 at 1:37 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 06, 2019 at 01:00:50PM +0200, Thi=C3=A9baud Weksteen wrote:
> > Currently, the authorized_default and interface_authorized_default
> > attributes for HCD are set up after the uevent has been sent to userlan=
d.
> > This creates a race condition where userland may fail to access this
> > file when processing the event. Move the appending of these attributes
> > earlier relying on the usb_bus_notify dispatcher.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > ---
> >  drivers/usb/core/hcd.c   | 123 ---------------------------------------
> >  drivers/usb/core/sysfs.c | 121 ++++++++++++++++++++++++++++++++++++++
> >  drivers/usb/core/usb.h   |   5 ++
> >  3 files changed, 126 insertions(+), 123 deletions(-)
>
> And does this solve the issue you reported yesterday?  If so, I'll be
> glad to backport this to the older stable kernels as well.
>
> thanks,
>
> greg k-h
