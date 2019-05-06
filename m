Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C748414A2A
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 14:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfEFMrz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 08:47:55 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35934 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfEFMrz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 08:47:55 -0400
Received: by mail-oi1-f193.google.com with SMTP id l203so9433374oia.3
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 05:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jEiLUZdOUaVTCenzTYvw5tE0xb8UTmVOpukXn+mEM6Y=;
        b=YgzlbEY/g+uaGTZ0Gh5rsLpQaz9zWbEgc0EQwdeLLU4MsPy56/HWN7aEakMQ4c+b+X
         1OuMYHVCiivV/hFsNO5iz428kfZdHUbTsJC+ksHj5yLJkKFrcHIoal5R7y4ceptSoYeh
         YfOWiux236sax2SJMTvoqzz17T9DmSkigXHvvda8KQmGQ7Eb3QsygiluaYeUk0t3tl5r
         0dVi0wOHoWHvftUQurmYLLDiTwqfsjIFrT4WfB10aqgSh3FW53iRhgQW6QM/6Lrhl2/P
         K4DvJeK2dhl84OwDKp7CffbXVq2+iLm9+1tGspQZJ36B/JSD4tOZ4TnAMdCnPJaZj4W+
         +y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jEiLUZdOUaVTCenzTYvw5tE0xb8UTmVOpukXn+mEM6Y=;
        b=Vvt6z2ntu1TPnMrMRh3DBccRFIioe26A+Rs3aFO6Lqh+AWwdlPCxGujIfSlSgiWYQz
         pklc522BN0RoTFwmihWZyjHw++hqP2FfgsCkl/a21hIePwanrtJpQOS8x9lC+/5c1tj0
         BUpaANyuAbr+82ZynNdKNti5hEsyPJ+mdJcxLd3DaUqov0HYFEzfrCx7XPRysGZcBvBm
         m0LcO9TXsH+vDyQuZ59zGZYuVk+btH10bIQqGZePqRfZZPHdn/YIlgR/2mJFKllEOVha
         lCDOwmwluV9qgHmKUuMk2aAvW+ThZaCfBY0MsOdZDUSii01u3ivumdtDNKxzsTLoM+Sz
         QybQ==
X-Gm-Message-State: APjAAAX1X2qbyhI+P/0qluFDe6lwUH7q/63L9gyCbbsweMk2nVDN7F/3
        jpZ94b3wFB1SLDMWF22XtgOb0ob2+/Nl0Fakfmw0FN1FQ40=
X-Google-Smtp-Source: APXvYqxef4snHtmBm6dG6RwOeYPFe6RxuuSxNbcNb3VQH3o9qeKErI5BRApVFARjTvV97UA+YjQvrt4LI56jbgzobS4=
X-Received: by 2002:aca:1a16:: with SMTP id a22mr427282oia.174.1557146874781;
 Mon, 06 May 2019 05:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190506090241.169665-1-grawity@gmail.com> <20190506090241.169665-9-grawity@gmail.com>
 <20190506122922.GA25449@kroah.com>
In-Reply-To: <20190506122922.GA25449@kroah.com>
From:   =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date:   Mon, 6 May 2019 15:47:43 +0300
Message-ID: <CAPWNY8XTmzWi05GGKBDJGPaYUttSF7G5GdDEXRo4Q16RLNHJ6A@mail.gmail.com>
Subject: Re: [PATCH 08/34] lsusb.py: do not entirely hide usb.ids exceptions
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 6, 2019 at 3:29 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 06, 2019 at 12:02:15PM +0300, Mantas Mikul=C4=97nas wrote:
> > Signed-off-by: Mantas Mikul=C4=97nas <grawity@gmail.com>
> > ---
> >  lsusb.py.in | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/lsusb.py.in b/lsusb.py.in
> > index f9e273d..0d7ff95 100644
> > --- a/lsusb.py.in
> > +++ b/lsusb.py.in
> > @@ -610,9 +610,8 @@ def main(argv):
> >       if usbids[0]:
> >               try:
> >                       parse_usb_ids()
> > -             except:
> > -                     print(" WARNING: Failure to read usb.ids", file=
=3Dsys.stderr)
> > -                     #print(sys.exc_info(), file=3Dsys.stderr)
> > +             except IOError as e:
> > +                     print("Warning: Failure to read usb.ids:", e, fil=
e=3Dsys.stderr)
>
> This patch is a bit "annoying" in that now I see the error:
>         Warning: Failure to read usb.ids: [Errno 2] No such file or direc=
tory: '/usr/share/kcmusb/usb.ids'
>
> When I never would care about /usr/share/kcmusb, the "problem" is that
> the usb.ids file is no where in any of the other "default" choices in
> the system.
>
> So I suggest either saying "here's all the places I did not find it", or
> just stick to the error that we have today, as this feels worse to me.
>
> thanks,
>
> greg k-h

Ah, I guess I'll have to redo that. Maybe it would be best to suppress
errors for default paths, but still show them for user-specified paths
(--usbids-path)?

(Actually, I assumed @usbids@ as the 1st item would be substituted on
most systems. However, I don't quite understand why e.g. the KDE
kcmusb path was added here... Is the list meant to have all possible
paths, or is it meant to require the distro to specify the path? It's
currently a mix of both.)

--=20
Mantas Mikul=C4=97nas
