Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D173E3304
	for <lists+linux-usb@lfdr.de>; Sat,  7 Aug 2021 05:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhHGDqW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 23:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhHGDqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Aug 2021 23:46:21 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7519C0613CF
        for <linux-usb@vger.kernel.org>; Fri,  6 Aug 2021 20:46:04 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id u5-20020a17090ae005b029017842fe8f82so11657866pjy.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Aug 2021 20:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dFMOaQ1wIyaNHFdBi6iDHks/xKc+ISaUBZ5TiLi7BzM=;
        b=Pwp7rVfpMM17fWLT0R65+6qq3v0MxTGO4bM9L+cjAPPjM29zdFlaxYoMxz/49/1z4x
         oim268V9xy/bm2GTFOoyH5ONmpKk+nd5XZrQ3QiSPxfPiNjThqansO+YyJBZeaqphH8x
         HBJSHk3t5kXycUZNN2FSznlv+fY54zphV3UauGHD/oFWNvp+mC267O6Uy5mjBq/alZaN
         SqiwoM2Lj/s65tn+dWZRMPiBgZCGbTP1k6hzrKLNIZjinpCdsXfDIeg+U2aWtOi4OHmm
         //YzJRQPm+lpEkkE3oKirPjuEg7AA87rgY4YqjQhJPjM21NgA+5cDjuuYqCl+IYsE6fw
         h8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dFMOaQ1wIyaNHFdBi6iDHks/xKc+ISaUBZ5TiLi7BzM=;
        b=ELzB5s8udc5U1LnIUGMpZNBGTrSlIHhy2ltff0ISL1lW1Lk4agULcdyk8c9vi+HPA8
         N6dWAdviw9YmlEbg5uONta85yi3QX/SF7kny+8kmA2znlGscsHd+z3AH/O1VbC57Mgp9
         VNZM6QbVG0NC1Gl/FbAmHZYv6c4Wd5/VI8fTFoYumlQAcQnOeQVzODfOF0LLFJ3Cs3MW
         QbKN6X3zg3B91L1mF9OZlvT3Ad/Z4Qnb4sV2U5BAXKeQiP0IGHI/kgSfXBy29wOGLHEe
         cbRJx7yxupAGTDQB3lsDxQdWXTDoJM3xOWPOEBbxJ/cY6x0esEepTN0uXk0NuItJamH0
         C8DQ==
X-Gm-Message-State: AOAM533nM0fBrQrdfIV5gApsA0jXFniIsYTpK+rltQ5yTYJ9lVrlNdHc
        Fn+3Hdje0uq3PGFvFrZXclRgVsFe4Rm7Pt24RL0wTolN5Lc=
X-Google-Smtp-Source: ABdhPJxbk4W9fXpWM44eJspyARLSbREKgIhqf8Fgg/9OkwpX8N16pzVrFR4D0Q8gwzE2d7BE0FDOZIdLE4XVdV0QvFk=
X-Received: by 2002:a63:101c:: with SMTP id f28mr316027pgl.330.1628307964380;
 Fri, 06 Aug 2021 20:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANTwqXBzZaPGomgsy00RhgTHvETWEXg_ZiL1ujgKmEU2TUsc_A@mail.gmail.com>
 <YQaQU0hkHQRcdjRC@kroah.com>
In-Reply-To: <YQaQU0hkHQRcdjRC@kroah.com>
From:   nil Yi <teroincn@gmail.com>
Date:   Sat, 7 Aug 2021 11:45:54 +0800
Message-ID: <CANTwqXCOBTWPyfS5yBpV2BQDrTYEevPUp8pGVtDg7d0ivM70gg@mail.gmail.com>
Subject: Re: [BUG]drivers: usb: serial: mos7840.c: dangling pointer in
 function mos7840_open
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sorry for the ambiguous description. I mean after usb_free_urb(urb) at line=
 723,
do we need set NULL to mos7840_port->write_urb_pool[j], otherwise the
freed urb pointer
may be used somewhere?

Sorry for the non-specfic comment again.

thanks,

Nil Yi


Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2021=E5=B9=B48=E6=9C=881=E6=
=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=888:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, Aug 01, 2021 at 05:03:30PM +0800, nil Yi wrote:
> > Hi, there is a dangling pointer in mos7840_port->write_urb_pool[j]  in =
function
> > mos7840_open in v5.14-rc3.
> >
> > in function mos7840_open err path :
> >
> > 717: err:
> > 718: for (j =3D 0; j < NUM_URBS; ++j) {
> > 719: urb =3D mos7840_port->write_urb_pool[j];
> > 720:  if (!urb)
> > 721:     continue;
> > 722: kfree(urb->transfer_buffer);
> > 723:  usb_free_urb(urb);
> > }
> >
> > leave a dangling pointer here,  I'm not sure whether it  can be
> > triggered somewhere.
>
> What exactly do you mean by "dangling pointer"?  What specifically is
> the bug here?
>
> thanks,
>
> greg k-h
