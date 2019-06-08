Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F19D39C20
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2019 11:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfFHJ3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jun 2019 05:29:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40451 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfFHJ3a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jun 2019 05:29:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so3978418wmj.5
        for <linux-usb@vger.kernel.org>; Sat, 08 Jun 2019 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I69gbr//4vT/DDOkDDQeL/v8rwGWUeTOXaThhC4vV3A=;
        b=JlHGnJ16vRGu2PrF2usv9qdFL1iJ5+tf6BYLf3f1d9OknsbMv9AvN4/zTUgidrYzyP
         v+buuQ4PzBLRWLiUszeP4harFTJL5uBqePMPKiEXqUan7C1AcYEtz+0X9lHetYRVV9JX
         922mCM0xC6dXHuVewiLPzU47nZ4fUXdUIrzOFte1rqiS1yQiw3eDfqU6ZXy2ExZ6qMoV
         JVtal9Nuvldh/ByAsrVZa5E84ZGNg4lI3kJN1G7VI7NUXTm5X8D+KYJimQBdRwHXAF64
         5puPsDwyJQbd8JoEq5JmMepLG+jxyvA5E6hFUy/RYU3fn0uwxJKXVw2MODWvdjoVV5Rc
         v0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I69gbr//4vT/DDOkDDQeL/v8rwGWUeTOXaThhC4vV3A=;
        b=h09zvHA6pkGlqySbhkFyZyqezYVc99oMVodll4ATDtLdsUenZG/vlHEsPDl/rDGtJW
         uiR2BIeB2f5SUSZLMkiJUDyTEOMzwiMjYVrOn3bqCsfDPGlDuCReBpOwDRJSFdUvaBL4
         95dLTPwiu++tG+44/WR6vdmDz8uL0NayV+/S3r0MMfxOaXZFWEsU0x1q3zO2E1cw9RT+
         TAahhDNJPL/yd4jfLZJeZwsLd2dL76NZNGD/AAXVK+NKYdbOOp4oWhFImYB9qvew48Tg
         YYY8vbOxJwkYozJf4BgkPdektMVYnNfsTqZVYXyCjrX1YIk7JzGFgU1n+lstW5j2j+1m
         gQeQ==
X-Gm-Message-State: APjAAAXbjgzuo7zgZ/H1GQzEL3VhF4ud2R7w0tJGM7KP6GYYDwtKgbOV
        p+Y9wlK90XRoEXRyCBYZB+gSmp238KlGd74Awhm0mbbaDZI=
X-Google-Smtp-Source: APXvYqwV/IY6dBfKoyip3zvU8bThFXsvVgHahhkEr/qCHzL1ktxIXs/jT0uZwa9c6Hw70JvzmPw0FFwOj95UXZbE1Vo=
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr7085197wml.124.1559986167890;
 Sat, 08 Jun 2019 02:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
 <20190530132522.GA21005@kroah.com> <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
 <20190604054300.GE1588@kroah.com> <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
 <20190605145525.GA28819@kroah.com> <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
 <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it> <20190605173902.GE27700@kroah.com>
 <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it> <20190606144757.GA12356@kroah.com>
 <CAOsYWL03ALs6xJxcbDeppwtY9Q3v-vW6ptjK18CzL0RtJfboBw@mail.gmail.com>
In-Reply-To: <CAOsYWL03ALs6xJxcbDeppwtY9Q3v-vW6ptjK18CzL0RtJfboBw@mail.gmail.com>
From:   Andrea Vai <andrea.vai@unipv.it>
Date:   Sat, 8 Jun 2019 11:29:16 +0200
Message-ID: <CAOsYWL2z=Rddvu62DP+QdQOf=4FwygmLrOPS0rJ8Uc+OzLKQvA@mail.gmail.com>
Subject: Re: Slow I/O on USB media
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno sab 8 giu 2019 alle ore 09:43 Andrea Vai
<andrea.vai@unipv.it> ha scritto:
>
>[...]
>
> Hi,
>   there is also something else I don't understand.
> Every time I build a kernel, then after booting it "uname -a" shows
> something like
>
> Linux [...] 4.19.0-rc5+ #12 SMP Sat Jun 8 00:26:42 CEST 2019 x86_64
> x86_64 x86_64 GNU/Linux
>
> where the number after "#" increments by 1 from the previous build.
>
> Now I have the same number (#12) after a new build, is it normal?
> Furthermore, "ls -lrt /boot/v*" shows the last lines to be
>
> -rw-r--r--. 1 root root 8648656  8 giu 00.35 /boot/vmlinuz-4.19.0-rc5+.old
> -rw-r--r--. 1 root root 8648656  8 giu 09.08 /boot/vmlinuz-4.19.0-rc5+
>
> and "diff /boot/vmlinuz-4.19.0-rc5+.old /boot/vmlinuz-4.19.0-rc5+"
> shows they are identical. Why? I expected that each bisect would lead
> to a different kernel.
> Assuming that the opposite can happen, does it mean that when I say
> i.e. "git bisect bad", then build a new kernel and see that is
> identical to the previous one I can run "git bisect bad" without
> booting into the new one and even making the test?
>
> Another thing I don't understand is that I told 4.20.0 to be good, so
> I would expect that I don't need to test any older version, but as far
> as I know 4.19.0-rc5+ is older than 4.20.0, so why is it involved in
> the bisection?
>
> I had to "git bisect skip" one time (the kernel did not boot), but as
> far as I know I don't think this could be related to my doubts.
> [...]

Update:
  I have concluded the bisection, found that
"9cb5f4873b993497d462b9406f9a1d8a148e461b is the first bad commit",
reverted it, and the test still fails (btw, the final kernel file,
/boot/vmlinuz-4.19.0-rc5+, does not differ from the previous one).

So, all my doubts above are still there (and growing). What I am doing wrong?

Thank you,
Andrea
