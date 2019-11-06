Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88054F15DF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 13:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730844AbfKFMLY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 07:11:24 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34620 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfKFMLX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 07:11:23 -0500
Received: by mail-pg1-f195.google.com with SMTP id e4so17027501pgs.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 04:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fvggoBmVPHsmq8MljpGEGs96jCpg2b7Ib4WvpQs+2nE=;
        b=S+4x+fUoX2Te9gAAKioxA/6aiwmDy1LJwKLNVbuddPUNqG+BlHLAZDZ3M8mOnnaQAQ
         z4k7Hqtl0uvCBIK7ohN2/mf3Y13MXKphlMsv0sAlf9anzW3hrLyt1ZdA6bvSOPfVHgbD
         Zgj5Ng8KGnwXlmXicQZ47JZ/BmPQexGqEJ+L6O4OR5QQQNhvZTlkZMv9+Vh4krk4wLbH
         22uceJ4m7i+E7nRrVa3gGiwHuRKpzKddyNDCzKDRAftOlpHrYv8coKONbN/BA24GoP8P
         MBjLW5MPqL68xzrwas3b4NRW+wdZZTxVUN9r+Jt4hpPlWfWybqM3Jp547oCT58qzseP3
         Cc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fvggoBmVPHsmq8MljpGEGs96jCpg2b7Ib4WvpQs+2nE=;
        b=TL0g5ktxnGp4vcoRYeXLkViy0PLylup3GF/CMsTaPTNm62m0VwxYvE5rKxE5r1uhaH
         RtjXv2IGHGvwHSE3M3+oRzfceIcfijie4IdBTMx5oZD9B0qW0dGoEgEj3bqvUo08vjAn
         ryufrC5RaCC7BJPJfe2x0A6IayS3hjMrC7U0lvdNPqI7BUEj6ZIoGl3KkMoO6mTKfJJs
         V0nX5v0MOnTa+a9AOCuhdJsVZob2BwscPSWnDfW/u7LZj9OLdrCFGw9+3xtct9zEhIW3
         tsCiffWNN397cNa9nLsEzrHJSC4YAcZHiFN4INO3ixN2eXnInmjAoKPzrNhD6uHVDD8+
         OAQw==
X-Gm-Message-State: APjAAAVW9Ic4SE3UXV+EHbQgbxXzTAX5ApahxQQke4/R+hGPwbJLglvF
        86F4Viv1eph/EX2nJpQYIQmL4MvFWDx0UpZVH6OSNw==
X-Google-Smtp-Source: APXvYqwSGbUjKhoe0EizJSFk5e2DKZ5IFkYWt+lZ/BAMoM2M2U/89OaTgLLxGdf13lyF6LBS3GXwfAHfxKSbRIFHb64=
X-Received: by 2002:a63:9d0f:: with SMTP id i15mr2563556pgd.286.1573042282725;
 Wed, 06 Nov 2019 04:11:22 -0800 (PST)
MIME-Version: 1.0
References: <00000000000042d60805933945b5@google.com> <20191105233652.21033-1-tranmanphong@gmail.com>
 <CAAeHK+zKShqnZ=R8KQvVjsfOkAGrWW5jbsXRUnuEY8k4XN3+Fw@mail.gmail.com>
In-Reply-To: <CAAeHK+zKShqnZ=R8KQvVjsfOkAGrWW5jbsXRUnuEY8k4XN3+Fw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 6 Nov 2019 13:11:09 +0100
Message-ID: <CAAeHK+zzio=k6aN8rX2meYk1bWiE_TvyzovRkGXm01fbCc_nwA@mail.gmail.com>
Subject: Re: [PATCH] usb: appledisplay: fix use-after-free in bl_get_brightness
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com, 2pi@mok.nu,
        alex.theissen@me.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 6, 2019 at 1:10 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Wed, Nov 6, 2019 at 12:37 AM Phong Tran <tranmanphong@gmail.com> wrote:
> >
> > In context of USB disconnect, the delaywork trigger and calling
> > appledisplay_bl_get_brightness() and the msgdata was freed.
> >
> > add the checking return value of usb_control_msg() and only update the
> > data while the retval is valid.
> >
> > Reported-by: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
> > Reported-and-tested-by:
> > syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
> >
> > https://groups.google.com/d/msg/syzkaller-bugs/dRmkh2UYusY/l2a6Mg3FAQAJ
>
> Hi Phong,
>
> FYI, when testing patches with the usb-fuzzer instance, you need to
> provide the same kernel commit id as the one where the bug was
> triggered. Please see here for details:

https://github.com/google/syzkaller/blob/master/docs/syzbot.md#usb-bugs

>
> >
> > Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> > ---
> >  drivers/usb/misc/appledisplay.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
> > index ac92725458b5..3e3dfa5a3954 100644
> > --- a/drivers/usb/misc/appledisplay.c
> > +++ b/drivers/usb/misc/appledisplay.c
> > @@ -164,7 +164,8 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
> >                 0,
> >                 pdata->msgdata, 2,
> >                 ACD_USB_TIMEOUT);
> > -       brightness = pdata->msgdata[1];
> > +       if (retval >= 0)
> > +               brightness = pdata->msgdata[1];
> >         mutex_unlock(&pdata->sysfslock);
> >
> >         if (retval < 0)
> > --
> > 2.20.1
> >
