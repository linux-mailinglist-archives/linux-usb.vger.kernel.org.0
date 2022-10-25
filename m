Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3254360C3AC
	for <lists+linux-usb@lfdr.de>; Tue, 25 Oct 2022 08:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbiJYGPw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 02:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiJYGPt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 02:15:49 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C26CFC1D2
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 23:15:47 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id h9so8064608wrt.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaL1rL79yTOhzcmc6OMTZ/uWPfIe1zFjQTl2odRGAn4=;
        b=FtGlw4i8oUYcCKLvs1CCXJM8TYmCQLHUkcNry4+s0fK8aEdxQKAVWkUsx59gZ9ss2+
         1ouCLIlAezDBoPUBr3lkTURvEz0LzCkBJU6WM8b+jMumzZdNHtGkjsPt8sTb41Q17ksm
         gYSp12nseErbvqLj8OQO8vaUaQAWuABNGhtsc5wGuBap9xfLRrWWzD4znZMpi1RIMOZe
         Z4oMSeAK+bNwWd36OJwJlbAU9yKfP0PGY/A12pDjGN3CVFth+WxG99xLmQhV/ehvOoiM
         2DGB/Q95dMwaF1Af98U4sDOWTUNxvv3vILpR5FRWR9L48bODf91E9xk132CTB/bjmhmF
         RmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaL1rL79yTOhzcmc6OMTZ/uWPfIe1zFjQTl2odRGAn4=;
        b=vpPvmXXWEwh5RXlUXK/R02FUO1QReBcR4WqZwOzg2tKtFP/SD5BmCOMdAeBMEPzbIE
         ITY0k1yMcRsMotS1FHsyp7TME7I4w9wyGGStgSmTm5LrR2sDpz3g2VGifro04sb43jLr
         LanT5cvx+sOUHau/J7Wqe9zfz7Tg9S+PDeiqRmv1VZ1cgPoAuZyVbjdwrpXolnNRZkhV
         UxLwjLLSGkdV66PY7AbQBC7xfGYl5WSQ5+YwmYFgzeLuQZa28np+ykVhUAtovCgp6N+i
         uo0lNSTbDUxRtgvnADJghJ0ZYV4vm8K4if3Y9P/MTJBvyvNqJpkuChv4Dib/54fKUEqE
         GOvw==
X-Gm-Message-State: ACrzQf0MVT5i820/32f9RqcZZUz0CKJBBc956cL5kfdmF7CO9BCZu+GD
        RY6eXAfj5aRQuFOXSO0GVfI=
X-Google-Smtp-Source: AMsMyM6WqxBk2Lp4UubsdHD1k6aD2pGk+DnuWq0S/0vOZt7O4qmo9ABsh65tpNxZI0FdfqE2PRPcsw==
X-Received: by 2002:a5d:50c2:0:b0:236:6709:6de5 with SMTP id f2-20020a5d50c2000000b0023667096de5mr8095643wrt.127.1666678545712;
        Mon, 24 Oct 2022 23:15:45 -0700 (PDT)
Received: from reki (31-16-113.netrun.cytanet.com.cy. [31.153.16.113])
        by smtp.gmail.com with ESMTPSA id 130-20020a1c0288000000b003cf37c5ddc0sm1664476wmc.22.2022.10.24.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 23:15:45 -0700 (PDT)
Date:   Tue, 25 Oct 2022 09:15:42 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Message-ID: <20221025091542.7158b62d@reki>
In-Reply-To: <e382f055-7ea2-0f93-d48c-8a3795b5c05a@endrift.com>
References: <20220726005824.2817646-1-vi@endrift.com>
        <20220726005824.2817646-2-vi@endrift.com>
        <20220726125137.7d3757c7@reki>
        <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
        <20220728115950.4c1707a9@reki>
        <9ad81143-0876-e6d7-2fc1-95dd82abe4a7@endrift.com>
        <20220731111421.3f69e963@reki>
        <99fa8804-eb1a-5bf5-3cc3-29a7e8be5822@endrift.com>
        <20220913130625.60f06590@reki>
        <e382f055-7ea2-0f93-d48c-8a3795b5c05a@endrift.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=D0=92 Fri, 21 Oct 2022 17:28:25 -0700
Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 9/13/22 03:06, Maxim Devaev wrote:
> > =D0=92 Thu, 8 Sep 2022 16:57:36 -0700
> > Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  =20
> >> Hi,
> >>
> >> On 7/31/22 01:14, Maxim Devaev wrote: =20
> >>> =D0=92 Thu, 28 Jul 2022 11:11:31 -0700
> >>> Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>    =20
> >>>> On 7/28/22 01:59, Maxim Devaev wrote:   =20
> >>>>> =D0=92 Tue, 26 Jul 2022 21:26:05 -0700
> >>>>> Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>      =20
> >>>>>> On 7/26/22 02:51, Maxim Devaev wrote:     =20
> >>>>>>> =D0=92 Mon, 25 Jul 2022 17:58:26 -0700
> >>>>>>> Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>>        =20
> >>>>>>>> While the HID gadget implementation has been sufficient for devi=
ces that only
> >>>>>>>> use INTERRUPT transfers, the USB HID standard includes provision=
s for Set- and
> >>>>>>>> Get-Feature report CONTROL transfers that go over endpoint 0. Th=
ese were
> >>>>>>>> previously impossible with the existing implementation, and woul=
d either send
> >>>>>>>> an empty reply, or stall out.
> >>>>>>>>
> >>>>>>>> As the feature is a standard part of USB HID, it stands to reaso=
n that devices
> >>>>>>>> would use it, and that the HID gadget should support it. This pa=
tch adds
> >>>>>>>> support for host-to-device Set-Feature reports through a new ioc=
tl
> >>>>>>>> interface to the hidg class dev nodes.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Vicki Pfau <vi@endrift.com>       =20
> >>>>>>>
> >>>>>>> Won't it break the logic of the existing software that works with=
 /dev/hidgX?
> >>>>>>> Will it work if I want my gadget to work the old way?       =20
> >>>>>>
> >>>>>> For existing software to use SET_FEATURE at all it has to use an a=
lternative mode, which seems to have only been added somewhat recently. Tha=
t mode also appears to preclude use of INTERRUPT transfers at all, unless t=
here's some way to set up two hidg nodes that map to the same interface, wi=
th one for INTERRUPT and one for SET_FEATURE. If this breaks that, I suppos=
e that's a regression, but this is meant to augment the original, long-stan=
ding mode so you can mix INTERRUPT and SET/GET_FEATURE transfers, as there =
is no way to do that yet. Honestly, the alternate mode seems more like a wo=
rkaround, as far as I can tell, and not an ideal implementation. I'm not su=
re when it was added, but as I was originally authoring this against 5.13 a=
nd didn't see it until I went to rebase onto master, it can't have been tha=
t long ago. So if it breaks any software (which I don't believe it does), i=
t would only affect very new software.
> >>>>>>
> >>>>>> As I alluded to, I'd thought about perhaps adding a second node pe=
r interface so one would act as INTERRUPT transfers and the other as SET/GE=
T_FEATURE transfers, but I already had this code half written and wanted to=
 get feedback first, especially since what I have now works (although it's =
not well-tested after rebasing).     =20
> >>>>>
> >>>>> I'm a little confused here about what you call an alternative mode.
> >>>>> Are we talking about use_out_ep=3D1 (default behavior with INTERRUP=
T)
> >>>>> or use_out_ep=3D0 (SETUP/SET_REPORT)? The last mode was added by me
> >>>>> to ensure strict compatibility with Apple UEFI and strange BIOS,
> >>>>> and this mode is actually actively used. It is important to me
> >>>>> that it is not broken, but unfortunately I cannot test your patch
> >>>>> on my kernel, as I temporarily do not have access to testing equipm=
ent.     =20
> >>>>
> >>>> use_out_ep=3D0 is the alternate mode I was talking about. It didn't =
exist in 5.13, so as I said I wasn't aware of it until I rebased. As the de=
vice I'm using is still stuck on that old kernel (for now) and I don't know=
 if I have any USB gadget capable devices on new kernels, I was unable to t=
est it, and would very much like to make sure it doesn't regress before a p=
atch is merged. I wasn't intending to break it, but I figured I'd get feedb=
ack I'd need to change before this was merged so if you could test it to en=
sure it doesn't regress any behavior that would be much appreciated and hel=
p me out. I will probably wait until then before submitting a v2.   =20
> >>>
> >>> I will get access to the USB analyzer and test environment in about a=
 month,
> >>> if that suits you. You can write directly to my email after a month,
> >>> I will help you with testing.   =20
> >>
> >> I wanted to check the status of this. We're in the middle of rebasing =
onto a newer kernel, so I might be able to test it myself soon. What softwa=
re are you using? =20
> >=20
> > I'm using PiKVM on Raspberry Pi 4 (https://github.com/pikvm/pikvm) but =
for generic testing you need to make
> > the usual ways of using gadget work in both modes: https://www.istickto=
it.net/?p=3D1383
> > Unfortunately, I'm still away and I can't use my equipment :/ =20
>=20
> I finally got a chance to test on 6.0, and I can confirm that it doesn't =
break use_out_ep=3D1 style read/write. You mention PiKVM, which I can test =
(I have a Pi 4 and bought the PiKVM v3 kit when it was on Kickstarter), but=
 given that the lowest version of Linux it supports predates use_out_ep=3D0=
 style, I wasn't sure if that was sufficient to make sure I didn't break it=
. I'll prepare a v2 as soon as I can confirm how to test use_out_ep=3D0 sty=
le.

Sounds great! BTW PiKVM uses 5.15 LTS kernel from Raspberry Pi repo with se=
veral patches. use_out_ep works there.
https://github.com/raspberrypi/linux
