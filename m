Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA76213562
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgGCHqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgGCHqe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 03:46:34 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA062C08C5C1
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 00:46:33 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id v26so3908854vkn.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0DyKAQkW00TRAeUXPrd0ELexasXxP3Ry8n63/DsVUaw=;
        b=BPKUE5DFk+AICKQXUWM8Khd0RoyuzYK+K93IC4y8w3ODgqYesw55sD9g0dwUFhB0Z3
         28y7SJQSIBrJTsqpysGLNi1qTdp9EmPmKmmdQK5PqeBgk8NbtQKEHyrveVJ1xBA9IRVR
         zaDdPr1V5e7mPF8jlMONqvaHE+PpjwmycqWNhuTC5MpZ8EqeVnE3CCpZwWYGybrTG6Tg
         e4ECavR5uufGzC2fwZ4Trr+2SFSrxA/4eWN3hoXCRIQ7y3CuQEtxOjekkWLL9PaGzW5C
         8P3st6ByYVNmW560/ee2sbHBi3foUy5ynWaMH4t2kH+3Vb6aRk3mIpXF9lPDlrLc1DrV
         WIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0DyKAQkW00TRAeUXPrd0ELexasXxP3Ry8n63/DsVUaw=;
        b=E9YJ9hJlziFWMUH7UidPAfIOW3VD3GepeXDdmMJWrykzt9Z1SwTEWtv/iI7RXFTX28
         SO0v0w+J6wKcIAWHLBCcPAcY+a0M/2N9AmBqIUXHYu2eqzxmGlvQVvVUWcCq0Jw6tbK4
         6NF8/GPO4NIQVp8+zWFwSy2L/c/IumeGiIHgMT23n3Maa5Cj4AhH9sX2lk0aalEBwPSl
         y2u8ZuzTXouB1KYaNPArYCZwyfPngnfHYPiqZCLmaWUzAToGFtE8Bx0bjKl+KH2gTHmX
         iVt6rVm2BhoxkcvM6U4QrjeQqSxKXIwsyUeYP+4Y3huMtyKu6jKthKRwDvn1jeOhT2VE
         kGAg==
X-Gm-Message-State: AOAM5325/sZmUga9iCKDe7NCEAk1a0SDkncwOdY0x7TqF5wo4FdhOCq/
        M8P9vjrgijjBkaHuxUFZa2V/5Z1sMtP3dY4RFAk=
X-Google-Smtp-Source: ABdhPJy2AtmnERnKQ79s7Byj3TaJk238PYYN6nXC0pA2cmTCErx4YMq1nT/2QUO55/sLoJTO4m60FrktlVaaDg5ER+A=
X-Received: by 2002:a1f:66c2:: with SMTP id a185mr25294969vkc.31.1593762393065;
 Fri, 03 Jul 2020 00:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
 <CAKgpwJV3pF0x6X6eUPVu4PnicTKta9qTQGsbaAZQ1rznZhkeLw@mail.gmail.com> <CALAqxLWSj+cXg3Oi+HH3DobhtZRiXQ_LeiWS8CLkR3E2v5A20Q@mail.gmail.com>
In-Reply-To: <CALAqxLWSj+cXg3Oi+HH3DobhtZRiXQ_LeiWS8CLkR3E2v5A20Q@mail.gmail.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Fri, 3 Jul 2020 15:46:21 +0800
Message-ID: <CAKgpwJU1y-ufOLFm25uLTPP7hA8rYDYGU_LtwuP6SWr3tMjKgQ@mail.gmail.com>
Subject: Re: dwc3 inconsistent gadget connection state?
To:     John Stultz <john.stultz@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

John Stultz <john.stultz@linaro.org> =E4=BA=8E2020=E5=B9=B47=E6=9C=883=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8811:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jul 2, 2020 at 7:55 PM Jun Li <lijun.kernel@gmail.com> wrote:
> > John Stultz <john.stultz@linaro.org> =E4=BA=8E2020=E5=B9=B47=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=885:46=E5=86=99=E9=81=93=EF=BC=
=9A
> > > I was curious if you or anyone else had any thoughts on how to debug
> > > this further?
> >
> > If you force your gadget to be USB2(e.g. in dts)
> >
> > +       maximum-speed =3D "high-speed";
> >
> > will you still reproduce this issue?
>
> Thanks for the suggestion! Unfortunately, I gave that a try, but still
> reproduced the same issue with this setting.
>
> Curious, what the issue is your were thinking this would help with?

I had experience device mode had problem on super speed channel
with some switch device between the host and type-C port, then it will
not downgrade to enable USB2 term so host can't detect the my board's
typec-C port.

>
> > Does your gadget connect to host super speed port directly via a C-to-A=
 cable
> > in your test labs? or there is something between?
>
> I'm not sure of the details in the lab, however I can reproduce this
> on my desk with a Host machine <-> USB hub <-> USB-C port.
>
> Additionally, the board itself is a little complicated, in that the
> USB-C port is USB2 only (however, it does have two USB-A USB3 ports
> behind an on-board hub and a switch to decide if the USB-C or hub
> ports are enabled since there is only one usb controller).

So actully you should limit the gadget speed to be high speed for your
USB2 only type-C port.

Does the host machine can detect the connection when you plug in?

Li Jun
>
> thanks
> -john
