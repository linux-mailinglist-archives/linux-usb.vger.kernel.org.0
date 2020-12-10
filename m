Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3B12D5B19
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 14:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388544AbgLJNAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 08:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732802AbgLJNAY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 08:00:24 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DF0C0613D6
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 04:59:44 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id q25so4719469otn.10
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 04:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QyjoTz7y/nlrxbR2fk5DJPSiI8VeNp7IabT2BpnlUCk=;
        b=Hf1jNqK14i1tVxCxxXAwJzaoMHY6ydoPeEB87rlcoGA0nvXV+zGvuWvIPYs6WNg0ys
         XxsnRnQP3c4gfMgtClOOGffnXLAN/DVpCFHmftmza7aAaQ+AGj4abXiQJIfnpYHWoL+Q
         shznXuzdpQys7fpudwgJ1Jn4tK62FpBlA4fI8KiU/9AygJqGt7wnHKDmyq+Mqf2l0aOV
         3u4p78VU0eVzVJ5od9Y84TGoIyIEEwlvGjzuaEy5Cf/hbXP5olwYp1khqDQR0EUosZA7
         UrLuQy3PyPJXBlC4ylKjmfwSllGrMvF+SKhRpitnn3O1FXJCIneawXdsPkwUq7Qd6Sgo
         /IFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QyjoTz7y/nlrxbR2fk5DJPSiI8VeNp7IabT2BpnlUCk=;
        b=gUX7EMfH/yeVc1LsG1sJfl0kX5hERE8VmwT3e/Or4hAIGwkDe6Fk2mYVNq2L9oCzTE
         KFziaqAh12scWMtRjQiUsnx8IRjmyYs4X6FgNSPJZmv6PPTaAqdWyjILCCpw2jjOgVu8
         t15KqgmzTiTeUKmeK5MG/KUnyHmtT1EPfDiWVXQ0Mj9AaON9lJ+B97u2af7E7rDWj6w3
         3xkoNKxLNaKhaD8GYmvuXouFOWWdR9FX75mGfM4/mc7YaBz5zqc0f/PzvUffd8hZGdmR
         mBvW8Ys4Zd0cJGO7+GyPcH0I0lWybECWuWW5/JuuAJHi5jn4E/zMWRFM33sv4yLvpZY+
         af6A==
X-Gm-Message-State: AOAM530QUETMrh4vhy7ufJQFkNlzmkT582WEzKKYZ7Z8AFvC6cRXke0l
        pRD9fCftjNa+MUIdb7uBC3PChBbvL08qJTkQia/0/wjBifFO+CKI
X-Google-Smtp-Source: ABdhPJy9oQsPuMibYpQQ13bG/rSxTY13WoA1DDaibjDQPGDWgqwjvgM7lc7sTG4rhUPyxQZ81E52t0BytLK0GK+vfp0=
X-Received: by 2002:a05:6830:1d7b:: with SMTP id l27mr5777138oti.197.1607605183390;
 Thu, 10 Dec 2020 04:59:43 -0800 (PST)
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
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Thu, 10 Dec 2020 14:59:24 +0200
Message-ID: <CAB=otbSHvP3CXUFK_iAjgsDoWPeKxLjumUnELMf1jiAw6ZCY0g@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Glenn Schmottlach <gschmottlach@gmail.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 3, 2020 at 12:09 PM Peter Chen <peter.chen@nxp.com> wrote:
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

That's known issue, Windows is more strict with UAC2 descriptors, try to apply
my patch "usb: gadget: f_uac2: always increase endpoint max_packet_size
by one audio slot" that I shared in this email:
https://www.spinics.net/lists/linux-usb/msg205077.html

Thanks,
Ruslan
