Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045BD1CAA74
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 14:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgEHMWd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 08:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726636AbgEHMWd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 08:22:33 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40206C05BD43;
        Fri,  8 May 2020 05:22:33 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id r2so560591uam.7;
        Fri, 08 May 2020 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uwlBuQarJbYZ/qmwGK7ulcoXx0nS8JnSLQMkgBqaCH8=;
        b=XH/h/4bAvi1PWfBXOzFpXnpPqp4LEEkkxcTxr6CwbrQPu9CHnCKbjSJvJBdsg1huPu
         3oHmenQiME2OHRUxEwuzR5v3nLy57HfFUV0yvgPHNWvE5MdaQbQcVPlaK2owzsguiQkj
         f21T/pA/dPQhFeAw3PiM9nLUpQroIhxpW8fDfq02A97Zy/43TbYwf1n7GazqbLXjwwtB
         4kNcvvRoZ7Wd13dh5I0pFhYINDCgT9GrMjHo++3vUG4gRhnC/p49/7x7C8gzi0tTYWTy
         62ygzhbeg3q2keo7/vxbOBsau/k9sOzOmFE1vOSMGEhhk0ThjdzjeBam5NYdyuu+Td0S
         bhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uwlBuQarJbYZ/qmwGK7ulcoXx0nS8JnSLQMkgBqaCH8=;
        b=iYn1hjHcL9D/sxPmM4Dum1WO1rrMafnMT44zRuZZTHgqzHO8V2dW1/6zvhnleHKPCl
         Z3HpFpireNpQpMdVYwThorpTG3uWyGHsKxKgPh0ZXykktuLTVs1xtFi53PZuB1Q3qSkJ
         UKXhtzMGOfThC8yRiv3paVQMzO4c+DlJShWzXoeR7CzwzO4lxZt7+jZ9OTS6dzkH+c4Q
         tNI/iiul+rG9RxAI+2UeSZcghoDU1njAdIIxfJsh3iZD16TRba2YFweGLkCvyQjvAQqP
         QQqWVutSa8B8AxwYz5qfk1IqGDHRgusNg6lfiYeVClMaRzj0o46V427NU/w/ta6oeyVm
         EUrA==
X-Gm-Message-State: AGi0PubCryEO9Al8+jZmTXUhwd0xLmrmZ7EXIgM9IlUriRWI/CZS8DXY
        DhVdvhp9ydR9+Iukd6Uy6p8ALpMHdwCMbO6X7eU=
X-Google-Smtp-Source: APiQypKkcSG00WEW/WhYXQkGL27aoCg+1IIUp523fedR+EywlAJiZjAymMzn0PNCJzxFrGqMqleOXshYPafBAay3poY=
X-Received: by 2002:ab0:375a:: with SMTP id i26mr1586599uat.120.1588940552470;
 Fri, 08 May 2020 05:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191028215919.83697-1-john.stultz@linaro.org>
 <20191028215919.83697-4-john.stultz@linaro.org> <87mudjj4rc.fsf@gmail.com>
 <CALAqxLU+9uEcdRVaLfh+eQrDtZbDGod9pRXhBX=prAhg9MXagw@mail.gmail.com>
 <CAKgpwJVaKpsgMjKcnYyJsfNj0ibkPt=mdn-NxfOkeX1jfL=9iQ@mail.gmail.com>
 <CALAqxLVXauXP0r4Hv2Axa4PNf_F9wp644peYV06bdsPtMKGmLA@mail.gmail.com> <CAKgpwJU7VDx90STE7bhx9VZ5p1jtqCyyLavmhXfpaicyDAYt_g@mail.gmail.com>
In-Reply-To: <CAKgpwJU7VDx90STE7bhx9VZ5p1jtqCyyLavmhXfpaicyDAYt_g@mail.gmail.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Fri, 8 May 2020 20:22:21 +0800
Message-ID: <CAKgpwJVU9m6G8PRdray2fGCp_peOU9C-ZAVKTk7pmSdq6z4NiA@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] usb: dwc3: Increase timeout for CmdAct cleared by
 device controller
To:     John Stultz <john.stultz@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Jun Li <lijun.kernel@gmail.com> =E4=BA=8E2020=E5=B9=B45=E6=9C=887=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=8811:08=E5=86=99=E9=81=93=EF=BC=9A
>
> John Stultz <john.stultz@linaro.org> =E4=BA=8E2020=E5=B9=B45=E6=9C=887=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=886:27=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, May 6, 2020 at 2:00 AM Jun Li <lijun.kernel@gmail.com> wrote:
> > > John Stultz <john.stultz@linaro.org> =E4=BA=8E2019=E5=B9=B410=E6=9C=
=8830=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:18=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > On Tue, Oct 29, 2019 at 2:11 AM Felipe Balbi <balbi@kernel.org> wro=
te:
> > > > > John Stultz <john.stultz@linaro.org> writes:
> > > > > > From: Yu Chen <chenyu56@huawei.com>
> > > > > >
> > > > > > It needs more time for the device controller to clear the CmdAc=
t of
> > > > > > DEPCMD on Hisilicon Kirin Soc.
> > > > >
> > > > > Why does it need more time? Why is it so that no other platform n=
eeds
> > > > > more time, only this one? And which command, specifically, causes
> > > > > problem?
> > >
> > > Sorry for my back to this so late.
> > >
> > > This change is required on my dwc3 based HW too, I gave a check
> > > and the reason is suspend_clk is used in case the PIPE phy is at P3,
> > > this slow clock makes my EP command below timeout.
> > >
> > > dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401]
> > > params 00001000 00000500 00000000 --> status: Timed Out
> > >
> > > Success case takes about 400us to complete, see below trace(44.286278
> > > - 44.285897 =3D 0.000381):
> > >
> > > configfs_acm.sh-822   [000] d..1    44.285896: dwc3_writel: addr
> > > 000000006d59aae1 value 00000401
> > > configfs_acm.sh-822   [000] d..1    44.285897: dwc3_readl: addr
> > > 000000006d59aae1 value 00000401
> > > ... ...
> > > configfs_acm.sh-822   [000] d..1    44.286278: dwc3_readl: addr
> > > 000000006d59aae1 value 00000001
> > > configfs_acm.sh-822   [000] d..1    44.286279: dwc3_gadget_ep_cmd:
> > > ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000
> > > 00000500 00000000 --> status: Successful
> > >
> > > Hi John,
> > >
> > > Do you still have this problem? if yes, What's the value of
> > > USBLNKST[21:18] when the timeout happens?
> >
> > Sorry. As I mentioned, I was working to upstream a patchset that I
> > hadn't created, so the context I had was limited. As I couldn't
> > reproduce an issue without the change on the device I had, I figured
> > it would be best to drop it.
>
> That was fine.
> >
> > However, as you have some analysis and rational for why such a change
> > would be needed, I don't have an objection to it. Do you want to
> > resubmit the patch with your explanation and detailed log above in the
> > commit message?
>
> Sure, I will resubmit the patch with my explanation added in commit messa=
ge.

Hi John

A second think of this, I feel use readl_poll_timeout_atomic() to wait by t=
ime
is more proper here, so I create a new patch to address this also other
registers polling, see below patch with you CCed:

https://patchwork.kernel.org/patch/11536081/

thanks
Li Jun
>
> thanks
> Li Jun
> >
> > thanks
> > -john
