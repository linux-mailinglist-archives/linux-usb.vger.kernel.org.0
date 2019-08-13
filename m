Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3E18BA0B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 15:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbfHMNYS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 09:24:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35288 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbfHMNYS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 09:24:18 -0400
Received: by mail-pg1-f195.google.com with SMTP id n4so9530243pgv.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2019 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j0tOfAuaq4Yg1tlCptrYIfw0VPXXaj1XYpLOsoh7Qpw=;
        b=klCDEHZpmWkJPPQidkakgEgXbx7K+mh+kxAzIh4mApMDpWykbkRBjiipvjbq7rjP51
         m2taFhkUE1KGOYFg1a8NeEYl6nUtvdPOqfV2bgCU1E0NzElNHgRnlnJQuaCJA+LZg7w/
         CAQXl/PI/D1mDXUpwqNAkqoeBN5La26kLFpU1NDstEGUotyjJAuYzRmbHKzN5EJ+JDGk
         Pxu2vo1+Ew/7cY8UOFFk3sg4SvYp59P16Bdkis3auQvx6w1k0sX56M21hP5VsgEJ2mEo
         yZda03lIPx3Q5tCaFFG67kI/lFLHhgkkA4AZBoRKsjCzqziCTNgyA4K6M2+fd1Hh+AJY
         xlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j0tOfAuaq4Yg1tlCptrYIfw0VPXXaj1XYpLOsoh7Qpw=;
        b=Qbv8BwjKTQ0VR0RsRl1RIY5PbTP+q/WpXNpiT03/GrsJ91omzLPkbaXklZup80uRTM
         AuXZ/ch0ez+YJUzbMbBxlKnxd0Q77n3WOtBpmipdBZgrhFNyVdJgiJyP6zWzFD/95b6F
         OiyHA3dtLKF5AUO7PxkxKpq3C2rDt760vxyX0TH88V/vbN8DPaE2N1EKVYx+PtApw1/Z
         9d60JOEyZy8oyAJQ2YkRu/ktk6ykrVDouWcxz39psGLjv1a+DkDTZcrEB1gjYtCOzNXR
         BqwfZDpZHsi9sRt8XjIc8z3gLSg9LvVAhOZLO9mUhh8egQYOftHH4/tg+pgwsf3c8VeK
         7Scg==
X-Gm-Message-State: APjAAAVZ5bVUmPlg/2uM0qgxRSYqJ5wifri35Plm7cml2p+yN72TKndU
        Syiuxh7Rllv5J80Yi3IEQXD1pe4Voq1R89bOdG29Og==
X-Google-Smtp-Source: APXvYqwXL9Y3zSaqYKpVcJ8Y7vJU0SJwj8kSb4tTv/tyCDGR3E1dijhh0Fh6x/iutCA7Kyx9g/dHhVlw+huCTmjW4n8=
X-Received: by 2002:a63:3006:: with SMTP id w6mr34868777pgw.440.1565702657198;
 Tue, 13 Aug 2019 06:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+yPJR2kZ5Mkry+bGFVuedF9F76=5GdKkF1eLkr9FWyvqA@mail.gmail.com>
 <Pine.LNX.4.44L0.1908080958380.1652-100000@iolanthe.rowland.org>
 <CAAeHK+xVKZ-pnGcijYJPpWQ_haWbuVSpD81TJhtRosOZsg-Rwg@mail.gmail.com> <1565702535.7043.9.camel@suse.com>
In-Reply-To: <1565702535.7043.9.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 15:24:05 +0200
Message-ID: <CAAeHK+yMFGh8F-e9o-VHxg652Ka3f3C8UzFupvD0zZMwffRc_w@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 13, 2019 at 3:22 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Dienstag, den 13.08.2019, 14:42 +0200 schrieb Andrey Konovalov:
> > >
>
>
> [..]
>
> > On Thu, Aug 8, 2019 at 4:00 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > Ah, that looks right, thank you.  The patch worked correctly -- good
> > > work Oliver!
> >
> > Great! Just a reminder to submit the fix :)
>
> I did last week:
> https://patchwork.kernel.org/patch/11084261/

Ah, perfect, thank you! Apparently I've missed it.
