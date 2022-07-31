Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB610585E0E
	for <lists+linux-usb@lfdr.de>; Sun, 31 Jul 2022 10:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiGaIO3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Jul 2022 04:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGaIO2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 Jul 2022 04:14:28 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AFF764F
        for <linux-usb@vger.kernel.org>; Sun, 31 Jul 2022 01:14:25 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id m13so6616388wrq.6
        for <linux-usb@vger.kernel.org>; Sun, 31 Jul 2022 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MZmiqkrDVM/1ANVaZ3TW+kZDvgKePAtlIXsMvBnwc/A=;
        b=KYJ1XIWgdGbpJ1kE85rTuYlGfQFBB4sVKY90C8PpMdiYgL9E7MDZI8C957A00WAiUk
         KNvSUh2BVenWHj1cSHe0vZz9aO4kcORtowCLgYyn9eBl1Yem9UEEXc1BYlikgQAIqNB5
         vPESloXMVXCUWqNE7EUvpPpF38IALH47vqUodVOVA/vnl27NKH3TJLKe4GmKPIDscxS4
         lT9eME128VZceVf2Uibrm8NetNrw2EfO1CFI72vHxHuoelZ0EElEQiN9Hw5n2awNeNrv
         SRJHs1maUmE18AfTHScQLJsdvt+GOHf9hEcToOpqN6kvHonINsT6ox1zmxE01XRNqurz
         acAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MZmiqkrDVM/1ANVaZ3TW+kZDvgKePAtlIXsMvBnwc/A=;
        b=J7FPsqgzpJ0tp5uhotO5/UBXCdyql4iK8sXKuWmbWtJWQjtAWwJfB9YCI87uQHvYrS
         +CPJZHTVgVCR7bDcRMlMLOJFPhi/TBNywFju2vTkhnvn6nmFjgMPSY6aLinoo2BejYzb
         IbrawEleh/3gn1WZIoNZc6iw7ERXK5F1sqVAy+9iM6voR8k9cT9xp9lh74Wx8ib6fdi8
         93sxUJgw1dBPq2q1ocBSqq8JONp6jHjo5D6feWRjXOGtqBkyopOr8LkCKqnLlGrGFJ2f
         NDdGwDmkChKp3i3tops3+FMsfZ1sVkEoPEpugUT0rWj4L7RFAAo1axjXE21BQ/4+eOgX
         05lA==
X-Gm-Message-State: ACgBeo3Gg6xaSB2Y3ux692dD4FkuKnUX/dTQQt/m/BsqseP7Qmf0GNWd
        ylU4UpPDrKQuR6JXKM+2hf/cAM0BWFQ=
X-Google-Smtp-Source: AA6agR7lhETvIJ7bTzxWdvixkDEiARJlnsCqZ59AsPjpcvAzXZP7Hd5luBJL901EfczEd/G0yA/KkA==
X-Received: by 2002:a05:6000:1a87:b0:21d:b5b9:7666 with SMTP id f7-20020a0560001a8700b0021db5b97666mr7096585wry.1.1659255263954;
        Sun, 31 Jul 2022 01:14:23 -0700 (PDT)
Received: from reki (83-44-165.netrun.cytanet.com.cy. [83.168.44.165])
        by smtp.gmail.com with ESMTPSA id bg26-20020a05600c3c9a00b003a3279b9037sm15512565wmb.16.2022.07.31.01.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 01:14:23 -0700 (PDT)
Date:   Sun, 31 Jul 2022 11:14:21 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Message-ID: <20220731111421.3f69e963@reki>
In-Reply-To: <9ad81143-0876-e6d7-2fc1-95dd82abe4a7@endrift.com>
References: <20220726005824.2817646-1-vi@endrift.com>
        <20220726005824.2817646-2-vi@endrift.com>
        <20220726125137.7d3757c7@reki>
        <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
        <20220728115950.4c1707a9@reki>
        <9ad81143-0876-e6d7-2fc1-95dd82abe4a7@endrift.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=D0=92 Thu, 28 Jul 2022 11:11:31 -0700
Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 7/28/22 01:59, Maxim Devaev wrote:
> > =D0=92 Tue, 26 Jul 2022 21:26:05 -0700
> > Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  =20
> >> On 7/26/22 02:51, Maxim Devaev wrote: =20
> >>> =D0=92 Mon, 25 Jul 2022 17:58:26 -0700
> >>> Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>    =20
> >>>> While the HID gadget implementation has been sufficient for devices =
that only
> >>>> use INTERRUPT transfers, the USB HID standard includes provisions fo=
r Set- and
> >>>> Get-Feature report CONTROL transfers that go over endpoint 0. These =
were
> >>>> previously impossible with the existing implementation, and would ei=
ther send
> >>>> an empty reply, or stall out.
> >>>>
> >>>> As the feature is a standard part of USB HID, it stands to reason th=
at devices
> >>>> would use it, and that the HID gadget should support it. This patch =
adds
> >>>> support for host-to-device Set-Feature reports through a new ioctl
> >>>> interface to the hidg class dev nodes.
> >>>>
> >>>> Signed-off-by: Vicki Pfau <vi@endrift.com>   =20
> >>>
> >>> Won't it break the logic of the existing software that works with /de=
v/hidgX?
> >>> Will it work if I want my gadget to work the old way?   =20
> >>
> >> For existing software to use SET_FEATURE at all it has to use an alter=
native mode, which seems to have only been added somewhat recently. That mo=
de also appears to preclude use of INTERRUPT transfers at all, unless there=
's some way to set up two hidg nodes that map to the same interface, with o=
ne for INTERRUPT and one for SET_FEATURE. If this breaks that, I suppose th=
at's a regression, but this is meant to augment the original, long-standing=
 mode so you can mix INTERRUPT and SET/GET_FEATURE transfers, as there is n=
o way to do that yet. Honestly, the alternate mode seems more like a workar=
ound, as far as I can tell, and not an ideal implementation. I'm not sure w=
hen it was added, but as I was originally authoring this against 5.13 and d=
idn't see it until I went to rebase onto master, it can't have been that lo=
ng ago. So if it breaks any software (which I don't believe it does), it wo=
uld only affect very new software.
> >>
> >> As I alluded to, I'd thought about perhaps adding a second node per in=
terface so one would act as INTERRUPT transfers and the other as SET/GET_FE=
ATURE transfers, but I already had this code half written and wanted to get=
 feedback first, especially since what I have now works (although it's not =
well-tested after rebasing). =20
> >=20
> > I'm a little confused here about what you call an alternative mode.
> > Are we talking about use_out_ep=3D1 (default behavior with INTERRUPT)
> > or use_out_ep=3D0 (SETUP/SET_REPORT)? The last mode was added by me
> > to ensure strict compatibility with Apple UEFI and strange BIOS,
> > and this mode is actually actively used. It is important to me
> > that it is not broken, but unfortunately I cannot test your patch
> > on my kernel, as I temporarily do not have access to testing equipment.=
 =20
>=20
> use_out_ep=3D0 is the alternate mode I was talking about. It didn't exist=
 in 5.13, so as I said I wasn't aware of it until I rebased. As the device =
I'm using is still stuck on that old kernel (for now) and I don't know if I=
 have any USB gadget capable devices on new kernels, I was unable to test i=
t, and would very much like to make sure it doesn't regress before a patch =
is merged. I wasn't intending to break it, but I figured I'd get feedback I=
'd need to change before this was merged so if you could test it to ensure =
it doesn't regress any behavior that would be much appreciated and help me =
out. I will probably wait until then before submitting a v2.

I will get access to the USB analyzer and test environment in about a month,
if that suits you. You can write directly to my email after a month,
I will help you with testing.
