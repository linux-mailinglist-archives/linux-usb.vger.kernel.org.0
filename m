Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D242CE158
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 23:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbgLCWIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 17:08:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbgLCWIt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 17:08:49 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A87C061A4F
        for <linux-usb@vger.kernel.org>; Thu,  3 Dec 2020 14:08:09 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id z1so4302657ljn.4
        for <linux-usb@vger.kernel.org>; Thu, 03 Dec 2020 14:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a7s5kDETjEtByYcGIMsH73vkZWulbPgxwCZwDY/ndKg=;
        b=LzSelFB6/EIYYnHfdfXZjLKZ4FnbI+UJNxI0ckO3uhuuRXje3T4dQs0Tfdzta19VFw
         vBQrKRXbBU4a7QOQ3jB36pHt/vkG42ITViyKk0OL4xSrRuKowNtEYK+Knj2jBHkCuIIP
         q8Kaimq6+XGbRwb/Aoo9BV/iC5TTKK22YuvD+ury3tApVvPK2q8rRuAZphrnEWd41DWb
         nrDu33oTJmbYV2FcZmyF8CTtmFh3b7V5B/aK2Xm/ZqnVDiEyf03Nwm1tS3CKWOLFDlN6
         lo/CPIlirUyFycNcsewO8n/yDQjnbyDzkp2r2G5CkhB2AgH278ohjTRUZ0h1jlsiIDvl
         TQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a7s5kDETjEtByYcGIMsH73vkZWulbPgxwCZwDY/ndKg=;
        b=au8waZaf246ILZNFTN9Z4Xcl3lhaI0BPuJ1w9Adp9mJ6K0Ub/WxUmJb1nysnEUHFfS
         zCrNRPR2ls5IgYOjxK/hK/XEVA1pjN5vlZbLJ2UcJ0VYc9mX4T3POq6I+XTzWcV0jgTc
         x+ADxB9v/KY5LEUDgsSt2IswPr7Lir+xNWQLJmljpeBlDzP6OnwdG2SAnv7DGTn1azGP
         AQrIM1OUblMl559/8na55iZd1jxncJsOOxi6jNwpyFTyU3iXBimxRgeeH++KtHopUv5T
         XZu5IHBaoe+Pvo7f7fqbOt4J+NNxY3nIQB+NKQPBoZ0uO1h6EvxZwyi2N5vGd+p1XIvV
         w6aw==
X-Gm-Message-State: AOAM531nRwGgNZOF6br+MMgeqjO0VwT7G6sc7oApQmshnZfC/dxpCPA7
        1IAt3epA1OSo0CoQSOTAm3dgdr4hXKYvdMfKV9Q=
X-Google-Smtp-Source: ABdhPJxwO+WilgbXk4b8TOWUmJTMvMu4ro1ixVQtT8ZJjnGMJnbl4zE/WvJK4HSkmKyISi2M/wycIpo/3k9MAG2EwYQ=
X-Received: by 2002:a2e:9848:: with SMTP id e8mr2190782ljj.353.1607033287545;
 Thu, 03 Dec 2020 14:08:07 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop> <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
 <CAMS2kBEnUDi5jKiNu5ZKihyucCikfoGor4n7=e+xX=7WU_rrog@mail.gmail.com>
 <CAB=otbRrLjeTjhBGtMqpeWeYZB9v62SDjSWzRk8uGQE3Ld8T2A@mail.gmail.com>
 <CAMS2kBGRrozHQj9wfLmcQMSCb8On+5HcSF=8PsUJAtqXz2QG1w@mail.gmail.com>
 <CAMS2kBGcDu-02dboEwxygMDE1r1c9Q3Lzrw6TcsoKEMvOzLmDQ@mail.gmail.com> <20201203100912.GA2881@b29397-desktop>
In-Reply-To: <20201203100912.GA2881@b29397-desktop>
From:   Glenn Schmottlach <gschmottlach@gmail.com>
Date:   Thu, 3 Dec 2020 17:07:56 -0500
Message-ID: <CAMS2kBFzCHQXUzvRSuYywsD0rjwbtVY49SiDQ9cQDKHM+0daJQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 3, 2020 at 5:09 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-12-02 17:04:47, Glenn Schmottlach wrote:
> > On Tue, Dec 1, 2020 at 4:43 PM Glenn Schmottlach <gschmottlach@gmail.com> wrote:
> > > Hi Ruslan -
> > >
> > > Thanks for the feedback but unfortunately I've experienced mixed
> > > results with the gadget UAC2 driver on both Windows/Linux. Let me
> > > describe my environment. My host platform is either a Linux Ubuntu
> > > 18.04 or Windows 10 laptop while the target environment is a
> > > BeagleBone Black (Linux beaglebone 5.4.74-g9574bba32a #1 PREEMPT). I'm
> > > testing two different scenarios:
> > >
> > > Scenario #1:
> > > BeagleBone Black (BBB) runs speaker-test generating a single channel
> > > (S32_LE) audio stream containing a 1KHz tone with a 48K sample rate,
> > > e.g.
> > >
> > > > speaker-test -D hw:1,0 -r 48000 -c 1 -f 1000 -F S32_LE -t sine
> > >
> > > The host laptop is running Audacity and recording the tone over the
> > > UAC2 adapter. On the Linux host the capture is correct and the tone is
> > > bit-perfect. On the Windows 10 the capture contains numerous missing
> > > samples which translates into a lot of audible pops and clicks.
> > >
> > > Scenario #2:
> > > The Linux/Windows host plays a single channel, 48K, S32_LE 1K sine
> > > tone to the target using either Audacity (on Windows) or 'aplay' (on
> > > Linux), e.g.
> > >
> > > > aplay -D hw:4,0 -c 1  -r 48000 -t wav  tone_1k.wav  (Linux)
> > >
> > > On the BBB target I use 'arecord' to record the tone to a RAM disk and
> > > then copy the recorded file back to the host where I can verify the
> > > quality of the recording. In both instances (e.g. using either Windows
> > > or Linux for playback) the recording on the target results in a
> > > captured file with missing samples and audible pops/clicks. In this
> > > scenario the UAC2 gadget is configured with c_sync == asynchronous. I
> > > wouldn't expect things to improve with c_sync == adaptive since you
> > > mentioned in your patch that it always reports back the nominal
> > > frequency to the host from the feedback endpoint.
> > >
> > > Do you have any suggestions that might explain (the above) behavior.
> > > Can you describe your test environment in more detail so that I can
> > > perhaps re-create it? What Linux target are you using with your tests?
> > > You mentioned you tested an 8x8 playback/capture scenario. Can you
> > > provide any details of how you performed this test and the method you
> > > used to confirm the audio quality for the capture/playback?
> > >
> > > Thanks for any insights you might be able to offer . . .
> > >
> > > Glenn
> >
> > Hi Ruslan -
> >
> > This is a follow-up from my post yesterday. I recompiled my kernel
> > *WITHOUT* your UAC2 patches and repeated Scenario #2 where the Linux
> > PC plays a single channel tone to the BeagleBone Black where it's
> > recorded with 'arecord'. Yesterday, I recorded garbled audio on the
> > target but today, without any UAC2 kernel patches, the recorded audio
> > on the target is glitch-free and appears to be bit-perfect.
> >
> > This experiment leads me to believe your patches may be inadvertently
> > corrupting the data-path. Have you been able to repeat my experiment
> > and either confirm or refute my findings? I am interested to learn
> > more how you tested your patches and whether it's something I can
> > recreate here.
> >
> > Assuming we can sort out this data corruption issue, what are your
> > thoughts on how the Linux target device can properly provide the
> > Windows feedback endpoint with real frequency updates rather than the
> > constant nominal frequency. If I understood your patch notes correctly
> > it seems this is an outstanding issue that requires additional
> > attention. I'm a bit of a noob when it comes to how this might be
> > addressed.
> >
> > Thanks for your continued insights and support . . .
> >
> > Glenn
>
> Hi Glenn & Ruslan,
>
> Do you know why WIN10 can't recognized UAC2 device if I configure the
> sample rate as 48000HZ? Configuring sample rate as 44100HZ, the playback
> function would work well at my platforms (chipidea IP), no glitch is
> heard. At WIN10, I use Windows Media Player, at board side I use command:
>
> arecord -f cd -t wav -D hw:4,0 | aplay -f cd -Dplughw:3,0 &
>
> From the USB Bus analyzer:
>
> Feedback EP is scheduled every 1ms, there are nine 176-byte packets and one
> 180-byte packet among 10ms transfers.
>
> --
>
> Thanks,
> Peter Chen

Hi Peter -

I have not experienced the issue you are reporting. My configuration
uses a 48Khz sample rate exclusively and Windows 10 appears to
recognize the UAC2 device properly with all of Ruslan's patches. I
have not done any serious testing at the 44.1KHz rate so I don't
recall if that is recognized correctly on my Windows 10 box.

It looks like you've established a UAC2 loopback on your target board.
How are you verifying the captured audio on the Window 10 PC? I didn't
realize Windows Media Player allows you to both playback and capture
from the same (UAC2) device simultaneously.

Thanks,

Glenn
