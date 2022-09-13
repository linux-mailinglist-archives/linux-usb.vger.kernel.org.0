Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439BC5B6B60
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 12:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbiIMKGc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 06:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiIMKGb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 06:06:31 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D6B2124B
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 03:06:30 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id y17so21223905ejo.6
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Ik+23g4XpfAnG7a8oXUcTg1SatxfkkJ478WFwjyTgqo=;
        b=h9IsVVUzoSbqdaofqtCv9NWbxDpLpzhkr6EWgbZvC6qhb1/Kjt4ot325a7NudP6f3Z
         TN+9Amq5oMiIob/J6hE1Nq0nqLc8va/UtpWI/bLtYQMMCBezey43FN6vlUzEpRn0q7/S
         ahWreGeTFFcBdQuvOsYfO2HL4gwO1vA+CnNvTp3G1hRYvuJcPkDUuk8NquZADt6oN7/+
         Sf7RhAFPse9FfpBhDkWZ9DZVpNHCANemdloFHFGbUKfXoiHMm4HhdHJHtbjtz7NY8ear
         7mhDo4iuutRPwYgk3A/cd+Q0RdBNG2QH3iERmioy9ynD7tEczJdNPO8SQK0j1yVH0ZHw
         h0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ik+23g4XpfAnG7a8oXUcTg1SatxfkkJ478WFwjyTgqo=;
        b=KhBAqhOr4JMn6igYye0QUfHyBXjUm4IIPAtCfIEXs5dvY5klkbizCJPhwp+wLYcxCP
         K64BWXh4FA6CRiqXJjhjEUKOg/jyH73UZTaiTVIIqSlF0BS/VwYHBOReakJsl5NlFK3h
         e//mg0iy1EoBtGhgZVRYh4m8vrgVUd9jLlSm1sfLvEoSh/u4E+wXxgl/KbJBhSGtWiws
         QYhIyQ5hutbkyMzDqQ0IzDBBdDVS5UulT4NxlKxKYBFCT1SUEv/lHuPw1bQL56/9u05A
         TXpmZFR10U8raA35XqXRRBRAMQmAABH/N7PHnDN/E43vKCxF4QADKpU/+fQTLBCN7Su9
         erag==
X-Gm-Message-State: ACgBeo3u6ybzc6mNtGci0ZbtP+5HFAkYdhZBYvJF9fiecgax6jpXRFUF
        dBidCEEsO5RSw5nsvt+0O94=
X-Google-Smtp-Source: AA6agR7Q5LTAB+YqO/Cxz7oi4RP8jOMgCLH5VBN9MLjXRj1HyGwCR9Qx/xTCUIE2wFTONClq9Od9gA==
X-Received: by 2002:a17:907:842:b0:731:3310:4187 with SMTP id ww2-20020a170907084200b0073133104187mr20350776ejb.578.1663063588766;
        Tue, 13 Sep 2022 03:06:28 -0700 (PDT)
Received: from reki (83-44-165.netrun.cytanet.com.cy. [83.168.44.165])
        by smtp.gmail.com with ESMTPSA id kz13-20020a17090777cd00b007796bf44bb7sm5834671ejc.108.2022.09.13.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 03:06:28 -0700 (PDT)
Date:   Tue, 13 Sep 2022 13:06:25 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Message-ID: <20220913130625.60f06590@reki>
In-Reply-To: <99fa8804-eb1a-5bf5-3cc3-29a7e8be5822@endrift.com>
References: <20220726005824.2817646-1-vi@endrift.com>
        <20220726005824.2817646-2-vi@endrift.com>
        <20220726125137.7d3757c7@reki>
        <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
        <20220728115950.4c1707a9@reki>
        <9ad81143-0876-e6d7-2fc1-95dd82abe4a7@endrift.com>
        <20220731111421.3f69e963@reki>
        <99fa8804-eb1a-5bf5-3cc3-29a7e8be5822@endrift.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=D0=92 Thu, 8 Sep 2022 16:57:36 -0700
Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> Hi,
>=20
> On 7/31/22 01:14, Maxim Devaev wrote:
> > =D0=92 Thu, 28 Jul 2022 11:11:31 -0700
> > Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  =20
> >> On 7/28/22 01:59, Maxim Devaev wrote: =20
> >>> =D0=92 Tue, 26 Jul 2022 21:26:05 -0700
> >>> Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>    =20
> >>>> On 7/26/22 02:51, Maxim Devaev wrote:   =20
> >>>>> =D0=92 Mon, 25 Jul 2022 17:58:26 -0700
> >>>>> Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>      =20
> >>>>>> While the HID gadget implementation has been sufficient for device=
s that only
> >>>>>> use INTERRUPT transfers, the USB HID standard includes provisions =
for Set- and
> >>>>>> Get-Feature report CONTROL transfers that go over endpoint 0. Thes=
e were
> >>>>>> previously impossible with the existing implementation, and would =
either send
> >>>>>> an empty reply, or stall out.
> >>>>>>
> >>>>>> As the feature is a standard part of USB HID, it stands to reason =
that devices
> >>>>>> would use it, and that the HID gadget should support it. This patc=
h adds
> >>>>>> support for host-to-device Set-Feature reports through a new ioctl
> >>>>>> interface to the hidg class dev nodes.
> >>>>>>
> >>>>>> Signed-off-by: Vicki Pfau <vi@endrift.com>     =20
> >>>>>
> >>>>> Won't it break the logic of the existing software that works with /=
dev/hidgX?
> >>>>> Will it work if I want my gadget to work the old way?     =20
> >>>>
> >>>> For existing software to use SET_FEATURE at all it has to use an alt=
ernative mode, which seems to have only been added somewhat recently. That =
mode also appears to preclude use of INTERRUPT transfers at all, unless the=
re's some way to set up two hidg nodes that map to the same interface, with=
 one for INTERRUPT and one for SET_FEATURE. If this breaks that, I suppose =
that's a regression, but this is meant to augment the original, long-standi=
ng mode so you can mix INTERRUPT and SET/GET_FEATURE transfers, as there is=
 no way to do that yet. Honestly, the alternate mode seems more like a work=
around, as far as I can tell, and not an ideal implementation. I'm not sure=
 when it was added, but as I was originally authoring this against 5.13 and=
 didn't see it until I went to rebase onto master, it can't have been that =
long ago. So if it breaks any software (which I don't believe it does), it =
would only affect very new software.
> >>>>
> >>>> As I alluded to, I'd thought about perhaps adding a second node per =
interface so one would act as INTERRUPT transfers and the other as SET/GET_=
FEATURE transfers, but I already had this code half written and wanted to g=
et feedback first, especially since what I have now works (although it's no=
t well-tested after rebasing).   =20
> >>>
> >>> I'm a little confused here about what you call an alternative mode.
> >>> Are we talking about use_out_ep=3D1 (default behavior with INTERRUPT)
> >>> or use_out_ep=3D0 (SETUP/SET_REPORT)? The last mode was added by me
> >>> to ensure strict compatibility with Apple UEFI and strange BIOS,
> >>> and this mode is actually actively used. It is important to me
> >>> that it is not broken, but unfortunately I cannot test your patch
> >>> on my kernel, as I temporarily do not have access to testing equipmen=
t.   =20
> >>
> >> use_out_ep=3D0 is the alternate mode I was talking about. It didn't ex=
ist in 5.13, so as I said I wasn't aware of it until I rebased. As the devi=
ce I'm using is still stuck on that old kernel (for now) and I don't know i=
f I have any USB gadget capable devices on new kernels, I was unable to tes=
t it, and would very much like to make sure it doesn't regress before a pat=
ch is merged. I wasn't intending to break it, but I figured I'd get feedbac=
k I'd need to change before this was merged so if you could test it to ensu=
re it doesn't regress any behavior that would be much appreciated and help =
me out. I will probably wait until then before submitting a v2. =20
> >=20
> > I will get access to the USB analyzer and test environment in about a m=
onth,
> > if that suits you. You can write directly to my email after a month,
> > I will help you with testing. =20
>=20
> I wanted to check the status of this. We're in the middle of rebasing ont=
o a newer kernel, so I might be able to test it myself soon. What software =
are you using?

I'm using PiKVM on Raspberry Pi 4 (https://github.com/pikvm/pikvm) but for =
generic testing you need to make
the usual ways of using gadget work in both modes: https://www.isticktoit.n=
et/?p=3D1383
Unfortunately, I'm still away and I can't use my equipment :/
