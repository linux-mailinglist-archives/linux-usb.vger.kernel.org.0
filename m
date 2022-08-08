Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A7B58C17F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Aug 2022 04:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbiHHCUQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Aug 2022 22:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241838AbiHHCT4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Aug 2022 22:19:56 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DA0357DF
        for <linux-usb@vger.kernel.org>; Sun,  7 Aug 2022 18:58:05 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id q1-20020a05600c040100b003a52db97fffso1883493wmb.4
        for <linux-usb@vger.kernel.org>; Sun, 07 Aug 2022 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=Xwrdo6/VCpAL6pxnVJvQpYRjn1B5bPGwA7vmTovf0Dk=;
        b=VAEWd1ONIsKQb5VuJAmCgeSqe7hXsMoVERYMvPTSAc1JkfaRRhZ9EOLohPBFs/eemZ
         DS+fc6Igoe17eKjBzE4aaxXcVnNqVvPk74VLQi1vNBrBGKmlVepB+Vbi4Tbc+PYG+YnT
         ecJPolbx2Q8MVRCQscuQkqm/uN/Xavd8/1kU8i1fcwRGAeBJGoH77zPO+wVaLTI5xVq1
         YGmda0XxX516ORwqgZMqm5ayizJH6nHAaCwh6uOmv56RZ/6a3gVg7w7h7APZkqNEX0vU
         1OKJ/0PvuGpC0TlUn81M7WsCLKrui2Vgr8GNgJ6iu6M0tOeT2A8usnPngWfNhtpZphF+
         n6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Xwrdo6/VCpAL6pxnVJvQpYRjn1B5bPGwA7vmTovf0Dk=;
        b=2WqjREP7gJAmRyyODBNqtmVVjixFTL/lACdxgVGE0o+ebnkAWt1pKpkWtziEFDb2AK
         Z6tXX+4ZVYTAZ6IluSkfmztCJmHrMvdPTp4Vcj/BSUGLBiHOsDfeNq3man/T4iwjMDAp
         mL+TdzkapKMZx5gYzEpCLMQHUlq4bJrHDRgDQbh1EiFBHf39TtXtGv0CDUR2X1NxkcNO
         NjfRPecbEmuMd7nTzoTgt8YSudDHH6xkRVDEo5r5UvsCUSIY/qYw7iAZ4lhjotHT4Dnx
         pzaP8RNECA0RSke2XfkWuQb6v/wi0QIeX20+wAhVgRlWUVAYY2vzcIpvRHZ/8DrKIS45
         urPQ==
X-Gm-Message-State: ACgBeo0wSLZT7UdVoP+iChqHjnG8lmxEXzgrglm62V0L0ZvpXluZt0lF
        RAq9BYLicwfuSheFFX2Kky7ZEodwIgw=
X-Google-Smtp-Source: AA6agR544we8BfVJKfJoqFqKkU3C5dR1PXov3fZ8ybU7sC+9jk5v15+lk3ysdmeAfJK3vBkLy6KoPg==
X-Received: by 2002:a05:600c:19cc:b0:3a3:3cfe:d548 with SMTP id u12-20020a05600c19cc00b003a33cfed548mr11248354wmq.6.1659923879677;
        Sun, 07 Aug 2022 18:57:59 -0700 (PDT)
Received: from reki (83-44-165.netrun.cytanet.com.cy. [83.168.44.165])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c4fd300b0039747cf8354sm12936682wmq.39.2022.08.07.18.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 18:57:58 -0700 (PDT)
Date:   Mon, 8 Aug 2022 04:57:56 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Message-ID: <20220808045756.3335339c@reki>
In-Reply-To: <5a19db54-d9a3-16d9-9758-f8f85c8ddb93@endrift.com>
References: <20220726005824.2817646-1-vi@endrift.com>
        <20220726005824.2817646-2-vi@endrift.com>
        <20220726125137.7d3757c7@reki>
        <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
        <20220728115950.4c1707a9@reki>
        <9ad81143-0876-e6d7-2fc1-95dd82abe4a7@endrift.com>
        <20220731111421.3f69e963@reki>
        <5a19db54-d9a3-16d9-9758-f8f85c8ddb93@endrift.com>
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

=D0=92 Wed, 3 Aug 2022 16:32:21 -0700
Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

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
> I'm not in a huge rush, though I might try to find some hardware I can te=
st a modern kernel on to help test. What are you running the kernel on?

I'm using the Raspberry Pi 4 with Mac Mini as host (checking the OS, UEFI a=
nd Recovery mode).
