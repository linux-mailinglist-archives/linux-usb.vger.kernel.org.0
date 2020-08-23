Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A617824ECBC
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 12:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgHWKbS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 06:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgHWKbQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Aug 2020 06:31:16 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181E0C061574
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 03:31:15 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id x69so5071878qkb.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PDbzfkeud0OpyxTtNDmAiCvSP/IkbswKy3+jHMZQsls=;
        b=Y+/U9hSKUvS2WpEan9PVWDrRANBzdo0Djb24wBDy39y5tyJZmGk7QPYUrCvgR1Gl2J
         SV4aDWFWauW72KmRY70NgHgtM5NEL37dvyzEFBEGaY1dInDWPSz4FmMv3woD0Wjhzlsu
         vtgl8Y9AFabNjQdLeXymU4ajH8jODvKSsFL+AM63yBM1MhS17e+tB594EwYQ0NnCtTLp
         yJOQX62xIW6gG4za5Ex4DuOHCQaAcKNYIa3SvnR826wk1HxORjdo5yjaYBcFW37W+M2O
         vCXo2SaYgNUc9gOwSuDlCzT8vSF36+RY0KTNfDBLn18LDM00swMVIdT9RWd7mOlmrNLO
         CL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PDbzfkeud0OpyxTtNDmAiCvSP/IkbswKy3+jHMZQsls=;
        b=Dm1rQ2Sva6dblro8Cb6swZepLO0jTrHyrEATn9l0vfbG1G7/Bwn1t9Zyp8WnuuOXnp
         5X6gjKGozg9Jqq7VwH5IB/4V4rxgTnKgCMCBtj8m4guKAnEIbKlenvdG+MKf5FgAK76D
         +01vsvhe5FlWsY9JhH4cJ/JXIMfT5V8ol6shVO5u5BIPWymnZf4XB2Uj2Qix4QafXFC5
         RDUPLVawPIJzz5nn5I3fcHMM41BYlUAMym5926mEHAX2N0MauLw7H/CGqLCN/K014Z9a
         9P/rNP/LaHJ38dgh5jFnDWjyH3baX/2q7o9WkNjo7wECcpHVmUm2BMzFLHSD7FLWZS8h
         I2mQ==
X-Gm-Message-State: AOAM531pgCa+5yGkrMAOZtoXDsaMcx5qaFo2cKLXgucjYmuSrrAcKGc3
        SMFFGUzvzrDB3zE/fqQta03dqLw4jtiZjxALr2P8zQ==
X-Google-Smtp-Source: ABdhPJzh/hGWcxdCNkfqtxg/vH7u+sVKQRyHnDarPigm5zHC/LE+3/2JsiO3In+EQ/pf4TkihzwUABZC6mK5psJoSrc=
X-Received: by 2002:a05:620a:21d2:: with SMTP id h18mr495431qka.407.1598178674463;
 Sun, 23 Aug 2020 03:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com> <20200823101924.GA3078429@kroah.com>
In-Reply-To: <20200823101924.GA3078429@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sun, 23 Aug 2020 12:31:03 +0200
Message-ID: <CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com>
Subject: Re: [PATCH] net: usb: Fix uninit-was-stored issue in asix_read_cmd()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Himadri Pandya <himadrispandya@gmail.com>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        USB list <linux-usb@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 23, 2020 at 12:19 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Aug 23, 2020 at 11:26:27AM +0200, Dmitry Vyukov wrote:
> > On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
> > <himadrispandya@gmail.com> wrote:
> > >
> > > Initialize the buffer before passing it to usb_read_cmd() function(s) to
> > > fix the uninit-was-stored issue in asix_read_cmd().
> > >
> > > Fixes: KMSAN: kernel-infoleak in raw_ioctl
> > > Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> > >
> > > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > > ---
> > >  drivers/net/usb/asix_common.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> > > index e39f41efda3e..a67ea1971b78 100644
> > > --- a/drivers/net/usb/asix_common.c
> > > +++ b/drivers/net/usb/asix_common.c
> > > @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
> > >
> > >         BUG_ON(!dev);
> > >
> > > +       memset(data, 0, size);
> >
> > Hi Himadri,
> >
> > I think the proper fix is to check
> > usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
> > Memsetting data helps to fix the warning at hand, but the device did
> > not send these 0's and we use them as if the device did send them.
>
> But, for broken/abusive devices, that really is the safest thing to do
> here.  They are returning something that is obviously not correct, so
> either all callers need to check the size received really is the size
> they asked for, or we just plod onward with a 0 value like this.  Or we
> could pick some other value, but that could cause other problems if it
> is treated as an actual value.

Do we want callers to do at least some error check (e.g. device did
not return anything at all, broke, hang)?
If yes, then with a separate helper function that fails on short
reads, we can get both benefits at no additional cost. User code will
say "I want 4 bytes, anything that is not 4 bytes is an error" and
then 1 error check will do. In fact, it seems that that was the
intention of whoever wrote this code (they assumed no short reads),
it's just they did not actually implement that "anything that is not 4
bytes is an error" part.


> > Perhaps we need a separate helper function (of a bool flag) that will
> > fail on incomplete reads. Maybe even in the common USB layer because I
> > think we've seen this type of bug lots of times and I guess there are
> > dozens more.
>
> It's not always a failure, some devices have protocols that are "I could
> return up to a max X bytes but could be shorter" types of messages, so
> it's up to the caller to check that they got what they really asked for.

Yes, that's why I said _separate_ helper function. There seems to be
lots of callers that want exactly this -- "I want 4 bytes, anything
else is an error". With the current API it's harder to do - you need
additional checks, additional code, maybe even additional variables to
store the required size. APIs should make correct code easy to write.


> Yes, it's more work to do this checking.  However converting the world
> over to a "give me an error value if you don't read X number of bytes"
> function would also be the same amount of work, right?

Should this go into the common USB layer then?
It's weird to have such a special convention on the level of a single
driver. Why are rules for this single driver so special?...

> So personally, I think this patch is right for when you are trying to
> abuse the USB driver stack :)
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
