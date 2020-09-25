Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7051E278F81
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 19:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgIYRWJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 13:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbgIYRWJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 13:22:09 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FBCC0613CE
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2020 10:22:08 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id z13so3598776iom.8
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2020 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zmn2jTYAzEfqz+G159l2r5nBlRpgrrSpB0f5FdFwkeQ=;
        b=s6MGPOApX4XnWYdvNh4SuEzGeFKdMtYmfL0AKHjQyDsEAmha5KtwN+1ZiIJ9OtJxCt
         zD2qSchMcj83qIywi2lZZ+/jB/iYUMIvsL1+Y6HLeXHpZY1mJgePfhHXDmAVrN0XW/d2
         bP2ku3VvXZ6X+mbjL77L2VOKTXeIQO02lnxseGqweuUyM17dHY6EDW1qRK8TjnhR5GY2
         ypSKAgNy0s8E/qzr4yte6Yxlq5BWcRlRMLzX50SDdz6Mnui5cbRKIFbibEXxf0iftVVR
         RvrB4NlMHD6G+NGcNKNC/10jVfLIxIq7QqrrkxZVBeFlA4HBhxiXr8hitAxDSnLLIyk5
         U0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zmn2jTYAzEfqz+G159l2r5nBlRpgrrSpB0f5FdFwkeQ=;
        b=Tx66nWlx4rJGajkuND/ggRG50C2SXeQh3vr8Flyp7tI/H++uM2nj2uAKQyJAtrLm4V
         avYE3c1ycBQpTEsYQxqd3+IFQc8mmDytSfCULJ3/mszJLyv97G+NhweUOsfpnUliKJRk
         ehtx3GN5+0bOoa1ssbVAdTk7mLXjR2TTLk4v7nDrChjEb7tR3cQQYqcjK6e845KLq03P
         1VQPrgMfXiXNiUNHh5175RA1ccePn1aTq2+iLB3c8tqnEzTKMTuHcrSSZTQ5D4a0AMaX
         7VZdzYpm3cAW7kN6XNGG9P6ZH+PvgwvswlfkCee0MgKMwyFFR4Dwm7tDdPqJcpQ96nmL
         UyGQ==
X-Gm-Message-State: AOAM533y37IYtM5ghSjZ3j3EVj1/TT6EenN0tF/tNPk6GKOj9Zu3cIjh
        UeTTuOce7C97nbKUbsUCOJ+wy7xlRJESwclQawc=
X-Google-Smtp-Source: ABdhPJyTWfPkacD6EP7V9nyLzXQoVjdr44YCT0Wi0zgJGPkFaW/73yvOPWTsdNrB3IOJ+i970cf2rBvnz+WUTkpfvPA=
X-Received: by 2002:a5d:984f:: with SMTP id p15mr1050937ios.70.1601054528051;
 Fri, 25 Sep 2020 10:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200920192114.GB1190206@rowland.harvard.edu> <20200921140342.3813-1-yazzep@gmail.com>
 <20200921144827.GC1213381@rowland.harvard.edu> <CAEt1Rjq-DOwN0+_7F0m-kqUHTzm5YPUaXqUOpTszCsqrfLRt5w@mail.gmail.com>
 <20200921150611.GD1213381@rowland.harvard.edu> <CAEt1RjoypwL9-NsuOfypvT09sQb_7PYbgzegaAH-RfbjLmL44w@mail.gmail.com>
In-Reply-To: <CAEt1RjoypwL9-NsuOfypvT09sQb_7PYbgzegaAH-RfbjLmL44w@mail.gmail.com>
From:   yasushi asano <yazzep@gmail.com>
Date:   Sat, 26 Sep 2020 02:21:50 +0900
Message-ID: <CAEt1Rjp2GKf47JZaRPAD3YnFWPF5+8mxHGmgY+F7Ta9wc1GvrQ@mail.gmail.com>
Subject: Re: [PATCH] Re: [PATCH v3] USB: hub.c: decrease the number of
 attempts of enumeration scheme
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     andrew_gabbasov@mentor.com,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Baxter Jim <jim_baxter@mentor.com>, linux-usb@vger.kernel.org,
        "Nishiguchi, Naohiro (ADITJ/SWG)" <nnishiguchi@jp.adit-jv.com>,
        "Natsume, Wataru (ADITJ/SWG)" <wnatsume@jp.adit-jv.com>,
        =?UTF-8?B?5rWF6YeO5oGt5Y+y?= <yasano@jp.adit-jv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Alan,
I received the test result of applying your patch and
my change from customer.
It was tested using PETtool. it barely passed the test.
It took 29.497 seconds. The patch worked well.
The following is an excerpt from dmesg.
Could you please merge my change and proceed with this PR?
I really appreciate your kindness.

[2] - [1] =3D 869.860348 - 840.363348 =3D 29.497

[  829.307248] *** Setting Test Suite ***
[  838.173580] *** Ready OK Test Start***
[  840.363348] usb 1-1.1: new full-speed USB device number 7 using
ehci-platform ... [1]
[  845.650354] usb 1-1.1: device descriptor read/64, error -110
[  845.841346] usb 1-1.1: new full-speed USB device number 8 using ehci-pla=
tform
[  851.283362] usb 1-1.1: device descriptor read/64, error -110
[  851.397049] usb 1-1-port1: attempt power cycle
[  853.216340] usb 1-1.1: new full-speed USB device number 9 using ehci-pla=
tform
[  858.451345] usb 1-1.1: device descriptor read/64, error -110
[  858.640352] usb 1-1.1: new full-speed USB device number 10 using
ehci-platform
[  864.212349] usb 1-1.1: device not accepting address 10, error -110
[  864.295350] usb 1-1.1: new full-speed USB device number 11 using
ehci-platform
[  869.844342] usb 1-1.1: device not accepting address 11, error -110
[  869.860348] usb 1-1-port1: unable to enumerate USB device ... [2]
[  885.407051] *** End of Test        ***

Best Regards
Yasushi Asano

2020=E5=B9=B49=E6=9C=8825=E6=97=A5(=E9=87=91) 10:05 yasushi asano <yazzep@g=
mail.com>:
>
> Dear Alan,
> I am waiting for the test result from the customer since Tuesday, but
> I have not received a reply yet. I will inform you as soon as I
> receive the result.
>
> Best regards
> Yasushi Asano
>
> 2020=E5=B9=B49=E6=9C=8822=E6=97=A5(=E7=81=AB) 0:06 Alan Stern <stern@rowl=
and.harvard.edu>:
> >
> > On Mon, Sep 21, 2020 at 11:59:31PM +0900, yasushi asano wrote:
> > > Dear Alan
> > >
> > > Thank you very much for the reply.
> > > please merge my modification to your patch.
> >
> > Yes.
> >
> > I will wait to hear the result of your test before I submit the changes=
.
> >
> > Alan Stern
